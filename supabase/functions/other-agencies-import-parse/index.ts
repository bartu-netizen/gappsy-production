import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminOrInternal, CORS_HEADERS, getInternalFunctionHeaders } from "../_shared/adminSession.ts";

// LIGHTWEIGHT parse function.
// Only reads the first 8KB of the file to detect CSV metadata (delimiter, header line).
// Creates a parse cursor row in the DB.
// Fires the first parse-slice invocation via waitUntil.
// Does NOT load the full file. Does NOT parse data rows. Does NOT create chunks.

function isSepDirective(line: string): { isSep: boolean; delimiter?: string } {
  const match = line.trim().toLowerCase().match(/^sep\s*=\s*(.+)$/);
  if (match) {
    let delim = match[1].trim();
    if (delim === "\\t" || delim === "tab") delim = "\t";
    return { isSep: true, delimiter: delim };
  }
  return { isSep: false };
}

function detectDelimiter(line: string): string {
  const commas = (line.match(/,/g) || []).length;
  const semicolons = (line.match(/;/g) || []).length;
  const tabs = (line.match(/\t/g) || []).length;
  if (tabs > commas && tabs > semicolons && tabs >= 2) return "\t";
  if (semicolons > commas && semicolons >= 2) return ";";
  return ",";
}

function parseCSVLine(line: string, delimiter: string): string[] {
  const values: string[] = [];
  let current = "";
  let inQuotes = false;
  for (let i = 0; i < line.length; i++) {
    const char = line[i];
    if (char === '"') {
      if (inQuotes && line[i + 1] === '"') { current += '"'; i++; }
      else inQuotes = !inQuotes;
    } else if (char === delimiter && !inQuotes) {
      values.push(current.trim());
      current = "";
    } else {
      current += char;
    }
  }
  values.push(current.trim());
  return values;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  let jobId: string | null = null;
  let supabase: ReturnType<typeof createClient> | null = null;

  try {
    const authResult = await requireAdminOrInternal(req);
    if (authResult instanceof Response) return authResult;

    const body = await req.json();
    jobId = body.job_id;

    if (!jobId) {
      return new Response(
        JSON.stringify({ ok: false, error: "Missing job_id" }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const { data: job, error: jobErr } = await supabase
      .from("other_agencies_import_jobs")
      .select("id, status, storage_path, source_file_type, state_slug, file_size_bytes")
      .eq("id", jobId)
      .single();

    if (jobErr || !job) {
      return new Response(
        JSON.stringify({ ok: false, error: `Job not found: ${jobErr?.message}` }),
        { status: 404, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    await supabase.from("other_agencies_import_jobs")
      .update({ status: "parsing", last_checkpoint: "parse_started", updated_at: new Date().toISOString() })
      .eq("id", jobId);

    const fileType = job.source_file_type || "csv";
    const storagePath = job.storage_path;

    // For XLSX/JSON: fall back to full parse (these are typically smaller)
    // For CSV: lightweight metadata-only approach
    if (fileType !== "csv") {
      // Trigger full-file worker for non-CSV (they tend to be smaller or handled differently)
      await supabase.from("other_agencies_import_jobs")
        .update({ last_checkpoint: "delegating_to_slice", updated_at: new Date().toISOString() })
        .eq("id", jobId);

      const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
      const internalHeaders = getInternalFunctionHeaders();

      EdgeRuntime.waitUntil(
        fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-parse-slice`, {
          method: "POST",
          headers: internalHeaders,
          body: JSON.stringify({ job_id: jobId, full_file_mode: true }),
        }).then(async (r) => {
          if (!r.ok) {
            const t = await r.text().catch(() => r.statusText);
            await supabase!.from("other_agencies_import_jobs")
              .update({ status: "failed", error_message: `Slice trigger failed: ${r.status} - ${t}`, last_checkpoint: "slice_trigger_failed", updated_at: new Date().toISOString() })
              .eq("id", jobId!);
          }
        }).catch(async (err) => {
          await supabase!.from("other_agencies_import_jobs")
            .update({ status: "failed", error_message: `Slice trigger error: ${String(err)}`, last_checkpoint: "slice_trigger_exception", updated_at: new Date().toISOString() })
            .eq("id", jobId!);
        })
      );

      return new Response(
        JSON.stringify({ ok: true, job_id: jobId, message: "Non-CSV: delegated to parse-slice" }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // === CSV PATH: read only first 8KB to detect metadata ===
    await supabase.from("other_agencies_import_jobs")
      .update({ last_checkpoint: "reading_csv_header", updated_at: new Date().toISOString() })
      .eq("id", jobId);

    // Download only the first 8192 bytes to find the header
    const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
    const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const storageUrl = `${SUPABASE_URL}/storage/v1/object/import-staging/${storagePath}`;

    const headerResp = await fetch(storageUrl, {
      headers: {
        "Authorization": `Bearer ${SERVICE_ROLE_KEY}`,
        "Range": "bytes=0-8191",
      },
    });

    if (!headerResp.ok && headerResp.status !== 206) {
      throw new Error(`Failed to fetch CSV header bytes: ${headerResp.status} ${headerResp.statusText}`);
    }

    const headerBytes = new Uint8Array(await headerResp.arrayBuffer());
    let headerText = new TextDecoder("utf-8").decode(headerBytes);
    if (headerText.charCodeAt(0) === 0xfeff) headerText = headerText.slice(1);

    // Find the header line
    const rawLines = headerText.split(/\r?\n/);
    let delimiter = ",";
    let headerLineIndex = -1;
    let headerLine = "";
    let sepDirectiveFound = false;

    for (let i = 0; i < Math.min(rawLines.length, 15); i++) {
      const line = rawLines[i].trim();
      if (!line) continue;
      const sepCheck = isSepDirective(line);
      if (sepCheck.isSep && sepCheck.delimiter) {
        delimiter = sepCheck.delimiter;
        sepDirectiveFound = true;
        continue;
      }
      const cols = parseCSVLine(line, sepDirectiveFound ? delimiter : ",");
      if (cols.length >= 2) {
        headerLineIndex = i;
        headerLine = rawLines[i];
        if (!sepDirectiveFound) delimiter = detectDelimiter(line);
        break;
      }
    }

    if (headerLineIndex === -1) {
      throw new Error(`Could not detect CSV header in first 8KB. File may be empty or malformed.`);
    }

    // Calculate byte offset where data rows start (after header line).
    // Reconstruct raw bytes from original text to get accurate byte offset
    // accounting for \r\n vs \n line endings.
    const encoder = new TextEncoder();
    let headerSectionBytes = 0;
    const useCRLF = headerText.includes("\r\n");
    for (let i = 0; i <= headerLineIndex; i++) {
      headerSectionBytes += encoder.encode(rawLines[i]).length + (useCRLF ? 2 : 1);
    }

    const fileSizeBytes = job.file_size_bytes || 0;

    await supabase.from("other_agencies_import_jobs")
      .update({
        detected_delimiter: delimiter === "\t" ? "TAB" : delimiter,
        detected_header_row: headerLineIndex,
        last_checkpoint: "csv_metadata_detected",
        updated_at: new Date().toISOString(),
      })
      .eq("id", jobId);

    await supabase.from("other_agencies_import_events").insert({
      job_id: jobId,
      event_type: "csv_metadata_detected",
      event_data: {
        delimiter: delimiter === "\t" ? "TAB" : delimiter,
        header_row_index: headerLineIndex,
        header_line: headerLine.substring(0, 200),
        sep_directive_found: sepDirectiveFound,
        header_section_bytes: headerSectionBytes,
        file_size_bytes: fileSizeBytes,
      },
    }).catch(() => {});

    // Create parse cursor
    const { data: cursor, error: cursorErr } = await supabase
      .from("other_agencies_import_parse_cursors")
      .insert({
        job_id: jobId,
        byte_offset: headerSectionBytes,
        file_size_bytes: fileSizeBytes,
        delimiter: delimiter,
        header_line: headerLine,
        header_row_index: headerLineIndex,
        chunk_index: 0,
        rows_parsed: 0,
        status: "pending",
        slice_size_bytes: 524288, // 512KB per slice
      })
      .select("id")
      .single();

    if (cursorErr || !cursor) {
      throw new Error(`Failed to create parse cursor: ${cursorErr?.message}`);
    }

    await supabase.from("other_agencies_import_jobs")
      .update({ last_checkpoint: "parse_cursor_created", updated_at: new Date().toISOString() })
      .eq("id", jobId);

    // Fire first parse-slice in background
    const internalHeaders = getInternalFunctionHeaders();

    EdgeRuntime.waitUntil(
      fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-parse-slice`, {
        method: "POST",
        headers: internalHeaders,
        body: JSON.stringify({ job_id: jobId, cursor_id: cursor.id }),
      }).then(async (r) => {
        if (!r.ok) {
          const t = await r.text().catch(() => r.statusText);
          await supabase!.from("other_agencies_import_jobs")
            .update({
              status: "failed",
              error_message: `First parse-slice failed: ${r.status} - ${t}`,
              last_checkpoint: "first_slice_failed",
              updated_at: new Date().toISOString(),
            })
            .eq("id", jobId!);
          await supabase!.from("other_agencies_import_parse_cursors")
            .update({ status: "failed", error_message: `HTTP ${r.status}: ${t}`, updated_at: new Date().toISOString() })
            .eq("id", cursor.id);
        }
      }).catch(async (err) => {
        await supabase!.from("other_agencies_import_jobs")
          .update({
            status: "failed",
            error_message: `First parse-slice exception: ${String(err)}`,
            last_checkpoint: "first_slice_exception",
            updated_at: new Date().toISOString(),
          })
          .eq("id", jobId!);
      })
    );

    return new Response(
      JSON.stringify({
        ok: true,
        job_id: jobId,
        cursor_id: cursor.id,
        delimiter: delimiter === "\t" ? "TAB" : delimiter,
        header_row_index: headerLineIndex,
        file_size_bytes: fileSizeBytes,
        message: "CSV metadata detected. Incremental parse started.",
      }),
      { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("[parse] Error:", err);
    if (supabase && jobId) {
      await supabase.from("other_agencies_import_jobs")
        .update({
          status: "failed",
          error_message: String(err),
          last_checkpoint: "parse_error",
          updated_at: new Date().toISOString(),
        })
        .eq("id", jobId).catch(() => {});
    }
    return new Response(
      JSON.stringify({ ok: false, error: String(err), job_id: jobId }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});

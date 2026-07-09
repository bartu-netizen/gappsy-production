import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { parseXlsxToNormalizedRows } from "../_shared/xlsxParser.ts";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-internal-secret",
};

const INTERNAL_SECRET = Deno.env.get("INTERNAL_FUNCTION_SECRET") || "internal-fn-secret-2024";
// Reduced from 200 to 100 to prevent worker timeouts with heavy DB operations per row
const CHUNK_SIZE = 100;

// PRODUCTION SAFETY: XLSX parsing timeout (30 seconds)
// If XLSX.read hangs longer than this, we fail immediately instead of hanging forever
const XLSX_PARSE_TIMEOUT_MS = 30000;

// PRODUCTION SAFETY: Flag to disable XLSX entirely if needed
const XLSX_DISABLED = Deno.env.get("DISABLE_XLSX_IMPORT") === "true";

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

const HEADER_ALIASES: Record<string, string> = {
  name: "name", "agency name": "name", "company": "name", "company name": "name",
  "business name": "name", "organization": "name",
  email: "email", "email address": "email", "e-mail": "email", "emails": "email",
  "contact email": "email", "primary email": "email",
  phone: "phone", "phone number": "phone", "telephone": "phone", "tel": "phone",
  "mobile": "phone", "cell": "phone",
  website: "website", "web": "website", "site": "website",
  "website url": "website", "homepage": "website", "business website": "website",
  "company website": "website", "website_url": "website",
  city: "city", "town": "city", "location": "city",
  state: "state", "state/province": "state", "province": "state",
  zip: "zip", "zip code": "zip", "postal code": "zip", "postal": "zip",
  facebook: "facebook", "fb": "facebook", "facebook url": "facebook",
  instagram: "instagram", "ig": "instagram", "instagram url": "instagram",
  linkedin: "linkedin", "linkedin url": "linkedin",
  address: "address", "street": "address",
  description: "description", "about": "description",
};

function normalizeHeader(h: string): string {
  const lower = h.trim().toLowerCase();
  return HEADER_ALIASES[lower] ?? lower;
}

function parseCSV(text: string): Record<string, string>[] {
  const lines = text.split(/\r?\n/);
  const dataLines: string[] = [];

  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed) continue;
    if (/^sep=/i.test(trimmed)) continue;
    dataLines.push(trimmed);
  }

  if (dataLines.length < 2) return [];

  const firstLine = dataLines[0];
  const delimiter = firstLine.includes(";") && !firstLine.includes(",") ? ";" : ",";

  function splitLine(line: string): string[] {
    const result: string[] = [];
    let current = "";
    let inQuotes = false;
    for (let i = 0; i < line.length; i++) {
      const ch = line[i];
      if (ch === '"') {
        if (inQuotes && line[i + 1] === '"') { current += '"'; i++; }
        else { inQuotes = !inQuotes; }
      } else if (ch === delimiter && !inQuotes) {
        result.push(current.trim());
        current = "";
      } else {
        current += ch;
      }
    }
    result.push(current.trim());
    return result;
  }

  let headerIdx = 0;
  for (let i = 0; i < Math.min(5, dataLines.length); i++) {
    const cells = splitLine(dataLines[i]).map(c => c.toLowerCase());
    if (cells.some(c => c === "name" || c === "agency name" || c === "company name" || c === "company")) {
      headerIdx = i;
      break;
    }
  }

  const rawHeaders = splitLine(dataLines[headerIdx]);
  const headers = rawHeaders.map(normalizeHeader);

  const rows: Record<string, string>[] = [];
  for (let i = headerIdx + 1; i < dataLines.length; i++) {
    const cells = splitLine(dataLines[i]);
    const record: Record<string, string> = {};
    headers.forEach((h, idx) => {
      const val = (cells[idx] ?? "").trim();
      if (!(h in record) || !record[h]) {
        record[h] = val;
      }
    });
    if (record.name) rows.push(record);
  }

  return rows;
}

function parseJSON(text: string): Record<string, string>[] {
  const parsed = JSON.parse(text);
  const arr = Array.isArray(parsed) ? parsed : parsed.agencies ?? parsed.data ?? [];
  return arr
    .filter((r: any) => typeof r === "object" && r !== null)
    .map((r: any) => {
      const record: Record<string, string> = {};
      for (const [k, v] of Object.entries(r)) {
        const h = normalizeHeader(k);
        const val = String(v ?? "").trim();
        if (!(h in record) || !record[h]) {
          record[h] = val;
        }
      }
      return record;
    })
    .filter((r: Record<string, string>) => r.name);
}

async function failJob(supabase: ReturnType<typeof createClient>, jobId: string, message: string) {
  await supabase
    .from("other_agencies_import_jobs_v2")
    .update({ status: "failed", error_message: message, last_checkpoint: `FAILED: ${message}` })
    .eq("id", jobId);
  await logEvent(supabase, jobId, "job_failed", message);
}

async function logEvent(supabase: ReturnType<typeof createClient>, jobId: string, eventType: string, message: string) {
  try {
    await supabase.from("other_agencies_import_events_v2").insert({
      job_id: jobId,
      event_type: eventType,
      message: message.substring(0, 500),
    });
  } catch {
    console.warn(`[v2-parse] Failed to log event ${eventType}`);
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS });

  const internalSecret = req.headers.get("x-internal-secret");
  if (internalSecret !== INTERNAL_SECRET) {
    return json({ error: "FORBIDDEN" }, 403);
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  let currentJobId: string | null = null;

  try {
    const body = await req.json();
    const job_id = body.job_id;
    if (!job_id) return json({ error: "MISSING_JOB_ID" }, 400);
    currentJobId = job_id;

    const { data: job, error: jobErr } = await supabase
      .from("other_agencies_import_jobs_v2")
      .select("*")
      .eq("id", job_id)
      .maybeSingle();

    if (jobErr || !job) return json({ error: "JOB_NOT_FOUND" }, 404);
    if (!["staged", "queued"].includes(job.status)) {
      return json({ ok: true, message: `Job already in status ${job.status}` });
    }

    await supabase
      .from("other_agencies_import_jobs_v2")
      .update({ status: "parsing", parse_started_at: new Date().toISOString(), last_checkpoint: "Downloading file from storage" })
      .eq("id", job_id);

    await logEvent(supabase, job_id, "parse_started", `Parse started — format=${job.file_format}, size=${job.file_size_bytes} bytes, path=${job.storage_path}`);

    const { data: fileData, error: dlErr } = await supabase.storage
      .from("import-staging")
      .download(job.storage_path);

    if (dlErr || !fileData) {
      await failJob(supabase, job_id, `Failed to download file: ${dlErr?.message ?? "no file data returned"}`);
      return json({ error: "DOWNLOAD_FAILED", message: dlErr?.message }, 500);
    }

    const downloadedSize = fileData.size;
    const fileType = fileData.type;
    const fileExtension = job.file_name.split(".").pop()?.toLowerCase() ?? "unknown";
    console.log(`[v2-parse] ✅ File downloaded — size=${downloadedSize} bytes, type=${fileType}, ext=${fileExtension}`);

    // HEARTBEAT 1: File downloaded
    await supabase
      .from("other_agencies_import_jobs_v2")
      .update({
        last_checkpoint: `✅ File downloaded (${downloadedSize} bytes, ${fileType}) — starting parse`,
        updated_at: new Date().toISOString(),
      })
      .eq("id", job_id);

    await logEvent(supabase, job_id, "parse_file_downloaded", `File: ${downloadedSize} bytes, type=${fileType}, ext=${fileExtension}`);

    let rows: Record<string, string>[] = [];
    const format = job.file_format;

    try {
      await logEvent(supabase, job_id, "parse_format_detected", `Format: ${format}`);

      if (format === "csv") {
        const text = await fileData.text();
        console.log(`[v2-parse] 📄 CSV text length: ${text.length} chars`);
        await logEvent(supabase, job_id, "csv_text_loaded", `CSV text: ${text.length} characters`);

        // HEARTBEAT 2: Text loaded
        await supabase
          .from("other_agencies_import_jobs_v2")
          .update({
            last_checkpoint: `CSV text loaded (${text.length} chars) — parsing rows`,
            updated_at: new Date().toISOString(),
          })
          .eq("id", job_id);

        rows = parseCSV(text);

        console.log(`[v2-parse] 📊 CSV parsing complete — ${rows.length} rows extracted`);
        await logEvent(supabase, job_id, "csv_parsed", `Extracted ${rows.length} rows from CSV`);

      } else if (format === "xlsx" || format === "xls") {
        // PRODUCTION SAFETY: Check if XLSX is disabled
        if (XLSX_DISABLED) {
          const disabledMsg = "XLSX imports are temporarily disabled. Please convert to CSV and upload again.";
          console.warn(`[v2-parse] ⚠️ ${disabledMsg}`);
          await failJob(supabase, job_id, disabledMsg);
          return json({ error: "XLSX_DISABLED", message: disabledMsg }, 400);
        }

        const buffer = await fileData.arrayBuffer();
        console.log(`[v2-parse] 📦 XLSX buffer ready — ${buffer.byteLength} bytes`);
        await logEvent(supabase, job_id, "xlsx_buffer_ready", `ArrayBuffer: ${buffer.byteLength} bytes`);

        // HEARTBEAT 2: Buffer ready
        await supabase
          .from("other_agencies_import_jobs_v2")
          .update({
            last_checkpoint: `XLSX buffer ready (${buffer.byteLength} bytes) — calling XLSX.read with ${XLSX_PARSE_TIMEOUT_MS}ms timeout`,
            updated_at: new Date().toISOString(),
          })
          .eq("id", job_id);

        // PRODUCTION SAFETY: Wrap XLSX parsing in a timeout guard
        // This prevents infinite hangs if XLSX.read freezes
        let result: any;
        let timedOut = false;

        const xlsxParsePromise = Promise.resolve().then(() => {
          console.log(`[v2-parse] 🔄 Calling parseXlsxToNormalizedRows with timeout guard`);
          return parseXlsxToNormalizedRows(buffer, HEADER_ALIASES);
        });

        const timeoutPromise = new Promise<never>((_, reject) => {
          setTimeout(() => {
            timedOut = true;
            reject(new Error(`XLSX parsing timed out after ${XLSX_PARSE_TIMEOUT_MS}ms`));
          }, XLSX_PARSE_TIMEOUT_MS);
        });

        try {
          result = await Promise.race([xlsxParsePromise, timeoutPromise]);
        } catch (timeoutErr) {
          if (timedOut) {
            const timeoutMsg = `⚠️ XLSX PARSING TIMEOUT: XLSX.read hung for more than ${XLSX_PARSE_TIMEOUT_MS / 1000}s. This file may be corrupted or too complex for the runtime. Please try:
1. Converting to CSV before upload
2. Simplifying the spreadsheet (remove formulas, formatting, extra sheets)
3. Splitting into smaller files`;

            console.error(`[v2-parse] ${timeoutMsg}`);
            await logEvent(supabase, job_id, "xlsx_parse_timeout", `XLSX.read timed out after ${XLSX_PARSE_TIMEOUT_MS}ms`);
            await failJob(supabase, job_id, timeoutMsg);
            return json({ error: "XLSX_TIMEOUT", message: "XLSX parsing timed out" }, 500);
          }
          throw timeoutErr;
        }

        console.log(`[v2-parse] ✅ XLSX parsing completed within timeout`);
        await logEvent(supabase, job_id, "xlsx_parse_success", `XLSX parsing completed successfully`);

        // Log XLSX metadata if available
        if (result.meta) {
          const meta = result.meta;
          console.log(`[v2-parse] 📋 Sheet: "${meta.sheetName}" — ${meta.rawRowCount} raw rows, header at row ${meta.headerRowIndex}`);
          console.log(`[v2-parse] 🔤 Headers: [${meta.detectedHeaders.slice(0, 15).join(", ")}${meta.detectedHeaders.length > 15 ? "..." : ""}]`);
          console.log(`[v2-parse] ✔️ Name column: ${meta.hasNameColumn ? "FOUND" : "MISSING"}`);

          await logEvent(supabase, job_id, "xlsx_sheet_info", `Sheet="${meta.sheetName}", rows=${meta.rawRowCount}, headerRow=${meta.headerRowIndex}`);
          await logEvent(supabase, job_id, "xlsx_headers_detected", `Headers: [${meta.detectedHeaders.slice(0, 12).join(", ")}${meta.detectedHeaders.length > 12 ? "..." : ""}] — nameCol=${meta.hasNameColumn}`);

          // HEARTBEAT 3: Sheet parsed
          await supabase
            .from("other_agencies_import_jobs_v2")
            .update({
              last_checkpoint: `XLSX sheet loaded: "${meta.sheetName}" — ${meta.rawRowCount} raw rows, header row ${meta.headerRowIndex}`,
              updated_at: new Date().toISOString(),
            })
            .eq("id", job_id);
        }

        if (!result.ok) {
          const errMsg = result.error ?? "Unknown XLSX parse error";
          console.error(`[v2-parse] ❌ XLSX parse FAILED:`, errMsg);
          await failJob(supabase, job_id, `XLSX parse failed: ${errMsg}`);
          return json({ error: "PARSE_FAILED", message: errMsg }, 500);
        }

        rows = result.rows;
        console.log(`[v2-parse] 📊 XLSX normalization complete — ${rows.length} valid rows extracted`);

        // Log sample rows for debugging
        if (rows.length > 0) {
          const sample = rows.slice(0, 3).map(r => ({ name: r.name, email: r.email, city: r.city, state: r.state }));
          console.log(`[v2-parse] 🔍 Sample rows (first 3):`, JSON.stringify(sample, null, 2));
          await logEvent(supabase, job_id, "xlsx_sample_rows", `Sample: ${JSON.stringify(sample).substring(0, 400)}`);
        }

        await logEvent(supabase, job_id, "xlsx_rows_extracted", `${rows.length} valid rows extracted from ${result.meta?.rawRowCount ?? "?"} raw rows`);

      } else if (format === "json") {
        const text = await fileData.text();
        console.log(`[v2-parse] 📄 JSON text length: ${text.length} chars`);
        await logEvent(supabase, job_id, "json_text_loaded", `JSON text: ${text.length} characters`);

        // HEARTBEAT 2: Text loaded
        await supabase
          .from("other_agencies_import_jobs_v2")
          .update({
            last_checkpoint: `JSON text loaded (${text.length} chars) — parsing`,
            updated_at: new Date().toISOString(),
          })
          .eq("id", job_id);

        rows = parseJSON(text);
        console.log(`[v2-parse] 📊 JSON parsing complete — ${rows.length} rows extracted`);
        await logEvent(supabase, job_id, "json_parsed", `Extracted ${rows.length} rows from JSON`);
      } else {
        const text = await fileData.text();
        console.log(`[v2-parse] 📄 Unknown format, trying CSV — text length: ${text.length} chars`);
        rows = parseCSV(text);
        console.log(`[v2-parse] 📊 CSV fallback complete — ${rows.length} rows extracted`);
        await logEvent(supabase, job_id, "csv_fallback_parsed", `Extracted ${rows.length} rows using CSV fallback`);
      }
    } catch (parseErr) {
      const msg = parseErr instanceof Error ? parseErr.message : String(parseErr);
      console.error(`[v2-parse] ❌ Parse error (${format}):`, msg);
      await failJob(supabase, job_id, `Parse failed (${format}): ${msg}`);
      return json({ error: "PARSE_FAILED", message: msg }, 500);
    }

    // HEARTBEAT 4: Normalization complete
    await supabase
      .from("other_agencies_import_jobs_v2")
      .update({
        last_checkpoint: `Normalization complete — ${rows.length} valid rows extracted`,
        updated_at: new Date().toISOString(),
      })
      .eq("id", job_id);

    await logEvent(supabase, job_id, "normalization_complete", `${rows.length} valid rows after normalization (format=${format})`);

    // CRITICAL: Hard fail if 0 rows after normalization
    if (rows.length === 0) {
      const failureMsg = `❌ NORMALIZATION FAILED: Parsed 0 valid rows. This usually means:
1. No "Name" column found in headers
2. All rows have empty "Name" field
3. Header mapping mismatch
Check the xlsx_headers_detected event to see detected headers.`;

      console.error(`[v2-parse] ${failureMsg}`);
      await failJob(supabase, job_id, failureMsg);
      return json({ error: "NO_ROWS", message: "No valid rows found after normalization" }, 400);
    }

    // Log final validation success with sample
    const sampleForLog = rows.slice(0, 2).map(r => ({ name: r.name?.substring(0, 30), email: r.email }));
    console.log(`[v2-parse] ✅ VALIDATION SUCCESS — ${rows.length} rows ready. Sample:`, JSON.stringify(sampleForLog));
    await logEvent(supabase, job_id, "validation_success", `${rows.length} rows validated — sample: ${JSON.stringify(sampleForLog).substring(0, 300)}`);

    await supabase
      .from("other_agencies_import_jobs_v2")
      .update({
        status: "chunking",
        rows_read: rows.length,
        rows_valid: rows.length,
        last_checkpoint: `Parsed ${rows.length} rows — creating chunks`,
      })
      .eq("id", job_id);

    await logEvent(supabase, job_id, "parse_completed", `Parsed ${rows.length} rows`);

    const chunks: { chunk_index: number; row_start: number; row_end: number; rows: Record<string, string>[] }[] = [];
    for (let i = 0; i < rows.length; i += CHUNK_SIZE) {
      const chunk = rows.slice(i, i + CHUNK_SIZE);
      chunks.push({
        chunk_index: chunks.length,
        row_start: i,
        row_end: i + chunk.length - 1,
        rows: chunk,
      });
    }

    await logEvent(supabase, job_id, "chunk_creation_start", `Creating ${chunks.length} chunks from ${rows.length} rows`);

    let chunksCreated = 0;
    const chunkErrors: string[] = [];

    for (const chunk of chunks) {
      const chunkPath = `v2-chunks/${job_id}/chunk_${chunk.chunk_index}.json`;
      const chunkJson = JSON.stringify({ rows: chunk.rows });

      const { error: chunkUploadErr } = await supabase.storage
        .from("import-staging")
        .upload(chunkPath, new TextEncoder().encode(chunkJson), {
          contentType: "application/json",
          upsert: true,
        });

      if (chunkUploadErr) {
        const errMsg = `Chunk ${chunk.chunk_index} upload failed: ${chunkUploadErr.message}`;
        console.warn(`[v2-parse] ${errMsg}`);
        chunkErrors.push(errMsg);
        continue;
      }

      const { error: chunkInsertErr } = await supabase.from("other_agencies_import_job_chunks_v2").insert({
        job_id: job_id,
        chunk_index: chunk.chunk_index,
        row_start: chunk.row_start,
        row_end: chunk.row_end,
        row_count: chunk.rows.length,
        status: "queued",
      });

      if (chunkInsertErr) {
        const errMsg = `Chunk ${chunk.chunk_index} DB insert failed: ${chunkInsertErr.message}`;
        console.warn(`[v2-parse] ${errMsg}`);
        chunkErrors.push(errMsg);
        continue;
      }

      chunksCreated++;

      if (chunksCreated % 5 === 0) {
        await supabase
          .from("other_agencies_import_jobs_v2")
          .update({ chunks_total: chunksCreated, last_checkpoint: `Created ${chunksCreated}/${chunks.length} chunks` })
          .eq("id", job_id);
      }
    }

    if (chunksCreated === 0) {
      const detail = chunkErrors.length > 0 ? chunkErrors.slice(0, 3).join("; ") : "unknown reason";
      await failJob(supabase, job_id, `All ${chunks.length} chunk(s) failed to create: ${detail}`);
      return json({ error: "CHUNK_CREATION_FAILED", message: detail }, 500);
    }

    await logEvent(supabase, job_id, "chunk_creation_complete", `Created ${chunksCreated} chunks${chunkErrors.length > 0 ? ` (${chunkErrors.length} errors)` : ""}`);

    await supabase
      .from("other_agencies_import_jobs_v2")
      .update({
        status: "processing",
        chunks_total: chunksCreated,
        parse_completed_at: new Date().toISOString(),
        work_started_at: new Date().toISOString(),
        last_checkpoint: `All ${chunksCreated} chunks queued — processing started`,
      })
      .eq("id", job_id);

    const dispatchUrl = `${supabaseUrl}/functions/v1/other-agencies-import-v2-dispatch`;
    const dispatchHeaders = {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${serviceKey}`,
      "x-internal-secret": INTERNAL_SECRET,
    };

    let dispatchResult: Record<string, unknown> = { action: "not_called" };
    try {
      const dispatchRes = await fetch(dispatchUrl, {
        method: "POST",
        headers: dispatchHeaders,
        body: JSON.stringify({ job_id }),
      });
      dispatchResult = await dispatchRes.json();
      console.log(`[v2-parse] Dispatch result:`, JSON.stringify(dispatchResult));
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      console.error(`[v2-parse] Dispatch call failed:`, msg);
      dispatchResult = { action: "dispatch_failed", error: msg };
    }

    return json({
      ok: true,
      job_id,
      rows_read: rows.length,
      chunks_created: chunksCreated,
      chunk_errors: chunkErrors.length,
      dispatch: dispatchResult,
      message: `Parsed ${rows.length} rows into ${chunksCreated} chunks. Dispatch: ${dispatchResult.action}.`,
    });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[v2-parse] Unexpected error:", msg);
    if (currentJobId) {
      try {
        await failJob(supabase, currentJobId, `Unexpected parse error: ${msg.substring(0, 300)}`);
      } catch (failErr) {
        console.error("[v2-parse] Failed to mark job as failed:", failErr);
      }
    }
    return json({ error: "INTERNAL_ERROR", message: msg }, 500);
  }
});

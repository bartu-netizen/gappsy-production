import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminOrInternal, CORS_HEADERS, getInternalFunctionHeaders } from "../_shared/adminSession.ts";

// INCREMENTAL parse-slice function.
// Downloads a fixed-size byte range from the staged file.
// Parses only that slice, normalizes rows, flushes chunks to DB.
// Advances the parse cursor.
// Triggers the next slice via waitUntil until file is exhausted.
// Never loads the full file into memory.

const CHUNK_SIZE = 250;

const NAME_ALIASES = [
  "name", "agency_name", "company_name", "company", "business_name",
  "business", "agency", "agency_title", "listing_name", "title",
];

const FIELD_MAPPINGS: Record<string, string[]> = {
  name: NAME_ALIASES,
  website_url: ["website", "website_url", "url", "domain", "company_website", "site", "web"],
  phone: ["phone", "phone_number", "phone_numbers", "phones", "telephone", "tel", "mobile", "business_phone", "contact_number"],
  email: ["email", "emails", "email_address", "company_email", "contact_email"],
  city: ["city", "town", "location_city"],
  description: ["description", "intro", "about", "bio", "summary"],
  services: ["services", "service", "offerings", "service_list"],
  primary_service: ["primary_service", "main_service", "core_service"],
  logo_url: ["logo_url", "logo", "image_url"],
  state_slug: ["state_slug", "state", "state_code"],
  zip_code: ["zip_code", "zip", "postal_code", "postcode"],
  full_address: ["full_address", "address", "complete_address"],
  street_address: ["street_address", "street"],
  keyword: ["keyword", "keywords", "search_keyword"],
  facebook_url: ["facebook", "facebook_url", "fb", "fb_url"],
  twitter_url: ["twitter", "twitter_url", "x", "x_url"],
  instagram_url: ["instagram", "instagram_url", "ig", "ig_url"],
  youtube_url: ["youtube", "youtube_url", "yt", "yt_url"],
  linkedin_url: ["linkedin", "linkedin_url", "li", "li_url"],
  tiktok_url: ["tiktok", "tiktok_url", "tt", "tt_url"],
  pinterest_url: ["pinterest", "pinterest_url", "pin", "pin_url"],
  plus_code: ["plus_code", "pluscode", "google_plus_code"],
  maps_url: ["maps_url", "google_maps_url", "maps", "google_maps"],
  latitude: ["latitude", "lat"],
  longitude: ["longitude", "lng", "lon"],
};

function normalizeKey(key: string): string {
  return key.toLowerCase().trim()
    .replace(/[\ufeff\u200b]/g, "")
    .replace(/^["']|["']$/g, "")
    .replace(/\s+/g, "_");
}

function findValue(row: Record<string, unknown>, aliases: string[]): string | undefined {
  for (const alias of aliases) {
    for (const key of Object.keys(row)) {
      if (normalizeKey(key) === alias) {
        const val = row[key];
        if (val !== null && val !== undefined) {
          const strVal = String(val).trim().replace(/^["']|["']$/g, "");
          if (strVal.length > 0) return strVal;
        }
      }
    }
  }
  return undefined;
}

function normalizeRow(rawRow: Record<string, unknown>, fallbackStateSlug: string): Record<string, string> | null {
  const name = findValue(rawRow, FIELD_MAPPINGS.name);
  if (!name) return null;
  const result: Record<string, string> = { name };
  for (const [field, aliases] of Object.entries(FIELD_MAPPINGS)) {
    if (field === "name") continue;
    const val = findValue(rawRow, aliases);
    if (val) result[field] = val;
  }
  if (!result.state_slug) result.state_slug = fallbackStateSlug;
  return result;
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

function parseHeaderLine(headerLine: string, delimiter: string): string[] {
  return parseCSVLine(headerLine, delimiter).map(h =>
    h.toLowerCase().replace(/^["']|["']$/g, "").replace(/[\ufeff\u200b]/g, "").trim()
  );
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  let jobId: string | null = null;
  let cursorId: string | null = null;
  let supabase: ReturnType<typeof createClient> | null = null;

  try {
    const authResult = await requireAdminOrInternal(req);
    if (authResult instanceof Response) return authResult;

    const body = await req.json();
    jobId = body.job_id;
    cursorId = body.cursor_id;
    const fullFileMode = body.full_file_mode === true;

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

    const { data: job } = await supabase
      .from("other_agencies_import_jobs")
      .select("id, status, storage_path, source_file_type, state_slug, file_size_bytes")
      .eq("id", jobId)
      .maybeSingle();

    if (!job) {
      return new Response(
        JSON.stringify({ ok: false, error: "Job not found" }),
        { status: 404, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (job.status === "failed" || job.status === "completed") {
      return new Response(
        JSON.stringify({ ok: true, job_id: jobId, skipped: true, reason: `Job is ${job.status}` }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // === FULL FILE MODE for XLSX/JSON (smaller files) ===
    if (fullFileMode || job.source_file_type !== "csv") {
      return await handleFullFileMode(supabase, job, jobId);
    }

    // === CSV SLICE MODE ===
    if (!cursorId) {
      return new Response(
        JSON.stringify({ ok: false, error: "Missing cursor_id for CSV slice mode" }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const { data: cursor } = await supabase
      .from("other_agencies_import_parse_cursors")
      .select("*")
      .eq("id", cursorId)
      .maybeSingle();

    if (!cursor) {
      return new Response(
        JSON.stringify({ ok: false, error: "Cursor not found" }),
        { status: 404, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (cursor.status === "completed" || cursor.status === "failed") {
      return new Response(
        JSON.stringify({ ok: true, job_id: jobId, skipped: true, reason: `Cursor is ${cursor.status}` }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // Mark cursor as running
    await supabase.from("other_agencies_import_parse_cursors")
      .update({ status: "running", updated_at: new Date().toISOString() })
      .eq("id", cursorId);

    const byteOffset = cursor.byte_offset;
    const fileSizeBytes = cursor.file_size_bytes || job.file_size_bytes || 0;
    const sliceSize = cursor.slice_size_bytes || 524288;
    const delimiter = cursor.delimiter || ",";
    const headerLine = cursor.header_line || "";
    const headers = parseHeaderLine(headerLine, delimiter);
    const stateSlug = job.state_slug;

    const isLastSlice = fileSizeBytes > 0 && (byteOffset + sliceSize) >= fileSizeBytes;
    const rangeEnd = isLastSlice ? "" : String(byteOffset + sliceSize + 512); // +512 for partial-line overflow

    const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
    const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const storageUrl = `${SUPABASE_URL}/storage/v1/object/import-staging/${job.storage_path}`;

    const rangeHeader = rangeEnd
      ? `bytes=${byteOffset}-${Number(byteOffset) + sliceSize + 511}`
      : `bytes=${byteOffset}-`;

    const sliceResp = await fetch(storageUrl, {
      headers: {
        "Authorization": `Bearer ${SERVICE_ROLE_KEY}`,
        "Range": rangeHeader,
      },
    });

    if (!sliceResp.ok && sliceResp.status !== 206) {
      // 416 = Range Not Satisfiable means we're past EOF
      if (sliceResp.status === 416) {
        await finalizeParsing(supabase, jobId, cursorId, cursor.chunk_index, cursor.rows_parsed);
        return new Response(
          JSON.stringify({ ok: true, job_id: jobId, done: true, reason: "EOF reached" }),
          { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }
      throw new Error(`Byte range fetch failed: ${sliceResp.status} ${sliceResp.statusText}`);
    }

    const sliceBytes = new Uint8Array(await sliceResp.arrayBuffer());

    // If we got an empty slice, we're done
    if (sliceBytes.length === 0) {
      await finalizeParsing(supabase, jobId, cursorId, cursor.chunk_index, cursor.rows_parsed);
      return new Response(
        JSON.stringify({ ok: true, job_id: jobId, done: true, reason: "Empty slice = EOF" }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    let sliceText = new TextDecoder("utf-8", { fatal: false }).decode(sliceBytes);

    // If not the first slice, we may have started mid-line.
    // Find the first newline and discard everything before it
    // (the previous slice will have consumed up to that newline).
    // Exception: byteOffset points to start of a line already (guaranteed by how we set it).
    // We DO need to handle the trailing partial line: discard last incomplete line,
    // record how many bytes we actually consumed.

    let bytesConsumed = sliceBytes.length;

    if (!isLastSlice) {
      // Find last complete newline in this slice text
      const lastNewline = sliceText.lastIndexOf("\n");
      if (lastNewline === -1) {
        // No newline found at all - entire slice is one huge line, skip it
        // Advance by full slice size to avoid infinite loop
        await supabase.from("other_agencies_import_parse_cursors")
          .update({
            byte_offset: byteOffset + sliceSize,
            status: "pending",
            updated_at: new Date().toISOString(),
          })
          .eq("id", cursorId);
        triggerNextSlice(supabase, jobId, cursorId, SUPABASE_URL);
        return new Response(
          JSON.stringify({ ok: true, job_id: jobId, rows_this_slice: 0, advanced: sliceSize }),
          { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }
      // Trim to last complete line
      sliceText = sliceText.substring(0, lastNewline + 1);
      // Calculate actual bytes consumed (UTF-8 encoded length of trimmed text)
      bytesConsumed = new TextEncoder().encode(sliceText).length;
    }

    // Parse lines in this slice
    const lines = sliceText.split(/\r?\n/);
    let chunkIndex = cursor.chunk_index;
    let rowsParsed = cursor.rows_parsed;
    let currentChunk: Record<string, string>[] = [];
    let rowsThisSlice = 0;
    let chunksCreatedThisSlice = 0;

    for (const rawLine of lines) {
      const line = rawLine.trim();
      if (!line) continue;

      const values = parseCSVLine(line, delimiter);
      const row: Record<string, unknown> = {};
      headers.forEach((h, idx) => {
        row[h] = (values[idx] || "").replace(/^["']|["']$/g, "").trim();
      });

      const normalized = normalizeRow(row, stateSlug);
      if (!normalized) continue;

      currentChunk.push(normalized);
      rowsThisSlice++;
      rowsParsed++;

      if (currentChunk.length >= CHUNK_SIZE) {
        await supabase.from("other_agencies_import_job_chunks").insert({
          job_id: jobId,
          chunk_index: chunkIndex,
          rows_in_chunk: currentChunk.length,
          payload_json: currentChunk,
          status: "pending",
          retry_count: 0,
        });
        await supabase.from("other_agencies_import_queue").insert({
          job_id: jobId,
          chunk_index: chunkIndex,
          priority: 0,
          status: "pending",
        });
        chunkIndex++;
        chunksCreatedThisSlice++;
        currentChunk = [];

        // Update job progress after every chunk so UI sees real progress
        await supabase.from("other_agencies_import_jobs")
          .update({
            source_rows_total: rowsParsed,
            chunks_total: chunkIndex,
            last_checkpoint: `parsing_chunk_${chunkIndex}`,
            updated_at: new Date().toISOString(),
          })
          .eq("id", jobId);
      }
    }

    // Flush any remaining partial chunk
    if (currentChunk.length > 0 && isLastSlice) {
      await supabase.from("other_agencies_import_job_chunks").insert({
        job_id: jobId,
        chunk_index: chunkIndex,
        rows_in_chunk: currentChunk.length,
        payload_json: currentChunk,
        status: "pending",
        retry_count: 0,
      });
      await supabase.from("other_agencies_import_queue").insert({
        job_id: jobId,
        chunk_index: chunkIndex,
        priority: 0,
        status: "pending",
      });
      chunkIndex++;
      chunksCreatedThisSlice++;
      currentChunk = [];
    }

    const nextOffset = byteOffset + bytesConsumed;
    const done = isLastSlice || (fileSizeBytes > 0 && nextOffset >= fileSizeBytes);

    if (done) {
      // Flush any leftover partial chunk even if not last slice exactly
      if (currentChunk.length > 0) {
        await supabase.from("other_agencies_import_job_chunks").insert({
          job_id: jobId,
          chunk_index: chunkIndex,
          rows_in_chunk: currentChunk.length,
          payload_json: currentChunk,
          status: "pending",
          retry_count: 0,
        });
        await supabase.from("other_agencies_import_queue").insert({
          job_id: jobId,
          chunk_index: chunkIndex,
          priority: 0,
          status: "pending",
        });
        chunkIndex++;
        chunksCreatedThisSlice++;
      }
      await finalizeParsing(supabase, jobId, cursorId, chunkIndex, rowsParsed);
    } else {
      // Advance cursor, trigger next slice
      await supabase.from("other_agencies_import_parse_cursors")
        .update({
          byte_offset: nextOffset,
          chunk_index: chunkIndex,
          rows_parsed: rowsParsed,
          status: "pending",
          updated_at: new Date().toISOString(),
        })
        .eq("id", cursorId);

      await supabase.from("other_agencies_import_jobs")
        .update({
          source_rows_total: rowsParsed,
          chunks_total: chunkIndex,
          last_checkpoint: `parsed_to_byte_${nextOffset}`,
          updated_at: new Date().toISOString(),
        })
        .eq("id", jobId);

      const internalHeaders = getInternalFunctionHeaders();
      EdgeRuntime.waitUntil(
        fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-parse-slice`, {
          method: "POST",
          headers: internalHeaders,
          body: JSON.stringify({ job_id: jobId, cursor_id: cursorId }),
        }).then(async (r) => {
          if (!r.ok) {
            const t = await r.text().catch(() => r.statusText);
            await supabase!.from("other_agencies_import_jobs")
              .update({
                status: "failed",
                error_message: `Parse-slice failed at offset ${nextOffset}: ${r.status} - ${t}`,
                last_checkpoint: `slice_failed_at_${nextOffset}`,
                updated_at: new Date().toISOString(),
              })
              .eq("id", jobId!);
            await supabase!.from("other_agencies_import_parse_cursors")
              .update({ status: "failed", error_message: `HTTP ${r.status}: ${t}`, updated_at: new Date().toISOString() })
              .eq("id", cursorId!);
          }
        }).catch(async (err) => {
          await supabase!.from("other_agencies_import_jobs")
            .update({
              status: "failed",
              error_message: `Parse-slice exception at offset ${nextOffset}: ${String(err)}`,
              last_checkpoint: `slice_exception_at_${nextOffset}`,
              updated_at: new Date().toISOString(),
            })
            .eq("id", jobId!);
        })
      );
    }

    return new Response(
      JSON.stringify({
        ok: true,
        job_id: jobId,
        rows_this_slice: rowsThisSlice,
        chunks_created_this_slice: chunksCreatedThisSlice,
        total_rows_parsed: rowsParsed,
        total_chunks: chunkIndex,
        byte_offset: nextOffset,
        done,
      }),
      { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("[parse-slice] Error:", err);
    if (supabase && jobId) {
      await supabase.from("other_agencies_import_jobs")
        .update({
          status: "failed",
          error_message: String(err),
          last_checkpoint: "parse_slice_error",
          updated_at: new Date().toISOString(),
        })
        .eq("id", jobId).catch(() => {});
      if (cursorId) {
        await supabase.from("other_agencies_import_parse_cursors")
          .update({ status: "failed", error_message: String(err), updated_at: new Date().toISOString() })
          .eq("id", cursorId).catch(() => {});
      }
    }
    return new Response(
      JSON.stringify({ ok: false, error: String(err), job_id: jobId }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});

function triggerNextSlice(
  supabase: ReturnType<typeof createClient>,
  jobId: string,
  cursorId: string,
  supabaseUrl: string
) {
  const internalHeaders = getInternalFunctionHeaders();
  EdgeRuntime.waitUntil(
    fetch(`${supabaseUrl}/functions/v1/other-agencies-import-parse-slice`, {
      method: "POST",
      headers: internalHeaders,
      body: JSON.stringify({ job_id: jobId, cursor_id: cursorId }),
    }).catch(() => {})
  );
}

async function finalizeParsing(
  supabase: ReturnType<typeof createClient>,
  jobId: string,
  cursorId: string,
  chunksTotal: number,
  rowsTotal: number
) {
  await supabase.from("other_agencies_import_parse_cursors")
    .update({ status: "completed", updated_at: new Date().toISOString() })
    .eq("id", cursorId);

  await supabase.from("other_agencies_import_jobs")
    .update({
      status: "queued",
      source_rows_total: rowsTotal,
      chunks_total: chunksTotal,
      last_checkpoint: "chunks_created",
      updated_at: new Date().toISOString(),
    })
    .eq("id", jobId);

  await supabase.from("other_agencies_import_events").insert({
    job_id: jobId,
    event_type: "parse_completed",
    event_data: { total_rows: rowsTotal, chunks_total: chunksTotal },
  }).catch(() => {});

  // Trigger workers to start processing chunks
  const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
  const internalHeaders = getInternalFunctionHeaders();

  EdgeRuntime.waitUntil(
    (async () => {
      for (let i = 0; i < Math.min(chunksTotal, 50); i++) {
        const resp = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-worker`, {
          method: "POST",
          headers: internalHeaders,
          body: JSON.stringify({ job_id: jobId }),
        }).catch(() => null);
        if (!resp || !resp.ok) break;
        const result = await resp.json().catch(() => ({ processed: 0 }));
        if (result.processed === 0) break;
      }
    })()
  );
}

async function handleFullFileMode(
  supabase: ReturnType<typeof createClient>,
  job: Record<string, unknown>,
  jobId: string
): Promise<Response> {
  const fileType = job.source_file_type as string;
  const storagePath = job.storage_path as string;
  const stateSlug = job.state_slug as string;

  const { data: fileData, error: fileErr } = await supabase.storage
    .from("import-staging")
    .download(storagePath);

  if (fileErr || !fileData) {
    throw new Error(`File download failed: ${fileErr?.message}`);
  }

  let rows: Record<string, string>[] = [];

  if (fileType === "xlsx") {
    const { read, utils } = await import("npm:xlsx@0.18.5");
    const bytes = new Uint8Array(await fileData.arrayBuffer());
    const workbook = read(bytes, { type: "array" });
    const worksheet = workbook.Sheets[workbook.SheetNames[0]];
    const rawRows = utils.sheet_to_json(worksheet) as Record<string, unknown>[];
    for (const row of rawRows) {
      const norm = normalizeRow(row, stateSlug);
      if (norm) rows.push(norm);
    }
  } else if (fileType === "json") {
    const text = await fileData.text();
    const parsed = JSON.parse(text);
    const arr = Array.isArray(parsed) ? parsed : [parsed];
    for (const row of arr) {
      const norm = normalizeRow(row as Record<string, unknown>, stateSlug);
      if (norm) rows.push(norm);
    }
  }

  let chunkIndex = 0;
  for (let i = 0; i < rows.length; i += CHUNK_SIZE) {
    const chunk = rows.slice(i, i + CHUNK_SIZE);
    await supabase.from("other_agencies_import_job_chunks").insert({
      job_id: jobId,
      chunk_index: chunkIndex,
      rows_in_chunk: chunk.length,
      payload_json: chunk,
      status: "pending",
      retry_count: 0,
    });
    await supabase.from("other_agencies_import_queue").insert({
      job_id: jobId,
      chunk_index: chunkIndex,
      priority: 0,
      status: "pending",
    });
    chunkIndex++;
  }

  await supabase.from("other_agencies_import_jobs")
    .update({
      status: "queued",
      source_rows_total: rows.length,
      chunks_total: chunkIndex,
      last_checkpoint: "chunks_created",
      updated_at: new Date().toISOString(),
    })
    .eq("id", jobId);

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
  const internalHeaders = getInternalFunctionHeaders();
  EdgeRuntime.waitUntil(
    (async () => {
      for (let i = 0; i < Math.min(chunkIndex, 50); i++) {
        const resp = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-worker`, {
          method: "POST",
          headers: internalHeaders,
          body: JSON.stringify({ job_id: jobId }),
        }).catch(() => null);
        if (!resp || !resp.ok) break;
        const result = await resp.json().catch(() => ({ processed: 0 }));
        if (result.processed === 0) break;
      }
    })()
  );

  return new Response(
    JSON.stringify({ ok: true, job_id: jobId, total_rows: rows.length, chunks_total: chunkIndex }),
    { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
  );
}

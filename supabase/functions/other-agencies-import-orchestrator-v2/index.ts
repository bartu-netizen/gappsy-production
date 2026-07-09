import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS, getInternalFunctionHeaders } from "../_shared/adminSession.ts";

interface OrchestratorRequest {
  action: "get_status" | "process_next_chunk" | "finalize_job" | "retry_failed";
  job_id: string;
  chunk_index?: number;
}

async function getJobStatus(supabase: ReturnType<typeof createClient>, job_id: string): Promise<Record<string, unknown>> {
  const { data: job } = await supabase
    .from("other_agencies_import_jobs")
    .select("*")
    .eq("id", job_id)
    .maybeSingle();

  if (!job) throw new Error(`Job not found: ${job_id}`);

  const { data: queueStatus } = await supabase
    .from("other_agencies_import_queue")
    .select("status")
    .eq("job_id", job_id);

  const pending = queueStatus?.filter((q: { status: string }) => q.status === "pending").length || 0;
  const processing = queueStatus?.filter((q: { status: string }) => q.status === "processing").length || 0;
  const completed = queueStatus?.filter((q: { status: string }) => q.status === "completed").length || 0;
  const failed = queueStatus?.filter((q: { status: string }) => q.status === "failed").length || 0;
  const totalChunks = queueStatus?.length || 0;

  const chunksExist = totalChunks > 0;
  const allChunksProcessed = chunksExist && pending === 0 && processing === 0;

  let effectiveStatus = job.status;
  if (allChunksProcessed && job.status === "processing") {
    effectiveStatus = failed > 0 && completed > 0 ? "partial_success" :
                      failed > 0 ? "failed" : "completed";
  }

  // Parse cursor progress for live parse visibility
  const { data: cursor } = await supabase
    .from("other_agencies_import_parse_cursors")
    .select("byte_offset, file_size_bytes, rows_parsed, chunk_index, status")
    .eq("job_id", job_id)
    .order("created_at", { ascending: false })
    .limit(1)
    .maybeSingle();

  const parseProgress = cursor ? {
    parse_cursor_status: cursor.status,
    parse_bytes_done: cursor.byte_offset,
    parse_bytes_total: cursor.file_size_bytes,
    parse_bytes_percent: cursor.file_size_bytes > 0
      ? Math.round((cursor.byte_offset / cursor.file_size_bytes) * 100)
      : 0,
  } : null;

  return {
    job_id,
    state_slug: job.state_slug,
    status: effectiveStatus,
    chunks_total: job.chunks_total || 0,
    chunks_processed: job.chunks_processed || completed,
    progress_percent: job.chunks_total > 0
      ? Math.round((completed / job.chunks_total) * 100)
      : 0,
    total_inserted: job.total_inserted || 0,
    total_updated: job.total_updated || 0,
    total_failed: job.total_failed || 0,
    source_rows_total: job.source_rows_total || 0,
    queue_pending: pending,
    queue_processing: processing,
    queue_completed: completed,
    queue_failed: failed,
    error_message: job.error_message || null,
    last_checkpoint: job.last_checkpoint || null,
    detected_delimiter: job.detected_delimiter || null,
    detected_header_row: job.detected_header_row ?? null,
    storage_path: job.storage_path || null,
    source_filename: job.source_filename || null,
    file_size_bytes: job.file_size_bytes || null,
    source_file_type: job.source_file_type || null,
    parse_progress: parseProgress,
    created_at: job.created_at,
    started_at: job.started_at,
    finalized_at: job.finalized_at,
  };
}

async function processNextChunk(
  supabase: ReturnType<typeof createClient>,
  job_id: string
): Promise<{ chunk_index: number; processed: boolean; error?: string }> {
  const { data: nextChunk } = await supabase
    .from("other_agencies_import_queue")
    .select("job_id, chunk_index")
    .eq("job_id", job_id)
    .eq("status", "pending")
    .order("priority", { ascending: false })
    .order("created_at", { ascending: true })
    .limit(1)
    .maybeSingle();

  if (!nextChunk) return { chunk_index: -1, processed: false, error: "No pending chunks" };

  const { chunk_index } = nextChunk;
  const SUPABASE_URL = Deno.env.get("SUPABASE_URL") as string;
  const internalHeaders = getInternalFunctionHeaders();

  await supabase
    .from("other_agencies_import_queue")
    .update({ status: "processing", attempted_at: new Date().toISOString() })
    .eq("job_id", job_id)
    .eq("chunk_index", chunk_index);

  try {
    const response = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-processor-v2`, {
      method: "POST",
      headers: internalHeaders,
      body: JSON.stringify({ job_id, chunk_index }),
    });

    if (!response.ok) {
      const errText = await response.text().catch(() => response.statusText);
      await supabase
        .from("other_agencies_import_queue")
        .update({ status: "failed", error_reason: `HTTP ${response.status}: ${errText}` })
        .eq("job_id", job_id)
        .eq("chunk_index", chunk_index);
      return { chunk_index, processed: false, error: errText };
    }

    await supabase
      .from("other_agencies_import_queue")
      .update({ status: "completed", completed_at: new Date().toISOString() })
      .eq("job_id", job_id)
      .eq("chunk_index", chunk_index);

    return { chunk_index, processed: true };
  } catch (err) {
    await supabase
      .from("other_agencies_import_queue")
      .update({ status: "failed", error_reason: String(err) })
      .eq("job_id", job_id)
      .eq("chunk_index", chunk_index);
    return { chunk_index, processed: false, error: String(err) };
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) return authResult;

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const body: OrchestratorRequest = await req.json();
    const { action, job_id } = body;

    if (!job_id) {
      return new Response(
        JSON.stringify({ ok: false, error: "Missing job_id" }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (action === "get_status") {
      const status = await getJobStatus(supabase, job_id);
      return new Response(
        JSON.stringify({ ok: true, ...status }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (action === "process_next_chunk") {
      const result = await processNextChunk(supabase, job_id);
      return new Response(
        JSON.stringify({ ok: true, ...result }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (action === "retry_failed") {
      await supabase
        .from("other_agencies_import_queue")
        .update({ status: "pending", error_reason: null })
        .eq("job_id", job_id)
        .eq("status", "failed");
      await supabase
        .from("other_agencies_import_jobs")
        .update({ status: "queued", error_message: null, last_checkpoint: "retry_initiated", updated_at: new Date().toISOString() })
        .eq("id", job_id);
      return new Response(
        JSON.stringify({ ok: true, message: "Failed chunks reset to pending" }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    return new Response(
      JSON.stringify({ ok: false, error: `Unknown action: ${action}` }),
      { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("[orchestrator-v2] Error:", err);
    return new Response(
      JSON.stringify({ ok: false, error: String(err) }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});

import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminOrInternal, CORS_HEADERS, getInternalFunctionHeaders } from "../_shared/adminSession.ts";

// Worker: claims and processes ONE pending chunk per invocation.
// Called repeatedly (by parse-slice after parse is done, or by orchestrator polling).
// Stays lightweight — one chunk per call, no nested triggers.

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const authResult = await requireAdminOrInternal(req);
    if (authResult instanceof Response) return authResult;

    const body = await req.json();
    const jobId = body.job_id as string | undefined;

    if (!jobId) {
      return new Response(
        JSON.stringify({ ok: false, error: "Missing job_id" }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    // Claim one pending chunk atomically
    const { data: nextChunk } = await supabase
      .from("other_agencies_import_queue")
      .select("chunk_index")
      .eq("job_id", jobId)
      .eq("status", "pending")
      .order("chunk_index", { ascending: true })
      .limit(1)
      .maybeSingle();

    if (!nextChunk) {
      return new Response(
        JSON.stringify({ ok: true, processed: 0, reason: "no_pending_chunks" }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const chunkIndex = nextChunk.chunk_index;

    // Mark as processing
    await supabase
      .from("other_agencies_import_queue")
      .update({ status: "processing", attempted_at: new Date().toISOString() })
      .eq("job_id", jobId)
      .eq("chunk_index", chunkIndex)
      .eq("status", "pending");

    const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
    const internalHeaders = getInternalFunctionHeaders();

    const processorResp = await fetch(
      `${SUPABASE_URL}/functions/v1/other-agencies-import-processor-v2`,
      {
        method: "POST",
        headers: internalHeaders,
        body: JSON.stringify({ job_id: jobId, chunk_index: chunkIndex }),
      }
    );

    if (!processorResp.ok) {
      const errText = await processorResp.text().catch(() => processorResp.statusText);
      await supabase
        .from("other_agencies_import_queue")
        .update({ status: "failed", error_reason: `HTTP ${processorResp.status}: ${errText}` })
        .eq("job_id", jobId)
        .eq("chunk_index", chunkIndex);

      return new Response(
        JSON.stringify({ ok: false, processed: 0, chunk_index: chunkIndex, error: errText }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    await supabase
      .from("other_agencies_import_queue")
      .update({ status: "completed", completed_at: new Date().toISOString() })
      .eq("job_id", jobId)
      .eq("chunk_index", chunkIndex);

    // Update job progress counter
    await supabase.rpc("increment_chunks_processed", { p_job_id: jobId }).catch(() => {});

    return new Response(
      JSON.stringify({ ok: true, processed: 1, chunk_index: chunkIndex }),
      { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("[worker] Error:", err);
    return new Response(
      JSON.stringify({ ok: false, error: String(err) }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});

import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { getInternalFunctionHeaders } from "../_shared/adminSession.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token, x-admin-secret",
};

interface OrchestratorRequest {
  action: "start_job" | "process_next_chunk" | "get_status" | "finalize_job";
  job_id?: string;
  state_slug?: string;
  source_filename?: string;
  source_data?: any[];
  chunk_index?: number;
}

interface OrchestratorResponse {
  ok: boolean;
  job_id: string;
  action: string;
  status: string;
  progress_percent: number;
  chunks_total: number;
  chunks_processed: number;
  message?: string;
  next_action?: "process_chunk" | "finalize" | "completed";
  next_chunk_index?: number;
}

async function validateAdmin(token: string, secret: string): Promise<boolean> {
  if (!token || !secret) return false;
  const ADMIN_SECRET = Deno.env.get("ADMIN_SECRET");
  return secret === ADMIN_SECRET;
}

function chunkArray(arr: any[], size: number): any[][] {
  const chunks = [];
  for (let i = 0; i < arr.length; i += size) {
    chunks.push(arr.slice(i, i + size));
  }
  return chunks;
}

async function processChunk(
  supabase: any,
  job_id: string,
  chunk_index: number,
  chunk_data: any[],
  state_slug: string
): Promise<boolean> {
  try {
    const SUPABASE_URL = Deno.env.get("SUPABASE_URL") as string;
    const internalHeaders = getInternalFunctionHeaders();

    const response = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-processor`, {
      method: "POST",
      headers: internalHeaders,
      body: JSON.stringify({
        job_id,
        chunk_index,
        chunk_data,
        state_slug,
      }),
    });

    if (!response.ok) {
      console.error(`Chunk ${chunk_index} failed:`, response.statusText);
      return false;
    }

    const result = await response.json();
    return result.ok && result.job_completed !== undefined;
  } catch (err) {
    console.error(`Error processing chunk ${chunk_index}:`, err);
    return false;
  }
}

async function startJob(
  supabase: any,
  state_slug: string,
  source_filename: string,
  source_data: any[],
  created_by_admin: string
): Promise<string> {
  const CHUNK_SIZE = 500;
  const chunks_total = Math.ceil(source_data.length / CHUNK_SIZE);

  const { data: job, error: jobErr } = await supabase
    .from("other_agencies_import_jobs")
    .insert({
      state_slug,
      source_filename,
      source_rows_total: source_data.length,
      status: "parsing",
      chunk_size: CHUNK_SIZE,
      chunks_total,
      chunks_processed: 0,
      progress_percent: 0,
      created_by_admin,
      created_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    })
    .select();

  if (jobErr || !job || !job[0]) {
    throw new Error(`Failed to create import job: ${jobErr?.message}`);
  }

  const job_id = job[0].id;

  const chunks = chunkArray(source_data, CHUNK_SIZE);
  for (let i = 0; i < chunks.length; i++) {
    const { error: chunkErr } = await supabase.from("other_agencies_import_job_chunks").insert({
      job_id,
      chunk_index: i,
      rows_in_chunk: chunks[i].length,
      status: "pending",
    });

    if (chunkErr) {
      console.error(`Failed to create chunk ${i}:`, chunkErr);
    }
  }

  await supabase
    .from("other_agencies_import_jobs")
    .update({ status: "processing", started_at: new Date().toISOString() })
    .eq("id", job_id);

  return job_id;
}

async function getJobStatus(supabase: any, job_id: string): Promise<any> {
  const { data: job, error } = await supabase.from("other_agencies_import_jobs").select("*").eq("id", job_id).maybeSingle();

  if (error || !job) {
    throw new Error(`Failed to fetch job: ${error?.message}`);
  }

  return job;
}

async function finalizeJob(supabase: any, job_id: string): Promise<void> {
  const job = await getJobStatus(supabase, job_id);

  if (job.status === "completed" || job.status === "partial_success") {
    const { data: emailsQueued, error: queryErr } = await supabase
      .from("other_agency_emails")
      .select("COUNT(*)", { count: "exact" })
      .eq("import_job_id", job_id)
      .eq("validation_status", "pending");

    const emails_enqueued_for_verification = emailsQueued?.length || 0;

    await supabase
      .from("other_agencies_import_jobs")
      .update({
        listclean_auto_kick_attempted: true,
        summary_json: {
          emails_enqueued_for_verification,
          completed_at: new Date().toISOString(),
        },
      })
      .eq("id", job_id);

    try {
      const SUPABASE_URL = Deno.env.get("SUPABASE_URL") as string;
      const internalHeaders = getInternalFunctionHeaders();

      const kickResponse = await fetch(`${SUPABASE_URL}/functions/v1/listclean-credits-status`, {
        method: "POST",
        headers: internalHeaders,
        body: JSON.stringify({
          auto_kickstart: true,
          state_slug: job.state_slug,
        }),
      });

      const kickResult = await kickResponse.json();

      await supabase
        .from("other_agencies_import_jobs")
        .update({
          listclean_auto_kick_started: kickResult.ok || false,
          listclean_auto_kick_already_running: kickResult.already_running || false,
          listclean_auto_kick_error: kickResult.error || null,
        })
        .eq("id", job_id);
    } catch (err) {
      await supabase
        .from("other_agencies_import_jobs")
        .update({
          listclean_auto_kick_error: String(err),
        })
        .eq("id", job_id);
    }
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "Method not allowed" }), { status: 405, headers: corsHeaders });
  }

  try {
    const body = (await req.json()) as OrchestratorRequest;
    const adminToken = req.headers.get("x-admin-token") || "";
    const adminSecret = req.headers.get("x-admin-secret") || "";

    if (!(await validateAdmin(adminToken, adminSecret))) {
      return new Response(JSON.stringify({ error: "Unauthorized" }), { status: 401, headers: corsHeaders });
    }

    const SUPABASE_URL = Deno.env.get("SUPABASE_URL") as string;
    const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") as string;
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    const { action } = body;

    if (action === "start_job") {
      if (!body.state_slug || !body.source_filename || !Array.isArray(body.source_data)) {
        return new Response(JSON.stringify({ error: "Missing required fields for start_job" }), { status: 400, headers: corsHeaders });
      }

      const job_id = await startJob(supabase, body.state_slug, body.source_filename, body.source_data, adminToken);

      return new Response(
        JSON.stringify({
          ok: true,
          job_id,
          action: "start_job",
          status: "queued",
          progress_percent: 0,
          chunks_total: Math.ceil(body.source_data.length / 500),
          chunks_processed: 0,
          next_action: "process_chunk",
          next_chunk_index: 0,
        } as OrchestratorResponse),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    if (action === "get_status") {
      if (!body.job_id) {
        return new Response(JSON.stringify({ error: "Missing job_id" }), { status: 400, headers: corsHeaders });
      }

      const job = await getJobStatus(supabase, body.job_id);

      let next_action: "process_chunk" | "finalize" | "completed" | undefined;
      if (job.status === "processing" && job.chunks_processed < job.chunks_total) {
        next_action = "process_chunk";
      } else if (job.status === "processing" && job.chunks_processed >= job.chunks_total) {
        next_action = "finalize";
      } else if (job.status === "completed" || job.status === "partial_success") {
        next_action = "completed";
      }

      return new Response(
        JSON.stringify({
          ok: true,
          job_id: job.id,
          action: "get_status",
          status: job.status,
          progress_percent: job.progress_percent,
          chunks_total: job.chunks_total,
          chunks_processed: job.chunks_processed,
          next_action,
          next_chunk_index: job.chunks_processed < job.chunks_total ? job.chunks_processed : undefined,
        } as OrchestratorResponse),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    if (action === "process_next_chunk") {
      if (!body.job_id || body.chunk_index === undefined) {
        return new Response(JSON.stringify({ error: "Missing job_id or chunk_index" }), { status: 400, headers: corsHeaders });
      }

      const job = await getJobStatus(supabase, body.job_id);

      if (job.status !== "processing") {
        return new Response(
          JSON.stringify({ error: "Job is not in processing state" }),
          { status: 400, headers: corsHeaders }
        );
      }

      const { data: chunk, error: chunkErr } = await supabase
        .from("other_agencies_import_job_chunks")
        .select("rows_in_chunk")
        .eq("job_id", body.job_id)
        .eq("chunk_index", body.chunk_index)
        .maybeSingle();

      if (chunkErr || !chunk) {
        return new Response(JSON.stringify({ error: "Chunk not found" }), { status: 404, headers: corsHeaders });
      }

      // Simulate chunk data retrieval (in real scenario, would fetch from staging storage)
      // For now, we defer to the processor
      const success = await processChunk(supabase, body.job_id, body.chunk_index, [], job.state_slug);

      const updatedJob = await getJobStatus(supabase, body.job_id);

      let next_action: "process_chunk" | "finalize" | "completed" | undefined;
      if (updatedJob.chunks_processed < updatedJob.chunks_total) {
        next_action = "process_chunk";
      } else {
        next_action = "finalize";
      }

      return new Response(
        JSON.stringify({
          ok: success,
          job_id: body.job_id,
          action: "process_next_chunk",
          status: updatedJob.status,
          progress_percent: updatedJob.progress_percent,
          chunks_total: updatedJob.chunks_total,
          chunks_processed: updatedJob.chunks_processed,
          next_action,
          next_chunk_index: updatedJob.chunks_processed < updatedJob.chunks_total ? updatedJob.chunks_processed : undefined,
        } as OrchestratorResponse),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    if (action === "finalize_job") {
      if (!body.job_id) {
        return new Response(JSON.stringify({ error: "Missing job_id" }), { status: 400, headers: corsHeaders });
      }

      await finalizeJob(supabase, body.job_id);

      const job = await getJobStatus(supabase, body.job_id);

      return new Response(
        JSON.stringify({
          ok: true,
          job_id: body.job_id,
          action: "finalize_job",
          status: job.status,
          progress_percent: 100,
          chunks_total: job.chunks_total,
          chunks_processed: job.chunks_processed,
          message: "Job finalized. ListClean auto-kick status updated.",
          next_action: "completed",
        } as OrchestratorResponse),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    return new Response(JSON.stringify({ error: "Unknown action" }), { status: 400, headers: corsHeaders });
  } catch (err) {
    return new Response(JSON.stringify({ error: String(err) }), { status: 500, headers: corsHeaders });
  }
});

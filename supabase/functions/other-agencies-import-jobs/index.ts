import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS, getInternalFunctionHeaders } from "../_shared/adminSession.ts";

interface JobsRequest {
  action: "list" | "get" | "get_events" | "retry";
  job_id?: string;
  state_slug?: string;
  limit?: number;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) {
      return authResult;
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    if (req.method === "GET") {
      const url = new URL(req.url);
      const job_id = url.searchParams.get("job_id") || "";
      const state = url.searchParams.get("state") || "";
      const limit = Math.min(parseInt(url.searchParams.get("limit") || "50"), 100);

      if (job_id) {
        const { data: job, error: jobErr } = await supabase
          .from("other_agencies_import_jobs")
          .select("*")
          .eq("id", job_id)
          .single();

        if (jobErr || !job) {
          return new Response(
            JSON.stringify({ ok: false, error: `Job not found: ${jobErr?.message}` }),
            { status: 404, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
          );
        }

        const { data: events } = await supabase
          .from("other_agencies_import_events")
          .select("*")
          .eq("job_id", job_id)
          .order("created_at", { ascending: true });

        const { data: chunks } = await supabase
          .from("other_agencies_import_job_chunks")
          .select("chunk_index, rows_in_chunk, status, retry_count, error_message")
          .eq("job_id", job_id)
          .order("chunk_index", { ascending: true });

        return new Response(
          JSON.stringify({ ok: true, job, events: events || [], chunks: chunks || [] }),
          { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      let query = supabase
        .from("other_agencies_import_jobs")
        .select("*")
        .order("created_at", { ascending: false })
        .limit(limit);

      if (state) {
        query = query.eq("state_slug", state);
      }

      const { data: jobs, error } = await query;

      if (error) {
        return new Response(
          JSON.stringify({ ok: false, error: error.message }),
          { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      return new Response(
        JSON.stringify({ ok: true, jobs: jobs || [] }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const body: JobsRequest = await req.json();
    const { action, job_id, state_slug, limit = 50 } = body;

    if (action === "list") {
      let query = supabase
        .from("other_agencies_import_jobs")
        .select("*")
        .order("created_at", { ascending: false })
        .limit(limit);

      if (state_slug) {
        query = query.eq("state_slug", state_slug);
      }

      const { data: jobs, error } = await query;

      if (error) {
        return new Response(
          JSON.stringify({ ok: false, error: error.message }),
          { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      return new Response(
        JSON.stringify({ ok: true, jobs }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (action === "get" && job_id) {
      const { data: job, error: jobErr } = await supabase
        .from("other_agencies_import_jobs")
        .select("*")
        .eq("id", job_id)
        .single();

      if (jobErr || !job) {
        return new Response(
          JSON.stringify({ ok: false, error: `Job not found: ${jobErr?.message}` }),
          { status: 404, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      const { data: chunks } = await supabase
        .from("other_agencies_import_job_chunks")
        .select("chunk_index, rows_in_chunk, status, retry_count, error_message")
        .eq("job_id", job_id)
        .order("chunk_index", { ascending: true });

      return new Response(
        JSON.stringify({ ok: true, job, chunks: chunks || [] }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (action === "get_events" && job_id) {
      const { data: events, error } = await supabase
        .from("other_agencies_import_events")
        .select("*")
        .eq("job_id", job_id)
        .order("created_at", { ascending: true });

      if (error) {
        return new Response(
          JSON.stringify({ ok: false, error: error.message }),
          { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      return new Response(
        JSON.stringify({ ok: true, events: events || [] }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (action === "retry" && job_id) {
      const { data: job, error: jobErr } = await supabase
        .from("other_agencies_import_jobs")
        .select("*")
        .eq("id", job_id)
        .single();

      if (jobErr || !job) {
        return new Response(
          JSON.stringify({ ok: false, error: `Job not found: ${jobErr?.message}` }),
          { status: 404, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      await supabase
        .from("other_agencies_import_job_chunks")
        .update({ status: "pending", retry_count: 0 })
        .eq("job_id", job_id)
        .eq("status", "failed");

      await supabase
        .from("other_agencies_import_queue")
        .update({ status: "pending" })
        .eq("job_id", job_id)
        .eq("status", "failed");

      await supabase
        .from("other_agencies_import_jobs")
        .update({ status: "queued", chunks_failed: 0, updated_at: new Date().toISOString() })
        .eq("id", job_id);

      await supabase.from("other_agencies_import_events").insert({
        job_id,
        event_type: "job_retry_requested",
        event_data: {},
      });

      const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
      const internalHeaders = getInternalFunctionHeaders();

      EdgeRuntime.waitUntil(
        fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-worker`, {
          method: "POST",
          headers: internalHeaders,
          body: JSON.stringify({ job_id }),
        })
      );

      return new Response(
        JSON.stringify({ ok: true, message: "Job retry initiated" }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    return new Response(
      JSON.stringify({ ok: false, error: "Invalid action" }),
      { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("[jobs] Error:", err);
    return new Response(
      JSON.stringify({ ok: false, error: String(err) }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});

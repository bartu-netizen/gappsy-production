import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { CORS_HEADERS, extractToken, verifySessionToken } from "../_shared/adminSession.ts";

const INTERNAL_SECRET = Deno.env.get("INTERNAL_FUNCTION_SECRET") || "internal-fn-secret-2024";
const STALE_MINUTES = 10;
const MAX_RETRIES = 3;

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
  });
}

function countChunks(rows: { status: string }[]) {
  return {
    queued: rows.filter(c => c.status === "queued").length,
    processing: rows.filter(c => c.status === "processing").length,
    completed: rows.filter(c => c.status === "completed").length,
    failed: rows.filter(c => c.status === "failed").length,
    total: rows.length,
  };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const token = extractToken(req);
    if (!token) return json({ error: "MISSING_TOKEN", message: "Admin token required" }, 401);

    const tokenCheck = await verifySessionToken(token);
    if (!tokenCheck.ok) {
      return json({
        error: "UNAUTHORIZED",
        message: tokenCheck.error === "expired" ? "Admin session expired" : "Invalid admin token",
      }, 401);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const { job_id } = await req.json();
    if (!job_id) return json({ error: "MISSING_JOB_ID" }, 400);

    const { data: job, error: jobErr } = await supabase
      .from("other_agencies_import_jobs_v2")
      .select("id, state_slug, status, chunks_total, chunks_processed")
      .eq("id", job_id)
      .maybeSingle();

    if (jobErr || !job) return json({ error: "JOB_NOT_FOUND" }, 404);

    if (["completed", "partial_success", "cancelled"].includes(job.status)) {
      return json({ ok: true, message: `Job already terminal: ${job.status}`, action: "none" });
    }

    const { data: recovery } = await supabase.rpc("recover_stale_import_v2_chunks", {
      p_job_id: job_id,
      p_stale_minutes: STALE_MINUTES,
      p_max_retries: MAX_RETRIES,
    });

    const recovered = recovery?.[0]?.recovered_count ?? 0;
    const permFailed = recovery?.[0]?.failed_count ?? 0;

    const { data: chunksBefore } = await supabase
      .from("other_agencies_import_job_chunks_v2")
      .select("status")
      .eq("job_id", job_id);

    const before = countChunks(chunksBefore ?? []);

    if (before.queued + before.processing === 0) {
      const finalStatus = before.failed === 0 ? "completed" : (before.completed > 0 ? "partial_success" : "failed");

      await supabase
        .from("other_agencies_import_jobs_v2")
        .update({
          status: finalStatus,
          chunks_processed: before.completed + before.failed,
          work_completed_at: new Date().toISOString(),
          error_message: before.failed > 0 ? `${before.failed}/${before.total} chunks failed` : null,
          last_checkpoint: `Resume finalized — ${finalStatus}`,
        })
        .eq("id", job_id);

      await supabase.from("other_agencies_import_events_v2").insert({
        job_id, event_type: "resume_finalized",
        message: `Resume found 0 remaining chunks. Finalized as ${finalStatus} (${before.completed} ok, ${before.failed} failed)`,
      });

      return json({
        ok: true,
        action: "finalized",
        final_status: finalStatus,
        recovered,
        perm_failed: permFailed,
      });
    }

    if (!["processing", "chunking", "parsing", "failed"].includes(job.status)) {
      await supabase
        .from("other_agencies_import_jobs_v2")
        .update({
          status: "processing",
          work_started_at: new Date().toISOString(),
          last_checkpoint: `Resumed — ${before.queued + before.processing} chunks remaining`,
        })
        .eq("id", job_id);
    } else {
      await supabase
        .from("other_agencies_import_jobs_v2")
        .update({ last_checkpoint: `Resumed — ${before.queued + before.processing} chunks remaining (recovered ${recovered}, perm-failed ${permFailed})` })
        .eq("id", job_id);
    }

    await supabase.from("other_agencies_import_events_v2").insert({
      job_id, event_type: "resume_triggered",
      message: `Admin resume: ${before.queued} queued, ${before.processing} processing, recovered ${recovered} stale, ${permFailed} permanently failed`,
    });

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
      console.log(`[v2-resume] Dispatch result:`, JSON.stringify(dispatchResult));
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      console.error(`[v2-resume] Dispatch call failed:`, msg);
      dispatchResult = { action: "dispatch_fetch_failed", error: msg };
    }

    const runnersLogicOk = Number(dispatchResult.runners_logic_ok ?? 0);
    const runnersLogicFailed = Number(dispatchResult.runners_logic_failed ?? 0);
    const runnersAttempted = Number(dispatchResult.runners_attempted ?? 0);
    const dispatchAction = String(dispatchResult.action ?? "unknown");
    const failedSamples = (dispatchResult.failed_samples as string[]) ?? [];

    const dispatchOk = runnersLogicOk > 0 ||
      dispatchAction === "finalized" ||
      dispatchAction === "none" ||
      dispatchAction === "throttled";

    let resumeAction: string;
    let resumeMessage: string;

    if (dispatchAction === "finalized") {
      resumeAction = "finalized";
      resumeMessage = `Job finalized during dispatch — ${dispatchResult.final_status}`;
    } else if (dispatchAction === "none" || dispatchAction === "throttled") {
      resumeAction = "resumed";
      resumeMessage = `Dispatch: ${dispatchResult.reason ?? dispatchAction}`;
    } else if (runnersLogicOk > 0) {
      resumeAction = "resumed";
      resumeMessage = `${runnersLogicOk}/${runnersAttempted} workers started successfully`;
    } else if (runnersAttempted > 0 && runnersLogicOk === 0) {
      resumeAction = "resume_failed_workers_did_not_start";
      resumeMessage = `All ${runnersAttempted} workers failed logically. ${failedSamples.length > 0 ? failedSamples[0] : "No error detail"}`;
    } else if (dispatchAction === "dispatch_fetch_failed") {
      resumeAction = "resume_failed_dispatch_unreachable";
      resumeMessage = `Could not reach dispatch function: ${dispatchResult.error ?? "unknown"}`;
    } else {
      resumeAction = "resume_unknown_result";
      resumeMessage = `Dispatch returned unexpected action: ${dispatchAction}`;
    }

    await supabase.from("other_agencies_import_events_v2").insert({
      job_id,
      event_type: resumeAction.startsWith("resume_failed") ? "resume_failed" : "resume_completed",
      message: resumeMessage,
    });

    if (resumeAction.startsWith("resume_failed")) {
      await supabase
        .from("other_agencies_import_jobs_v2")
        .update({
          last_checkpoint: `Resume failed: ${resumeMessage}`,
        })
        .eq("id", job_id);
    }

    return json({
      ok: dispatchOk,
      action: resumeAction,
      message: resumeMessage,
      queued_before: before.queued,
      processing_before: before.processing,
      completed_before: before.completed,
      failed_before: before.failed,
      recovered,
      perm_failed: permFailed,
      runners_attempted: runnersAttempted,
      runners_logic_ok: runnersLogicOk,
      runners_logic_failed: runnersLogicFailed,
      failed_samples: failedSamples,
      dispatch: dispatchResult,
    });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[v2-resume] Error:", msg);
    return json({ error: "INTERNAL_ERROR", message: msg }, 500);
  }
});

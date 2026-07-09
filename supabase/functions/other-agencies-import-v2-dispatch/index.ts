import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-internal-secret",
};

const INTERNAL_SECRET = Deno.env.get("INTERNAL_FUNCTION_SECRET") || "internal-fn-secret-2024";
const STALE_MINUTES = 10;
const MAX_RETRIES = 3;
const MAX_CONCURRENT_WORKERS = 5;

const LOGIC_SUCCESS_ACTIONS = new Set([
  "chunk_processed",
  "chunk_processed_job_finalized",
  "no_work",
  "skipped",
]);

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

interface RunnerResult {
  runner: number;
  http_ok: boolean;
  http_status: number;
  logic_ok: boolean;
  action: string;
  error: string | null;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS });

  const secret = req.headers.get("x-internal-secret");
  if (secret !== INTERNAL_SECRET) return json({ error: "FORBIDDEN" }, 403);

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  try {
    const body = await req.json();
    const { job_id } = body;
    if (!job_id) return json({ error: "MISSING_JOB_ID" }, 400);

    console.log(`[v2-dispatch] Dispatch requested for job ${job_id}`);

    const { data: job } = await supabase
      .from("other_agencies_import_jobs_v2")
      .select("id, status, state_slug")
      .eq("id", job_id)
      .maybeSingle();

    if (!job) return json({ error: "JOB_NOT_FOUND" }, 404);

    if (["completed", "partial_success", "cancelled"].includes(job.status)) {
      return json({ ok: true, action: "none", reason: `Job is terminal: ${job.status}` });
    }

    let recovered = 0;
    let permFailed = 0;

    try {
      const { data: recovery } = await supabase.rpc("recover_stale_import_v2_chunks", {
        p_job_id: job_id,
        p_stale_minutes: STALE_MINUTES,
        p_max_retries: MAX_RETRIES,
      });
      recovered = recovery?.[0]?.recovered_count ?? 0;
      permFailed = recovery?.[0]?.failed_count ?? 0;
      if (recovered > 0 || permFailed > 0) {
        console.log(`[v2-dispatch] Stale recovery: recovered=${recovered} perm_failed=${permFailed}`);
      }
    } catch (e) {
      console.warn("[v2-dispatch] Stale recovery RPC error:", e);
    }

    const { data: chunkRows } = await supabase
      .from("other_agencies_import_job_chunks_v2")
      .select("status")
      .eq("job_id", job_id);

    const queued = chunkRows?.filter(c => c.status === "queued").length ?? 0;
    const processing = chunkRows?.filter(c => c.status === "processing").length ?? 0;
    const completed = chunkRows?.filter(c => c.status === "completed").length ?? 0;
    const failed = chunkRows?.filter(c => c.status === "failed").length ?? 0;
    const total = chunkRows?.length ?? 0;
    const remaining = queued + processing;

    console.log(`[v2-dispatch] Job ${job_id}: queued=${queued} processing=${processing} completed=${completed} failed=${failed} total=${total}`);

    if (remaining === 0 && total > 0) {
      const finalStatus = failed === 0 ? "completed" : (completed > 0 ? "partial_success" : "failed");
      await supabase
        .from("other_agencies_import_jobs_v2")
        .update({
          status: finalStatus,
          chunks_processed: completed + failed,
          work_completed_at: new Date().toISOString(),
          error_message: failed > 0 ? `${failed}/${total} chunks failed` : null,
          last_checkpoint: `Dispatch: no remaining chunks — finalized as ${finalStatus}`,
        })
        .eq("id", job_id);

      await supabase.from("other_agencies_import_events_v2").insert({
        job_id,
        event_type: "dispatch_finalized",
        message: `Dispatch found 0 remaining chunks. Finalized as ${finalStatus} (${completed} ok, ${failed} failed)`,
      });

      return json({ ok: true, action: "finalized", final_status: finalStatus, recovered, perm_failed: permFailed });
    }

    if (queued === 0) {
      return json({
        ok: true,
        action: "none",
        reason: processing > 0
          ? `${processing} worker(s) already active — no additional dispatch needed`
          : "No queued chunks",
        queued,
        processing,
        completed,
        failed,
        recovered,
      });
    }

    const slotsFree = Math.max(0, MAX_CONCURRENT_WORKERS - processing);
    if (slotsFree === 0) {
      console.log(`[v2-dispatch] ${processing} workers already active (max=${MAX_CONCURRENT_WORKERS}), skipping launch`);
      return json({
        ok: true,
        action: "throttled",
        reason: `${processing} workers already active, concurrency cap reached`,
        queued,
        processing,
        recovered,
      });
    }

    const runnersToLaunch = Math.min(slotsFree, queued);
    const workerUrl = `${supabaseUrl}/functions/v1/other-agencies-import-v2-worker`;
    const workerHeaders = {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${serviceKey}`,
      "x-internal-secret": INTERNAL_SECRET,
    };

    console.log(`[v2-dispatch] Launching ${runnersToLaunch} worker(s) (${processing} already active, ${queued} queued) for job ${job_id}`);

    await supabase.from("other_agencies_import_events_v2").insert({
      job_id,
      event_type: "dispatch_started",
      message: `Dispatching ${runnersToLaunch} worker(s) — ${queued} queued, ${processing} active, slots_free=${slotsFree}`,
    });

    const runnerResults: RunnerResult[] = [];

    const launches = Array.from({ length: runnersToLaunch }, (_, i) =>
      fetch(workerUrl, {
        method: "POST",
        headers: workerHeaders,
        body: JSON.stringify({ job_id }),
      })
        .then(async (res) => {
          let bodyData: Record<string, unknown> = {};
          try {
            bodyData = await res.json();
          } catch {
            bodyData = { parse_error: true };
          }

          const action = String(bodyData.action ?? bodyData.error ?? "unknown");
          const logicOk = res.ok && bodyData.ok === true && LOGIC_SUCCESS_ACTIONS.has(action);
          const errorDetail = !logicOk
            ? String(bodyData.claim_full ?? bodyData.message ?? bodyData.error ?? `action=${action}, ok=${bodyData.ok}`)
            : null;

          const result: RunnerResult = {
            runner: i,
            http_ok: res.ok,
            http_status: res.status,
            logic_ok: logicOk,
            action,
            error: errorDetail,
          };

          console.log(`[v2-dispatch] Runner ${i}: http=${res.status} logic_ok=${logicOk} action=${action}${errorDetail ? ` err=${errorDetail}` : ""}`);
          runnerResults.push(result);
          return result;
        })
        .catch(err => {
          const errMsg = err instanceof Error ? err.message : String(err);
          const result: RunnerResult = {
            runner: i,
            http_ok: false,
            http_status: 0,
            logic_ok: false,
            action: "fetch_failed",
            error: errMsg,
          };
          console.error(`[v2-dispatch] Runner ${i} fetch failed:`, errMsg);
          runnerResults.push(result);
          return result;
        })
    );

    await Promise.allSettled(launches);

    const httpOkCount = runnerResults.filter(r => r.http_ok).length;
    const logicOkCount = runnerResults.filter(r => r.logic_ok).length;
    const logicFailedCount = runnerResults.filter(r => !r.logic_ok).length;

    const failedSamples = runnerResults
      .filter(r => !r.logic_ok && r.error)
      .slice(0, 3)
      .map(r => `runner${r.runner}: ${r.error}`);

    console.log(`[v2-dispatch] Launch complete: http_ok=${httpOkCount} logic_ok=${logicOkCount} logic_failed=${logicFailedCount}`);

    const eventType = logicOkCount > 0 ? "dispatch_completed" : "dispatch_all_workers_failed";
    const eventMessage = logicOkCount > 0
      ? `Workers: ${logicOkCount} logic-ok, ${logicFailedCount} logic-failed out of ${runnersToLaunch} launched`
      : `ALL ${runnersToLaunch} workers failed logically (http_ok=${httpOkCount}). Errors: ${failedSamples.join("; ") || "unknown"}`;

    await supabase.from("other_agencies_import_events_v2").insert({
      job_id,
      event_type: eventType,
      message: eventMessage,
    });

    // Log failed worker launches with detailed diagnostics
    for (const r of runnerResults) {
      if (!r.logic_ok) {
        const detailedMsg = `Runner ${r.runner}: http=${r.http_status} action=${r.action} error=${r.error ?? "none"}`;
        console.error(`[v2-dispatch] Worker launch failed: ${detailedMsg}`);
        await supabase.from("other_agencies_import_events_v2").insert({
          job_id,
          event_type: "dispatch_runner_logic_failed",
          message: detailedMsg,
        });

        // CRITICAL: If worker returned 504 or timeout, the chunk may have been claimed
        // but never completed. The stale recovery system will handle this, but log it clearly.
        if (r.http_status === 504 || r.action === "fetch_failed" || r.error?.includes("timeout")) {
          console.warn(`[v2-dispatch] Runner ${r.runner} TIMEOUT/504 — chunk may be stuck in processing. Stale recovery will handle after 10 minutes.`);
        }
      }
    }

    // If ALL workers failed and there are queued chunks, trigger another dispatch attempt
    // after a short delay to avoid infinite retry loops
    if (logicOkCount === 0 && queued > 0) {
      console.warn(`[v2-dispatch] ALL ${runnersToLaunch} workers failed for job ${job_id}. Queued chunks remain. Resume endpoint can retry.`);
    }

    const dispatchAction = logicOkCount > 0 ? "dispatched" : "dispatch_failed_no_progress";

    return json({
      ok: logicOkCount > 0,
      action: dispatchAction,
      runners_attempted: runnersToLaunch,
      runners_http_ok: httpOkCount,
      runners_logic_ok: logicOkCount,
      runners_logic_failed: logicFailedCount,
      failed_samples: failedSamples,
      chunks_queued_before: queued,
      chunks_processing_before: processing,
      slots_free: slotsFree,
      recovered,
      perm_failed: permFailed,
    });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[v2-dispatch] Unexpected error:", msg);
    return json({ error: "INTERNAL_ERROR", message: msg }, 500);
  }
});

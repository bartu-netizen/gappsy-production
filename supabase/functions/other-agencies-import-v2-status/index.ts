import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { CORS_HEADERS, extractToken, verifySessionToken } from "../_shared/adminSession.ts";

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const token = extractToken(req);
    if (!token) return json({ error: "MISSING_TOKEN", message: "Admin token required" }, 401);

    const tokenCheck = await verifySessionToken(token);
    if (!tokenCheck.ok) {
      return json({
        error: "UNAUTHORIZED",
        message: tokenCheck.error === "expired" ? "Admin session expired — log in again" : "Invalid admin token",
      }, 401);
    }

    const url = new URL(req.url);
    const jobId = url.searchParams.get("job_id");

    if (!jobId) {
      const { data: jobs, error: listErr } = await supabase
        .from("other_agencies_import_jobs_v2")
        .select("id, state_slug, file_name, file_size_bytes, file_format, status, rows_read, rows_valid, chunks_total, chunks_processed, agencies_created, agencies_updated, emails_added, errors_count, error_message, last_checkpoint, created_at, updated_at, work_completed_at")
        .order("created_at", { ascending: false })
        .limit(20);

      if (listErr) return json({ error: "DB_ERROR", message: listErr.message }, 500);
      return json({ ok: true, jobs: jobs ?? [] });
    }

    const { data: job, error: jobErr } = await supabase
      .from("other_agencies_import_jobs_v2")
      .select("*")
      .eq("id", jobId)
      .maybeSingle();

    if (jobErr || !job) return json({ error: "JOB_NOT_FOUND", message: `No job found with id ${jobId}` }, 404);

    const { data: chunks } = await supabase
      .from("other_agencies_import_job_chunks_v2")
      .select("chunk_index, status, agencies_created, agencies_updated, emails_added, errors_count, error_message, error_samples, retry_count, started_at, completed_at")
      .eq("job_id", jobId)
      .order("chunk_index", { ascending: true });

    const { data: events } = await supabase
      .from("other_agencies_import_events_v2")
      .select("event_type, message, created_at")
      .eq("job_id", jobId)
      .order("created_at", { ascending: false })
      .limit(30);

    const { data: suspiciousSamples } = await supabase
      .from("other_agencies_import_row_audit_v2")
      .select("source_row_number, source_agency_name, source_state_slug, normalized_domain, matched_agency_id, matched_agency_slug, matched_agency_state_slug, match_method, cross_state, changed_fields_count, only_updated_at, suspicious_reason")
      .eq("job_id", jobId)
      .eq("suspicious_match", true)
      .order("source_row_number", { ascending: true })
      .limit(25);

    const chunkList = chunks ?? [];
    const chunkSummary = {
      total: chunkList.length,
      queued: chunkList.filter(c => c.status === "queued").length,
      processing: chunkList.filter(c => c.status === "processing").length,
      completed: chunkList.filter(c => c.status === "completed").length,
      failed: chunkList.filter(c => c.status === "failed").length,
      skipped: chunkList.filter(c => c.status === "skipped").length,
    };

    const STALE_THRESHOLD_MS = 10 * 60 * 1000;
    const now = Date.now();
    const staleChunkList = chunkList.filter(c =>
      c.status === "processing" && c.started_at && (now - new Date(c.started_at).getTime()) > STALE_THRESHOLD_MS
    );
    let staleChunks = staleChunkList.length;

    // PROACTIVE STALE RECOVERY: Auto-recover stuck chunks on every status poll
    if (staleChunks > 0 && job.status === "processing") {
      console.log(`[v2-status] PROACTIVE RECOVERY: ${staleChunks} stale chunks detected for job ${jobId}, triggering recovery`);
      try {
        const { data: recovery } = await supabase.rpc("recover_stale_import_v2_chunks", {
          p_job_id: jobId,
          p_stale_minutes: 10,
          p_max_retries: 3,
        });
        const recovered = recovery?.[0]?.recovered_count ?? 0;
        const permFailed = recovery?.[0]?.failed_count ?? 0;
        if (recovered > 0 || permFailed > 0) {
          console.log(`[v2-status] Stale recovery applied: recovered=${recovered} perm_failed=${permFailed}`);
          await supabase.from("other_agencies_import_events_v2").insert({
            job_id: jobId,
            event_type: "status_auto_recovery",
            message: `Status endpoint auto-recovery: ${recovered} chunks requeued, ${permFailed} chunks marked failed`,
          });
          // Refresh chunk list after recovery
          const { data: freshChunks } = await supabase
            .from("other_agencies_import_job_chunks_v2")
            .select("chunk_index, status, agencies_created, agencies_updated, emails_added, errors_count, error_message, error_samples, retry_count, started_at, completed_at")
            .eq("job_id", jobId)
            .order("chunk_index", { ascending: true });
          if (freshChunks) {
            chunkList.length = 0;
            chunkList.push(...freshChunks);
            chunkSummary.queued = chunkList.filter(c => c.status === "queued").length;
            chunkSummary.processing = chunkList.filter(c => c.status === "processing").length;
            chunkSummary.completed = chunkList.filter(c => c.status === "completed").length;
            chunkSummary.failed = chunkList.filter(c => c.status === "failed").length;
            staleChunks = chunkList.filter(c =>
              c.status === "processing" && c.started_at && (now - new Date(c.started_at).getTime()) > STALE_THRESHOLD_MS
            ).length;
          }
        }
      } catch (recoveryErr) {
        console.error("[v2-status] Stale recovery failed:", recoveryErr);
      }
    }

    // AUTO-FINALIZATION: If all chunks are terminal but job isn't, finalize it now
    const allChunksTerminal = chunkList.length > 0 &&
      chunkSummary.queued === 0 &&
      chunkSummary.processing === 0 &&
      (chunkSummary.completed + chunkSummary.failed) === chunkSummary.total;

    if (allChunksTerminal && job.status === "processing") {
      const finalStatus = chunkSummary.failed === 0 ? "completed" : (chunkSummary.completed > 0 ? "partial_success" : "failed");
      const errorMsg = chunkSummary.failed > 0 ? `${chunkSummary.failed}/${chunkSummary.total} chunks failed` : null;
      console.log(`[v2-status] AUTO-FINALIZATION: Job ${jobId} has all chunks terminal but status=processing. Finalizing as ${finalStatus}`);

      await supabase
        .from("other_agencies_import_jobs_v2")
        .update({
          status: finalStatus,
          chunks_processed: chunkSummary.completed + chunkSummary.failed,
          work_completed_at: new Date().toISOString(),
          error_message: errorMsg,
          last_checkpoint: `Status auto-finalized: ${finalStatus} (${chunkSummary.completed} ok, ${chunkSummary.failed} failed)`,
        })
        .eq("id", jobId);

      await supabase.from("other_agencies_import_events_v2").insert({
        job_id: jobId,
        event_type: "status_auto_finalized",
        message: `Status endpoint auto-finalized job as ${finalStatus} — all ${chunkSummary.total} chunks are terminal`,
      });

      job.status = finalStatus;
      job.error_message = errorMsg;
      job.work_completed_at = new Date().toISOString();
    }

    const isStuck = job.status === "processing" && chunkSummary.processing === 0 && chunkSummary.queued === 0 && (chunkSummary.completed + chunkSummary.failed) < chunkSummary.total;
    const needsResume = job.status === "processing" && (staleChunks > 0 || (chunkSummary.queued > 0 && chunkSummary.processing === 0));

    const lastCompletedChunk = chunkList
      .filter(c => c.status === "completed" && c.completed_at)
      .sort((a, b) => new Date(b.completed_at!).getTime() - new Date(a.completed_at!).getTime())[0];

    const lastClaimedChunk = chunkList
      .filter(c => c.started_at)
      .sort((a, b) => new Date(b.started_at!).getTime() - new Date(a.started_at!).getTime())[0];

    const eventList = events ?? [];
    const lastDispatchEvent = eventList.find(e =>
      e.event_type.startsWith("dispatch_") || e.event_type.startsWith("resume_")
    );
    const lastWorkerFailEvent = eventList.find(e =>
      e.event_type === "dispatch_runner_logic_failed" || e.event_type === "worker_claim_failed" || e.event_type === "dispatch_all_workers_failed"
    );

    // IMPROVED WATCHDOG: Check updated_at inactivity, not just created_at age
    const PARSE_STALE_MS = 5 * 60 * 1000; // 5 minutes of NO activity
    const parseStuckStatuses = ["staged", "parsing", "chunking"];

    // Check time since last update (heartbeat)
    const lastUpdate = job.updated_at || job.created_at;
    const timeSinceUpdate = lastUpdate ? (now - new Date(lastUpdate).getTime()) : 0;

    // Only mark as stuck if:
    // 1. Status is in parse phase
    // 2. No heartbeat/updated_at change for PARSE_STALE_MS
    // 3. No chunks created (if chunks exist, it's progressing)
    const isParseStuck = parseStuckStatuses.includes(job.status) &&
      timeSinceUpdate > PARSE_STALE_MS &&
      chunkList.length === 0;

    if (isParseStuck) {
      const inactiveMin = Math.round(timeSinceUpdate / 60000);
      const watchdogMsg = `Watchdog: job stuck in "${job.status}" with NO activity for ${inactiveMin} min (no updated_at change, 0 chunks) — likely parsing hang or crash`;
      console.warn(`[v2-status] ${watchdogMsg}`);
      console.warn(`[v2-status] Last update: ${lastUpdate}, current: ${new Date(now).toISOString()}`);

      await supabase
        .from("other_agencies_import_jobs_v2")
        .update({
          status: "failed",
          error_message: watchdogMsg,
          last_checkpoint: `WATCHDOG FAILED: ${watchdogMsg}`,
          failure_reason: `No heartbeat activity for ${inactiveMin} minutes during ${job.status} phase`,
        })
        .eq("id", jobId);
      try {
        await supabase.from("other_agencies_import_events_v2").insert({
          job_id: jobId,
          event_type: "watchdog_auto_failed",
          message: watchdogMsg.substring(0, 500),
        });
      } catch { /* best effort */ }
      job.status = "failed";
      job.error_message = watchdogMsg;
    }

    let stallReason: string | null = null;
    if (isParseStuck) {
      stallReason = job.error_message;
    } else if (isStuck) {
      stallReason = "No chunks queued or processing, but not all chunks are completed/failed";
    } else if (needsResume && staleChunks > 0) {
      stallReason = `${staleChunks} chunk(s) stuck in processing > 10 min`;
    } else if (needsResume && chunkSummary.queued > 0 && chunkSummary.processing === 0) {
      stallReason = `${chunkSummary.queued} chunk(s) queued but no workers are processing`;
    }

    let progressPct = 0;
    if (job.status === "staged") progressPct = 5;
    else if (job.status === "parsing") progressPct = 15;
    else if (job.status === "chunking") progressPct = 25;
    else if (job.status === "processing" && job.chunks_total > 0) {
      progressPct = 25 + Math.floor((job.chunks_processed / job.chunks_total) * 70);
    } else if (job.status === "completed" || job.status === "partial_success") progressPct = 100;
    else if (job.status === "failed") progressPct = 0;

    const auditSummary = {
      is_dry_run: job.is_dry_run ?? false,
      agencies_real_updated: job.agencies_real_updated ?? 0,
      agencies_noop_updated: job.agencies_noop_updated ?? 0,
      match_domain_cross_state: job.match_domain_cross_state ?? 0,
      match_domain_same_state: job.match_domain_same_state ?? 0,
      match_phone_same_state: job.match_phone_same_state ?? 0,
      match_name_same_state: job.match_name_same_state ?? 0,
      suspicious_matches_count: job.suspicious_matches_count ?? 0,
    };

    return json({
      ok: true,
      job: { ...job, progress_pct: progressPct },
      chunks: chunkList,
      chunk_summary: chunkSummary,
      stale_chunks: staleChunks,
      is_stuck: isStuck,
      is_parse_stuck: isParseStuck,
      needs_resume: needsResume,
      stall_reason: stallReason,
      last_chunk_completed_at: lastCompletedChunk?.completed_at ?? null,
      last_chunk_claimed_at: lastClaimedChunk?.started_at ?? null,
      last_dispatch_event: lastDispatchEvent ? { event_type: lastDispatchEvent.event_type, message: lastDispatchEvent.message, created_at: lastDispatchEvent.created_at } : null,
      last_worker_fail_event: lastWorkerFailEvent ? { event_type: lastWorkerFailEvent.event_type, message: lastWorkerFailEvent.message, created_at: lastWorkerFailEvent.created_at } : null,
      events: eventList,
      audit_summary: auditSummary,
      suspicious_samples: suspiciousSamples ?? [],
    });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    return json({ error: "INTERNAL_ERROR", message: msg }, 500);
  }
});

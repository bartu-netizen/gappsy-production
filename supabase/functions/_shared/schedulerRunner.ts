// Scheduler execution core: claim -> dispatch -> record -> compute next
// run. Used by BOTH scheduler-tick (the every-minute cron-triggered sweep
// of every due job) and admin-scheduler's "run now" action (one specific
// job, on demand) so there is exactly one code path for what "running a
// scheduled job" means, not two.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { computeNextCronRun, computeNextIntervalRun } from "./cronNextRun.ts";
import { getSchedulerHandler, UnknownJobTypeError } from "./schedulerRegistry.ts";
import { sendEmail } from "./emailClient.ts";

const HEARTBEAT_INTERVAL_MS = 60_000;

function backoffSeconds(consecutiveFailures: number): number {
  // 30s, 120s, 480s, capped at 15min — same shape as the crawl worker's
  // own backoff (crawlRunner.ts), for the same reason: fast-enough retry
  // for a transient blip, slow-enough to not hammer a genuinely broken
  // dependency.
  return Math.min(30 * Math.pow(4, Math.max(0, consecutiveFailures - 1)), 900);
}

function computeNextRun(job: any, from: Date): Date | null {
  if (job.schedule_type === "cron") return computeNextCronRun(job.cron_expression, from);
  if (job.schedule_type === "interval") return computeNextIntervalRun(job.interval_seconds, from);
  return null; // 'manual' — never auto-scheduled again
}

async function withHeartbeat<T>(supabase: SupabaseClient, jobId: string, workerId: string, fn: () => Promise<T>): Promise<T> {
  const intervalId = setInterval(() => {
    supabase.rpc("heartbeat_scheduled_job", { p_job_id: jobId, p_worker_id: workerId }).then(() => {}, () => {});
  }, HEARTBEAT_INTERVAL_MS);
  try {
    return await fn();
  } finally {
    clearInterval(intervalId);
  }
}

export interface ExecuteResult {
  job_key: string;
  status: "success" | "failed";
  duration_ms: number;
  result?: Record<string, unknown>;
  error?: string;
}

// Runs ONE already-claimed scheduled_jobs row end to end: records a
// scheduled_job_runs row, dispatches to its handler, records the outcome,
// releases the lease, and computes the job's next next_run_at (including
// backoff on failure, bounded by max_retries).
export async function executeScheduledJob(
  supabase: SupabaseClient,
  supabaseUrl: string,
  anonKey: string,
  job: any,
  triggeredBy: "cron" | "manual" | "retry",
): Promise<ExecuteResult> {
  const workerId = job.worker_id as string;
  const startedAt = new Date();

  const { data: runRow, error: runInsertError } = await supabase
    .from("scheduled_job_runs")
    .insert({
      scheduled_job_id: job.id,
      status: "running",
      triggered_by: triggeredBy,
      attempt: (job.consecutive_failures || 0) + 1,
      worker_id: workerId,
      started_at: startedAt.toISOString(),
    })
    .select("id")
    .single();
  if (runInsertError) throw new Error(`Failed to record scheduled_job_runs row: ${runInsertError.message}`);

  let outcome: ExecuteResult;
  try {
    const handler = getSchedulerHandler(job.job_type as string);
    const result = await withHeartbeat(supabase, job.id, workerId, () =>
      handler({ supabase, supabaseUrl, anonKey, config: (job.config as Record<string, unknown>) || {} }));
    outcome = { job_key: job.job_key, status: "success", duration_ms: Date.now() - startedAt.getTime(), result };
  } catch (err) {
    const message = err instanceof UnknownJobTypeError ? err.message : (err instanceof Error ? err.message : "Unknown scheduler error");
    outcome = { job_key: job.job_key, status: "failed", duration_ms: Date.now() - startedAt.getTime(), error: message };
  }

  const completedAt = new Date();
  await supabase.from("scheduled_job_runs").update({
    status: outcome.status,
    completed_at: completedAt.toISOString(),
    duration_ms: outcome.duration_ms,
    error_message: outcome.error || null,
    result: outcome.result || {},
  }).eq("id", runRow.id);

  const consecutiveFailures = outcome.status === "success" ? 0 : (job.consecutive_failures || 0) + 1;
  const maxRetries = job.max_retries ?? 3;
  let nextRunAt: Date | null;
  if (job.schedule_type === "manual") {
    // A manual-only job never auto-schedules itself again, on success OR
    // failure — it only ever runs again when a human clicks Run Now.
    nextRunAt = null;
  } else if (outcome.status === "failed" && consecutiveFailures <= maxRetries) {
    // Bounded retry: come back sooner than the normal schedule, with
    // backoff. Once consecutive_failures exceeds max_retries, stop
    // retrying early and fall back to the job's normal cadence — a
    // permanently-broken job re-tries forever on ITS OWN schedule (not a
    // tight loop), while consecutive_failures stays visible in the admin
    // UI until a human fixes the underlying cause and it succeeds again.
    nextRunAt = new Date(completedAt.getTime() + backoffSeconds(consecutiveFailures) * 1000);
  } else {
    nextRunAt = computeNextRun(job, completedAt);
  }

  await supabase.from("scheduled_jobs").update({
    worker_id: null,
    lease_expires_at: null,
    heartbeat_at: null,
    last_run_at: startedAt.toISOString(),
    last_status: outcome.status,
    last_duration_ms: outcome.duration_ms,
    last_error: outcome.error || null,
    consecutive_failures: consecutiveFailures,
    next_run_at: nextRunAt ? nextRunAt.toISOString() : null,
    // Re-arm the stale-job watchdog: the job actually ran (success or
    // failure), so it is no longer silently stuck — the next overdue
    // episode, if any, deserves its own fresh alert.
    stale_alert_sent_at: null,
    updated_at: completedAt.toISOString(),
  }).eq("id", job.id).eq("worker_id", workerId);

  return outcome;
}

export interface TickSummary {
  claimed: number;
  results: ExecuteResult[];
  released: number;
}

// Network/crawl/API-heavy job types that have been directly observed
// crashing the WHOLE isolate (WORKER_RESOURCE_LIMIT-style) when more than
// one of them executes in the same edge function invocation — even
// sequentially, even with per-job wall-clock budgets already in place (see
// the 2026-07-22 incident: email_discovery_scan + change_detection_scan
// kept getting claimed and killed together, repeatedly, after both fixes
// were deployed). Running them ONE PER TICK, with any extras released back
// for the next minute's tick (a genuinely separate invocation/isolate), is
// the only thing that has actually stopped the recurring crash.
const HEAVY_JOB_TYPES = new Set([
  "email_discovery_scan",
  "discovered_tool_email_scan",
  "change_detection_scan",
  "stale_source_retry",
  "listclean_queue_drain",
]);

// Every-minute sweep: claim every due job in one atomic call. At most ONE
// heavy job type (see HEAVY_JOB_TYPES) actually runs this tick — any
// others are released immediately (claim given up, next_run_at left due)
// so the next cron tick, a separate invocation, picks them up instead of
// stacking their resource use inside this one. Non-heavy jobs always run
// alongside the single heavy job, same as before.
const STALE_ALERT_RECIPIENT = "bartu@gappsy.com";

// Watchdog: catches ANY enabled job that has gone significantly overdue for
// ANY reason (a future, still-unknown bug — not just the heavy-job
// starvation this accompanies) and self-heals it within this same tick
// instead of it silently sitting broken until someone happens to query
// scheduled_jobs by hand, which is exactly how stale_source_retry's
// 100+-minute starvation was originally found. "Significantly overdue" =
// worse than 2x its own interval AND at least 5 minutes, so normal tick
// jitter on fast jobs never trips it. stale_alert_sent_at (cleared whenever
// the job actually completes a run — see executeScheduledJob) makes this
// fire once per stale episode, not every minute.
async function healStaleJobs(supabase: SupabaseClient): Promise<void> {
  const { data: jobs, error } = await supabase
    .from("scheduled_jobs")
    .select("id, job_type, interval_seconds, next_run_at, last_error, consecutive_failures")
    .eq("enabled", true)
    .not("next_run_at", "is", null)
    .is("stale_alert_sent_at", null);
  if (error || !jobs || jobs.length === 0) return;

  const now = Date.now();
  const stale = (jobs as any[]).filter((j) => {
    const overdueMs = now - new Date(j.next_run_at).getTime();
    const thresholdMs = Math.max((j.interval_seconds || 0) * 2, 300) * 1000;
    return overdueMs > thresholdMs;
  });
  if (stale.length === 0) return;

  // Force back into eligibility immediately (also clears any phantom lease
  // state) and mark alerted so this doesn't re-fire every minute until the
  // job actually runs again.
  await supabase.from("scheduled_jobs")
    .update({ next_run_at: new Date(now).toISOString(), worker_id: null, lease_expires_at: null, heartbeat_at: null, stale_alert_sent_at: new Date(now).toISOString() })
    .in("id", stale.map((j) => j.id));

  const lines = stale.map((j) => {
    const overdueMin = Math.round((now - new Date(j.next_run_at).getTime()) / 60000);
    return `- ${j.job_type}: ${overdueMin} min overdue (consecutive_failures=${j.consecutive_failures ?? 0}${j.last_error ? `, last_error="${j.last_error}"` : ""}) — forced to re-run this tick`;
  });

  try {
    await sendEmail({
      to: STALE_ALERT_RECIPIENT,
      subject: `Gappsy scheduler: ${stale.length} job(s) were stuck, auto-recovered`,
      text: `The scheduler watchdog found the following job(s) far overdue and forced them back into the run queue:\n\n${lines.join("\n")}\n\nThis is automatic — no action needed unless the same job type keeps reappearing, which would point at a real failure in that job rather than a one-off scheduling fluke.`,
    });
  } catch (err) {
    console.error("[schedulerRunner] Failed to send stale-job alert email:", err);
  }
}

export async function tickScheduler(supabase: SupabaseClient, supabaseUrl: string, anonKey: string): Promise<TickSummary> {
  try {
    await healStaleJobs(supabase);
  } catch (err) {
    console.error("[schedulerRunner] healStaleJobs failed:", err);
  }

  const workerId = `tick-${crypto.randomUUID()}`;
  const { data: claimed, error: claimError } = await supabase.rpc("claim_scheduled_jobs", { p_worker_id: workerId });
  if (claimError) throw new Error(`Failed to claim scheduled jobs: ${claimError.message}`);
  if (!claimed || claimed.length === 0) return { claimed: 0, results: [], released: 0 };

  // claim_scheduled_jobs()'s SQL orders its SELECT ... FOR UPDATE subquery by
  // priority DESC, next_run_at ASC, but that only controls lock-acquisition
  // order — Postgres does NOT guarantee an UPDATE ... RETURNING * preserves a
  // subquery's ORDER BY in its output. Without re-sorting here, "the most
  // overdue heavy job wins the one-per-tick slot" silently never held: heavy
  // jobs got the budget in whatever row order Postgres happened to return,
  // every tick, forever — starving any heavy job that consistently lost that
  // undefined ordering (observed: stale_source_retry, hourly, perpetually
  // starved by 60s-interval heavy jobs, for 2+ hours straight).
  const claimedOrdered = (claimed as any[]).slice().sort((a, b) => {
    if (a.priority !== b.priority) return b.priority - a.priority;
    return new Date(a.next_run_at).getTime() - new Date(b.next_run_at).getTime();
  });

  let heavyBudgetUsed = false;
  const toRun: any[] = [];
  const toRelease: any[] = [];
  for (const job of claimedOrdered) {
    if (HEAVY_JOB_TYPES.has(job.job_type as string)) {
      if (heavyBudgetUsed) { toRelease.push(job); continue; }
      heavyBudgetUsed = true;
    }
    toRun.push(job);
  }

  if (toRelease.length > 0) {
    await supabase.from("scheduled_jobs")
      .update({ worker_id: null, lease_expires_at: null, heartbeat_at: null })
      .in("id", toRelease.map((j) => j.id))
      .eq("worker_id", workerId); // only release rows this same tick actually claimed, never someone else's
  }

  const results: ExecuteResult[] = [];
  for (const job of toRun) {
    try {
      results.push(await executeScheduledJob(supabase, supabaseUrl, anonKey, job, "cron"));
    } catch {
      // executeScheduledJob already records failure state on the job row
      // itself before it would ever throw past that point — a throw here
      // only happens on something even earlier (e.g. the scheduled_job_runs
      // insert itself failing), and must never abort the rest of the batch.
    }
  }
  return { claimed: claimed.length, results, released: toRelease.length };
}

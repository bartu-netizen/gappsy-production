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
    updated_at: completedAt.toISOString(),
  }).eq("id", job.id).eq("worker_id", workerId);

  return outcome;
}

export interface TickSummary {
  claimed: number;
  results: ExecuteResult[];
}

// The every-minute sweep: claim every due job in one atomic call, then run
// them all concurrently (they're independent job_types with their own
// internal concurrency controls, e.g. crawl_queue_drain already self-limits
// via crawl_settings — there's no shared budget to protect across
// scheduled_jobs the way there is across crawl_jobs).
export async function tickScheduler(supabase: SupabaseClient, supabaseUrl: string, anonKey: string): Promise<TickSummary> {
  const workerId = `tick-${crypto.randomUUID()}`;
  const { data: claimed, error: claimError } = await supabase.rpc("claim_scheduled_jobs", { p_worker_id: workerId });
  if (claimError) throw new Error(`Failed to claim scheduled jobs: ${claimError.message}`);
  if (!claimed || claimed.length === 0) return { claimed: 0, results: [] };

  const results = await Promise.allSettled(
    (claimed as any[]).map((job) => executeScheduledJob(supabase, supabaseUrl, anonKey, job, "cron")),
  );
  return {
    claimed: claimed.length,
    results: results.filter((r): r is PromiseFulfilledResult<ExecuteResult> => r.status === "fulfilled").map((r) => r.value),
  };
}

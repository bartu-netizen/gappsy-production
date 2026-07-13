// Job-type dispatch registry for the scheduler. Adding a new schedulable
// operation is: write one handler here, add one row to scheduled_jobs (via
// admin-scheduler or a migration). Every handler reuses the exact same
// underlying logic the corresponding manual admin action already calls —
// nothing here reimplements Discovery, Crawl4AI, or AI enrichment; it only
// decides WHEN to call what already exists.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { drainCrawlQueue } from "./crawlRunner.ts";
import { runProvider } from "./discoveryProviderRunner.ts";
import { getProvider } from "./discoveryProviders/registry.ts";
import { ProviderNotImplementedError } from "./discoveryProviders/types.ts";
import { computeCompleteness } from "./toolCompleteness.ts";
import { attachToolCategories, fetchCompletenessRelations, buildCompletenessInput, computeQualityScore } from "./toolCompletenessRelations.ts";

export interface SchedulerJobContext {
  supabase: SupabaseClient;
  supabaseUrl: string;
  anonKey: string;
  config: Record<string, unknown>;
}

export type SchedulerJobHandler = (ctx: SchedulerJobContext) => Promise<Record<string, unknown>>;

const SCHEDULE_FREQUENCY_MS: Record<string, number> = {
  hourly: 60 * 60 * 1000,
  daily: 24 * 60 * 60 * 1000,
  weekly: 7 * 24 * 60 * 60 * 1000,
};

// Runs every enabled + implemented discovery provider that is "due" per
// its OWN schedule_frequency (discovery_providers.schedule_frequency —
// hourly/daily/weekly/manual, a column that already existed before this
// scheduler but was never actually wired to anything automatic).
// 'manual' providers are only ever run from the admin "Run" button, never
// from here.
async function discoveryRefreshHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase } = ctx;
  const { data: providers, error } = await supabase
    .from("discovery_providers")
    .select("id, key, enabled, implemented, config, rate_limit_per_run, schedule_frequency")
    .eq("enabled", true)
    .eq("implemented", true)
    .neq("schedule_frequency", "manual");
  if (error) throw new Error(`Failed to list discovery providers: ${error.message}`);

  const results: Record<string, unknown>[] = [];
  for (const row of (providers || []) as any[]) {
    const frequencyMs = SCHEDULE_FREQUENCY_MS[row.schedule_frequency as string];
    if (!frequencyMs) continue; // unknown/unsupported frequency — skip, don't guess

    const { data: lastRun } = await supabase
      .from("discovery_provider_runs")
      .select("started_at")
      .eq("provider_id", row.id)
      .order("started_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    const dueAt = lastRun ? new Date(lastRun.started_at).getTime() + frequencyMs : 0;
    if (Date.now() < dueAt) {
      results.push({ provider_key: row.key, skipped: true, reason: "not due yet" });
      continue;
    }

    let provider;
    try {
      provider = getProvider(row.key as string);
    } catch (err) {
      results.push({ provider_key: row.key, skipped: true, reason: err instanceof ProviderNotImplementedError ? err.message : "provider lookup failed" });
      continue;
    }

    const summary = await runProvider(
      supabase, provider,
      { id: row.id, key: row.key, config: row.config || {}, rate_limit_per_run: row.rate_limit_per_run },
      "scheduled", null,
    );
    results.push({ provider_key: row.key, ran: true, status: summary.status, candidates_created: summary.candidates_created });
  }
  return { providers_checked: (providers || []).length, results };
}

// Drains crawl_jobs up to crawl_settings.max_concurrent_crawls. This is
// now the PRIMARY driver of crawl throughput — previously only fired via
// EdgeRuntime.waitUntil after a discovery approve/bulk-approve call, or the
// manual "Process Queue" button.
async function crawlQueueDrainHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const summary = await drainCrawlQueue(ctx.supabase, ctx.supabaseUrl, ctx.anonKey);
  return { processed: summary.processed };
}

// Safety net for a gap in bottleneck #1's own reclaim logic: claim_crawl_jobs
// reclaims a crashed in-flight job and bumps `attempt` every time, but that
// reclaim path has no ceiling of its own (only a CLEAN failure return
// through maybeScheduleAutoRetry checks max_auto_retries). A job whose
// worker keeps crashing outright (not returning a normal failure) could
// otherwise be reclaimed forever. This sweeps crawl_jobs stuck in an
// in-flight status with a long-expired lease AND attempt >= max_auto_retries,
// and terminally fails them so they stop being reclaimed and become visible
// for manual investigation instead.
async function crawlLeaseCleanupHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase } = ctx;
  const { data: settings } = await supabase.from("crawl_settings").select("max_auto_retries").eq("id", true).maybeSingle();
  const maxAutoRetries = settings?.max_auto_retries ?? 3;

  const staleThreshold = new Date(Date.now() - 30 * 60 * 1000).toISOString(); // lease expired > 30 min ago
  const { data: stuck, error } = await supabase
    .from("crawl_jobs")
    .select("id, attempt, discovery_candidate_id")
    .in("status", ["starting", "crawling", "extracting"])
    .not("lease_expires_at", "is", null)
    .lte("lease_expires_at", staleThreshold)
    .gte("attempt", maxAutoRetries);
  if (error) throw new Error(`Failed to query stuck crawl_jobs: ${error.message}`);

  const ids = ((stuck || []) as any[]).map((r) => r.id);
  if (ids.length === 0) return { swept: 0 };

  const nowIso = new Date().toISOString();
  const { error: updateError } = await supabase
    .from("crawl_jobs")
    .update({
      status: "failed",
      error_code: "stuck_lease_cleanup",
      error_message: `Worker repeatedly crashed processing this job (reclaimed ${maxAutoRetries}+ times without a clean completion or failure); marked failed by the scheduled lease cleanup.`,
      completed_at: nowIso,
      worker_id: null,
      lease_expires_at: null,
      updated_at: nowIso,
    })
    .in("id", ids);
  if (updateError) throw new Error(`Failed to terminally fail stuck crawl_jobs: ${updateError.message}`);

  return { swept: ids.length, job_ids: ids };
}

// Read-only. Never calls an AI provider, never mutates enrichment_jobs —
// bottleneck #3 (AI API automation) is explicitly out of scope for this
// phase. Only reports how many jobs are stuck so a human has visibility
// without visiting every batch manually.
async function enrichmentStuckSweepHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase } = ctx;
  const staleThreshold = new Date(Date.now() - 48 * 60 * 60 * 1000).toISOString();
  const { data: stuck, error } = await supabase
    .from("enrichment_jobs")
    .select("id, status, updated_at")
    .in("status", ["queued", "exported"])
    .lte("updated_at", staleThreshold);
  if (error) throw new Error(`Failed to query stuck enrichment_jobs: ${error.message}`);

  const byStatus: Record<string, number> = {};
  for (const row of (stuck || []) as any[]) byStatus[row.status] = (byStatus[row.status] || 0) + 1;
  return { stuck_count: (stuck || []).length, by_status: byStatus };
}

// Editorial Platform: keeps tools.completeness_percent / quality_score /
// last_scored_at fresh without recomputing on every dashboard/list read.
// Bounded to config.batch_size per run (default 200) via
// get_dirty_tools_for_scoring (last_scored_at IS NULL OR updated_at >
// last_scored_at) — a change now shows an updated score within one tick,
// not instantly, which is the right tradeoff for a cached aggregate.
// Individual per-row updates (not a bulk upsert) so a partial batch
// failure never risks touching unrelated tool columns.
async function completenessRescanHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase, config } = ctx;
  const batchSize = typeof config.batch_size === "number" && config.batch_size > 0 ? Math.min(config.batch_size, 1000) : 200;

  const { data: dirtyRows, error: dirtyError } = await supabase.rpc("get_dirty_tools_for_scoring", { p_limit: batchSize });
  if (dirtyError) throw new Error(`Failed to find tools needing rescore: ${dirtyError.message}`);
  const toolIds = ((dirtyRows || []) as any[]).map((r) => r.id as string);
  if (toolIds.length === 0) return { rescored: 0 };

  const { data: tools, error: toolsError } = await supabase
    .from("tools")
    .select("id, name, slug, website, short_description, long_description, seo_meta_description, seo_title, pricing_model, status, logo, sitemap_eligible, updated_at")
    .in("id", toolIds);
  if (toolsError) throw new Error(`Failed to load tools for rescoring: ${toolsError.message}`);

  const categoriesMap = await attachToolCategories(supabase, toolIds);
  const relations = await fetchCompletenessRelations(supabase, toolIds);
  const nowIso = new Date().toISOString();

  const outcomes = await Promise.allSettled(
    ((tools || []) as any[]).map(async (tool) => {
      const categoryCount = ((categoriesMap.get(tool.id) || []) as any[]).length;
      const completeness = computeCompleteness(buildCompletenessInput(tool, categoryCount, relations));
      const qualityScore = computeQualityScore(completeness.percent, tool.updated_at);
      const { error } = await supabase
        .from("tools")
        .update({ completeness_percent: completeness.percent, quality_score: qualityScore, last_scored_at: nowIso })
        .eq("id", tool.id);
      if (error) throw new Error(`${tool.id}: ${error.message}`);
    }),
  );
  const failed = outcomes.filter((o) => o.status === "rejected").length;

  return { rescored: (tools || []).length - failed, failed };
}

const REGISTRY: Record<string, SchedulerJobHandler> = {
  discovery_refresh: discoveryRefreshHandler,
  crawl_queue_drain: crawlQueueDrainHandler,
  crawl_lease_cleanup: crawlLeaseCleanupHandler,
  enrichment_stuck_sweep: enrichmentStuckSweepHandler,
  completeness_rescan: completenessRescanHandler,
};

export class UnknownJobTypeError extends Error {
  constructor(jobType: string) {
    super(`No handler registered for job_type "${jobType}"`);
  }
}

export function getSchedulerHandler(jobType: string): SchedulerJobHandler {
  const handler = REGISTRY[jobType];
  if (!handler) throw new UnknownJobTypeError(jobType);
  return handler;
}

export function listRegisteredJobTypes(): string[] {
  return Object.keys(REGISTRY);
}

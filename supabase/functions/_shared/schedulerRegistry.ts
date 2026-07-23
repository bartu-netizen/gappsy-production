// Job-type dispatch registry for the scheduler. Adding a new schedulable
// operation is: write one handler here, add one row to scheduled_jobs (via
// admin-scheduler or a migration). Every handler reuses the exact same
// underlying logic the corresponding manual admin action already calls —
// nothing here reimplements Discovery, Crawl4AI, or AI enrichment; it only
// decides WHEN to call what already exists.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
// NOTE: crawlRunner.ts, discoveryProviderRunner.ts, discoveryProviders/*
// and toolCompletenessRelations.ts are deliberately imported LAZILY
// (dynamic `await import(...)` inside the one handler that needs each),
// not statically here. This file is the scheduler-tick/admin-scheduler
// entrypoint's module graph root — every job type's dependencies used to
// load eagerly on EVERY invocation regardless of which single job type was
// actually due that tick. That fixed startup cost, stacked on top of even
// one real crawl's response buffering, was directly confirmed (via a
// side-by-side diagnostic function with a minimal import graph) to be
// what tipped email_discovery_scan into WORKER_RESOURCE_LIMIT on
// 2026-07-22 — the crawl itself was never the problem. Keep new heavy,
// single-handler-only dependencies lazy the same way; only import
// statically here what's small or shared across multiple handlers.
import type { PageType } from "./changeDetection.ts";
import { processDueCheck } from "./changeDetectionRunner.ts";
import { validateCrawlUrl, CRAWL_LIMITS } from "./crawlUrlSafety.ts";
import { callCrawlerGateway, GatewayError } from "./crawlGatewayClient.ts";
import { extractContactEmails } from "./emailExtraction.ts";
import { listcleanVerifyBatch, listcleanGetList, listcleanDownloadListJson, mapListCleanStatusToInternal } from "./listcleanClient.ts";
import { syncValidEmailsToSmartlead } from "./smartleadSync.ts";

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
  const { getProvider } = await import("./discoveryProviders/registry.ts");
  const { ProviderNotImplementedError } = await import("./discoveryProviders/types.ts");
  const { runProvider } = await import("./discoveryProviderRunner.ts");
  const { data: providers, error } = await supabase
    .from("discovery_providers")
    .select("id, key, enabled, implemented, config, rate_limit_per_run, schedule_frequency, last_cursor")
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
      { id: row.id, key: row.key, config: row.config || {}, rate_limit_per_run: row.rate_limit_per_run, last_cursor: row.last_cursor ?? null },
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
  const { drainCrawlQueue } = await import("./crawlRunner.ts");
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
  const { computeCompleteness } = await import("./toolCompleteness.ts");
  const { attachToolCategories, fetchCompletenessRelations, buildCompletenessInput, computeQualityScore } = await import("./toolCompletenessRelations.ts");
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

const CHANGE_DETECTION_CREATED_BY = "system:change-detection";
const DEFAULT_CHANGE_SCAN_BATCH_SIZE = 50;
const DEFAULT_CHECK_INTERVAL_HOURS = 24;
const DEFAULT_STALE_BATCH_SIZE = 20;
const DEFAULT_BACKOFF_HOURS = 168; // 7 days

interface ChangeRuleRow { recrawl_on_meaningful: boolean; recrawl_on_critical: boolean; min_changed_items_for_critical: number }

async function loadChangeDetectionRules(supabase: SupabaseClient): Promise<Map<string, ChangeRuleRow>> {
  const { data, error } = await supabase
    .from("change_detection_rules")
    .select("page_type, recrawl_on_meaningful, recrawl_on_critical, min_changed_items_for_critical")
    .eq("enabled", true);
  if (error) throw new Error(`Failed to load change_detection_rules: ${error.message}`);
  const map = new Map<string, ChangeRuleRow>();
  for (const row of (data || []) as any[]) {
    map.set(row.page_type, {
      recrawl_on_meaningful: row.recrawl_on_meaningful,
      recrawl_on_critical: row.recrawl_on_critical,
      min_changed_items_for_critical: row.min_changed_items_for_critical,
    });
  }
  return map;
}

// Lightweight change checks + bounded recrawl enqueue (Phase 5). Scans a
// bounded batch of (tool, page_type) pairs selected by
// select_due_change_checks() — new pairs get a first snapshot, existing
// ones recheck once config.check_interval_hours has passed — classifies
// each via changeDetection.ts (see that file + changeDetectionRunner.ts),
// and enqueues a recrawl only on a fresh meaningful/critical transition.
// Self-limits via config.batch_size, same "each job_type self-limits"
// pattern as crawl_queue_drain — existing Plesk websites and crawler
// limits stay protected since this never exceeds one bounded batch per
// tick, independent of crawl_queue_drain's own concurrency cap.
// Unlike email_discovery_scan, this handler previously had no overall
// wall-clock budget at all — just a sequential loop over up to
// DEFAULT_CHANGE_SCAN_BATCH_SIZE (50) items, each with its own bounded
// fetch (fetchPageSafely's own 15s timeout). A batch containing several
// genuinely slow/unresponsive sites could legitimately run for minutes in
// one invocation with nothing to stop it — a real contributor to the
// 2026-07-22 stuck-job incidents (change_detection_scan was one of the
// jobs found stuck alongside email_discovery_scan). Same fix as that job:
// a between-item budget check so the handler always returns well inside
// the platform's own execution ceiling, leaving whatever's left for the
// next tick instead of risking the whole invocation getting killed mid-run.
const CHANGE_SCAN_TICK_BUDGET_MS = 40_000;

async function changeDetectionScanHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase, config } = ctx;
  const batchSize = typeof config.batch_size === "number" && config.batch_size > 0 ? Math.min(config.batch_size, 500) : DEFAULT_CHANGE_SCAN_BATCH_SIZE;
  const checkIntervalHours = typeof config.check_interval_hours === "number" && config.check_interval_hours > 0 ? config.check_interval_hours : DEFAULT_CHECK_INTERVAL_HOURS;
  const tickStartedAt = Date.now();

  const rules = await loadChangeDetectionRules(supabase);
  const { data: due, error } = await supabase.rpc("select_due_change_checks", { p_batch_size: batchSize, p_check_interval_hours: checkIntervalHours });
  if (error) throw new Error(`Failed to select due change checks: ${error.message}`);

  let checked = 0, changed = 0, unavailable = 0, recrawlsQueued = 0, recrawlsSkipped = 0, stoppedEarly = false;
  for (const row of (due || []) as any[]) {
    if (Date.now() - tickStartedAt > CHANGE_SCAN_TICK_BUDGET_MS) {
      stoppedEarly = true;
      break; // out of budget for this tick — the rest stay due for the next one
    }
    const rule = rules.get(row.page_type as string);
    if (!rule) continue; // page_type disabled after this row was selected -- skip, don't guess
    const outcome = await processDueCheck(
      supabase,
      {
        tool_id: row.tool_id, website: row.website, page_type: row.page_type as PageType,
        pricing_page_url: row.pricing_page_url ?? null, is_first_snapshot: row.is_first_snapshot,
        previous_content_fingerprint: row.previous_content_fingerprint ?? null,
        previous_extracted_fingerprint: row.previous_extracted_fingerprint ?? null,
      },
      rule,
      CHANGE_DETECTION_CREATED_BY,
    );
    checked++;
    if (outcome.severity === "meaningful" || outcome.severity === "critical") changed++;
    if (outcome.severity === "unavailable") unavailable++;
    if (outcome.recrawlQueued) recrawlsQueued++;
    else if (outcome.recrawlSkippedReason) recrawlsSkipped++;
  }

  return { checked, changed, unavailable, recrawls_queued: recrawlsQueued, recrawls_skipped: recrawlsSkipped, batch_size: batchSize, stopped_early: stoppedEarly };
}

// Stale/dead source retry (Phase 5). The backed-off set from
// select_stale_change_checks() — pages whose consecutive_failures reached
// change_detection_rules.max_consecutive_failures_before_backoff — retried
// only every config.backoff_hours (default 7 days) instead of the main
// scan's normal cadence, so a permanently-dead source doesn't keep
// consuming the main scan's batch budget every run while still eventually
// noticing if the source comes back (consecutive_failures resets to 0 on
// the next successful fetch inside processDueCheck, which naturally
// returns the row to the main scan's normal-cadence pool).
async function staleSourceRetryHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase, config } = ctx;
  const batchSize = typeof config.batch_size === "number" && config.batch_size > 0 ? Math.min(config.batch_size, 200) : DEFAULT_STALE_BATCH_SIZE;
  const backoffHours = typeof config.backoff_hours === "number" && config.backoff_hours > 0 ? config.backoff_hours : DEFAULT_BACKOFF_HOURS;

  const rules = await loadChangeDetectionRules(supabase);
  const { data: stale, error } = await supabase.rpc("select_stale_change_checks", { p_batch_size: batchSize, p_backoff_hours: backoffHours });
  if (error) throw new Error(`Failed to select stale change checks: ${error.message}`);

  const tickStartedAt = Date.now();
  let retried = 0, recovered = 0, stoppedEarly = false;
  for (const row of (stale || []) as any[]) {
    if (Date.now() - tickStartedAt > CHANGE_SCAN_TICK_BUDGET_MS) {
      stoppedEarly = true;
      break; // out of budget for this tick — same bounded-batch pattern as changeDetectionScanHandler
    }
    const rule = rules.get(row.page_type as string);
    if (!rule) continue;
    const outcome = await processDueCheck(
      supabase,
      {
        tool_id: row.tool_id, website: row.website, page_type: row.page_type as PageType,
        pricing_page_url: row.pricing_page_url ?? null, is_first_snapshot: false,
        previous_content_fingerprint: row.previous_content_fingerprint ?? null,
        previous_extracted_fingerprint: row.previous_extracted_fingerprint ?? null,
      },
      rule,
      CHANGE_DETECTION_CREATED_BY,
    );
    retried++;
    if (outcome.severity !== "unavailable") recovered++;
  }

  return { retried, recovered, batch_size: batchSize, stopped_early: stoppedEarly };
}

const CANONICAL_DOMAIN = "gappsy.com";
const INDEXNOW_ENDPOINT = "https://api.indexnow.org/indexnow";
const INDEXNOW_BATCH_SIZE = 1000;

// Notifies Bing/Yandex/Seznam/Naver (IndexNow-participating engines —
// Google does not consume IndexNow) about tools/categories/comparisons
// that are new or changed since the last successful submission, so those
// engines don't have to wait for their own crawl scheduler to revisit the
// sitemap. Watermark-based (indexnow_settings.last_submitted_at) rather
// than resubmitting the whole catalog every run, same "only the delta"
// shape as completenessRescanHandler above.
async function indexnowSubmitHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase } = ctx;
  const { data: settings, error: settingsError } = await supabase
    .from("indexnow_settings")
    .select("api_key, last_submitted_at")
    .eq("id", true)
    .maybeSingle();
  if (settingsError) throw new Error(`Failed to load indexnow_settings: ${settingsError.message}`);
  if (!settings?.api_key) return { skipped: true, reason: "no IndexNow key configured" };

  const since = settings.last_submitted_at;
  const runStartedAt = new Date().toISOString();

  const buildQuery = (table: string, extra?: (q: any) => any) => {
    let q = supabase.from(table).select("slug, updated_at").eq("status", "published");
    if (extra) q = extra(q);
    if (since) q = q.gt("updated_at", since);
    return q;
  };

  const [toolsResult, categoriesResult, comparisonsResult, groupComparisonsResult] = await Promise.all([
    buildQuery("tools"),
    buildQuery("tool_categories"),
    buildQuery("tool_comparisons"),
    buildQuery("tool_group_comparisons"),
  ]);
  for (const [label, result] of [
    ["tools", toolsResult], ["tool_categories", categoriesResult],
    ["tool_comparisons", comparisonsResult], ["tool_group_comparisons", groupComparisonsResult],
  ] as const) {
    if (result.error) throw new Error(`Failed to load ${label} for IndexNow: ${result.error.message}`);
  }

  const urls = [
    ...((toolsResult.data || []) as any[]).map((t) => `https://${CANONICAL_DOMAIN}/tools/${t.slug}/`),
    ...((categoriesResult.data || []) as any[]).map((c) => `https://${CANONICAL_DOMAIN}/tool-categories/${c.slug}/`),
    ...((comparisonsResult.data || []) as any[]).map((c) => `https://${CANONICAL_DOMAIN}/compare/${c.slug}/`),
    ...((groupComparisonsResult.data || []) as any[]).map((c) => `https://${CANONICAL_DOMAIN}/compare/${c.slug}/`),
  ];

  if (urls.length === 0) return { submitted: 0, reason: "nothing changed since last submission" };

  let submitted = 0;
  for (let i = 0; i < urls.length; i += INDEXNOW_BATCH_SIZE) {
    const batch = urls.slice(i, i + INDEXNOW_BATCH_SIZE);
    const res = await fetch(INDEXNOW_ENDPOINT, {
      method: "POST",
      headers: { "Content-Type": "application/json; charset=utf-8" },
      body: JSON.stringify({
        host: CANONICAL_DOMAIN,
        key: settings.api_key,
        keyLocation: `https://${CANONICAL_DOMAIN}/${settings.api_key}.txt`,
        urlList: batch,
      }),
    });
    // IndexNow returns 200 (or 202) on success; anything else means this
    // batch didn't register, so don't advance the watermark for it — the
    // next run will retry the same delta rather than silently dropping it.
    if (!res.ok) throw new Error(`IndexNow submission failed (batch ${i / INDEXNOW_BATCH_SIZE}): ${res.status} ${await res.text().catch(() => "")}`);
    submitted += batch.length;
  }

  const { error: updateError } = await supabase
    .from("indexnow_settings")
    .update({ last_submitted_at: runStartedAt, updated_at: runStartedAt })
    .eq("id", true);
  if (updateError) throw new Error(`Failed to update indexnow_settings watermark: ${updateError.message}`);

  return { submitted, since: since || "beginning (first run)" };
}

const EMAIL_DISCOVERY_DEFAULT_BATCH_SIZE = 4;
// A single flaky attempt (gateway hiccup, momentary DNS blip) shouldn't
// permanently give up on a tool — matches crawl_settings.max_auto_retries'
// default of 3 for the same class of transient error on the sibling
// discovery/crawl pipeline. Only a genuinely invalid/unreachable site (or a
// tool that has exhausted its retries) is ever marked terminally 'failed'.
const EMAIL_DISCOVERY_MAX_ATTEMPTS = 3;

// callCrawlerGateway's own patience (GATEWAY_TIMEOUT_MS, 120s) is shared
// with the sibling discovery/crawl pipeline and is NOT safe to rely on
// here: a single slow/unresponsive site waiting out that full 120s (times
// up to 2 passes per tool) can outlast this whole tick's execution
// allowance on its own, between the between-tools budget check in
// emailDiscoveryScanHandler (which only fires BEFORE starting a new tool,
// not during one already in flight). This is exactly what silently
// stalled the job for 6 hours on 2026-07-22 — every tick got killed
// mid-crawl by the platform before it could even reach that check again.
// Racing against a much shorter timeout here means the handler always
// moves on within a bounded time, regardless of how unresponsive any one
// site is; the abandoned network call is simply left to resolve/reject on
// its own afterwards and ignored.
const PER_CALL_TIMEOUT_MS = 20_000;

// Rejects (not resolves) on timeout — a timeout is a TRANSIENT condition
// (the DNS resolver was just slow this once), so it must flow into the
// existing retry path, never get treated as "this domain permanently
// doesn't resolve."
function withTimeout<T>(promise: Promise<T>, ms: number, timeoutMessage: string): Promise<T> {
  return Promise.race([
    promise,
    new Promise<T>((_, reject) => setTimeout(() => reject(new GatewayError("local_timeout", timeoutMessage)), ms)),
  ]);
}

// Passes PER_CALL_TIMEOUT_MS straight into callCrawlerGateway as its real
// AbortController deadline (rather than racing a separate JS timer on top
// of the gateway client's own 120s abort) — see the comment on
// callCrawlerGateway's timeoutMs param for why: a merely-abandoned promise
// left the actual network request alive server-side for up to 100s longer
// than this job had already "moved on" for, stacking concurrent load on
// the shared crawler-gateway container across ticks.
async function crawlForEmails(url: string, maxPages: number, maxDepth: number) {
  const gatewayResult = await callCrawlerGateway({
    request_id: crypto.randomUUID(),
    url,
    max_pages: maxPages,
    max_depth: maxDepth,
    max_duration_ms: CRAWL_LIMITS.MAX_DURATION_MS,
  }, PER_CALL_TIMEOUT_MS);
  if (!gatewayResult.ok || !gatewayResult.data) {
    throw new GatewayError(gatewayResult.error_code || "gateway_error", gatewayResult.error || "Gateway returned an unsuccessful result.");
  }
  const raw = gatewayResult.data.raw as { results?: any[] };
  return extractContactEmails(raw.results || []);
}

// Vendor outreach: finds real, self-published contact emails (mailto:
// links + plain-text matches — see emailExtraction.ts, deliberately NOT a
// info@/hello@/support@ pattern-guesser, which produces false positives on
// catch-all domains and low reply-rates on outreach) for paid tools, by
// crawling each tool's own website through the same Crawl4AI gateway the
// discovery pipeline already uses. Scoped to is_open_source = false only —
// GitHub/open-source tools are explicitly excluded per the business call
// behind the is_open_source column (see 20260721235924).
//
// Two crawl passes per tool: the homepage (depth 2, up to 15 pages — this
// alone usually reaches a linked /contact or /about page) and, only when
// that pass finds nothing, one more pass explicitly seeded at
// "<origin>/contact" — some sites' contact page isn't within the homepage
// crawl's own priority ordering, so this is a deliberate second attempt
// rather than trusting the first pass to have found everything reachable.
//
// Runs strictly SEQUENTIALLY (no Promise.all) and in small batches: this
// shares the same 512MB/1CPU Crawl4AI container as crawl_queue_drain
// (already ticking independently every 120s), so this job deliberately
// avoids adding any concurrent load of its own on top of that.
// Each tool can cost up to two sequential gateway calls (homepage + the
// /contact fallback), each patient up to callCrawlerGateway's own
// GATEWAY_TIMEOUT_MS (120s) — a handful of slow/unresponsive sites in one
// batch can push a tick's total wall-clock time well past what an edge
// function invocation is actually allowed to run for. This happened for
// real: every tick from ~06:22 to ~12:24 on 2026-07-22 was killed
// mid-run by the platform (scheduled_job_runs stuck at status='running',
// completed_at never set), silently stalling the whole backlog for six
// hours. A self-imposed wall-clock budget makes each tick finish cleanly
// well inside that ceiling regardless of how slow individual crawls are —
// remaining tools in the batch just stay pending for the next tick.
// Tightened alongside PER_CALL_TIMEOUT_MS above: worst case is now this
// budget PLUS one tool's two capped passes (2 x 20s = 40s) before the
// handler can actually return, so a lower number here leaves real margin
// under the platform's own execution ceiling instead of running right up
// against it.
const EMAIL_DISCOVERY_TICK_BUDGET_MS = 30_000;

// Absolute last line of defense: even with the per-call (20s) and DNS
// (5s) timeouts above plus the between-tools budget check, this job
// still stalled for real on 2026-07-22 — repeated fix attempts kept
// finding one more untimed-out operation. Rather than keep chasing
// individual hang points with no direct log access to confirm which one
// is left, the ENTIRE batch loop is now raced against one hard wall-clock
// deadline: whichever finishes first wins, and the counters (mutated
// incrementally as each tool completes, in the enclosing scope) reflect
// real progress either way. If the deadline wins, whatever's still
// in-flight is simply abandoned — the handler returns, scheduler-tick's
// response goes out, and the platform recycles the invocation, which is
// far better than the function hanging until forcibly killed uncleanly.
const EMAIL_DISCOVERY_HARD_DEADLINE_MS = 45_000;

// Real crawler-gateway load test (2026-07-23, against the live server,
// bypassing the scheduler): 2/4 concurrent crawls stayed fast and 100%
// reliable, 8 concurrent still succeeded but visibly slowed (~2.4x
// latency), 12 concurrent started genuinely timing out (2/12 failed) —
// the real ceiling, not a guess. crawl_queue_drain already runs up to
// crawl_settings.max_concurrent_crawls (2) independently on this same
// gateway, so this job's own concurrency is capped well below the
// observed failure point to leave headroom for that plus real-world
// sites being slower than the fast, reliable ones used for the test —
// worst case combined load stays at 2 + 4 = 6, comfortably under where
// things start failing (12) or even meaningfully degrading (8).
const EMAIL_DISCOVERY_CRAWL_CONCURRENCY = 4;

async function emailDiscoveryScanHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase, config } = ctx;
  const batchSize = typeof config.batch_size === "number" && config.batch_size > 0
    ? Math.min(config.batch_size, 20)
    : EMAIL_DISCOVERY_DEFAULT_BATCH_SIZE;
  const tickStartedAt = Date.now();

  const { data: tools, error } = await withTimeout(
    supabase
      .from("tools")
      .select("id, slug, website, email_discovery_attempts")
      .eq("status", "published")
      .eq("is_open_source", false)
      .is("email_discovery_status", null)
      .not("website", "is", null)
      .order("id", { ascending: true })
      .limit(batchSize),
    10_000,
    "Selecting the batch of tools itself exceeded 10s"
  );
  if (error) throw new Error(`Failed to select tools for email discovery: ${error.message}`);
  if (!tools || tools.length === 0) return { processed: 0, emails_found: 0, done: 0, failed: 0, retried: 0 };

  let emailsFound = 0;
  let doneCount = 0;
  let failed = 0;
  let retried = 0;
  let stoppedEarly = false;

  async function processTool(tool: any) {
    const nowIso = new Date().toISOString();
    const markTerminal = (status: "done" | "failed") =>
      supabase.from("tools").update({ email_discovery_status: status, email_discovery_checked_at: nowIso }).eq("id", tool.id);

    const urlCheck = validateCrawlUrl(tool.website);
    if (!urlCheck.ok) {
      await markTerminal("failed"); // permanent — no crawlable URL to retry
      failed++;
      return;
    }

    // No client-side DNS/SSRF pre-check here (deliberately, unlike the
    // sibling discovery pipeline): crawler-gateway/server.js's own
    // resolvesToPublicAddress already re-validates this independently,
    // server-side, before it ever crawls anything.
    //
    // Actual confirmed root cause of the real multi-hour stall on
    // 2026-07-22 (isolated via a standalone diagnostic function invoked
    // directly, bypassing the scheduler entirely): the edge function was
    // being killed with WORKER_RESOURCE_LIMIT ("not enough compute
    // resources") — NOT a JS-level hang at all, which is why every
    // Promise.race/timeout fix here had no effect; the whole isolate was
    // being terminated by the platform's own resource governor. Crawling
    // CRAWL_LIMITS.MAX_PAGES (15) full pages of raw HTML per tool — sized
    // for the sibling discovery pipeline's much richer draft-creation
    // needs — was too much data/memory for what this job actually needs
    // (just finding emails). A 3-page, depth-1 crawl was verified directly
    // (curl against the diagnostic function) to complete cleanly in
    // ~5s with zero resource errors; kept small here for both passes.
    const SAFE_MAX_PAGES = 3;
    const SAFE_MAX_DEPTH = 1;

    try {
      const primary = await crawlForEmails(urlCheck.normalizedUrl!, SAFE_MAX_PAGES, SAFE_MAX_DEPTH);

      // Always run the /contact pass too, even when the homepage pass
      // already found an email — a site commonly publishes DIFFERENT
      // addresses on different pages (sales@ on /pricing, support@ on
      // /support, a named founder@ on /about), and every distinct one is
      // wanted, not just the first found.
      let contactPass: typeof primary = [];
      try {
        const origin = new URL(urlCheck.normalizedUrl!).origin;
        contactPass = await crawlForEmails(`${origin}/contact`, SAFE_MAX_PAGES, SAFE_MAX_DEPTH);
      } catch {
        // Best-effort only — /contact may not exist on this site at all;
        // that's not a failure of the overall attempt, just an empty pass.
      }

      const byEmail = new Map(primary.map((d) => [d.email, d]));
      for (const d of contactPass) if (!byEmail.has(d.email)) byEmail.set(d.email, d);
      const discovered = [...byEmail.values()];

      if (discovered.length > 0) {
        const rows = discovered.map((d) => ({ tool_id: tool.id, email: d.email, source_url: d.source_url, discovered_at: nowIso }));
        const { error: upsertError } = await supabase
          .from("tool_contact_emails")
          .upsert(rows, { onConflict: "tool_id,email", ignoreDuplicates: true });
        if (upsertError) throw new Error(upsertError.message);
        emailsFound += discovered.length;
      }

      await markTerminal("done"); // a completed crawl, whether or not it found an email
      doneCount++;
    } catch {
      const attempts = (tool.email_discovery_attempts || 0) + 1;
      if (attempts >= EMAIL_DISCOVERY_MAX_ATTEMPTS) {
        await markTerminal("failed"); // exhausted retries on a transient error — give up
        failed++;
      } else {
        // Leave status NULL so this tool is picked up again in a later
        // tick — only the attempt counter advances.
        await supabase.from("tools").update({ email_discovery_attempts: attempts }).eq("id", tool.id);
        retried++;
      }
    }
  }

  // Processed in bounded-concurrency waves (see EMAIL_DISCOVERY_CRAWL_CONCURRENCY
  // above) rather than one at a time — the tick/hard-deadline budgets below
  // still apply the same way, just checked between waves instead of
  // between individual tools.
  async function runBatch() {
    const toolList = tools as any[];
    for (let i = 0; i < toolList.length; i += EMAIL_DISCOVERY_CRAWL_CONCURRENCY) {
      if (Date.now() - tickStartedAt > EMAIL_DISCOVERY_TICK_BUDGET_MS) {
        stoppedEarly = true;
        break; // out of budget for this tick — the rest stay pending for the next one
      }
      const wave = toolList.slice(i, i + EMAIL_DISCOVERY_CRAWL_CONCURRENCY);
      await Promise.all(wave.map((tool) => processTool(tool)));
    }
  }

  await Promise.race([
    runBatch(),
    new Promise<void>((resolve) => setTimeout(() => { stoppedEarly = true; resolve(); }, EMAIL_DISCOVERY_HARD_DEADLINE_MS)),
  ]);

  return { processed: doneCount + failed + retried, emails_found: emailsFound, done: doneCount, failed, retried, stopped_early: stoppedEarly };
}

// Standing business rule (never time-boxed to one build): open-source /
// GitHub-native candidates never get scraped or emailed for any outreach
// campaign — they have no business model that would make them pay for a
// Gappsy listing. github_topics and github_awesome_lists are GitHub-native
// by construction; npm_registry and pypi are developer package registries
// (overwhelmingly free/open-source libraries, not commercial products).
const DISCOVERY_OSS_PROVIDER_KEYS = ["github_topics", "github_awesome_lists", "npm_registry", "pypi"];

// Second email-scraping pipeline, sibling to emailDiscoveryScanHandler
// above: same crawler-gateway approach, same safety envelope (bounded
// pages/depth, per-tick budget, hard deadline — all of which were
// hard-won fixes for real WORKER_RESOURCE_LIMIT crashes on this exact
// crawl pattern), just sourced from discovered_tools (Discovery Engine
// candidates not yet promoted to a real tools-table listing) instead of
// the published tools table.
async function discoveredToolEmailScanHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase, config } = ctx;
  const batchSize = typeof config.batch_size === "number" && config.batch_size > 0
    ? Math.min(config.batch_size, 20)
    : EMAIL_DISCOVERY_DEFAULT_BATCH_SIZE;
  const tickStartedAt = Date.now();

  const { data: excludedProviders, error: providerError } = await supabase
    .from("discovery_providers")
    .select("id")
    .in("key", DISCOVERY_OSS_PROVIDER_KEYS);
  if (providerError) throw new Error(`Failed to load excluded discovery providers: ${providerError.message}`);
  const excludedProviderIds = ((excludedProviders || []) as any[]).map((p) => p.id);

  let candidatesQuery = supabase
    .from("discovered_tools")
    .select("id, slug, official_website, email_discovery_attempts")
    .eq("status", "validated")
    .is("email_discovery_status", null)
    .not("official_website", "is", null)
    .order("id", { ascending: true })
    .limit(batchSize);
  if (excludedProviderIds.length > 0) {
    candidatesQuery = candidatesQuery.not("provider_id", "in", `(${excludedProviderIds.join(",")})`);
  }

  const { data: candidates, error } = await withTimeout(candidatesQuery, 10_000, "Selecting the batch of discovered_tools itself exceeded 10s");
  if (error) throw new Error(`Failed to select discovered_tools for email discovery: ${error.message}`);
  if (!candidates || candidates.length === 0) return { processed: 0, emails_found: 0, done: 0, failed: 0, retried: 0 };

  let emailsFound = 0;
  let doneCount = 0;
  let failed = 0;
  let retried = 0;
  let stoppedEarly = false;

  async function processCandidate(candidate: any) {
    const nowIso = new Date().toISOString();
    const markTerminal = (status: "done" | "failed") =>
      supabase.from("discovered_tools").update({ email_discovery_status: status, email_discovery_checked_at: nowIso }).eq("id", candidate.id);

    // Defensive catch-all beyond the provider filter above — some
    // non-GitHub-provider candidates could still legitimately point their
    // official_website straight at a github.com repo.
    if (/(^|\.)github\.com$/i.test(new URL(candidate.official_website, "https://x").hostname || "")) {
      await markTerminal("failed");
      failed++;
      return;
    }

    const urlCheck = validateCrawlUrl(candidate.official_website);
    if (!urlCheck.ok) {
      await markTerminal("failed");
      failed++;
      return;
    }

    const SAFE_MAX_PAGES = 3;
    const SAFE_MAX_DEPTH = 1;

    try {
      const primary = await crawlForEmails(urlCheck.normalizedUrl!, SAFE_MAX_PAGES, SAFE_MAX_DEPTH);

      let contactPass: typeof primary = [];
      try {
        const origin = new URL(urlCheck.normalizedUrl!).origin;
        contactPass = await crawlForEmails(`${origin}/contact`, SAFE_MAX_PAGES, SAFE_MAX_DEPTH);
      } catch {
        // Best-effort only — /contact may not exist at all.
      }

      const byEmail = new Map(primary.map((d) => [d.email, d]));
      for (const d of contactPass) if (!byEmail.has(d.email)) byEmail.set(d.email, d);
      const discovered = [...byEmail.values()];

      if (discovered.length > 0) {
        const rows = discovered.map((d) => ({ discovered_tool_id: candidate.id, email: d.email, source_url: d.source_url, discovered_at: nowIso }));
        const { error: upsertError } = await supabase
          .from("discovered_tool_contact_emails")
          .upsert(rows, { onConflict: "discovered_tool_id,email", ignoreDuplicates: true });
        if (upsertError) throw new Error(upsertError.message);
        emailsFound += discovered.length;
      }

      await markTerminal("done");
      doneCount++;
    } catch {
      const attempts = (candidate.email_discovery_attempts || 0) + 1;
      if (attempts >= EMAIL_DISCOVERY_MAX_ATTEMPTS) {
        await markTerminal("failed");
        failed++;
      } else {
        await supabase.from("discovered_tools").update({ email_discovery_attempts: attempts }).eq("id", candidate.id);
        retried++;
      }
    }
  }

  // Same bounded-concurrency-wave pattern as emailDiscoveryScanHandler
  // (see EMAIL_DISCOVERY_CRAWL_CONCURRENCY) — both scan jobs share the
  // one-heavy-job-per-tick slot, so only one of them is ever actually
  // crawling at a time, keeping total gateway concurrency the same either way.
  async function runBatch() {
    const candidateList = candidates as any[];
    for (let i = 0; i < candidateList.length; i += EMAIL_DISCOVERY_CRAWL_CONCURRENCY) {
      if (Date.now() - tickStartedAt > EMAIL_DISCOVERY_TICK_BUDGET_MS) {
        stoppedEarly = true;
        break;
      }
      const wave = candidateList.slice(i, i + EMAIL_DISCOVERY_CRAWL_CONCURRENCY);
      await Promise.all(wave.map((candidate) => processCandidate(candidate)));
    }
  }

  await Promise.race([
    runBatch(),
    new Promise<void>((resolve) => setTimeout(() => { stoppedEarly = true; resolve(); }, EMAIL_DISCOVERY_HARD_DEADLINE_MS)),
  ]);

  return { processed: doneCount + failed + retried, emails_found: emailsFound, done: doneCount, failed, retried, stopped_early: stoppedEarly };
}

const DISCOVERED_TOOL_LISTCLEAN_SUBMIT_BATCH_DEFAULT = 200;
const DISCOVERED_TOOL_LISTCLEAN_MAX_ATTEMPTS = 5;

// Sibling to toolEmailListcleanScanHandler below — identical two-phase
// (check-then-submit) design and vocabulary, sourced from
// discovered_tool_contact_emails instead of tool_contact_emails.
async function discoveredToolEmailListcleanScanHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase, config } = ctx;
  const submitBatchSize = typeof config.submit_batch_size === "number" && config.submit_batch_size > 0
    ? Math.min(config.submit_batch_size, 1000)
    : DISCOVERED_TOOL_LISTCLEAN_SUBMIT_BATCH_DEFAULT;

  let downloaded = 0, valid = 0, invalid = 0, retried = 0, failed = 0;

  const { data: submittedRows, error: submittedError } = await supabase
    .from("discovered_tool_contact_emails")
    .select("id, email, listclean_list_id, listclean_attempt_count")
    .eq("listclean_status", "submitted")
    .not("listclean_list_id", "is", null)
    .limit(2000);
  if (submittedError) throw new Error(`Failed to select submitted discovered_tool_contact_emails: ${submittedError.message}`);

  const rowsByListId = new Map<number, typeof submittedRows>();
  for (const row of (submittedRows || []) as any[]) {
    const list = rowsByListId.get(row.listclean_list_id) || [];
    list.push(row);
    rowsByListId.set(row.listclean_list_id, list);
  }

  for (const [listId, rows] of rowsByListId.entries()) {
    let status;
    try {
      status = await listcleanGetList(listId);
    } catch {
      continue;
    }
    const statusStr = (status.status ?? "").toLowerCase();
    const hasAnyCount = typeof status.clean_count === "number" || typeof status.dirty_count === "number" || typeof status.unknown_count === "number";
    const isComplete = ["completed", "ready", "complete", "done"].includes(statusStr) || hasAnyCount;
    if (!isComplete) continue;

    let resultMap: Map<string, { status: string }>;
    try {
      const [cleanResults, dirtyResults, unknownResults] = await Promise.all([
        listcleanDownloadListJson(listId, "clean").catch(() => []),
        listcleanDownloadListJson(listId, "dirty").catch(() => []),
        listcleanDownloadListJson(listId, "unknown").catch(() => []),
      ]);
      resultMap = new Map();
      for (const r of unknownResults) resultMap.set(r.email.toLowerCase(), r);
      for (const r of dirtyResults) resultMap.set(r.email.toLowerCase(), r);
      for (const r of cleanResults) resultMap.set(r.email.toLowerCase(), r);
    } catch {
      continue;
    }

    const nowIso = new Date().toISOString();
    for (const row of rows as any[]) {
      const result = resultMap.get(String(row.email).toLowerCase());
      const attempts = (row.listclean_attempt_count || 0) + 1;
      const externalStatus = result?.status ?? null;
      const mapped = result ? mapListCleanStatusToInternal(result.status) : "retry";

      if (mapped === "valid") {
        await supabase.from("discovered_tool_contact_emails").update({ listclean_status: "valid", listclean_external_status: externalStatus, listclean_checked_at: nowIso }).eq("id", row.id);
        valid++;
      } else if (mapped === "invalid") {
        await supabase.from("discovered_tool_contact_emails").update({ listclean_status: "invalid", listclean_external_status: externalStatus, listclean_checked_at: nowIso }).eq("id", row.id);
        invalid++;
      } else if (attempts >= DISCOVERED_TOOL_LISTCLEAN_MAX_ATTEMPTS) {
        await supabase.from("discovered_tool_contact_emails").update({ listclean_status: "failed", listclean_external_status: externalStatus, listclean_attempt_count: attempts, listclean_checked_at: nowIso }).eq("id", row.id);
        failed++;
      } else {
        await supabase.from("discovered_tool_contact_emails").update({ listclean_status: null, listclean_external_status: externalStatus, listclean_attempt_count: attempts, listclean_checked_at: nowIso, listclean_next_retry_at: listcleanNextRetryAt(attempts) }).eq("id", row.id);
        retried++;
      }
      downloaded++;
    }
  }

  const nowIsoForSubmit = new Date().toISOString();
  const { data: pending, error: pendingError } = await supabase
    .from("discovered_tool_contact_emails")
    .select("id, email")
    .is("listclean_status", null)
    .or(`listclean_next_retry_at.is.null,listclean_next_retry_at.lte.${nowIsoForSubmit}`)
    .limit(submitBatchSize);
  if (pendingError) throw new Error(`Failed to select pending discovered_tool_contact_emails: ${pendingError.message}`);

  let submitted = 0;
  if (pending && pending.length > 0) {
    const emails = [...new Set(pending.map((p: any) => p.email))];
    const batchResult = await listcleanVerifyBatch(emails);
    const nowIso = new Date().toISOString();
    const { error: updateError } = await supabase
      .from("discovered_tool_contact_emails")
      .update({ listclean_status: "submitted", listclean_list_id: batchResult.list_id, listclean_submitted_at: nowIso })
      .in("id", pending.map((p: any) => p.id));
    if (updateError) throw new Error(`Submitted to ListClean but failed to record list_id: ${updateError.message}`);
    submitted = pending.length;
  }

  return { downloaded, valid, invalid, retried, failed, submitted };
}

// Both ListClean handlers below call already-deployed, already-working
// edge functions over HTTP (service-role Bearer token — both accept that
// as an internal-call credential) rather than importing their logic
// directly, deliberately: other-agencies-listclean-process-queue in
// particular is large, already tested, and not worth re-risking via a
// refactor just to satisfy this registry's usual "import the shared
// function" convention. This mirrors what a never-actually-scheduled
// pg_cron job (trigger_queue_worker_http, migration 20260308193208) was
// already meant to do — this is that missing piece, just on the modern
// scheduler instead of a bare pg_cron entry.
async function listcleanCreditsCheckHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const res = await fetch(`${ctx.supabaseUrl}/functions/v1/listclean-credits-monitor`, { method: "POST" });
  const body = await res.json().catch(() => ({}));
  if (!res.ok) throw new Error(`listclean-credits-monitor returned ${res.status}: ${JSON.stringify(body)}`);
  return body;
}

// other-agencies-listclean-process-queue processes up to 3000 due emails
// per call, in batches of 1000, SYNCHRONOUSLY polling ListClean
// (pollListCleanCompletion) for up to ~60s per batch — a large first-ever
// backlog (this has never run on a schedule before) could take several
// minutes end to end. A client-side abort here only stops THIS scheduler
// tick from waiting; the invoked function keeps running server-side to
// completion regardless (it never checks the request's AbortSignal), so
// timing out client-side is safe — the next tick's own fresh SELECT will
// simply find a smaller backlog either way.
const LISTCLEAN_QUEUE_DRAIN_TIMEOUT_MS = 90_000;

async function listcleanQueueDrainHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") || "";
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), LISTCLEAN_QUEUE_DRAIN_TIMEOUT_MS);
  try {
    const res = await fetch(`${ctx.supabaseUrl}/functions/v1/other-agencies-listclean-process-queue`, {
      method: "POST",
      headers: { Authorization: `Bearer ${serviceRoleKey}`, "Content-Type": "application/json" },
      body: JSON.stringify({}),
      signal: controller.signal,
    });
    const body = await res.json().catch(() => ({}));
    if (!res.ok) throw new Error(`other-agencies-listclean-process-queue returned ${res.status}: ${JSON.stringify(body)}`);
    return body;
  } catch (err) {
    if (err instanceof Error && err.name === "AbortError") {
      return { ok: true, note: `Still running server-side past this tick's ${LISTCLEAN_QUEUE_DRAIN_TIMEOUT_MS}ms wait — expected for a large backlog, will show up as progress next tick.` };
    }
    throw err;
  } finally {
    clearTimeout(timeoutId);
  }
}

// Staggered backoff for "unknown" retries — an unknown result almost
// always just repeats itself if resubmitted a few minutes later (nothing
// about the target mailserver changed that fast); real delay gives
// conditions an actual chance to change between attempts. Index i is the
// wait before attempt i+2 (e.g. delays[0]=8h is the wait before the 2nd
// attempt, after the 1st came back unknown). One more entry than
// (MAX_ATTEMPTS - 1) is harmless — extra entries are simply unused.
const LISTCLEAN_RETRY_DELAY_HOURS = [8, 16, 40, 72];

function listcleanNextRetryAt(attempts: number): string {
  const hours = LISTCLEAN_RETRY_DELAY_HOURS[attempts - 1] ?? LISTCLEAN_RETRY_DELAY_HOURS[LISTCLEAN_RETRY_DELAY_HOURS.length - 1];
  return new Date(Date.now() + hours * 60 * 60 * 1000).toISOString();
}

const TOOL_LISTCLEAN_MAX_ATTEMPTS = 5;
const TOOL_LISTCLEAN_SUBMIT_BATCH_DEFAULT = 200;

// Same clean/dirty/retry vocabulary as the agencies pipeline
// (other-agencies-listclean-process-queue), applied to tool_contact_emails
// (software-tool vendor outreach) instead of other_agency_emails. Two
// phases each tick, submit-then-check-later rather than the agencies
// pipeline's synchronous submit->poll->download-in-one-call: ListClean
// batch verification isn't instant, and blocking on pollListCleanCompletion
// for a real backlog risks exactly the kind of long-synchronous-call
// resource exhaustion already hit (and fixed) in email_discovery_scan
// today. A non-blocking listcleanGetList check per pending batch, once
// per tick, is far cheaper and just as correct — an incomplete batch is
// simply checked again next tick instead of blocked on in this one.
async function toolEmailListcleanScanHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase, config } = ctx;
  const submitBatchSize = typeof config.submit_batch_size === "number" && config.submit_batch_size > 0
    ? Math.min(config.submit_batch_size, 1000)
    : TOOL_LISTCLEAN_SUBMIT_BATCH_DEFAULT;

  let downloaded = 0, valid = 0, invalid = 0, retried = 0, failed = 0;

  // Phase 1: check any batches already submitted for completion, and
  // apply results for the ones that are ready.
  const { data: submittedRows, error: submittedError } = await supabase
    .from("tool_contact_emails")
    .select("id, email, listclean_list_id, listclean_attempt_count")
    .eq("listclean_status", "submitted")
    .not("listclean_list_id", "is", null)
    .limit(2000);
  if (submittedError) throw new Error(`Failed to select submitted tool_contact_emails: ${submittedError.message}`);

  const rowsByListId = new Map<number, typeof submittedRows>();
  for (const row of (submittedRows || []) as any[]) {
    const list = rowsByListId.get(row.listclean_list_id) || [];
    list.push(row);
    rowsByListId.set(row.listclean_list_id, list);
  }

  for (const [listId, rows] of rowsByListId.entries()) {
    let status;
    try {
      status = await listcleanGetList(listId);
    } catch {
      continue; // transient — try again next tick
    }
    const statusStr = (status.status ?? "").toLowerCase();
    const hasAnyCount = typeof status.clean_count === "number" || typeof status.dirty_count === "number" || typeof status.unknown_count === "number";
    const isComplete = ["completed", "ready", "complete", "done"].includes(statusStr) || hasAnyCount;
    if (!isComplete) continue; // not ready yet

    let resultMap: Map<string, { status: string }>;
    try {
      const [cleanResults, dirtyResults, unknownResults] = await Promise.all([
        listcleanDownloadListJson(listId, "clean").catch(() => []),
        listcleanDownloadListJson(listId, "dirty").catch(() => []),
        listcleanDownloadListJson(listId, "unknown").catch(() => []),
      ]);
      resultMap = new Map();
      for (const r of unknownResults) resultMap.set(r.email.toLowerCase(), r);
      for (const r of dirtyResults) resultMap.set(r.email.toLowerCase(), r);
      for (const r of cleanResults) resultMap.set(r.email.toLowerCase(), r); // clean takes priority on conflict, matching the agencies pipeline
    } catch {
      continue; // download failed — try again next tick rather than lose the batch
    }

    const nowIso = new Date().toISOString();
    for (const row of rows as any[]) {
      const result = resultMap.get(String(row.email).toLowerCase());
      const attempts = (row.listclean_attempt_count || 0) + 1;
      const externalStatus = result?.status ?? null;
      // No result at all for this email in either bucket reads the same as
      // ListClean's own "unknown" — retry it rather than assume invalid.
      const mapped = result ? mapListCleanStatusToInternal(result.status) : "retry";

      if (mapped === "valid") {
        await supabase.from("tool_contact_emails").update({ listclean_status: "valid", listclean_external_status: externalStatus, listclean_checked_at: nowIso }).eq("id", row.id);
        valid++;
      } else if (mapped === "invalid") {
        await supabase.from("tool_contact_emails").update({ listclean_status: "invalid", listclean_external_status: externalStatus, listclean_checked_at: nowIso }).eq("id", row.id);
        invalid++;
      } else if (attempts >= TOOL_LISTCLEAN_MAX_ATTEMPTS) {
        await supabase.from("tool_contact_emails").update({ listclean_status: "failed", listclean_external_status: externalStatus, listclean_attempt_count: attempts, listclean_checked_at: nowIso }).eq("id", row.id);
        failed++;
      } else {
        // Back to NULL (not "retry") so the same submit-phase query below
        // picks it up again — but not until listclean_next_retry_at has
        // passed (staggered backoff, see LISTCLEAN_RETRY_DELAY_HOURS).
        await supabase.from("tool_contact_emails").update({ listclean_status: null, listclean_external_status: externalStatus, listclean_attempt_count: attempts, listclean_checked_at: nowIso, listclean_next_retry_at: listcleanNextRetryAt(attempts) }).eq("id", row.id);
        retried++;
      }
      downloaded++;
    }
  }

  // Phase 2: submit a fresh batch of never-tried or reset-for-retry emails
  // whose backoff window (if any) has actually elapsed.
  const nowIsoForSubmit = new Date().toISOString();
  const { data: pending, error: pendingError } = await supabase
    .from("tool_contact_emails")
    .select("id, email")
    .is("listclean_status", null)
    .or(`listclean_next_retry_at.is.null,listclean_next_retry_at.lte.${nowIsoForSubmit}`)
    .limit(submitBatchSize);
  if (pendingError) throw new Error(`Failed to select pending tool_contact_emails: ${pendingError.message}`);

  let submitted = 0;
  if (pending && pending.length > 0) {
    const emails = [...new Set(pending.map((p: any) => p.email))];
    const batchResult = await listcleanVerifyBatch(emails);
    const nowIso = new Date().toISOString();
    const { error: updateError } = await supabase
      .from("tool_contact_emails")
      .update({ listclean_status: "submitted", listclean_list_id: batchResult.list_id, listclean_submitted_at: nowIso })
      .in("id", pending.map((p: any) => p.id));
    if (updateError) throw new Error(`Submitted to ListClean but failed to record list_id: ${updateError.message}`);
    submitted = pending.length;
  }

  return { downloaded, valid, invalid, retried, failed, submitted };
}

// Auto-sends every still-unsynced listclean_status='valid' email into a
// fixed Smartlead campaign — config.campaign_id, one job per source/
// campaign pair, since "listed" and "not-yet-listed" tools deliberately
// go to two different campaigns with two different pitches. Reuses the
// exact same logic the admin page's manual "Send to Smartlead" button
// calls (_shared/smartleadSync.ts) — this just means nobody has to click
// it anymore. Still respects the same gate: only ListClean-verified-clean
// emails, never already-synced ones.
async function toolEmailSmartleadSyncHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase, config } = ctx;
  const campaignId = typeof config.campaign_id === "string" ? config.campaign_id.trim() : "";
  if (!campaignId) return { skipped: true, reason: "no campaign_id configured" };
  const result = await syncValidEmailsToSmartlead(supabase, "listed", campaignId);
  if (!result.ok) throw new Error(result.error || "Smartlead sync failed");
  return { synced: result.synced, campaign_id: campaignId };
}

async function discoveredToolEmailSmartleadSyncHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase, config } = ctx;
  const campaignId = typeof config.campaign_id === "string" ? config.campaign_id.trim() : "";
  if (!campaignId) return { skipped: true, reason: "no campaign_id configured" };
  const result = await syncValidEmailsToSmartlead(supabase, "discovered", campaignId);
  if (!result.ok) throw new Error(result.error || "Smartlead sync failed");
  return { synced: result.synced, campaign_id: campaignId };
}

// Fulfills the privacy policy's own "we retain data as long as necessary...
// we delete or anonymize data when no longer needed" — without this,
// site_page_views/tool_page_views/tool_outbound_clicks/smart_search_logs/
// tool_chat_messages (raw per-event analytics: IP, geo, page path, search
// query, chat content) would otherwise grow forever with no cleanup at all.
// 400 days (~13 months) keeps a full year-over-year comparison window while
// still bounding growth. Deliberately does NOT touch vendor_onboarding_
// sessions/vendor_funnel_events/funnel_sessions/funnel_events — those are
// real business/revenue records tied to actual leads and customers, not
// disposable raw tracking exhaust.
const ANALYTICS_RETENTION_DAYS = 400;
const ANALYTICS_RETENTION_TABLES = [
  "site_page_views",
  "tool_page_views",
  "tool_outbound_clicks",
  "smart_search_logs",
  "tool_chat_messages",
] as const;

async function analyticsRetentionCleanupHandler(ctx: SchedulerJobContext): Promise<Record<string, unknown>> {
  const { supabase } = ctx;
  const cutoff = new Date(Date.now() - ANALYTICS_RETENTION_DAYS * 24 * 60 * 60 * 1000).toISOString();
  const deletedByTable: Record<string, number> = {};

  for (const table of ANALYTICS_RETENTION_TABLES) {
    const { error, count } = await supabase
      .from(table)
      .delete({ count: "exact" })
      .lt("created_at", cutoff);
    if (error) throw new Error(`Failed to prune ${table}: ${error.message}`);
    deletedByTable[table] = count ?? 0;
  }

  return { cutoff, deleted: deletedByTable, total_deleted: Object.values(deletedByTable).reduce((a, b) => a + b, 0) };
}

const REGISTRY: Record<string, SchedulerJobHandler> = {
  discovery_refresh: discoveryRefreshHandler,
  crawl_queue_drain: crawlQueueDrainHandler,
  crawl_lease_cleanup: crawlLeaseCleanupHandler,
  enrichment_stuck_sweep: enrichmentStuckSweepHandler,
  completeness_rescan: completenessRescanHandler,
  change_detection_scan: changeDetectionScanHandler,
  stale_source_retry: staleSourceRetryHandler,
  indexnow_submit: indexnowSubmitHandler,
  email_discovery_scan: emailDiscoveryScanHandler,
  discovered_tool_email_scan: discoveredToolEmailScanHandler,
  listclean_credits_check: listcleanCreditsCheckHandler,
  listclean_queue_drain: listcleanQueueDrainHandler,
  tool_email_listclean_scan: toolEmailListcleanScanHandler,
  discovered_tool_email_listclean_scan: discoveredToolEmailListcleanScanHandler,
  tool_email_smartlead_sync: toolEmailSmartleadSyncHandler,
  discovered_tool_email_smartlead_sync: discoveredToolEmailSmartleadSyncHandler,
  analytics_retention_cleanup: analyticsRetentionCleanupHandler,
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

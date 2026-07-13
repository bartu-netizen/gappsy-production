// Crawl execution + the automatic Discovery -> Crawl -> Draft -> AI Queue
// pipeline. executeCrawlJob is the validate -> gateway -> normalize ->
// persist sequence, extracted out of admin-crawl-jobs' previously-duplicated
// start/retry actions so both the manual admin buttons AND the automatic
// approve-triggered pipeline share one implementation.
//
// runAutomaticCrawlPipeline and drainCrawlQueue are NEW: they exist only for
// the automatic path triggered by approving a discovery candidate. The
// existing manual "Start Crawl"/"Retry" buttons (admin-crawl-jobs) call
// executeCrawlJob directly and stop there — crawling still leaves a job at
// 'needs_review' for a human to walk through in the Extraction Review
// screen exactly as before. Nothing about that existing workflow changes.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { validateCrawlUrl, resolvesToPublicAddress, CRAWL_LIMITS } from "./crawlUrlSafety.ts";
import { callCrawlerGateway, GatewayError } from "./crawlGatewayClient.ts";
import { normalizeCrawlResult, buildBoundedRawSnapshot, type Crawl4aiRawResponse, type TaxonomyEntry } from "./crawlExtractionAdapter.ts";
import { buildAutoApproveReviewState, createDraftFromCrawlJob } from "./crawlDraftCreation.ts";
import { createBatchAndJobs, EnrichmentBatchError } from "./enrichmentBatchOps.ts";
import { createSessionToken } from "./adminSession.ts";

// Error codes worth an automatic, backed-off retry (transient gateway/
// network conditions). Everything else (bad URL, private IP, DNS failure,
// unsupported protocol, gateway not configured) is a permanent condition
// that retrying the exact same request will not fix, so those go straight
// to a terminal 'failed' — same as before this change.
const RETRYABLE_ERROR_CODES = new Set([
  "gateway_unreachable",
  "gateway_timeout",
  "gateway_malformed_response",
  "gateway_error",
  "crawl_timeout",
  "crawl_failed",
]);

function backoffSeconds(attempt: number): number {
  // 30s, 120s, 480s, capped at 15min — attempt is the attempt that just
  // failed, so the NEXT attempt waits this long.
  return Math.min(30 * Math.pow(4, Math.max(0, attempt - 1)), 900);
}

// Keeps a claimed job's lease alive for however long its pipeline actually
// takes, instead of hardcoding a heartbeat call at one specific pipeline
// step (fragile — easy to leave a slow step unattended). Ticks every 60s,
// well inside the default 240s lease, so a legitimately-still-running job
// is never mistaken for a crashed one and reclaimed out from under it.
// heartbeat_crawl_job only extends the lease if this worker_id still
// legitimately owns it, so a tick that fires after the job already
// finished (interval not yet cleared) is a harmless no-op.
async function withHeartbeat<T>(supabase: SupabaseClient, jobId: string, workerId: string, fn: () => Promise<T>): Promise<T> {
  const intervalId = setInterval(() => {
    supabase.rpc("heartbeat_crawl_job", { p_job_id: jobId, p_worker_id: workerId }).then(() => {}, () => {});
  }, 60_000);
  try {
    return await fn();
  } finally {
    clearInterval(intervalId);
  }
}

// The full field set the existing Claude Max / Claude Code Batch enrichment
// workflow expects — the same list used for a manually-created batch, so an
// auto-created draft is enqueued exactly as that workflow already expects,
// never a different/reduced shape.
const DEFAULT_ENRICHMENT_FIELDS = [
  "short_description", "long_description", "best_for", "pros", "cons",
  "features_summary", "pricing_summary", "company_summary", "integrations_summary",
  "faqs", "seo_title", "seo_meta_description", "llm_readable_summary",
  "category_suggestions", "tag_suggestions",
];

async function fetchTaxonomy(supabase: SupabaseClient): Promise<{ categories: TaxonomyEntry[]; tags: TaxonomyEntry[] }> {
  const [categoriesRes, tagsRes] = await Promise.all([
    supabase.from("tool_categories").select("id, slug, name").eq("status", "published"),
    supabase.from("tool_tags").select("id, slug, name"),
  ]);
  return {
    categories: (categoriesRes.data || []) as TaxonomyEntry[],
    tags: (tagsRes.data || []) as TaxonomyEntry[],
  };
}

function dnsFailureMessage(reason: string | undefined): string {
  if (reason === "dns_resolution_failed") return "The candidate domain could not be resolved (no DNS records found).";
  return "The candidate URL resolves to a private or non-public address and cannot be crawled.";
}

export interface CrawlExecutionResult {
  ok: boolean;
  job: any;
  error_code?: string;
  error?: string;
}

// Validates the URL, calls the crawler gateway, normalizes the result
// (grounded against the current tool taxonomy), and persists it onto the
// given crawl_jobs row (already inserted by the caller with status
// 'starting'). Flips the discovery candidate to 'crawled' on success.
// Never throws — every failure path updates the job row to 'failed' and
// returns { ok: false }.
export async function executeCrawlJob(
  supabase: SupabaseClient,
  job: { id: string; started_at: string },
  requestedUrl: string,
  discoveryCandidateId: string,
): Promise<CrawlExecutionResult> {
  const urlCheck = validateCrawlUrl(requestedUrl);
  if (!urlCheck.ok) {
    return failJob(supabase, job, urlCheck.reason || "invalid_url", "The candidate URL failed validation.");
  }
  const dnsCheck = await resolvesToPublicAddress(urlCheck.hostname!);
  if (!dnsCheck.ok) {
    return failJob(supabase, job, dnsCheck.reason || "dns_check_failed", dnsFailureMessage(dnsCheck.reason));
  }

  try {
    const gatewayResult = await callCrawlerGateway({
      request_id: job.id,
      url: urlCheck.normalizedUrl!,
      max_pages: CRAWL_LIMITS.MAX_PAGES,
      max_depth: CRAWL_LIMITS.MAX_DEPTH,
      max_duration_ms: CRAWL_LIMITS.MAX_DURATION_MS,
    });
    if (!gatewayResult.ok || !gatewayResult.data) {
      throw new GatewayError(gatewayResult.error_code || "gateway_error", gatewayResult.error || "Gateway returned an unsuccessful result.");
    }

    const { data: candidate } = await supabase.from("discovered_tools").select("official_website").eq("id", discoveryCandidateId).maybeSingle();
    const { categories, tags } = await fetchTaxonomy(supabase);
    const raw = gatewayResult.data.raw as Crawl4aiRawResponse;
    const normalized = normalizeCrawlResult(raw, {
      discoveryCandidateWebsite: candidate?.official_website || requestedUrl,
      categories,
      tags,
    });
    const boundedRaw = buildBoundedRawSnapshot(raw);
    const completedAt = new Date();

    const { data: updatedJob, error: updateError } = await supabase
      .from("crawl_jobs")
      .update({
        status: "needs_review",
        progress: 100,
        completed_at: completedAt.toISOString(),
        duration_ms: completedAt.getTime() - new Date(job.started_at).getTime(),
        crawl4ai_version: gatewayResult.data.crawl4ai_version,
        discovered_pages: gatewayResult.data.discovered_pages,
        crawled_pages: gatewayResult.data.crawled_pages,
        source_urls: gatewayResult.data.source_urls,
        raw_extraction_ref: boundedRaw,
        normalized_extraction: normalized,
        updated_at: completedAt.toISOString(),
      })
      .eq("id", job.id)
      .select()
      .single();
    if (updateError) return { ok: false, job: null, error: updateError.message };

    await supabase.from("discovered_tools").update({ status: "crawled", updated_at: completedAt.toISOString() }).eq("id", discoveryCandidateId);

    return { ok: true, job: updatedJob };
  } catch (err) {
    const code = err instanceof GatewayError ? err.code : "unknown_error";
    const message = err instanceof GatewayError ? err.message : "An unexpected error occurred while crawling.";
    return failJob(supabase, job, code, message);
  }
}

async function failJob(supabase: SupabaseClient, job: { id: string; started_at: string }, code: string, message: string): Promise<CrawlExecutionResult> {
  const completedAt = new Date();
  const { data: updatedJob } = await supabase
    .from("crawl_jobs")
    .update({
      status: "failed",
      error_code: code,
      error_message: message,
      completed_at: completedAt.toISOString(),
      duration_ms: completedAt.getTime() - new Date(job.started_at).getTime(),
      updated_at: completedAt.toISOString(),
    })
    .eq("id", job.id)
    .select()
    .single();
  return { ok: false, job: updatedJob, error_code: code, error: message };
}

async function autoEnqueueEnrichment(supabase: SupabaseClient, toolId: string, createdBy: string): Promise<{ ok: boolean; reason?: string }> {
  try {
    const { data: settings } = await supabase.from("enrichment_settings").select("*").eq("id", true).maybeSingle();
    const provider = settings?.active_provider || "claude_code_batch";
    const promptKey = settings?.default_prompt_key || "tool_editorial_enrichment";
    const { data: activePrompt } = await supabase
      .from("enrichment_prompt_versions")
      .select("id")
      .eq("prompt_key", promptKey)
      .eq("active", true)
      .maybeSingle();
    if (!activePrompt) return { ok: false, reason: "No active enrichment prompt version configured." };

    await createBatchAndJobs(supabase, {
      toolIds: [toolId],
      requestedFields: DEFAULT_ENRICHMENT_FIELDS,
      createdBy,
      promptVersionId: activePrompt.id as string,
      provider,
    });
    return { ok: true };
  } catch (err) {
    if (err instanceof EnrichmentBatchError) return { ok: false, reason: err.message };
    return { ok: false, reason: err instanceof Error ? err.message : "Unknown error enqueuing AI enrichment." };
  }
}

export interface AutomaticPipelineResult {
  crawl: CrawlExecutionResult;
  draft_tool_id: string | null;
  draft_missing_fields: string[];
  enrichment_enqueued: boolean;
  enrichment_skip_reason: string | null;
}

// The full automatic Discovery -> Crawl -> Normalize -> Draft -> AI Queue
// sequence for ONE candidate. Never throws — every stage records what
// happened and moves on; a failure at any stage still returns a normal
// result the caller (drainCrawlQueue) can log and continue past.
export async function runAutomaticCrawlPipeline(
  supabase: SupabaseClient,
  supabaseUrl: string,
  anonKey: string,
  job: { id: string; started_at: string },
  requestedUrl: string,
  discoveryCandidateId: string,
): Promise<AutomaticPipelineResult> {
  const crawl = await executeCrawlJob(supabase, job, requestedUrl, discoveryCandidateId);
  if (!crawl.ok || !crawl.job?.normalized_extraction) {
    return { crawl, draft_tool_id: null, draft_missing_fields: [], enrichment_enqueued: false, enrichment_skip_reason: "Crawl did not complete successfully." };
  }

  let adminToken: string;
  try {
    const session = await createSessionToken();
    adminToken = session.token;
  } catch (err) {
    return {
      crawl, draft_tool_id: null, draft_missing_fields: [],
      enrichment_enqueued: false,
      enrichment_skip_reason: `Could not create a system session to auto-create the draft: ${err instanceof Error ? err.message : "unknown error"}`,
    };
  }

  const extraction = crawl.job.normalized_extraction;
  const reviewState = buildAutoApproveReviewState(extraction, "automation@gappsy.com");
  const draftResult = await createDraftFromCrawlJob(
    supabase, supabaseUrl, anonKey, adminToken,
    { id: crawl.job.id, discovery_candidate_id: discoveryCandidateId, completed_at: crawl.job.completed_at },
    extraction,
    reviewState,
  );

  if (!draftResult.ok) {
    return { crawl, draft_tool_id: null, draft_missing_fields: [], enrichment_enqueued: false, enrichment_skip_reason: `Draft creation failed: ${draftResult.error}` };
  }

  const enrichment = await autoEnqueueEnrichment(supabase, draftResult.tool.id, "automation@gappsy.com");
  return {
    crawl,
    draft_tool_id: draftResult.tool.id,
    draft_missing_fields: draftResult.missingFields,
    enrichment_enqueued: enrichment.ok,
    enrichment_skip_reason: enrichment.ok ? null : enrichment.reason || "Unknown reason",
  };
}

export interface DrainSummary {
  processed: number;
  results: { discovery_candidate_id: string; job_id: string; result: AutomaticPipelineResult }[];
}

// If executeCrawlJob failed with a transient error code and the job hasn't
// exhausted crawl_settings.max_auto_retries, requeue it in place (same row
// — never a new one, so this can never produce a duplicate crawl_jobs row
// or duplicate downstream draft/enrichment work) with an exponential
// backoff retry_at instead of leaving it terminally 'failed'. Only touches
// rows still 'failed' (the exact status executeCrawlJob just set), so a
// job that was concurrently cancelled or already retried by an admin is
// left alone.
async function maybeScheduleAutoRetry(supabase: SupabaseClient, jobId: string, errorCode: string | undefined): Promise<boolean> {
  if (!errorCode || !RETRYABLE_ERROR_CODES.has(errorCode)) return false;

  const [{ data: settings }, { data: current }] = await Promise.all([
    supabase.from("crawl_settings").select("max_auto_retries").eq("id", true).maybeSingle(),
    supabase.from("crawl_jobs").select("attempt").eq("id", jobId).maybeSingle(),
  ]);
  const maxAutoRetries = settings?.max_auto_retries ?? 3;
  const attempt = current?.attempt || 1;
  if (attempt >= maxAutoRetries) return false;

  const retryAt = new Date(Date.now() + backoffSeconds(attempt) * 1000).toISOString();
  const { data: requeued } = await supabase
    .from("crawl_jobs")
    // attempt is bumped explicitly here (not by claim_crawl_jobs — this row
    // is going back to 'queued', not being reclaimed from a crashed
    // in-flight state, so the RPC's own crash-reclaim CASE never fires for
    // it) so the next attempt at this job is correctly counted.
    .update({ status: "queued", retry_at: retryAt, attempt: attempt + 1, worker_id: null, lease_expires_at: null, heartbeat_at: null, updated_at: new Date().toISOString() })
    .eq("id", jobId)
    .eq("status", "failed")
    .select("id")
    .maybeSingle();
  return !!requeued;
}

// Hard ceiling enforced by crawl_settings' own CHECK constraint — spawning
// this many independent worker loops is always safe regardless of the
// CONFIGURED concurrency, because claim_crawl_jobs() is the actual
// enforcement point (serialized on the crawl_settings row lock): loops
// beyond the configured limit simply receive an empty claim and exit
// immediately rather than ever over-claiming.
const MAX_WORKER_LOOPS = 4;

// One independent claim -> execute -> reclaim loop. Runs until a claim
// attempt comes back empty (no eligible job right now, or at capacity),
// then exits. Several of these run concurrently (see drainCrawlQueue), so
// as soon as any one loop's job finishes, that SAME loop immediately tries
// to claim the next eligible job — a freed slot is refilled right away
// rather than waiting for sibling loops to also finish (true worker-pool
// pipelining, not batch rounds).
async function runWorkerLoop(
  supabase: SupabaseClient,
  supabaseUrl: string,
  anonKey: string,
  loopId: string,
  results: DrainSummary["results"],
): Promise<void> {
  let n = 0;
  while (true) {
    const { data: claimedJobs, error: claimError } = await supabase.rpc("claim_crawl_jobs", { p_worker_id: `${loopId}-${n}` });
    if (claimError || !claimedJobs || claimedJobs.length === 0) return;
    n += 1;

    for (const claimed of claimedJobs as any[]) {
      const workerId = claimed.worker_id as string;
      const result = await withHeartbeat(supabase, claimed.id, workerId, () =>
        runAutomaticCrawlPipeline(
          supabase, supabaseUrl, anonKey,
          { id: claimed.id, started_at: claimed.started_at },
          claimed.requested_url,
          claimed.discovery_candidate_id,
        ));
      if (!result.crawl.ok) {
        await maybeScheduleAutoRetry(supabase, claimed.id, result.crawl.error_code);
      }
      results.push({ discovery_candidate_id: claimed.discovery_candidate_id, job_id: claimed.id, result });
    }
  }
}

// Drains crawl_jobs concurrently, up to crawl_settings.max_concurrent_crawls
// (default 2, hard-bounded 1-4) — the actual cap is enforced atomically
// inside claim_crawl_jobs(), not by how many loops this function happens to
// spawn. Intended to run via EdgeRuntime.waitUntil() after an
// approve/bulk-approve HTTP response has already been sent, so bulk-
// approving many candidates never blocks the request. Any candidate left
// queued (or scheduled for a backed-off retry) when this run ends is picked
// up by the next approve/bulk-approve call's drain, the "Process Queue"
// admin action, or the per-candidate manual "Start Crawl" button — nothing
// is ever silently stuck beyond its own retry_at.
export async function drainCrawlQueue(supabase: SupabaseClient, supabaseUrl: string, anonKey: string): Promise<DrainSummary> {
  const results: DrainSummary["results"] = [];
  const drainId = crypto.randomUUID();

  await Promise.allSettled(
    Array.from({ length: MAX_WORKER_LOOPS }, (_, i) => runWorkerLoop(supabase, supabaseUrl, anonKey, `drain-${drainId}-w${i}`, results)),
  );

  return { processed: results.length, results };
}

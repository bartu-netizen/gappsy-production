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

// Deliberately excludes "queued": a job waiting its turn must not count
// against the very capacity check that decides whether it can start.
const IN_FLIGHT_STATUSES = ["starting", "crawling", "extracting"];

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

// Sequentially processes every 'queued' crawl_jobs row, respecting the
// system-wide MAX_ACTIVE_JOBS limit (crawling is one-at-a-time — see
// crawlUrlSafety.ts). Intended to run via EdgeRuntime.waitUntil() after an
// approve/bulk-approve HTTP response has already been sent, so bulk-
// approving many candidates never blocks the request. Bulk volume beyond a
// handful of candidates is explicitly out of scope for this MVP (same
// "one active crawl at a time" limit the manual Start Crawl button already
// has) — any candidate left queued when this run ends is picked up by the
// next approve/bulk-approve call's drain, or the per-candidate manual
// "Start Crawl" button, so nothing is ever silently stuck.
export async function drainCrawlQueue(supabase: SupabaseClient, supabaseUrl: string, anonKey: string): Promise<DrainSummary> {
  const results: DrainSummary["results"] = [];

  while (true) {
    const { count: activeCount } = await supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).in("status", IN_FLIGHT_STATUSES);
    if ((activeCount || 0) >= CRAWL_LIMITS.MAX_ACTIVE_JOBS) break;

    const { data: nextJob } = await supabase
      .from("crawl_jobs")
      .select("id, discovery_candidate_id, requested_url, started_at")
      .eq("status", "queued")
      .order("created_at", { ascending: true })
      .limit(1)
      .maybeSingle();
    if (!nextJob) break;

    // Claim it (queued -> starting) before doing any work, so a
    // concurrently-running drain (from a second approve call) can't also
    // pick it up.
    const { data: claimed } = await supabase
      .from("crawl_jobs")
      .update({ status: "starting", started_at: new Date().toISOString(), updated_at: new Date().toISOString() })
      .eq("id", nextJob.id)
      .eq("status", "queued")
      .select()
      .maybeSingle();
    if (!claimed) continue; // lost the race to another drain — try the next one

    const result = await runAutomaticCrawlPipeline(
      supabase, supabaseUrl, anonKey,
      { id: claimed.id, started_at: claimed.started_at },
      claimed.requested_url,
      claimed.discovery_candidate_id,
    );
    results.push({ discovery_candidate_id: claimed.discovery_candidate_id, job_id: claimed.id, result });
  }

  return { processed: results.length, results };
}

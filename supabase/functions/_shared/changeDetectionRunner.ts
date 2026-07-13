// Change detection — DB-touching orchestration. Pure logic lives in
// changeDetection.ts; this module resolves canonical URLs, calls it,
// upserts tool_page_fingerprints, and (on a meaningful/critical change)
// enqueues a recrawl using the EXACT same crawl_jobs insert pattern as
// admin-tools' "bulk-recrawl" action (discovery-candidate lookup via
// crawl_jobs.created_draft_tool_id, one insert per candidate so the
// crawl_jobs_one_active_per_candidate_idx unique-violation on an
// already-active job is caught per-item, not a whole-batch abort).
//
// Called by the change_detection_scan / stale_source_retry scheduler
// handlers in schedulerRegistry.ts, which supply already-selected batches
// from the select_due_change_checks / select_stale_change_checks RPCs.

import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { validateCrawlUrl } from "./crawlUrlSafety.ts";
import {
  ChangeSeverity,
  classifyChange,
  decideRecrawl,
  extractStructuredSignal,
  fetchPageSafely,
  normalizeContent,
  PageType,
  sha256Hex,
} from "./changeDetection.ts";

export interface DueCheck {
  tool_id: string;
  website: string;
  page_type: PageType;
  pricing_page_url: string | null;
  is_first_snapshot: boolean;
  previous_content_fingerprint: string | null;
  previous_extracted_fingerprint: Record<string, unknown> | null;
}

// Conventional per-page-type path guesses, used whenever a discovered
// pricing page URL isn't available (from crawl_jobs.normalized_extraction)
// — best-effort; an unavailable guess just classifies as "unavailable"
// next run, it doesn't error the whole scan.
export function resolveCanonicalUrl(website: string, pageType: PageType, pricingPageUrl: string | null): string {
  const base = website.replace(/\/+$/, "");
  switch (pageType) {
    case "homepage": return base;
    case "robots": return `${base}/robots.txt`;
    case "sitemap": return `${base}/sitemap.xml`;
    case "favicon": return `${base}/favicon.ico`;
    case "pricing": return pricingPageUrl || `${base}/pricing`;
    case "features": return `${base}/features`;
    case "integrations": return `${base}/integrations`;
    case "docs": return `${base}/docs`;
    default: return base;
  }
}

export interface CheckOutcome {
  toolId: string;
  pageType: PageType;
  canonicalUrl: string;
  severity: ChangeSeverity;
  recrawlQueued: boolean;
  recrawlSkippedReason?: string;
}

interface ChangeRule { recrawl_on_meaningful: boolean; recrawl_on_critical: boolean; min_changed_items_for_critical: number }

// Resolves a tool_id -> discovery_candidate + requested_url exactly like
// admin-tools' bulk-recrawl, then inserts one crawl_jobs row. Returns
// why nothing was queued (no discovery lineage / invalid URL / already
// active) rather than throwing, since none of those are this function's
// error to raise — they're expected, common outcomes.
export async function enqueueRecrawl(
  supabase: SupabaseClient,
  toolId: string,
  createdBy: string,
): Promise<{ queued: boolean; reason?: string }> {
  const { data: originJob, error: originError } = await supabase
    .from("crawl_jobs")
    .select("created_draft_tool_id, discovery_candidate_id, requested_url, completed_at")
    .eq("created_draft_tool_id", toolId)
    .order("completed_at", { ascending: false })
    .limit(1)
    .maybeSingle();
  if (originError) return { queued: false, reason: originError.message };
  if (!originJob) return { queued: false, reason: "no linked discovery candidate — this tool wasn't created via the Discovery/Crawl pipeline" };

  const urlCheck = validateCrawlUrl(originJob.requested_url as string);
  if (!urlCheck.ok) return { queued: false, reason: `stored URL failed validation: ${urlCheck.reason}` };

  const { error: insertError } = await supabase
    .from("crawl_jobs")
    .insert({
      discovery_candidate_id: originJob.discovery_candidate_id,
      requested_url: originJob.requested_url,
      normalized_url: urlCheck.normalizedUrl,
      status: "queued",
      created_by: createdBy,
    });
  if (insertError) {
    const alreadyActive = insertError.message?.includes("crawl_jobs_one_active_per_candidate_idx") || insertError.code === "23505";
    return { queued: false, reason: alreadyActive ? "a crawl is already queued or running for this candidate" : insertError.message };
  }
  return { queued: true };
}

// Processes one (tool, page_type) due-check row end to end: fetch, hash,
// extract, classify, upsert the fingerprint, and — only on a fresh
// meaningful/critical transition (never re-queues every run just because
// the tool is still "critical" from before) — enqueue a recrawl.
export async function processDueCheck(
  supabase: SupabaseClient,
  check: DueCheck,
  rule: ChangeRule,
  createdBy: string,
): Promise<CheckOutcome> {
  const canonicalUrl = resolveCanonicalUrl(check.website, check.page_type, check.pricing_page_url);
  const fetched = await fetchPageSafely(canonicalUrl);

  const nowIso = new Date().toISOString();
  let contentFingerprint: string | null = null;
  let extractedFingerprint: Record<string, unknown> = {};
  let contentHashChanged = false;

  if (fetched.ok) {
    const raw = fetched.bodyText ?? "";
    const isBinaryPage = check.page_type === "favicon";
    contentFingerprint = isBinaryPage
      ? await sha256Hex(fetched.bodyBytesForHash ?? new Uint8Array())
      : await sha256Hex(normalizeContent(raw));
    extractedFingerprint = isBinaryPage ? {} : extractStructuredSignal(check.page_type, raw);
    contentHashChanged = contentFingerprint !== check.previous_content_fingerprint;
  }

  const classification = classifyChange({
    isFirstSnapshot: check.is_first_snapshot,
    fetchOk: fetched.ok,
    contentHashChanged,
    previousExtracted: check.previous_extracted_fingerprint,
    currentExtracted: extractedFingerprint,
    minChangedItemsForCritical: rule.min_changed_items_for_critical,
  });

  await upsertFingerprint(supabase, check, {
    canonicalUrl,
    contentFingerprint,
    extractedFingerprint,
    httpStatus: fetched.status,
    httpMetadata: fetched.contentType ? { content_type: fetched.contentType } : {},
    severity: classification.severity,
    evidence: classification.evidence,
    fetchOk: fetched.ok,
    nowIso,
  });

  let recrawlQueued = false;
  let recrawlSkippedReason: string | undefined;
  const wasAlreadyThisSeverity = !check.is_first_snapshot
    && (classification.severity === "meaningful" || classification.severity === "critical")
    && check.previous_content_fingerprint !== null
    && !contentHashChanged;
  if (!wasAlreadyThisSeverity && decideRecrawl(classification.severity, rule)) {
    const result = await enqueueRecrawl(supabase, check.tool_id, createdBy);
    recrawlQueued = result.queued;
    recrawlSkippedReason = result.reason;
  }

  return { toolId: check.tool_id, pageType: check.page_type, canonicalUrl, severity: classification.severity, recrawlQueued, recrawlSkippedReason };
}

async function upsertFingerprint(
  supabase: SupabaseClient,
  check: DueCheck,
  fields: {
    canonicalUrl: string;
    contentFingerprint: string | null;
    extractedFingerprint: Record<string, unknown>;
    httpStatus: number | null;
    httpMetadata: Record<string, unknown>;
    severity: ChangeSeverity;
    evidence: Record<string, unknown>;
    fetchOk: boolean;
    nowIso: string;
  },
): Promise<void> {
  const changed = fields.severity !== "no_change" && fields.severity !== "unavailable";

  if (check.is_first_snapshot) {
    await supabase.from("tool_page_fingerprints").insert({
      tool_id: check.tool_id,
      page_type: check.page_type,
      canonical_url: fields.canonicalUrl,
      content_fingerprint: fields.contentFingerprint,
      extracted_fingerprint: fields.extractedFingerprint,
      http_status: fields.httpStatus,
      http_metadata: fields.httpMetadata,
      first_seen_at: fields.nowIso,
      last_checked_at: fields.nowIso,
      last_changed_at: changed ? fields.nowIso : null,
      consecutive_failures: fields.fetchOk ? 0 : 1,
      last_change_severity: fields.severity,
      last_change_evidence: fields.evidence,
    });
    return;
  }

  const { data: existing } = await supabase
    .from("tool_page_fingerprints")
    .select("consecutive_failures")
    .eq("tool_id", check.tool_id)
    .eq("page_type", check.page_type)
    .maybeSingle();
  const nextFailures = fields.fetchOk ? 0 : ((existing?.consecutive_failures as number | undefined) ?? 0) + 1;

  await supabase
    .from("tool_page_fingerprints")
    .update({
      canonical_url: fields.canonicalUrl,
      content_fingerprint: fields.contentFingerprint,
      extracted_fingerprint: fields.extractedFingerprint,
      http_status: fields.httpStatus,
      http_metadata: fields.httpMetadata,
      last_checked_at: fields.nowIso,
      ...(changed ? { last_changed_at: fields.nowIso } : {}),
      consecutive_failures: nextFailures,
      last_change_severity: fields.severity,
      last_change_evidence: fields.evidence,
      updated_at: fields.nowIso,
    })
    .eq("tool_id", check.tool_id)
    .eq("page_type", check.page_type);
}

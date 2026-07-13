// Change detection — bounded fingerprinting for existing tools' pages.
// Deliberately NOT routed through the Crawl4AI gateway (crawlGatewayClient.ts)
// — that's a full headless-browser render, appropriate for extracting a
// new tool's structured data once, not for a cheap "did anything change"
// check run against thousands of tools on a schedule. This does a plain,
// bounded, SSRF-safe direct fetch (reusing crawlUrlSafety.ts's same
// validation the gateway itself uses) and never touches Crawl4AI/the
// resource-capped gateway container at all — "Existing Plesk websites and
// crawler limits remain the highest priority."
//
// Pure functions (normalizeContent, sha256Hex, extractStructuredSignal,
// computeSetDiff, classifyChange, decideRecrawl) are unit-tested directly.
// fetchPageSafely is the only network-touching piece here.

import { resolvesToPublicAddress, validateCrawlUrl } from "./crawlUrlSafety.ts";

export type PageType = "homepage" | "pricing" | "features" | "integrations" | "docs" | "favicon" | "robots" | "sitemap";
export type ChangeSeverity = "no_change" | "minor" | "meaningful" | "critical" | "unavailable";

const FETCH_TIMEOUT_MS = 15_000;
const MAX_RESPONSE_BYTES = 2_000_000; // 2MB — a fingerprint check reads far less than a full crawl ever would
const USER_AGENT = "GappsyBot/1.0 (+https://www.gappsy.com; Change Detection)";

export interface FetchOutcome {
  ok: boolean;
  status: number | null;
  bodyText: string | null;
  bodyBytesForHash: Uint8Array | null; // for favicon: hash the bytes, not decoded text
  contentType: string | null;
  reason?: string;
}

// Same SSRF posture as the crawl pipeline (validateCrawlUrl +
// resolvesToPublicAddress — DNS-rebinding-safe), but a single bounded
// fetch instead of a multi-page headless-browser crawl.
export async function fetchPageSafely(url: string): Promise<FetchOutcome> {
  const urlCheck = validateCrawlUrl(url);
  if (!urlCheck.ok) {
    return { ok: false, status: null, bodyText: null, bodyBytesForHash: null, contentType: null, reason: urlCheck.reason || "invalid_url" };
  }
  const dnsCheck = await resolvesToPublicAddress(urlCheck.hostname!);
  if (!dnsCheck.ok) {
    return { ok: false, status: null, bodyText: null, bodyBytesForHash: null, contentType: null, reason: dnsCheck.reason || "dns_check_failed" };
  }

  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), FETCH_TIMEOUT_MS);
  try {
    const response = await fetch(urlCheck.normalizedUrl!, {
      headers: { "User-Agent": USER_AGENT },
      signal: controller.signal,
      redirect: "follow",
    });
    const contentType = response.headers.get("content-type");

    if (!response.body) {
      return { ok: response.ok, status: response.status, bodyText: "", bodyBytesForHash: new Uint8Array(), contentType, reason: response.ok ? undefined : `http_${response.status}` };
    }
    const reader = response.body.getReader();
    const chunks: Uint8Array[] = [];
    let total = 0;
    while (true) {
      const { done, value } = await reader.read();
      if (done) break;
      if (value) {
        total += value.length;
        if (total > MAX_RESPONSE_BYTES) {
          chunks.push(value.slice(0, MAX_RESPONSE_BYTES - (total - value.length)));
          await reader.cancel();
          break;
        }
        chunks.push(value);
      }
    }
    const bytes = new Uint8Array(chunks.reduce((sum, c) => sum + c.length, 0));
    let offset = 0;
    for (const chunk of chunks) { bytes.set(chunk, offset); offset += chunk.length; }

    if (!response.ok) {
      return { ok: false, status: response.status, bodyText: null, bodyBytesForHash: null, contentType, reason: `http_${response.status}` };
    }
    return { ok: true, status: response.status, bodyText: new TextDecoder().decode(bytes), bodyBytesForHash: bytes, contentType };
  } catch (err) {
    const reason = err instanceof Error && err.name === "AbortError" ? "timeout" : "fetch_failed";
    return { ok: false, status: null, bodyText: null, bodyBytesForHash: null, contentType: null, reason };
  } finally {
    clearTimeout(timeoutId);
  }
}

// Strips script/style/comments, collapses whitespace, and removes common
// sources of byte-level noise that don't represent a real content change:
// inline nonces/CSRF tokens, session-like long hex/base64 tokens, and
// common 4-digit-year copyright/footer patterns — so re-fetching an
// otherwise-identical page doesn't hash differently just because a
// cookie-consent banner's nonce or a footer's "© 2026" rotated.
export function normalizeContent(html: string): string {
  return html
    .replace(/<script[\s\S]*?<\/script>/gi, " ")
    .replace(/<style[\s\S]*?<\/style>/gi, " ")
    .replace(/<!--[\s\S]*?-->/g, " ")
    .replace(/<[^>]+>/g, " ")
    // nonce="...", csrf tokens, and other long random-looking tokens
    .replace(/\b(nonce|csrf|token|session|sid)=["']?[a-zA-Z0-9_-]{16,}["']?/gi, "$1=<redacted>")
    .replace(/\b[a-f0-9]{32,}\b/gi, "<hex>") // long hex tokens (session ids, hashes embedded in markup)
    .replace(/©\s*\d{4}/g, "© <year>")
    .replace(/\b(19|20)\d{2}\b(?=[^\d]{0,20}(all rights reserved|copyright))/gi, "<year>")
    .replace(/\s+/g, " ")
    .trim()
    .toLowerCase();
}

export async function sha256Hex(input: string | Uint8Array): Promise<string> {
  const bytes = typeof input === "string" ? new TextEncoder().encode(input) : input;
  const digest = await crypto.subtle.digest("SHA-256", bytes as BufferSource);
  return Array.from(new Uint8Array(digest)).map((b) => b.toString(16).padStart(2, "0")).join("");
}

const PRICE_RE = /(?:US)?\$\s?\d{1,3}(?:[.,]\d{3})*(?:\.\d{2})?|\b\d{1,3}(?:[.,]\d{3})*(?:\.\d{2})?\s?(?:USD|EUR|GBP)\b/gi;
const HEADING_RE = /<h[1-3][^>]*>([\s\S]*?)<\/h[1-3]>/gi;

function stripTags(text: string): string {
  return text.replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim();
}

function extractHeadings(html: string, cap: number): string[] {
  const found: string[] = [];
  let match: RegExpExecArray | null;
  const re = new RegExp(HEADING_RE);
  while ((match = re.exec(html)) !== null && found.length < cap) {
    const text = stripTags(match[1]);
    if (text.length > 0 && text.length < 200) found.push(text);
  }
  return found;
}

function extractTitle(html: string): string | null {
  const match = html.match(/<title[^>]*>([\s\S]*?)<\/title>/i);
  return match ? stripTags(match[1]) || null : null;
}

function extractMetaDescription(html: string): string | null {
  const match = html.match(/<meta\s+name=["']description["']\s+content=["']([\s\S]*?)["']/i)
    ?? html.match(/<meta\s+content=["']([\s\S]*?)["']\s+name=["']description["']/i);
  return match ? match[1].trim() || null : null;
}

// Page-type-aware structured extraction — always small (a handful of
// short strings, capped), never raw HTML. This is what classifyChange
// actually diffs, since a content_fingerprint hash alone can't
// distinguish "the pricing changed" from "a tracking pixel changed."
export function extractStructuredSignal(pageType: PageType, rawHtml: string): Record<string, unknown> {
  switch (pageType) {
    case "homepage":
      return { title: extractTitle(rawHtml), meta_description: extractMetaDescription(rawHtml), headings: extractHeadings(rawHtml, 5) };
    case "pricing": {
      const prices = Array.from(new Set((rawHtml.match(PRICE_RE) ?? []).map((p) => p.replace(/\s+/g, " ").trim()))).slice(0, 20);
      return { prices, plan_names: extractHeadings(rawHtml, 10) };
    }
    case "features":
    case "integrations":
      return { headings: extractHeadings(rawHtml, 30) };
    case "docs":
      return { title: extractTitle(rawHtml), heading_count: extractHeadings(rawHtml, 100).length };
    case "robots": {
      const disallow = (rawHtml.match(/^disallow:/gim) ?? []).length;
      const allow = (rawHtml.match(/^allow:/gim) ?? []).length;
      const sitemapRefs = (rawHtml.match(/^sitemap:\s*(\S+)/gim) ?? []).map((l) => l.replace(/^sitemap:\s*/i, "").trim());
      return { disallow_count: disallow, allow_count: allow, sitemap_refs: sitemapRefs.slice(0, 10) };
    }
    case "sitemap": {
      const urlCount = (rawHtml.match(/<loc>/gi) ?? []).length;
      return { url_count: urlCount };
    }
    case "favicon":
      return {}; // binary — content_fingerprint (byte hash) is the only signal
    default:
      return {};
  }
}

export interface SetDiff {
  changedCount: number;
  changedKeys: string[];
  added: string[];
  removed: string[];
}

// Compares two structured-signal objects field by field: array fields are
// compared as sets (added/removed items counted); scalar fields count as
// one "changed" item if their value differs. Deliberately simple and
// fully deterministic — no fuzzy/ML scoring.
export function computeSetDiff(previous: Record<string, unknown>, current: Record<string, unknown>): SetDiff {
  const changedKeys: string[] = [];
  const added: string[] = [];
  const removed: string[] = [];
  const keys = new Set([...Object.keys(previous), ...Object.keys(current)]);

  for (const key of keys) {
    const prevVal = previous[key];
    const curVal = current[key];
    if (Array.isArray(prevVal) || Array.isArray(curVal)) {
      const prevSet = new Set((Array.isArray(prevVal) ? prevVal : []).map(String));
      const curSet = new Set((Array.isArray(curVal) ? curVal : []).map(String));
      const addedItems = [...curSet].filter((v) => !prevSet.has(v));
      const removedItems = [...prevSet].filter((v) => !curSet.has(v));
      if (addedItems.length > 0 || removedItems.length > 0) {
        changedKeys.push(key);
        added.push(...addedItems);
        removed.push(...removedItems);
      }
    } else if (prevVal !== curVal) {
      changedKeys.push(key);
      if (curVal != null) added.push(String(curVal));
      if (prevVal != null) removed.push(String(prevVal));
    }
  }

  return { changedCount: changedKeys.length, changedKeys, added: added.slice(0, 50), removed: removed.slice(0, 50) };
}

export interface ClassifyChangeInput {
  isFirstSnapshot: boolean;
  fetchOk: boolean;
  contentHashChanged: boolean;
  previousExtracted: Record<string, unknown> | null;
  currentExtracted: Record<string, unknown>;
  minChangedItemsForCritical: number;
}
export interface ClassifyChangeResult {
  severity: ChangeSeverity;
  evidence: Record<string, unknown>;
}

// The core decision function — deterministic, no ML, fully explainable:
// - unavailable: the fetch itself failed (page down, blocked, timed out).
// - no_change: first-ever snapshot (nothing to compare against — this
//   fetch IS the new baseline, not a "change"), or bytes are identical.
// - minor: bytes changed but the structured extract didn't (a footer
//   year, a tracking param, whitespace — exactly the noise
//   normalizeContent + this structural comparison are meant to absorb).
// - meaningful / critical: the structured extract actually differs;
//   critical once the number of changed structured fields reaches the
//   page type's configured threshold (e.g. a single price is enough for
//   'pricing', but 'features' needs 3+ headings to differ).
export function classifyChange(input: ClassifyChangeInput): ClassifyChangeResult {
  if (!input.fetchOk) return { severity: "unavailable", evidence: {} };
  if (input.isFirstSnapshot) return { severity: "no_change", evidence: { reason: "first_snapshot" } };
  if (!input.contentHashChanged) return { severity: "no_change", evidence: {} };

  const diff = computeSetDiff(input.previousExtracted ?? {}, input.currentExtracted);
  if (diff.changedCount === 0) {
    return { severity: "minor", evidence: { reason: "byte-level change only; no structural difference detected" } };
  }
  const severity: ChangeSeverity = diff.changedCount >= input.minChangedItemsForCritical ? "critical" : "meaningful";
  return { severity, evidence: { changed_keys: diff.changedKeys, added: diff.added, removed: diff.removed } };
}

export interface RecrawlRules {
  recrawl_on_meaningful: boolean;
  recrawl_on_critical: boolean;
}

// Pure gate deciding whether a classified change should queue a recrawl —
// separated from classifyChange so the "what changed" decision and the
// "is that worth a recrawl" policy decision can be tested (and
// reconfigured) independently.
export function decideRecrawl(severity: ChangeSeverity, rules: RecrawlRules): boolean {
  if (severity === "critical") return rules.recrawl_on_critical;
  if (severity === "meaningful") return rules.recrawl_on_meaningful;
  return false;
}

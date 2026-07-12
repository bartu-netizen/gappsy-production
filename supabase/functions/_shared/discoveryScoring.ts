// Discovery Engine scoring — deterministic, checklist-based (mirrors the
// computeCompleteness() pattern in _shared/toolCompleteness.ts). Nothing
// here is a fabricated/AI-guessed number: every point is earned by a
// specific, measured signal, and the checklist is returned alongside the
// score so the UI can show *why*.

import type { ValidationNotes } from "./discoveryValidation.ts";

export interface ScoreResult {
  score: number;
  checklist: { label: string; passed: boolean }[];
}

// How sure are we this is a real, legitimate, live product? Purely a
// function of the validation checks — never touches duplicate matching.
export function computeConfidenceScore(input: {
  name: string | null;
  officialWebsite: string | null;
  shortDescription: string | null;
  categoryId: string | null;
  validation: ValidationNotes | null;
}): ScoreResult {
  const v = input.validation;
  const checklist = [
    { label: "Has a name", passed: Boolean(input.name && input.name.trim()) },
    { label: "Has an official website", passed: Boolean(input.officialWebsite) },
    { label: "Has a short description", passed: Boolean(input.shortDescription && input.shortDescription.trim()) },
    { label: "Has a category", passed: Boolean(input.categoryId) },
    { label: "Website is reachable", passed: Boolean(v?.reachable) },
    { label: "Website uses HTTPS", passed: Boolean(v?.https) },
    { label: "Not a dead domain", passed: v ? !v.dead_domain : false },
    { label: "Not a parked domain", passed: v ? !v.parked_domain : false },
    { label: "Has robots.txt", passed: Boolean(v?.robots_txt) },
    { label: "Has sitemap.xml", passed: Boolean(v?.sitemap_xml) },
    { label: "Has a favicon", passed: Boolean(v?.favicon) },
  ];
  const passedCount = checklist.filter((c) => c.passed).length;
  const score = Math.round((passedCount / checklist.length) * 100);
  return { score, checklist };
}

export interface DuplicateMatch {
  matchedBy: "hostname_exact" | "slug_exact" | "name_similar" | null;
  againstTable: "tools" | "discovered_tools" | null;
  id: string | null;
}

// How likely this candidate already exists. Exact hostname/slug match is
// treated as near-certain; a fuzzy name match (same normalized name, no
// hostname/slug agreement) is scored lower since it could be a legitimate
// same-named-different-product collision — a human still reviews it.
export function computeDuplicateScore(match: DuplicateMatch): number {
  if (match.matchedBy === "hostname_exact") return 100;
  if (match.matchedBy === "slug_exact") return 90;
  if (match.matchedBy === "name_similar") return 50;
  return 0;
}

// Composite readiness score gating "Approved For Crawl" — combines
// confidence (is this real?) and an inverse duplicate penalty (is this
// new?). Reachability/HTTPS are hard requirements: an unreachable or non-
// HTTPS site caps quality at 40 regardless of everything else, since
// nothing downstream (Crawl4AI) can do anything useful with it yet.
export function computeQualityScore(confidenceScore: number, duplicateScore: number, validation: ValidationNotes | null): number {
  const duplicatePenalty = duplicateScore; // 0-100, subtracted proportionally
  const raw = confidenceScore * (1 - duplicatePenalty / 100);
  const hardGatePassed = Boolean(validation?.reachable && validation?.https);
  const capped = hardGatePassed ? raw : Math.min(raw, 40);
  return Math.max(0, Math.min(100, Math.round(capped)));
}

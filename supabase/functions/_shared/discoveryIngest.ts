// Shared candidate-ingestion path for the Discovery Engine — the exact
// Validation -> Duplicate Detection -> Quality Score sequence, extracted
// from admin-discovery-import so both the admin-driven Manual/CSV
// providers AND the automated provider runner (discoveryProviderRunner.ts)
// call the same code. Nothing provider-specific lives here.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { isMultiTenantHost, normalizeFullUrl, normalizeHostname, validateWebsite } from "./discoveryValidation.ts";
import { computeConfidenceScore, computeDuplicateScore, computeQualityScore, type DuplicateMatch } from "./discoveryScoring.ts";

export function slugify(name: string): string {
  return name
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 80) || "candidate";
}

export async function uniqueSlug(supabase: SupabaseClient, base: string): Promise<string> {
  const baseSlug = slugify(base);
  let candidate = baseSlug;
  let suffix = 1;
  while (true) {
    const { data } = await supabase.from("discovered_tools").select("id").eq("slug", candidate).maybeSingle();
    if (!data) return candidate;
    suffix += 1;
    candidate = `${baseSlug}-${suffix}`;
  }
}

export interface RawCandidate {
  name?: unknown;
  official_website?: unknown;
  category_id?: unknown;
  category_hint?: unknown;
  short_description?: unknown;
  logo_url?: unknown;
  source_url?: unknown;
}

export interface NormalizedCandidate {
  name: string;
  officialWebsite: string;
  categoryId: string | null;
  shortDescription: string | null;
  logoUrl: string | null;
  sourceUrl: string | null;
}

// Best-effort match against the EXISTING category taxonomy only — never
// creates one. Providers that only know a free-text category name (e.g. a
// GitHub awesome-list section heading) go through this; providers that
// already resolved an id (Manual/CSV) skip straight past it.
export async function resolveCategoryHint(supabase: SupabaseClient, hint: string | null): Promise<string | null> {
  if (!hint || !hint.trim()) return null;
  const needle = hint.trim().toLowerCase();
  const { data: categories } = await supabase.from("tool_categories").select("id, slug, name").eq("status", "published");
  const match = (categories || []).find(
    (c: any) => c.slug.toLowerCase() === needle || c.name.toLowerCase() === needle,
  );
  return match ? (match.id as string) : null;
}

export async function normalizeCandidate(
  supabase: SupabaseClient,
  raw: RawCandidate,
): Promise<NormalizedCandidate | { error: string }> {
  const name = typeof raw.name === "string" ? raw.name.trim() : "";
  const officialWebsite = typeof raw.official_website === "string" ? raw.official_website.trim() : "";
  if (!name) return { error: "name is required" };
  if (!officialWebsite) return { error: "official_website is required" };

  let categoryId = typeof raw.category_id === "string" && raw.category_id.trim() ? raw.category_id.trim() : null;
  if (!categoryId && typeof raw.category_hint === "string" && raw.category_hint.trim()) {
    categoryId = await resolveCategoryHint(supabase, raw.category_hint);
  }

  return {
    name,
    officialWebsite,
    categoryId,
    shortDescription: typeof raw.short_description === "string" && raw.short_description.trim() ? raw.short_description.trim() : null,
    logoUrl: typeof raw.logo_url === "string" && raw.logo_url.trim() ? raw.logo_url.trim() : null,
    sourceUrl: typeof raw.source_url === "string" && raw.source_url.trim() ? raw.source_url.trim() : null,
  };
}

export async function findDuplicate(
  supabase: SupabaseClient,
  hostname: string | null,
  slug: string,
  officialWebsite: string,
): Promise<DuplicateMatch> {
  if (hostname && isMultiTenantHost(hostname)) {
    // github.com, gitlab.com, etc: a bare hostname match is meaningless —
    // thousands of unrelated projects share it (e.g. a self-hosted tool
    // whose "official website" is just its repo). Compare the full
    // host+path instead, so github.com/ownerA/projA and
    // github.com/ownerB/projB are never conflated, while a genuinely
    // repeated github.com/owner/repo is still caught.
    const normalizedFull = normalizeFullUrl(officialWebsite);
    if (normalizedFull) {
      const { data: publishedMatch } = await supabase.from("tools").select("id, website").ilike("website", `%${hostname}%`).limit(20);
      const exactPublished = (publishedMatch || []).find((t: { website: string | null }) => t.website && normalizeFullUrl(t.website) === normalizedFull);
      if (exactPublished) return { matchedBy: "hostname_exact", againstTable: "tools", id: exactPublished.id as string };

      const { data: pendingMatch } = await supabase.from("discovered_tools").select("id, official_website").eq("hostname", hostname).limit(50);
      const exactPending = (pendingMatch || []).find((d: { official_website: string | null }) => d.official_website && normalizeFullUrl(d.official_website) === normalizedFull);
      if (exactPending) return { matchedBy: "hostname_exact", againstTable: "discovered_tools", id: exactPending.id as string };
    }
  } else if (hostname) {
    const { data: publishedMatch } = await supabase.from("tools").select("id, website").ilike("website", `%${hostname}%`).limit(5);
    const exactPublished = (publishedMatch || []).find((t: { website: string | null }) => t.website && normalizeHostname(t.website) === hostname);
    if (exactPublished) return { matchedBy: "hostname_exact", againstTable: "tools", id: exactPublished.id as string };

    const { data: pendingMatch } = await supabase.from("discovered_tools").select("id, hostname").eq("hostname", hostname).limit(1);
    if (pendingMatch && pendingMatch.length > 0) return { matchedBy: "hostname_exact", againstTable: "discovered_tools", id: pendingMatch[0].id as string };
  }

  const { data: slugMatch } = await supabase.from("discovered_tools").select("id").eq("slug", slug).limit(1);
  if (slugMatch && slugMatch.length > 0) return { matchedBy: "slug_exact", againstTable: "discovered_tools", id: slugMatch[0].id as string };

  return { matchedBy: null, againstTable: null, id: null };
}

export type IngestOutcome =
  | { ok: true; id: string; status: string }
  | { ok: false; error: string };

// The full per-candidate pipeline: hostname/slug normalization ->
// reachability validation -> duplicate detection -> scoring -> insert.
// Used identically whether the candidate came from an admin paste (Manual),
// a CSV row, or an automated provider fetch.
export async function ingestOne(
  supabase: SupabaseClient,
  candidate: NormalizedCandidate,
  providerId: string | null,
  reviewerEmail: string | null,
): Promise<IngestOutcome> {
  const hostname = normalizeHostname(candidate.officialWebsite);
  const slug = await uniqueSlug(supabase, candidate.name);

  const validation = await validateWebsite(candidate.officialWebsite);
  const duplicateMatch = await findDuplicate(supabase, hostname, slug, candidate.officialWebsite);
  const duplicateScore = computeDuplicateScore(duplicateMatch);
  const { score: confidenceScore } = computeConfidenceScore({
    name: candidate.name,
    officialWebsite: candidate.officialWebsite,
    shortDescription: candidate.shortDescription,
    categoryId: candidate.categoryId,
    validation,
  });
  const qualityScore = computeQualityScore(confidenceScore, duplicateScore, validation);

  let status: string;
  if (duplicateMatch.matchedBy) status = "duplicate";
  else if (!validation.reachable || !validation.https || validation.dead_domain) status = "needs_review";
  else status = "validated";

  const { data: record, error } = await supabase
    .from("discovered_tools")
    .insert({
      name: candidate.name,
      slug,
      official_website: validation.final_url || candidate.officialWebsite,
      hostname,
      category_id: candidate.categoryId,
      provider_id: providerId,
      source_url: candidate.sourceUrl,
      logo_url: candidate.logoUrl,
      short_description: candidate.shortDescription,
      status,
      confidence_score: confidenceScore,
      duplicate_score: duplicateScore,
      quality_score: qualityScore,
      validation_notes: validation,
      duplicate_of_tool_id: duplicateMatch.againstTable === "tools" ? duplicateMatch.id : null,
      duplicate_of_discovery_id: duplicateMatch.againstTable === "discovered_tools" ? duplicateMatch.id : null,
      reviewed_by: status === "duplicate" ? reviewerEmail : null,
      reviewed_at: status === "duplicate" ? new Date().toISOString() : null,
    })
    .select("id")
    .single();

  if (error) return { ok: false, error: error.message };
  return { ok: true, id: record.id as string, status };
}

import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { normalizeHostname, validateWebsite } from "../_shared/discoveryValidation.ts";
import { computeConfidenceScore, computeDuplicateScore, computeQualityScore, type DuplicateMatch } from "../_shared/discoveryScoring.ts";

// Ingestion entry point for the Discovery Engine's first two providers:
// Manual Import (action:'manual', one candidate) and CSV Import
// (action:'csv', many rows + a discovery_import_batches row for progress).
// Runs Validation -> Duplicate Detection -> Quality Score inline for both,
// synchronously — deliberate for these two low-volume, admin-driven
// providers (see the implementation plan). A future high-volume provider
// (Product Hunt, GitHub, npm, ...) would add its own provider module and
// call the same core path; nothing here is provider-specific beyond the
// action switch. GET lists discovery_import_batches for the Import History
// page (paginated, newest first).

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

function slugify(name: string): string {
  return name
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 80) || "candidate";
}

async function uniqueSlug(supabase: ReturnType<typeof createClient>, base: string): Promise<string> {
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

interface RawCandidate {
  name?: unknown;
  official_website?: unknown;
  category_id?: unknown;
  short_description?: unknown;
  logo_url?: unknown;
  source_url?: unknown;
}

interface NormalizedCandidate {
  name: string;
  officialWebsite: string;
  categoryId: string | null;
  shortDescription: string | null;
  logoUrl: string | null;
  sourceUrl: string | null;
}

function normalizeCandidate(raw: RawCandidate): NormalizedCandidate | { error: string } {
  const name = typeof raw.name === "string" ? raw.name.trim() : "";
  const officialWebsite = typeof raw.official_website === "string" ? raw.official_website.trim() : "";
  if (!name) return { error: "name is required" };
  if (!officialWebsite) return { error: "official_website is required" };
  return {
    name,
    officialWebsite,
    categoryId: typeof raw.category_id === "string" && raw.category_id.trim() ? raw.category_id.trim() : null,
    shortDescription: typeof raw.short_description === "string" && raw.short_description.trim() ? raw.short_description.trim() : null,
    logoUrl: typeof raw.logo_url === "string" && raw.logo_url.trim() ? raw.logo_url.trim() : null,
    sourceUrl: typeof raw.source_url === "string" && raw.source_url.trim() ? raw.source_url.trim() : null,
  };
}

async function findDuplicate(supabase: ReturnType<typeof createClient>, hostname: string | null, slug: string): Promise<DuplicateMatch> {
  if (hostname) {
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

async function ingestOne(
  supabase: ReturnType<typeof createClient>,
  candidate: NormalizedCandidate,
  providerId: string | null,
  reviewerEmail: string | null,
): Promise<{ ok: true; id: string } | { ok: false; error: string }> {
  const hostname = normalizeHostname(candidate.officialWebsite);
  const slug = await uniqueSlug(supabase, candidate.name);

  const validation = await validateWebsite(candidate.officialWebsite);
  const duplicateMatch = await findDuplicate(supabase, hostname, slug);
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
  return { ok: true, id: record.id as string };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const session = await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    if (req.method === "GET") {
      const url = new URL(req.url);
      const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
      const perPage = Math.min(100, Math.max(1, Number(url.searchParams.get("per_page")) || 25));
      const rangeFrom = (page - 1) * perPage;
      const rangeTo = rangeFrom + perPage - 1;

      const { data, error, count } = await supabase
        .from("discovery_import_batches")
        .select("*, discovery_providers(id, key, name)", { count: "exact" })
        .order("created_at", { ascending: false })
        .range(rangeFrom, rangeTo);
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      return jsonResponse({ ok: true, data: data || [], total: count || 0, page, per_page: perPage });
    }

    if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

    const payload = await req.json();

    if (payload.action === "manual") {
      const normalized = normalizeCandidate(payload);
      if ("error" in normalized) return jsonResponse({ ok: false, error: normalized.error }, 400);

      const { data: provider } = await supabase.from("discovery_providers").select("id").eq("key", "manual").maybeSingle();
      const result = await ingestOne(supabase, normalized, (provider?.id as string) || null, session.email);
      if (!result.ok) return jsonResponse({ ok: false, error: result.error }, 500);

      const { data: record } = await supabase.from("discovered_tools").select("*").eq("id", result.id).single();
      return jsonResponse({ ok: true, data: record });
    }

    if (payload.action === "csv") {
      const rows: RawCandidate[] = Array.isArray(payload.rows) ? payload.rows : [];
      const fileName = typeof payload.file_name === "string" ? payload.file_name : null;
      if (rows.length === 0) return jsonResponse({ ok: false, error: "rows (non-empty array) is required" }, 400);

      const { data: provider } = await supabase.from("discovery_providers").select("id").eq("key", "csv").maybeSingle();
      const providerId = (provider?.id as string) || null;

      const { data: batch, error: batchError } = await supabase
        .from("discovery_import_batches")
        .insert({ provider_id: providerId, file_name: fileName, total_rows: rows.length, status: "processing", created_by: session.email })
        .select()
        .single();
      if (batchError) return jsonResponse({ ok: false, error: batchError.message }, 500);

      let successCount = 0;
      const errors: { row: number; error: string }[] = [];

      for (let i = 0; i < rows.length; i++) {
        const normalized = normalizeCandidate(rows[i]);
        if ("error" in normalized) {
          errors.push({ row: i + 1, error: normalized.error });
          continue;
        }
        const result = await ingestOne(supabase, normalized, providerId, session.email);
        if (result.ok) successCount += 1;
        else errors.push({ row: i + 1, error: result.error });
      }

      const { data: finishedBatch, error: finishError } = await supabase
        .from("discovery_import_batches")
        .update({
          processed_rows: rows.length,
          success_count: successCount,
          error_count: errors.length,
          status: errors.length === rows.length ? "failed" : "completed",
          errors,
          completed_at: new Date().toISOString(),
        })
        .eq("id", batch.id)
        .select()
        .single();
      if (finishError) return jsonResponse({ ok: false, error: finishError.message }, 500);

      return jsonResponse({ ok: true, data: finishedBatch });
    }

    return jsonResponse({ ok: false, error: "Unknown action" }, 400);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});

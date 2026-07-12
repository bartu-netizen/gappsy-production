import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { normalizeHostname, validateWebsite } from "../_shared/discoveryValidation.ts";
import { computeConfidenceScore, computeDuplicateScore, computeQualityScore } from "../_shared/discoveryScoring.ts";

// Owns discovered_tools end-to-end: the Discovery Queue admin page. GET
// lists/searches/filters/paginates (GET ?id= for a single row's detail,
// including its validation_notes checklist). PUT ?id= transitions a single
// row's status (New/Validated/Needs Review/Duplicate/Rejected/Approved For
// Crawl/Crawled) — reviewed_by is always the server-verified admin email,
// never client-supplied. POST handles bulk actions (bulk-status,
// bulk-delete, revalidate) for the Queue's bulk-selection toolbar and the
// Validation Results page's "re-check" action, mirroring admin-tools'
// bulk-assign-category pattern.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const VALID_STATUSES = new Set([
  "new", "validated", "needs_review", "duplicate", "rejected", "approved_for_crawl", "crawled",
]);
const SORTABLE_COLUMNS = new Set(["created_at", "updated_at", "name", "quality_score", "confidence_score"]);
const DEFAULT_PER_PAGE = 25;
const MAX_PER_PAGE = 100;

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

    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id) {
        const { data: record, error } = await supabase
          .from("discovered_tools")
          .select("*, tool_categories(id, name, slug), discovery_providers(id, key, name)")
          .eq("id", id)
          .maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!record) return jsonResponse({ ok: false, error: "Discovered tool not found" }, 404);
        return jsonResponse({ ok: true, data: record });
      }

      const q = (url.searchParams.get("q") || "").trim();
      const statusFilter = url.searchParams.get("status");
      const providerFilter = url.searchParams.get("provider_id");
      const categoryFilter = url.searchParams.get("category_id");
      const dateFrom = url.searchParams.get("date_from");
      const dateTo = url.searchParams.get("date_to");
      const sortColumn = SORTABLE_COLUMNS.has(url.searchParams.get("sort") || "") ? (url.searchParams.get("sort") as string) : "created_at";
      const sortAscending = url.searchParams.get("dir") === "asc";
      const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
      const perPage = Math.min(MAX_PER_PAGE, Math.max(1, Number(url.searchParams.get("per_page")) || DEFAULT_PER_PAGE));
      const rangeFrom = (page - 1) * perPage;
      const rangeTo = rangeFrom + perPage - 1;

      let query = supabase
        .from("discovered_tools")
        .select("*, tool_categories(id, name, slug), discovery_providers(id, key, name)", { count: "exact" });

      if (q) query = query.or(`name.ilike.%${q}%,hostname.ilike.%${q}%,official_website.ilike.%${q}%`);
      if (statusFilter && statusFilter !== "all") query = query.eq("status", statusFilter);
      if (providerFilter) query = query.eq("provider_id", providerFilter);
      if (categoryFilter) query = query.eq("category_id", categoryFilter);
      if (dateFrom) query = query.gte("created_at", dateFrom);
      if (dateTo) query = query.lte("created_at", dateTo);
      query = query.order(sortColumn, { ascending: sortAscending }).range(rangeFrom, rangeTo);

      const { data, error, count } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      // Attach each row's most recent crawl job (if any) so the Queue can
      // show crawl status/actions inline without a second round-trip per
      // row. One extra query, reduced to latest-per-candidate in memory —
      // fine at this page size (<=100 rows).
      const candidateIds = (data || []).map((r: { id: string }) => r.id);
      let latestJobByCandidate: Record<string, unknown> = {};
      if (candidateIds.length > 0) {
        const { data: jobs } = await supabase
          .from("crawl_jobs")
          .select("id, discovery_candidate_id, status, progress, error_code, error_message, created_draft_tool_id, created_at")
          .in("discovery_candidate_id", candidateIds)
          .order("created_at", { ascending: false });
        latestJobByCandidate = (jobs || []).reduce((acc: Record<string, unknown>, job: { discovery_candidate_id: string }) => {
          if (!acc[job.discovery_candidate_id]) acc[job.discovery_candidate_id] = job;
          return acc;
        }, {});
      }
      const enriched = (data || []).map((row: { id: string }) => ({ ...row, latest_crawl_job: latestJobByCandidate[row.id] || null }));

      return jsonResponse({ ok: true, data: enriched, total: count || 0, page, per_page: perPage });
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Discovered tool ID is required" }, 400);
      const payload = await req.json();

      const updates: Record<string, unknown> = {};
      if (Object.prototype.hasOwnProperty.call(payload, "status")) {
        if (typeof payload.status !== "string" || !VALID_STATUSES.has(payload.status)) {
          return jsonResponse({ ok: false, error: `status must be one of: ${[...VALID_STATUSES].join(", ")}` }, 400);
        }
        updates.status = payload.status;
        updates.reviewed_by = session.email;
        updates.reviewed_at = new Date().toISOString();
      }
      if (Object.prototype.hasOwnProperty.call(payload, "category_id")) {
        updates.category_id = typeof payload.category_id === "string" ? payload.category_id : null;
      }
      updates.updated_at = new Date().toISOString();

      if (Object.keys(updates).length === 1) {
        // only updated_at got set — nothing real to persist
        return jsonResponse({ ok: false, error: "No valid fields to update" }, 400);
      }

      const { data: record, error } = await supabase
        .from("discovered_tools")
        .update(updates)
        .eq("id", id)
        .select()
        .single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      if (!record) return jsonResponse({ ok: false, error: "Discovered tool not found" }, 404);

      return jsonResponse({ ok: true, data: record });
    }

    if (req.method === "POST") {
      const payload = await req.json();

      if (payload.action === "bulk-status") {
        const ids = Array.isArray(payload.ids) ? payload.ids.filter((v: unknown) => typeof v === "string") : [];
        const status = typeof payload.status === "string" ? payload.status : null;
        if (ids.length === 0 || !status || !VALID_STATUSES.has(status)) {
          return jsonResponse({ ok: false, error: "ids (non-empty array) and a valid status are required" }, 400);
        }
        const { data, error } = await supabase
          .from("discovered_tools")
          .update({ status, reviewed_by: session.email, reviewed_at: new Date().toISOString(), updated_at: new Date().toISOString() })
          .in("id", ids)
          .select("id");
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        return jsonResponse({ ok: true, data: { updated_count: (data || []).length } });
      }

      if (payload.action === "bulk-delete") {
        const ids = Array.isArray(payload.ids) ? payload.ids.filter((v: unknown) => typeof v === "string") : [];
        if (ids.length === 0) return jsonResponse({ ok: false, error: "ids (non-empty array) is required" }, 400);
        const { error } = await supabase.from("discovered_tools").delete().in("id", ids);
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        return jsonResponse({ ok: true, data: { deleted_count: ids.length } });
      }

      // Re-runs Validation + Quality Score (not duplicate detection — a
      // confirmed/dismissed duplicate match doesn't change on revalidate)
      // for one or more existing candidates. Used by Validation Results'
      // "re-check" action and the Queue's bulk toolbar.
      if (payload.action === "revalidate") {
        const ids = Array.isArray(payload.ids) ? payload.ids.filter((v: unknown) => typeof v === "string") : [];
        if (ids.length === 0) return jsonResponse({ ok: false, error: "ids (non-empty array) is required" }, 400);

        const { data: rows, error: rowsError } = await supabase
          .from("discovered_tools")
          .select("id, name, official_website, category_id, short_description, duplicate_score")
          .in("id", ids);
        if (rowsError) return jsonResponse({ ok: false, error: rowsError.message }, 500);

        let revalidatedCount = 0;
        for (const row of rows || []) {
          const validation = await validateWebsite(row.official_website as string);
          const hostname = normalizeHostname(row.official_website as string);
          const { score: confidenceScore } = computeConfidenceScore({
            name: row.name as string,
            officialWebsite: row.official_website as string,
            shortDescription: row.short_description as string | null,
            categoryId: row.category_id as string | null,
            validation,
          });
          const duplicateScore = (row.duplicate_score as number | null) || 0;
          const qualityScore = computeQualityScore(confidenceScore, duplicateScore, validation);
          const nextStatus = duplicateScore >= 90 ? "duplicate" : (!validation.reachable || !validation.https || validation.dead_domain) ? "needs_review" : "validated";

          const { error: updateError } = await supabase
            .from("discovered_tools")
            .update({
              hostname,
              validation_notes: validation,
              confidence_score: confidenceScore,
              quality_score: qualityScore,
              status: nextStatus,
              updated_at: new Date().toISOString(),
            })
            .eq("id", row.id);
          if (!updateError) revalidatedCount += 1;
        }

        return jsonResponse({ ok: true, data: { revalidated_count: revalidatedCount } });
      }

      return jsonResponse({ ok: false, error: "Unknown action" }, 400);
    }

    if (req.method === "DELETE") {
      if (!id) return jsonResponse({ ok: false, error: "Discovered tool ID is required" }, 400);
      const { error } = await supabase.from("discovered_tools").delete().eq("id", id);
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true });
    }

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});

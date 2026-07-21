import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Owns tool_import_history end-to-end: the New Software wizard (and, later,
// bulk import / the public API / a real extraction engine) POSTs one row
// here per import attempt with real, measured data — never a fabricated
// duration, section list, or credit count. GET lists/searches/paginates;
// GET ?id= is what "reopen an import" resolves against (it returns the
// linked tool so the UI can jump straight into the editor). PUT updates a
// job's status/progress (the hook a future async job runner attaches to,
// and what today's Cancel action uses). POST action:'retry' re-queues a
// failed attempt as a fresh row rather than mutating history in place.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

// 'pending'/'success' are kept for backward compatibility with rows written
// before this phase — new rows use the richer lifecycle vocabulary below.
const VALID_STATUSES = new Set([
  "pending", "success", "failed",
  "queued", "fetching", "extracting", "review_required", "ready", "published", "cancelled",
]);
const SORTABLE_COLUMNS = new Set(["created_at", "completed_at", "status"]);
const DEFAULT_PER_PAGE = 25;
const MAX_PER_PAGE = 100;

class ValidationError extends Error {}

function clampProgress(value: unknown, fallback: number): number {
  const n = Number(value);
  if (!Number.isFinite(n)) return fallback;
  return Math.max(0, Math.min(100, Math.floor(n)));
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const session = await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }
    const supabase = createClient(supabaseUrl, serviceRoleKey);
    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id) {
        const { data: record, error } = await supabase
          .from("tool_import_history")
          .select("*, tools(id, slug, name, logo, status)")
          .eq("id", id)
          .maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!record) return jsonResponse({ ok: false, error: "Import record not found" }, 404);
        return jsonResponse({ ok: true, data: record });
      }

      const q = (url.searchParams.get("q") || "").trim();
      const statusFilter = url.searchParams.get("status");
      const sortColumn = SORTABLE_COLUMNS.has(url.searchParams.get("sort") || "") ? (url.searchParams.get("sort") as string) : "created_at";
      const sortAscending = url.searchParams.get("dir") === "asc";
      const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
      const perPage = Math.min(MAX_PER_PAGE, Math.max(1, Number(url.searchParams.get("per_page")) || DEFAULT_PER_PAGE));
      const rangeFrom = (page - 1) * perPage;
      const rangeTo = rangeFrom + perPage - 1;

      // A broad search term could match hundreds of tools — pre-fetching
      // those ids for a .in("tool_id", ids) filter risks the same
      // URL-length class of bug that broke tool-analytics/tool-comparisons.
      // An inner-joined embed filters server-side instead, so no id list is
      // ever built.
      let query = supabase
        .from("tool_import_history")
        .select(q ? "*, tools!inner(id, slug, name, logo, status)" : "*, tools(id, slug, name, logo, status)", { count: "exact" });
      if (statusFilter && statusFilter !== "all") query = query.eq("status", statusFilter);
      if (q) query = query.or(`name.ilike.%${q}%,slug.ilike.%${q}%`, { referencedTable: "tools" });
      query = query.order(sortColumn, { ascending: sortAscending }).range(rangeFrom, rangeTo);

      const { data, error, count } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      return jsonResponse({ ok: true, data: data || [], total: count || 0, page, per_page: perPage });
    }

    if (req.method === "POST") {
      const payload = await req.json();

      if (payload.action === "retry") {
        if (!payload.id || typeof payload.id !== "string") {
          return jsonResponse({ ok: false, error: "id is required" }, 400);
        }
        const { data: source, error: sourceError } = await supabase
          .from("tool_import_history")
          .select("*")
          .eq("id", payload.id)
          .maybeSingle();
        if (sourceError) return jsonResponse({ ok: false, error: sourceError.message }, 500);
        if (!source) return jsonResponse({ ok: false, error: "Import record not found" }, 404);

        const { data: record, error } = await supabase
          .from("tool_import_history")
          .insert({
            tool_id: source.tool_id,
            source: source.source,
            source_url: source.source_url,
            status: "queued",
            progress: 0,
            imported_sections: [],
            errors: [],
            credits_used: 0,
            pages_processed: 0,
            created_by: session.email,
            started_at: new Date().toISOString(),
            completed_at: null,
          })
          .select()
          .single();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        return jsonResponse({ ok: true, data: record });
      }

      try {
        const toolId = typeof payload.tool_id === "string" && payload.tool_id.trim() ? payload.tool_id.trim() : null;
        const source = typeof payload.source === "string" && payload.source.trim() ? payload.source.trim() : "wizard";
        const sourceUrl = typeof payload.source_url === "string" && payload.source_url.trim() ? payload.source_url.trim() : null;
        const status = typeof payload.status === "string" && VALID_STATUSES.has(payload.status) ? payload.status : "review_required";
        const importedSections = Array.isArray(payload.imported_sections)
          ? payload.imported_sections.map((s: unknown) => String(s)).filter(Boolean)
          : [];
        const errors = Array.isArray(payload.errors) ? payload.errors.map((e: unknown) => String(e)).filter(Boolean) : [];
        const creditsUsed = Number.isFinite(Number(payload.credits_used)) ? Math.max(0, Math.floor(Number(payload.credits_used))) : 0;
        const pagesProcessed = Number.isFinite(Number(payload.pages_processed)) ? Math.max(0, Math.floor(Number(payload.pages_processed))) : 0;
        const progress = clampProgress(payload.progress, 100);
        const startedAt = typeof payload.started_at === "string" && !Number.isNaN(Date.parse(payload.started_at)) ? payload.started_at : new Date().toISOString();
        const completedAt = typeof payload.completed_at === "string" && !Number.isNaN(Date.parse(payload.completed_at)) ? payload.completed_at : new Date().toISOString();

        if (!sourceUrl && !toolId) {
          throw new ValidationError("Either tool_id or source_url is required to log an import");
        }

        const { data: record, error } = await supabase
          .from("tool_import_history")
          .insert({
            tool_id: toolId,
            source,
            source_url: sourceUrl,
            status,
            progress,
            imported_sections: importedSections,
            errors,
            credits_used: creditsUsed,
            pages_processed: pagesProcessed,
            created_by: session.email,
            started_at: startedAt,
            completed_at: completedAt,
          })
          .select()
          .single();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        return jsonResponse({ ok: true, data: record });
      } catch (validationError) {
        if (validationError instanceof ValidationError) {
          return jsonResponse({ ok: false, error: validationError.message }, 400);
        }
        throw validationError;
      }
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Import ID is required" }, 400);
      const payload = await req.json();

      const updates: Record<string, unknown> = {};
      if (Object.prototype.hasOwnProperty.call(payload, "status")) {
        if (typeof payload.status !== "string" || !VALID_STATUSES.has(payload.status)) {
          return jsonResponse({ ok: false, error: `status must be one of: ${[...VALID_STATUSES].join(", ")}` }, 400);
        }
        updates.status = payload.status;
        if (["published", "failed", "cancelled", "ready"].includes(payload.status) && !Object.prototype.hasOwnProperty.call(payload, "completed_at")) {
          updates.completed_at = new Date().toISOString();
        }
      }
      if (Object.prototype.hasOwnProperty.call(payload, "progress")) {
        updates.progress = clampProgress(payload.progress, 0);
      }
      if (Object.prototype.hasOwnProperty.call(payload, "pages_processed")) {
        updates.pages_processed = Math.max(0, Math.floor(Number(payload.pages_processed) || 0));
      }
      if (Object.prototype.hasOwnProperty.call(payload, "errors") && Array.isArray(payload.errors)) {
        updates.errors = payload.errors.map((e: unknown) => String(e)).filter(Boolean);
      }
      if (Object.prototype.hasOwnProperty.call(payload, "completed_at")) {
        updates.completed_at = typeof payload.completed_at === "string" ? payload.completed_at : null;
      }

      if (Object.keys(updates).length === 0) {
        return jsonResponse({ ok: false, error: "No valid fields to update" }, 400);
      }

      const { data: record, error } = await supabase
        .from("tool_import_history")
        .update(updates)
        .eq("id", id)
        .select()
        .single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      if (!record) return jsonResponse({ ok: false, error: "Import record not found" }, 404);

      return jsonResponse({ ok: true, data: record });
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

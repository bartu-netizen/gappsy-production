import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Owns tool_import_history end-to-end: the New Software wizard (and, later,
// bulk import / the public API) POSTs one row here per import attempt with
// real, measured data — never a fabricated duration, section list, or
// credit count. GET lists/searches/paginates; GET ?id= is what "reopen an
// import" resolves against (it returns the linked tool so the UI can jump
// straight into the editor).

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const VALID_STATUSES = new Set(["pending", "success", "failed"]);
const SORTABLE_COLUMNS = new Set(["created_at", "completed_at", "status"]);
const DEFAULT_PER_PAGE = 25;
const MAX_PER_PAGE = 100;

class ValidationError extends Error {}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);

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

      let toolIdsForSearch: string[] | null = null;
      if (q) {
        const { data: matches, error: matchError } = await supabase
          .from("tools")
          .select("id")
          .or(`name.ilike.%${q}%,slug.ilike.%${q}%`);
        if (matchError) return jsonResponse({ ok: false, error: matchError.message }, 500);
        toolIdsForSearch = (matches || []).map((t: { id: string }) => t.id);
        if (toolIdsForSearch.length === 0) {
          return jsonResponse({ ok: true, data: [], total: 0, page, per_page: perPage });
        }
      }

      let query = supabase.from("tool_import_history").select("*, tools(id, slug, name, logo, status)", { count: "exact" });
      if (statusFilter && statusFilter !== "all") query = query.eq("status", statusFilter);
      if (toolIdsForSearch) query = query.in("tool_id", toolIdsForSearch);
      query = query.order(sortColumn, { ascending: sortAscending }).range(rangeFrom, rangeTo);

      const { data, error, count } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      return jsonResponse({ ok: true, data: data || [], total: count || 0, page, per_page: perPage });
    }

    if (req.method === "POST") {
      const payload = await req.json();

      try {
        const toolId = typeof payload.tool_id === "string" && payload.tool_id.trim() ? payload.tool_id.trim() : null;
        const source = typeof payload.source === "string" && payload.source.trim() ? payload.source.trim() : "wizard";
        const sourceUrl = typeof payload.source_url === "string" && payload.source_url.trim() ? payload.source_url.trim() : null;
        const status = typeof payload.status === "string" && VALID_STATUSES.has(payload.status) ? payload.status : "success";
        const importedSections = Array.isArray(payload.imported_sections)
          ? payload.imported_sections.map((s: unknown) => String(s)).filter(Boolean)
          : [];
        const errors = Array.isArray(payload.errors) ? payload.errors.map((e: unknown) => String(e)).filter(Boolean) : [];
        const creditsUsed = Number.isFinite(Number(payload.credits_used)) ? Math.max(0, Math.floor(Number(payload.credits_used))) : 0;
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
            imported_sections: importedSections,
            errors,
            credits_used: creditsUsed,
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

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});

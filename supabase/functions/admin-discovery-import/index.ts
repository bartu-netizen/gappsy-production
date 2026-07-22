import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { ingestOne, normalizeCandidate, type RawCandidate } from "../_shared/discoveryIngest.ts";

// Ingestion entry point for the Discovery Engine's admin-driven providers:
// Manual Import (action:'manual', one candidate) and CSV Import
// (action:'csv', many rows + a discovery_import_batches row for progress).
// Runs Validation -> Duplicate Detection -> Quality Score inline for both,
// synchronously — deliberate for these two low-volume, admin-driven
// providers. The core ingest path (normalizeCandidate/ingestOne) lives in
// _shared/discoveryIngest.ts and is shared with the automated provider
// runner (discoveryProviderRunner.ts) — nothing here is provider-specific
// beyond the action switch. GET lists discovery_import_batches for the
// Import History page (paginated, newest first).

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
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
      const normalized = await normalizeCandidate(supabase, payload);
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
        const normalized = await normalizeCandidate(supabase, rows[i]);
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

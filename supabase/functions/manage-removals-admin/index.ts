import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    const body = req.method === "POST" ? await req.json().catch(() => ({})) : {};
    const urlParams = new URL(req.url).searchParams;

    const state     = body.state     || urlParams.get("state")     || null;
    const outcome   = body.outcome   || urlParams.get("outcome")   || null;
    const search    = body.search    || urlParams.get("search")    || null;
    const date_from = body.date_from || urlParams.get("date_from") || null;
    const date_to   = body.date_to   || urlParams.get("date_to")   || null;
    const limit     = Math.min(parseInt(body.limit  || urlParams.get("limit")  || "100", 10), 500);
    const offset    = Math.max(0, parseInt(body.offset || urlParams.get("offset") || "0", 10));

    const [rowsResult, summaryResult] = await Promise.all([
      supabase.rpc("admin_get_manage_funnel_rows", {
        p_state:     state     || null,
        p_outcome:   outcome   || null,
        p_search:    search    || null,
        p_date_from: date_from || null,
        p_date_to:   date_to   || null,
        p_limit:     limit,
        p_offset:    offset,
      }),
      supabase.rpc("admin_get_manage_funnel_rows", {
        p_state:     null,
        p_outcome:   null,
        p_search:    null,
        p_date_from: null,
        p_date_to:   null,
        p_limit:     2000,
        p_offset:    0,
      }),
    ]);

    if (rowsResult.error) {
      return new Response(JSON.stringify({ ok: false, error: rowsResult.error.message }), {
        status: 500,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    if (summaryResult.error) {
      return new Response(JSON.stringify({ ok: false, error: "Summary query failed: " + summaryResult.error.message }), {
        status: 500,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    const allRows = (summaryResult.data || []) as {
      manage_current_outcome: string;
      listing_management_status: string;
      state_slug: string;
    }[];

    const summary = {
      total:                allRows.length,
      hidden_self_removed:  allRows.filter(r =>
        r.manage_current_outcome === "removed" || r.listing_management_status === "removal_pending"
      ).length,
      recovered:            allRows.filter(r => r.manage_current_outcome === "recovered").length,
      remove_intent:        allRows.filter(r => r.manage_current_outcome === "remove_intent").length,
      opened_only:          allRows.filter(r => r.manage_current_outcome === "opened").length,
      affected_states:      new Set(allRows.map(r => r.state_slug).filter(Boolean)).size,
    };

    return new Response(JSON.stringify({
      ok:      true,
      rows:    rowsResult.data || [],
      summary,
      pagination: { limit, offset },
    }), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });

  } catch (err) {
    const msg = (err as Error).message || "Unknown error";
    const isAuthError = msg.includes("admin") || msg.includes("session") || msg.includes("token");
    return new Response(JSON.stringify({ ok: false, error: msg }), {
      status: isAuthError ? 401 : 500,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }
});

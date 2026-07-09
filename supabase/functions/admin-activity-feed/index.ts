import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function timeAgo(iso: string | null): string {
  if (!iso) return "—";
  const ms = Date.now() - new Date(iso).getTime();
  if (!Number.isFinite(ms) || ms < 0) return "just now";
  const s = Math.floor(ms / 1000);
  if (s < 60) return `${s}s ago`;
  const m = Math.floor(s / 60);
  if (m < 60) return `${m} min ago`;
  const h = Math.floor(m / 60);
  if (h < 24) return `${h}h ago`;
  const d = Math.floor(h / 24);
  return `${d}d ago`;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const auth = await authenticateAdmin(req);
    if (!auth.success) return createAuthErrorResponse(auth, corsHeaders);

    const url = new URL(req.url);
    const rawCf = url.searchParams.get("confidence_filter") || "all";
    const confidenceFilter = rawCf === "human_only" ? "likely_human" : rawCf;
    const state = url.searchParams.get("state") || null;
    const agencyIdParam = url.searchParams.get("agency_id");
    const agencyId = agencyIdParam && /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(agencyIdParam)
      ? agencyIdParam
      : null;
    const limit = Math.min(Math.max(parseInt(url.searchParams.get("limit") || "200"), 1), 500);
    const windowMinutesRaw = parseInt(url.searchParams.get("window_minutes") || "0");
    const windowMinutes = Number.isFinite(windowMinutesRaw) && windowMinutesRaw > 0 ? windowMinutesRaw : null;
    const includeScores = url.searchParams.get("include_scores") !== "0";
    const includePanels = url.searchParams.get("include_panels") !== "0";

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    const feedPromise = supabase.rpc("get_admin_activity_feed", {
      p_limit: limit,
      p_state_slug: state,
      p_agency_id: agencyId,
      p_window_minutes: windowMinutes,
    });

    const scoresPromise = includeScores
      ? supabase.rpc("get_admin_activity_intent_scores", {
          p_state_slug: state,
          p_limit: 200,
        })
      : Promise.resolve({ data: [], error: null });

    const readyPromise = includePanels
      ? supabase.rpc("get_admin_ready_to_close", {
          p_state_slug: state,
          p_window_hours: 72,
          p_limit: 20,
        })
      : Promise.resolve({ data: [], error: null });

    const atRiskPromise = includePanels
      ? supabase.rpc("get_admin_at_risk", {
          p_state_slug: state,
          p_window_hours: 168,
          p_limit: 20,
        })
      : Promise.resolve({ data: [], error: null });

    const revenuePromise = includePanels
      ? supabase.rpc("get_admin_revenue_summary", { p_state_slug: state })
      : Promise.resolve({ data: null, error: null });

    const [
      { data: feed, error: feedErr },
      { data: scores, error: scoresErr },
      { data: readyToClose, error: readyErr },
      { data: atRisk, error: riskErr },
      { data: revenue, error: revenueErr },
    ] = await Promise.all([feedPromise, scoresPromise, readyPromise, atRiskPromise, revenuePromise]);

    if (feedErr) return jsonResponse({ ok: false, error: feedErr.message }, 500);
    if (scoresErr) return jsonResponse({ ok: false, error: scoresErr.message }, 500);
    if (readyErr) return jsonResponse({ ok: false, error: readyErr.message }, 500);
    if (riskErr) return jsonResponse({ ok: false, error: riskErr.message }, 500);
    if (revenueErr) return jsonResponse({ ok: false, error: revenueErr.message }, 500);

    const scoreMap = new Map<string, number>();
    const scoreRows = (scores as Record<string, unknown>[]) ?? [];
    for (const s of scoreRows) {
      const id = String(s.agency_id ?? "");
      if (id) scoreMap.set(id, Number(s.intent_score ?? 0));
    }

    const feedFiltered = ((feed as Record<string, unknown>[]) ?? []).filter((r) => {
      if (confidenceFilter === "all") return true;
      const lvl = r.confidence_level as string | null;
      if (confidenceFilter === "verified_only") return lvl === "verified_human";
      // likely_human: exclude scanner, include possible_human + verified_human + unclassified (null)
      return lvl !== "scanner";
    });

    const rows = feedFiltered.map((r) => {
      const aid = String(r.agency_id ?? "");
      const intentScore = scoreMap.get(aid) ?? 0;
      return {
        id: r.id,
        created_at: r.created_at,
        time_ago: timeAgo(r.created_at as string | null),
        agency_id: r.agency_id,
        agency_name: r.agency_name,
        agency_slug: r.agency_slug,
        state_slug: r.state_slug,
        state_name: r.state_name,
        event_name: r.event_name,
        event_group: r.event_group,
        funnel_stage: r.funnel_stage,
        funnel_step: r.funnel_step,
        source: r.source,
        intent_weight: r.intent_weight,
        intent_score: intentScore,
        readable_label: r.readable_label,
        metadata: r.metadata,
        intent_stage: r.intent_stage,
        confidence_level: r.confidence_level ?? "unclassified",
        identity_method: r.identity_method,
        identity_confidence: r.identity_confidence,
        identity_source: r.identity_source,
      };
    });

    const readyRows = ((readyToClose as Record<string, unknown>[]) ?? []).map((r) => ({
      ...r,
      last_action_ago: timeAgo(r.last_action_at as string | null),
    }));

    const atRiskRows = ((atRisk as Record<string, unknown>[]) ?? []).map((r) => ({
      ...r,
      last_action_ago: timeAgo(r.last_action_at as string | null),
    }));

    const revenueObj = Array.isArray(revenue) ? revenue[0] ?? null : revenue;

    return jsonResponse({
      ok: true,
      count: rows.length,
      events: rows,
      scores: scoreRows,
      ready_to_close: readyRows,
      at_risk: atRiskRows,
      revenue: revenueObj,
      window_minutes: windowMinutes,
      generated_at: new Date().toISOString(),
    });
  } catch (err) {
    return jsonResponse(
      { ok: false, error: err instanceof Error ? err.message : "Unknown error" },
      500,
    );
  }
});

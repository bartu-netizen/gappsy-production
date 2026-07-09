import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function str(v: unknown): string {
  const s = String(v ?? "").trim();
  return s === "null" || s === "undefined" ? "" : s;
}

function getRangeStart(rangeDays: number | null): string | null {
  if (!rangeDays) return null;
  const d = new Date();
  d.setDate(d.getDate() - rangeDays);
  return d.toISOString();
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const authResult = await authenticateAdmin(req);
  if (!authResult.success) {
    return createAuthErrorResponse(authResult, corsHeaders);
  }

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    { auth: { autoRefreshToken: false, persistSession: false } }
  );

  const url = new URL(req.url);
  const agencyId = url.searchParams.get("agency_id") ?? "";
  const stateFilter = url.searchParams.get("state") ?? "";
  const rangeParam = url.searchParams.get("range_days");
  const rangeDays = rangeParam ? parseInt(rangeParam) : 30;
  const includeDemo = url.searchParams.get("include_demo") === "1";
  const limitParam = Math.min(parseInt(url.searchParams.get("limit") ?? "50"), 200);
  const offsetParam = parseInt(url.searchParams.get("offset") ?? "0");
  const searchQ = url.searchParams.get("q") ?? "";

  try {
    // ── Agency detail mode ──────────────────────────────────────────────────
    if (agencyId) {
      const rangeStart = getRangeStart(rangeDays === 0 ? null : rangeDays);

      // Build base query helper
      const baseQuery = () => {
        let q = supabase
          .from("agency_availability_requests")
          .select("*", { count: "exact", head: false })
          .eq("target_agency_id", agencyId)
          .is("deleted_at", null);
        if (!includeDemo) q = q.eq("is_demo", false);
        return q;
      };

      // KPI: all-time totals
      const [realCountQ, demoCountQ] = await Promise.all([
        supabase
          .from("agency_availability_requests")
          .select("id", { count: "exact", head: true })
          .eq("target_agency_id", agencyId)
          .eq("is_demo", false)
          .is("deleted_at", null),
        supabase
          .from("agency_availability_requests")
          .select("id", { count: "exact", head: true })
          .eq("target_agency_id", agencyId)
          .eq("is_demo", true)
          .is("deleted_at", null),
      ]);

      // KPI: by time range
      const rangeCutoffs = [1, 7, 30, 90];
      const rangeCountResults = await Promise.all(
        rangeCutoffs.map(async (days) => {
          const since = getRangeStart(days)!;
          let q = supabase
            .from("agency_availability_requests")
            .select("id", { count: "exact", head: true })
            .eq("target_agency_id", agencyId)
            .gte("created_at", since)
            .is("deleted_at", null);
          if (!includeDemo) q = q.eq("is_demo", false);
          const { count } = await q;
          return { days, count: count ?? 0 };
        })
      );
      const byRange: Record<string, number> = {};
      for (const r of rangeCountResults) byRange[`last_${r.days}d`] = r.count;

      // Daily series (last rangeDays or 90 max)
      const seriesDays = Math.min(rangeDays || 90, 365);
      const seriesStart = getRangeStart(seriesDays)!;
      let seriesQ = supabase
        .from("agency_availability_requests")
        .select("created_at")
        .eq("target_agency_id", agencyId)
        .gte("created_at", seriesStart)
        .is("deleted_at", null)
        .order("created_at", { ascending: true });
      if (!includeDemo) seriesQ = seriesQ.eq("is_demo", false);
      const { data: seriesRows } = await seriesQ;

      // Bucket by day
      const dayBuckets: Record<string, number> = {};
      for (const r of seriesRows ?? []) {
        const day = (r.created_at as string).slice(0, 10);
        dayBuckets[day] = (dayBuckets[day] ?? 0) + 1;
      }
      const daily_series = Object.entries(dayBuckets)
        .sort(([a], [b]) => a.localeCompare(b))
        .map(([date, count]) => ({ date, count }));

      // By state
      let byStateQ = supabase
        .from("agency_availability_requests")
        .select("state_slug")
        .eq("target_agency_id", agencyId)
        .is("deleted_at", null)
        .not("state_slug", "is", null);
      if (rangeStart) byStateQ = byStateQ.gte("created_at", rangeStart);
      if (!includeDemo) byStateQ = byStateQ.eq("is_demo", false);
      const { data: byStateRows } = await byStateQ;
      const stateMap: Record<string, number> = {};
      for (const r of byStateRows ?? []) {
        const s = str(r.state_slug);
        if (s) stateMap[s] = (stateMap[s] ?? 0) + 1;
      }
      const by_state = Object.entries(stateMap)
        .sort(([, a], [, b]) => b - a)
        .map(([state_slug, count]) => ({ state_slug, count }));

      // Unique requesters
      let uniqueQ = supabase
        .from("agency_availability_requests")
        .select("requester_email, client_email")
        .eq("target_agency_id", agencyId)
        .is("deleted_at", null);
      if (rangeStart) uniqueQ = uniqueQ.gte("created_at", rangeStart);
      if (!includeDemo) uniqueQ = uniqueQ.eq("is_demo", false);
      const { data: uniqueRows } = await uniqueQ;
      const emailSet = new Set<string>();
      for (const r of uniqueRows ?? []) {
        const e = str(r.requester_email ?? r.client_email).toLowerCase();
        if (e) emailSet.add(e);
      }

      // Recent requests (last 25)
      let recentQ = supabase
        .from("agency_availability_requests")
        .select("id, created_at, state_slug, requester_email, client_email, requester_name, client_name, is_demo, routing_decision, paid_status_at_time")
        .eq("target_agency_id", agencyId)
        .is("deleted_at", null)
        .order("created_at", { ascending: false })
        .limit(25);
      if (!includeDemo) recentQ = recentQ.eq("is_demo", false);
      const { data: recentRows } = await recentQ;

      // Agency name from most recent row
      const { data: nameRow } = await supabase
        .from("agency_availability_requests")
        .select("agency_name")
        .eq("target_agency_id", agencyId)
        .not("agency_name", "is", null)
        .order("created_at", { ascending: false })
        .limit(1)
        .maybeSingle();

      return json({
        mode: "agency_detail",
        agency_id: agencyId,
        agency_name: str(nameRow?.agency_name),
        kpis: {
          total_real: realCountQ.count ?? 0,
          total_demo: demoCountQ.count ?? 0,
          unique_requesters: emailSet.size,
          ...byRange,
        },
        daily_series,
        by_state,
        recent_requests: (recentRows ?? []).map(r => ({
          id: r.id,
          created_at: r.created_at,
          state_slug: str(r.state_slug),
          requester_email: str(r.requester_email ?? r.client_email),
          requester_name: str(r.requester_name ?? r.client_name),
          is_demo: r.is_demo === true,
          routing_decision: str(r.routing_decision),
          paid_status: str(r.paid_status_at_time),
        })),
      });
    }

    // ── Leaderboard mode ────────────────────────────────────────────────────
    const rangeStart = getRangeStart(rangeDays === 0 ? null : rangeDays);

    let lbQ = supabase
      .from("agency_availability_requests")
      .select("target_agency_id, agency_name, state_slug, is_demo, created_at, requester_email, client_email")
      .is("deleted_at", null)
      .not("target_agency_id", "is", null);

    if (rangeStart) lbQ = lbQ.gte("created_at", rangeStart);
    if (stateFilter) lbQ = lbQ.eq("state_slug", stateFilter);
    if (searchQ) lbQ = lbQ.ilike("agency_name", `%${searchQ}%`);

    const { data: allRows, error: lbErr } = await lbQ.order("created_at", { ascending: false });
    if (lbErr) return json({ error: lbErr.message }, 500);

    // Aggregate
    const agencyMap: Record<string, {
      agency_id: string;
      agency_name: string;
      real_count: number;
      demo_count: number;
      unique_emails: Set<string>;
      states: Set<string>;
      last_request_at: string;
    }> = {};

    for (const r of allRows ?? []) {
      const aid = str(r.target_agency_id);
      if (!aid) continue;
      if (!agencyMap[aid]) {
        agencyMap[aid] = {
          agency_id: aid,
          agency_name: str(r.agency_name),
          real_count: 0,
          demo_count: 0,
          unique_emails: new Set(),
          states: new Set(),
          last_request_at: str(r.created_at),
        };
      }
      const entry = agencyMap[aid];
      if (r.is_demo) entry.demo_count++;
      else entry.real_count++;
      const email = str(r.requester_email ?? r.client_email).toLowerCase();
      if (email) entry.unique_emails.add(email);
      const s = str(r.state_slug);
      if (s) entry.states.add(s);
      if (str(r.created_at) > entry.last_request_at) {
        entry.last_request_at = str(r.created_at);
      }
    }

    let leaderboard = Object.values(agencyMap)
      .filter(e => includeDemo ? true : e.real_count > 0)
      .sort((a, b) => (includeDemo ? (b.real_count + b.demo_count) - (a.real_count + a.demo_count) : b.real_count - a.real_count))
      .slice(offsetParam, offsetParam + limitParam)
      .map((e, i) => ({
        rank: offsetParam + i + 1,
        agency_id: e.agency_id,
        agency_name: e.agency_name,
        real_count: e.real_count,
        demo_count: e.demo_count,
        unique_requesters: e.unique_emails.size,
        top_states: [...e.states].slice(0, 3),
        last_request_at: e.last_request_at,
      }));

    return json({
      mode: "leaderboard",
      range_days: rangeDays,
      include_demo: includeDemo,
      total: Object.keys(agencyMap).length,
      leaderboard,
    });

  } catch (err) {
    console.error("[availability-analytics]", err);
    return json({ error: err instanceof Error ? err.message : "Unknown error" }, 500);
  }
});

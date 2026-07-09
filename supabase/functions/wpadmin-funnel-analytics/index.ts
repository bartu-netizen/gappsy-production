import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, Accept, x-admin-secret, x-admin-token",
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function getFromDate(range: string): string | null {
  if (range === "all") return null;
  const days = range === "24h" ? 1 : range === "7d" ? 7 : range === "30d" ? 30 : 90;
  const d = new Date();
  d.setDate(d.getDate() - days);
  return d.toISOString();
}

// Canonical funnel display order for grouped outputs
const FUNNEL_ORDER = ["your_agency", "demo", "availability", "top25", "spotlight", "matched", "request_replay"];

function sortFunnelKeys(keys: string[]): string[] {
  return keys.slice().sort((a, b) => {
    const ai = FUNNEL_ORDER.indexOf(a);
    const bi = FUNNEL_ORDER.indexOf(b);
    if (ai === -1 && bi === -1) return a.localeCompare(b);
    if (ai === -1) return 1;
    if (bi === -1) return -1;
    return ai - bi;
  });
}

// ── Confidence filter helpers ─────────────────────────────────────────────────
// Apply confidence-based filtering to session queries.
// "likely_human": exclude scanner-flagged sessions
// "verified_only": only verified_human intent_level
// deno-lint-ignore no-explicit-any
function applySessionConfidenceFilter(query: any, cf: string): any {
  if (cf === "likely_human") {
    return query.or("is_scanner_flagged.is.null,is_scanner_flagged.eq.false");
  }
  if (cf === "verified_only") {
    return query.eq("intent_level", "verified_human");
  }
  return query;
}

// Apply confidence-based filtering to event queries.
// deno-lint-ignore no-explicit-any
function applyEventConfidenceFilter(query: any, cf: string): any {
  if (cf === "likely_human") {
    return query.or("intent_level.is.null,intent_level.eq.possible_human,intent_level.eq.verified_human");
  }
  if (cf === "verified_only") {
    return query.eq("intent_level", "verified_human");
  }
  return query;
}

// Agency funnel time ranges are based on session activity (last_event_at / updated_at),
// not only session creation time, so returning visitors are not hidden.
// A session created days ago but active today will appear in the 24h view because
// its last_event_at falls within the window.
// eslint-disable-next-line @typescript-eslint/no-explicit-any
function applySessionActivityFilter(query: any, fromDate: string): any {
  // Priority: last_event_at > updated_at > created_at (fallback)
  // Uses PostgREST OR with nested AND sub-clauses so only one index path is needed.
  return query.or(
    `last_event_at.gte.${fromDate},` +
    `and(last_event_at.is.null,updated_at.gte.${fromDate}),` +
    `and(last_event_at.is.null,updated_at.is.null,created_at.gte.${fromDate})`
  );
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }
  if (req.method !== "GET") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
  const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    return jsonResponse({ error: "Missing env vars" }, 500);
  }

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) return createAuthErrorResponse(authResult, corsHeaders);

    const url = new URL(req.url);
    const action = url.searchParams.get("action") ?? "overview";
    const range = url.searchParams.get("range") ?? "7d";
    const includeDemo = url.searchParams.get("include_demo") === "1";
    const funnelName = url.searchParams.get("funnel_name") ?? "";
    const rawCf = url.searchParams.get("confidence_filter") || "all";
    const confidenceFilter = rawCf === "human_only" ? "likely_human" : rawCf;

    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);
    const fromDate = getFromDate(range);

    // ------------------------------------------------------------------ overview
    if (action === "overview") {
      let sessQuery = supabase
        .from("funnel_sessions")
        .select("id, stage, funnel_type, funnel_name, is_demo, created_at, updated_at, last_event_at", { count: "exact" });

      // Use activity-based filter: sessions active in the time range, not just created in it.
      if (fromDate) sessQuery = applySessionActivityFilter(sessQuery, fromDate);
      if (!includeDemo) sessQuery = sessQuery.or("is_demo.is.null,is_demo.eq.false");
      if (funnelName) sessQuery = sessQuery.eq("funnel_name", funnelName);
      sessQuery = applySessionConfidenceFilter(sessQuery, confidenceFilter);

      const { data: sessions, count: totalSessions, error: sessErr } = await sessQuery.limit(5000);
      if (sessErr) return jsonResponse({ error: sessErr.message }, 500);

      const stageCounts: Record<string, number> = {};
      const funnelCounts: Record<string, number> = {};
      let demoCnt = 0;
      for (const s of (sessions ?? [])) {
        const stage = s.stage ?? "opened";
        stageCounts[stage] = (stageCounts[stage] ?? 0) + 1;
        const fn = s.funnel_name ?? s.funnel_type ?? "unknown";
        funnelCounts[fn] = (funnelCounts[fn] ?? 0) + 1;
        if (s.is_demo) demoCnt++;
      }

      // Events are stamped once when fired — filter by created_at and dedup by strongest identity.
      let evtQuery = supabase
        .from("funnel_events")
        .select("fsid, event_name, step_number, state_slug, created_at, metadata, is_demo, funnel_name");
      if (fromDate) evtQuery = evtQuery.gte("created_at", fromDate);
      if (!includeDemo) evtQuery = evtQuery.or("is_demo.is.null,is_demo.eq.false");
      if (funnelName) evtQuery = evtQuery.eq("funnel_name", funnelName);
      evtQuery = applyEventConfidenceFilter(evtQuery, confidenceFilter);

      const { data: evtRows, error: evtErr } = await evtQuery.limit(50000);
      if (evtErr) return jsonResponse({ error: evtErr.message }, 500);

      const totalEventsSeen = new Set<string>();
      for (const e of (evtRows ?? [])) {
        const meta = (e.metadata as Record<string, unknown>) ?? {};
        const fsid = e.fsid ?? (meta.fsid as string) ?? "";
        const oiid = (meta.open_instance_id as string) ?? "";
        const step = e.step_number ?? 0;
        let key: string;
        if (oiid) {
          key = `${fsid}::${e.event_name}::${oiid}`;
        } else {
          const agencyId = (meta.agency_id as string) ?? "";
          const stSlug = e.state_slug ?? "";
          const token = (meta.token as string) ?? "";
          const ts5s = Math.floor(new Date(e.created_at).getTime() / 5000);
          key = `${fsid}::${e.event_name}::${step}::${agencyId}::${stSlug}::${token}::${ts5s}`;
        }
        totalEventsSeen.add(key);
      }
      const totalEvents = totalEventsSeen.size;

      const paidCount = stageCounts["paid"] ?? 0;
      const checkoutCount = (stageCounts["checkout_started"] ?? 0) + paidCount;
      const convRate = totalSessions ? Math.round((paidCount / totalSessions) * 100) : 0;

      let totalRevenueCents = 0;
      let revenueOrderCount = 0;
      try {
        let revQuery = supabase
          .from("stripe_orders")
          .select("amount_total")
          .eq("payment_status", "paid")
          .is("deleted_at", null);
        if (fromDate) revQuery = revQuery.gte("created_at", fromDate);
        const { data: orders } = await revQuery.limit(10000);
        for (const o of (orders ?? [])) {
          if (o.amount_total && o.amount_total > 0) {
            totalRevenueCents += o.amount_total;
            revenueOrderCount++;
          }
        }
      } catch { /* revenue query is best-effort */ }

      const totalRevenue = totalRevenueCents / 100;
      const avgOrderValue = revenueOrderCount > 0 ? Math.round(totalRevenueCents / revenueOrderCount) / 100 : 0;

      return jsonResponse({
        total_sessions: totalSessions ?? 0,
        total_events: totalEvents ?? 0,
        demo_count: demoCnt,
        stage_counts: stageCounts,
        funnel_counts: funnelCounts,
        paid_count: paidCount,
        checkout_count: checkoutCount,
        conv_rate: convRate,
        total_revenue: totalRevenue,
        avg_order_value: avgOrderValue,
        revenue_order_count: revenueOrderCount,
      });
    }

    // ------------------------------------------------------------------ step_table
    // Events are stamped once when fired, so created_at is the correct filter here.
    if (action === "step_table") {
      let evtQuery = supabase
        .from("funnel_events")
        .select("fsid, funnel_name, funnel_type, event_name, step_number, state_slug, is_demo, created_at, metadata");
      if (fromDate) evtQuery = evtQuery.gte("created_at", fromDate);
      if (!includeDemo) evtQuery = evtQuery.or("is_demo.is.null,is_demo.eq.false");
      if (funnelName) evtQuery = evtQuery.eq("funnel_name", funnelName);
      evtQuery = applyEventConfidenceFilter(evtQuery, confidenceFilter);

      const { data: events, error: evtErr } = await evtQuery.limit(50000);
      if (evtErr) return jsonResponse({ error: evtErr.message }, 500);

      const dedupSeen = new Set<string>();
      const grouped: Record<string, { funnel_name: string; event_name: string; step_number: number | null; count: number; demo_count: number }> = {};
      for (const e of (events ?? [])) {
        const meta = (e.metadata as Record<string, unknown>) ?? {};
        const oiid = (meta.open_instance_id as string) ?? "";
        const fsid = e.fsid ?? (meta.fsid as string) ?? "";
        const step = e.step_number ?? null;
        let dedupKey: string;
        if (oiid) {
          dedupKey = `${fsid}::${e.event_name}::${step ?? "null"}::${oiid}`;
        } else {
          const agencyId = (meta.agency_id as string) ?? "";
          const stSlug = e.state_slug ?? "";
          const token = (meta.token as string) ?? "";
          const ts5s = Math.floor(new Date(e.created_at).getTime() / 5000);
          dedupKey = `${fsid}::${e.event_name}::${step ?? "null"}::${agencyId}::${stSlug}::${token}::${ts5s}`;
        }
        if (dedupSeen.has(dedupKey)) continue;
        dedupSeen.add(dedupKey);

        const fn = e.funnel_name ?? e.funnel_type ?? "unknown";
        const key = `${fn}|${step ?? "null"}|${e.event_name}`;
        if (!grouped[key]) {
          grouped[key] = { funnel_name: fn, event_name: e.event_name, step_number: step, count: 0, demo_count: 0 };
        }
        grouped[key].count++;
        if (e.is_demo) grouped[key].demo_count++;
      }

      // Sort: funnel order first, then step ASC NULLS LAST, then event name ASC
      const rows = Object.values(grouped).sort((a, b) => {
        const fnDiff = sortFunnelKeys([a.funnel_name, b.funnel_name]).indexOf(a.funnel_name) -
                       sortFunnelKeys([a.funnel_name, b.funnel_name]).indexOf(b.funnel_name);
        if (a.funnel_name !== b.funnel_name) {
          const ai = FUNNEL_ORDER.indexOf(a.funnel_name);
          const bi = FUNNEL_ORDER.indexOf(b.funnel_name);
          if (ai === -1 && bi === -1) return a.funnel_name.localeCompare(b.funnel_name);
          if (ai === -1) return 1;
          if (bi === -1) return -1;
          return ai - bi;
        }
        void fnDiff;
        const stepA = a.step_number ?? 99999;
        const stepB = b.step_number ?? 99999;
        if (stepA !== stepB) return stepA - stepB;
        return a.event_name.localeCompare(b.event_name);
      });

      return jsonResponse({ rows });
    }

    // ------------------------------------------------------------------ drop_off
    if (action === "drop_off") {
      let query = supabase
        .from("funnel_sessions")
        .select("funnel_name, funnel_type, dropoff_stage, dropoff_path, drop_off_event, stage, is_demo, created_at, updated_at, last_event_at");

      // Use activity-based filter so sessions that dropped off today are counted
      // even if they were first created before the selected window.
      if (fromDate) query = applySessionActivityFilter(query, fromDate);
      if (!includeDemo) query = query.or("is_demo.is.null,is_demo.eq.false");
      if (funnelName) query = query.eq("funnel_name", funnelName);
      query = applySessionConfidenceFilter(query, confidenceFilter);
      query = query.not("dropoff_stage", "is", null);

      const { data: rows, error } = await query.limit(5000);
      if (error) return jsonResponse({ error: error.message }, 500);

      const grouped: Record<string, { dropoff_stage: string; funnel_name: string; count: number }> = {};
      for (const r of (rows ?? [])) {
        const fn = r.funnel_name ?? r.funnel_type ?? "unknown";
        const key = `${fn}|${r.dropoff_stage}`;
        if (!grouped[key]) {
          grouped[key] = { dropoff_stage: r.dropoff_stage, funnel_name: fn, count: 0 };
        }
        grouped[key].count++;
      }

      return jsonResponse({ rows: Object.values(grouped).sort((a, b) => b.count - a.count) });
    }

    // ------------------------------------------------------------------ your_agency_steps (legacy)
    if (action === "your_agency_steps") {
      let query = supabase
        .from("your_agency_funnel_events")
        .select("event_name, agency_id, state_slug, created_at");
      if (fromDate) query = query.gte("created_at", fromDate);

      const { data: rows, error } = await query.limit(50000);
      if (error) return jsonResponse({ error: error.message }, 500);

      const grouped: Record<string, number> = {};
      for (const r of (rows ?? [])) {
        grouped[r.event_name] = (grouped[r.event_name] ?? 0) + 1;
      }

      return jsonResponse({
        rows: Object.entries(grouped)
          .map(([event_name, count]) => ({ event_name, count }))
          .sort((a, b) => b.count - a.count),
      });
    }

    // ------------------------------------------------------------------ session_list
    if (action === "session_list") {
      const page = Math.max(1, parseInt(url.searchParams.get("page") ?? "1"));
      const pageSize = Math.min(100, Math.max(1, parseInt(url.searchParams.get("page_size") ?? "25")));
      const rawQ = (url.searchParams.get("q") ?? "").trim();
      const stageFilter = url.searchParams.get("stage") ?? "";
      const hasCheckoutFilter = url.searchParams.get("has_checkout") === "1";
      const onlyDemoFilter = url.searchParams.get("only_demo") === "1";
      const from = (page - 1) * pageSize;
      const to = from + pageSize - 1;

      // When q is present, first check if it matches any search event metadata.query
      // to pull in the correct session IDs even when session columns don't match.
      let preFilterIds: string[] | null = null;
      if (rawQ) {
        const likeQ = `%${rawQ}%`;
        // Pull session_ids from funnel_events where metadata->>'query' matches
        const { data: searchEvts } = await supabase
          .from("funnel_events")
          .select("session_id")
          .eq("event_name", "your_agency_search_submitted")
          .filter("metadata->>query", "ilike", likeQ)
          .limit(500);

        // Also pull session_ids from events where metadata->>'agency_name' matches
        const { data: agencyEvts } = await supabase
          .from("funnel_events")
          .select("session_id")
          .filter("metadata->>agency_name", "ilike", likeQ)
          .limit(500);

        const evtIds = new Set<string>();
        for (const e of (searchEvts ?? [])) if (e.session_id) evtIds.add(e.session_id);
        for (const e of (agencyEvts ?? [])) if (e.session_id) evtIds.add(e.session_id);
        preFilterIds = evtIds.size > 0 ? Array.from(evtIds) : null;
      }

      let sessQuery = supabase
        .from("funnel_sessions")
        .select(
          "id, fsid, created_at, updated_at, last_event_at, last_event_name, funnel_name, funnel_type, step_number, stage, is_demo, lead_email, lead_name, agency_name, agency_id, state_slug, dropoff_stage, dropoff_path, drop_off_event",
          { count: "exact" }
        );

      // Use activity-based filter: sessions active in the selected range appear
      // even when they were first created before the window started.
      if (fromDate) sessQuery = applySessionActivityFilter(sessQuery, fromDate);
      if (!includeDemo && !onlyDemoFilter) sessQuery = sessQuery.or("is_demo.is.null,is_demo.eq.false");
      if (funnelName) sessQuery = sessQuery.eq("funnel_name", funnelName);
      sessQuery = applySessionConfidenceFilter(sessQuery, confidenceFilter);
      if (stageFilter) sessQuery = sessQuery.eq("stage", stageFilter);
      if (hasCheckoutFilter) sessQuery = sessQuery.in("stage", ["checkout_started", "paid"]);
      if (onlyDemoFilter) sessQuery = sessQuery.eq("is_demo", true);

      if (rawQ) {
        const likeQ = `%${rawQ}%`;
        const sessionColFilter = `fsid.ilike.${likeQ},lead_email.ilike.${likeQ},lead_name.ilike.${likeQ},agency_name.ilike.${likeQ},state_slug.ilike.${likeQ}`;
        if (preFilterIds && preFilterIds.length > 0) {
          // Match either session columns OR pre-filtered session IDs from event metadata
          sessQuery = sessQuery.or(`${sessionColFilter},id.in.(${preFilterIds.join(",")})`);
        } else {
          sessQuery = sessQuery.or(sessionColFilter);
        }
      }

      sessQuery = sessQuery
        .order("last_event_at", { ascending: false, nullsFirst: false })
        .range(from, to);

      const { data: sessions, count: total, error: sessErr } = await sessQuery;
      if (sessErr) return jsonResponse({ error: sessErr.message }, 500);

      const sessionList = sessions ?? [];
      if (sessionList.length === 0) {
        return jsonResponse({ rows: [], page, page_size: pageSize, total: total ?? 0 });
      }

      const sessionIds = sessionList.map((s) => s.id);

      const { data: events, error: evtErr } = await supabase
        .from("funnel_events")
        .select("id, session_id, fsid, created_at, event_name, step_number, page_path, is_demo, metadata, funnel_name")
        .in("session_id", sessionIds)
        .order("created_at", { ascending: true });

      if (evtErr) return jsonResponse({ error: evtErr.message }, 500);

      // Sort events stably: created_at ASC, step_number ASC NULLS LAST, id ASC
      const allEvents = (events ?? []).slice().sort((a, b) => {
        const ta = new Date(a.created_at).getTime();
        const tb = new Date(b.created_at).getTime();
        if (ta !== tb) return ta - tb;
        const sa = a.step_number ?? 99999;
        const sb = b.step_number ?? 99999;
        if (sa !== sb) return sa - sb;
        return (a.id ?? "").localeCompare(b.id ?? "");
      });

      const eventsBySession: Record<string, typeof allEvents> = {};
      for (const evt of allEvents) {
        const sid = evt.session_id;
        if (!eventsBySession[sid]) eventsBySession[sid] = [];
        eventsBySession[sid]!.push(evt);
      }

      const rows = sessionList.map((sess) => {
        const sessEvents = eventsBySession[sess.id] ?? [];

        let first_search_query: string | null = null;
        let last_search_query: string | null = null;
        let search_results_count: number | null = null;
        let selected_agency_name: string | null = sess.agency_name ?? null;
        let selected_agency_id: string | null = sess.agency_id ?? null;

        for (const evt of sessEvents) {
          const isSearchEvt =
            evt.event_name === "your_agency_search_submitted" ||
            evt.step_number === 20;

          if (isSearchEvt && evt.metadata) {
            const q = evt.metadata.query ?? evt.metadata.search_query ?? null;
            const trimmed = q != null ? String(q).trim() : null;
            if (trimmed) {
              if (!first_search_query) first_search_query = trimmed;
              last_search_query = trimmed;
            }
            const rc = evt.metadata.results_count ?? evt.metadata.result_count ?? null;
            if (rc != null) search_results_count = Number(rc);
          }

          if (evt.metadata) {
            const an = evt.metadata.agency_name ?? null;
            const aid = evt.metadata.agency_id ?? null;
            if (an && String(an).trim()) selected_agency_name = String(an).trim();
            if (aid && String(aid).trim()) selected_agency_id = String(aid).trim();
          }
        }

        const stepsPreview = sessEvents
          .slice(0, 6)
          .map((e) => ({ step_number: e.step_number, event_name: e.event_name }));

        const firstEventStep = sessEvents[0]?.step_number ?? null;

        const hasCheckout = sessEvents.some(
          (e) => (e.step_number ?? 0) >= 150 || e.event_name === "checkout_page_viewed"
        );
        const hasPaid =
          sess.stage === "paid" ||
          sessEvents.some((e) => (e.step_number ?? 0) >= 160 || e.event_name === "checkout_completed");

        return {
          session_id: sess.id,
          fsid: sess.fsid,
          created_at: sess.created_at,
          last_event_at: sess.last_event_at ?? sess.updated_at,
          funnel_name: sess.funnel_name ?? sess.funnel_type ?? "unknown",
          stage: sess.stage ?? "opened",
          is_demo: sess.is_demo ?? false,
          lead_email: sess.lead_email ?? null,
          lead_name: sess.lead_name ?? null,
          state_slug: sess.state_slug ?? null,
          step_number: sess.step_number ?? null,
          last_event_name: sess.last_event_name ?? null,
          dropoff_stage: sess.dropoff_stage ?? null,
          first_search_query,
          last_search_query,
          search_results_count,
          selected_agency_name,
          selected_agency_id,
          step_count: sessEvents.length,
          steps_preview: stepsPreview,
          first_event_step: firstEventStep,
          has_checkout: hasCheckout,
          has_paid: hasPaid,
        };
      });

      return jsonResponse({ rows, page, page_size: pageSize, total: total ?? 0 });
    }

    // ------------------------------------------------------------------ session_timeline
    if (action === "session_timeline") {
      const sessionId = url.searchParams.get("session_id");
      if (!sessionId) return jsonResponse({ error: "session_id required" }, 400);

      const { data: sess, error: sessErr } = await supabase
        .from("funnel_sessions")
        .select("*")
        .eq("id", sessionId)
        .maybeSingle();

      if (sessErr) return jsonResponse({ error: sessErr.message }, 500);
      if (!sess) return jsonResponse({ error: "Session not found" }, 404);

      const { data: events, error: evtErr } = await supabase
        .from("funnel_events")
        .select("id, created_at, event_name, step_number, page_path, is_demo, metadata, funnel_name, event_stage")
        .eq("session_id", sessionId)
        .order("created_at", { ascending: true })
        .order("step_number", { ascending: true, nullsFirst: false });

      if (evtErr) return jsonResponse({ error: evtErr.message }, 500);

      // Secondary stable sort in memory: created_at ASC, step_number ASC NULLS LAST, id ASC
      const sorted = (events ?? []).slice().sort((a, b) => {
        const ta = new Date(a.created_at).getTime();
        const tb = new Date(b.created_at).getTime();
        if (ta !== tb) return ta - tb;
        const sa = a.step_number ?? 99999;
        const sb = b.step_number ?? 99999;
        if (sa !== sb) return sa - sb;
        return (a.id ?? "").localeCompare(b.id ?? "");
      });

      return jsonResponse({ session: sess, events: sorted });
    }

    // ------------------------------------------------------------------ breakdown
    // Returns per-step counts split by scanner / possible_human / verified_human.
    // Existing raw counts are preserved alongside human-only counts.
    if (action === "breakdown") {
      let evtQuery = supabase
        .from("funnel_events")
        .select("fsid, funnel_name, funnel_type, event_name, step_number, intent_level, is_demo, created_at, metadata");
      if (fromDate) evtQuery = evtQuery.gte("created_at", fromDate);
      if (!includeDemo) evtQuery = evtQuery.or("is_demo.is.null,is_demo.eq.false");
      if (funnelName) evtQuery = evtQuery.eq("funnel_name", funnelName);

      const { data: events, error: evtErr } = await evtQuery.limit(50000);
      if (evtErr) return jsonResponse({ error: evtErr.message }, 500);

      type BreakdownEntry = {
        funnel_name: string;
        event_name: string;
        step_number: number | null;
        total: number;
        scanner: number;
        possible_human: number;
        verified_human: number;
        unclassified: number;
      };
      const grouped: Record<string, BreakdownEntry> = {};
      for (const e of (events ?? [])) {
        const fn = e.funnel_name ?? e.funnel_type ?? "unknown";
        const step = e.step_number ?? null;
        const key = `${fn}|${step ?? "null"}|${e.event_name}`;
        if (!grouped[key]) {
          grouped[key] = { funnel_name: fn, event_name: e.event_name, step_number: step, total: 0, scanner: 0, possible_human: 0, verified_human: 0, unclassified: 0 };
        }
        grouped[key].total++;
        const lvl = e.intent_level as string | null;
        if (lvl === "scanner") grouped[key].scanner++;
        else if (lvl === "possible_human") grouped[key].possible_human++;
        else if (lvl === "verified_human") grouped[key].verified_human++;
        else grouped[key].unclassified++;
      }

      const rows = Object.values(grouped).sort((a, b) => {
        if (a.funnel_name !== b.funnel_name) {
          const ai = FUNNEL_ORDER.indexOf(a.funnel_name);
          const bi = FUNNEL_ORDER.indexOf(b.funnel_name);
          if (ai === -1 && bi === -1) return a.funnel_name.localeCompare(b.funnel_name);
          if (ai === -1) return 1; if (bi === -1) return -1;
          return ai - bi;
        }
        const stepA = a.step_number ?? 99999;
        const stepB = b.step_number ?? 99999;
        if (stepA !== stepB) return stepA - stepB;
        return a.event_name.localeCompare(b.event_name);
      });

      return jsonResponse({ rows });
    }

    // ------------------------------------------------------------------ deliverability
    // Scanner events as inbox-placement proxy: if a scanner hit your link, the email landed.
    if (action === "deliverability") {
      let sessQuery = supabase
        .from("funnel_sessions")
        .select("id, funnel_name, funnel_type, agency_id, agency_name, state_slug, intent_level, is_scanner_flagged, created_at, last_event_at");
      if (fromDate) sessQuery = applySessionActivityFilter(sessQuery, fromDate);
      if (!includeDemo) sessQuery = sessQuery.or("is_demo.is.null,is_demo.eq.false");
      if (funnelName) sessQuery = sessQuery.eq("funnel_name", funnelName);

      const { data: sessions, error: sessErr } = await sessQuery.limit(10000);
      if (sessErr) return jsonResponse({ error: sessErr.message }, 500);

      let scannerCount = 0;
      let possibleHumanCount = 0;
      let verifiedHumanCount = 0;
      let unclassifiedCount = 0;
      const scannedAgencies = new Set<string>();
      // Bucket by time window: group by day for trend
      const byDay: Record<string, { scanner: number; possible_human: number; verified_human: number; unclassified: number }> = {};

      for (const s of (sessions ?? [])) {
        const lvl = s.intent_level as string | null;
        const flagged = s.is_scanner_flagged as boolean | null;
        const day = (s.last_event_at ?? s.created_at ?? "").slice(0, 10);
        if (!byDay[day]) byDay[day] = { scanner: 0, possible_human: 0, verified_human: 0, unclassified: 0 };

        if (lvl === "scanner" || flagged === true) {
          scannerCount++;
          byDay[day].scanner++;
          if (s.agency_id) scannedAgencies.add(String(s.agency_id));
        } else if (lvl === "possible_human") {
          possibleHumanCount++;
          byDay[day].possible_human++;
        } else if (lvl === "verified_human") {
          verifiedHumanCount++;
          byDay[day].verified_human++;
        } else {
          unclassifiedCount++;
          byDay[day].unclassified++;
        }
      }

      const totalSessions = (sessions ?? []).length;
      const humanTotal = possibleHumanCount + verifiedHumanCount;
      const scannerRatio = totalSessions > 0 ? Math.round((scannerCount / totalSessions) * 100) : 0;
      const humanRatio = totalSessions > 0 ? Math.round((humanTotal / totalSessions) * 100) : 0;

      const trend = Object.entries(byDay)
        .sort(([a], [b]) => a.localeCompare(b))
        .map(([date, counts]) => ({ date, ...counts }));

      return jsonResponse({
        total_sessions: totalSessions,
        scanner_count: scannerCount,
        possible_human_count: possibleHumanCount,
        verified_human_count: verifiedHumanCount,
        unclassified_count: unclassifiedCount,
        scanner_ratio_pct: scannerRatio,
        human_ratio_pct: humanRatio,
        scanned_agency_count: scannedAgencies.size,
        trend,
      });
    }

    return jsonResponse({ error: "Unknown action" }, 400);
  } catch (err) {
    return jsonResponse({ error: err instanceof Error ? err.message : String(err) }, 500);
  }
});

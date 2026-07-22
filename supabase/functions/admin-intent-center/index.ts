import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

interface IntentScoreRow {
  agency_id: string;
  state_slug: string;
  activity_score: number;
  deepest_step: number;
  last_activity_at: string | null;
  checkout_opened_count: number;
  availability_submitted_count: number;
  upsell_viewed_count: number;
  profile_views: number;
  profile_clicks: number;
  repeat_visits: number;
  score_breakdown: Record<string, number> | null;
}

interface EnrichedRow extends IntentScoreRow {
  agency_name: string | null;
  agency_slug: string | null;
  state_name: string | null;
  location: string | null;
  is_active: boolean | null;
  paid_override: boolean | null;
  website_url: string | null;
  replay_views_15m: number;
  replay_views_1h: number;
  replay_views_24h: number;
  availability_opens_24h: number;
  checkout_opens_24h: number;
  last_event_type: string | null;
  last_event_at: string | null;
  // Confidence classification counts
  scanner_session_count: number;
  possible_human_count: number;
  verified_human_count: number;
  human_activity_score: number | null;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const auth = await authenticateAdmin(req);
    if (!auth.success) return createAuthErrorResponse(auth, corsHeaders);

    const url = new URL(req.url);
    const state = url.searchParams.get("state") || null;
    const limit = Math.min(parseInt(url.searchParams.get("limit") || "200"), 500);
    // confidence_filter: "all" (default) | "likely_human" | "verified_only"
    // Also accepts legacy "human_only" as alias for "likely_human"
    const rawFilter = url.searchParams.get("confidence_filter") || "all";
    const confidenceFilter = rawFilter === "human_only" ? "likely_human" : rawFilter;

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    // Use human-only RPC when confidence_filter requires it
    const rpcName = (confidenceFilter === "likely_human" || confidenceFilter === "verified_only")
      ? "compute_agency_human_intent_scores"
      : "compute_agency_intent_scores";

    const { data: scoresData, error: scoresErr } = await supabase.rpc(
      rpcName,
      { p_state_slug: state },
    );

    if (scoresErr) {
      return json({ ok: false, error: scoresErr.message }, 500);
    }

    let rows = (Array.isArray(scoresData) ? scoresData : []) as IntentScoreRow[];
    rows = rows.filter((r) => !!r?.agency_id);
    if (state) rows = rows.filter((r) => r.state_slug === state);

    rows.sort((a, b) => (b.activity_score ?? 0) - (a.activity_score ?? 0));
    rows = rows.slice(0, limit);

    const agencyIds = Array.from(new Set(rows.map((r) => r.agency_id)));
    const uuidIds = agencyIds.filter(isUuid);
    const slotKeyIds = agencyIds.filter((id) => !isUuid(id) && /^top25-[a-z-]+-\d+$/i.test(id));

    const [agenciesRes, top25ByIdRes, top25BySlotKeyRes, eventsRes, confidenceRes] = await Promise.all([
      uuidIds.length
        ? supabase
          .from("other_agencies")
          .select("id, name, slug, state_name, state_slug, location, is_active, paid_override, website_url")
          .in("id", uuidIds)
        : Promise.resolve({ data: [] as Record<string, unknown>[], error: null }),
      uuidIds.length
        ? supabase
          .from("top25_slots")
          .select("id, agency_id, agency_name, state_slug, rank, website")
          .in("id", uuidIds)
        : Promise.resolve({ data: [] as Record<string, unknown>[], error: null }),
      slotKeyIds.length
        ? supabase
          .from("top25_slots")
          .select("id, agency_id, agency_name, state_slug, rank, website")
          .or(slotKeyIds.map(parseSlotKeyPredicate).filter(Boolean).join(","))
        : Promise.resolve({ data: [] as Record<string, unknown>[], error: null }),
      loadRecentEvents(supabase, agencyIds),
      loadConfidenceCounts(supabase, agencyIds),
    ]);

    const agencyMap = new Map<string, Record<string, unknown>>();
    if (agenciesRes && "data" in agenciesRes && Array.isArray(agenciesRes.data)) {
      for (const a of agenciesRes.data as Record<string, unknown>[]) {
        if (a?.id) agencyMap.set(String(a.id), a);
      }
    }

    const top25ById = new Map<string, Record<string, unknown>>();
    if (top25ByIdRes && "data" in top25ByIdRes && Array.isArray(top25ByIdRes.data)) {
      for (const t of top25ByIdRes.data as Record<string, unknown>[]) {
        if (t?.id) top25ById.set(String(t.id), t);
      }
    }

    const top25BySlotKey = new Map<string, Record<string, unknown>>();
    if (top25BySlotKeyRes && "data" in top25BySlotKeyRes && Array.isArray(top25BySlotKeyRes.data)) {
      for (const t of top25BySlotKeyRes.data as Record<string, unknown>[]) {
        const k = slotKeyFor(String(t.state_slug || ""), Number(t.rank));
        if (k) top25BySlotKey.set(k, t);
      }
    }

    const linkedAgencyIds = new Set<string>();
    for (const t of top25ById.values()) {
      const linked = t.agency_id ? String(t.agency_id) : "";
      if (linked && isUuid(linked)) linkedAgencyIds.add(linked);
    }
    for (const t of top25BySlotKey.values()) {
      const linked = t.agency_id ? String(t.agency_id) : "";
      if (linked && isUuid(linked)) linkedAgencyIds.add(linked);
    }
    const linkedToFetch = Array.from(linkedAgencyIds).filter((id) => !agencyMap.has(id));
    if (linkedToFetch.length) {
      const { data: linkedRows } = await supabase
        .from("other_agencies")
        .select("id, name, slug, state_name, state_slug, location, is_active, paid_override, website_url")
        .in("id", linkedToFetch);
      if (Array.isArray(linkedRows)) {
        for (const a of linkedRows as Record<string, unknown>[]) {
          if (a?.id) agencyMap.set(String(a.id), a);
        }
      }
    }

    const enriched: EnrichedRow[] = rows.map((r) => {
      const meta = agencyMap.get(r.agency_id);
      const ev = eventsRes.get(r.agency_id) || defaultEvents();
      const conf = confidenceRes.get(r.agency_id) || defaultConfidence();
      const top25Direct = top25ById.get(r.agency_id)
        || (isUuid(r.agency_id) ? null : top25BySlotKey.get(r.agency_id));
      const top25LinkedMeta = top25Direct && top25Direct.agency_id
        ? agencyMap.get(String(top25Direct.agency_id))
        : null;
      const resolved = meta || top25LinkedMeta;
      const name = resolved
        ? (resolved.name as string | null)
        : top25Direct
          ? formatTop25Name(top25Direct)
          : null;
      const website = resolved
        ? (resolved.website_url as string | null)
        : top25Direct
          ? ((top25Direct.website as string | null) ?? null)
          : null;
      return {
        ...r,
        agency_name: name,
        agency_slug: resolved ? (resolved.slug as string | null) : null,
        state_name: resolved ? (resolved.state_name as string | null) : null,
        location: resolved ? (resolved.location as string | null) : null,
        is_active: resolved ? (resolved.is_active as boolean | null) ?? null : null,
        paid_override: resolved ? (resolved.paid_override as boolean | null) ?? null : null,
        website_url: website,
        replay_views_15m: ev.replay_views_15m,
        replay_views_1h: ev.replay_views_1h,
        replay_views_24h: ev.replay_views_24h,
        availability_opens_24h: ev.availability_opens_24h,
        checkout_opens_24h: ev.checkout_opens_24h,
        last_event_type: ev.last_event_type,
        last_event_at: ev.last_event_at,
        scanner_session_count: conf.scanner_session_count,
        possible_human_count: conf.possible_human_count,
        verified_human_count: conf.verified_human_count,
        human_activity_score: conf.human_activity_score,
      };
    });

    // Apply confidence_filter post-enrichment for "verified_only"
    // (likely_human already handled via RPC, verified_only needs extra client filter)
    const filtered = confidenceFilter === "verified_only"
      ? enriched.filter((r) => r.verified_human_count > 0)
      : enriched;

    return json({ ok: true, count: filtered.length, rows: filtered });
  } catch (err) {
    return json({ ok: false, error: err instanceof Error ? err.message : "Unknown error" }, 500);
  }

  function json(body: unknown, status = 200) {
    return new Response(JSON.stringify(body), {
      status,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});

interface EventAgg {
  replay_views_15m: number;
  replay_views_1h: number;
  replay_views_24h: number;
  availability_opens_24h: number;
  checkout_opens_24h: number;
  last_event_type: string | null;
  last_event_at: string | null;
}

function isUuid(s: string): boolean {
  return /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(s);
}

function parseSlotKey(key: string): { state: string; rank: number } | null {
  const m = key.match(/^top25-([a-z-]+)-(\d+)$/i);
  if (!m) return null;
  const rank = parseInt(m[2], 10);
  if (!Number.isFinite(rank)) return null;
  return { state: m[1].toLowerCase(), rank };
}

function slotKeyFor(state: string, rank: number): string | null {
  if (!state || !Number.isFinite(rank)) return null;
  return `top25-${state}-${rank}`;
}

function parseSlotKeyPredicate(key: string): string | null {
  const p = parseSlotKey(key);
  if (!p) return null;
  return `and(state_slug.eq.${p.state},rank.eq.${p.rank})`;
}

function formatTop25Name(t: Record<string, unknown>): string | null {
  const name = t.agency_name ? String(t.agency_name).trim() : "";
  if (name) return name;
  const state = t.state_slug ? String(t.state_slug) : "";
  const rank = t.rank != null ? String(t.rank) : "";
  if (state && rank) return `Top 25 slot #${rank} · ${state}`;
  return null;
}

function defaultEvents(): EventAgg {
  return {
    replay_views_15m: 0,
    replay_views_1h: 0,
    replay_views_24h: 0,
    availability_opens_24h: 0,
    checkout_opens_24h: 0,
    last_event_type: null,
    last_event_at: null,
  };
}

async function loadRecentEvents(
  supabase: ReturnType<typeof createClient>,
  agencyIds: string[],
): Promise<Map<string, EventAgg>> {
  const out = new Map<string, EventAgg>();
  if (!agencyIds.length) return out;

  const now = Date.now();
  const iso24h = new Date(now - 24 * 3600_000).toISOString();
  const ms15 = now - 15 * 60_000;
  const ms1h = now - 60 * 60_000;

  try {
    const { data, error } = await supabase
      .from("funnel_sessions")
      .select("agency_id, funnel_name, created_at, last_event_name, last_event_at, deepest_step")
      .in("agency_id", agencyIds)
      .gte("last_event_at", iso24h)
      .limit(5000);

    if (!error && Array.isArray(data)) {
      for (const row of data as Record<string, unknown>[]) {
        const id = String(row.agency_id || "");
        if (!id) continue;
        const agg = out.get(id) || defaultEvents();
        const funnel = String(row.funnel_name || "");
        const lastName = String(row.last_event_name || "") || null;
        const lastAtStr = row.last_event_at ? String(row.last_event_at) : null;
        const lastAtMs = lastAtStr ? new Date(lastAtStr).getTime() : 0;

        if (funnel === "request_replay") {
          agg.replay_views_24h += 1;
          if (lastAtMs >= ms1h) agg.replay_views_1h += 1;
          if (lastAtMs >= ms15) agg.replay_views_15m += 1;
        }

        const name = lastName || "";
        if (
          name.includes("availability") ||
          name.includes("check_availability") ||
          name.includes("availability_opened") ||
          funnel === "availability"
        ) {
          agg.availability_opens_24h += 1;
        }
        if (
          name.includes("checkout") ||
          name.includes("stripe_checkout_opened")
        ) {
          agg.checkout_opens_24h += 1;
        }

        if (!agg.last_event_at || (lastAtStr && lastAtStr > agg.last_event_at)) {
          agg.last_event_at = lastAtStr;
          agg.last_event_type = lastName || funnel || null;
        }

        out.set(id, agg);
      }
    }
  } catch {
    // non-fatal
  }

  try {
    const { data, error } = await supabase
      .from("agency_availability_requests")
      .select("agency_id, target_agency_id, created_at")
      .or(
        `agency_id.in.(${agencyIds.join(",")}),target_agency_id.in.(${agencyIds.join(",")})`,
      )
      .eq("is_demo", false)
      .is("deleted_at", null)
      .gte("created_at", iso24h)
      .limit(2000);

    if (!error && Array.isArray(data)) {
      for (const row of data as Record<string, unknown>[]) {
        const aid = String(row.target_agency_id || row.agency_id || "");
        if (!aid) continue;
        const agg = out.get(aid) || defaultEvents();
        agg.availability_opens_24h += 1;
        const createdStr = row.created_at ? String(row.created_at) : null;
        if (createdStr && (!agg.last_event_at || createdStr > agg.last_event_at)) {
          agg.last_event_at = createdStr;
          agg.last_event_type = "availability_submitted";
        }
        out.set(aid, agg);
      }
    }
  } catch {
    // non-fatal
  }

  return out;
}

interface ConfidenceAgg {
  scanner_session_count: number;
  possible_human_count: number;
  verified_human_count: number;
  human_activity_score: number | null;
}

function defaultConfidence(): ConfidenceAgg {
  return {
    scanner_session_count: 0,
    possible_human_count: 0,
    verified_human_count: 0,
    human_activity_score: null,
  };
}

async function loadConfidenceCounts(
  supabase: ReturnType<typeof createClient>,
  agencyIds: string[],
): Promise<Map<string, ConfidenceAgg>> {
  const out = new Map<string, ConfidenceAgg>();
  if (!agencyIds.length) return out;

  try {
    const { data, error } = await supabase
      .from("funnel_sessions")
      .select("agency_id, intent_level, confidence_score, is_scanner_flagged")
      .in("agency_id", agencyIds)
      .limit(10000);

    if (!error && Array.isArray(data)) {
      for (const row of data as Record<string, unknown>[]) {
        const id = String(row.agency_id || "");
        if (!id) continue;
        const agg = out.get(id) || defaultConfidence();
        const level = String(row.intent_level || "");
        const isFlagged = row.is_scanner_flagged === true;
        const score = typeof row.confidence_score === "number" ? row.confidence_score : null;

        if (level === "scanner" || isFlagged) {
          agg.scanner_session_count += 1;
        } else if (level === "verified_human") {
          agg.verified_human_count += 1;
          if (score !== null) {
            agg.human_activity_score = agg.human_activity_score === null
              ? score
              : Math.max(agg.human_activity_score, score);
          }
        } else if (level === "possible_human") {
          agg.possible_human_count += 1;
        }

        out.set(id, agg);
      }
    }
  } catch {
    // non-fatal
  }

  return out;
}

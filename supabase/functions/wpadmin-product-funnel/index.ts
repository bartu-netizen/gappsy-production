import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers":
    "Content-Type, Authorization, X-Client-Info, Apikey, Accept, x-admin-secret, x-admin-token",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function rangeToFromDate(range: string): string | null {
  if (range === "all") return null;
  const days =
    range === "24h" ? 1 :
    range === "7d" ? 7 :
    range === "30d" ? 30 :
    range === "90d" ? 90 : 30;
  const d = new Date();
  d.setDate(d.getDate() - days);
  return d.toISOString();
}

interface RawEventRow {
  id: string;
  created_at: string;
  session_id: string | null;
  funnel_type: string | null;
  funnel_name: string | null;
  event_name: string;
  page_path: string | null;
  state_slug: string | null;
  is_demo: boolean | null;
  lead_email: string | null;
  agency_id: string | null;
  metadata: Record<string, unknown> | null;
  source_table?: string;
  confidence_level?: string | null;
}

interface AgencyMeta {
  key: string;
  agency_id: string | null;
  name: string | null;
  slug: string | null;
  state_slug: string | null;
  website: string | null;
  description: string | null;
  is_paid: boolean;
  paid_source: string | null;
  is_removed: boolean;
  listing_status: string | null;
}

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

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

function extractAgencyId(row: {
  agency_id?: string | null;
  metadata?: Record<string, unknown> | null;
}): string | null {
  const direct = typeof row.agency_id === "string" ? row.agency_id.trim() : "";
  if (direct) return direct;
  const meta = row.metadata ?? {};
  for (const k of ["agency_id", "aid", "agencyId"]) {
    const v = meta[k];
    if (typeof v === "string" && v.trim()) return v.trim();
  }
  return null;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }
  if (req.method !== "GET") {
    return json({ error: "Method not allowed" }, 405);
  }

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
  const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    return json({ error: "Missing env vars" }, 500);
  }

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) return createAuthErrorResponse(authResult, corsHeaders);

    const url = new URL(req.url);
    const range = url.searchParams.get("range") ?? "30d";
    const customFrom = url.searchParams.get("from");
    const customTo = url.searchParams.get("to");
    const stateSlugs = (url.searchParams.get("state_slugs") ?? "")
      .split(",")
      .map((s) => s.trim())
      .filter(Boolean);
    const includeRemoved = url.searchParams.get("include_removed") === "1";
    const includeDemo = url.searchParams.get("include_demo") === "1";
    const rawCf = url.searchParams.get("confidence_filter") || "all";
    const confidenceFilter = rawCf === "human_only" ? "likely_human" : rawCf;

    const fromDate = customFrom ?? rangeToFromDate(range);
    const toDate = customTo ?? null;

    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

    // ── 1) funnel_events (canonical cross-funnel source)
    let q1 = supabase
      .from("funnel_events")
      .select("id, created_at, session_id, funnel_type, funnel_name, event_name, page_path, state_slug, is_demo, lead_email, agency_id, metadata, intent_level");
    if (fromDate) q1 = q1.gte("created_at", fromDate);
    if (toDate) q1 = q1.lte("created_at", toDate);
    if (!includeDemo) q1 = q1.or("is_demo.is.null,is_demo.eq.false");
    if (stateSlugs.length > 0) q1 = q1.in("state_slug", stateSlugs);
    q1 = applyEventConfidenceFilter(q1, confidenceFilter);
    q1 = q1.order("created_at", { ascending: true }).limit(50000);

    // ── 2) your_agency_funnel_events  (event_name, agency_id, agency_slug, state_slug, section, token, meta)
    let q2 = supabase
      .from("your_agency_funnel_events")
      .select("id, created_at, event_name, agency_id, agency_slug, state_slug, section, token, meta");
    if (fromDate) q2 = q2.gte("created_at", fromDate);
    if (toDate) q2 = q2.lte("created_at", toDate);
    if (stateSlugs.length > 0) q2 = q2.in("state_slug", stateSlugs);
    q2 = q2.order("created_at", { ascending: true }).limit(50000);

    // ── 3) manage_funnel_events (event_type, agency_id/slug/name, state_slug, metadata)
    let q3 = supabase
      .from("manage_funnel_events")
      .select("id, created_at, event_type, agency_id, agency_slug, agency_name, state_slug, token, metadata, page_path, referrer, intent_level");
    if (fromDate) q3 = q3.gte("created_at", fromDate);
    if (toDate) q3 = q3.lte("created_at", toDate);
    if (stateSlugs.length > 0) q3 = q3.in("state_slug", stateSlugs);
    q3 = applyEventConfidenceFilter(q3, confidenceFilter);
    q3 = q3.order("created_at", { ascending: true }).limit(50000);

    // ── 4) owner_demo_events (event_name, agency_id, state_slug, agency_name, metadata)
    let q4 = supabase
      .from("owner_demo_events")
      .select("id, created_at, event_name, agency_id, state_slug, agency_name, source_page, metadata, deleted_at");
    if (fromDate) q4 = q4.gte("created_at", fromDate);
    if (toDate) q4 = q4.lte("created_at", toDate);
    if (stateSlugs.length > 0) q4 = q4.in("state_slug", stateSlugs);
    q4 = q4.is("deleted_at", null).order("created_at", { ascending: true }).limit(50000);

    // ── 5) email_notification_logs (admin notifications — authoritative source for replay_opened, activation_page_viewed, etc.)
    let q5 = supabase
      .from("email_notification_logs")
      .select("id, created_at, notification_type, payload, status");
    if (fromDate) q5 = q5.gte("created_at", fromDate);
    if (toDate) q5 = q5.lte("created_at", toDate);
    q5 = q5.order("created_at", { ascending: true }).limit(50000);

    const [r1, r2, r3, r4, r5] = await Promise.all([q1, q2, q3, q4, q5]);
    if (r1.error) return json({ error: `funnel_events: ${r1.error.message}` }, 500);

    const events: RawEventRow[] = [];

    for (const e of (r1.data ?? []) as Record<string, unknown>[]) {
      events.push({
        id: e.id as string,
        created_at: e.created_at as string,
        session_id: (e.session_id as string) ?? null,
        funnel_type: (e.funnel_type as string) ?? null,
        funnel_name: (e.funnel_name as string) ?? null,
        event_name: e.event_name as string,
        page_path: (e.page_path as string) ?? null,
        state_slug: (e.state_slug as string) ?? null,
        is_demo: (e.is_demo as boolean) ?? null,
        lead_email: (e.lead_email as string) ?? null,
        agency_id: (e.agency_id as string) ?? null,
        metadata: (e.metadata as Record<string, unknown>) ?? null,
        source_table: "funnel_events",
        confidence_level: (e.intent_level as string) ?? null,
      });
    }

    for (const e of (r2.data ?? []) as Record<string, unknown>[]) {
      const meta = { ...((e.meta as Record<string, unknown>) ?? {}) };
      if (e.agency_slug && !meta.agency_slug) meta.agency_slug = e.agency_slug;
      if (e.section && !meta.section) meta.section = e.section;
      if (e.token && !meta.token) meta.token = e.token;
      events.push({
        id: e.id as string,
        created_at: e.created_at as string,
        session_id: null,
        funnel_type: "your_agency",
        funnel_name: "your_agency",
        event_name: e.event_name as string,
        page_path: null,
        state_slug: (e.state_slug as string) ?? null,
        is_demo: null,
        lead_email: null,
        agency_id: (e.agency_id as string) ?? null,
        metadata: meta,
        source_table: "your_agency_funnel_events",
      });
    }

    for (const e of (r3.data ?? []) as Record<string, unknown>[]) {
      const meta = { ...((e.metadata as Record<string, unknown>) ?? {}) };
      if (e.agency_slug && !meta.agency_slug) meta.agency_slug = e.agency_slug;
      if (e.agency_name && !meta.agency_name) meta.agency_name = e.agency_name;
      if (e.token && !meta.token) meta.token = e.token;
      events.push({
        id: e.id as string,
        created_at: e.created_at as string,
        session_id: null,
        funnel_type: "manage_listing",
        funnel_name: "manage_listing",
        event_name: e.event_type as string,
        page_path: (e.page_path as string) ?? null,
        state_slug: (e.state_slug as string) ?? null,
        is_demo: null,
        lead_email: null,
        agency_id: (e.agency_id as string) ?? null,
        metadata: meta,
        source_table: "manage_funnel_events",
        confidence_level: (e.intent_level as string) ?? null,
      });
    }

    for (const e of (r4.data ?? []) as Record<string, unknown>[]) {
      const meta = { ...((e.metadata as Record<string, unknown>) ?? {}) };
      if (e.agency_name && !meta.agency_name) meta.agency_name = e.agency_name;
      if (e.source_page && !meta.source_page) meta.source_page = e.source_page;
      events.push({
        id: e.id as string,
        created_at: e.created_at as string,
        session_id: null,
        funnel_type: "owner_demo",
        funnel_name: "check_availability",
        event_name: e.event_name as string,
        page_path: null,
        state_slug: (e.state_slug as string) ?? null,
        is_demo: null,
        lead_email: null,
        agency_id: e.agency_id ? String(e.agency_id) : null,
        metadata: meta,
        source_table: "owner_demo_events",
      });
    }

    for (const e of (r5.data ?? []) as Record<string, unknown>[]) {
      const payload = (e.payload as Record<string, unknown>) ?? {};
      const stSlug = typeof payload.state_slug === "string" ? (payload.state_slug as string) : null;
      if (stateSlugs.length > 0 && (!stSlug || !stateSlugs.includes(stSlug))) continue;
      const aid = typeof payload.agency_id === "string" ? (payload.agency_id as string) : null;
      events.push({
        id: e.id as string,
        created_at: e.created_at as string,
        session_id: (payload.fsid as string) ?? (payload.funnel_session_id as string) ?? (payload.replay_session_id as string) ?? null,
        funnel_type: "admin_notification",
        funnel_name: "admin_notification",
        event_name: e.notification_type as string,
        page_path: (payload.page_url as string) ?? (payload.entry_path as string) ?? null,
        state_slug: stSlug,
        is_demo: null,
        lead_email: null,
        agency_id: aid,
        metadata: payload,
        source_table: "email_notification_logs",
        confidence_level: (typeof payload.intent_level === "string" ? payload.intent_level : null) as string | null,
      });
    }

    events.sort((a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime());

    // ── Confidence breakdown (computed before filtering) ────────────────────────
    const confidenceBreakdown = { total: events.length, scanner: 0, possible_human: 0, verified_human: 0, unclassified_legacy: 0 };
    for (const e of events) {
      const lvl = e.confidence_level;
      if (lvl === "scanner") confidenceBreakdown.scanner++;
      else if (lvl === "possible_human") confidenceBreakdown.possible_human++;
      else if (lvl === "verified_human") confidenceBreakdown.verified_human++;
      else confidenceBreakdown.unclassified_legacy++;
    }

    // ── Apply confidence filter ─────────────────────────────────────────────────
    let filteredEvents = events;
    if (confidenceFilter === "verified_only") {
      filteredEvents = events.filter((e) => e.confidence_level === "verified_human");
    } else if (confidenceFilter === "likely_human") {
      filteredEvents = events.filter((e) =>
        e.confidence_level === "possible_human" || e.confidence_level === "verified_human"
      );
    }

    // ── Collect agency ids / name+state fallback keys
    const agencyIds = new Set<string>();
    const nameStateKeys = new Set<string>();
    for (const e of filteredEvents) {
      const aid = extractAgencyId(e);
      const stateSlug = e.state_slug ?? (typeof e.metadata?.state_slug === "string" ? (e.metadata.state_slug as string) : null);
      if (aid && UUID_RE.test(aid)) {
        agencyIds.add(aid);
      } else {
        const aname = typeof e.metadata?.agency_name === "string" ? (e.metadata.agency_name as string).trim() : "";
        if (aname && stateSlug) {
          nameStateKeys.add(`${aname.toLowerCase()}|${stateSlug.toLowerCase()}`);
        }
      }
    }

    const agencyMap = new Map<string, AgencyMeta>();

    if (agencyIds.size > 0) {
      const idList = Array.from(agencyIds).slice(0, 5000);

      const { data: oaRows } = await supabase
        .from("other_agencies")
        .select(
          "id, name, slug, state_slug, website_url, description, is_paid_listing, paid_override_active, paid_override_value, listing_management_status, is_active",
        )
        .in("id", idList);

      const oaById = new Map<string, Record<string, unknown>>();
      for (const row of (oaRows ?? [])) {
        oaById.set((row as Record<string, unknown>).id as string, row as Record<string, unknown>);
      }

      const { data: alRows } = await supabase
        .from("agency_listings")
        .select("agency_id, state_slug, paid_active")
        .in("agency_id", idList);
      const alPaid = new Set<string>();
      for (const r of (alRows ?? [])) {
        const row = r as Record<string, unknown>;
        if (row.paid_active === true) alPaid.add(row.agency_id as string);
      }

      const { data: top25 } = await supabase
        .from("top25_slots")
        .select("agency_id, is_paid")
        .in("agency_id", idList)
        .eq("is_paid", true);
      const top25Paid = new Set<string>();
      for (const t of (top25 ?? [])) {
        const aid = (t as Record<string, unknown>).agency_id as string | null;
        if (aid) top25Paid.add(aid);
      }

      const { data: spots } = await supabase
        .from("spotlight_placements")
        .select("agency_id, is_paid")
        .in("agency_id", idList)
        .eq("is_paid", true);
      const spotPaid = new Set<string>();
      for (const s of (spots ?? [])) {
        const aid = (s as Record<string, unknown>).agency_id as string | null;
        if (aid) spotPaid.add(aid);
      }

      for (const aid of idList) {
        const oa = oaById.get(aid);
        const isOaPaid = oa
          ? (oa.paid_override_active === true
              ? oa.paid_override_value === true
              : oa.is_paid_listing === true)
          : false;
        const paidSource = oa && oa.paid_override_active === true && oa.paid_override_value === true
          ? "paid_override"
          : oa && oa.is_paid_listing === true
            ? "is_paid_listing"
            : alPaid.has(aid)
              ? "agency_listings"
              : top25Paid.has(aid)
                ? "top25_slots"
                : spotPaid.has(aid)
                  ? "spotlight_placements"
                  : null;
        const isPaid = isOaPaid || alPaid.has(aid) || top25Paid.has(aid) || spotPaid.has(aid);
        const status = (oa?.listing_management_status as string | null) ?? null;
        const isRemoved = status === "removed" || status === "hidden" || oa?.is_active === false;

        agencyMap.set(`id:${aid}`, {
          key: `id:${aid}`,
          agency_id: aid,
          name: (oa?.name as string | null) ?? null,
          slug: (oa?.slug as string | null) ?? null,
          state_slug: (oa?.state_slug as string | null) ?? null,
          website: (oa?.website_url as string | null) ?? null,
          description: (oa?.description as string | null) ?? null,
          is_paid: isPaid,
          paid_source: paidSource,
          is_removed: isRemoved,
          listing_status: status,
        });
      }
    }

    if (nameStateKeys.size > 0) {
      const slugs = Array.from(new Set(
        Array.from(nameStateKeys).map((k) => k.split("|")[1]).filter(Boolean),
      ));
      if (slugs.length > 0) {
        const { data: others } = await supabase
          .from("other_agencies")
          .select(
            "id, name, slug, state_slug, website_url, description, is_paid_listing, paid_override_active, paid_override_value, listing_management_status, is_active",
          )
          .in("state_slug", slugs)
          .limit(10000);
        for (const o of (others ?? [])) {
          const row = o as Record<string, unknown>;
          const rawName = (row.name as string ?? "").toLowerCase().trim();
          const st = (row.state_slug as string ?? "").toLowerCase().trim();
          if (!rawName || !st) continue;
          const nk = `${rawName}|${st}`;
          if (!nameStateKeys.has(nk)) continue;
          if (agencyMap.has(`id:${row.id}`)) continue;
          const isOaPaid = row.paid_override_active === true
            ? row.paid_override_value === true
            : row.is_paid_listing === true;
          const status = (row.listing_management_status as string | null) ?? null;
          const isRemoved = status === "removed" || status === "hidden" || row.is_active === false;
          agencyMap.set(`ns:${nk}`, {
            key: `ns:${nk}`,
            agency_id: row.id as string,
            name: row.name as string,
            slug: (row.slug as string) ?? null,
            state_slug: row.state_slug as string,
            website: (row.website_url as string) ?? null,
            description: (row.description as string) ?? null,
            is_paid: isOaPaid,
            paid_source: isOaPaid ? "other_agencies" : null,
            is_removed: isRemoved,
            listing_status: status,
          });
        }
      }
    }

    return json({
      window: { from: fromDate, to: toDate, range },
      filters: {
        state_slugs: stateSlugs,
        include_removed: includeRemoved,
        include_demo: includeDemo,
        confidence_filter: confidenceFilter,
      },
      sources: {
        funnel_events: (r1.data ?? []).length,
        your_agency_funnel_events: (r2.data ?? []).length,
        manage_funnel_events: (r3.data ?? []).length,
        owner_demo_events: (r4.data ?? []).length,
        email_notification_logs: (r5.data ?? []).length,
      },
      source_errors: {
        funnel_events: r1.error?.message ?? null,
        your_agency_funnel_events: r2.error?.message ?? null,
        manage_funnel_events: r3.error?.message ?? null,
        owner_demo_events: r4.error?.message ?? null,
        email_notification_logs: r5.error?.message ?? null,
      },
      confidence_breakdown: confidenceBreakdown,
      events: filteredEvents,
      agencies: Array.from(agencyMap.values()),
    });
  } catch (err) {
    return json({ error: err instanceof Error ? err.message : String(err) }, 500);
  }
});

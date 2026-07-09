import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
  });
}

// ── Step-number constants ──────────────────────────────────────────────────────
const STEP_PROFILE_VIEW       = 30;
const STEP_CHECKOUT_OPENED    = 140;

// High-engagement threshold (total cross-source interactions)
const HIGH_ENGAGEMENT_THRESHOLD = 5;

// ── Helper: safe ISO min/max ───────────────────────────────────────────────────
function isoMin(a: string | null, b: string | null): string | null {
  if (!a) return b;
  if (!b) return a;
  return a < b ? a : b;
}
function isoMax(a: string | null, b: string | null): string | null {
  if (!a) return b;
  if (!b) return a;
  return a > b ? a : b;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    let agencyId: string;

    if (req.method === "GET") {
      const url = new URL(req.url);
      agencyId = (url.searchParams.get("agency_id") ?? "").trim();
    } else {
      const body = await req.json().catch(() => ({}));
      agencyId = (body?.agency_id ?? "").trim();
    }

    if (!agencyId) {
      return json({ ok: false, error: "agency_id is required" }, 400);
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    // ── 1. Funnel sessions ────────────────────────────────────────────────────
    const { data: sessions } = await supabase
      .from("funnel_sessions")
      .select("id, step_number, stage, last_event_at, created_at, payment_status")
      .eq("agency_id", agencyId)
      .order("created_at", { ascending: false });

    const allSessions = sessions ?? [];

    let totalProfileViews       = 0;
    let totalCheckoutVisits     = 0;
    let lastStepReached         = 0;
    let lastSeenAt: string | null = null;
    let hasPaid                 = false;

    for (const s of allSessions) {
      const step = s.step_number ?? 0;
      if (step >= STEP_PROFILE_VIEW)    totalProfileViews++;
      if (step >= STEP_CHECKOUT_OPENED) totalCheckoutVisits++;
      if (step > lastStepReached)       lastStepReached = step;
      const refAt = s.last_event_at || s.created_at;
      if (!lastSeenAt || refAt > lastSeenAt) lastSeenAt = refAt;
      if (s.stage === "paid" || s.payment_status === "paid") hasPaid = true;
    }

    // ── 2. Manage-listing events (LEGACY from funnel_events) ──────────────────
    const { data: manageEvents } = await supabase
      .from("funnel_events")
      .select("event_name")
      .eq("agency_id", agencyId)
      .in("event_name", [
        "manage_listing_opened",
        "manage_listing_activate_clicked",
        "manage_listing_keep_visible",
        "manage_listing_keep_visible_saved",
        "manage_listing_remove_started",
        "manage_listing_remove_confirmed",
      ]);

    const evts = manageEvents ?? [];
    const totalManageViews        = evts.filter(e => e.event_name === "manage_listing_opened").length;
    const totalActivationAttempts = evts.filter(e => e.event_name === "manage_listing_activate_clicked").length;
    const totalKeepVisibleActions = evts.filter(e =>
      e.event_name === "manage_listing_keep_visible" ||
      e.event_name === "manage_listing_keep_visible_saved"
    ).length;
    const totalRemoveAttempts = evts.filter(e =>
      e.event_name === "manage_listing_remove_started" ||
      e.event_name === "manage_listing_remove_confirmed"
    ).length;

    // ── 2b. Manage funnel events (NEW dedicated tracking) ──────────────────────
    const { data: manageFunnelEvents } = await supabase
      .from("manage_funnel_events")
      .select("event_type, recovery_type, created_at")
      .eq("agency_id", agencyId)
      .order("created_at", { ascending: false });

    const mfEvts = manageFunnelEvents ?? [];
    const manageFunnelOpenedCount = mfEvts.filter(e => e.event_type === "manage_funnel_opened").length;
    const manageFunnelRemoveStartedCount = mfEvts.filter(e => e.event_type === "manage_remove_started").length;
    const manageFunnelRecoveredCount = mfEvts.filter(e => e.event_type === "manage_recovered").length;
    const manageFunnelRemoveConfirmedCount = mfEvts.filter(e => e.event_type === "manage_remove_confirmed").length;

    const lastManageFunnelEvent = mfEvts[0] || null;
    const firstManageFunnelOpened = mfEvts.filter(e => e.event_type === "manage_funnel_opened").slice(-1)[0] || null;

    let manageFunnelOutcome: string | null = null;
    if (manageFunnelRemoveConfirmedCount > 0) {
      manageFunnelOutcome = "removed";
    } else if (manageFunnelRecoveredCount > 0) {
      manageFunnelOutcome = "recovered";
    } else if (manageFunnelRemoveStartedCount > 0) {
      manageFunnelOutcome = "remove_intent";
    } else if (manageFunnelOpenedCount > 0) {
      manageFunnelOutcome = "opened";
    }

    // ── 3. your_agency_funnel_events — collect all tokens for this agency ─────
    const { data: yafEvents } = await supabase
      .from("your_agency_funnel_events")
      .select("token, created_at")
      .eq("agency_id", agencyId)
      .order("created_at", { ascending: true });

    const yafRows = yafEvents ?? [];
    const yafTokenSet = new Set<string>();
    let yafFirstAt: string | null = null;
    let yafLastAt: string | null = null;

    for (const e of yafRows) {
      if (e.token) yafTokenSet.add(e.token);
      if (!yafFirstAt) yafFirstAt = e.created_at;
      yafLastAt = e.created_at;
    }

    // ── 4. smartlead_link_events — collect all lead_keys for this agency ──────
    const { data: slEvents } = await supabase
      .from("smartlead_link_events")
      .select("lead_key, created_at")
      .eq("agency_id", agencyId)
      .eq("is_bot", false)
      .order("created_at", { ascending: true });

    const slRows = slEvents ?? [];
    const slLeadKeySet = new Set<string>();
    let slFirstAt: string | null = null;
    let slLastAt: string | null = null;

    for (const e of slRows) {
      if (e.lead_key) slLeadKeySet.add(e.lead_key);
      if (!slFirstAt) slFirstAt = e.created_at;
      slLastAt = e.created_at;
    }

    // ── 4b. funnel_events — extract lead identities from metadata ────────────
    // funnel_events rows may carry { token } or { lead_key } inside their metadata
    // jsonb column. We read both fields and add valid identities to the unified set.
    // Rows with neither field are skipped — no fabricated identities.

    const { data: funnelIdentityRows } = await supabase
      .from("funnel_events")
      .select("metadata")
      .eq("agency_id", agencyId)
      .not("metadata", "is", null);

    const feTokenSet   = new Set<string>();
    const feLeadKeySet = new Set<string>();

    for (const row of funnelIdentityRows ?? []) {
      const meta = row.metadata as Record<string, unknown> | null;
      if (!meta) continue;
      const feToken   = typeof meta.token    === "string" ? meta.token    : null;
      const feLeadKey = typeof meta.lead_key === "string" ? meta.lead_key : null;
      if (feToken)   feTokenSet.add(feToken);
      if (feLeadKey) feLeadKeySet.add(feLeadKey);
    }

    // ── 5. Resolve tokens → lead_keys for unified deduplication ──────────────
    // smart_link_tokens maps compact token → lead_key (deterministic email hash).
    // We use lead_key as the canonical lead identity across all sources.
    // If a token has no matching smart_link_tokens row (e.g. legacy session), we
    // treat the token itself as the identity with a "t:" prefix to avoid collisions.
    // All token sources (yaf + funnel_events) are resolved in a single batch lookup.

    const tokenToLeadKey = new Map<string, string>();
    const allTokensToResolve = new Set<string>([...yafTokenSet, ...feTokenSet]);

    if (allTokensToResolve.size > 0) {
      const { data: tokenRows } = await supabase
        .from("smart_link_tokens")
        .select("token, lead_key")
        .in("token", [...allTokensToResolve]);

      for (const row of tokenRows ?? []) {
        if (row.token && row.lead_key) tokenToLeadKey.set(row.token, row.lead_key);
      }
    }

    // Build ONE unified lead identity set — true union, no double counting.
    // Same person appearing in yaf + smartlead + funnel_events collapses to one entry.
    const unifiedLeadSet = new Set<string>();

    for (const token of yafTokenSet) {
      const lk = tokenToLeadKey.get(token);
      unifiedLeadSet.add(lk ?? `t:${token}`);
    }

    for (const lk of slLeadKeySet) {
      unifiedLeadSet.add(lk);
    }

    for (const token of feTokenSet) {
      const lk = tokenToLeadKey.get(token);
      unifiedLeadSet.add(lk ?? `t:${token}`);
    }

    for (const lk of feLeadKeySet) {
      unifiedLeadSet.add(lk);
    }

    const engagedLeadsCount = unifiedLeadSet.size;

    // ── 6. funnel_events count (for total_interactions) ───────────────────────
    const { count: funnelEventCount } = await supabase
      .from("funnel_events")
      .select("id", { count: "exact", head: true })
      .eq("agency_id", agencyId);

    const funnelEventsTotal = funnelEventCount ?? 0;

    // ── 7. Token inventory ────────────────────────────────────────────────────
    const { count: tokenCount } = await supabase
      .from("smart_link_tokens")
      .select("token", { count: "exact", head: true })
      .eq("agency_id", agencyId);

    const totalTokens = tokenCount ?? 0;

    // ── 8. Availability requests ──────────────────────────────────────────────
    const { count: availCount } = await supabase
      .from("agency_availability_requests")
      .select("id", { count: "exact", head: true })
      .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
      .eq("is_demo", false)
      .is("deleted_at", null);

    const totalAvailabilityRequests = availCount ?? 0;

    // ── 9. Aggregate engagement ───────────────────────────────────────────────
    // engaged_leads_count = size of unified lead identity set (no double counting).
    // total_interactions  = total event rows across all sources (volume, not unique).

    const totalInteractions = yafRows.length + slRows.length + funnelEventsTotal;

    const firstEngagementAt = isoMin(
      isoMin(yafFirstAt, slFirstAt),
      allSessions[allSessions.length - 1]?.created_at ?? null
    );
    const lastEngagementAt = isoMax(isoMax(yafLastAt, slLastAt), lastSeenAt);

    // ── 10. Automation trigger flags ──────────────────────────────────────────
    const triggers = {
      visited_not_activated: (totalProfileViews > 0 || totalManageViews > 0) && totalActivationAttempts === 0,
      checkout_abandoned:    totalCheckoutVisits > 0 && !hasPaid,
      remove_intent:         totalRemoveAttempts > 0,
      high_engagement:       engagedLeadsCount >= 2 || totalInteractions >= HIGH_ENGAGEMENT_THRESHOLD,
    };

    // ── 11. Engagement messaging hint ─────────────────────────────────────────
    let engagement_hint: string | null = null;
    if (engagedLeadsCount >= 3) {
      engagement_hint = `${engagedLeadsCount} people from your team have visited this listing`;
    } else if (engagedLeadsCount === 2) {
      engagement_hint = "2 people from your team have visited this listing";
    } else if (totalInteractions >= HIGH_ENGAGEMENT_THRESHOLD) {
      engagement_hint = "Your listing has received multiple visits";
    }

    return json({
      ok: true,
      agency_id: agencyId,
      funnel_state: {
        total_manage_views:           totalManageViews,
        total_profile_views:          totalProfileViews,
        total_availability_requests:  totalAvailabilityRequests,
        total_checkout_visits:        totalCheckoutVisits,
        total_activation_attempts:    totalActivationAttempts,
        total_keep_visible_actions:   totalKeepVisibleActions,
        total_remove_attempts:        totalRemoveAttempts,
        last_seen_at:                 lastSeenAt,
        last_step_reached:            lastStepReached,
        has_paid:                     hasPaid,
        total_sessions:               allSessions.length,
      },
      manage_funnel: {
        manage_funnel_opened_count:         manageFunnelOpenedCount,
        manage_funnel_remove_started_count: manageFunnelRemoveStartedCount,
        manage_funnel_recovered_count:      manageFunnelRecoveredCount,
        manage_funnel_remove_confirmed_count: manageFunnelRemoveConfirmedCount,
        last_manage_funnel_event_type:      lastManageFunnelEvent?.event_type || null,
        last_manage_funnel_event_at:        lastManageFunnelEvent?.created_at || null,
        first_manage_funnel_opened_at:      firstManageFunnelOpened?.created_at || null,
        manage_funnel_outcome:              manageFunnelOutcome,
        total_manage_funnel_events:         mfEvts.length,
      },
      engagement: {
        engaged_leads_count:  engagedLeadsCount,
        total_interactions:   totalInteractions,
        total_tokens:         totalTokens,
        first_engagement_at:  firstEngagementAt,
        last_engagement_at:   lastEngagementAt,
        engagement_hint,
        sources: {
          your_agency_funnel_events: yafRows.length,
          smartlead_link_events:     slRows.length,
          funnel_events:             funnelEventsTotal,
          manage_funnel_events:      mfEvts.length,
        },
      },
      triggers,
    });
  } catch (err) {
    console.error("[agency-funnel-summary]", err);
    return json({ ok: false, error: (err as Error).message ?? "Internal error" }, 500);
  }
});

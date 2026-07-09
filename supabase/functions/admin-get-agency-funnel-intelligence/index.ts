import { createClient } from "npm:@supabase/supabase-js@2";
import { extractToken, verifySessionToken } from "../_shared/adminSession.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

const json = (body: unknown, status = 200) =>
  new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });

// ── Event name → human-readable label ─────────────────────────────────────────
const EVENT_LABEL_MAP: Record<string, { funnel: string; step: string }> = {
  // Your Agency funnel
  "your_agency_search":                      { funnel: "Your Agency",  step: "Search" },
  "your_agency_profile_viewed":              { funnel: "Your Agency",  step: "Profile viewed" },
  "your_agency_profile_clicked":             { funnel: "Your Agency",  step: "Profile clicked" },
  "owner_profile_viewed":                    { funnel: "Your Agency",  step: "Profile viewed" },
  "owner_preview_missed_clients_page_viewed":{ funnel: "Your Agency",  step: "Missed clients viewed" },
  "owner_preview_state_page_viewed":         { funnel: "Your Agency",  step: "State page viewed" },
  "owner_preview_availability_opened":       { funnel: "Your Agency",  step: "Availability form opened" },
  "owner_preview_availability_submitted":    { funnel: "Your Agency",  step: "Availability submitted" },
  "owner_preview_scroll_to_listing":         { funnel: "Your Agency",  step: "Scrolled to listing" },
  "yafe_profile_viewed":                     { funnel: "Your Agency",  step: "Profile viewed" },
  "yafe_ledger_viewed":                      { funnel: "Your Agency",  step: "Ledger viewed" },
  "yafe_missed_clients_viewed":              { funnel: "Your Agency",  step: "Missed clients viewed" },
  "yafe_cta_clicked":                        { funnel: "Your Agency",  step: "CTA clicked" },
  "yafe_token_created":                      { funnel: "Your Agency",  step: "Token created" },

  // Request Replay
  "request_replay_viewed":                   { funnel: "Request Replay", step: "Replay viewed" },
  "replay_opened":                           { funnel: "Request Replay", step: "Replay opened" },
  "replay_funnel_opened":                    { funnel: "Request Replay", step: "Replay opened" },
  "replay_ledger_viewed":                    { funnel: "Request Replay", step: "Ledger viewed" },
  "replay_cta_clicked":                      { funnel: "Request Replay", step: "CTA clicked" },

  // Request Compare
  "request_compare_opened":                  { funnel: "Request Compare", step: "Compare opened" },
  "compare_opened":                          { funnel: "Request Compare", step: "Compare opened" },
  "compare_cta_clicked":                     { funnel: "Request Compare", step: "CTA clicked" },

  // Manage Listing
  "manage_funnel_opened":                    { funnel: "Manage Listing", step: "Manage page opened" },
  "manage_listing_opened":                   { funnel: "Manage Listing", step: "Manage page opened" },
  "manage_remove_started":                   { funnel: "Manage Listing", step: "Removal intent" },
  "manage_recovered":                        { funnel: "Manage Listing", step: "Recovered / kept" },
  "manage_remove_confirmed":                 { funnel: "Manage Listing", step: "Removal confirmed" },

  // Activation
  "activation_page_viewed":                  { funnel: "Activation",  step: "Page viewed" },
  "activation_upgrade_page_viewed":          { funnel: "Activation",  step: "Page viewed" },
  "activation_option_selected":              { funnel: "Activation",  step: "Option selected" },
  "activation_option_clicked":               { funnel: "Activation",  step: "Option clicked" },
  "activation_option_viewed":                { funnel: "Activation",  step: "Option viewed" },
  "activation_cta_clicked":                  { funnel: "Activation",  step: "CTA clicked" },
  "activation_upgrade_option_selected":      { funnel: "Activation",  step: "Option selected" },
  "activation_standard_phase1_clicked":      { funnel: "Activation",  step: "Standard clicked / Top-25 shown" },
  "activation_phase2_viewed":                { funnel: "Activation",  step: "Top-25 options viewed" },
  "activation_top25_options_viewed":         { funnel: "Activation",  step: "Top-25 options viewed" },
  "activation_final_option_clicked":         { funnel: "Activation",  step: "Final option selected" },

  // Discount
  "discount_offer_viewed":                   { funnel: "Discount",    step: "Offer viewed" },
  "offer_token_opened":                      { funnel: "Discount",    step: "Offer opened" },
  "discount_offer_opened":                   { funnel: "Discount",    step: "Offer opened" },
  "discount_cta_clicked":                    { funnel: "Discount",    step: "CTA clicked" },
  "discount_checkout_started":               { funnel: "Discount",    step: "Checkout started" },

  // Checkout
  "checkout_started":                        { funnel: "Checkout",    step: "Checkout started" },
  "stripe_checkout_started":                 { funnel: "Checkout",    step: "Checkout started" },
  "checkout_session_created":                { funnel: "Checkout",    step: "Session created" },
  "checkout_completed":                      { funnel: "Checkout",    step: "Completed / Paid" },
  "checkout_paid":                           { funnel: "Checkout",    step: "Paid" },

  // Top 25 / Upsell
  "top25_upsell_viewed":                     { funnel: "Top 25",      step: "Upsell viewed" },
  "standard_upgrade_offer_viewed":           { funnel: "Top 25",      step: "Upsell viewed" },
  "standard_upgrade_offer_upgrade_clicked":  { funnel: "Top 25",      step: "Upgrade card clicked" },
  "top25_upgrade_selected":                  { funnel: "Top 25",      step: "Upgrade position selected" },
  "top25_confirm_viewed":                    { funnel: "Top 25",      step: "Confirm viewed" },
  "top25_checkout_started":                  { funnel: "Top 25",      step: "Checkout started" },
  "top25_application_submitted":             { funnel: "Top 25",      step: "Application submitted" },

  // Smart routing
  "smart_continue_opened":                   { funnel: "Smart Continue", step: "Page opened" },
  "smart_next_resolved":                     { funnel: "Smart Continue", step: "Route resolved" },
};

function normalizeFunnelType(ft: string | null): string {
  if (!ft) return "Unknown";
  const t = ft.toLowerCase();
  if (t.includes("your_agency") || t.includes("yafe")) return "Your Agency";
  if (t.includes("replay"))   return "Request Replay";
  if (t.includes("compare"))  return "Request Compare";
  if (t.includes("manage"))   return "Manage Listing";
  if (t.includes("activation") || t.includes("upgrade")) return "Activation";
  if (t.includes("discount"))  return "Discount";
  if (t.includes("checkout"))  return "Checkout";
  if (t.includes("top25") || t.includes("spotlight")) return "Top 25";
  return ft;
}

function labelForEvent(eventName: string | null, funnelType: string | null): { funnel: string; step: string } {
  if (eventName && EVENT_LABEL_MAP[eventName]) return EVENT_LABEL_MAP[eventName];
  // Fall back to funnel type + raw event name
  const funnel = normalizeFunnelType(funnelType);
  const step = eventName
    ? eventName.replace(/_/g, " ").replace(/\b\w/g, (c) => c.toUpperCase())
    : "Event";
  return { funnel, step };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: corsHeaders });

  try {
    // ── Admin auth ───────────────────────────────────────────────────────────
    const token = extractToken(req);
    if (!token) return json({ ok: false, error: "Unauthorized" }, 401);
    const auth = await verifySessionToken(token);
    if (!auth.ok) {
      return json({ ok: false, error: auth.error === "expired" ? "Admin session expired. Please log in again." : "Unauthorized" }, 401);
    }

    const url = new URL(req.url);
    const agencyId   = url.searchParams.get("agency_id") ?? "";
    const agencySlug = url.searchParams.get("agency_slug") ?? "";

    if (!agencyId && !agencySlug) {
      return json({ ok: false, error: "Missing agency_id or agency_slug" }, 400);
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    const uuidPattern = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
    const isUuid = uuidPattern.test(agencyId);

    // ── Funnel sessions ──────────────────────────────────────────────────────
    let sessQ = supabase
      .from("funnel_sessions")
      .select("id, funnel_type, funnel_name, stage, state_slug, agency_name, agency_slug, agency_id, step_number, entry_path, purchased_product, purchased_amount, payment_status, payment_source, checkout_session_id, last_event_name, last_event_at, is_demo, created_at, drop_off_step_number, selected_offer, selected_upsell")
      .order("created_at", { ascending: false })
      .limit(200);

    if (agencyId && isUuid) {
      sessQ = sessQ.eq("agency_id", agencyId);
    } else if (agencyId) {
      sessQ = sessQ.eq("agency_id", agencyId);
    } else {
      sessQ = sessQ.eq("agency_slug", agencySlug);
    }

    // ── Funnel events ────────────────────────────────────────────────────────
    // Fetch up to 200 raw events for this agency across all sessions
    let eventsQ = supabase
      .from("funnel_events")
      .select("id, session_id, funnel_type, state_slug, event_name, event_stage, page_path, metadata, created_at, ip_address, user_agent, country, city, region")
      .order("created_at", { ascending: false })
      .limit(200);

    // We'll join events to sessions after fetching both
    // First get sessions, then query events by session_id IN (...)

    // ── Activation option selected (email_notification_logs) ────────────────
    let activationQ = supabase
      .from("email_notification_logs")
      .select("id, notification_type, payload, created_at, status")
      .eq("notification_type", "activation_option_selected")
      .order("created_at", { ascending: false })
      .limit(50);

    if (agencyId) {
      activationQ = activationQ.eq("payload->>agency_id" as never, agencyId);
    } else if (agencySlug) {
      activationQ = activationQ.eq("payload->>agency_slug" as never, agencySlug);
    }

    // ── Top-25 upgrade selected (email_notification_logs) ────────────────
    let top25SelectedQ = supabase
      .from("email_notification_logs")
      .select("id, notification_type, payload, created_at, status")
      .eq("notification_type", "top25_upgrade_selected")
      .order("created_at", { ascending: false })
      .limit(50);

    if (agencyId) {
      top25SelectedQ = top25SelectedQ.eq("payload->>agency_id" as never, agencyId);
    } else if (agencySlug) {
      top25SelectedQ = top25SelectedQ.eq("payload->>agency_slug" as never, agencySlug);
    }

    // ── Manage funnel events ─────────────────────────────────────────────────
    let manageQ = supabase
      .from("manage_funnel_events")
      .select("id, event_type, agency_id, agency_slug, agency_name, state_slug, recovery_type, entry_reason, created_at, user_agent, request_ip, country, city, region")
      .order("created_at", { ascending: false })
      .limit(50);

    if (agencyId) {
      manageQ = manageQ.eq("agency_id", agencyId);
    } else {
      manageQ = manageQ.eq("agency_slug", agencySlug);
    }

    // ── Stripe orders ────────────────────────────────────────────────────────
    let ordersQ = supabase
      .from("stripe_orders")
      .select("id, checkout_session_id, payment_intent_id, amount_total, payment_status, status, agency_id, agency_name, state_slug, funnel_type, created_at, paid_at, product_summary, subscription_id, top25_rank, customer_email, discount_percent")
      .order("created_at", { ascending: false })
      .limit(20);

    if (agencyId) {
      ordersQ = ordersQ.eq("agency_id", agencyId);
    } else {
      ordersQ = ordersQ.eq("agency_name", agencySlug); // best effort
    }

    // ── Discount offers ──────────────────────────────────────────────────────
    let discountQ = supabase
      .from("discount_offers")
      .select("id, token, agency_id, agency_slug, state_slug, discount_type, discount_value, expires_at, max_uses, usage_count, is_active, created_at")
      .order("created_at", { ascending: false })
      .limit(20);

    if (agencyId) {
      discountQ = discountQ.eq("agency_id", agencyId);
    } else {
      discountQ = discountQ.eq("agency_slug", agencySlug);
    }

    // ── Smart routing events (funnel_events with manage_funnel_tracking) ─────
    let replayQ = supabase
      .from("replay_funnel_tracking")
      .select("id, agency_id, agency_slug, state_slug, event_type, created_at, metadata")
      .order("created_at", { ascending: false })
      .limit(50);

    if (agencyId) {
      replayQ = replayQ.eq("agency_id", agencyId);
    } else {
      replayQ = replayQ.eq("agency_slug", agencySlug);
    }

    // Run in parallel
    const [
      sessResult,
      activationResult,
      manageResult,
      ordersResult,
      discountResult,
      replayResult,
      top25SelectedResult,
    ] = await Promise.allSettled([
      sessQ,
      activationQ,
      manageQ,
      ordersQ,
      discountQ,
      replayQ,
      top25SelectedQ,
    ]);

    const sessions = sessResult.status === "fulfilled" ? (sessResult.value.data ?? []) : [];
    const activationLogs = activationResult.status === "fulfilled" ? (activationResult.value.data ?? []) : [];
    const manageEvents = manageResult.status === "fulfilled" ? (manageResult.value.data ?? []) : [];
    const orders = ordersResult.status === "fulfilled" ? (ordersResult.value.data ?? []) : [];
    const discountOffers = discountResult.status === "fulfilled" ? (discountResult.value.data ?? []) : [];
    const replayEvents = replayResult.status === "fulfilled" ? (replayResult.value.data ?? []) : [];
    const top25SelectedLogs = top25SelectedResult.status === "fulfilled" ? (top25SelectedResult.value.data ?? []) : [];

    // Fetch funnel events by session IDs
    const sessionIds = sessions.map((s: Record<string, unknown>) => s.id as string);
    let rawFunnelEvents: Record<string, unknown>[] = [];
    if (sessionIds.length > 0) {
      const { data: fe } = await eventsQ.in("session_id", sessionIds.slice(0, 100));
      rawFunnelEvents = fe ?? [];
    }

    // ── Build visitor context lookup maps ────────────────────────────────────
    // Map session_id → best funnel_event with visitor context (most recent)
    const sessionVisitorMap = new Map<string, Record<string, unknown>>();
    for (const fe of rawFunnelEvents) {
      const ev = fe as Record<string, unknown>;
      const sid = ev.session_id as string | null;
      if (!sid) continue;
      if (ev.ip_address || ev.user_agent || ev.country || ev.city) {
        const existing = sessionVisitorMap.get(sid);
        if (!existing || (ev.created_at as string) > (existing.created_at as string)) {
          sessionVisitorMap.set(sid, ev);
        }
      }
    }

    // Sorted array of funnel_events with visitor context (for time-window fallback)
    const eventsWithContext = rawFunnelEvents.filter((fe) => {
      const ev = fe as Record<string, unknown>;
      return !!(ev.ip_address || ev.user_agent || ev.country || ev.city);
    }) as Record<string, unknown>[];

    // ── Compute totals ───────────────────────────────────────────────────────
    const paidSessions = sessions.filter((s: Record<string, unknown>) => s.stage === "paid" || s.payment_status === "paid");
    const checkoutSessions = sessions.filter((s: Record<string, unknown>) => (s.step_number as number) === 150 || s.stage === "checkout_started");
    const paidOrders = orders.filter((o: Record<string, unknown>) => o.payment_status === "paid" || o.status === "completed" || o.status === "complete");
    const revenue = paidOrders.reduce((sum: number, o: Record<string, unknown>) => sum + ((o.amount_total as number) ?? 0), 0) / 100;

    const cutoff30d = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString();
    const sessions30d = sessions.filter((s: Record<string, unknown>) => (s.created_at as string) >= cutoff30d).length;
    const maxStep = sessions.reduce((max: number, s: Record<string, unknown>) => Math.max(max, (s.step_number as number) ?? 0), 0);

    const lastSession = sessions[0] as Record<string, unknown> | undefined;
    const lastSeenDate = lastSession ? ((lastSession.last_event_at as string) || (lastSession.created_at as string)) : null;
    const isPaid = paidSessions.length > 0 || paidOrders.length > 0;
    const hasCheckout = checkoutSessions.length > 0 || (orders.length > 0);
    const hasActivationOption = activationLogs.length > 0;
    const activationOption = hasActivationOption ? (activationLogs[0] as Record<string, unknown>) : null;
    const activationOptionPayload = activationOption ? (activationOption.payload as Record<string, unknown>) : null;

    // ── 2-phase activation signals derived from funnel_events ────────────────
    const phase1Clicked = rawFunnelEvents.some((fe) => {
      const ev = fe as Record<string, unknown>;
      return ev.event_name === "activation_standard_phase1_clicked";
    });
    const top25Viewed = rawFunnelEvents.some((fe) => {
      const ev = fe as Record<string, unknown>;
      return ev.event_name === "activation_top25_options_viewed" || ev.event_name === "activation_phase2_viewed";
    });
    const finalOptionEvents = rawFunnelEvents.filter((fe) => {
      const ev = fe as Record<string, unknown>;
      return ev.event_name === "activation_final_option_clicked";
    });
    const latestFinalOption = finalOptionEvents.length > 0
      ? ((finalOptionEvents[0] as Record<string, unknown>).metadata as Record<string, unknown>) ?? null
      : null;
    const finalOptionSelected = finalOptionEvents.length > 0;
    const finalOptionName = latestFinalOption?.selected_option as string | null ?? null;
    const finalOptionPrice = latestFinalOption?.selected_price as number | null ?? null;
    const finalOptionRank = latestFinalOption?.selected_rank as number | null ?? null;
    const hasDiscount = discountOffers.length > 0;
    const latestDiscount = discountOffers[0] as Record<string, unknown> | undefined;

    // ── Visitor context helpers ──────────────────────────────────────────────
    // Find the nearest funnel_event with visitor context within ±10 minutes of ts
    function nearestVisitorContext(ts: string): Record<string, unknown> | null {
      const targetMs = new Date(ts).getTime();
      const windowMs = 10 * 60 * 1000; // 10 minutes
      let best: Record<string, unknown> | null = null;
      let bestDiff = Infinity;
      for (const ev of eventsWithContext) {
        const diff = Math.abs(new Date(ev.created_at as string).getTime() - targetMs);
        if (diff <= windowMs && diff < bestDiff) {
          bestDiff = diff;
          best = ev;
        }
      }
      return best;
    }

    function extractPayloadVisitor(p: Record<string, unknown>): { ip_address: string | null; user_agent: string | null; country: string | null; city: string | null; region: string | null } {
      return {
        ip_address: (p.ip_address as string | null) ?? (p.request_ip as string | null) ?? (p.visitor_ip as string | null) ?? null,
        user_agent: (p.user_agent as string | null) ?? null,
        country: (p.country as string | null) ?? null,
        city: (p.city as string | null) ?? null,
        region: (p.region as string | null) ?? null,
      };
    }

    function extractEventVisitor(ev: Record<string, unknown>): { ip_address: string | null; user_agent: string | null; country: string | null; city: string | null; region: string | null } {
      return {
        ip_address: (ev.ip_address as string | null) ?? null,
        user_agent: (ev.user_agent as string | null) ?? null,
        country: (ev.country as string | null) ?? null,
        city: (ev.city as string | null) ?? null,
        region: (ev.region as string | null) ?? null,
      };
    }

    // ── Journey Timeline ─────────────────────────────────────────────────────
    // Merge all event sources into a unified timeline
    type TimelineEvent = {
      id: string;
      ts: string;
      funnel: string;
      step: string;
      details: string | null;
      source: string;
      badge: "viewed" | "clicked" | "selected" | "checkout" | "paid" | "discount" | "dropped" | "manage";
      raw_event?: string;
      ip_address?: string | null;
      user_agent?: string | null;
      country?: string | null;
      city?: string | null;
      region?: string | null;
    };

    const timeline: TimelineEvent[] = [];

    // Add funnel_events
    for (const fe of rawFunnelEvents) {
      const ev = fe as Record<string, unknown>;
      const labeled = labelForEvent(ev.event_name as string, ev.funnel_type as string);
      const meta = (ev.metadata as Record<string, unknown>) ?? {};
      const details = meta.page_path ? String(meta.page_path) : (ev.page_path as string | null);
      const en = (ev.event_name as string ?? "").toLowerCase();
      let badge: TimelineEvent["badge"] = "viewed";
      if (en.includes("paid") || en.includes("payment")) badge = "paid";
      else if (en.includes("checkout") || en.includes("stripe")) badge = "checkout";
      else if (en.includes("selected") || en.includes("option")) badge = "selected";
      else if (en.includes("clicked") || en.includes("click")) badge = "clicked";
      else if (en.includes("discount") || en.includes("offer")) badge = "discount";
      else if (en.includes("drop") || en.includes("remove")) badge = "dropped";
      timeline.push({
        id: `fe-${ev.id}`,
        ts: ev.created_at as string,
        funnel: labeled.funnel,
        step: labeled.step,
        details: details ?? null,
        source: "funnel_events",
        badge,
        raw_event: ev.event_name as string,
        ip_address: (ev.ip_address as string | null) ?? null,
        user_agent: (ev.user_agent as string | null) ?? null,
        country: (ev.country as string | null) ?? null,
        city: (ev.city as string | null) ?? null,
        region: (ev.region as string | null) ?? null,
      });
    }

    // Add funnel_sessions as timeline events (last_event_name pivot)
    for (const s of sessions) {
      const sess = s as Record<string, unknown>;
      if (!sess.last_event_name) continue;
      const labeled = labelForEvent(sess.last_event_name as string, sess.funnel_type as string);
      const en = (sess.last_event_name as string ?? "").toLowerCase();
      let badge: TimelineEvent["badge"] = "viewed";
      if (sess.stage === "paid" || sess.payment_status === "paid") badge = "paid";
      else if (en.includes("checkout") || sess.stage === "checkout_started") badge = "checkout";
      else if (en.includes("selected") || en.includes("option")) badge = "selected";
      else if (en.includes("clicked")) badge = "clicked";
      else if (en.includes("discount")) badge = "discount";
      const ts = (sess.last_event_at as string) || (sess.created_at as string);
      const details = [
        sess.selected_offer ? `Option: ${sess.selected_offer}` : null,
        sess.state_slug ? String(sess.state_slug) : null,
      ].filter(Boolean).join(" · ") || null;
      // Enrich visitor context from the most recent matching funnel_event for this session
      const sessCtx = sessionVisitorMap.get(sess.id as string) ?? null;
      const visitor = sessCtx ? extractEventVisitor(sessCtx) : { ip_address: null, user_agent: null, country: null, city: null, region: null };
      timeline.push({
        id: `sess-${sess.id}`,
        ts,
        funnel: labeled.funnel,
        step: labeled.step,
        details,
        source: "funnel_session",
        badge,
        raw_event: sess.last_event_name as string,
        ...visitor,
      });
    }

    // Add activation option selected events
    for (const log of activationLogs) {
      const l = log as Record<string, unknown>;
      const p = (l.payload as Record<string, unknown>) ?? {};
      const optionName = (p.selected_option as string) ?? "Unknown option";
      const price = p.selected_price ? `$${p.selected_price}` : null;
      const state = (p.state_slug as string) ?? null;
      const details = [optionName, price, state].filter(Boolean).join(" · ");
      // Try payload first, then nearest funnel_event within 10 min
      const payloadCtx = extractPayloadVisitor(p);
      const fallbackCtx = (!payloadCtx.ip_address && !payloadCtx.user_agent)
        ? nearestVisitorContext(l.created_at as string)
        : null;
      const visitor = payloadCtx.ip_address || payloadCtx.user_agent
        ? payloadCtx
        : (fallbackCtx ? extractEventVisitor(fallbackCtx) : { ip_address: null, user_agent: null, country: null, city: null, region: null });
      timeline.push({
        id: `act-${l.id}`,
        ts: l.created_at as string,
        funnel: "Activation",
        step: "Option selected",
        details: details || null,
        source: "activation_log",
        badge: "selected",
        raw_event: "activation_option_selected",
        ...visitor,
      });
    }

    // Add top25_upgrade_selected notification logs
    for (const log of top25SelectedLogs) {
      const l = log as Record<string, unknown>;
      const p = (l.payload as Record<string, unknown>) ?? {};
      const rank = p.selected_rank ? `Rank #${p.selected_rank}` : null;
      const price = p.selected_price ? `$${p.selected_price}` : null;
      const state = (p.state_name as string) || (p.state_slug as string) || null;
      const discount = p.discount_percent ? `${p.discount_percent}% off` : null;
      const details = [rank, price, state, discount].filter(Boolean).join(" · ");
      const payloadCtx = extractPayloadVisitor(p);
      const fallbackCtx = (!payloadCtx.ip_address && !payloadCtx.user_agent)
        ? nearestVisitorContext(l.created_at as string)
        : null;
      const visitor = payloadCtx.ip_address || payloadCtx.user_agent
        ? payloadCtx
        : (fallbackCtx ? extractEventVisitor(fallbackCtx) : { ip_address: null, user_agent: null, country: null, city: null, region: null });
      timeline.push({
        id: `top25sel-${l.id}`,
        ts: l.created_at as string,
        funnel: "Top 25",
        step: "Upgrade position selected",
        details: details || null,
        source: "top25_selected_log",
        badge: "selected",
        raw_event: "top25_upgrade_selected",
        ...visitor,
      });
    }

    // Add manage funnel events
    const manageStepMap: Record<string, string> = {
      manage_funnel_opened: "Manage page opened",
      manage_remove_started: "Removal intent",
      manage_recovered: "Recovered / kept",
      manage_remove_confirmed: "Removal confirmed",
    };
    for (const me of manageEvents) {
      const m = me as Record<string, unknown>;
      const step = manageStepMap[m.event_type as string] ?? String(m.event_type);
      const details = m.recovery_type ? `Recovery: ${m.recovery_type}` : (m.entry_reason ? `Reason: ${m.entry_reason}` : null);
      const en = (m.event_type as string ?? "").toLowerCase();
      const badge: TimelineEvent["badge"] = en.includes("remove") ? "dropped" : "manage";
      timeline.push({
        id: `manage-${m.id}`,
        ts: m.created_at as string,
        funnel: "Manage Listing",
        step,
        details: details as string | null,
        source: "manage_funnel",
        badge,
        raw_event: m.event_type as string,
        ip_address: (m.request_ip as string | null) ?? null,
        user_agent: (m.user_agent as string | null) ?? null,
        country: (m.country as string | null) ?? null,
        city: (m.city as string | null) ?? null,
        region: (m.region as string | null) ?? null,
      });
    }

    // Add replay events — no dedicated IP columns on this table; use metadata fields
    for (const re of replayEvents) {
      const r = re as Record<string, unknown>;
      const labeled = labelForEvent(r.event_type as string, "replay");
      const meta = (r.metadata as Record<string, unknown>) ?? {};
      const metaCtx = extractPayloadVisitor(meta);
      // Also check top-level columns in case they exist in future schema updates
      const topCtx = extractPayloadVisitor(r);
      const visitor = topCtx.ip_address || topCtx.user_agent
        ? topCtx
        : (metaCtx.ip_address || metaCtx.user_agent
            ? metaCtx
            : (nearestVisitorContext(r.created_at as string)
                ? extractEventVisitor(nearestVisitorContext(r.created_at as string)!)
                : { ip_address: null, user_agent: null, country: null, city: null, region: null }));
      timeline.push({
        id: `replay-${r.id}`,
        ts: r.created_at as string,
        funnel: labeled.funnel,
        step: labeled.step,
        details: (r.state_slug as string) ?? null,
        source: "replay_funnel",
        badge: "viewed",
        raw_event: r.event_type as string,
        ...visitor,
      });
    }

    // Add stripe orders as paid events
    for (const order of paidOrders) {
      const o = order as Record<string, unknown>;
      const details = [
        o.product_summary ? String(o.product_summary) : null,
        o.amount_total ? `$${((o.amount_total as number) / 100).toFixed(2)}` : null,
        o.state_slug ? String(o.state_slug) : null,
      ].filter(Boolean).join(" · ");
      timeline.push({
        id: `order-${o.id}`,
        ts: (o.paid_at as string) || (o.created_at as string),
        funnel: "Checkout",
        step: "Paid",
        details: details || null,
        source: "stripe_order",
        badge: "paid",
        raw_event: "stripe_order_paid",
      });
    }

    // Sort timeline newest first, deduplicate by composite key within 60s window
    timeline.sort((a, b) => new Date(b.ts).getTime() - new Date(a.ts).getTime());

    // Deduplicate: same funnel+step within 60s → keep newest
    const deduped: TimelineEvent[] = [];
    const seen = new Set<string>();
    for (const ev of timeline) {
      const bucket = Math.floor(new Date(ev.ts).getTime() / 60_000);
      const key = `${ev.funnel}|${ev.step}|${bucket}`;
      if (!seen.has(key)) {
        seen.add(key);
        deduped.push(ev);
      }
    }

    // ── Funnel Progress ──────────────────────────────────────────────────────
    type FunnelProgress = {
      funnel: string;
      last_seen: string | null;
      max_step: string | null;
      sessions: number;
      status: string;
      details: Record<string, unknown>;
    };

    const funnelMap = new Map<string, FunnelProgress>();
    const ensureFunnel = (name: string): FunnelProgress => {
      if (!funnelMap.has(name)) {
        funnelMap.set(name, { funnel: name, last_seen: null, max_step: null, sessions: 0, status: "No activity", details: {} });
      }
      return funnelMap.get(name)!;
    };

    for (const s of sessions) {
      const sess = s as Record<string, unknown>;
      const fName = normalizeFunnelType(sess.funnel_type as string | null);
      const fp = ensureFunnel(fName);
      fp.sessions++;
      const ts = (sess.last_event_at as string) || (sess.created_at as string);
      if (!fp.last_seen || ts > fp.last_seen) {
        fp.last_seen = ts;
        fp.max_step = sess.last_event_name as string | null;
      }
      if (sess.stage === "paid" || sess.payment_status === "paid") fp.status = "Paid";
      else if (fp.status !== "Paid" && (sess.stage === "checkout_started" || (sess.step_number as number) === 150)) fp.status = "Checkout seen";
      else if (fp.status !== "Paid" && fp.status !== "Checkout seen" && (sess.step_number as number) >= 140) fp.status = "Offer viewed";
      else if (fp.status === "No activity" && (sess.step_number as number) > 0) fp.status = "Active";
    }

    for (const me of manageEvents) {
      const m = me as Record<string, unknown>;
      const fp = ensureFunnel("Manage Listing");
      fp.sessions++;
      const ts = m.created_at as string;
      if (!fp.last_seen || ts > fp.last_seen) {
        fp.last_seen = ts;
        fp.max_step = manageStepMap[m.event_type as string] ?? String(m.event_type);
      }
      if (m.event_type === "manage_remove_confirmed") fp.status = "Removed";
      else if (fp.status === "No activity") fp.status = "Active";
    }

    if (activationLogs.length > 0) {
      const fp = ensureFunnel("Activation");
      const p = ((activationLogs[0] as Record<string, unknown>).payload as Record<string, unknown>) ?? {};
      fp.details = {
        option_selected: (p.selected_option as string) ?? null,
        option_type: (p.selected_option_type as string) ?? null,
        price: p.selected_price ?? null,
        rank: p.selected_rank ?? null,
        state: p.state_slug ?? null,
        checkout_after: hasCheckout,
        paid_after: isPaid,
      };
      if (fp.status === "No activity" || fp.status === "Active") fp.status = "Option selected";
    }

    if (hasDiscount && latestDiscount) {
      const fp = ensureFunnel("Discount");
      fp.last_seen = latestDiscount.created_at as string;
      fp.details = {
        discount_value: latestDiscount.discount_value,
        discount_type: latestDiscount.discount_type,
        token: latestDiscount.token,
        usage_count: latestDiscount.usage_count,
        max_uses: latestDiscount.max_uses,
      };
      fp.status = (latestDiscount.usage_count as number) > 0 ? "Discount used" : "Discount created";
    }

    for (const o of paidOrders) {
      const ord = o as Record<string, unknown>;
      const fp = ensureFunnel("Checkout");
      fp.sessions++;
      fp.status = "Paid";
      const ts = (ord.paid_at as string) || (ord.created_at as string);
      if (!fp.last_seen || ts > fp.last_seen) fp.last_seen = ts;
      fp.details = {
        product: ord.product_summary,
        amount: ord.amount_total ? (ord.amount_total as number) / 100 : null,
        order_id: ord.id,
      };
    }

    // ── Sales signals ────────────────────────────────────────────────────────
    const lastStage = (lastSession?.stage as string) ?? null;
    const lastFunnel = lastSession ? normalizeFunnelType((lastSession.funnel_type as string) ?? null) : null;
    const lastSource = lastSession ? (() => {
      const ep = (lastSession.entry_path as string ?? "").toLowerCase();
      const ft = ((lastSession.funnel_type as string) || (lastSession.funnel_name as string) || "").toLowerCase();
      if (ep === "search") return "Search (/your-agency)";
      if (ep === "direct_profile") return "Direct Profile Link";
      if (ft.includes("your_agency")) return "Your-Agency Funnel";
      if (ft.includes("replay")) return "Request Replay";
      if (ft.includes("manage")) return "Manage Funnel";
      if (ep === "email" || ft.includes("email")) return "Email Campaign";
      return "Direct / Landing";
    })() : null;

    let dropOff = "No activity";
    if (isPaid) dropOff = "Converted (Paid)";
    else if (hasCheckout) dropOff = "Dropped at Checkout";
    else if (maxStep >= 140) dropOff = "Dropped after Activation Offer";
    else if (maxStep >= 110) dropOff = "Dropped at Upsell";
    else if (maxStep >= 80) dropOff = "Dropped after Demo";
    else if (maxStep >= 40) dropOff = "Dropped after Availability";
    else if (maxStep >= 10) dropOff = "Early Exit";

    return json({
      ok: true,
      summary: {
        total_sessions: sessions.length,
        sessions_30d: sessions30d,
        has_checkout: hasCheckout,
        is_paid: isPaid,
        revenue,
        last_seen: lastSeenDate,
        max_step: maxStep,
      },
      sales_signals: {
        last_source: lastSource,
        last_funnel: lastFunnel,
        last_stage: lastStage,
        last_step: lastSession?.last_event_name ?? null,
        max_depth: maxStep,
        activation_viewed: sessions.some((s: Record<string, unknown>) => (s.step_number as number) >= 140) || activationLogs.length > 0,
        activation_option_selected: hasActivationOption,
        activation_option_name: activationOptionPayload?.selected_option ?? null,
        activation_option_price: activationOptionPayload?.selected_price ?? null,
        activation_option_type: activationOptionPayload?.selected_option_type ?? null,
        // 2-phase activation signals
        activation_phase1_standard_clicked: phase1Clicked,
        activation_top25_options_viewed: top25Viewed,
        activation_final_option_selected: finalOptionSelected,
        activation_final_option_name: finalOptionName,
        activation_final_option_price: finalOptionPrice,
        activation_final_rank: finalOptionRank,
        checkout_seen: hasCheckout,
        discount_opened: hasDiscount,
        discount_percent: latestDiscount?.discount_value ?? null,
        paid: isPaid,
        drop_off: dropOff,
        revenue: isPaid ? revenue : null,
      },
      funnel_progress: Array.from(funnelMap.values()),
      journey_timeline: deduped.slice(0, 30),
      activation_option_events: activationLogs.map((l: Record<string, unknown>) => {
        const p = (l.payload as Record<string, unknown>) ?? {};
        return {
          id: l.id,
          created_at: l.created_at,
          selected_option: p.selected_option,
          selected_option_type: p.selected_option_type,
          selected_rank: p.selected_rank,
          selected_price: p.selected_price,
          state_slug: p.state_slug,
          agency_name: p.agency_name,
          discount_percent: p.discount_percent,
          next_destination: p.next_destination,
          status: l.status,
        };
      }),
      discount_events: discountOffers,
      checkout_events: orders.map((o: Record<string, unknown>) => ({
        id: o.id,
        created_at: o.created_at,
        paid_at: o.paid_at,
        payment_status: o.payment_status,
        status: o.status,
        amount_total: o.amount_total,
        product_summary: o.product_summary,
        funnel_type: o.funnel_type,
        state_slug: o.state_slug,
        subscription_id: o.subscription_id,
        discount_percent: o.discount_percent,
      })),
    });
  } catch (err) {
    console.error("[admin-get-agency-funnel-intelligence] error:", err);
    return json({ ok: false, error: "Internal server error" }, 500);
  }
});

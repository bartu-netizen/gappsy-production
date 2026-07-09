import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { extractVisitorContext } from "../_shared/visitorContext.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

const STAGE_PRECEDENCE: Record<string, number> = {
  paid: 100,
  checkout_started: 80,
  offer_viewed: 60,    // canonical stage for listing_activation_offer_page_viewed (step 140)
  upsell_viewed: 58,   // legacy stage — preserved for backward compat with historical rows
  submitted: 20,
  opened: 5,
};

function stageFromEvent(eventName: string, eventStage?: string): string {
  // canonical payment event names
  if (eventName === "checkout_completed" || eventName === "stripe_checkout_completed") return "paid";
  // DEPRECATED: "payment_success" is a legacy alias for checkout_completed.
  // New code must use "stripe_checkout_completed" (dispatched by stripe-webhook).
  if (eventName === "payment_success") return "paid";
  // canonical checkout event
  if (eventName === "checkout_page_viewed") return "checkout_started";
  // DEPRECATED: "checkout_start" is a legacy alias for checkout_page_viewed.
  // New code must use "checkout_page_viewed".
  if (eventName === "checkout_start") return "checkout_started";
  if (eventName === "form_submit") return "submitted";
  // canonical: listing_activation_offer_page_viewed (step 140) → offer_viewed
  if (eventName === "listing_activation_offer_page_viewed" || eventName === "offer_view") return "offer_viewed";
  // DEPRECATED: "upsell_view" is a legacy alias used by historical top25/spotlight events.
  // New code must use "listing_activation_offer_page_viewed".
  // Maps to offer_viewed (canonical) — NOT upsell_viewed — to avoid polluting analytics with
  // legacy stage names.
  if (eventName === "upsell_view") return "offer_viewed";
  if (eventStage === "checkout") return "checkout_started";
  // eventStage "upsell" and "offer" both map to canonical offer_viewed
  if (eventStage === "upsell" || eventStage === "offer") return "offer_viewed";
  return "opened";
}

function shouldAdvanceStage(current: string, newStage: string): boolean {
  const cp = STAGE_PRECEDENCE[current] ?? 0;
  const np = STAGE_PRECEDENCE[newStage] ?? 0;
  return np > cp;
}

interface TrackPayload {
  funnelType: string;
  stateSlug?: string;
  visitorId?: string;
  leadEmail?: string;
  leadName?: string;
  agencyName?: string;
  agencyId?: string;
  eventName: string;
  eventStage?: string;
  pagePath?: string;
  referrer?: string;
  submissionType?: string;
  submissionId?: string;
  selectedOffer?: string;
  selectedUpsell?: string;
  checkoutSessionId?: string;
  paymentIntentId?: string;
  paymentStatus?: string;
  amountTotal?: number;
  currency?: string;
  metadata?: Record<string, unknown>;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
  const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    return jsonResponse({ error: "Missing server config" }, 500);
  }

  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  let body: TrackPayload;
  try {
    body = await req.json();
  } catch {
    return jsonResponse({ error: "Invalid JSON body" }, 400);
  }

  const {
    funnelType,
    stateSlug,
    visitorId,
    leadEmail,
    leadName,
    agencyName,
    agencyId,
    eventName,
    eventStage,
    pagePath,
    referrer,
    submissionType,
    submissionId,
    selectedOffer,
    selectedUpsell,
    checkoutSessionId,
    paymentIntentId,
    paymentStatus,
    amountTotal,
    currency,
    metadata = {},
  } = body;

  if (!funnelType || !eventName) {
    return jsonResponse({ error: "funnelType and eventName are required" }, 400);
  }

  const normalizedEmail = leadEmail?.toLowerCase().trim() || null;
  const leadKey = normalizedEmail
    ? `${normalizedEmail}|${funnelType}|${stateSlug ?? ""}`
    : null;

  // ── Find or create funnel_session ────────────────────────────────────────
  let sessionId: string | null = null;
  let currentStage = "opened";

  // 1) match by checkout_session_id
  if (checkoutSessionId) {
    const { data } = await supabase
      .from("funnel_sessions")
      .select("id, stage")
      .eq("checkout_session_id", checkoutSessionId)
      .maybeSingle();
    if (data) { sessionId = data.id; currentStage = data.stage ?? "opened"; }
  }

  // 2) match by lead_key
  if (!sessionId && leadKey) {
    const { data } = await supabase
      .from("funnel_sessions")
      .select("id, stage")
      .eq("lead_key", leadKey)
      .maybeSingle();
    if (data) { sessionId = data.id; currentStage = data.stage ?? "opened"; }
  }

  // 3) match by visitor_id + funnel_type + state_slug
  if (!sessionId && visitorId) {
    const q = supabase
      .from("funnel_sessions")
      .select("id, stage")
      .eq("visitor_id", visitorId)
      .eq("funnel_type", funnelType);
    const q2 = stateSlug ? q.eq("state_slug", stateSlug) : q.is("state_slug", null);
    const { data } = await q2.order("created_at", { ascending: false }).limit(1).maybeSingle();
    if (data) { sessionId = data.id; currentStage = data.stage ?? "opened"; }
  }

  // 4) create new session
  if (!sessionId) {
    const newSession: Record<string, unknown> = {
      funnel_type: funnelType,
      state_slug: stateSlug ?? null,
      visitor_id: visitorId ?? null,
      lead_email: normalizedEmail,
      lead_name: leadName ?? null,
      agency_name: agencyName ?? null,
      agency_id: agencyId ?? null,
      lead_key: leadKey,
      stage: "opened",
    };
    if (submissionType) newSession.submission_type = submissionType;
    if (submissionId) newSession.submission_id = submissionId;
    if (checkoutSessionId) newSession.checkout_session_id = checkoutSessionId;
    if (selectedOffer) newSession.selected_offer = selectedOffer;
    if (selectedUpsell) newSession.selected_upsell = selectedUpsell;
    if (paymentStatus) newSession.payment_status = paymentStatus;
    if (amountTotal !== undefined) newSession.amount_total = amountTotal;
    if (currency) newSession.currency = currency;
    if (paymentIntentId) newSession.payment_intent_id = paymentIntentId;

    const { data, error } = await supabase
      .from("funnel_sessions")
      .insert(newSession)
      .select("id")
      .maybeSingle();

    if (error || !data) {
      console.error("[funnel-track] Session create error:", error);
      return jsonResponse({ error: error?.message ?? "Failed to create session" }, 500);
    }
    sessionId = data.id;
  }

  // ── Extract visitor IP and location from request headers ─────────────────
  const visitor = extractVisitorContext(req);

  // ── Insert funnel event ───────────────────────────────────────────────────
  const eventRow: Record<string, unknown> = {
    session_id: sessionId,
    funnel_type: funnelType,
    state_slug: stateSlug ?? null,
    visitor_id: visitorId ?? null,
    lead_email: normalizedEmail,
    event_name: eventName,
    event_stage: eventStage ?? null,
    page_path: pagePath ?? null,
    referrer: referrer ?? null,
    metadata: {
      ...metadata,
      agencyName,
      agencyId,
      leadName,
      selectedOffer,
      selectedUpsell,
      checkoutSessionId,
      submissionType,
      submissionId,
    },
    ...visitor,
  };

  const { error: evtErr } = await supabase.from("funnel_events").insert(eventRow);
  if (evtErr) {
    console.error("[funnel-track] Event insert error:", evtErr.message, { sessionId, funnelType, eventName });
  }

  // ── Update session summary ────────────────────────────────────────────────
  const newStage = stageFromEvent(eventName, eventStage);
  const updateFields: Record<string, unknown> = {
    last_event_name: eventName,
    last_event_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  };

  if (shouldAdvanceStage(currentStage, newStage)) {
    updateFields.stage = newStage;
  }

  // Track drop-off (last known stage/path before paid)
  if (newStage !== "paid" && pagePath) {
    updateFields.dropoff_path = pagePath;
  }
  if (newStage !== "paid" && eventStage) {
    updateFields.dropoff_stage = eventStage;
  }

  // Enrich session with new data from this event
  if (normalizedEmail) updateFields.lead_email = normalizedEmail;
  if (leadName) updateFields.lead_name = leadName;
  if (agencyName) updateFields.agency_name = agencyName;
  if (agencyId) updateFields.agency_id = agencyId;
  if (submissionType) updateFields.submission_type = submissionType;
  if (submissionId) updateFields.submission_id = submissionId;
  if (checkoutSessionId) updateFields.checkout_session_id = checkoutSessionId;
  if (selectedOffer) updateFields.selected_offer = selectedOffer;
  if (selectedUpsell) updateFields.selected_upsell = selectedUpsell;
  if (paymentStatus) updateFields.payment_status = paymentStatus;
  if (amountTotal !== undefined) updateFields.amount_total = amountTotal;
  if (currency) updateFields.currency = currency;
  if (paymentIntentId) updateFields.payment_intent_id = paymentIntentId;
  if (visitorId && !leadKey) updateFields.visitor_id = visitorId;
  if (leadKey) updateFields.lead_key = leadKey;

  const { error: sessErr } = await supabase.from("funnel_sessions").update(updateFields).eq("id", sessionId);
  if (sessErr) {
    console.error("[funnel-track] Session update error:", sessErr.message, { sessionId, funnelType, eventName });
  }

  return jsonResponse({ ok: true, sessionId, stage: updateFields.stage ?? currentStage });
});

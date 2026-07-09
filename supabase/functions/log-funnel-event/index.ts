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

const STEP_LABEL: Record<number, string> = {
  10:  'Your-agency profile — Viewed landing page',
  20:  'Your-agency profile — Submitted search',
  25:  'Your-agency profile — Clicked profile card',
  30:  'Your-agency profile — Viewed agency profile',
  40:  'Your-agency ledger — Clicked "Start receiving these clients"',
  50:  'Owner preview — Viewed state page',
  60:  'Owner preview — Clicked "Scroll to my listing"',
  70:  'Owner preview — Opened availability form',
  80:  'Owner preview — Opened availability modal',
  90:  'Owner preview — Submitted availability form',
  100: 'Owner preview — Viewed availability result',
  110: 'Owner preview — Clicked "See missed clients"',
  120: 'Owner preview — Viewed missed clients page',
  130: 'Owner preview — Clicked "activate your listing now"',
  140: 'Activation offer — Viewed offer page',
  150: 'Checkout — Opened Stripe checkout',
  160: 'Sale — Listing activated',
};

const REQUEST_COMPARE_STEP_LABEL: Record<number, string> = {
  10: 'Request compare — Viewed page',
  20: 'Request compare — Loaded comparison',
  30: 'Request compare — Saw client request',
  40: 'Request compare — Saw competitor outcome',
  50: 'Request compare — Clicked activate listing',
  60: 'Request compare — Chose stay inactive',
};

function getStepLabel(funnel_name: string, step_number: number, event_name: string): string {
  if (funnel_name === 'request_compare') {
    return REQUEST_COMPARE_STEP_LABEL[step_number] ?? event_name;
  }
  return STEP_LABEL[step_number] ?? event_name;
}

interface EventPayload {
  fsid: string;
  funnel_name: string;
  event_name: string;
  step_number: number;
  page_path?: string;
  agency_id?: string;
  agency_slug?: string;
  state_slug?: string;
  is_demo?: boolean;
  metadata?: Record<string, unknown>;
  lead_email?: string;
  lead_name?: string;
  agency_name?: string;
  checkout_session_id?: string;
  entry_path?: string;
  purchased_product?: string;
  purchased_amount?: number;
  upsell_taken?: boolean;
  open_instance_id?: string;
  // Confidence classification fields (all optional — enriched by trackingTransport)
  intent_level?: string;
  confidence_score?: number;
  confidence_reasoning?: Record<string, unknown>;
  scanner_signals?: Record<string, unknown>;
  human_signals?: Record<string, unknown>;
  timing_signals?: Record<string, unknown>;
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

  const visitor = extractVisitorContext(req);

  let body: EventPayload;
  try {
    body = await req.json();
  } catch {
    return jsonResponse({ error: "Invalid JSON" }, 400);
  }

  const {
    fsid,
    funnel_name,
    event_name,
    step_number,
    page_path,
    agency_id,
    agency_slug,
    state_slug,
    is_demo = false,
    metadata = {},
    lead_email,
    lead_name,
    agency_name,
    checkout_session_id,
    entry_path,
    purchased_product,
    purchased_amount,
    upsell_taken,
    open_instance_id,
    intent_level,
    confidence_score,
    confidence_reasoning,
    scanner_signals,
    human_signals,
    timing_signals,
  } = body;

  if (!fsid || !funnel_name || !event_name || step_number == null) {
    return jsonResponse({ error: "fsid, funnel_name, event_name, step_number are required" }, 400);
  }

  const normalizedEmail = lead_email?.toLowerCase().trim() || null;

  try {
    // Find or create funnel session by fsid
    let sessionId: string | null = null;
    let currentStep = 0;

    const { data: existingSession } = await supabase
      .from("funnel_sessions")
      .select("id, step_number, is_demo, intent_level, confidence_score, is_scanner_flagged")
      .eq("fsid", fsid)
      .maybeSingle();

    let currentConfidenceScore: number | null = null;
    let currentIntentLevel: string | null = null;
    let currentScannerFlagged: boolean = false;

    if (existingSession) {
      sessionId = existingSession.id;
      currentStep = existingSession.step_number ?? 0;
      currentConfidenceScore = typeof existingSession.confidence_score === 'number' ? existingSession.confidence_score : null;
      currentIntentLevel = existingSession.intent_level ?? null;
      currentScannerFlagged = existingSession.is_scanner_flagged === true;
    } else {
      const insertRow: Record<string, unknown> = {
        fsid,
        funnel_type: funnel_name,
        funnel_name,
        state_slug: state_slug ?? null,
        agency_id: agency_id ?? null,
        agency_slug: agency_slug ?? null,
        agency_name: agency_name ?? null,
        lead_email: normalizedEmail,
        lead_name: lead_name ?? null,
        step_number: 0,
        is_demo: is_demo ?? false,
        stage: "opened",
        entry_path: entry_path ?? null,
      };
      if (checkout_session_id) insertRow.checkout_session_id = checkout_session_id;

      const { data: newSession, error: insertErr } = await supabase
        .from("funnel_sessions")
        .insert(insertRow)
        .select("id")
        .maybeSingle();

      if (insertErr || !newSession) {
        console.error("[log-funnel-event] Session create error:", insertErr);
        return jsonResponse({ error: insertErr?.message ?? "Failed to create session" }, 500);
      }
      sessionId = newSession.id;
    }

    const enrichedMetadata = {
      ...metadata,
      agency_id,
      agency_name,
      lead_name,
      checkout_session_id,
      ...(open_instance_id ? { open_instance_id } : {}),
    };

    let isDuplicate = false;

    if (open_instance_id) {
      const { data: dup } = await supabase
        .from("funnel_events")
        .select("id")
        .eq("fsid", fsid)
        .eq("event_name", event_name)
        .filter("metadata->>open_instance_id", "eq", open_instance_id)
        .maybeSingle();
      if (dup) isDuplicate = true;
    } else {
      const windowStart = new Date(Date.now() - 60_000).toISOString();
      const { data: dup } = await supabase
        .from("funnel_events")
        .select("id")
        .eq("fsid", fsid)
        .eq("event_name", event_name)
        .eq("step_number", step_number)
        .gte("created_at", windowStart)
        .maybeSingle();
      if (dup) isDuplicate = true;
    }

    if (!isDuplicate) {
      const { error: evtInsertErr } = await supabase.from("funnel_events").insert({
        session_id: sessionId,
        fsid,
        funnel_type: funnel_name,
        funnel_name,
        state_slug: state_slug ?? null,
        lead_email: normalizedEmail,
        event_name,
        step_number,
        page_path: page_path ?? null,
        is_demo,
        agency_id: agency_id ?? null,
        metadata: enrichedMetadata,
        ...(intent_level != null ? { intent_level } : {}),
        ...(confidence_score != null ? { confidence_score } : {}),
        ...(confidence_reasoning != null ? { confidence_reasoning } : {}),
        ...(scanner_signals != null ? { scanner_signals } : {}),
        ...(human_signals != null ? { human_signals } : {}),
        ...(timing_signals != null ? { timing_signals } : {}),
        ...visitor,
      });
      if (evtInsertErr) {
        console.error("[log-funnel-event] Event insert error:", evtInsertErr.message, { fsid, event_name, step_number });
      }
    }

    // Update session rollup (only advance step, never go back)
    const updateFields: Record<string, unknown> = {
      last_event_name: event_name,
      last_event_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
      drop_off_event: event_name,
    };

    if (step_number > currentStep) {
      updateFields.step_number = step_number;
    }

    if (is_demo) updateFields.is_demo = true;
    if (normalizedEmail) updateFields.lead_email = normalizedEmail;
    if (lead_name) updateFields.lead_name = lead_name;
    if (agency_name) updateFields.agency_name = agency_name;
    if (agency_id) updateFields.agency_id = agency_id;
    if (agency_slug) updateFields.agency_slug = agency_slug;
    if (state_slug) updateFields.state_slug = state_slug;
    if (checkout_session_id) updateFields.checkout_session_id = checkout_session_id;
    if (entry_path) updateFields.entry_path = entry_path;

    if (page_path) updateFields.dropoff_path = page_path;

    // Confidence fields — session classification is upgrade-only (never downgrade).
    // Priority order: scanner < possible_human < verified_human
    const LEVEL_RANK: Record<string, number> = { scanner: 0, possible_human: 1, verified_human: 2 };
    const incomingRank = intent_level != null ? (LEVEL_RANK[intent_level] ?? -1) : -1;
    const existingRank = currentIntentLevel != null ? (LEVEL_RANK[currentIntentLevel] ?? -1) : -1;

    if (intent_level != null && incomingRank > existingRank) {
      updateFields.intent_level = intent_level;
    }
    // Only upgrade confidence_score — take the max seen across all events for this session
    if (confidence_score != null) {
      if (currentConfidenceScore === null || confidence_score > currentConfidenceScore) {
        updateFields.confidence_score = confidence_score;
      }
    }
    // Always store the latest reasoning for debuggability
    if (confidence_reasoning != null) updateFields.confidence_reasoning = confidence_reasoning;

    // Scanner flag logic:
    // - Set to true only if session is not already verified_human
    // - Clear (set false) if this event upgrades session to verified_human
    if (intent_level === 'verified_human') {
      // A real human proved themselves — lift any prior scanner flag
      updateFields.is_scanner_flagged = false;
    } else if (intent_level === 'scanner' && currentIntentLevel !== 'verified_human') {
      const PAGE_VIEW_EVENTS = [
        'activation_page_viewed', 'replay_opened', 'owner_preview_state_page_viewed',
        'your_agency_landing_page_viewed', 'your_agency_profile_page_viewed',
        'listing_activation_offer_page_viewed', 'request_compare_page_viewed',
      ];
      if (PAGE_VIEW_EVENTS.includes(event_name) && !currentScannerFlagged) {
        updateFields.is_scanner_flagged = true;
      }
    }
    // Store active_time_ms and interaction_count from human_signals
    if (human_signals && typeof human_signals === 'object') {
      const hs = human_signals as Record<string, unknown>;
      if (typeof hs.active_visible_ms === 'number') updateFields.active_time_ms = hs.active_visible_ms;
      const clicks = typeof hs.manual_click_count === 'number' ? hs.manual_click_count : 0;
      const taps = typeof hs.tap_count === 'number' ? hs.tap_count : 0;
      updateFields.interaction_count = clicks + taps;
    }
    if (timing_signals && typeof timing_signals === 'object') {
      const ts = timing_signals as Record<string, unknown>;
      if (typeof ts.thinking_time_first_input_to_cta_ms === 'number') {
        updateFields.thinking_time_ms = ts.thinking_time_first_input_to_cta_ms;
      }
    }

    const stepLabel = getStepLabel(funnel_name, step_number, event_name);
    updateFields.drop_off_step_name = stepLabel;
    updateFields.drop_off_step_number = step_number;

    if (step_number >= 160) {
      updateFields.stage = "paid";
      updateFields.payment_status = "paid";
      if (purchased_product) updateFields.purchased_product = purchased_product;
      if (purchased_amount != null) updateFields.purchased_amount = purchased_amount;
      if (upsell_taken != null) updateFields.upsell_taken = upsell_taken;
    } else if (step_number >= 150) {
      updateFields.stage = "checkout_started";
    } else if (step_number >= 140) {
      updateFields.stage = "offer_viewed";
    } else if (step_number >= 90) {
      updateFields.stage = "submitted";
    }

    const { error: sessUpdateErr } = await supabase.from("funnel_sessions").update(updateFields).eq("id", sessionId);
    if (sessUpdateErr) {
      console.error("[log-funnel-event] Session update error:", sessUpdateErr.message, { sessionId, fsid, event_name });
    }

    return jsonResponse({
      ok: true,
      sessionId,
      step_label: getStepLabel(funnel_name, step_number, event_name),
    });
  } catch (err) {
    console.error("[log-funnel-event] Error:", err);
    return jsonResponse({ error: err instanceof Error ? err.message : "Unknown error" }, 500);
  }
});

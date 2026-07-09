import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { sendEmail } from "../_shared/emailClient.ts";
import {
  buildAdminActivityEmail,
  buildAgencyAdminUrl,
  resolveAdminContext,
  stateNameFromSlug,
} from "../_shared/adminEmailContext.ts";
import { extractVisitorContext } from "../_shared/visitorContext.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function escHtml(s: unknown): string {
  return String(s ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

const VALID_EVENTS = [
  "replay_opened",
  "replay_scene_view",
  "replay_auto_continue_started",
  "replay_auto_continue_completed",
  "replay_cta_click",
  "replay_completed",
  "replay_abandoned",
] as const;

type ReplayEventType = typeof VALID_EVENTS[number];

interface ReplayPayload {
  event_type: ReplayEventType;
  replay_session_id: string;
  agency_slug: string;
  agency_name: string;
  agency_id?: string | null;
  state_slug?: string | null;
  state_name?: string | null;
  visitor_id?: string | null;
  page_path?: string | null;
  referrer?: string | null;
  timestamp?: string | null;
  scene_name?: string | null;
  scene_index?: number | null;
  click_type?: "manual" | "auto" | null;
  seconds_in_replay?: number | null;
  last_scene_seen?: string | null;
  highest_scene_index_seen?: number | null;
  scenes_viewed?: number | null;
  cta_seen?: boolean | null;
  cta_clicked?: boolean | null;
  auto_continue_started?: boolean | null;
  funnel_type?: string | null;
  metadata?: Record<string, unknown>;
  // Confidence classification fields (enriched by trackingTransport on the client)
  intent_level?: string | null;
  confidence_score?: number | null;
  confidence_reasoning?: Record<string, unknown> | null;
  scanner_signals?: Record<string, unknown> | null;
  human_signals?: Record<string, unknown> | null;
  timing_signals?: Record<string, unknown> | null;
}

type SupabaseClientLike = ReturnType<typeof createClient>;

const REPLAY_EVENT_META: Record<ReplayEventType, { eventTitle: string; eventSubtitle: string; accentColor: string; badgeLabel: string; badgeBg: string; badgeColor: string; badgeBorder: string }> = {
  replay_opened: {
    eventTitle: "REQUEST REPLAY OPENED",
    eventSubtitle: "User opened the request replay page",
    accentColor: "#2563eb",
    badgeLabel: "Replay Entry",
    badgeBg: "#eff6ff",
    badgeColor: "#1d4ed8",
    badgeBorder: "#bfdbfe",
  },
  replay_scene_view: {
    eventTitle: "REQUEST REPLAY SCENE",
    eventSubtitle: "User viewed a replay scene",
    accentColor: "#2563eb",
    badgeLabel: "Replay Scene",
    badgeBg: "#eff6ff",
    badgeColor: "#1d4ed8",
    badgeBorder: "#bfdbfe",
  },
  replay_auto_continue_started: {
    eventTitle: "REPLAY AUTO-CONTINUE",
    eventSubtitle: "Auto-continue started during replay",
    accentColor: "#2563eb",
    badgeLabel: "Auto Continue",
    badgeBg: "#eff6ff",
    badgeColor: "#1d4ed8",
    badgeBorder: "#bfdbfe",
  },
  replay_auto_continue_completed: {
    eventTitle: "REPLAY AUTO-CONTINUE DONE",
    eventSubtitle: "Auto-continue completed during replay",
    accentColor: "#2563eb",
    badgeLabel: "Auto Continue",
    badgeBg: "#eff6ff",
    badgeColor: "#1d4ed8",
    badgeBorder: "#bfdbfe",
  },
  replay_cta_click: {
    eventTitle: "REQUEST REPLAY CTA CLICKED",
    eventSubtitle: "User clicked the activation CTA during replay",
    accentColor: "#16a34a",
    badgeLabel: "CTA Clicked",
    badgeBg: "#f0fdf4",
    badgeColor: "#166534",
    badgeBorder: "#bbf7d0",
  },
  replay_completed: {
    eventTitle: "REQUEST REPLAY COMPLETED",
    eventSubtitle: "User completed the full request replay sequence",
    accentColor: "#15803d",
    badgeLabel: "High Intent",
    badgeBg: "#dcfce7",
    badgeColor: "#14532d",
    badgeBorder: "#86efac",
  },
  replay_abandoned: {
    eventTitle: "REQUEST REPLAY ABANDONED",
    eventSubtitle: "User left the replay before completing",
    accentColor: "#dc2626",
    badgeLabel: "Abandoned",
    badgeBg: "#fef2f2",
    badgeColor: "#991b1b",
    badgeBorder: "#fecaca",
  },
};

const LISTING_TYPE_LABEL: Record<string, string> = {
  standard: "Standard Activation",
  activation: "Standard Activation",
  other_listing: "Standard Activation",
  top25: "Top 25 Listing",
  top25_claim_bundle: "Top 25 Claim Bundle",
  spotlight: "Spotlight Placement",
};

async function resolveListingType(
  supabase: SupabaseClientLike,
  agency_id: string | null,
  agency_slug: string | null,
  state_slug: string | null,
): Promise<string | null> {
  try {
    if (state_slug) {
      const q = supabase
        .from("top25_slots")
        .select("listing_type, rank, is_paid")
        .eq("state_slug", state_slug);
      if (agency_id) q.eq("agency_id", agency_id);
      else if (agency_slug) q.eq("agency_slug", agency_slug);
      else return null;
      const { data } = await q.maybeSingle();
      if (data?.listing_type) return data.listing_type;
      if (data?.rank != null) return data.is_paid ? "top25" : "standard";
    }
    if (agency_slug) {
      const { data: oa } = await supabase
        .from("other_agencies")
        .select("id")
        .eq("slug", agency_slug)
        .eq("is_active", true)
        .maybeSingle();
      if (oa) return "other_listing";
    }
  } catch (_) { /* non-fatal */ }
  return null;
}

async function checkProgression(
  supabase: SupabaseClientLike,
  agency_id: string | null,
  agency_slug: string | null,
): Promise<{ activationReached: boolean; checkoutOpened: boolean; activationAt: string | null; checkoutAt: string | null }> {
  let activationReached = false;
  let checkoutOpened = false;
  let activationAt: string | null = null;
  let checkoutAt: string | null = null;
  try {
    const since = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString();
    const q = supabase
      .from("email_notification_logs")
      .select("notification_type, created_at")
      .in("notification_type", ["activation_page_viewed", "stripe_checkout_opened"])
      .gte("created_at", since)
      .order("created_at", { ascending: false })
      .limit(20);
    if (agency_id) q.filter("payload->>agency_id", "eq", agency_id);
    else if (agency_slug) q.filter("payload->>agency_slug", "eq", agency_slug);
    else return { activationReached, checkoutOpened, activationAt, checkoutAt };
    const { data } = await q;
    if (Array.isArray(data)) {
      for (const row of data) {
        if (row.notification_type === "activation_page_viewed" && !activationReached) {
          activationReached = true;
          activationAt = row.created_at;
        } else if (row.notification_type === "stripe_checkout_opened" && !checkoutOpened) {
          checkoutOpened = true;
          checkoutAt = row.created_at;
        }
      }
    }
  } catch (_) { /* non-fatal */ }
  return { activationReached, checkoutOpened, activationAt, checkoutAt };
}

async function countReplayCtaClicks(
  supabase: SupabaseClientLike,
  agency_id: string | null,
  agency_slug: string | null,
): Promise<number> {
  try {
    const since = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString();
    const q = supabase
      .from("funnel_events")
      .select("id", { count: "exact", head: true })
      .eq("funnel_name", "request_replay")
      .eq("event_name", "replay_cta_click")
      .gte("created_at", since);
    if (agency_id) {
      // funnel_events doesn't directly carry agency_id; join via session
      const { data: sessions } = await supabase
        .from("funnel_sessions")
        .select("id")
        .eq("funnel_name", "request_replay")
        .eq("agency_id", agency_id);
      const ids = (sessions ?? []).map((s: { id: string }) => s.id);
      if (ids.length === 0) return 0;
      const { count } = await supabase
        .from("funnel_events")
        .select("id", { count: "exact", head: true })
        .eq("event_name", "replay_cta_click")
        .gte("created_at", since)
        .in("session_id", ids);
      return count ?? 0;
    }
    if (agency_slug) {
      const { data: sessions } = await supabase
        .from("funnel_sessions")
        .select("id")
        .eq("funnel_name", "request_replay")
        .eq("agency_slug", agency_slug);
      const ids = (sessions ?? []).map((s: { id: string }) => s.id);
      if (ids.length === 0) return 0;
      const { count } = await supabase
        .from("funnel_events")
        .select("id", { count: "exact", head: true })
        .eq("event_name", "replay_cta_click")
        .gte("created_at", since)
        .in("session_id", ids);
      return count ?? 0;
    }
    const { count } = await q;
    return count ?? 0;
  } catch (_) {
    return 0;
  }
}

function buildIntentSignal(
  eventType: ReplayEventType,
  replayOpens: number,
  ctaClicks: number,
  totalFunnelSessions: number,
  activationReached: boolean,
  checkoutOpened: boolean,
): { headline: string; tone: "high" | "medium" | "low" } {
  if (checkoutOpened) {
    return { headline: "User has opened checkout — high-intent revisit of replay flow", tone: "high" };
  }
  if (eventType === "replay_completed") {
    return { headline: "User completed full replay sequence — strong signal", tone: "high" };
  }
  if (eventType === "replay_cta_click" || ctaClicks > 0) {
    return { headline: "User clicked the replay CTA — actively exploring client flow", tone: "high" };
  }
  if (replayOpens >= 2) {
    return { headline: "User revisited replay page (multiple opens) — repeat interest signal", tone: "medium" };
  }
  if (totalFunnelSessions >= 3 && !activationReached) {
    return { headline: "User has multiple sessions but has not reached activation yet", tone: "medium" };
  }
  if (activationReached && !checkoutOpened) {
    return { headline: "User reached activation page but has not opened checkout — replay revisit", tone: "medium" };
  }
  return { headline: "User is actively exploring client flow", tone: "low" };
}

async function buildReplayEmailHtml(
  supabase: SupabaseClientLike,
  payload: ReplayPayload,
  eventType: ReplayEventType,
  replayOpensCount: number,
): Promise<string> {
  const meta = REPLAY_EVENT_META[eventType] ?? REPLAY_EVENT_META.replay_opened;
  const resolvedStateName = payload.state_name || stateNameFromSlug(payload.state_slug);
  const displayAgency = payload.agency_name?.trim() || payload.agency_slug?.trim() || "Unknown Agency";

  const replayParams = new URLSearchParams();
  if (payload.agency_name) replayParams.set("agencyName", payload.agency_name);
  if (resolvedStateName) replayParams.set("stateName", resolvedStateName);
  if (payload.state_slug) replayParams.set("stateSlug", payload.state_slug);
  const replayParamStr = replayParams.toString();
  const replayUrl = `https://www.gappsy.com/request-replay/${payload.agency_slug}${replayParamStr ? `?${replayParamStr}` : ""}`;
  const profileUrl = `https://www.gappsy.com/your-agency/${payload.agency_slug}`;
  const adminUrl = buildAgencyAdminUrl({ agency_id: payload.agency_id, agency_slug: payload.agency_slug });

  const ctx = await resolveAdminContext(supabase, {
    agency_id: payload.agency_id ?? null,
    agency_slug: payload.agency_slug ?? null,
    agency_name: displayAgency,
    state_slug: payload.state_slug ?? null,
    days: 30,
  });

  const listingTypeRaw = await resolveListingType(
    supabase,
    payload.agency_id ?? null,
    payload.agency_slug ?? null,
    payload.state_slug ?? null,
  );
  const listingTypeLabel = listingTypeRaw
    ? (LISTING_TYPE_LABEL[listingTypeRaw] ?? listingTypeRaw)
    : null;

  const progression = await checkProgression(
    supabase,
    payload.agency_id ?? null,
    payload.agency_slug ?? null,
  );

  const ctaClicks = await countReplayCtaClicks(
    supabase,
    payload.agency_id ?? null,
    payload.agency_slug ?? null,
  );

  const intent = buildIntentSignal(
    eventType,
    replayOpensCount,
    ctaClicks,
    ctx.totalFunnelSessions,
    progression.activationReached,
    progression.checkoutOpened,
  );

  const intentBg = intent.tone === "high" ? "#f0fdf4" : intent.tone === "medium" ? "#fffbeb" : "#f9fafb";
  const intentBorder = intent.tone === "high" ? "#16a34a" : intent.tone === "medium" ? "#d97706" : "#6b7280";
  const intentColor = intent.tone === "high" ? "#166534" : intent.tone === "medium" ? "#92400e" : "#374151";

  const yes = `<span style="color:#16a34a;font-weight:700">Yes</span>`;
  const no = `<span style="color:#dc2626;font-weight:700">No</span>`;

  const extraRows: Array<{ label: string; value: string; highlight?: boolean }> = [];

  if (listingTypeLabel) {
    extraRows.push({
      label: "Listing Type",
      value: `<span style="color:#0369a1;font-weight:700">${escHtml(listingTypeLabel)}</span>`,
      highlight: true,
    });
  }

  if (payload.agency_id) {
    extraRows.push({
      label: "Agency ID",
      value: `<code style="font-size:12px">${escHtml(payload.agency_id)}</code>`,
    });
  }

  extraRows.push({
    label: "Replay URL",
    value: `<a href="${escHtml(replayUrl)}" style="color:#2563eb;text-decoration:none;font-weight:500;word-break:break-all">${escHtml(replayUrl)}</a>`,
  });

  extraRows.push({
    label: "Replay Opens (all-time)",
    value: `<strong>${replayOpensCount}</strong>`,
  });

  if (ctaClicks > 0) {
    extraRows.push({
      label: "Replay CTA Clicks (30d)",
      value: `<strong style="color:#16a34a">${ctaClicks}</strong>`,
    });
  }

  if (eventType === "replay_cta_click" && payload.click_type) {
    extraRows.push({
      label: "Click Type",
      value: escHtml(payload.click_type),
    });
  }

  if (payload.seconds_in_replay != null) {
    extraRows.push({
      label: "Time in Replay",
      value: `${Math.round(payload.seconds_in_replay)}s`,
    });
  }

  if (payload.scenes_viewed != null) {
    extraRows.push({
      label: "Scenes Viewed",
      value: String(payload.scenes_viewed),
    });
  }

  // Funnel context
  const entrySource = payload.referrer
    ? (/smartlink/i.test(payload.referrer) ? "Smartlink" :
       /\/wp-admin/i.test(payload.referrer) ? "Admin link" :
       /gappsy\.com/i.test(payload.referrer) ? "Internal" :
       "External referrer")
    : "Direct";

  extraRows.push({
    label: "Source",
    value: "Replay flow",
  });

  extraRows.push({
    label: "Entry Source",
    value: escHtml(entrySource),
  });

  if (payload.last_scene_seen) {
    extraRows.push({
      label: "Previous Step",
      value: escHtml(payload.last_scene_seen),
    });
  }

  // Progression hint
  extraRows.push({
    label: "Activation Reached?",
    value: progression.activationReached ? yes : no,
    highlight: !progression.activationReached,
  });

  extraRows.push({
    label: "Checkout Opened?",
    value: progression.checkoutOpened ? yes : no,
    highlight: !progression.checkoutOpened,
  });

  // Insight block
  extraRows.push({
    label: "Intent Signal",
    value: `<div style="background:${intentBg};border-left:3px solid ${intentBorder};padding:10px 12px;border-radius:6px;color:${intentColor};font-size:13px;font-weight:600;line-height:1.5">${escHtml(intent.headline)}</div>`,
    highlight: true,
  });

  extraRows.push({
    label: "Session ID",
    value: `<code style="font-size:11px;color:#6b7280">${escHtml(payload.replay_session_id)}</code>`,
  });

  return buildAdminActivityEmail({
    eventTitle: meta.eventTitle,
    eventSubtitle: meta.eventSubtitle,
    accentColor: meta.accentColor,
    agencyName: displayAgency,
    agencySlug: payload.agency_slug,
    profileUrl,
    searchQuery: null,
    source: "replay_flow",
    importedEmail: null,
    importedEmails: [],
    adminUrl,
    context: ctx,
    extraRows,
    primaryCta: { label: "Open Admin", url: adminUrl },
    secondaryCtas: [
      { label: "View Replay Page", url: replayUrl },
      { label: "Open Agency Profile", url: profileUrl },
    ],
    headerBadges: [
      { label: meta.badgeLabel, bg: meta.badgeBg, color: meta.badgeColor, border: meta.badgeBorder },
      ...(listingTypeLabel ? [{ label: listingTypeLabel, bg: "#e0f2fe", color: "#075985", border: "#bae6fd" }] : []),
    ],
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return json({ error: "Method not allowed" }, 405);
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const supabaseKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, supabaseKey);

  console.log("[replay-funnel-track] Request received");

  try {
    const payload: ReplayPayload = await req.json();

    const {
      event_type,
      replay_session_id,
      agency_slug,
      agency_name,
      state_slug,
      state_name,
      visitor_id,
      page_path,
      referrer,
      timestamp,
      scene_name,
      scene_index,
      click_type,
      seconds_in_replay,
      last_scene_seen,
      highest_scene_index_seen,
      scenes_viewed,
      cta_seen,
      cta_clicked,
      auto_continue_started,
      metadata,
    } = payload;

    let agency_id = payload.agency_id || null;

    // Confidence fields — extracted immediately so they are available for all
    // subsequent session/event logic including the upgrade-only confidence block.
    const intent_level = payload.intent_level ?? null;
    const confidence_score = payload.confidence_score ?? null;
    const confidence_reasoning = payload.confidence_reasoning ?? null;
    const scanner_signals = payload.scanner_signals ?? null;
    const human_signals = payload.human_signals ?? null;
    const timing_signals = payload.timing_signals ?? null;

    console.log("[replay-funnel-track] Payload", {
      event_type,
      replay_session_id,
      agency_slug,
      agency_name,
      state_slug,
    });

    if (!event_type || !replay_session_id || !agency_slug) {
      return json({
        ok: false,
        stage: "validation",
        error: "Missing required fields: event_type, replay_session_id, agency_slug",
      }, 400);
    }

    if (!VALID_EVENTS.includes(event_type as ReplayEventType)) {
      return json({
        ok: false,
        stage: "validation",
        error: `Invalid event_type: ${event_type}`,
      }, 400);
    }

    // ── 1. Resolve agency_id from slug if not provided ────────────────────────
    if (!agency_id && agency_slug) {
      const { data: t25 } = await supabase
        .from("top25_slots")
        .select("agency_id")
        .eq("agency_slug", agency_slug)
        .not("agency_id", "is", null)
        .limit(1)
        .maybeSingle();

      if (t25?.agency_id) {
        agency_id = t25.agency_id;
      } else {
        const { data: oa } = await supabase
          .from("other_agencies")
          .select("agency_id")
          .eq("slug", agency_slug)
          .not("agency_id", "is", null)
          .limit(1)
          .maybeSingle();

        if (oa?.agency_id) {
          agency_id = oa.agency_id;
        }
      }

      if (agency_id) {
        console.log(`[replay-funnel-track] Resolved agency_id=${agency_id} from slug`);
      }
    }

    // ── 2. Get or create funnel_session (race-safe INSERT-first) ──────────────
    // Problem with the old SELECT-then-INSERT pattern:
    //   Two concurrent requests both SELECT → both get null → both INSERT
    //   → two sessions with different IDs but same fsid → two emails.
    //
    // New pattern: INSERT first. If 23505 unique violation fires (the unique
    // index on funnel_sessions.fsid guarantees at most one session per
    // replay_session_id), look up the winning row. Both concurrent requests
    // end up with the SAME canonical session_id.
    let sessionId: string | null = null;
    let sessionWasNew = false;

    const { data: insertedSession, error: sessionInsertError } = await supabase
      .from("funnel_sessions")
      .insert({
        funnel_type: "request_replay",
        funnel_name: "request_replay",
        fsid: replay_session_id,
        agency_id: agency_id || null,
        agency_name: agency_name || null,
        state_slug: state_slug || null,
        visitor_id: visitor_id || null,
        stage: "opened",
        last_event_name: event_type,
        last_event_at: new Date().toISOString(),
        is_demo: false,
      })
      .select("id")
      .single();

    if (sessionInsertError) {
      if (sessionInsertError.code === "23505") {
        // Race: unique index on fsid fired — another request created the session first.
        // Look up the canonical winning row.
        const { data: racedSession } = await supabase
          .from("funnel_sessions")
          .select("id")
          .eq("fsid", replay_session_id)
          .eq("funnel_name", "request_replay")
          .single();
        sessionId = racedSession?.id ?? null;
        console.log(`[replay-funnel-track] Race-safe session resolved (23505): ${sessionId}`);
      } else {
        console.error("[replay-funnel-track] Session create failed:", sessionInsertError);
      }
    } else {
      sessionId = insertedSession?.id ?? null;
      sessionWasNew = true;
      console.log(`[replay-funnel-track] Created new session: ${sessionId}`);
    }

    // Update last-event fields on pre-existing sessions only
    if (sessionId && !sessionWasNew) {
      await supabase
        .from("funnel_sessions")
        .update({
          last_event_name: event_type,
          last_event_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
        })
        .eq("id", sessionId);
    }

    // ── Upgrade-only session confidence (mirrors log-funnel-event logic) ─────
    // Session classification only advances, never downgrades.
    // verified_human clears any prior scanner flag.
    if (sessionId && intent_level != null) {
      const { data: existingConf } = await supabase
        .from("funnel_sessions")
        .select("intent_level, confidence_score, is_scanner_flagged")
        .eq("id", sessionId)
        .maybeSingle();

      const LEVEL_RANK: Record<string, number> = { scanner: 0, possible_human: 1, verified_human: 2 };
      const incomingRank = LEVEL_RANK[intent_level] ?? -1;
      const existingRank = existingConf?.intent_level != null ? (LEVEL_RANK[existingConf.intent_level] ?? -1) : -1;
      const existingScore: number | null = typeof existingConf?.confidence_score === "number" ? existingConf.confidence_score : null;
      const currentScannerFlagged: boolean = existingConf?.is_scanner_flagged === true;

      const confUpdate: Record<string, unknown> = {};

      if (incomingRank > existingRank) {
        confUpdate.intent_level = intent_level;
      }
      if (confidence_score != null && (existingScore === null || confidence_score > existingScore)) {
        confUpdate.confidence_score = confidence_score;
      }
      if (confidence_reasoning != null) {
        confUpdate.confidence_reasoning = confidence_reasoning;
      }

      // Scanner flag: cleared by verified_human; set only when session hasn't reached verified_human
      if (intent_level === "verified_human") {
        confUpdate.is_scanner_flagged = false;
      } else if (intent_level === "scanner" && existingConf?.intent_level !== "verified_human") {
        const REPLAY_PAGE_VIEW_EVENTS = ["replay_opened"];
        if (REPLAY_PAGE_VIEW_EVENTS.includes(event_type) && !currentScannerFlagged) {
          confUpdate.is_scanner_flagged = true;
        }
      }

      if (Object.keys(confUpdate).length > 0) {
        await supabase
          .from("funnel_sessions")
          .update(confUpdate)
          .eq("id", sessionId);
      }
    }

    // ── 2.5. Idempotency guard — once-per-session events ─────────────────────
    // Two layers of protection for replay_opened and replay_completed:
    //
    // Layer 1 (fast): check funnel_events by session_id + event_name.
    //   Works perfectly once the unique fsid constraint ensures one session.
    //
    // Layer 2 (belt-and-suspenders): check funnel_events by replay_session_id
    //   stored in JSONB metadata. Catches the legacy case where duplicate
    //   sessions already exist (created before the unique index was added).
    //   The expression index on metadata->>'replay_session_id' makes this fast.
    const ONCE_PER_SESSION_EVENTS: ReplayEventType[] = ["replay_opened", "replay_completed"];

    if (ONCE_PER_SESSION_EVENTS.includes(event_type as ReplayEventType)) {
      // Layer 1: check by canonical session_id
      if (sessionId) {
        const { data: existingBySession } = await supabase
          .from("funnel_events")
          .select("id")
          .eq("session_id", sessionId)
          .eq("event_name", event_type)
          .limit(1)
          .maybeSingle();

        if (existingBySession) {
          console.log(`[replay-funnel-track] Duplicate ${event_type} for session ${sessionId} — idempotent (layer 1)`);
          return json({ ok: true, eventId: existingBySession.id, sessionId, emailSent: false, reason: "duplicate" });
        }
      }

      // Layer 2: check by replay_session_id in event metadata
      // Handles any residual duplicate sessions from before the unique index
      const { data: existingByReplayId } = await supabase
        .from("funnel_events")
        .select("id, session_id")
        .eq("event_name", event_type)
        .eq("funnel_name", "request_replay")
        .filter("metadata->>replay_session_id", "eq", replay_session_id)
        .limit(1)
        .maybeSingle();

      if (existingByReplayId) {
        console.log(`[replay-funnel-track] Duplicate ${event_type} by replay_session_id ${replay_session_id} — idempotent (layer 2)`);
        return json({
          ok: true,
          eventId: existingByReplayId.id,
          sessionId: existingByReplayId.session_id,
          emailSent: false,
          reason: "duplicate_replay_session_id",
        });
      }
    }

    // ── 3. Build event metadata ───────────────────────────────────────────────
    const eventMetadata: Record<string, unknown> = {
      funnel_type: "request_replay",
      replay_session_id,
      ...(scene_name != null ? { scene_name } : {}),
      ...(scene_index != null ? { scene_index } : {}),
      ...(click_type != null ? { click_type } : {}),
      ...(seconds_in_replay != null ? { seconds_in_replay } : {}),
      ...(last_scene_seen != null ? { last_scene_seen } : {}),
      ...(highest_scene_index_seen != null ? { highest_scene_index_seen } : {}),
      ...(scenes_viewed != null ? { scenes_viewed } : {}),
      ...(cta_seen != null ? { cta_seen } : {}),
      ...(cta_clicked != null ? { cta_clicked } : {}),
      ...(auto_continue_started != null ? { auto_continue_started } : {}),
      ...(metadata ?? {}),
    };

    // ── 4. Extract visitor IP / location from request headers ────────────────
    const visitor = extractVisitorContext(req);

    // ── 5. Insert funnel_event (race-safe) ────────────────────────────────────
    // The partial unique index on funnel_events(session_id, event_name) for
    // replay_opened / replay_completed provides a hard DB-level guarantee.
    // If two requests both passed the idempotency check simultaneously and
    // both attempt to insert, the second insert will get a 23505 — handle
    // gracefully instead of returning a 500.
    const { data: eventRow, error: eventError } = await supabase
      .from("funnel_events")
      .insert({
        session_id: sessionId,
        funnel_type: "request_replay",
        funnel_name: "request_replay",
        event_name: event_type,
        state_slug: state_slug || null,
        visitor_id: visitor_id || null,
        page_path: page_path || null,
        referrer: referrer || null,
        metadata: eventMetadata,
        created_at: timestamp || new Date().toISOString(),
        ...(intent_level != null ? { intent_level } : {}),
        ...(confidence_score != null ? { confidence_score } : {}),
        ...(confidence_reasoning != null ? { confidence_reasoning } : {}),
        ...(scanner_signals != null ? { scanner_signals } : {}),
        ...(human_signals != null ? { human_signals } : {}),
        ...(timing_signals != null ? { timing_signals } : {}),
        ...visitor,
      })
      .select("id")
      .single();

    if (eventError) {
      if (eventError.code === "23505") {
        // DB unique constraint caught a simultaneous race — idempotent success, no email
        const { data: racedEvent } = await supabase
          .from("funnel_events")
          .select("id")
          .eq("session_id", sessionId)
          .eq("event_name", event_type)
          .maybeSingle();
        console.log(`[replay-funnel-track] DB constraint caught duplicate ${event_type} — idempotent (layer 3)`);
        return json({ ok: true, eventId: racedEvent?.id, sessionId, emailSent: false, reason: "duplicate_event_constraint" });
      }
      console.error("[replay-funnel-track] Event insert failed:", eventError);
      return json({
        ok: false,
        stage: "event_insert",
        error: eventError.message,
      }, 500);
    }

    const eventId = eventRow.id;
    console.log(`[replay-funnel-track] Event inserted: ${eventId}`);

    // ── 5. Email notifications for selected event types ───────────────────────
    const emailEventTypes: ReplayEventType[] = [
      "replay_opened",
      "replay_cta_click",
      "replay_completed",
    ];

    if (!emailEventTypes.includes(event_type as ReplayEventType)) {
      return json({ ok: true, eventId, sessionId, emailSent: false });
    }

    // Count deduped replay opens for this agency (by unique sessions, not raw events)
    let replayOpensCount = 0;
    if (agency_id) {
      const { count: openCount } = await supabase
        .from("funnel_sessions")
        .select("id", { count: "exact", head: true })
        .eq("funnel_name", "request_replay")
        .eq("agency_id", agency_id);
      replayOpensCount = openCount ?? 0;
    } else if (agency_slug) {
      const { count: openCount } = await supabase
        .from("funnel_sessions")
        .select("id", { count: "exact", head: true })
        .eq("funnel_name", "request_replay")
        .eq("agency_slug", agency_slug);
      replayOpensCount = openCount ?? 0;
    }

    // Look up notification settings
    const { data: settings, error: settingsError } = await supabase
      .from("email_notification_settings")
      .select("is_enabled, recipient_emails")
      .eq("notification_type", event_type)
      .maybeSingle();

    if (settingsError) {
      console.warn("[replay-funnel-track] Settings lookup error:", settingsError);
    }

    const settingsEnabled = settings ? settings.is_enabled !== false : true;
    const recipientEmails = (settings?.recipient_emails?.trim())
      ? settings.recipient_emails
      : "bartu@gappsy.com";
    const recipients = recipientEmails.split(",").map((e: string) => e.trim()).filter(Boolean);

    if (!settingsEnabled) {
      console.log(`[replay-funnel-track] Notifications disabled for ${event_type}`);
      return json({ ok: true, eventId, sessionId, emailSent: false, reason: "disabled" });
    }

    // ── Confidence gate — scanner and possible_human: store log only, no email ──
    // Legacy events with no intent_level (null) are allowed through.
    if (intent_level === "scanner" || intent_level === "possible_human") {
      const suppressedPayload = {
        flow: "replay",
        event_type,
        agency_id: agency_id ?? null,
        agency_slug,
        agency_name,
        state_slug: state_slug ?? null,
        replay_session_id,
        intent_level,
        confidence_score: confidence_score ?? null,
        suppressed_reason: `confidence_gate_${intent_level}`,
      };
      try {
        await supabase.from("email_notification_logs").insert({
          notification_type: event_type,
          is_test: false,
          to_emails: "",
          subject: "",
          status: "suppressed",
          provider: "smtp",
          payload: suppressedPayload,
        });
      } catch (_) { /* non-fatal */ }
      return json({ ok: true, eventId, sessionId, emailSent: false, reason: `confidence_gate_${intent_level}` });
    }

    const resolvedStateName = state_name || stateNameFromSlug(state_slug);
    const subject = event_type === "replay_opened"
      ? `Replay opened — ${agency_name}`
      : event_type === "replay_cta_click"
        ? `Replay CTA clicked — ${agency_name}`
        : `Replay completed — ${agency_name}`;

    const logPayload = {
      flow: "replay",
      event_type,
      agency_id: agency_id ?? null,
      agency_slug,
      agency_name,
      state_slug: state_slug ?? null,
      state_name: resolvedStateName,
      replay_session_id,
      click_type: click_type ?? null,
      seconds_in_replay: seconds_in_replay ?? null,
      intent_level: intent_level ?? null,
      confidence_score: confidence_score ?? null,
      ...(confidence_reasoning != null ? { confidence_reasoning } : {}),
    };

    // Insert queued log row
    const { data: enLogRow, error: enLogInsertError } = await supabase
      .from("email_notification_logs")
      .insert({
        notification_type: event_type,
        is_test: false,
        to_emails: recipients.join(", "),
        subject,
        status: "queued",
        provider: "smtp",
        error_message: null,
        payload: logPayload,
      })
      .select("id")
      .single();

    if (enLogInsertError) {
      console.error("[replay-funnel-track] email_notification_logs insert failed:", enLogInsertError);
      return json({
        ok: false,
        stage: "email_log_insert",
        eventId,
        sessionId,
        error: enLogInsertError.message,
      }, 500);
    }

    const enLogId = enLogRow.id;

    // Send email
    let emailStatus: "sent" | "failed" = "failed";
    let providerError: string | null = null;

    try {
      const htmlBody = await buildReplayEmailHtml(
        supabase,
        { ...payload, agency_id, state_name: resolvedStateName } as ReplayPayload,
        event_type as ReplayEventType,
        replayOpensCount,
      );

      const emailResult = await sendEmail({
        to: recipients,
        subject,
        html: htmlBody,
      });

      emailStatus = emailResult.success === true ? "sent" : "failed";
      providerError = emailResult.success === true ? null : (emailResult.error || "Unknown SMTP error");

      console.log(`[replay-funnel-track] Email ${emailStatus} for ${event_type}`);
    } catch (sendErr) {
      emailStatus = "failed";
      providerError = sendErr instanceof Error ? sendErr.message : String(sendErr);
      console.error("[replay-funnel-track] Email send threw:", sendErr);
    }

    // Update log row to final status
    await supabase
      .from("email_notification_logs")
      .update({ status: emailStatus, error_message: providerError })
      .eq("id", enLogId);

    return json({
      ok: true,
      eventId,
      sessionId,
      emailNotificationLogId: enLogId,
      emailStatus,
      recipients,
    });

  } catch (error) {
    console.error("[replay-funnel-track] Unexpected error:", error);
    return json({
      ok: false,
      stage: "unexpected",
      error: error instanceof Error ? error.message : String(error),
    }, 500);
  }
});

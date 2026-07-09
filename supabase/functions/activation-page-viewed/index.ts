import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { sendEmail } from "../_shared/emailClient.ts";
import {
  buildAdminActivityEmail,
  buildAgencyAdminUrl,
  resolveAdminContext,
  stateNameFromSlug,
} from "../_shared/adminEmailContext.ts";

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

function escHtml(s: unknown): string {
  return String(s ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

const LISTING_TYPE_LABEL: Record<string, string> = {
  standard: "Standard Activation",
  activation: "Standard Activation",
  other_listing: "Standard Activation",
  top25: "Top 25 Listing",
  top25_claim_bundle: "Top 25 Claim Bundle",
  top25_standard_only_release: "Standard (Top 25 Released)",
  spotlight: "Spotlight Placement",
};

interface ActivationPageViewedPayload {
  agency_id?: string | null;
  agency_slug?: string | null;
  agency_name?: string | null;
  state_slug?: string | null;
  listing_type?: string | null;
  rank?: number | null;
  page_url?: string | null;
  fsid?: string | null;
  prev_step?: string | null;
  entry_path?: string | null;
  checkout_opened?: boolean | null;
  visitor_session_id?: string | null;
  // Confidence classification fields (enriched by trackingTransport on the client)
  intent_level?: string | null;
  confidence_score?: number | null;
  confidence_reasoning?: Record<string, unknown> | null;
  scanner_signals?: Record<string, unknown> | null;
  human_signals?: Record<string, unknown> | null;
  timing_signals?: Record<string, unknown> | null;
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

  let body: ActivationPageViewedPayload;
  try {
    body = await req.json();
  } catch {
    return jsonResponse({ error: "Invalid JSON" }, 400);
  }

  const {
    agency_id,
    agency_slug,
    agency_name,
    state_slug,
    listing_type,
    rank,
    page_url,
    fsid,
    prev_step,
    entry_path,
    checkout_opened,
    intent_level,
    confidence_score,
    confidence_reasoning,
    scanner_signals,
    human_signals,
    timing_signals,
  } = body;

  if (!fsid) {
    return jsonResponse({ error: "fsid is required" }, 400);
  }

  try {
    // Load notification setting
    const { data: setting } = await supabase
      .from("email_notification_settings")
      .select("is_enabled, recipient_emails, subject_template, body_html")
      .eq("notification_type", "activation_page_viewed")
      .maybeSingle();

    if (setting && setting.is_enabled === false) {
      return jsonResponse({ ok: true, skipped: "disabled" });
    }

    // ── Server-side dedupe: same agency within 10 minutes ──
    // Checks both "sent" and "pending" to prevent race-condition duplicates.
    const tenMinAgo = new Date(Date.now() - 10 * 60 * 1000).toISOString();

    let isDuplicate = false;

    // Strategy 1: Match by agency_id (strongest)
    if (agency_id) {
      const { data: dup } = await supabase
        .from("email_notification_logs")
        .select("id")
        .eq("notification_type", "activation_page_viewed")
        .in("status", ["sent", "pending"])
        .gte("created_at", tenMinAgo)
        .filter("payload->>agency_id", "eq", agency_id)
        .limit(1)
        .maybeSingle();
      if (dup) isDuplicate = true;
    }

    // Strategy 2: Match by agency_slug + state_slug
    if (!isDuplicate && agency_slug) {
      const q = supabase
        .from("email_notification_logs")
        .select("id")
        .eq("notification_type", "activation_page_viewed")
        .in("status", ["sent", "pending"])
        .gte("created_at", tenMinAgo)
        .filter("payload->>agency_slug", "eq", agency_slug);
      if (state_slug) q.filter("payload->>state_slug", "eq", state_slug);
      const { data: dup } = await q.limit(1).maybeSingle();
      if (dup) isDuplicate = true;
    }

    // Strategy 3: Match by agency_name + state_slug (weakest fallback)
    if (!isDuplicate && agency_name && state_slug) {
      const { data: dup } = await supabase
        .from("email_notification_logs")
        .select("id")
        .eq("notification_type", "activation_page_viewed")
        .in("status", ["sent", "pending"])
        .gte("created_at", tenMinAgo)
        .filter("payload->>agency_name", "eq", agency_name)
        .filter("payload->>state_slug", "eq", state_slug)
        .limit(1)
        .maybeSingle();
      if (dup) isDuplicate = true;
    }

    if (isDuplicate) {
      return jsonResponse({ ok: true, skipped: "duplicate_within_10min" });
    }

    // ── Confidence gate — scanner and possible_human traffic: log only, no email ──
    // Legacy events with no intent_level (null/undefined) are allowed through.
    if (intent_level === "scanner" || intent_level === "possible_human") {
      // Still persist a log record so the event is auditable, but mark as suppressed.
      const suppressedPayload = {
        fsid,
        agency_id: agency_id ?? "",
        agency_slug: agency_slug ?? "",
        agency_name: agency_name?.trim() || agency_slug?.trim() || "Unknown Agency",
        state_slug: state_slug ?? "",
        listing_type: listing_type ?? "",
        rank: rank != null ? String(rank) : "",
        page_url: page_url || "",
        prev_step: prev_step ?? "",
        entry_path: entry_path ?? "",
        checkout_opened: checkout_opened === true ? "true" : checkout_opened === false ? "false" : "",
        intent_level: intent_level ?? "",
        confidence_score: confidence_score != null ? String(confidence_score) : "",
        suppressed_reason: `confidence_gate_${intent_level}`,
      };
      try {
        await supabase.from("email_notification_logs").insert({
          notification_type: "activation_page_viewed",
          is_test: false,
          to_emails: "",
          subject: "",
          status: "suppressed",
          provider: "smtp",
          payload: suppressedPayload,
        });
      } catch (_) { /* non-fatal */ }
      return jsonResponse({ ok: true, suppressed: true, reason: `confidence_gate_${intent_level}` });
    }

    // Resolve recipients
    const EMERGENCY_FALLBACK = "bartu@gappsy.com";
    let recipients: string[] = [];
    if (setting?.recipient_emails) {
      recipients = setting.recipient_emails
        .split(",")
        .map((r: string) => r.trim())
        .filter(Boolean);
    }
    if (recipients.length === 0) {
      recipients = [EMERGENCY_FALLBACK];
    }

    const subjectTemplate =
      setting?.subject_template || "Activation Page Viewed: {{agency_name}}";
    const customBodyHtml = setting?.body_html?.trim() ? setting.body_html : null;

    const displayAgency = agency_name?.trim() || agency_slug?.trim() || "Unknown Agency";
    const stateName = stateNameFromSlug(state_slug);

    const subject = subjectTemplate
      .replace(/\{\{agency_name\}\}/g, displayAgency)
      .replace(/\{\{agency\}\}/g, displayAgency)
      .replace(/\{\{state\}\}/g, stateName)
      .replace(/\{\{state_slug\}\}/g, state_slug ?? "");

    const logPayload = {
      fsid,
      agency_id: agency_id ?? "",
      agency_slug: agency_slug ?? "",
      agency_name: displayAgency,
      state_slug: state_slug ?? "",
      listing_type: listing_type ?? "",
      rank: rank != null ? String(rank) : "",
      page_url: page_url || "",
      prev_step: prev_step ?? "",
      entry_path: entry_path ?? "",
      checkout_opened: checkout_opened === true ? "true" : checkout_opened === false ? "false" : "",
      intent_level: intent_level ?? "",
      confidence_score: confidence_score != null ? String(confidence_score) : "",
      ...(confidence_reasoning != null ? { confidence_reasoning } : {}),
      ...(scanner_signals != null ? { scanner_signals } : {}),
      ...(human_signals != null ? { human_signals } : {}),
      ...(timing_signals != null ? { timing_signals } : {}),
    };

    // ── Insert pending log BEFORE sending (race-condition guard) ──
    const { data: pendingLog } = await supabase
      .from("email_notification_logs")
      .insert({
        notification_type: "activation_page_viewed",
        is_test: false,
        to_emails: recipients.join(", "),
        subject,
        status: "pending",
        provider: "smtp",
        payload: logPayload,
      })
      .select("id")
      .maybeSingle();

    const pendingLogId = pendingLog?.id;

    // Count activation page views for this agency in last 24h (drop-off signal)
    let activationViews24h = 0;
    try {
      const since = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
      const q = supabase
        .from("email_notification_logs")
        .select("id", { count: "exact", head: true })
        .eq("notification_type", "activation_page_viewed")
        .eq("status", "sent")
        .gte("created_at", since);
      if (agency_id) q.filter("payload->>agency_id", "eq", agency_id);
      else if (agency_slug) q.filter("payload->>agency_slug", "eq", agency_slug);
      const { count } = await q;
      if (typeof count === "number") activationViews24h = count;
    } catch (_) { /* non-fatal */ }

    // Build admin URLs
    const adminUrl = buildAgencyAdminUrl({ agency_id, agency_slug });

    const profileUrl = agency_slug
      ? `https://www.gappsy.com/your-agency/${agency_slug}`
      : "";

    const activationUrl = page_url || "";
    const funnelAnalyticsUrl = `https://www.gappsy.com/wp-admin/analytics/agency-funnel`;

    const listingTypeLabel = listing_type
      ? (LISTING_TYPE_LABEL[listing_type] ?? listing_type)
      : "Activation";

    let emailHtml: string;

    if (customBodyHtml) {
      emailHtml = customBodyHtml
        .replace(/\{\{agency\}\}/g, escHtml(displayAgency))
        .replace(/\{\{agency_name\}\}/g, escHtml(displayAgency))
        .replace(/\{\{agency_slug\}\}/g, escHtml(agency_slug ?? ""))
        .replace(/\{\{state\}\}/g, escHtml(stateName))
        .replace(/\{\{state_slug\}\}/g, escHtml(state_slug ?? ""))
        .replace(/\{\{listing_type\}\}/g, escHtml(listingTypeLabel))
        .replace(/\{\{rank\}\}/g, escHtml(rank != null ? String(rank) : ""))
        .replace(/\{\{page_url\}\}/g, escHtml(activationUrl))
        .replace(/\{\{profile_url\}\}/g, escHtml(profileUrl))
        .replace(/\{\{admin_url\}\}/g, escHtml(adminUrl))
        .replace(/\{\{fsid\}\}/g, escHtml(fsid))
        .replace(/\{\{prev_step\}\}/g, escHtml(prev_step ?? ""))
        .replace(/\{\{entry_path\}\}/g, escHtml(entry_path ?? ""));
    } else {
      const ctx = await resolveAdminContext(supabase, {
        agency_id,
        agency_slug,
        agency_name: displayAgency,
        state_slug,
        days: 30,
      });

      const extraRows: Array<{ label: string; value: string; highlight?: boolean }> = [];

      extraRows.push({
        label: "Listing Type",
        value: `<span style="color:#0369a1;font-weight:700">${escHtml(listingTypeLabel)}</span>`,
        highlight: true,
      });

      if (rank != null) {
        extraRows.push({ label: "Rank", value: `#${escHtml(String(rank))}` });
      }

      if (agency_id) {
        extraRows.push({ label: "Agency ID", value: `<code style="font-size:12px">${escHtml(agency_id)}</code>` });
      }

      if (activationUrl) {
        extraRows.push({
          label: "Activation URL",
          value: `<a href="${escHtml(activationUrl)}" style="color:#2563eb;text-decoration:none;font-weight:500;word-break:break-all">${escHtml(activationUrl)}</a>`,
        });
      }

      if (prev_step) {
        extraRows.push({ label: "Previous Step", value: escHtml(prev_step) });
      }

      if (entry_path) {
        extraRows.push({ label: "Entry Source", value: escHtml(entry_path) });
      }

      extraRows.push({
        label: "Session ID (fsid)",
        value: `<code style="font-size:11px;color:#6b7280">${escHtml(fsid)}</code>`,
      });

      // Drop-off signal block
      const checkoutOpenedLabel = checkout_opened === true
        ? `<span style="color:#16a34a;font-weight:700">Yes</span>`
        : checkout_opened === false
          ? `<span style="color:#dc2626;font-weight:700">No</span>`
          : `<span style="color:#9ca3af">Unknown</span>`;

      extraRows.push({
        label: "Drop-off Signal",
        value: `<div style="font-size:13px;color:#374151;line-height:1.5"><strong style="color:#dc2626">User reached activation page but has not opened checkout yet.</strong><br/><span style="color:#6b7280">Checkout opened:</span> ${checkoutOpenedLabel}<br/><span style="color:#6b7280">Activation views (24h):</span> <strong>${activationViews24h + 1}</strong></div>`,
        highlight: true,
      });

      emailHtml = buildAdminActivityEmail({
        eventTitle: "Activation Page Viewed",
        eventSubtitle: "A user reached the activation step but has not checked out",
        accentColor: "#dc2626",
        agencyName: displayAgency,
        agencySlug: agency_slug,
        profileUrl,
        searchQuery: null,
        source: "activation_flow",
        importedEmail: null,
        importedEmails: [],
        adminUrl,
        funnelAnalyticsUrl,
        context: ctx,
        extraRows,
      });
    }

    const result = await sendEmail({
      to: recipients.length === 1 ? recipients[0] : recipients,
      subject,
      html: emailHtml,
    });

    // ── Update pending log to final status ──
    if (pendingLogId) {
      try {
        await supabase
          .from("email_notification_logs")
          .update({
            status: result.success ? "sent" : "failed",
            error_message: result.error ?? null,
            payload: { ...logPayload, activation_views_24h: String(activationViews24h + 1) },
          })
          .eq("id", pendingLogId);
      } catch (updateErr) {
        console.error("[activation-page-viewed] Log update failed:", updateErr);
      }
    } else {
      // Fallback: insert if pending insert somehow failed
      try {
        await supabase.from("email_notification_logs").insert({
          notification_type: "activation_page_viewed",
          is_test: false,
          to_emails: recipients.join(", "),
          subject,
          status: result.success ? "sent" : "failed",
          provider: "smtp",
          error_message: result.error ?? null,
          payload: { ...logPayload, activation_views_24h: String(activationViews24h + 1) },
        });
      } catch (logErr) {
        console.error("[activation-page-viewed] Log insert failed:", logErr);
      }
    }

    return jsonResponse({ ok: true, sent: result.success, error: result.error ?? null });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[activation-page-viewed] Error:", msg);
    return jsonResponse({ error: msg }, 500);
  }
});

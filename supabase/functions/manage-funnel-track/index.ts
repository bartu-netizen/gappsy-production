import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { sendEmail } from "../_shared/emailClient.ts";
import { stateNameFromSlug, buildAgencyAdminUrl } from "../_shared/adminEmailContext.ts";
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

type NormalizedListingType = 'top25' | 'other' | 'free' | null;

function normalizeListingType(raw: string | null | undefined): NormalizedListingType {
  if (!raw) return null;
  const lower = raw.toLowerCase();
  if (lower === 'top25') return 'top25';
  if (lower === 'other_agency' || lower === 'other') return 'other';
  if (lower === 'free') return 'free';
  return null;
}

function escHtml(s: unknown): string {
  return String(s ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

interface TrackPayload {
  event_type: string;
  agency_id: string;
  agency_slug?: string | null;
  agency_name: string;
  state_slug?: string | null;
  token?: string | null;
  lead_key?: string | null;
  source?: string;
  listing_type?: string | null;
  engaged_leads_count?: number;
  total_interactions?: number;
  engagement_hint?: string | null;
  recovery_type?: string | null;
  entry_reason?: string | null;
  page_path?: string | null;
  referrer?: string | null;
  metadata?: Record<string, unknown>;
  // Confidence classification fields (enriched by trackingTransport)
  intent_level?: string | null;
  confidence_score?: number | null;
  confidence_reasoning?: Record<string, unknown> | null;
}

function buildManageEmailHtml(payload: TrackPayload, eventType: string): string {
  const agencyName = escHtml(payload.agency_name);
  const stateName = payload.state_slug ? escHtml(stateNameFromSlug(payload.state_slug)) : "Unknown State";
  const listingType = payload.listing_type ? escHtml(payload.listing_type) : "unknown";
  const source = escHtml(payload.source || "unknown");
  const leadKey = escHtml(payload.lead_key || "");
  const token = payload.token || "";
  const agencySlug = payload.agency_slug || "";

  const engagedLeads = payload.engaged_leads_count || 0;
  const totalInteractions = payload.total_interactions || 0;
  const engagementHint = payload.engagement_hint || null;

  const yourAgencyUrl = agencySlug
    ? `https://www.gappsy.com/your-agency/${agencySlug}`
    : null;

  const manageUrl = agencySlug && token
    ? `https://www.gappsy.com/manage-listing/${agencySlug}?c=${encodeURIComponent(token)}`
    : null;

  const adminUrl = buildAgencyAdminUrl({
    agency_id: payload.agency_id,
    agency_slug: agencySlug || null,
  });

  let title = "";
  let description = "";
  let badge = "";

  switch (eventType) {
    case "manage_funnel_opened":
      title = "Manage Funnel Opened";
      description = `${agencyName} has opened the manage listing page.`;
      badge = "Funnel Entry";
      break;
    case "manage_remove_started":
      title = "Removal Intent Detected";
      description = `${agencyName} has started the removal process and entered the recovery step.`;
      badge = "High Intent";
      break;
    case "manage_recovered":
      title = "Recovered from Removal Funnel";
      description = `${agencyName} chose to ${payload.recovery_type === "activate" ? "activate their listing" : "keep their listing visible"}.`;
      badge = "Recovery";
      break;
    case "manage_remove_confirmed":
      title = "Listing Removal Confirmed";
      description = `${agencyName} has confirmed removal of their listing.`;
      badge = "Removed";
      break;
  }

  const engagementSection = (engagedLeads > 0 || totalInteractions > 0)
    ? `
      <div style="background: #FEF3C7; border: 1px solid #FDE68A; border-radius: 8px; padding: 16px; margin-top: 16px;">
        <p style="margin: 0 0 8px 0; font-weight: 600; color: #92400E;">Engagement Metrics</p>
        <table style="width: 100%; border-collapse: collapse;">
          <tr>
            <td style="padding: 4px 0; color: #78350F;"><strong>Engaged Leads:</strong></td>
            <td style="padding: 4px 0; color: #78350F; text-align: right;">${engagedLeads}</td>
          </tr>
          <tr>
            <td style="padding: 4px 0; color: #78350F;"><strong>Total Interactions:</strong></td>
            <td style="padding: 4px 0; color: #78350F; text-align: right;">${totalInteractions}</td>
          </tr>
          ${engagementHint ? `
          <tr>
            <td colspan="2" style="padding: 8px 0 0 0; color: #92400E; font-style: italic;">${escHtml(engagementHint)}</td>
          </tr>
          ` : ""}
        </table>
      </div>
    `
    : "";

  return `
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; background-color: #F9FAFB;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #F9FAFB; padding: 40px 20px;">
    <tr>
      <td align="center">
        <table width="600" cellpadding="0" cellspacing="0" style="background-color: white; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); overflow: hidden;">

          <!-- Header -->
          <tr>
            <td style="background: linear-gradient(135deg, #1e3a5f 0%, #2563eb 100%); padding: 32px 24px; text-align: center;">
              <h1 style="margin: 0; color: white; font-size: 24px; font-weight: 700;">${title}</h1>
              <div style="margin-top: 12px;">
                <span style="display: inline-block; padding: 6px 16px; background: rgba(255,255,255,0.2); border-radius: 20px; color: white; font-size: 13px; font-weight: 600;">${badge}</span>
              </div>
            </td>
          </tr>

          <!-- Content -->
          <tr>
            <td style="padding: 32px 24px;">

              <p style="margin: 0 0 24px 0; font-size: 16px; color: #374151; line-height: 1.6;">
                ${description}
              </p>

              <!-- Agency Info Card -->
              <div style="background: #F3F4F6; border-radius: 8px; padding: 20px; margin-bottom: 20px;">
                <table style="width: 100%; border-collapse: collapse;">
                  <tr>
                    <td style="padding: 6px 0; color: #6B7280; font-size: 14px;"><strong>Agency:</strong></td>
                    <td style="padding: 6px 0; color: #111827; font-size: 14px; text-align: right;">${agencyName}</td>
                  </tr>
                  <tr>
                    <td style="padding: 6px 0; color: #6B7280; font-size: 14px;"><strong>State:</strong></td>
                    <td style="padding: 6px 0; color: #111827; font-size: 14px; text-align: right;">${stateName}</td>
                  </tr>
                  <tr>
                    <td style="padding: 6px 0; color: #6B7280; font-size: 14px;"><strong>Listing Type:</strong></td>
                    <td style="padding: 6px 0; color: #111827; font-size: 14px; text-align: right;">${listingType}</td>
                  </tr>
                  <tr>
                    <td style="padding: 6px 0; color: #6B7280; font-size: 14px;"><strong>Source:</strong></td>
                    <td style="padding: 6px 0; color: #111827; font-size: 14px; text-align: right;">${source}</td>
                  </tr>
                  ${leadKey ? `
                  <tr>
                    <td style="padding: 6px 0; color: #6B7280; font-size: 14px;"><strong>Lead Key:</strong></td>
                    <td style="padding: 6px 0; color: #111827; font-size: 14px; text-align: right; font-family: monospace; font-size: 12px;">${leadKey}</td>
                  </tr>
                  ` : ""}
                  ${payload.recovery_type ? `
                  <tr>
                    <td style="padding: 6px 0; color: #6B7280; font-size: 14px;"><strong>Recovery Type:</strong></td>
                    <td style="padding: 6px 0; color: #111827; font-size: 14px; text-align: right;">${escHtml(payload.recovery_type)}</td>
                  </tr>
                  ` : ""}
                </table>
              </div>

              ${engagementSection}

              <!-- Action Buttons -->
              <div style="margin-top: 24px; text-align: center;">
                <a href="${adminUrl}" style="display: inline-block; background: #0369a1; color: white; text-decoration: none; padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; margin: 0 4px 8px 4px;">Open Admin</a>
                ${yourAgencyUrl ? `
                <a href="${yourAgencyUrl}" style="display: inline-block; background: #2563eb; color: white; text-decoration: none; padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; margin: 0 4px 8px 4px;">View Profile →</a>
                ` : ""}
                ${manageUrl ? `
                <a href="${manageUrl}" style="display: inline-block; background: #6B7280; color: white; text-decoration: none; padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; margin: 0 4px 8px 4px;">Manage Listing →</a>
                ` : ""}
              </div>

            </td>
          </tr>

          <!-- Footer -->
          <tr>
            <td style="background: #F9FAFB; padding: 20px 24px; text-align: center; border-top: 1px solid #E5E7EB;">
              <p style="margin: 0; font-size: 12px; color: #6B7280;">
                Gappsy Admin Notification &mdash; Manage Funnel Tracking
              </p>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
</body>
</html>
  `.trim();
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

  console.log("[manage-funnel-track] Request received");

  try {
    const payload: TrackPayload = await req.json();

    const {
      event_type,
      agency_id,
      agency_slug,
      agency_name,
      state_slug,
      token,
      lead_key,
      source,
      listing_type,
      engaged_leads_count,
      total_interactions,
      engagement_hint,
      recovery_type,
      entry_reason,
      page_path,
      referrer,
      metadata,
      intent_level,
      confidence_score,
      confidence_reasoning,
    } = payload;

    console.log("[manage-funnel-track] Payload validated", {
      event_type,
      agency_id,
      agency_name,
      source: source ?? "unknown",
      lead_key: lead_key ?? null,
    });

    if (!event_type || !agency_id || !agency_name) {
      console.error("[manage-funnel-track] Missing required fields", { event_type, agency_id, agency_name });
      return json({ ok: false, stage: "validation", error: "Missing required fields: event_type, agency_id, agency_name" }, 400);
    }

    const validEvents = [
      "manage_funnel_opened",
      "manage_remove_started",
      "manage_recovered",
      "manage_remove_confirmed",
    ];
    if (!validEvents.includes(event_type)) {
      console.error("[manage-funnel-track] Invalid event_type", event_type);
      return json({ ok: false, stage: "validation", error: `Invalid event_type: ${event_type}` }, 400);
    }

    const visitor = extractVisitorContext(req);
    const requestIp = visitor.ip_address || "unknown";
    const userAgent = visitor.user_agent;

    // ── 1. Insert event (synchronous) ────────────────────────────────────────────
    const rawListingType = listing_type;
    const normalizedListingType = normalizeListingType(listing_type);

    console.log(`[manage-funnel-track] Inserting event: ${event_type} for agency ${agency_id}`, {
      rawListingType,
      normalizedListingType,
    });

    const { data: eventRow, error: eventError } = await supabase
      .from("manage_funnel_events")
      .insert({
        event_type,
        agency_id,
        agency_slug: agency_slug || null,
        agency_name,
        state_slug: state_slug || null,
        token: token || null,
        lead_key: lead_key || null,
        source: source || "unknown",
        listing_type: normalizedListingType,
        engaged_leads_count: engaged_leads_count || 0,
        total_interactions: total_interactions || 0,
        engagement_hint: engagement_hint || null,
        recovery_type: recovery_type || null,
        entry_reason: entry_reason || null,
        page_path: page_path || null,
        referrer: referrer || null,
        user_agent: userAgent,
        request_ip: requestIp,
        country: visitor.country,
        city: visitor.city,
        region: visitor.region,
        metadata: metadata || {},
        ...(intent_level != null ? { intent_level } : {}),
        ...(confidence_score != null ? { confidence_score } : {}),
        ...(confidence_reasoning != null ? { confidence_reasoning } : {}),
      })
      .select("id")
      .single();

    if (eventError) {
      console.error("[manage-funnel-track] Event insert FAILED:", eventError);
      return json({
        ok: false,
        stage: "event_insert",
        error: eventError.message,
        details: eventError,
        rawListingType,
        normalizedListingType,
      }, 500);
    }

    const eventId = eventRow.id;
    console.log(`[manage-funnel-track] Event inserted successfully: ${eventId}`);

    // ── 2. Quick notification settings lookup (synchronous) ─────────────────────
    console.log(`[manage-funnel-track] Looking up notification settings for: ${event_type}`);

    const { data: settings, error: settingsError } = await supabase
      .from("email_notification_settings")
      .select("is_enabled, recipient_emails")
      .eq("notification_type", event_type)
      .maybeSingle();

    if (settingsError) {
      console.warn(`[manage-funnel-track] Settings lookup error (using fallback):`, settingsError);
    }

    const settingsFound = !!settings;
    let recipientEmails = "bartu@gappsy.com";
    let settingsEnabled = true;
    let recipientSource = "emergency_hardcoded_fallback";

    if (settings) {
      settingsEnabled = settings.is_enabled !== false;
      if (settings.recipient_emails && settings.recipient_emails.trim()) {
        recipientEmails = settings.recipient_emails;
        recipientSource = "settings";
      }
      console.log(`[manage-funnel-track] Settings found: enabled=${settingsEnabled}, recipients=${recipientEmails}, source=${recipientSource}`);
    } else {
      console.log(`[manage-funnel-track] No settings row for ${event_type} — using fallback: ${recipientEmails}`);
    }

    const recipientsAttempted = recipientEmails.split(",").map(e => e.trim()).filter(Boolean);

    // Build subject and URLs now (needed for both immediate insert and background send)
    const subject = `${
      event_type === "manage_funnel_opened" ? "Manage funnel opened" :
      event_type === "manage_remove_started" ? "Removal intent" :
      event_type === "manage_recovered" ? "Recovered from removal funnel" :
      "Listing removed"
    } — ${agency_name}`;

    const yourAgencyUrlForLog = agency_slug
      ? `https://www.gappsy.com/your-agency/${agency_slug}`
      : null;
    const manageUrlForLog = agency_slug && token
      ? `https://www.gappsy.com/manage-listing/${agency_slug}?c=${encodeURIComponent(token)}`
      : null;

    const logPayload = {
      flow: "manage",
      event_type,
      agency_id,
      agency_slug: agency_slug ?? null,
      agency_name,
      state_slug: state_slug ?? null,
      listing_type: listing_type ?? null,
      source: source ?? null,
      lead_key: lead_key ?? null,
      token: token ?? null,
      recovery_type: recovery_type ?? null,
      entry_reason: entry_reason ?? null,
      engaged_leads_count: engaged_leads_count ?? 0,
      total_interactions: total_interactions ?? 0,
      engagement_hint: engagement_hint ?? null,
      page_path: page_path ?? null,
      referrer: referrer ?? null,
      manage_url: manageUrlForLog,
      your_agency_url: yourAgencyUrlForLog,
      recipient_source: recipientSource,
      metadata: metadata ?? {},
    };

    // ── 3. If disabled, return immediately without scheduling email ─────────────
    if (!settingsEnabled) {
      console.log(`[manage-funnel-track] Notifications disabled for ${event_type} — event logged only`);
      return json({
        ok: true,
        eventId,
        queued: false,
        notificationSent: false,
        reason: "disabled",
        settingsFound,
        settingsEnabled,
        recipientsAttempted,
      });
    }

    // ── 3b. Confidence gate — only verified_human sessions trigger emails ───────
    // scanner      → suppress email, store event only
    // possible_human → suppress email, store event only (analytics only)
    // verified_human → proceed normally
    // null/undefined → proceed (no confidence data means legacy or server-side event)
    if (intent_level === "scanner" || intent_level === "possible_human") {
      console.log(`[manage-funnel-track] Confidence gate: intent_level=${intent_level} — event stored, email suppressed`);
      return json({
        ok: true,
        eventId,
        queued: false,
        notificationSent: false,
        reason: `confidence_gate_${intent_level}`,
        intent_level,
        confidence_score: confidence_score ?? null,
        settingsFound,
        settingsEnabled,
        recipientsAttempted,
      });
    }

    // ── 4. INSERT logs IMMEDIATELY with status='queued' — HARD FAIL if this fails ─
    console.log(`[manage-funnel-track] Inserting queued log rows IMMEDIATELY for ${event_type}`);

    // 4a. Insert manage_funnel_notification_log with status='queued'
    const { data: mfLogRow, error: mfLogInsertError } = await supabase
      .from("manage_funnel_notification_log")
      .insert({
        notification_type: event_type,
        agency_id,
        event_id: eventId,
        to_emails: recipientsAttempted.join(", "),
        subject,
        status: "queued",
        error_message: null,
        payload: payload,
      })
      .select("id")
      .single();

    if (mfLogInsertError) {
      console.error("[manage-funnel-track] HARD FAILURE: manage_funnel_notification_log insert FAILED:", mfLogInsertError);
      return json({
        ok: false,
        stage: "manage_notification_log_insert",
        eventId,
        error: mfLogInsertError.message,
        code: mfLogInsertError.code,
        details: mfLogInsertError.details,
        hint: mfLogInsertError.hint,
      }, 500);
    }

    const mfLogId = mfLogRow.id;
    console.log(`[manage-funnel-track] manage_funnel_notification_log QUEUED insert OK: ${mfLogId}`);

    // 4b. Insert email_notification_logs with status='queued'
    const { data: enLogRow, error: enLogInsertError } = await supabase
      .from("email_notification_logs")
      .insert({
        notification_type: event_type,
        is_test: false,
        to_emails: recipientsAttempted.join(", "),
        subject,
        status: "queued",
        provider: "smtp",
        error_message: null,
        payload: logPayload,
      })
      .select("id")
      .single();

    if (enLogInsertError) {
      console.error("[manage-funnel-track] HARD FAILURE: email_notification_logs insert FAILED:", enLogInsertError);
      return json({
        ok: false,
        stage: "email_notification_log_insert",
        eventId,
        manageNotificationLogId: mfLogId,
        error: enLogInsertError.message,
        code: enLogInsertError.code,
        details: enLogInsertError.details,
        hint: enLogInsertError.hint,
      }, 500);
    }

    const enLogId = enLogRow.id;
    console.log(`[manage-funnel-track] email_notification_logs QUEUED insert OK: ${enLogId}`);

    // ── 5. SEND EMAIL INLINE (NOT background) for manage events ───────────────────
    console.log(`[manage-funnel-track] Sending email INLINE (synchronous) for ${event_type}`);

    let emailStatus: "sent" | "failed" = "failed";
    let providerError: string | null = null;

    try {
      const htmlBody = buildManageEmailHtml(payload, event_type);

      console.log(`[manage-funnel-track] Calling sendEmail for ${event_type} to: ${recipientsAttempted.join(", ")}`);

      const emailResult = await sendEmail({
        to: recipientsAttempted,
        subject,
        html: htmlBody,
      });

      emailStatus = emailResult.success === true ? "sent" : "failed";
      providerError = emailResult.success === true ? null : (emailResult.error || "Unknown SMTP error");

      if (emailResult.success === true) {
        console.log(`[manage-funnel-track] Email sent successfully for ${event_type}`);
      } else {
        console.error(`[manage-funnel-track] Email send FAILED for ${event_type}: ${providerError}`);
      }
    } catch (sendError) {
      emailStatus = "failed";
      providerError = sendError instanceof Error ? sendError.message : String(sendError);
      console.error(`[manage-funnel-track] Email send threw exception:`, sendError);
    }

    // ── 6. UPDATE pre-created queued rows to final status ─────────────────────────
    console.log(`[manage-funnel-track] Updating queued rows to ${emailStatus}`);

    const { error: mfUpdateError } = await supabase
      .from("manage_funnel_notification_log")
      .update({ status: emailStatus, error_message: providerError })
      .eq("id", mfLogId);

    if (mfUpdateError) {
      console.error("[manage-funnel-track] manage_funnel_notification_log UPDATE FAILED:", mfUpdateError);
    } else {
      console.log(`[manage-funnel-track] manage_funnel_notification_log UPDATE OK: ${emailStatus}`);
    }

    const { error: enUpdateError } = await supabase
      .from("email_notification_logs")
      .update({ status: emailStatus, error_message: providerError })
      .eq("id", enLogId);

    if (enUpdateError) {
      console.error("[manage-funnel-track] email_notification_logs UPDATE FAILED:", enUpdateError);
    } else {
      console.log(`[manage-funnel-track] email_notification_logs UPDATE OK: ${emailStatus}`);
    }

    // ── 7. Return honest response ─────────────────────────────────────────────────
    if (emailStatus === "sent") {
      console.log(`[manage-funnel-track] SUCCESS: ${event_type} email delivered`);
      return json({
        ok: true,
        eventId,
        emailNotificationLogId: enLogId,
        manageNotificationLogId: mfLogId,
        settingsFound,
        settingsEnabled,
        recipientsAttempted,
        recipientSource,
        emailStatus: "sent",
      });
    } else {
      console.error(`[manage-funnel-track] FAILURE: ${event_type} email failed — ${providerError}`);
      return json({
        ok: false,
        stage: "email_send",
        eventId,
        emailNotificationLogId: enLogId,
        manageNotificationLogId: mfLogId,
        settingsFound,
        settingsEnabled,
        recipientsAttempted,
        recipientSource,
        emailStatus: "failed",
        error: providerError,
      }, 500);
    }

  } catch (error) {
    console.error("[manage-funnel-track] Unexpected error:", error);
    return json({
      ok: false,
      stage: "unexpected",
      error: error instanceof Error ? error.message : String(error),
      details: String(error),
    }, 500);
  }
});

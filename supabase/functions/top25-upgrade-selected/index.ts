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

const BASE_URL = "https://www.gappsy.com";

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

interface Top25UpgradeSelectedPayload {
  agency_id?: string | null;
  agency_slug?: string | null;
  agency_name?: string | null;
  state_slug?: string | null;
  state_name?: string | null;
  selected_rank?: number | null;
  selected_price?: number | null;
  listing_tier?: string | null;
  source_page?: string | null;
  previous_step?: string | null;
  next_expected_step?: string | null;
  offer_token?: string | null;
  discount_percent?: number | null;
  page_url?: string | null;
  fsid?: string | null;
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

  let body: Top25UpgradeSelectedPayload;
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
    state_name,
    selected_rank,
    selected_price,
    listing_tier,
    source_page,
    previous_step,
    next_expected_step,
    offer_token,
    discount_percent,
    page_url,
    fsid,
  } = body;

  if (!fsid) {
    return jsonResponse({ error: "fsid is required" }, 400);
  }

  try {
    // Load notification setting
    const { data: setting } = await supabase
      .from("email_notification_settings")
      .select("is_enabled, recipient_emails, subject_template, body_html")
      .eq("notification_type", "top25_upgrade_selected")
      .maybeSingle();

    if (setting && setting.is_enabled === false) {
      return jsonResponse({ ok: true, skipped: "disabled" });
    }

    // Build dedup key
    let dedupAgencyKey: string;
    if (agency_id) {
      dedupAgencyKey = `id:${agency_id}`;
    } else if (agency_slug && state_slug) {
      dedupAgencyKey = `slug:${agency_slug}:${state_slug}`;
    } else {
      dedupAgencyKey = `fsid:${fsid}`;
    }

    // Server-side dedup: same dedup key + rank within 30 minutes
    const thirtyMinAgo = new Date(Date.now() - 30 * 60 * 1000).toISOString();
    const rankStr = selected_rank != null ? String(selected_rank) : "";
    const { data: existingLog } = await supabase
      .from("email_notification_logs")
      .select("id")
      .eq("notification_type", "top25_upgrade_selected")
      .eq("status", "sent")
      .gte("created_at", thirtyMinAgo)
      .filter("payload->>dedup_agency_key", "eq", dedupAgencyKey)
      .filter("payload->>selected_rank", "eq", rankStr)
      .limit(1)
      .maybeSingle();

    if (existingLog) {
      return jsonResponse({ ok: true, skipped: "duplicate_within_30min" });
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

    const displayAgency = agency_name?.trim() || agency_slug?.trim() || "Unknown Agency";
    const stateName = state_name?.trim() || stateNameFromSlug(state_slug);
    const priceStr = selected_price != null
      ? (selected_price % 1 === 0 ? `$${selected_price}` : `$${selected_price.toFixed(2)}`)
      : "N/A";
    const rankLabel = selected_rank != null ? `Rank #${selected_rank}` : "Unknown rank";

    const subjectTemplate =
      setting?.subject_template || "Agency selected Top-25 upgrade position: {{agency_name}}";
    const subject = subjectTemplate
      .replace(/\{\{agency_name\}\}/g, displayAgency)
      .replace(/\{\{agency\}\}/g, displayAgency)
      .replace(/\{\{rank\}\}/g, rankLabel)
      .replace(/\{\{state\}\}/g, stateName)
      .replace(/\{\{price\}\}/g, priceStr);

    const adminUrl = agency_id
      ? `${BASE_URL}/wp-admin/email/agency-lookup?agency_id=${encodeURIComponent(agency_id)}`
      : agency_slug
        ? `${BASE_URL}/wp-admin/email/agency-lookup?agency_slug=${encodeURIComponent(agency_slug)}`
        : `${BASE_URL}/wp-admin/submissions`;

    const profileUrl = agency_slug ? `${BASE_URL}/your-agency/${agency_slug}` : "";
    const funnelAnalyticsUrl = `${BASE_URL}/wp-admin/analytics/agency-funnel`;

    const ctx = await resolveAdminContext(supabase, {
      agency_id,
      agency_slug,
      agency_name: displayAgency,
      state_slug,
      days: 30,
    });

    const extraRows: Array<{ label: string; value: string; highlight?: boolean }> = [];

    extraRows.push({
      label: "Selected Position",
      value: `<span style="color:#0369a1;font-weight:700">${escHtml(rankLabel)}</span>`,
      highlight: true,
    });

    extraRows.push({
      label: "Upgrade Price",
      value: `<span style="font-weight:700">${escHtml(priceStr)}</span>`,
    });

    if (listing_tier) {
      extraRows.push({ label: "Listing Tier", value: escHtml(listing_tier) });
    }

    extraRows.push({
      label: "State",
      value: escHtml(stateName),
    });

    extraRows.push({
      label: "Source",
      value: `<span style="color:#6b7280">Standard upgrade offer page</span>`,
    });

    extraRows.push({
      label: "Next Expected Step",
      value: escHtml(next_expected_step || "top25_confirm / checkout"),
    });

    if (discount_percent != null && discount_percent > 0) {
      extraRows.push({
        label: "Active Discount",
        value: `${discount_percent}% off`,
        highlight: true,
      });
    }

    if (offer_token) {
      extraRows.push({
        label: "Offer Token",
        value: `<code style="font-size:11px">${escHtml(offer_token)}</code>`,
      });
    }

    if (agency_id) {
      extraRows.push({
        label: "Agency ID",
        value: `<code style="font-size:12px">${escHtml(agency_id)}</code>`,
      });
    }

    if (page_url) {
      extraRows.push({
        label: "Page URL",
        value: `<a href="${escHtml(page_url)}" style="color:#2563eb;text-decoration:none;font-size:12px;word-break:break-all">${escHtml(page_url)}</a>`,
      });
    }

    extraRows.push({
      label: "Session ID (fsid)",
      value: `<code style="font-size:11px;color:#6b7280">${escHtml(fsid)}</code>`,
    });

    const emailHtml = buildAdminActivityEmail({
      eventTitle: "Top-25 Upgrade Position Selected",
      eventSubtitle: `${displayAgency} selected ${rankLabel} on the standard upgrade offer page`,
      accentColor: "#d97706",
      agencyName: displayAgency,
      agencySlug: agency_slug,
      profileUrl,
      searchQuery: null,
      source: "standard_upgrade_offer",
      importedEmail: null,
      importedEmails: [],
      adminUrl,
      funnelAnalyticsUrl,
      context: ctx,
      extraRows,
    });

    const result = await sendEmail({
      to: recipients.length === 1 ? recipients[0] : recipients,
      subject,
      html: emailHtml,
    });

    try {
      await supabase.from("email_notification_logs").insert({
        notification_type: "top25_upgrade_selected",
        is_test: false,
        to_emails: recipients.join(", "),
        subject,
        status: result.success ? "sent" : "failed",
        provider: "smtp",
        error_message: result.error ?? null,
        payload: {
          fsid,
          dedup_agency_key: dedupAgencyKey,
          agency_id: agency_id ?? "",
          agency_slug: agency_slug ?? "",
          agency_name: displayAgency,
          state_slug: state_slug ?? "",
          state_name: stateName,
          selected_rank: rankStr,
          selected_price: selected_price != null ? String(selected_price) : "",
          listing_tier: listing_tier ?? "",
          source_page: source_page ?? "",
          previous_step: previous_step ?? "",
          next_expected_step: next_expected_step ?? "",
          offer_token: offer_token ?? "",
          discount_percent: discount_percent != null ? String(discount_percent) : "",
          page_url: page_url ?? "",
        },
      });
    } catch (logErr) {
      console.error("[top25-upgrade-selected] Log insert failed:", logErr);
    }

    return jsonResponse({ ok: true, sent: result.success, error: result.error ?? null });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[top25-upgrade-selected] Error:", msg);
    return jsonResponse({ error: msg }, 500);
  }
});

import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { sendEmail } from "../_shared/emailClient.ts";
import {
  buildAdminActivityEmail,
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

interface ActivationOptionSelectedPayload {
  agency_id?: string | null;
  agency_slug?: string | null;
  agency_name?: string | null;
  state_slug?: string | null;
  // option_type: 'standard' | 'top25' | 'standard_discounted'
  option_type?: string | null;
  selected_rank?: number | null;
  selected_price?: number | null;
  discount_percent?: number | null;
  next_destination?: string | null;
  page_url?: string | null;
  fsid?: string | null;
}

function buildSelectedOptionLabel(payload: ActivationOptionSelectedPayload): string {
  const { option_type, selected_rank, selected_price, discount_percent } = payload;
  const price = selected_price ?? 0;
  const priceStr = price % 1 === 0 ? `$${price}` : `$${price.toFixed(2)}`;

  if (option_type === "top25" && selected_rank != null) {
    return `Top 25 #${selected_rank} (${priceStr})`;
  }
  if (option_type === "standard_discounted" && discount_percent) {
    return `Discounted Standard Listing (${priceStr} after ${discount_percent}% off)`;
  }
  return `Standard Listing (${priceStr})`;
}

function buildRequestReplayUrl(
  agencySlug: string | null | undefined,
  agencyId: string | null | undefined,
  stateSlug: string | null | undefined,
): string {
  if (!agencySlug) return "";
  const params = new URLSearchParams();
  if (agencyId) params.set("aid", agencyId);
  if (stateSlug) params.set("stateSlug", stateSlug);
  const qs = params.toString();
  return `${BASE_URL}/request-replay/${agencySlug}${qs ? `?${qs}` : ""}`;
}

/** Returns a human-readable relative time string, e.g. "2 hours ago". */
function relativeTimeAgo(ms: number): string {
  const diff = Date.now() - ms;
  const minutes = Math.floor(diff / 60_000);
  if (minutes < 1) return "just now";
  if (minutes === 1) return "1 minute ago";
  if (minutes < 60) return `${minutes} minutes ago`;
  const hours = Math.floor(minutes / 60);
  if (hours === 1) return "1 hour ago";
  if (hours < 24) return `${hours} hours ago`;
  const days = Math.floor(hours / 24);
  if (days === 1) return "1 day ago";
  if (days < 14) return `${days} days ago`;
  const weeks = Math.floor(days / 7);
  if (weeks === 1) return "1 week ago";
  return `${weeks} weeks ago`;
}

/** Read canonical request context — read-only, never mutates state. */
async function fetchCanonicalRequestContext(
  supabase: ReturnType<typeof createClient>,
  agencyId: string | null | undefined,
  agencySlug: string | null | undefined,
  stateSlug: string | null | undefined,
): Promise<{ requests30d: number; mostRecentRequest: string | null }> {
  try {
    const thirtyDaysAgoIso = new Date(Date.now() - 30 * 24 * 3600_000).toISOString();

    // Count real requests in last 30 days
    let realCount = 0;
    let mostRecentMs: number | null = null;

    if (agencyId) {
      const { count } = await supabase
        .from("agency_availability_requests")
        .select("id", { count: "exact", head: true })
        .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
        .eq("is_demo", false)
        .is("deleted_at", null)
        .gte("created_at", thirtyDaysAgoIso);
      realCount = count ?? 0;

      if (realCount > 0) {
        const { data: latest } = await supabase
          .from("agency_availability_requests")
          .select("created_at")
          .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
          .eq("is_demo", false)
          .is("deleted_at", null)
          .order("created_at", { ascending: false })
          .limit(1)
          .maybeSingle();
        if (latest?.created_at) mostRecentMs = new Date(latest.created_at).getTime();
      }
    }

    // Count admin overrides in last 30 days
    let overrideCount = 0;
    let newestOverrideMs = 0;
    if (agencyId && stateSlug) {
      const { data: overrides } = await supabase
        .from("canonical_request_overrides")
        .select("request_at")
        .eq("agency_id", agencyId)
        .eq("state_slug", stateSlug)
        .gte("request_at", thirtyDaysAgoIso)
        .order("request_at", { ascending: false })
        .limit(50);
      overrideCount = (overrides ?? []).length;
      if (overrideCount > 0) {
        newestOverrideMs = new Date(overrides![0].request_at).getTime();
      }
    }

    const totalRequests = realCount + overrideCount;

    // Display anchor = max(real, newest override)
    const displayMs = newestOverrideMs > (mostRecentMs ?? 0) ? newestOverrideMs : (mostRecentMs ?? 0);
    const mostRecentRequest = displayMs > 0 ? relativeTimeAgo(displayMs) : null;

    return { requests30d: totalRequests, mostRecentRequest };
  } catch {
    return { requests30d: 0, mostRecentRequest: null };
  }
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

  let body: ActivationOptionSelectedPayload;
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
    option_type,
    selected_rank,
    selected_price,
    discount_percent,
    next_destination,
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
      .eq("notification_type", "activation_option_selected")
      .maybeSingle();

    if (setting && setting.is_enabled === false) {
      return jsonResponse({ ok: true, skipped: "disabled" });
    }

    const selectedOption = buildSelectedOptionLabel(body);

    // Build dedup key — never use empty string when agency_id is missing
    let dedupAgencyKey: string;
    if (agency_id) {
      dedupAgencyKey = `id:${agency_id}`;
    } else if (agency_slug && state_slug) {
      dedupAgencyKey = `slug:${agency_slug}:${state_slug}`;
    } else {
      dedupAgencyKey = `fsid:${fsid}`;
    }

    // Server-side dedup: same dedup key + selected_option within 30 minutes
    const thirtyMinAgo = new Date(Date.now() - 30 * 60 * 1000).toISOString();
    const { data: existingLog } = await supabase
      .from("email_notification_logs")
      .select("id")
      .eq("notification_type", "activation_option_selected")
      .eq("status", "sent")
      .gte("created_at", thirtyMinAgo)
      .filter("payload->>dedup_agency_key", "eq", dedupAgencyKey)
      .filter("payload->>selected_option", "eq", selectedOption)
      .limit(1)
      .maybeSingle();

    if (existingLog) {
      return jsonResponse({ ok: true, skipped: "duplicate_within_30min" });
    }

    // Resolve recipients — admin only, never sent to agency
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
      setting?.subject_template || "🟡 {{agency_name}} chose: {{selected_option}}";
    const customBodyHtml = setting?.body_html?.trim() ? setting.body_html : null;

    const displayAgency = agency_name?.trim() || agency_slug?.trim() || "Unknown Agency";
    const stateName = stateNameFromSlug(state_slug);

    const subject = subjectTemplate
      .replace(/\{\{agency_name\}\}/g, displayAgency)
      .replace(/\{\{agency\}\}/g, displayAgency)
      .replace(/\{\{selected_option\}\}/g, selectedOption)
      .replace(/\{\{state\}\}/g, stateName)
      .replace(/\{\{state_slug\}\}/g, state_slug ?? "");

    const adminUrl = agency_id
      ? `${BASE_URL}/wp-admin/email/agency-lookup?agency_id=${encodeURIComponent(agency_id)}`
      : agency_slug
        ? `${BASE_URL}/wp-admin/email/agency-lookup?agency_slug=${encodeURIComponent(agency_slug)}`
        : `${BASE_URL}/wp-admin/submissions`;

    const profileUrl = agency_slug ? `${BASE_URL}/your-agency/${agency_slug}` : "";
    const requestReplayUrl = buildRequestReplayUrl(agency_slug, agency_id, state_slug);
    const activationUrl = page_url || "";
    const funnelAnalyticsUrl = `${BASE_URL}/wp-admin/analytics/agency-funnel`;

    const priceFormatted = selected_price != null
      ? (selected_price % 1 === 0 ? `$${selected_price}` : `$${selected_price.toFixed(2)}`)
      : "";

    // Fetch canonical request context (read-only)
    const { requests30d, mostRecentRequest } = await fetchCanonicalRequestContext(
      supabase, agency_id, agency_slug, state_slug,
    );

    let emailHtml: string;

    if (customBodyHtml) {
      emailHtml = customBodyHtml
        .replace(/\{\{agency\}\}/g, escHtml(displayAgency))
        .replace(/\{\{agency_name\}\}/g, escHtml(displayAgency))
        .replace(/\{\{agency_slug\}\}/g, escHtml(agency_slug ?? ""))
        .replace(/\{\{state\}\}/g, escHtml(stateName))
        .replace(/\{\{state_slug\}\}/g, escHtml(state_slug ?? ""))
        .replace(/\{\{selected_option\}\}/g, escHtml(selectedOption))
        .replace(/\{\{selected_option_type\}\}/g, escHtml(option_type ?? ""))
        .replace(/\{\{selected_rank\}\}/g, escHtml(selected_rank != null ? String(selected_rank) : ""))
        .replace(/\{\{selected_price\}\}/g, escHtml(priceFormatted))
        .replace(/\{\{discount_percent\}\}/g, escHtml(discount_percent != null ? String(discount_percent) : ""))
        .replace(/\{\{next_destination\}\}/g, escHtml(next_destination ?? ""))
        .replace(/\{\{your_agency_url\}\}/g, escHtml(profileUrl))
        .replace(/\{\{request_replay_url\}\}/g, escHtml(requestReplayUrl))
        .replace(/\{\{activation_url\}\}/g, escHtml(activationUrl))
        .replace(/\{\{admin_url\}\}/g, escHtml(adminUrl))
        .replace(/\{\{requests_30d\}\}/g, escHtml(String(requests30d)))
        .replace(/\{\{most_recent_request\}\}/g, escHtml(mostRecentRequest ?? ""))
        .replace(/\{\{fsid\}\}/g, escHtml(fsid));
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
        label: "Selected Option",
        value: `<span style="color:#0369a1;font-weight:700;font-size:15px">${escHtml(selectedOption)}</span>`,
        highlight: true,
      });

      extraRows.push({
        label: "Next Destination",
        value: `<span style="color:#16a34a;font-weight:600">${escHtml(next_destination ?? "Unknown")}</span>`,
        highlight: true,
      });

      if (option_type) {
        extraRows.push({ label: "Option Type", value: escHtml(option_type) });
      }

      if (selected_rank != null) {
        extraRows.push({ label: "Selected Rank", value: `#${escHtml(String(selected_rank))}` });
      }

      if (priceFormatted) {
        extraRows.push({ label: "Price", value: escHtml(priceFormatted) });
      }

      if (discount_percent) {
        extraRows.push({
          label: "Discount Applied",
          value: `<span style="color:#dc2626;font-weight:600">${escHtml(String(discount_percent))}% off</span>`,
        });
      }

      // Canonical request context (read-only)
      extraRows.push({
        label: "Requests Missed (30d)",
        value: `<strong style="color:#0369a1">${requests30d}</strong>`,
        highlight: true,
      });

      if (mostRecentRequest) {
        extraRows.push({
          label: "Most Recent Request",
          value: escHtml(mostRecentRequest),
        });
      }

      if (requestReplayUrl) {
        extraRows.push({
          label: "Request Replay",
          value: `<a href="${escHtml(requestReplayUrl)}" style="color:#2563eb;text-decoration:none;font-weight:500">View Request Replay &rarr;</a>`,
        });
      }

      if (activationUrl) {
        extraRows.push({
          label: "Activation URL",
          value: `<a href="${escHtml(activationUrl)}" style="color:#2563eb;text-decoration:none;word-break:break-all">${escHtml(activationUrl)}</a>`,
        });
      }

      if (agency_id) {
        extraRows.push({
          label: "Agency ID",
          value: `<code style="font-size:12px">${escHtml(agency_id)}</code>`,
        });
      }

      extraRows.push({
        label: "Session ID (fsid)",
        value: `<code style="font-size:11px;color:#6b7280">${escHtml(fsid)}</code>`,
      });

      emailHtml = buildAdminActivityEmail({
        eventTitle: "Activation Option Selected",
        eventSubtitle: `Agency owner selected an activation option`,
        accentColor: "#ca8a04",
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

    try {
      await supabase.from("email_notification_logs").insert({
        notification_type: "activation_option_selected",
        is_test: false,
        to_emails: recipients.join(", "),
        subject,
        status: result.success ? "sent" : "failed",
        provider: "smtp",
        error_message: result.error ?? null,
        payload: {
          dedup_agency_key: dedupAgencyKey,
          fsid,
          agency_id: agency_id ?? "",
          agency_slug: agency_slug ?? "",
          agency_name: displayAgency,
          state_slug: state_slug ?? "",
          selected_option: selectedOption,
          selected_option_type: option_type ?? "",
          selected_rank: selected_rank != null ? String(selected_rank) : "",
          selected_price: priceFormatted,
          discount_percent: discount_percent != null ? String(discount_percent) : "",
          next_destination: next_destination ?? "",
          activation_url: activationUrl,
          request_replay_url: requestReplayUrl,
          requests_30d: String(requests30d),
          most_recent_request: mostRecentRequest ?? "",
        },
      });
    } catch (logErr) {
      console.error("[activation-option-selected] Log insert failed:", logErr);
    }

    return jsonResponse({ ok: true, sent: result.success, error: result.error ?? null });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[activation-option-selected] Error:", msg);
    return jsonResponse({ error: msg }, 500);
  }
});

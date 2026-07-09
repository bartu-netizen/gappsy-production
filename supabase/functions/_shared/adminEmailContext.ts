import { createClient } from "npm:@supabase/supabase-js@2";

// ─── Admin URL builder ─────────────────────────────────────────────────────────

const ADMIN_BASE = "https://www.gappsy.com";

export function buildAgencyAdminUrl(opts: {
  agency_id?: string | null;
  agency_slug?: string | null;
  email?: string | null;
}): string {
  const { agency_id, agency_slug, email } = opts;
  if (agency_id?.trim()) {
    return `${ADMIN_BASE}/wp-admin/email/agency-lookup?agency_id=${encodeURIComponent(agency_id.trim())}`;
  }
  if (agency_slug?.trim()) {
    return `${ADMIN_BASE}/wp-admin/email/agency-lookup?agency_slug=${encodeURIComponent(agency_slug.trim())}`;
  }
  if (email?.trim()) {
    return `${ADMIN_BASE}/wp-admin/email/agency-lookup?email=${encodeURIComponent(email.trim())}`;
  }
  return `${ADMIN_BASE}/wp-admin/email/agency-lookup`;
}

// ─── State slug → human-readable name ─────────────────────────────────────────

const STATE_NAMES: Record<string, string> = {
  "alabama": "Alabama",
  "alaska": "Alaska",
  "arizona": "Arizona",
  "arkansas": "Arkansas",
  "california": "California",
  "colorado": "Colorado",
  "connecticut": "Connecticut",
  "delaware": "Delaware",
  "district-of-columbia": "Washington D.C.",
  "florida": "Florida",
  "georgia": "Georgia",
  "hawaii": "Hawaii",
  "idaho": "Idaho",
  "illinois": "Illinois",
  "indiana": "Indiana",
  "iowa": "Iowa",
  "kansas": "Kansas",
  "kentucky": "Kentucky",
  "louisiana": "Louisiana",
  "maine": "Maine",
  "maryland": "Maryland",
  "massachusetts": "Massachusetts",
  "michigan": "Michigan",
  "minnesota": "Minnesota",
  "mississippi": "Mississippi",
  "missouri": "Missouri",
  "montana": "Montana",
  "nebraska": "Nebraska",
  "nevada": "Nevada",
  "new-hampshire": "New Hampshire",
  "new-jersey": "New Jersey",
  "new-mexico": "New Mexico",
  "new-york": "New York",
  "north-carolina": "North Carolina",
  "north-dakota": "North Dakota",
  "ohio": "Ohio",
  "oklahoma": "Oklahoma",
  "oregon": "Oregon",
  "pennsylvania": "Pennsylvania",
  "puerto-rico": "Puerto Rico",
  "rhode-island": "Rhode Island",
  "south-carolina": "South Carolina",
  "south-dakota": "South Dakota",
  "tennessee": "Tennessee",
  "texas": "Texas",
  "utah": "Utah",
  "vermont": "Vermont",
  "virginia": "Virginia",
  "washington": "Washington",
  "west-virginia": "West Virginia",
  "wisconsin": "Wisconsin",
  "wyoming": "Wyoming",
};

export function stateNameFromSlug(slug: string | null | undefined): string {
  if (!slug) return "Unknown";
  const normalized = slug.toLowerCase().replace(/_/g, "-");
  if (STATE_NAMES[normalized]) return STATE_NAMES[normalized];
  return normalized
    .split("-")
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(" ");
}

// ─── Source label mapping ─────────────────────────────────────────────────────

const SOURCE_LABELS: Record<string, string> = {
  your_agency_searchbar:          "Search result (/your-agency)",
  direct_profile_visit:           "Direct profile visit",
  cold_email_click:               "Cold Email Click",
  owner_preview:                  "State page owner preview",
  activation_flow:                "Activation upsell flow",
  email_campaign:                 "Email campaign",
  state_page:                     "State directory page",
  sponsored_spotlight:            "Spotlight listing",
  availability_check:             "Availability check form",
  top25_funnel:                   "Top 25 funnel",
  manage_listing_to_your_agency:  "Manage listing \u2192 /your-agency",
};

export function humanizeSource(source: string | null | undefined): string {
  const s = (source ?? "").trim();
  if (!s) return "Unknown";
  return SOURCE_LABELS[s] || s.replace(/_/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
}

// ─── Relative time ─────────────────────────────────────────────────────────────

export function relativeTime(iso: string | null | undefined): string {
  if (!iso) return "Unknown";
  const diffMs  = Date.now() - new Date(iso).getTime();
  const diffMin = Math.floor(diffMs / 60_000);
  if (diffMin < 1)  return "just now";
  if (diffMin < 60) return `${diffMin} minute${diffMin !== 1 ? "s" : ""} ago`;
  const diffHr = Math.floor(diffMin / 60);
  if (diffHr < 24)  return `${diffHr} hour${diffHr !== 1 ? "s" : ""} ago`;
  const diffDay = Math.floor(diffHr / 24);
  return `${diffDay} day${diffDay !== 1 ? "s" : ""} ago`;
}

// ─── Types ────────────────────────────────────────────────────────────────────

export type AdminActivityContext = {
  stateName:             string;
  rankLabel:             string;
  rankIsPaid:            boolean;
  profileClickCount:     number;   // times profile was clicked in last 30 days
  totalFunnelSessions:   number;   // funnel sessions last 30 days
  lastActivityRelative:  string;
  intentLevel:           "Low" | "Medium" | "High";
};

export type AdminActivityEmailOptions = {
  eventTitle:         string;
  eventSubtitle:      string;
  accentColor:        string;
  agencyName:         string;
  agencySlug:         string | null | undefined;
  profileUrl:         string;
  searchQuery:        string | null | undefined;
  source:             string | null | undefined;
  importedEmail:      string | null;
  importedEmails:     string[];
  importedEmailCount?: number;
  adminUrl:           string;
  funnelAnalyticsUrl?: string;
  context:            AdminActivityContext;
  extraRows?:         Array<{ label: string; value: string; highlight?: boolean }>;
  primaryCta?:        { label: string; url: string };
  secondaryCtas?:     Array<{ label: string; url: string }>;
  headerBadges?:      Array<{ label: string; bg?: string; color?: string; border?: string }>;
};

// ─── Context resolver ─────────────────────────────────────────────────────────

type SupabaseLike = ReturnType<typeof createClient>;

export async function resolveAdminContext(
  supabase: SupabaseLike,
  opts: {
    agency_id:    string | null | undefined;
    agency_slug:  string | null | undefined;
    agency_name:  string;
    state_slug:   string | null | undefined;
    days?:        number;
  }
): Promise<AdminActivityContext> {
  const { agency_id, agency_slug, agency_name, state_slug, days = 30 } = opts;
  const since    = new Date(Date.now() - days * 24 * 60 * 60 * 1000).toISOString();
  const stateName = stateNameFromSlug(state_slug);

  // 1. Profile click repeat count ─────────────────────────────────────────────
  let profileClickCount = 1;
  try {
    const q = supabase
      .from("your_agency_profile_clicks")
      .select("id", { count: "exact", head: true })
      .gte("created_at", since);

    if (agency_id)        q.eq("agency_id",   agency_id);
    else if (agency_slug) q.eq("agency_slug",  agency_slug);
    else                  q.ilike("agency_name", agency_name);

    const { count } = await q;
    if (typeof count === "number" && count > 0) profileClickCount = count;
  } catch (_) { /* non-fatal */ }

  // 2. Rank from top25_slots ───────────────────────────────────────────────────
  let rankLabel  = "Not in Top 25";
  let rankIsPaid = false;

  if (state_slug) {
    try {
      const q2 = supabase
        .from("top25_slots")
        .select("rank, is_paid, agency_name")
        .eq("state_slug", state_slug);

      if (agency_id)        q2.eq("agency_id",  agency_id);
      else if (agency_slug) q2.eq("agency_slug", agency_slug);
      else                  q2.ilike("agency_name", `%${agency_name}%`);

      const { data: slot } = await q2.maybeSingle();
      if (slot) {
        rankIsPaid = !!slot.is_paid;
        rankLabel  = `#${slot.rank}${slot.is_paid ? " (Paid)" : " (Free)"}`;
      } else if (agency_slug) {
        const { data: oa } = await supabase
          .from("other_agencies")
          .select("id")
          .eq("slug", agency_slug)
          .eq("is_active", true)
          .maybeSingle();
        if (oa) rankLabel = "Other Agencies section";
      }
    } catch (_) { /* non-fatal */ }
  }

  // 3. Funnel sessions ─────────────────────────────────────────────────────────
  let totalFunnelSessions   = 0;
  let lastActivityRelative  = "Unknown";

  try {
    const q3 = supabase
      .from("funnel_sessions")
      .select("id, created_at")
      .gte("created_at", since)
      .eq("is_demo", false)
      .order("created_at", { ascending: false })
      .limit(100);

    if (agency_id)        q3.eq("agency_id",  agency_id);
    else if (agency_slug) q3.eq("agency_slug", agency_slug);
    else                  q3.ilike("agency_name", `%${agency_name}%`);

    const { data: sessions } = await q3;
    totalFunnelSessions = sessions?.length ?? 0;
    if (sessions && sessions.length > 0) {
      lastActivityRelative = relativeTime(sessions[0].created_at);
    }
  } catch (_) { /* non-fatal */ }

  // 4. Intent level ────────────────────────────────────────────────────────────
  const combined = profileClickCount + totalFunnelSessions;
  let intentLevel: "Low" | "Medium" | "High" = "Low";
  if (combined >= 8 || profileClickCount >= 5) intentLevel = "High";
  else if (combined >= 3 || profileClickCount >= 2) intentLevel = "Medium";

  return {
    stateName,
    rankLabel,
    rankIsPaid,
    profileClickCount,
    totalFunnelSessions,
    lastActivityRelative,
    intentLevel,
  };
}

// ─── Email builder ─────────────────────────────────────────────────────────────

function escHtml(s: unknown): string {
  return String(s ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

export function buildAdminActivityEmail(opts: AdminActivityEmailOptions): string {
  const {
    eventTitle,
    eventSubtitle,
    accentColor,
    agencyName,
    agencySlug,
    profileUrl,
    searchQuery,
    source,
    importedEmail,
    importedEmails,
    importedEmailCount,
    adminUrl,
    funnelAnalyticsUrl,
    context,
    extraRows = [],
    primaryCta,
    secondaryCtas,
    headerBadges,
  } = opts;

  const {
    stateName,
    rankLabel,
    rankIsPaid,
    profileClickCount,
    totalFunnelSessions,
    lastActivityRelative,
    intentLevel,
  } = context;

  const intentColor = intentLevel === "High"
    ? "#16a34a" : intentLevel === "Medium" ? "#d97706" : "#6b7280";
  const intentBg = intentLevel === "High"
    ? "#f0fdf4" : intentLevel === "Medium" ? "#fffbeb" : "#f9fafb";

  const repeatBadgeColor = profileClickCount >= 5
    ? "#dc2626" : profileClickCount >= 3
    ? "#d97706" : profileClickCount >= 2
    ? "#2563eb" : "#6b7280";

  const rankBg    = rankIsPaid ? "rgba(16,185,129,0.18)" : "rgba(255,255,255,0.08)";
  const rankColor = rankIsPaid ? "#6ee7b7" : "#94a3b8";

  const emailListHtml = importedEmails.length > 1
    ? importedEmails
        .map((e) => `<li style="font-size:12px;color:#374151;margin:2px 0">${escHtml(e)}</li>`)
        .join("")
    : "";

  const resolvedEmailCount = importedEmailCount ?? importedEmails.length;
  const emailCountBadge = resolvedEmailCount > 1
    ? `<span style="margin-left:8px;font-size:11px;font-weight:600;color:#059669;background:#d1fae5;padding:2px 8px;border-radius:10px">${resolvedEmailCount} clean emails</span>`
    : "";

  const importedEmailRow = importedEmail
    ? `<tr style="background:#f0fdf4">
        <td style="padding:11px 28px;font-size:13px;color:#6b7280;width:160px;vertical-align:top">Imported Email</td>
        <td style="padding:11px 28px">
          <a href="mailto:${escHtml(importedEmail)}" style="font-size:14px;color:#059669;font-weight:600;text-decoration:none">${escHtml(importedEmail)}</a>${emailCountBadge}
          ${importedEmails.length > 1 ? `<ul style="margin:6px 0 0;padding-left:16px">${emailListHtml}</ul>` : ""}
        </td>
       </tr>`
    : `<tr>
        <td style="padding:11px 28px;font-size:13px;color:#6b7280;width:160px">Imported Email</td>
        <td style="padding:11px 28px;font-size:13px;color:#9ca3af;font-style:italic">none found</td>
       </tr>`;

  const extraRowsHtml = extraRows
    .map((r) => {
      const bg = r.highlight ? "#fefce8" : "#ffffff";
      const borderLeft = r.highlight ? "border-left:3px solid #fbbf24;" : "";
      return `<tr style="background:${bg}">
        <td style="padding:11px 28px;font-size:13px;color:#6b7280;width:160px;${borderLeft}">${escHtml(r.label)}</td>
        <td style="padding:11px 28px;font-size:14px;color:#111827;font-weight:500">${r.value}</td>
       </tr>`;
    })
    .join("");

  const primaryCtaUrl = primaryCta?.url ?? adminUrl;
  const primaryCtaLabel = primaryCta?.label ?? "Open Admin";

  const secondaryCtaList = (secondaryCtas && secondaryCtas.length > 0)
    ? secondaryCtas
    : (funnelAnalyticsUrl ? [{ label: "View Funnel Analytics", url: funnelAnalyticsUrl }] : []);

  const funnelBtn = secondaryCtaList
    .map((cta) => `<a href="${escHtml(cta.url)}" style="display:inline-block;background:#ffffff;color:#374151;padding:10px 18px;border-radius:8px;text-decoration:none;font-size:13px;font-weight:600;border:1px solid #d1d5db;margin-left:8px;margin-bottom:6px">${escHtml(cta.label)}</a>`)
    .join("");

  const headerBadgesHtml = (headerBadges && headerBadges.length > 0)
    ? headerBadges.map((b) => {
        const bg = b.bg ?? "#f3f4f6";
        const color = b.color ?? "#374151";
        const border = b.border ? `border:1px solid ${b.border};` : "";
        return `<span style="display:inline-block;background:${bg};color:${color};font-size:12px;font-weight:600;padding:4px 10px;border-radius:6px;margin-right:6px;margin-bottom:4px;${border}">${escHtml(b.label)}</span>`;
      }).join("")
    : "";

  const emailAgentCta = importedEmail
    ? `<a href="mailto:${escHtml(importedEmail)}" style="display:inline-block;color:#059669;font-size:13px;font-weight:600;text-decoration:none;padding:10px 0;margin-left:12px">&#10003; Email ${escHtml(importedEmail)}</a>`
    : "";

  const altRepeatText = profileClickCount > 1
    ? `${profileClickCount} views in last 30 days`
    : "First profile view";

  const repeatBadge = profileClickCount > 1
    ? `<span style="display:inline-block;background:${repeatBadgeColor};color:#fff;font-size:11px;font-weight:700;padding:3px 10px;border-radius:20px;margin-left:6px">${profileClickCount}&#x00D7; in 30d</span>`
    : "";

  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Helvetica,Arial,sans-serif;background:#f9fafb;padding:28px 16px;margin:0;-webkit-font-smoothing:antialiased">
<div style="max-width:600px;margin:0 auto">

  <!-- ── Main card ── -->
  <div style="background:#ffffff;border-radius:16px;border:1px solid #e5e7eb;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.06)">

    <!-- ── Header ── -->
    <div style="padding:28px 28px 24px;border-bottom:1px solid #f3f4f6">

      <!-- Event type pill -->
      <div style="margin-bottom:16px">
        <span style="display:inline-block;background:#eff6ff;color:#2563eb;font-size:11px;font-weight:700;padding:4px 12px;border-radius:20px;border:1px solid #dbeafe;letter-spacing:0.04em;text-transform:uppercase">${escHtml(eventTitle)}</span>
      </div>

      <!-- Agency name -->
      <div style="font-size:22px;font-weight:700;color:#111827;line-height:1.2;margin-bottom:6px">${escHtml(agencyName)}</div>

      <!-- Subtitle -->
      <div style="font-size:14px;color:#6b7280;margin-bottom:18px">${escHtml(eventSubtitle)}</div>

      <!-- Meta badges -->
      <div>
        <span style="display:inline-block;background:#f3f4f6;color:#374151;font-size:12px;font-weight:500;padding:4px 10px;border-radius:6px;margin-right:6px;margin-bottom:4px">${escHtml(stateName)}</span>
        <span style="display:inline-block;background:${rankIsPaid ? "#d1fae5" : "#f3f4f6"};color:${rankIsPaid ? "#065f46" : "#374151"};font-size:12px;font-weight:500;padding:4px 10px;border-radius:6px;margin-right:6px;margin-bottom:4px">${escHtml(rankLabel)}</span>
        <span style="display:inline-block;background:${intentBg};color:${intentColor};font-size:12px;font-weight:600;padding:4px 10px;border-radius:6px;border:1px solid ${intentColor}30;margin-right:6px;margin-bottom:4px">${intentLevel} Intent</span>
        ${profileClickCount > 1 ? repeatBadge : ""}
        ${headerBadgesHtml}
      </div>
    </div>

    <!-- ── Data table ── -->
    <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse">

      <!-- Section: Listing -->
      <tr>
        <td colspan="2" style="padding:16px 28px 8px;font-size:11px;font-weight:700;color:#9ca3af;letter-spacing:0.08em;text-transform:uppercase">Listing</td>
      </tr>

      ${agencySlug ? `<tr>
        <td style="padding:11px 28px;font-size:13px;color:#6b7280;width:160px">Slug</td>
        <td style="padding:11px 28px;font-size:13px;color:#374151;font-family:'Courier New',Courier,monospace;word-break:break-all">${escHtml(agencySlug)}</td>
      </tr>` : ""}

      ${profileUrl ? `<tr style="background:#f9fafb">
        <td style="padding:11px 28px;font-size:13px;color:#6b7280;vertical-align:top">Profile URL</td>
        <td style="padding:11px 28px;font-size:13px;word-break:break-all"><a href="${escHtml(profileUrl)}" style="color:#2563eb;text-decoration:none;font-weight:500">${escHtml(profileUrl)}</a></td>
      </tr>` : ""}

      <!-- Section: Activity -->
      <tr>
        <td colspan="2" style="padding:16px 28px 8px;font-size:11px;font-weight:700;color:#9ca3af;letter-spacing:0.08em;text-transform:uppercase;border-top:1px solid #f3f4f6">Activity</td>
      </tr>

      ${source ? `<tr>
        <td style="padding:11px 28px;font-size:13px;color:#6b7280;width:160px">Source</td>
        <td style="padding:11px 28px;font-size:14px;color:#111827;font-weight:500">${escHtml(humanizeSource(source))}</td>
      </tr>` : ""}

      ${searchQuery ? `<tr style="background:#f9fafb">
        <td style="padding:11px 28px;font-size:13px;color:#6b7280">Search Query</td>
        <td style="padding:11px 28px;font-size:14px;color:#111827">&ldquo;${escHtml(searchQuery)}&rdquo;</td>
      </tr>` : ""}

      <tr>
        <td style="padding:11px 28px;font-size:13px;color:#6b7280">Profile views (30d)</td>
        <td style="padding:11px 28px">
          <span style="font-size:15px;font-weight:700;color:${repeatBadgeColor}">${profileClickCount}&times;</span>
          <span style="font-size:12px;color:#9ca3af;margin-left:6px">${altRepeatText}</span>
        </td>
      </tr>

      ${totalFunnelSessions > 0 ? `<tr style="background:#f9fafb">
        <td style="padding:11px 28px;font-size:13px;color:#6b7280">Funnel sessions (30d)</td>
        <td style="padding:11px 28px;font-size:14px;color:#111827;font-weight:500">${totalFunnelSessions}</td>
      </tr>` : ""}

      <tr>
        <td style="padding:11px 28px;font-size:13px;color:#6b7280">Last activity</td>
        <td style="padding:11px 28px;font-size:14px;color:#111827">${escHtml(lastActivityRelative)}</td>
      </tr>

      ${extraRowsHtml}

      <!-- Section: Contact -->
      <tr>
        <td colspan="2" style="padding:16px 28px 8px;font-size:11px;font-weight:700;color:#9ca3af;letter-spacing:0.08em;text-transform:uppercase;border-top:1px solid #f3f4f6">Contact</td>
      </tr>

      ${importedEmailRow}

    </table>

    <!-- ── CTA strip ── -->
    <div style="padding:20px 28px;border-top:1px solid #f3f4f6;background:#f9fafb">
      <a href="${escHtml(primaryCtaUrl)}" style="display:inline-block;background:#4f46e5;color:#ffffff;padding:12px 22px;border-radius:8px;text-decoration:none;font-size:14px;font-weight:600;margin-bottom:6px">${escHtml(primaryCtaLabel)}</a>
      ${funnelBtn}
      ${emailAgentCta}
    </div>

  </div>

  <!-- ── Footer ── -->
  <div style="text-align:center;padding:16px 0 4px;font-size:12px;color:#9ca3af">
    Gappsy Admin &middot; Notification
  </div>

</div>
</body></html>`;
}

import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { sendEmail } from "../_shared/emailClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

const RECIPIENT = "bartu@gappsy.com";
const AMSTERDAM_OFFSET_MS = 2 * 60 * 60 * 1000; // CEST (UTC+2 in summer)

function getAmsterdamDate(d: Date): string {
  return new Intl.DateTimeFormat("en-CA", { timeZone: "Europe/Amsterdam", year: "numeric", month: "2-digit", day: "2-digit" }).format(d);
}

function formatDateLong(d: Date): string {
  return new Intl.DateTimeFormat("en-US", { timeZone: "Europe/Amsterdam", month: "long", day: "numeric", year: "numeric" }).format(d);
}

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function pct(num: number, denom: number): string {
  if (denom === 0) return "0.0%";
  return ((num / denom) * 100).toFixed(1) + "%";
}

function escHtml(s: unknown): string {
  return String(s ?? "").replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
}

interface HotLead {
  agency_name: string;
  state_slug: string;
  views: number;
  deepest_step: string;
  repeat_count: number;
  last_activity: string;
  checkout_opened: boolean;
  discount_viewed: boolean;
  purchased: boolean;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  try {
    const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
    const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    // Determine yesterday in Amsterdam timezone
    const now = new Date();
    const yesterdayAmsterdam = new Date(now.getTime() - 24 * 60 * 60 * 1000);
    const reportDate = getAmsterdamDate(yesterdayAmsterdam);
    const reportDateLong = formatDateLong(yesterdayAmsterdam);

    // Calculate UTC bounds for yesterday Amsterdam (00:00 - 23:59:59)
    // Use Intl to get the actual timezone offset
    const startOfDay = new Date(`${reportDate}T00:00:00+02:00`);
    const endOfDay = new Date(`${reportDate}T23:59:59.999+02:00`);
    const startISO = startOfDay.toISOString();
    const endISO = endOfDay.toISOString();

    // ── DEDUPLICATION: Check if already sent for this date ──
    const { data: existingLog } = await supabase
      .from("email_notification_logs")
      .select("id")
      .eq("notification_type", "daily_funnel_summary")
      .eq("status", "sent")
      .filter("payload->>report_date", "eq", reportDate)
      .limit(1)
      .maybeSingle();

    if (existingLog) {
      return jsonResponse({ ok: true, skipped: "already_sent_for_date", report_date: reportDate });
    }

    // ══════════════════════════════════════════════════════════════
    // 1. FUNNEL EVENTS AGGREGATION
    // ══════════════════════════════════════════════════════════════

    // Your Agency funnel events (activation flow)
    const { data: yafeRaw } = await supabase
      .from("funnel_events")
      .select("event_name, fsid, metadata, created_at")
      .gte("created_at", startISO)
      .lte("created_at", endISO)
      .eq("is_demo", false)
      .in("funnel_name", ["your_agency", "standard_checkout", "other_listing", "top25"]);

    const yafe = yafeRaw ?? [];

    // Manage funnel events
    const { data: mfeRaw } = await supabase
      .from("manage_funnel_events")
      .select("event_type, agency_id, agency_name, state_slug, created_at")
      .gte("created_at", startISO)
      .lte("created_at", endISO);

    const mfe = mfeRaw ?? [];

    // Replay funnel events
    const { data: replayRaw } = await supabase
      .from("funnel_events")
      .select("event_name, fsid, metadata, created_at")
      .gte("created_at", startISO)
      .lte("created_at", endISO)
      .eq("funnel_name", "request_replay");

    const replays = replayRaw ?? [];

    // Your-agency search/view events
    const { data: yaSearchRaw } = await supabase
      .from("your_agency_funnel_events")
      .select("event_name, agency_id, agency_slug, state_slug, meta, created_at")
      .gte("created_at", startISO)
      .lte("created_at", endISO);

    const yaSearch = yaSearchRaw ?? [];

    // Stripe orders (purchases)
    const { data: ordersRaw } = await supabase
      .from("stripe_orders")
      .select("id, amount_total, customer_name, agency_name, state_slug, source_listing_type, discount_percentage, paid_at, created_at")
      .eq("payment_status", "paid")
      .gte("created_at", startISO)
      .lte("created_at", endISO);

    const orders = ordersRaw ?? [];

    // Email notification logs for activation page views (to get agency identity)
    const { data: activationLogsRaw } = await supabase
      .from("email_notification_logs")
      .select("payload, created_at")
      .eq("notification_type", "activation_page_viewed")
      .eq("status", "sent")
      .gte("created_at", startISO)
      .lte("created_at", endISO);

    const activationLogs = activationLogsRaw ?? [];

    // Discount offer opens (from funnel events metadata)
    const { data: discountOffersRaw } = await supabase
      .from("discount_offers")
      .select("token, discount_value, agency_slug, state_slug, usage_count, created_at")
      .gte("created_at", startISO)
      .lte("created_at", endISO);

    const newDiscountOffers = discountOffersRaw ?? [];

    // ══════════════════════════════════════════════════════════════
    // 2. COMPUTE KPIs
    // ══════════════════════════════════════════════════════════════

    const activationViews = yafe.filter(e => e.event_name === "activation_page_viewed");
    const checkoutViews = yafe.filter(e => e.event_name === "checkout_page_viewed");
    const checkoutCompleted = yafe.filter(e => e.event_name === "checkout_completed");

    const uniqueFsids = new Set(yafe.map(e => e.fsid).filter(Boolean));
    const uniqueActivationFsids = new Set(activationViews.map(e => e.fsid).filter(Boolean));
    const uniqueCheckoutFsids = new Set(checkoutViews.map(e => e.fsid).filter(Boolean));

    const replayOpens = replays.filter(e => e.event_name === "replay_opened");
    const manageFunnelOpens = mfe.filter(e => e.event_type === "manage_funnel_opened");
    const yaPageViews = yaSearch.filter(e => e.event_name === "your_agency_page_view" || e.event_name === "your_agency_result_view");

    const purchaseCount = orders.length;
    const standardPurchases = orders.filter(o => !o.source_listing_type || o.source_listing_type === "standard" || o.source_listing_type === "activation");
    const top25Purchases = orders.filter(o => o.source_listing_type === "top25" || o.source_listing_type === "top25_claim_bundle");

    const totalRevenueCents = orders.reduce((sum, o) => sum + (o.amount_total || 0), 0);
    const totalRevenue = (totalRevenueCents / 100).toFixed(2);
    const estimatedMRR = (totalRevenueCents / 100 / 6).toFixed(2);

    const activationToPaidPct = pct(purchaseCount, uniqueActivationFsids.size);

    // ══════════════════════════════════════════════════════════════
    // 3. HOT LEADS ANALYSIS
    // ══════════════════════════════════════════════════════════════

    // Group activation logs by agency
    const agencyMap = new Map<string, {
      agency_name: string;
      state_slug: string;
      views: number;
      events: string[];
      last_activity: string;
      checkout_opened: boolean;
      discount_viewed: boolean;
    }>();

    for (const log of activationLogs) {
      const p = log.payload as Record<string, string> | null;
      if (!p) continue;
      const key = p.agency_id || p.agency_slug || p.agency_name || "unknown";
      const existing = agencyMap.get(key);
      if (existing) {
        existing.views++;
        if (log.created_at > existing.last_activity) existing.last_activity = log.created_at;
      } else {
        agencyMap.set(key, {
          agency_name: p.agency_name || p.agency_slug || "Unknown",
          state_slug: p.state_slug || "",
          views: 1,
          events: [],
          last_activity: log.created_at,
          checkout_opened: false,
          discount_viewed: false,
        });
      }
    }

    // Enrich with checkout data from funnel_events metadata
    for (const ev of checkoutViews) {
      const meta = ev.metadata as Record<string, unknown> | null;
      const agencyName = (meta?.agency_name as string) || "";
      const agencyId = (meta?.agency_id as string) || "";
      const key = agencyId || agencyName;
      if (key && agencyMap.has(key)) {
        agencyMap.get(key)!.checkout_opened = true;
      }
    }

    // Purchased agency keys
    const purchasedKeys = new Set<string>();
    for (const o of orders) {
      if (o.agency_name) purchasedKeys.add(o.agency_name);
    }

    // Build hot leads list (non-purchased, sorted by intent signals)
    const hotLeads: HotLead[] = [];
    for (const [_key, data] of agencyMap) {
      if (purchasedKeys.has(data.agency_name)) continue;
      hotLeads.push({
        agency_name: data.agency_name,
        state_slug: data.state_slug,
        views: data.views,
        deepest_step: data.checkout_opened ? "Checkout Opened" : "Activation Page",
        repeat_count: data.views,
        last_activity: data.last_activity,
        checkout_opened: data.checkout_opened,
        discount_viewed: data.discount_viewed,
        purchased: false,
      });
    }

    hotLeads.sort((a, b) => {
      if (a.checkout_opened !== b.checkout_opened) return a.checkout_opened ? -1 : 1;
      if (a.views !== b.views) return b.views - a.views;
      return 0;
    });

    const topHotLeads = hotLeads.slice(0, 10);

    // High repeat visitors (3+ views, no purchase)
    const highRepeat = hotLeads.filter(l => l.views >= 3).sort((a, b) => b.views - a.views).slice(0, 8);

    // Follow-up opportunities (checkout opened but no purchase, or high views)
    const followUps = hotLeads
      .filter(l => l.checkout_opened || l.views >= 3)
      .sort((a, b) => {
        if (a.checkout_opened !== b.checkout_opened) return a.checkout_opened ? -1 : 1;
        return b.views - a.views;
      })
      .slice(0, 8);

    // ══════════════════════════════════════════════════════════════
    // 4. DISCOUNT INTELLIGENCE
    // ══════════════════════════════════════════════════════════════

    // Check discount-related purchases
    const discountPurchases15 = orders.filter(o => o.discount_percentage && Number(o.discount_percentage) >= 14 && Number(o.discount_percentage) <= 16);
    const discountPurchases20 = orders.filter(o => o.discount_percentage && Number(o.discount_percentage) >= 19 && Number(o.discount_percentage) <= 21);
    const discountPurchases25 = orders.filter(o => o.discount_percentage && Number(o.discount_percentage) >= 24 && Number(o.discount_percentage) <= 26);

    // Discount offer views from email_notification_logs
    const { data: discountViewLogs } = await supabase
      .from("email_notification_logs")
      .select("payload")
      .eq("notification_type", "activation_page_viewed")
      .eq("status", "sent")
      .gte("created_at", startISO)
      .lte("created_at", endISO);

    let discount15Opens = 0;
    let discount20Opens = 0;
    let discount25Opens = 0;
    for (const log of (discountViewLogs ?? [])) {
      const p = log.payload as Record<string, string> | null;
      if (!p) continue;
      // Count based on page_url containing offer tokens or listing_type patterns
      const url = p.page_url || "";
      if (url.includes("offer=") || url.includes("ot=")) {
        // Rough heuristic: count all as potential discount views
        discount15Opens++;
      }
    }

    // Use actual created discount offers for better count
    const offers15 = newDiscountOffers.filter(o => Number(o.discount_value) === 15);
    const offers20 = newDiscountOffers.filter(o => Number(o.discount_value) === 20);
    const offers25 = newDiscountOffers.filter(o => Number(o.discount_value) === 25);

    // ══════════════════════════════════════════════════════════════
    // 5. BUILD EMAIL HTML
    // ══════════════════════════════════════════════════════════════

    const hotLeadsHtml = topHotLeads.length > 0
      ? topHotLeads.map(l => `
        <tr style="border-bottom:1px solid #f1f5f9">
          <td style="padding:8px 12px;font-weight:600;color:#1e293b">${escHtml(l.agency_name)}</td>
          <td style="padding:8px 12px;color:#64748b">${escHtml(l.state_slug?.replace(/-/g, " ") || "—")}</td>
          <td style="padding:8px 12px;text-align:center;font-weight:700;color:#0369a1">${l.views}</td>
          <td style="padding:8px 12px">${l.checkout_opened ? '<span style="color:#dc2626;font-weight:700">Checkout</span>' : '<span style="color:#6b7280">Activation</span>'}</td>
          <td style="padding:8px 12px;text-align:center">${l.repeat_count}x</td>
        </tr>`).join("")
      : '<tr><td colspan="5" style="padding:12px;color:#94a3b8;text-align:center">No hot leads yesterday</td></tr>';

    const repeatVisitorsHtml = highRepeat.length > 0
      ? highRepeat.map(l => `<li style="padding:4px 0;color:#334155"><strong>${escHtml(l.agency_name)}</strong> — returned ${l.views}x${l.state_slug ? ` (${escHtml(l.state_slug.replace(/-/g, " "))})` : ""}</li>`).join("")
      : '<li style="color:#94a3b8">No high-repeat visitors yesterday</li>';

    const followUpHtml = followUps.length > 0
      ? followUps.map(l => {
        const reason = l.checkout_opened ? "Checkout opened, no purchase" : `${l.views} activation views`;
        return `<tr style="border-bottom:1px solid #f1f5f9">
          <td style="padding:8px 12px;font-weight:600;color:#1e293b">${escHtml(l.agency_name)}</td>
          <td style="padding:8px 12px;color:#64748b">${escHtml(l.state_slug?.replace(/-/g, " ") || "—")}</td>
          <td style="padding:8px 12px;color:#b45309;font-size:13px">${escHtml(reason)}</td>
        </tr>`;
      }).join("")
      : '<tr><td colspan="3" style="padding:12px;color:#94a3b8;text-align:center">No follow-up opportunities</td></tr>';

    const revenueItems = orders.map(o => `<li style="padding:3px 0;color:#334155"><strong>${escHtml(o.customer_name || o.agency_name || "Unknown")}</strong> — $${((o.amount_total || 0) / 100).toFixed(2)}${o.state_slug ? ` (${escHtml(o.state_slug.replace(/-/g, " "))})` : ""}${o.discount_percentage ? ` · ${o.discount_percentage}% discount` : ""}</li>`).join("");

    const emailHtml = `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f8fafc;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif">
<div style="max-width:680px;margin:0 auto;padding:24px 16px">

<!-- Header -->
<div style="background:linear-gradient(135deg,#0f172a 0%,#1e3a5f 100%);border-radius:12px;padding:32px 28px;margin-bottom:24px">
  <h1 style="margin:0 0 4px;color:#ffffff;font-size:22px;font-weight:700;letter-spacing:-0.3px">Daily Funnel Intelligence</h1>
  <p style="margin:0;color:#94a3b8;font-size:14px">${escHtml(reportDateLong)} — Gappsy Executive Summary</p>
</div>

<!-- KPI Summary -->
<div style="background:#ffffff;border-radius:10px;border:1px solid #e2e8f0;padding:24px;margin-bottom:20px">
  <h2 style="margin:0 0 16px;font-size:15px;color:#0f172a;text-transform:uppercase;letter-spacing:0.5px;border-bottom:2px solid #0ea5e9;padding-bottom:8px">Top KPI Summary</h2>
  <table style="width:100%;border-collapse:collapse;font-size:14px">
    <tr><td style="padding:6px 0;color:#64748b">Unique Sessions (fsid)</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${uniqueFsids.size}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Activation Page Views</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${activationViews.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Checkout Opens</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${checkoutViews.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Purchases</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#16a34a">${purchaseCount}</td></tr>
    <tr style="border-top:1px solid #f1f5f9"><td style="padding:8px 0;color:#64748b;font-weight:600">Activation → Paid</td><td style="padding:8px 0;text-align:right;font-weight:700;color:#dc2626;font-size:16px">${activationToPaidPct}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Replay Opens</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${replayOpens.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Manage Listing Opens</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${manageFunnelOpens.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Your-Agency Page Views</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${yaPageViews.length}</td></tr>
  </table>
</div>

<!-- Hot Leads -->
<div style="background:#ffffff;border-radius:10px;border:1px solid #e2e8f0;padding:24px;margin-bottom:20px">
  <h2 style="margin:0 0 16px;font-size:15px;color:#0f172a;text-transform:uppercase;letter-spacing:0.5px;border-bottom:2px solid #dc2626;padding-bottom:8px">Hot Leads</h2>
  <table style="width:100%;border-collapse:collapse;font-size:13px">
    <thead><tr style="background:#f8fafc">
      <th style="padding:8px 12px;text-align:left;color:#64748b;font-weight:600">Agency</th>
      <th style="padding:8px 12px;text-align:left;color:#64748b;font-weight:600">State</th>
      <th style="padding:8px 12px;text-align:center;color:#64748b;font-weight:600">Views</th>
      <th style="padding:8px 12px;text-align:left;color:#64748b;font-weight:600">Deepest</th>
      <th style="padding:8px 12px;text-align:center;color:#64748b;font-weight:600">Repeat</th>
    </tr></thead>
    <tbody>${hotLeadsHtml}</tbody>
  </table>
</div>

<!-- Funnel Breakdown -->
<div style="background:#ffffff;border-radius:10px;border:1px solid #e2e8f0;padding:24px;margin-bottom:20px">
  <h2 style="margin:0 0 16px;font-size:15px;color:#0f172a;text-transform:uppercase;letter-spacing:0.5px;border-bottom:2px solid #0ea5e9;padding-bottom:8px">Funnel Breakdown</h2>
  <table style="width:100%;border-collapse:collapse;font-size:14px">
    <tr><td style="padding:6px 0;color:#64748b">/your-agency opens</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${yaPageViews.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Request replay opens</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${replayOpens.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Manage listing opens</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${manageFunnelOpens.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Activation page opens</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${activationViews.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Checkout opens</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0f172a">${checkoutViews.length}</td></tr>
    <tr style="border-top:1px solid #f1f5f9"><td style="padding:8px 0;color:#16a34a;font-weight:600">Purchases</td><td style="padding:8px 0;text-align:right;font-weight:700;color:#16a34a;font-size:16px">${purchaseCount}</td></tr>
  </table>
</div>

<!-- Discount Intelligence -->
<div style="background:#ffffff;border-radius:10px;border:1px solid #e2e8f0;padding:24px;margin-bottom:20px">
  <h2 style="margin:0 0 16px;font-size:15px;color:#0f172a;text-transform:uppercase;letter-spacing:0.5px;border-bottom:2px solid #f59e0b;padding-bottom:8px">Discount Intelligence</h2>
  <table style="width:100%;border-collapse:collapse;font-size:14px">
    <tr><td style="padding:6px 0;color:#64748b">15% offers created</td><td style="padding:6px 0;text-align:right;font-weight:700">${offers15.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">20% offers created</td><td style="padding:6px 0;text-align:right;font-weight:700">${offers20.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">25% offers created</td><td style="padding:6px 0;text-align:right;font-weight:700">${offers25.length}</td></tr>
    <tr style="border-top:1px solid #f1f5f9"><td style="padding:8px 0;color:#64748b">15% conversions</td><td style="padding:8px 0;text-align:right;font-weight:700;color:#16a34a">${discountPurchases15.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">20% conversions</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#16a34a">${discountPurchases20.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">25% conversions</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#16a34a">${discountPurchases25.length}</td></tr>
  </table>
</div>

<!-- High Repeat Visitors -->
<div style="background:#ffffff;border-radius:10px;border:1px solid #e2e8f0;padding:24px;margin-bottom:20px">
  <h2 style="margin:0 0 16px;font-size:15px;color:#0f172a;text-transform:uppercase;letter-spacing:0.5px;border-bottom:2px solid #8b5cf6;padding-bottom:8px">High Repeat Visitors</h2>
  <ul style="margin:0;padding:0 0 0 16px;font-size:14px;line-height:1.8">${repeatVisitorsHtml}</ul>
</div>

<!-- Revenue Summary -->
<div style="background:#ffffff;border-radius:10px;border:1px solid #e2e8f0;padding:24px;margin-bottom:20px">
  <h2 style="margin:0 0 16px;font-size:15px;color:#0f172a;text-transform:uppercase;letter-spacing:0.5px;border-bottom:2px solid #16a34a;padding-bottom:8px">Revenue Summary</h2>
  <table style="width:100%;border-collapse:collapse;font-size:14px">
    <tr><td style="padding:6px 0;color:#64748b">Total Purchases</td><td style="padding:6px 0;text-align:right;font-weight:700">${purchaseCount}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Standard Listings</td><td style="padding:6px 0;text-align:right;font-weight:700">${standardPurchases.length}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Top-25 Upgrades</td><td style="padding:6px 0;text-align:right;font-weight:700">${top25Purchases.length}</td></tr>
    <tr style="border-top:1px solid #f1f5f9"><td style="padding:8px 0;color:#16a34a;font-weight:600">Revenue (6-month)</td><td style="padding:8px 0;text-align:right;font-weight:700;color:#16a34a;font-size:16px">$${totalRevenue}</td></tr>
    <tr><td style="padding:6px 0;color:#64748b">Estimated MRR Equivalent</td><td style="padding:6px 0;text-align:right;font-weight:700;color:#0369a1">$${estimatedMRR}/mo</td></tr>
  </table>
  ${orders.length > 0 ? `<div style="margin-top:12px;padding-top:12px;border-top:1px solid #f1f5f9"><p style="margin:0 0 6px;font-size:12px;color:#64748b;font-weight:600">Transactions:</p><ul style="margin:0;padding:0 0 0 16px;font-size:13px">${revenueItems}</ul></div>` : ""}
</div>

<!-- Follow-Up Opportunities -->
<div style="background:#ffffff;border-radius:10px;border:1px solid #e2e8f0;padding:24px;margin-bottom:20px">
  <h2 style="margin:0 0 16px;font-size:15px;color:#0f172a;text-transform:uppercase;letter-spacing:0.5px;border-bottom:2px solid #b45309;padding-bottom:8px">Top Follow-Up Opportunities</h2>
  <table style="width:100%;border-collapse:collapse;font-size:13px">
    <thead><tr style="background:#f8fafc">
      <th style="padding:8px 12px;text-align:left;color:#64748b;font-weight:600">Agency</th>
      <th style="padding:8px 12px;text-align:left;color:#64748b;font-weight:600">State</th>
      <th style="padding:8px 12px;text-align:left;color:#64748b;font-weight:600">Reason</th>
    </tr></thead>
    <tbody>${followUpHtml}</tbody>
  </table>
</div>

<!-- Footer -->
<div style="text-align:center;padding:20px 0;color:#94a3b8;font-size:12px">
  <p style="margin:0">Gappsy Daily Funnel Intelligence — ${escHtml(reportDateLong)}</p>
  <p style="margin:4px 0 0">Automated report. Data covers 00:00–23:59 Europe/Amsterdam.</p>
</div>

</div>
</body>
</html>`;

    const subject = `Daily Gappsy Funnel Summary \u2014 ${reportDateLong}`;

    // ── Send email ──
    const result = await sendEmail({
      to: RECIPIENT,
      subject,
      html: emailHtml,
    });

    // ── Log to prevent duplicates ──
    try {
      await supabase.from("email_notification_logs").insert({
        notification_type: "daily_funnel_summary",
        is_test: false,
        to_emails: RECIPIENT,
        subject,
        status: result.success ? "sent" : "failed",
        provider: "smtp",
        error_message: result.error ?? null,
        payload: {
          report_date: reportDate,
          kpis: {
            unique_sessions: uniqueFsids.size,
            activation_views: activationViews.length,
            checkout_opens: checkoutViews.length,
            purchases: purchaseCount,
            revenue_cents: totalRevenueCents,
            replay_opens: replayOpens.length,
            manage_opens: manageFunnelOpens.length,
            ya_views: yaPageViews.length,
          },
          hot_leads_count: topHotLeads.length,
          follow_up_count: followUps.length,
        },
      });
    } catch (logErr) {
      console.error("[daily-funnel-summary] Log insert failed:", logErr);
    }

    return jsonResponse({
      ok: true,
      sent: result.success,
      report_date: reportDate,
      kpis: {
        unique_sessions: uniqueFsids.size,
        activation_views: activationViews.length,
        checkout_opens: checkoutViews.length,
        purchases: purchaseCount,
      },
    });

  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[daily-funnel-summary] Error:", msg);
    return jsonResponse({ error: msg }, 500);
  }
});

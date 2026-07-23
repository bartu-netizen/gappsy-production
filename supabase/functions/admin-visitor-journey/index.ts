// deno-lint-ignore-file no-explicit-any
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { classifyTrafficSource } from "../_shared/trafficSource.ts";

// Read-only "visitor journey" surface for /wp-admin — lets an admin search
// visitors (by visitor_id or a contact_email captured on their funnel
// session) and see one visitor's entire cross-site history in one
// chronological timeline. Backed by the six tables that share the
// gappsy_visitor_id identity (see 20260723060000_unified_visitor_tracking.sql)
// plus the vendor payment tables joined in for paid status.
//
// POST { action: "list_visitors", search?, from?, to?, only_paid?, limit?, offset? }
//   -> { ok: true, visitors: [...] }, backed by list_visitor_summaries() RPC
//      (20260723070000_visitor_journey_rpc.sql).
// POST { action: "visitor_timeline", visitor_id }
//   -> { ok: true, summary, timeline: [...] }

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

// Display-only estimate mirroring vendor-onboarding/index.ts's pricing
// consts — never used for billing or reconciliation, just so the timeline
// can show an approximate amount next to a payment event. The real amount
// of record always lives in Stripe.
const CLAIM_PRICE_AMOUNT_CENTS = 2900; // $29 one-time
const GROWTH_PRICE_AMOUNT_CENTS: Record<string, number> = { month: 8900, year: 69900 };
function estimateAmountCents(product: string | null, billingInterval: string | null): number | null {
  if (product === "claim") return CLAIM_PRICE_AMOUNT_CENTS;
  if (product === "growth" && billingInterval) return GROWTH_PRICE_AMOUNT_CENTS[billingInterval] ?? null;
  return null;
}

type TimelineEvent = {
  timestamp: string;
  type: "page_view" | "tool_page_view" | "search" | "chat" | "outbound_click" | "funnel_event";
  label: string;
  detail: Record<string, unknown>;
};

const LINK_TYPE_LABELS: Record<string, string> = {
  visit_website: "Visit Website",
  affiliate: "Affiliate Link",
  claim_listing: "Claim Listing",
  get_featured: "Get Featured",
  other: "an Outbound Link",
};

// Best-effort per source — a single failed query (bad join, transient
// error) should never 500 the whole timeline. Logs and returns [] instead.
async function safeQuery<T>(label: string, run: () => PromiseLike<{ data: T[] | null; error: { message: string } | null }>): Promise<T[]> {
  try {
    const { data, error } = await run();
    if (error) {
      console.error(`[admin-visitor-journey] ${label} error:`, error.message);
      return [];
    }
    return data || [];
  } catch (err) {
    console.error(`[admin-visitor-journey] ${label} exception:`, err);
    return [];
  }
}

function latestNonNull(rows: Array<{ created_at: string } & Record<string, unknown>>, field: string): unknown {
  let best: { created_at: string; value: unknown } | null = null;
  for (const row of rows) {
    const value = row[field];
    if (value === null || value === undefined || value === "") continue;
    if (!best || new Date(row.created_at).getTime() > new Date(best.created_at).getTime()) {
      best = { created_at: row.created_at, value };
    }
  }
  return best?.value ?? null;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    let payload: Record<string, unknown>;
    try {
      payload = await req.json();
    } catch {
      return jsonResponse({ ok: false, error: "Invalid JSON body" }, 400);
    }
    const action = typeof payload.action === "string" ? payload.action : null;

    if (action === "list_visitors") {
      const search = typeof payload.search === "string" && payload.search.trim() ? payload.search.trim() : null;
      const from = typeof payload.from === "string" && payload.from ? payload.from : null;
      const to = typeof payload.to === "string" && payload.to ? payload.to : null;
      const onlyPaid = payload.only_paid === true;
      const limit = typeof payload.limit === "number" && payload.limit > 0 ? Math.min(payload.limit, 500) : 50;
      const offset = typeof payload.offset === "number" && payload.offset >= 0 ? payload.offset : 0;

      const { data, error } = await supabase.rpc("list_visitor_summaries", {
        p_search: search,
        p_from: from,
        p_to: to,
        p_only_paid: onlyPaid,
        p_limit: limit,
        p_offset: offset,
      });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const visitors = (data || []).map((row: any) => ({
        ...row,
        traffic_source: classifyTrafficSource(row.utm_source ?? null, row.referrer ?? null),
      }));

      return jsonResponse({ ok: true, visitors });
    }

    if (action === "visitor_timeline") {
      const visitorId = typeof payload.visitor_id === "string" ? payload.visitor_id.trim() : "";
      if (!visitorId) return jsonResponse({ ok: false, error: "visitor_id is required" }, 400);

      const [sitePageViews, toolPageViews, toolOutboundClicks, smartSearchLogs, toolChatMessages, vendorOnboardingSessions, vendorFunnelEvents] = await Promise.all([
        safeQuery("site_page_views", () =>
          supabase
            .from("site_page_views")
            .select("id, path, referrer, utm_source, utm_medium, utm_campaign, country_name, city, duration_seconds, created_at")
            .eq("visitor_id", visitorId)
        ),
        safeQuery("tool_page_views", () =>
          supabase
            .from("tool_page_views")
            .select("id, tool_id, utm_source, utm_medium, utm_campaign, referrer, duration_seconds, country_name, created_at, tools(name, slug)")
            .eq("visitor_id", visitorId)
        ),
        safeQuery("tool_outbound_clicks", () =>
          supabase
            .from("tool_outbound_clicks")
            .select("id, tool_id, link_type, destination_url, referrer, country_name, created_at, tools(name, slug)")
            .eq("visitor_id", visitorId)
        ),
        safeQuery("smart_search_logs", () =>
          supabase
            .from("smart_search_logs")
            .select("id, query, result_type, result_path, city, country_code, country_name, created_at")
            .eq("visitor_id", visitorId)
        ),
        safeQuery("tool_chat_messages", () =>
          supabase
            .from("tool_chat_messages")
            .select("id, session_id, tool_id, role, content, created_at, tools(name, slug)")
            .eq("visitor_id", visitorId)
        ),
        safeQuery("vendor_onboarding_sessions", () =>
          supabase
            .from("vendor_onboarding_sessions")
            .select(
              "id, status, contact_email, matched_tool_id, matched_discovered_tool_id, utm_source, utm_medium, utm_campaign, referrer, landing_page, stripe_checkout_session_id, created_at"
            )
            .eq("visitor_id", visitorId)
        ),
        safeQuery("vendor_funnel_events", () =>
          supabase
            .from("vendor_funnel_events")
            .select("id, onboarding_session_id, event_name, metadata, created_at")
            .eq("visitor_id", visitorId)
        ),
      ]);

      const onboardingSessionIds = vendorOnboardingSessions.map((s: any) => s.id).filter(Boolean);
      const vendorFeatureSubscriptions = onboardingSessionIds.length
        ? await safeQuery("vendor_feature_subscriptions", () =>
            supabase
              .from("vendor_feature_subscriptions")
              .select("id, onboarding_session_id, tool_id, discovered_tool_id, status, product, billing_interval, created_at, canceled_at")
              .in("onboarding_session_id", onboardingSessionIds)
          )
        : [];

      const timeline: TimelineEvent[] = [];

      for (const row of sitePageViews as any[]) {
        timeline.push({ timestamp: row.created_at, type: "page_view", label: `Viewed ${row.path}`, detail: row });
      }
      for (const row of toolPageViews as any[]) {
        const toolName = row.tools?.name || row.tools?.slug || "a tool";
        timeline.push({ timestamp: row.created_at, type: "tool_page_view", label: `Viewed tool page: ${toolName}`, detail: row });
      }
      for (const row of toolOutboundClicks as any[]) {
        const toolName = row.tools?.name || row.tools?.slug || "a tool";
        const linkLabel = LINK_TYPE_LABELS[row.link_type] || "an Outbound Link";
        timeline.push({ timestamp: row.created_at, type: "outbound_click", label: `Clicked ${linkLabel} on ${toolName}`, detail: row });
      }
      for (const row of smartSearchLogs as any[]) {
        timeline.push({ timestamp: row.created_at, type: "search", label: `Searched "${row.query}"`, detail: row });
      }
      for (const row of toolChatMessages as any[]) {
        const toolName = row.tools?.name || row.tools?.slug || "a tool";
        const snippet = typeof row.content === "string" ? row.content.slice(0, 120) : "";
        const label = row.role === "user" ? `Chat: "${snippet}"` : `Chat reply (${toolName}): "${snippet}"`;
        timeline.push({ timestamp: row.created_at, type: "chat", label, detail: row });
      }
      for (const row of vendorOnboardingSessions as any[]) {
        timeline.push({ timestamp: row.created_at, type: "funnel_event", label: `Funnel: session ${row.status}`, detail: row });
      }
      for (const row of vendorFunnelEvents as any[]) {
        timeline.push({ timestamp: row.created_at, type: "funnel_event", label: `Funnel: ${row.event_name}`, detail: row });
      }
      for (const row of vendorFeatureSubscriptions as any[]) {
        const estimatedAmountCents = estimateAmountCents(row.product, row.billing_interval);
        timeline.push({
          timestamp: row.created_at,
          type: "funnel_event",
          label: `Payment: ${row.product} subscription ${row.status}`,
          detail: { ...row, estimated_amount_cents: estimatedAmountCents },
        });
      }

      timeline.sort((a, b) => new Date(a.timestamp).getTime() - new Date(b.timestamp).getTime());

      const firstSeenAt = timeline[0]?.timestamp ?? null;
      const lastSeenAt = timeline[timeline.length - 1]?.timestamp ?? null;

      const utmCarriers = [...sitePageViews, ...toolPageViews, ...vendorOnboardingSessions] as any[];
      const geoCarriers = [...sitePageViews, ...toolPageViews, ...toolOutboundClicks, ...smartSearchLogs] as any[];

      const trafficSource = classifyTrafficSource(
        (latestNonNull(utmCarriers, "utm_source") as string | null) ?? null,
        (latestNonNull(utmCarriers, "referrer") as string | null) ?? null
      );
      const countryName = latestNonNull(geoCarriers, "country_name") as string | null;
      const city = latestNonNull(geoCarriers, "city") as string | null;

      const activeSubscriptions = (vendorFeatureSubscriptions as any[]).filter((s) => s.status === "active");
      const paid = activeSubscriptions.length > 0;
      const paidProducts = [...new Set(activeSubscriptions.map((s) => s.product as string))];

      const returningVisitor =
        firstSeenAt !== null && lastSeenAt !== null
          ? new Date(lastSeenAt).getTime() - new Date(firstSeenAt).getTime() > 24 * 60 * 60 * 1000
          : false;

      const summary = {
        visitor_id: visitorId,
        first_seen_at: firstSeenAt,
        last_seen_at: lastSeenAt,
        traffic_source: trafficSource,
        country_name: countryName,
        city,
        paid,
        paid_products: paidProducts,
        returning_visitor: returningVisitor,
      };

      return jsonResponse({ ok: true, summary, timeline });
    }

    return jsonResponse({ ok: false, error: "Unknown action" }, 400);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    console.error("[admin-visitor-journey] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});

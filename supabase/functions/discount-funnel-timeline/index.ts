import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers":
    "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const url = new URL(req.url);
    const agencyId = url.searchParams.get("agency_id");

    if (!agencyId) {
      return new Response(
        JSON.stringify({ error: "agency_id is required" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const adminToken = req.headers.get("x-admin-token");
    if (!adminToken) {
      return new Response(
        JSON.stringify({ error: "Unauthorized" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    const { data: session } = await supabase
      .from("admin_sessions")
      .select("id")
      .eq("token", adminToken)
      .gt("expires_at", new Date().toISOString())
      .maybeSingle();

    if (!session) {
      return new Response(
        JSON.stringify({ error: "Invalid or expired admin session" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const { data: offers } = await supabase
      .from("discount_offers")
      .select("id, token, discount_type, discount_value, max_uses, usage_count, is_active, expires_at, created_by, internal_note, intent_score_at_creation, created_at")
      .eq("agency_id", agencyId)
      .order("created_at", { ascending: false })
      .limit(20);

    const { data: events } = await supabase
      .from("funnel_events")
      .select("id, event_name, page_path, created_at, metadata")
      .eq("funnel_type", "discount")
      .eq("agency_id", agencyId)
      .order("created_at", { ascending: false })
      .limit(50);

    const { data: orders } = await supabase
      .from("stripe_orders")
      .select("id, checkout_session_id, amount_total, amount_subtotal, payment_status, status, offer_token, discount_percentage, discount_amount_cents, original_amount_cents, discount_source, product_summary, paid_at, created_at")
      .eq("agency_id", agencyId)
      .not("offer_token", "is", null)
      .order("created_at", { ascending: false })
      .limit(20);

    const { data: allOrders } = await supabase
      .from("stripe_orders")
      .select("id, amount_total, payment_status, offer_token, discount_percentage, paid_at")
      .eq("agency_id", agencyId)
      .eq("payment_status", "paid")
      .order("created_at", { ascending: false })
      .limit(50);

    const timeline: Array<{
      type: string;
      event: string;
      timestamp: string;
      details: Record<string, unknown>;
    }> = [];

    for (const offer of offers || []) {
      timeline.push({
        type: "offer_created",
        event: `${offer.discount_type === "percentage" ? offer.discount_value + "%" : "$" + offer.discount_value} discount link created`,
        timestamp: offer.created_at,
        details: {
          offer_id: offer.id,
          token_last6: offer.token.slice(-6),
          discount_type: offer.discount_type,
          discount_value: offer.discount_value,
          created_by: offer.created_by,
          intent_score: offer.intent_score_at_creation,
          uses: `${offer.usage_count}/${offer.max_uses}`,
          is_active: offer.is_active,
        },
      });
    }

    for (const evt of events || []) {
      const meta = (evt.metadata || {}) as Record<string, unknown>;
      const pct = meta.discount_percentage || meta.discount_value || null;
      const label = pct ? ` (${pct}%)` : "";

      timeline.push({
        type: "funnel_event",
        event: evt.event_name.replace(/^discount_/, "").replaceAll("_", " ") + label,
        timestamp: evt.created_at,
        details: {
          event_name: evt.event_name,
          page_path: evt.page_path,
          source: meta.source || null,
          offer_token_last6: typeof meta.offer_token === "string" ? meta.offer_token.slice(-6) : null,
          campaign_id: meta.campaign_id || null,
          lead_key: meta.lead_key || null,
        },
      });
    }

    for (const order of orders || []) {
      timeline.push({
        type: "purchase",
        event: `Paid $${((order.amount_total || 0) / 100).toFixed(2)}${order.discount_percentage ? ` (${order.discount_percentage}% off)` : ""}`,
        timestamp: order.paid_at || order.created_at,
        details: {
          checkout_session_id: order.checkout_session_id,
          amount_total_cents: order.amount_total,
          original_amount_cents: order.original_amount_cents,
          discount_amount_cents: order.discount_amount_cents,
          discount_percentage: order.discount_percentage,
          discount_source: order.discount_source,
          offer_token_last6: order.offer_token ? order.offer_token.slice(-6) : null,
          product_summary: order.product_summary,
          status: order.status,
        },
      });
    }

    timeline.sort((a, b) => new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime());

    const stats = {
      total_offers_created: (offers || []).length,
      active_offers: (offers || []).filter((o) => o.is_active).length,
      total_link_clicks: (events || []).filter((e) => e.event_name === "discount_checkout_link_opened").length,
      total_validations: (events || []).filter((e) => e.event_name === "discount_validated").length,
      total_checkout_opened: (events || []).filter((e) => e.event_name === "discount_checkout_opened").length,
      total_completed: (events || []).filter((e) => e.event_name === "discount_checkout_completed").length,
      total_consumed: (events || []).filter((e) => e.event_name === "discount_consumed").length,
      total_invalid_expired: (events || []).filter((e) => e.event_name === "discount_invalid_or_expired_viewed").length,
      discounted_orders: (orders || []).length,
      total_revenue_cents: (allOrders || []).reduce((s, o) => s + (o.amount_total || 0), 0),
      discounted_revenue_cents: (orders || []).reduce((s, o) => s + (o.amount_total || 0), 0),
      total_discount_given_cents: (orders || []).reduce((s, o) => s + (o.discount_amount_cents || 0), 0),
      by_tier: {} as Record<string, { clicks: number; checkouts: number; purchases: number; revenue_cents: number }>,
    };

    for (const evt of events || []) {
      const meta = (evt.metadata || {}) as Record<string, unknown>;
      const pct = String(meta.discount_percentage || meta.link_variant || "unknown");
      if (!stats.by_tier[pct]) stats.by_tier[pct] = { clicks: 0, checkouts: 0, purchases: 0, revenue_cents: 0 };
      if (evt.event_name === "discount_checkout_link_opened") stats.by_tier[pct].clicks++;
      if (evt.event_name === "discount_checkout_opened") stats.by_tier[pct].checkouts++;
      if (evt.event_name === "discount_checkout_completed") stats.by_tier[pct].purchases++;
    }

    for (const order of orders || []) {
      const pct = String(order.discount_percentage || "unknown");
      if (!stats.by_tier[pct]) stats.by_tier[pct] = { clicks: 0, checkouts: 0, purchases: 0, revenue_cents: 0 };
      stats.by_tier[pct].revenue_cents += order.amount_total || 0;
    }

    return new Response(
      JSON.stringify({ timeline, stats, offers_count: (offers || []).length }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  } catch (err) {
    console.error("[discount-funnel-timeline] Error:", (err as Error).message);
    return new Response(
      JSON.stringify({ error: "Internal server error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }
});

import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return createAuthErrorResponse(authResult, corsHeaders);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const url = new URL(req.url);
    const range = url.searchParams.get("range") || "all";

    const now = new Date();
    let windowStart = new Date("2020-01-01").toISOString();
    if (range !== "all") {
      const days = range === "7d" ? 7 : range === "30d" ? 30 : range === "90d" ? 90 : range === "365d" ? 365 : 30;
      windowStart = new Date(now.getTime() - days * 24 * 60 * 60 * 1000).toISOString();
    }

    const [{ data: refunds, error: refundsError }, { data: disputes, error: disputesError }] = await Promise.all([
      supabase
        .from("stripe_refunds")
        .select("id, stripe_refund_id, stripe_charge_id, stripe_payment_intent_id, stripe_order_id, stripe_subscription_id, agency_id, amount_cents, currency, status, reason, created_at, updated_at")
        .gte("created_at", windowStart)
        .order("created_at", { ascending: false })
        .limit(500),
      supabase
        .from("stripe_disputes")
        .select("id, stripe_dispute_id, stripe_charge_id, stripe_payment_intent_id, stripe_order_id, stripe_subscription_id, agency_id, amount_cents, currency, reason, status, won, evidence_due_by, created_at, updated_at")
        .gte("created_at", windowStart)
        .order("created_at", { ascending: false })
        .limit(500),
    ]);

    if (refundsError) return json({ error: refundsError.message }, 500);
    if (disputesError) return json({ error: disputesError.message }, 500);

    const refundRows = refunds ?? [];
    const disputeRows = disputes ?? [];

    const orderIds = Array.from(
      new Set(
        [
          ...refundRows.map((r) => r.stripe_order_id),
          ...disputeRows.map((d) => d.stripe_order_id),
        ].filter((x): x is number => typeof x === "number")
      )
    );

    type OrderInfo = {
      id: number;
      product_summary: string | null;
      agency_id: string | null;
      agency_name: string | null;
      customer_email: string | null;
      customer_name: string | null;
      state_slug: string | null;
      top25_rank: number | null;
      checkout_session_id: string | null;
      payment_intent_id: string | null;
      subscription_id: string | null;
      amount_total: number | null;
    };

    const ORDER_COLS =
      "id, product_summary, agency_id, agency_name, customer_email, customer_name, state_slug, top25_rank, checkout_session_id, payment_intent_id, subscription_id, amount_total";

    const orderMap = new Map<number, OrderInfo>();
    if (orderIds.length > 0) {
      const { data: orders } = await supabase.from("stripe_orders").select(ORDER_COLS).in("id", orderIds);
      for (const o of (orders ?? []) as OrderInfo[]) orderMap.set(o.id, o);
    }

    const piIds = new Set<string>();
    const subIds = new Set<string>();
    for (const r of refundRows) {
      if (!r.stripe_order_id) {
        if (r.stripe_payment_intent_id) piIds.add(r.stripe_payment_intent_id);
        if (r.stripe_subscription_id) subIds.add(r.stripe_subscription_id);
      }
    }
    for (const d of disputeRows) {
      if (!d.stripe_order_id) {
        if (d.stripe_payment_intent_id) piIds.add(d.stripe_payment_intent_id);
        if (d.stripe_subscription_id) subIds.add(d.stripe_subscription_id);
      }
    }

    const ordersByPi = new Map<string, OrderInfo>();
    const ordersBySub = new Map<string, OrderInfo>();
    if (piIds.size > 0) {
      const { data: o2 } = await supabase.from("stripe_orders").select(ORDER_COLS).in("payment_intent_id", Array.from(piIds));
      for (const o of (o2 ?? []) as OrderInfo[]) {
        if (o.payment_intent_id) ordersByPi.set(o.payment_intent_id, o);
      }
    }
    if (subIds.size > 0) {
      const { data: o3 } = await supabase.from("stripe_orders").select(ORDER_COLS).in("subscription_id", Array.from(subIds));
      for (const o of (o3 ?? []) as OrderInfo[]) {
        if (o.subscription_id && !ordersBySub.has(o.subscription_id)) ordersBySub.set(o.subscription_id, o);
      }
    }

    function enrich(row: {
      stripe_order_id: number | null;
      stripe_charge_id: string | null;
      stripe_payment_intent_id: string | null;
      stripe_subscription_id: string | null;
      agency_id: string | null;
    }) {
      let order: OrderInfo | null = row.stripe_order_id ? orderMap.get(row.stripe_order_id) ?? null : null;
      if (!order && row.stripe_payment_intent_id) order = ordersByPi.get(row.stripe_payment_intent_id) ?? null;
      if (!order && row.stripe_subscription_id) order = ordersBySub.get(row.stripe_subscription_id) ?? null;

      const effectiveOrderId = order ? order.id : row.stripe_order_id;
      const effectiveAgencyId = row.agency_id ?? order?.agency_id ?? null;
      let link_status: "linked" | "partial" | "unlinked";
      if (effectiveOrderId && effectiveAgencyId) link_status = "linked";
      else if (effectiveOrderId || effectiveAgencyId || row.stripe_charge_id || row.stripe_payment_intent_id || row.stripe_subscription_id) link_status = "partial";
      else link_status = "unlinked";

      return {
        order,
        link_status,
        agency_name: order?.agency_name ?? null,
        customer_email: order?.customer_email ?? null,
        product_summary: order?.product_summary ?? null,
        state_slug: order?.state_slug ?? null,
        top25_rank: order?.top25_rank ?? null,
        order_amount_cents: order?.amount_total ?? null,
        order_subscription_id: order?.subscription_id ?? row.stripe_subscription_id ?? null,
      };
    }

    const enrichedRefunds = refundRows.map((r) => ({ ...r, ...enrich(r) }));
    const enrichedDisputes = disputeRows.map((d) => ({ ...d, ...enrich(d) }));

    return json({
      ok: true,
      range,
      window_start: windowStart,
      refunds: enrichedRefunds,
      disputes: enrichedDisputes,
      summary: {
        refund_count: enrichedRefunds.length,
        dispute_count: enrichedDisputes.length,
        unlinked_refund_count: enrichedRefunds.filter((r) => r.link_status === "unlinked").length,
        unlinked_dispute_count: enrichedDisputes.filter((d) => d.link_status === "unlinked").length,
        webhook_events_handled: [
          "charge.refunded",
          "refund.created",
          "refund.updated",
          "charge.refund.updated",
          "charge.dispute.created",
          "charge.dispute.updated",
          "charge.dispute.closed",
        ],
      },
    });
  } catch (e) {
    console.error("[stripe-admin-refunds-disputes] Error:", e);
    return json({ error: String(e instanceof Error ? e.message : e) }, 500);
  }
});

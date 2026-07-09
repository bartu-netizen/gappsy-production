import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import Stripe from "npm:stripe@17.7.0";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

const supabase = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
  { auth: { autoRefreshToken: false, persistSession: false } }
);

const stripe = new Stripe(Deno.env.get("STRIPE_SECRET_KEY") ?? "", {
  apiVersion: "2024-12-18.acacia" as Stripe.LatestApiVersion,
});

// ─── price/sub/items sync (mirrors stripe-webhook helpers) ──────────────────

async function syncPrice(price: Stripe.Price): Promise<void> {
  if (!price?.id) return;
  await supabase.from("stripe_prices").upsert(
    {
      stripe_price_id: price.id,
      unit_amount: price.unit_amount ?? null,
      currency: price.currency ?? "usd",
      recurring_interval: price.recurring?.interval ?? null,
      recurring_interval_count: price.recurring?.interval_count ?? null,
      active: price.active ?? true,
      product_id: typeof price.product === "string" ? price.product : (price.product as Stripe.Product | null)?.id ?? null,
      nickname: price.nickname ?? null,
      raw: price as unknown as Record<string, unknown>,
      updated_at: new Date().toISOString(),
    },
    { onConflict: "stripe_price_id" }
  );
}

async function syncSubscription(sub: Stripe.Subscription): Promise<{ items: number; prices: number; error?: string }> {
  const now = new Date().toISOString();
  const customerId = typeof sub.customer === "string" ? sub.customer : (sub.customer as Stripe.Customer | null)?.id ?? null;
  const primaryItem = sub.items?.data?.[0];
  const primaryPriceId = typeof primaryItem?.price === "string" ? primaryItem.price : primaryItem?.price?.id ?? null;

  let pmBrand: string | null = null;
  let pmLast4: string | null = null;
  const dpm = sub.default_payment_method;
  if (dpm && typeof dpm !== "string") {
    pmBrand = dpm.card?.brand ?? null;
    pmLast4 = dpm.card?.last4 ?? null;
  }

  let prices = 0;
  for (const item of sub.items?.data ?? []) {
    if (item.price && typeof item.price !== "string") {
      await syncPrice(item.price);
      prices += 1;
    }
  }

  if (customerId) {
    const { data: existing } = await supabase
      .from("stripe_subscriptions")
      .select("id")
      .eq("customer_id", customerId)
      .maybeSingle();

    const row = {
      customer_id: customerId,
      subscription_id: sub.id,
      price_id: primaryPriceId,
      status: sub.status as never,
      current_period_start: sub.current_period_start ?? null,
      current_period_end: sub.current_period_end ?? null,
      cancel_at_period_end: !!sub.cancel_at_period_end,
      payment_method_brand: pmBrand,
      payment_method_last4: pmLast4,
      updated_at: now,
    };

    if (existing) {
      const { error } = await supabase.from("stripe_subscriptions").update(row).eq("id", existing.id);
      if (error) return { items: 0, prices, error: error.message };
    } else {
      const { error } = await supabase.from("stripe_subscriptions").insert({ ...row, created_at: now });
      if (error) return { items: 0, prices, error: error.message };
    }
  }

  let items = 0;
  for (const item of sub.items?.data ?? []) {
    if (!item?.id) continue;
    const itemPriceId = typeof item.price === "string" ? item.price : item.price?.id ?? null;
    const { error } = await supabase.from("stripe_subscription_items").upsert(
      {
        stripe_subscription_item_id: item.id,
        subscription_id: sub.id,
        price_id: itemPriceId,
        quantity: item.quantity ?? 1,
        active: true,
        updated_at: now,
      },
      { onConflict: "stripe_subscription_item_id" }
    );
    if (!error) items += 1;
  }

  return { items, prices };
}

// ─── refund/dispute backfill ────────────────────────────────────────────────

async function lookupOrderId(params: {
  charge_id?: string | null;
  payment_intent_id?: string | null;
  subscription_id?: string | null;
}): Promise<{ orderId: number | null; agencyId: string | null }> {
  if (params.payment_intent_id) {
    const { data } = await supabase
      .from("stripe_orders")
      .select("id, agency_id")
      .eq("payment_intent_id", params.payment_intent_id)
      .maybeSingle();
    if (data) return { orderId: data.id, agencyId: data.agency_id };
  }
  if (params.subscription_id) {
    const { data } = await supabase
      .from("stripe_orders")
      .select("id, agency_id")
      .eq("subscription_id", params.subscription_id)
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    if (data) return { orderId: data.id, agencyId: data.agency_id };
  }
  return { orderId: null, agencyId: null };
}

async function syncRefund(refund: Stripe.Refund): Promise<boolean> {
  const chargeId = typeof refund.charge === "string" ? refund.charge : refund.charge?.id ?? null;
  const piId = typeof refund.payment_intent === "string" ? refund.payment_intent : refund.payment_intent?.id ?? null;

  let subscriptionId: string | null = null;
  if (piId) {
    try {
      const pi = await stripe.paymentIntents.retrieve(piId);
      const inv = pi.invoice;
      if (inv) {
        const invoice = typeof inv === "string" ? await stripe.invoices.retrieve(inv) : inv;
        if (invoice && typeof invoice !== "string") {
          subscriptionId = typeof invoice.subscription === "string"
            ? invoice.subscription
            : invoice.subscription?.id ?? null;
        }
      }
    } catch { /* ignore */ }
  }

  const link = await lookupOrderId({ charge_id: chargeId, payment_intent_id: piId, subscription_id: subscriptionId });
  const { error } = await supabase.from("stripe_refunds").upsert(
    {
      stripe_refund_id: refund.id,
      stripe_charge_id: chargeId,
      stripe_payment_intent_id: piId,
      stripe_order_id: link.orderId,
      stripe_subscription_id: subscriptionId,
      agency_id: link.agencyId,
      amount_cents: refund.amount ?? 0,
      currency: refund.currency ?? "usd",
      status: refund.status ?? "succeeded",
      reason: refund.reason ?? null,
      metadata: (refund.metadata ?? {}) as Record<string, unknown>,
      updated_at: new Date().toISOString(),
    },
    { onConflict: "stripe_refund_id" }
  );
  return !error;
}

async function syncDispute(dispute: Stripe.Dispute): Promise<boolean> {
  const chargeId = typeof dispute.charge === "string" ? dispute.charge : dispute.charge?.id ?? null;
  const piId = typeof dispute.payment_intent === "string" ? dispute.payment_intent : dispute.payment_intent?.id ?? null;

  let subscriptionId: string | null = null;
  if (piId) {
    try {
      const pi = await stripe.paymentIntents.retrieve(piId);
      const inv = pi.invoice;
      if (inv) {
        const invoice = typeof inv === "string" ? await stripe.invoices.retrieve(inv) : inv;
        if (invoice && typeof invoice !== "string") {
          subscriptionId = typeof invoice.subscription === "string"
            ? invoice.subscription
            : invoice.subscription?.id ?? null;
        }
      }
    } catch { /* ignore */ }
  }

  const link = await lookupOrderId({ charge_id: chargeId, payment_intent_id: piId, subscription_id: subscriptionId });
  const won = dispute.status === "won" ? true : dispute.status === "lost" ? false : null;
  const evidenceDueBy = dispute.evidence_details?.due_by
    ? new Date(dispute.evidence_details.due_by * 1000).toISOString()
    : null;

  const { error } = await supabase.from("stripe_disputes").upsert(
    {
      stripe_dispute_id: dispute.id,
      stripe_charge_id: chargeId,
      stripe_payment_intent_id: piId,
      stripe_order_id: link.orderId,
      stripe_subscription_id: subscriptionId,
      agency_id: link.agencyId,
      amount_cents: dispute.amount ?? 0,
      currency: dispute.currency ?? "usd",
      reason: dispute.reason ?? null,
      status: dispute.status ?? null,
      evidence_due_by: evidenceDueBy,
      won,
      metadata: (dispute.metadata ?? {}) as Record<string, unknown>,
      updated_at: new Date().toISOString(),
    },
    { onConflict: "stripe_dispute_id" }
  );
  return !error;
}

// ─── handler ────────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const auth = await authenticateAdmin(req);
    if (!auth.success) return createAuthErrorResponse(auth, corsHeaders);

    const url = new URL(req.url);
    const mode = (url.searchParams.get("mode") || "all").toLowerCase();
    const limit = Math.min(100, Math.max(1, parseInt(url.searchParams.get("limit") || "100", 10)));
    const startingAfter = url.searchParams.get("starting_after") || undefined;

    const result = {
      mode,
      subscriptions_synced: 0,
      subscription_items_synced: 0,
      prices_synced: 0,
      refunds_synced: 0,
      disputes_synced: 0,
      errors: [] as string[],
    };

    if (mode === "subscriptions" || mode === "all") {
      try {
        const subs = await stripe.subscriptions.list({
          limit,
          starting_after: startingAfter,
          status: "all",
          expand: ["data.items.data.price.product", "data.default_payment_method"],
        });
        for (const sub of subs.data) {
          const r = await syncSubscription(sub);
          if (r.error) result.errors.push(`sub ${sub.id}: ${r.error}`);
          else {
            result.subscriptions_synced += 1;
            result.subscription_items_synced += r.items;
            result.prices_synced += r.prices;
          }
        }
      } catch (e) {
        result.errors.push(`subscriptions: ${(e as Error).message}`);
      }
    }

    if (mode === "refunds" || mode === "all") {
      try {
        const refs = await stripe.refunds.list({ limit });
        for (const r of refs.data) {
          if (await syncRefund(r)) result.refunds_synced += 1;
        }
      } catch (e) {
        result.errors.push(`refunds: ${(e as Error).message}`);
      }
    }

    if (mode === "disputes" || mode === "all") {
      try {
        const disps = await stripe.disputes.list({ limit });
        for (const d of disps.data) {
          if (await syncDispute(d)) result.disputes_synced += 1;
        }
      } catch (e) {
        result.errors.push(`disputes: ${(e as Error).message}`);
      }
    }

    return json({ ok: true, ...result, last_sync_at: new Date().toISOString() });
  } catch (e) {
    console.error("[stripe-admin-sync-revenue]", e);
    return json({ error: String(e instanceof Error ? e.message : e) }, 500);
  }
});

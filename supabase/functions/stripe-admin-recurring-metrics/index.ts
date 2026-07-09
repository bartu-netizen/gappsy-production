import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import Stripe from "npm:stripe@17.7.0";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

type BillingInterval = "day" | "week" | "month" | "year";

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function normalizeToMonthlyCents(
  amountCents: number,
  interval: BillingInterval | null,
  intervalCount: number,
): number {
  if (!interval) return 0;
  const ic = Math.max(1, intervalCount);
  switch (interval) {
    case "month": return Math.round(amountCents / ic);
    case "year":  return Math.round(amountCents / (12 * ic));
    case "week":  return Math.round((amountCents * 52) / (12 * ic));
    case "day":   return Math.round((amountCents * 365) / (12 * ic));
    default:      return 0;
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: corsHeaders });

  const authResult = await authenticateAdmin(req);
  if (!authResult.success) return createAuthErrorResponse(authResult, corsHeaders);

  const stripeSecret = Deno.env.get("STRIPE_SECRET_KEY");
  if (!stripeSecret) return json({ error: "STRIPE_SECRET_KEY not configured" }, 500);

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    { auth: { autoRefreshToken: false, persistSession: false } },
  );

  const stripe = new Stripe(stripeSecret, {
    appInfo: { name: "Gappsy MRR Calculator", version: "1.0.0" },
  });

  try {
    const ACTIVE_STATUSES = ["active", "trialing"] as const;
    let mrrCents = 0;
    let activeSubs = 0;
    let currency = "usd";

    const priceCache: Record<string, {
      unit_amount: number;
      currency: string;
      interval: BillingInterval | null;
      interval_count: number;
    }> = {};

    const getPrice = async (priceId: string) => {
      if (priceCache[priceId]) return priceCache[priceId];
      const price = await stripe.prices.retrieve(priceId);
      const entry = {
        unit_amount: price.unit_amount ?? 0,
        currency: price.currency ?? "usd",
        interval: (price.recurring?.interval ?? null) as BillingInterval | null,
        interval_count: price.recurring?.interval_count ?? 1,
      };
      priceCache[priceId] = entry;

      await supabase.from("stripe_prices").upsert({
        stripe_price_id: priceId,
        unit_amount: entry.unit_amount,
        currency: entry.currency,
        recurring_interval: entry.interval,
        recurring_interval_count: entry.interval_count,
        active: price.active,
        product_id: typeof price.product === "string" ? price.product : price.product?.id ?? null,
        nickname: price.nickname ?? null,
        raw: price as any,
        updated_at: new Date().toISOString(),
      }, { onConflict: "stripe_price_id" });

      return entry;
    };

    let hasMore = true;
    let startingAfter: string | undefined;

    while (hasMore) {
      const subs = await stripe.subscriptions.list({
        status: "active",
        limit: 100,
        expand: ["data.items.data.price"],
        ...(startingAfter ? { starting_after: startingAfter } : {}),
      }) as Stripe.ApiList<Stripe.Subscription>;

      for (const sub of subs.data) {
        if (!ACTIVE_STATUSES.includes(sub.status as "active" | "trialing")) continue;
        activeSubs++;

        for (const item of sub.items.data) {
          const price = item.price;
          if (!price) continue;

          const priceId = price.id;
          let priceData: { unit_amount: number; currency: string; interval: BillingInterval | null; interval_count: number };

          if (price.unit_amount !== null && price.unit_amount !== undefined && price.recurring) {
            priceData = {
              unit_amount: price.unit_amount,
              currency: price.currency ?? "usd",
              interval: (price.recurring.interval ?? null) as BillingInterval | null,
              interval_count: price.recurring.interval_count ?? 1,
            };
            priceCache[priceId] = priceData;
          } else {
            priceData = await getPrice(priceId);
          }

          currency = priceData.currency;
          const qty = item.quantity ?? 1;
          const monthly = normalizeToMonthlyCents(
            priceData.unit_amount * qty,
            priceData.interval,
            priceData.interval_count,
          );
          mrrCents += monthly;

          await supabase.from("stripe_subscription_items").upsert({
            stripe_subscription_item_id: item.id,
            subscription_id: sub.id,
            price_id: priceId,
            quantity: qty,
            active: true,
            updated_at: new Date().toISOString(),
          }, { onConflict: "stripe_subscription_item_id" });
        }
      }

      hasMore = subs.has_more;
      if (subs.data.length > 0) {
        startingAfter = subs.data[subs.data.length - 1].id;
      } else {
        hasMore = false;
      }
    }

    let trialingHasMore = true;
    let trialingStartingAfter: string | undefined;

    while (trialingHasMore) {
      const trialSubs = await stripe.subscriptions.list({
        status: "trialing",
        limit: 100,
        expand: ["data.items.data.price"],
        ...(trialingStartingAfter ? { starting_after: trialingStartingAfter } : {}),
      }) as Stripe.ApiList<Stripe.Subscription>;

      for (const sub of trialSubs.data) {
        activeSubs++;
        for (const item of sub.items.data) {
          const price = item.price;
          if (!price) continue;

          const priceId = price.id;
          let priceData: { unit_amount: number; currency: string; interval: BillingInterval | null; interval_count: number };

          if (price.unit_amount !== null && price.unit_amount !== undefined && price.recurring) {
            priceData = {
              unit_amount: price.unit_amount,
              currency: price.currency ?? "usd",
              interval: (price.recurring.interval ?? null) as BillingInterval | null,
              interval_count: price.recurring.interval_count ?? 1,
            };
            priceCache[priceId] = priceData;
          } else {
            priceData = await getPrice(priceId);
          }

          currency = priceData.currency;
          const qty = item.quantity ?? 1;
          const monthly = normalizeToMonthlyCents(
            priceData.unit_amount * qty,
            priceData.interval,
            priceData.interval_count,
          );
          mrrCents += monthly;

          await supabase.from("stripe_subscription_items").upsert({
            stripe_subscription_item_id: item.id,
            subscription_id: sub.id,
            price_id: priceId,
            quantity: qty,
            active: true,
            updated_at: new Date().toISOString(),
          }, { onConflict: "stripe_subscription_item_id" });
        }
      }

      trialingHasMore = trialSubs.has_more;
      if (trialSubs.data.length > 0) {
        trialingStartingAfter = trialSubs.data[trialSubs.data.length - 1].id;
      } else {
        trialingHasMore = false;
      }
    }

    return json({
      currency,
      mrr_cents: mrrCents,
      yrr_cents: mrrCents * 12,
      active_subscriptions: activeSubs,
      computed_at: new Date().toISOString(),
    });
  } catch (err: any) {
    console.error("[stripe-admin-recurring-metrics] error:", err.message);
    return json({ error: err.message }, 500);
  }
});

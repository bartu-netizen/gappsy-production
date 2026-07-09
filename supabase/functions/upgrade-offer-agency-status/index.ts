import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

const AGENCY_ACTIVATION_PRICE_ID = "price_1SaplSIoPJm5BB2XIP4XKqGS";
const LISTING_STANDARD_PRICE_ID = "price_1SZGKxIoPJm5BB2X1My3vHBJ";
const LISTING_PRIORITY_PRICE_ID = "price_1SZKW7IoPJm5BB2Xom28TCYo";
const LISTING_PREMIUM_PRICE_ID = "price_1SZKecIoPJm5BB2Xf1ZNcRmt";

const PRICE_ID_LABELS: Record<string, string> = {
  [AGENCY_ACTIVATION_PRICE_ID]: "Agency Activation ($97)",
  [LISTING_STANDARD_PRICE_ID]: "Standard Top-25 Listing ($197)",
  [LISTING_PRIORITY_PRICE_ID]: "Priority Top-25 Listing ($247)",
  [LISTING_PREMIUM_PRICE_ID]: "Premium Top-25 Listing ($297)",
};

const PRICE_ID_TIERS: Record<string, string> = {
  [AGENCY_ACTIVATION_PRICE_ID]: "activation",
  [LISTING_STANDARD_PRICE_ID]: "standard",
  [LISTING_PRIORITY_PRICE_ID]: "priority",
  [LISTING_PREMIUM_PRICE_ID]: "premium",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    console.log("[upgrade-offer-agency-status] Request received:", req.method);
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      console.warn("[upgrade-offer-agency-status] Auth failed:", authResult.error);
      return createAuthErrorResponse(authResult, corsHeaders);
    }
    console.log("[upgrade-offer-agency-status] Auth success, sessionType:", authResult.sessionType);

    const url = new URL(req.url);
    let agencyId = url.searchParams.get("agency_id");

    if (req.method === "POST") {
      const body = await req.json().catch(() => ({}));
      agencyId = agencyId || body.agency_id;
    }

    if (!agencyId) {
      console.warn("[upgrade-offer-agency-status] Missing agency_id");
      return jsonResponse({ error: "agency_id is required" }, 400);
    }
    console.log("[upgrade-offer-agency-status] Fetching status for agency_id:", agencyId);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !supabaseServiceKey) {
      return jsonResponse({ error: "Server configuration error" }, 500);
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const { data: orders, error: ordersError } = await supabase
      .from("stripe_orders")
      .select("id, checkout_session_id, amount_total, subscription_id, payment_status, paid_at, source_listing_type, funnel_type, created_at, metadata")
      .eq("agency_id", agencyId)
      .eq("payment_status", "paid")
      .order("created_at", { ascending: false });

    if (ordersError) {
      console.error("[upgrade-offer-agency-status] Orders DB error:", ordersError);
      return jsonResponse({ error: "Failed to fetch orders" }, 500);
    }

    console.log("[upgrade-offer-agency-status] Paid orders found:", orders?.length ?? 0);

    // Detect activation order — $97 payment via any listing type
    // Checks: funnel/source type flag, OR exact $97 amount (9700 cents)
    const activationOrder = orders?.find((o) => {
      const isActivationType =
        o.funnel_type === "agency_activation" ||
        o.source_listing_type === "agency_activation" ||
        o.source_listing_type === "activation" ||
        o.source_listing_type === "other_listing" ||
        o.source_listing_type === "standard";
      const isActivationAmount = o.amount_total === 9700;
      return isActivationAmount || isActivationType;
    }) || null;

    console.log("[upgrade-offer-agency-status] Activation order:", activationOrder?.id ?? "none", "subscription_id:", activationOrder?.subscription_id ?? "none");

    let activeSubscription: Record<string, unknown> | null = null;
    let currentPriceId: string | null = null;
    let currentTier: string | null = null;

    // Path 1: look in stripe_subscriptions by subscription_id from the activation order
    if (activationOrder?.subscription_id) {
      const { data: sub } = await supabase
        .from("stripe_subscriptions")
        .select("subscription_id, price_id, status, current_period_end, cancel_at_period_end")
        .eq("subscription_id", activationOrder.subscription_id)
        .maybeSingle();

      if (sub && sub.status === "active") {
        activeSubscription = sub;
        currentPriceId = sub.price_id as string;
        currentTier = PRICE_ID_TIERS[sub.price_id as string] || "unknown";
        console.log("[upgrade-offer-agency-status] Subscription found in stripe_subscriptions:", sub.subscription_id);
      }
    }

    // Path 2: look across all subscription_ids from all paid orders
    if (!activeSubscription) {
      const subscriptionIds = (orders || []).map((o) => o.subscription_id).filter(Boolean);
      if (subscriptionIds.length > 0) {
        const { data: subs } = await supabase
          .from("stripe_subscriptions")
          .select("subscription_id, price_id, status, current_period_end, cancel_at_period_end")
          .in("subscription_id", subscriptionIds)
          .eq("status", "active")
          .order("current_period_end", { ascending: false })
          .limit(1);

        if (subs && subs.length > 0) {
          activeSubscription = subs[0];
          currentPriceId = subs[0].price_id as string;
          currentTier = PRICE_ID_TIERS[subs[0].price_id as string] || "unknown";
          console.log("[upgrade-offer-agency-status] Subscription found via fallback scan:", subs[0].subscription_id);
        }
      }
    }

    // Path 3 (inferred): stripe_subscriptions may not have synced yet.
    // If activation order has a subscription_id and was paid within 185 days
    // (6-month billing cycle + 5-day buffer), infer the subscription is active on the
    // agency_activation price. This prevents eligibility failures due to sync lag.
    if (!activeSubscription && activationOrder?.subscription_id && activationOrder.paid_at) {
      const paidAt = new Date(activationOrder.paid_at);
      const daysSincePaid = (Date.now() - paidAt.getTime()) / (1000 * 60 * 60 * 24);
      const metaPriceId = (activationOrder.metadata as Record<string, string> | null)?.priceId ||
                          (activationOrder.metadata as Record<string, string> | null)?.price_id ||
                          null;
      const inferredPriceId = metaPriceId || AGENCY_ACTIVATION_PRICE_ID;

      if (daysSincePaid <= 185) {
        console.log("[upgrade-offer-agency-status] Inferring active subscription from paid order (sync lag path):", {
          subscription_id: activationOrder.subscription_id,
          paid_at: activationOrder.paid_at,
          daysSincePaid: Math.round(daysSincePaid),
        });
        activeSubscription = {
          subscription_id: activationOrder.subscription_id,
          price_id: inferredPriceId,
          status: "active",
          current_period_end: null,
          cancel_at_period_end: false,
          inferred: true,
        };
        currentPriceId = inferredPriceId;
        currentTier = PRICE_ID_TIERS[inferredPriceId] || "activation";
      }
    }

    console.log("[upgrade-offer-agency-status] Active subscription:", activeSubscription ? currentPriceId : "none", "tier:", currentTier);

    const isOnActivationPlan = currentPriceId === AGENCY_ACTIVATION_PRICE_ID || currentTier === "activation";
    const isEligibleForUpgrade = isOnActivationPlan && !!activeSubscription;

    const { data: pendingUpgrades } = await supabase
      .from("upgrade_offers")
      .select("id, status, target_tier, target_rank, final_upgrade_price_cents, created_at, expires_at, checkout_url")
      .eq("agency_id", agencyId)
      .in("status", ["pending_checkout"])
      .order("created_at", { ascending: false });

    return jsonResponse({
      agency_id: agencyId,
      has_paid_order: (orders?.length || 0) > 0,
      orders_count: orders?.length || 0,
      activation_order: activationOrder ? {
        id: activationOrder.id,
        subscription_id: activationOrder.subscription_id,
        amount_total: activationOrder.amount_total,
        paid_at: activationOrder.paid_at,
      } : null,
      active_subscription: activeSubscription ? {
        subscription_id: activeSubscription.subscription_id,
        price_id: activeSubscription.price_id,
        price_label: PRICE_ID_LABELS[activeSubscription.price_id] || activeSubscription.price_id,
        tier: currentTier,
        status: activeSubscription.status,
        current_period_end: activeSubscription.current_period_end,
        cancel_at_period_end: activeSubscription.cancel_at_period_end,
      } : null,
      current_price_id: currentPriceId,
      current_tier: currentTier,
      is_on_activation_plan: isOnActivationPlan,
      is_eligible_for_upgrade: isEligibleForUpgrade,
      pending_upgrade_offers: pendingUpgrades || [],
    });
  } catch (e) {
    console.error("[upgrade-offer-agency-status] Unexpected error:", e);
    return jsonResponse({ error: "Internal server error" }, 500);
  }
});

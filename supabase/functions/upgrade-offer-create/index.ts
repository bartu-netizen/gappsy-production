import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import Stripe from "npm:stripe@14";
import { authenticateAdmin, createAuthErrorResponse, writeAuditLog, getRequestMeta } from "../_shared/adminAuth.ts";
import { sendEmail } from "../_shared/emailClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function stageError(errorCode: string, message: string, status = 500): Response {
  console.error(`[upgrade-offer-create][${errorCode}]`, message);
  return jsonResponse({ error: errorCode, message }, status);
}

const AGENCY_ACTIVATION_PRICE_ID = "price_1SaplSIoPJm5BB2XIP4XKqGS";
const AGENCY_ACTIVATION_CENTS = 9700;

const TIER_PRICE_IDS: Record<string, string> = {
  standard: "price_1SZGKxIoPJm5BB2X1My3vHBJ",
  priority: "price_1SZKW7IoPJm5BB2Xom28TCYo",
  premium: "price_1SZKecIoPJm5BB2Xf1ZNcRmt",
};

const TIER_PRICE_CENTS: Record<string, number> = {
  standard: 19700,
  priority: 24700,
  premium: 29700,
};

const TIER_LABELS: Record<string, string> = {
  standard: "Standard Top-25 Listing",
  priority: "Priority Top-25 Listing",
  premium: "Premium Top-25 Listing",
};

function getRankTier(rank: number): string {
  if (rank >= 1 && rank <= 8) return "premium";
  if (rank >= 9 && rank <= 16) return "priority";
  return "standard";
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return jsonResponse({ error: "method_not_allowed", message: "Method not allowed" }, 405);
  }

  // ── Stage: Auth ──────────────────────────────────────────────────────────
  console.log("[upgrade-offer-create][auth] Authenticating request");
  let authResult: Awaited<ReturnType<typeof authenticateAdmin>>;
  try {
    authResult = await authenticateAdmin(req);
  } catch (e) {
    console.error("[upgrade-offer-create][auth] Unexpected auth error:", e);
    return stageError("auth_unexpected", `Auth check threw: ${e instanceof Error ? e.message : String(e)}`);
  }
  if (!authResult.success) {
    console.warn("[upgrade-offer-create][auth] Auth failed:", authResult.error);
    return createAuthErrorResponse(authResult, corsHeaders);
  }
  console.log("[upgrade-offer-create][auth] Auth passed, sessionType:", authResult.sessionType);

  // ── Stage: Parse body ────────────────────────────────────────────────────
  console.log("[upgrade-offer-create][body] Parsing request body");
  let body: Record<string, unknown> | null = null;
  try {
    body = await req.json();
  } catch (e) {
    return stageError("invalid_json", `Could not parse request body: ${e instanceof Error ? e.message : String(e)}`, 400);
  }
  if (!body || typeof body !== "object") {
    return stageError("invalid_body", "Request body must be a JSON object", 400);
  }

  const {
    agency_id,
    agency_name,
    state_slug,
    old_subscription_id,
    target_rank,
    extra_discount_cents = 0,
    notes = "",
    created_by_admin = "admin",
    success_url,
    cancel_url,
  } = body as {
    agency_id: string;
    agency_name: string;
    state_slug: string;
    old_subscription_id?: string;
    target_rank: number;
    extra_discount_cents?: number;
    notes?: string;
    created_by_admin?: string;
    success_url?: string;
    cancel_url?: string;
  };

  if (!agency_id || !agency_name || !state_slug || !target_rank) {
    return stageError(
      "missing_fields",
      `Missing required fields. Got: agency_id=${agency_id}, agency_name=${agency_name}, state_slug=${state_slug}, target_rank=${target_rank}`,
      400,
    );
  }

  const rankNum = Number(target_rank);
  if (isNaN(rankNum) || rankNum < 2 || rankNum > 25) {
    return stageError("invalid_rank", `Invalid rank: ${target_rank}. Must be 2–25.`, 400);
  }

  const tier = getRankTier(rankNum);
  const targetPriceId = TIER_PRICE_IDS[tier];
  console.log("[upgrade-offer-create][body] Parsed — agency:", agency_name, "state:", state_slug, "rank:", rankNum, "tier:", tier, "priceId:", targetPriceId);

  // ── Stage: Config ────────────────────────────────────────────────────────
  const stripeKey = Deno.env.get("STRIPE_SECRET_KEY");
  if (!stripeKey) {
    return stageError("config_missing_stripe", "STRIPE_SECRET_KEY is not configured on this deployment");
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!supabaseUrl || !supabaseServiceKey) {
    return stageError("config_missing_supabase", "Supabase environment variables are not configured");
  }

  const supabase = createClient(supabaseUrl, supabaseServiceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  // ── Stage: Slot lookup ───────────────────────────────────────────────────
  console.log(`[upgrade-offer-create][slot] Looking up rank ${rankNum} in ${state_slug}`);
  let slot: { id: string; rank: number; is_paid: boolean; agency_id: string | null; agency_name: string | null } | null = null;
  try {
    const { data, error } = await supabase
      .from("top25_slots")
      .select("id, rank, is_paid, agency_id, agency_name, state_slug")
      .eq("state_slug", state_slug)
      .eq("rank", rankNum)
      .maybeSingle();

    if (error) {
      return stageError("slot_query_failed", `DB error looking up slot: ${error.message}`);
    }
    slot = data;
  } catch (e) {
    return stageError("slot_query_exception", `Exception during slot lookup: ${e instanceof Error ? e.message : String(e)}`);
  }

  if (!slot) {
    return stageError("slot_not_found", `Slot rank ${rankNum} not found in state '${state_slug}'. Check that all 25 slots are initialized for this state.`, 400);
  }

  if (slot.is_paid && slot.agency_id !== agency_id) {
    return jsonResponse({
      error: "slot_taken",
      message: `Rank ${rankNum} is already taken by ${slot.agency_name}. Please choose another slot.`,
      slot_taken: true,
    }, 409);
  }

  console.log(`[upgrade-offer-create][slot] Slot OK — id: ${slot.id}, is_paid: ${slot.is_paid}`);

  // ── Stage: Price validation ──────────────────────────────────────────────
  const stripe = new Stripe(stripeKey, { apiVersion: "2024-11-20.acacia" });
  const isLiveKey = stripeKey.startsWith("sk_live_");
  const isTestPriceId = targetPriceId.includes("test") || !targetPriceId.startsWith("price_");

  console.log(`[upgrade-offer-create][price] Validating price ID: ${targetPriceId}, liveMode: ${isLiveKey}`);

  let stripePrice: Stripe.Price | null = null;
  try {
    stripePrice = await stripe.prices.retrieve(targetPriceId);
  } catch (e) {
    const stripeMsg = e instanceof Stripe.errors.StripeError
      ? `${e.type}: ${e.message} (code: ${e.code ?? "none"})`
      : (e instanceof Error ? e.message : String(e));
    return stageError(
      "stripe_price_invalid",
      `Price ID '${targetPriceId}' (tier: ${tier}) is not valid in the active Stripe account (live_mode: ${isLiveKey}). Stripe said: ${stripeMsg}`,
    );
  }

  if (!stripePrice.active) {
    return stageError(
      "stripe_price_inactive",
      `Price ID '${targetPriceId}' exists but is not active in Stripe. It must be activated before use.`,
    );
  }
  console.log(`[upgrade-offer-create][price] Price valid — unit_amount: ${stripePrice.unit_amount}, active: ${stripePrice.active}`);

  // ── Stage: Pricing math ──────────────────────────────────────────────────
  const fullPriceCents = TIER_PRICE_CENTS[tier];
  const creditCents = AGENCY_ACTIVATION_CENTS;
  const extraDiscount = Math.max(0, Number(extra_discount_cents) || 0);
  const discountTotal = creditCents + extraDiscount;
  const finalUpgradePriceCents = Math.max(0, fullPriceCents - discountTotal);

  const couponIdSafe = `upg_${rankNum}_${agency_id.slice(0, 8)}_${Date.now().toString(36)}`.replace(/[^a-zA-Z0-9_-]/g, '').slice(0, 40);
  const couponDisplayName = `Upgrade credit — Rank #${rankNum}`;
  console.log(`[upgrade-offer-create][coupon] Creating coupon — id: ${couponIdSafe}, amount_off: ${discountTotal}, final: ${finalUpgradePriceCents}`);

  // ── Stage: Stripe coupon create ──────────────────────────────────────────
  let couponId: string;
  try {
    const coupon = await stripe.coupons.create({
      id: couponIdSafe,
      amount_off: finalUpgradePriceCents === 0 ? fullPriceCents : discountTotal,
      currency: "usd",
      duration: "once",
      name: couponDisplayName,
      metadata: {
        agency_id,
        agency_name: agency_name.slice(0, 500),
        state_slug,
        target_rank: String(rankNum),
        target_tier: tier,
        upgrade_offer: "true",
        full_description: `Upgrade from Agency Activation - ${agency_name} (Rank ${rankNum})`,
      },
    });
    couponId = coupon.id;
    console.log(`[upgrade-offer-create][coupon] Coupon created — id: ${couponId}`);
  } catch (e) {
    const stripeMsg = e instanceof Stripe.errors.StripeError
      ? `${e.type}: ${e.message} (code: ${e.code ?? "none"})`
      : (e instanceof Error ? e.message : String(e));
    return stageError("stripe_coupon_create_failed", `Stripe coupon creation failed: ${stripeMsg}`);
  }

  // ── Stage: Stripe checkout session create ────────────────────────────────
  const appUrl = Deno.env.get("VITE_APP_URL") || "https://gappsy.com";
  const defaultSuccessUrl = `${appUrl}/top25/confirm?upgrade=true&agency=${encodeURIComponent(agency_name)}&rank=${rankNum}&state=${state_slug}`;
  const defaultCancelUrl = `${appUrl}/top25?state=${state_slug}`;

  console.log(`[upgrade-offer-create][session] Creating Stripe checkout session — priceId: ${targetPriceId}, coupon: ${couponId}`);

  let session: Stripe.Checkout.Session;
  try {
    session = await stripe.checkout.sessions.create({
      mode: "subscription",
      line_items: [
        {
          price: targetPriceId,
          quantity: 1,
        },
      ],
      discounts: [{ coupon: couponId }],
      success_url: success_url || defaultSuccessUrl,
      cancel_url: cancel_url || defaultCancelUrl,
      custom_text: {
        submit: { message: "Billed every 6 months \u2014 cancel anytime." },
        after_submit: { message: "Renews every 6 months. Cancel anytime." },
      },
      metadata: {
        agency_id,
        agency_name,
        state_slug,
        target_rank: String(rankNum),
        target_tier: tier,
        old_subscription_id: old_subscription_id || "",
        upgrade_offer: "true",
        source_listing_type: "top25_upgrade",
        funnel_type: "top25_upgrade",
      },
      subscription_data: {
        metadata: {
          agency_id,
          agency_name,
          state_slug,
          target_rank: String(rankNum),
          target_tier: tier,
          old_subscription_id: old_subscription_id || "",
          upgrade_offer: "true",
          source_listing_type: "top25_upgrade",
        },
      },
    });
    console.log(`[upgrade-offer-create][session] Checkout session created — id: ${session.id}, url: ${session.url ? "present" : "missing"}`);
  } catch (e) {
    const stripeMsg = e instanceof Stripe.errors.StripeError
      ? `${e.type}: ${e.message} (code: ${e.code ?? "none"})`
      : (e instanceof Error ? e.message : String(e));
    return stageError("stripe_checkout_session_failed", `Stripe checkout session creation failed: ${stripeMsg}`);
  }

  if (!session.url) {
    return stageError("stripe_session_no_url", `Stripe session created (${session.id}) but returned no checkout URL. This is unexpected.`);
  }

  // ── Stage: DB insert ─────────────────────────────────────────────────────
  console.log(`[upgrade-offer-create][db] Inserting upgrade_offers row for agency: ${agency_id}`);

  let offer: { id: string } | null = null;
  try {
    const { data, error: insertError } = await supabase
      .from("upgrade_offers")
      .insert({
        agency_id,
        agency_name,
        state_slug,
        old_subscription_id: old_subscription_id || null,
        old_price_id: AGENCY_ACTIVATION_PRICE_ID,
        old_plan_label: "Agency Activation",
        target_rank: rankNum,
        target_tier: tier,
        target_price_id: targetPriceId,
        full_price_cents: fullPriceCents,
        credit_cents: creditCents,
        extra_discount_cents: extraDiscount,
        final_upgrade_price_cents: finalUpgradePriceCents,
        stripe_coupon_id: couponId,
        checkout_session_id: session.id,
        checkout_url: session.url,
        status: "pending_checkout",
        created_by_admin,
        notes,
      })
      .select("id")
      .single();

    if (insertError) {
      return stageError(
        "upgrade_offer_insert_failed",
        `Could not save upgrade_offers row: ${insertError.message} (code: ${insertError.code ?? "none"}, details: ${insertError.details ?? "none"})`,
      );
    }

    offer = data;
    console.log(`[upgrade-offer-create][db] upgrade_offers row inserted — id: ${offer?.id}`);
  } catch (e) {
    return stageError("upgrade_offer_insert_exception", `Exception during upgrade_offers insert: ${e instanceof Error ? e.message : String(e)}`);
  }

  // ── Stage: Audit log ─────────────────────────────────────────────────────
  console.log("[upgrade-offer-create][audit] Writing audit log");
  try {
    const { ip, userAgent } = getRequestMeta(req);
    await writeAuditLog({
      actor_session_type: authResult.sessionType || "unknown",
      action: "upgrade_offer_created",
      target_table: "upgrade_offers",
      target_id: offer?.id || session.id,
      state_slug,
      ip,
      user_agent: userAgent,
      status: "success",
    });
    console.log("[upgrade-offer-create][audit] Audit log written");
  } catch (e) {
    console.warn("[upgrade-offer-create][audit] Audit log failed (non-fatal):", e instanceof Error ? e.message : String(e));
  }

  // ── Stage: Admin email ───────────────────────────────────────────────────
  console.log("[upgrade-offer-create][email] Sending admin notification");
  try {
    const adminEmail = Deno.env.get("SMTP_INTERNAL_EMAIL") || "bartu@gappsy.com";
    const finalDollars = (finalUpgradePriceCents / 100).toFixed(2);
    const fullDollars = (fullPriceCents / 100).toFixed(2);
    const creditDollars = (creditCents / 100).toFixed(2);
    const extraDollars = (extraDiscount / 100).toFixed(2);

    await sendEmail({
      to: adminEmail,
      subject: `Upgrade Offer Created: ${agency_name} → Rank ${rankNum} (${tier})`,
      html: `
        <h2>Upgrade Offer Generated</h2>
        <table cellpadding="6" style="border-collapse:collapse;">
          <tr><td><strong>Agency</strong></td><td>${agency_name}</td></tr>
          <tr><td><strong>Agency ID</strong></td><td>${agency_id}</td></tr>
          <tr><td><strong>State</strong></td><td>${state_slug}</td></tr>
          <tr><td><strong>Target Rank</strong></td><td>#${rankNum} (${TIER_LABELS[tier]})</td></tr>
          <tr><td><strong>Full Price</strong></td><td>$${fullDollars}/6mo</td></tr>
          <tr><td><strong>Credit ($97 paid)</strong></td><td>-$${creditDollars}</td></tr>
          <tr><td><strong>Extra Discount</strong></td><td>-$${extraDollars}</td></tr>
          <tr><td><strong>First Payment</strong></td><td><strong>$${finalDollars}</strong> (then $${fullDollars}/6mo)</td></tr>
          <tr><td><strong>Old Sub ID</strong></td><td>${old_subscription_id || "n/a"}</td></tr>
          <tr><td><strong>Coupon ID</strong></td><td>${couponId}</td></tr>
          <tr><td><strong>Offer ID</strong></td><td>${offer?.id || "unknown"}</td></tr>
          <tr><td><strong>Created By</strong></td><td>${created_by_admin}</td></tr>
        </table>
        <p style="margin-top:16px;"><a href="${session.url}">Upgrade Link →</a></p>
      `,
    });
    console.log("[upgrade-offer-create][email] Admin notification sent");
  } catch (e) {
    console.warn("[upgrade-offer-create][email] Admin email failed (non-fatal):", e instanceof Error ? e.message : String(e));
  }

  // ── All stages complete ──────────────────────────────────────────────────
  console.log("[upgrade-offer-create] All stages complete — returning success");

  return jsonResponse({
    ok: true,
    offer_id: offer?.id,
    checkout_url: session.url,
    checkout_session_id: session.id,
    coupon_id: couponId,
    pricing: {
      full_price_cents: fullPriceCents,
      credit_cents: creditCents,
      extra_discount_cents: extraDiscount,
      discount_total_cents: discountTotal,
      final_upgrade_price_cents: finalUpgradePriceCents,
      final_upgrade_price_dollars: finalUpgradePriceCents / 100,
      renewal_price_cents: fullPriceCents,
      renewal_price_dollars: fullPriceCents / 100,
    },
    target: {
      rank: rankNum,
      tier,
      price_id: targetPriceId,
      label: TIER_LABELS[tier],
    },
  });
});

import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

// ── Shared price cycle map (must match stripe-admin-metrics exactly) ──────────
// MRR = cycle_cents / 6
const PRICE_CYCLE_CENTS: Record<string, number> = {
  "price_1SaplSIoPJm5BB2XIP4XKqGS": 9700,   // Standard Listing $97/6mo
  "price_1SZGKxIoPJm5BB2X1My3vHBJ": 19700,  // Top-25 Standard $197/6mo
  "price_1SZKW7IoPJm5BB2Xom28TCYo": 24700,  // Top-25 Priority $247/6mo
  "price_1SZKecIoPJm5BB2Xf1ZNcRmt": 29700,  // Top-25 Premium $297/6mo
  "price_1SZQ3qIoPJm5BB2XVzBy9qRD": 99700,  // Spotlight $997/6mo
  "price_1SZPw3IoPJm5BB2Xh8ji6xPt": 3700,   // Card Visual Add-On $37/6mo
  "price_1SZPzfIoPJm5BB2XKJYYwTlM": 9700,   // Get Matched Add-On $97/6mo
};

// ── Price ID → product metadata ───────────────────────────────────────────────
const PRICE_META: Record<string, { label: string; amount_cents: number; interval: string; tier: string }> = {
  "price_1SaplSIoPJm5BB2XIP4XKqGS": { label: "Standard Listing", amount_cents: 9700, interval: "6 months", tier: "standard_listing" },
  "price_1SZGKxIoPJm5BB2X1My3vHBJ": { label: "Top-25 Standard Listing", amount_cents: 19700, interval: "6 months", tier: "standard" },
  "price_1SZKW7IoPJm5BB2Xom28TCYo": { label: "Top-25 Priority Listing", amount_cents: 24700, interval: "6 months", tier: "priority" },
  "price_1SZKecIoPJm5BB2Xf1ZNcRmt": { label: "Top-25 Premium Listing", amount_cents: 29700, interval: "6 months", tier: "premium" },
  "price_1SZQ3qIoPJm5BB2XVzBy9qRD": { label: "Spotlight Placement", amount_cents: 99700, interval: "6 months", tier: "spotlight" },
  "price_1SZPw3IoPJm5BB2Xh8ji6xPt": { label: "Card Visual Add-On", amount_cents: 3700, interval: "6 months", tier: "addon" },
  "price_1SZPzfIoPJm5BB2XKJYYwTlM": { label: "Get Matched Add-On", amount_cents: 9700, interval: "6 months", tier: "addon" },
};

function getPriceMeta(priceId: string | null) {
  if (!priceId) return null;
  return PRICE_META[priceId] || null;
}

function mrrFromPriceId(priceId: string | null): number {
  if (!priceId) return 0;
  const cycle = PRICE_CYCLE_CENTS[priceId];
  if (!cycle) return 0;
  return Math.round(cycle / 6);
}

// ── Safe Unix timestamp → ISO string ─────────────────────────────────────────
function unixToIso(ts: number | null | undefined): string | null {
  if (!ts || ts <= 0) return null;
  const seconds = ts > 9999999999 ? Math.floor(ts / 1000) : ts;
  const d = new Date(seconds * 1000);
  if (isNaN(d.getTime())) return null;
  return d.toISOString();
}

function formatStateSlug(slug: string | null): string | null {
  if (!slug) return null;
  return slug
    .split("-")
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(" ");
}

function deriveListingLabel(params: {
  sourceListingType: string | null;
  top25Rank: number | null;
  tier: string | null;
}): string {
  const { sourceListingType, top25Rank, tier } = params;

  // $97 standard listing (entry-level recurring)
  if (tier === "standard_listing") return "Standard Listing";

  // Top-25 tier listings
  if (
    sourceListingType === "top25" ||
    sourceListingType === "top25_rank" ||
    tier === "premium" ||
    tier === "priority" ||
    tier === "standard"
  ) {
    const tierLabel =
      tier === "premium" ? "Premium" : tier === "priority" ? "Priority" : "Standard";
    if (top25Rank) return `Top-25 Rank #${top25Rank} (${tierLabel})`;
    return `Top-25 ${tierLabel} Listing`;
  }

  // Other listing types mapped to Standard Listing
  if (
    sourceListingType === "other_listing" ||
    sourceListingType === "standard" ||
    tier === "activation"
  ) {
    return "Standard Listing";
  }

  if (sourceListingType === "spotlight" || tier === "spotlight") {
    return "Spotlight Placement";
  }

  if (tier === "addon") return "Add-On";

  return sourceListingType || "Listing";
}

// ── Order fields used for agency enrichment ───────────────────────────────────
const ORDER_SELECT =
  "subscription_id, customer_id, agency_id, agency_name, customer_email, customer_name, state_slug, source_listing_type, top25_rank, amount_total, paid_at, reporting_category";

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
    const statusFilter = url.searchParams.get("status") || "";
    const search = (url.searchParams.get("search") || "").trim().toLowerCase();
    const includeExcluded = url.searchParams.get("include_excluded") === "true";
    const page = Math.max(1, parseInt(url.searchParams.get("page") || "1", 10));
    const limit = Math.min(100, Math.max(1, parseInt(url.searchParams.get("limit") || "50", 10)));
    const offset = (page - 1) * limit;

    // ── Fetch all subscriptions ───────────────────────────────────────────────
    const { data: rawRows, error: queryError } = await supabase
      .from("stripe_subscriptions")
      .select(`
        id,
        subscription_id,
        customer_id,
        price_id,
        status,
        current_period_start,
        current_period_end,
        cancel_at_period_end,
        payment_method_brand,
        payment_method_last4,
        reporting_category,
        created_at,
        updated_at
      `)
      .order("created_at", { ascending: false });

    if (queryError) {
      console.error("[stripe-admin-subscriptions] Query error:", queryError.message);
      return json({ error: queryError.message }, 500);
    }

    const rows = rawRows ?? [];

    // ── Primary agency lookup: match by subscription_id ───────────────────────
    const subscriptionIds = rows
      .map((r) => r.subscription_id)
      .filter((id): id is string => !!id);

    const { data: ordersBySubRaw } = await supabase
      .from("stripe_orders")
      .select(ORDER_SELECT)
      .in("subscription_id", subscriptionIds.length > 0 ? subscriptionIds : ["__none__"]);

    const ordersBySubId = new Map<string, (typeof ordersBySubRaw)[0]>();
    for (const order of ordersBySubRaw ?? []) {
      if (order.subscription_id && !ordersBySubId.has(order.subscription_id)) {
        ordersBySubId.set(order.subscription_id, order);
      }
    }

    // ── Secondary agency lookup: match by customer_id for unresolved rows ─────
    // A subscription is "unresolved" if its subscription_id didn't match any order,
    // OR if it has no subscription_id at all.
    const customerIdsNeedingLookup = [
      ...new Set(
        rows
          .filter((r) => {
            if (!r.subscription_id) return true;
            return !ordersBySubId.has(r.subscription_id);
          })
          .map((r) => r.customer_id)
          .filter((id): id is string => !!id)
      ),
    ];

    const ordersByCustomerId = new Map<string, (typeof ordersBySubRaw)[0]>();
    if (customerIdsNeedingLookup.length > 0) {
      const { data: customerOrdersRaw } = await supabase
        .from("stripe_orders")
        .select(ORDER_SELECT)
        .in("customer_id", customerIdsNeedingLookup)
        .order("paid_at", { ascending: false });

      for (const order of customerOrdersRaw ?? []) {
        if (order.customer_id && !ordersByCustomerId.has(order.customer_id)) {
          ordersByCustomerId.set(order.customer_id, order);
        }
      }
    }

    // ── Fetch upgrade_offers for replacement detection ────────────────────────
    const { data: upgradeOffers } = await supabase
      .from("upgrade_offers")
      .select(
        "old_subscription_id, new_subscription_id, status, target_tier, target_rank, agency_id, extra_discount_cents, credit_cents, final_upgrade_price_cents"
      )
      .in("status", ["completed", "pending_checkout"]);

    const replacedSubIds = new Set<string>();
    const upgradeByNewSub = new Map<string, (typeof upgradeOffers)[0]>();
    const upgradeByOldSub = new Map<string, (typeof upgradeOffers)[0]>();

    for (const offer of upgradeOffers ?? []) {
      if (offer.old_subscription_id && offer.status === "completed") {
        replacedSubIds.add(offer.old_subscription_id);
        upgradeByOldSub.set(offer.old_subscription_id, offer);
      }
      if (offer.new_subscription_id) {
        upgradeByNewSub.set(offer.new_subscription_id, offer);
      }
    }

    // ── Enrich each subscription row ──────────────────────────────────────────
    const enriched = rows.map((sub) => {
      // Try primary (subscription_id) then secondary (customer_id) lookup
      const order =
        ordersBySubId.get(sub.subscription_id ?? "") ||
        ordersByCustomerId.get(sub.customer_id ?? "") ||
        null;

      const priceMeta = getPriceMeta(sub.price_id);
      const upgradeFrom = upgradeByNewSub.get(sub.subscription_id ?? "");
      const wasReplaced = replacedSubIds.has(sub.subscription_id ?? "");
      const upgradeInfo = upgradeByOldSub.get(sub.subscription_id ?? "");

      const agencyId = order?.agency_id ?? null;
      const agencyName = order?.agency_name ?? null;
      const customerEmail = order?.customer_email ?? null;
      const customerName = order?.customer_name ?? null;
      const stateSlug = order?.state_slug ?? null;
      const stateName = formatStateSlug(stateSlug);
      const sourceListingType = order?.source_listing_type ?? null;
      const top25Rank = order?.top25_rank ?? null;
      const orderAmountCents = order?.amount_total ?? null;

      const tier = priceMeta?.tier ?? null;
      const amountCents = priceMeta?.amount_cents ?? null;
      const interval = priceMeta?.interval ?? null;
      const priceLabel = priceMeta?.label ?? (sub.price_id ? `Unknown (${sub.price_id})` : null);

      const listingLabel = deriveListingLabel({ sourceListingType, top25Rank, tier });

      const periodEndIso = unixToIso(sub.current_period_end);
      const periodStartIso = unixToIso(sub.current_period_start);

      // Determine renewal display semantics
      let renewalState: "renews" | "ends" | "cancelled" | "none";
      if (sub.status === "active" && sub.cancel_at_period_end) {
        renewalState = "ends";
      } else if (sub.status === "active" || sub.status === "trialing") {
        renewalState = "renews";
      } else if (sub.status === "cancelled" || sub.status === "canceled") {
        renewalState = "cancelled";
      } else {
        renewalState = "none";
      }

      const hasFirstTermDiscount =
        !!upgradeFrom &&
        ((upgradeFrom.extra_discount_cents ?? 0) > 0 ||
          (upgradeFrom.credit_cents ?? 0) > 0);
      const firstTermDiscountCents = upgradeFrom
        ? (upgradeFrom.credit_cents ?? 0) + (upgradeFrom.extra_discount_cents ?? 0)
        : 0;

      const paymentMethod =
        sub.payment_method_brand && sub.payment_method_last4
          ? `${sub.payment_method_brand.charAt(0).toUpperCase()}${sub.payment_method_brand.slice(1)} ····${sub.payment_method_last4}`
          : null;

      // is_excluded: only explicitly marked records are excluded
      // NULL reporting_category = not excluded (new/uncategorized records)
      const isExcluded = sub.reporting_category === "excluded_legacy_unrelated";

      // agency_resolved: whether we found an order to enrich this subscription
      const agencyResolved = !!order;

      // MRR contribution (normalized monthly from 6-month cycle)
      const mrrContributionCents = mrrFromPriceId(sub.price_id);

      // Counted-in-MRR determination (mirrors stripe-admin-metrics resolved logic)
      let mrrExclusionReason:
        | "unresolved_agency"
        | "canceled"
        | "unpaid"
        | "incomplete"
        | "missing_price"
        | "legacy_excluded"
        | null = null;
      if (isExcluded) {
        mrrExclusionReason = "legacy_excluded";
      } else if (sub.status === "canceled" || sub.status === "cancelled") {
        mrrExclusionReason = "canceled";
      } else if (sub.status === "past_due" || sub.status === "unpaid") {
        mrrExclusionReason = "unpaid";
      } else if (sub.status === "incomplete" || sub.status === "incomplete_expired") {
        mrrExclusionReason = "incomplete";
      } else if (sub.status !== "active" && sub.status !== "trialing") {
        mrrExclusionReason = "incomplete";
      } else if (!priceMeta || !mrrContributionCents) {
        mrrExclusionReason = "missing_price";
      } else if (!agencyId) {
        mrrExclusionReason = "unresolved_agency";
      }
      const countedInMrr = mrrExclusionReason === null;

      return {
        id: sub.id,
        subscription_id: sub.subscription_id,
        customer_id: sub.customer_id,
        agency_id: agencyId,
        agency_name: agencyName,
        customer_email: customerEmail,
        customer_name: customerName,
        state_slug: stateSlug,
        state_name: stateName,
        price_id: sub.price_id,
        price_label: priceLabel,
        listing_label: listingLabel,
        listing_type: sourceListingType,
        top25_rank: top25Rank,
        tier,
        amount_cents: amountCents,
        order_amount_cents: orderAmountCents,
        interval,
        mrr_contribution_cents: mrrContributionCents,
        counted_in_mrr: countedInMrr,
        mrr_exclusion_reason: mrrExclusionReason,
        status: sub.status,
        cancel_at_period_end: sub.cancel_at_period_end,
        renewal_state: renewalState,
        period_start_iso: periodStartIso,
        period_end_iso: periodEndIso,
        payment_method: paymentMethod,
        payment_method_brand: sub.payment_method_brand,
        payment_method_last4: sub.payment_method_last4,
        reporting_category: sub.reporting_category,
        is_excluded: isExcluded,
        agency_resolved: agencyResolved,
        was_replaced_by_upgrade: wasReplaced,
        replaced_upgrade_info: wasReplaced ? upgradeInfo : null,
        is_upgrade_replacement: !!upgradeFrom,
        upgrade_from_info: upgradeFrom
          ? {
              old_subscription_id: upgradeFrom.old_subscription_id,
              credit_cents: upgradeFrom.credit_cents,
              extra_discount_cents: upgradeFrom.extra_discount_cents,
              final_upgrade_price_cents: upgradeFrom.final_upgrade_price_cents,
            }
          : null,
        has_first_term_discount: hasFirstTermDiscount,
        first_term_discount_cents: firstTermDiscountCents,
        created_at: sub.created_at,
        updated_at: sub.updated_at,
      };
    });

    // ── Apply filters ─────────────────────────────────────────────────────────
    let filtered = enriched;

    if (!includeExcluded) {
      filtered = filtered.filter((s) => !s.is_excluded);
    }

    if (statusFilter && statusFilter !== "all") {
      if (statusFilter === "cancelled") {
        filtered = filtered.filter(
          (s) => s.status === "cancelled" || s.status === "canceled"
        );
      } else if (statusFilter === "active_cancelling") {
        filtered = filtered.filter(
          (s) => s.status === "active" && s.cancel_at_period_end
        );
      } else if (statusFilter === "replaced") {
        filtered = filtered.filter((s) => s.was_replaced_by_upgrade);
      } else if (statusFilter === "unresolved") {
        filtered = filtered.filter((s) => !s.agency_resolved);
      } else {
        filtered = filtered.filter((s) => s.status === statusFilter);
      }
    }

    if (search) {
      filtered = filtered.filter((s) => {
        return (
          s.agency_name?.toLowerCase().includes(search) ||
          s.customer_email?.toLowerCase().includes(search) ||
          s.customer_name?.toLowerCase().includes(search) ||
          s.subscription_id?.toLowerCase().includes(search) ||
          s.customer_id?.toLowerCase().includes(search) ||
          s.state_slug?.toLowerCase().includes(search) ||
          s.state_name?.toLowerCase().includes(search) ||
          s.listing_label?.toLowerCase().includes(search) ||
          s.price_label?.toLowerCase().includes(search)
        );
      });
    }

    const total = filtered.length;
    const paginated = filtered.slice(offset, offset + limit);

    // ── Summary stats (always computed over the full non-excluded set) ─────────
    const included = enriched.filter((s) => !s.is_excluded);

    // Active = 'active' or 'trialing' — must match stripe-admin-metrics definition
    const activeIncluded = included.filter(
      (s) => s.status === "active" || s.status === "trialing"
    );

    // MRR: only count subs where counted_in_mrr === true (resolved + active/trialing + price)
    const countedInMrr = activeIncluded.filter((s) => s.counted_in_mrr);
    const mrrCents = countedInMrr.reduce(
      (sum, s) => sum + s.mrr_contribution_cents,
      0
    );
    const unresolvedActive = activeIncluded.filter(
      (s) => s.mrr_exclusion_reason === "unresolved_agency"
    );
    const unresolvedMrrCents = unresolvedActive.reduce(
      (sum, s) => sum + s.mrr_contribution_cents,
      0
    );

    return json({
      ok: true,
      subscriptions: paginated,
      pagination: {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit),
        has_next: offset + limit < total,
        has_prev: page > 1,
      },
      summary: {
        total_included: included.length,
        active_count: activeIncluded.length,
        trialing_count: included.filter((s) => s.status === "trialing").length,
        cancelled_count: included.filter(
          (s) => s.status === "cancelled" || s.status === "canceled"
        ).length,
        past_due_count: included.filter((s) => s.status === "past_due").length,
        cancelling_count: included.filter(
          (s) => s.status === "active" && s.cancel_at_period_end
        ).length,
        replaced_count: included.filter((s) => s.was_replaced_by_upgrade).length,
        unresolved_count: included.filter((s) => !s.agency_resolved).length,
        excluded_count: enriched.filter((s) => s.is_excluded).length,
        mrr_cents: mrrCents,
        yrr_cents: mrrCents * 12,
        counted_in_mrr_count: countedInMrr.length,
        unresolved_active_count: unresolvedActive.length,
        unresolved_mrr_cents: unresolvedMrrCents,
        unresolved_yrr_cents: unresolvedMrrCents * 12,
      },
    });
  } catch (e) {
    console.error("[stripe-admin-subscriptions] Unexpected error:", e);
    return json({ error: String(e instanceof Error ? e.message : e) }, 500);
  }
});

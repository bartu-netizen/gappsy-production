import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import {
  authenticateAdmin,
  createAuthErrorResponse,
} from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers":
    "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

function json(data: unknown, status = 200) {
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

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceKey) {
      return json({ error: "Server config error" }, 500);
    }

    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const url = new URL(req.url);
    const agencyId =
      url.searchParams.get("agency_id") ||
      (req.method === "POST" ? (await req.json().catch(() => ({}))).agency_id : null);

    if (!agencyId) {
      return json({ error: "agency_id is required" }, 400);
    }

    const [agencyRow, listingRows, stripeRows, top25Rows] = await Promise.all([
      supabase
        .from("other_agencies")
        .select(
          "id, name, state_slug, is_paid_listing, paid_listing_type, " +
          "paid_override_active, paid_override_value, paid_override_reason, " +
          "paid_override_updated_at, paid_override_updated_by",
        )
        .eq("id", agencyId)
        .maybeSingle(),

      supabase
        .from("agency_listings")
        .select("agency_id, state_slug, listing_tier, paid_active, updated_at")
        .eq("agency_id", agencyId),

      supabase
        .from("stripe_orders")
        .select(
          "id, payment_status, status, paid_at, state_slug, source_listing_type, " +
          "product_summary, amount_total, currency, checkout_session_id, created_at",
        )
        .eq("agency_id", agencyId)
        .order("created_at", { ascending: false })
        .limit(10),

      supabase
        .from("top25_slots")
        .select("id, state_slug, rank, is_paid, claimed_at")
        .eq("agency_id", agencyId)
        .eq("is_paid", true)
        .limit(5),
    ]);

    const agency = agencyRow.data as {
      id: string;
      name: string;
      state_slug: string;
      is_paid_listing: boolean;
      paid_listing_type: string | null;
      paid_override_active: boolean;
      paid_override_value: boolean | null;
      paid_override_reason: string | null;
      paid_override_updated_at: string | null;
      paid_override_updated_by: string | null;
    } | null;

    if (!agency) {
      return json({ ok: false, error: "Agency not found" }, 404);
    }

    const listings = (listingRows.data || []) as {
      agency_id: string;
      state_slug: string;
      listing_tier: string;
      paid_active: boolean;
      updated_at: string;
    }[];

    const stripeOrders = (stripeRows.data || []) as {
      id: string | number;
      payment_status: string;
      status: string;
      paid_at: string | null;
      state_slug: string | null;
      source_listing_type: string | null;
      product_summary: string | null;
      amount_total: number | null;
      currency: string | null;
      checkout_session_id: string;
      created_at: string | null;
    }[];

    const top25Paid = (top25Rows.data || []) as {
      id: string;
      state_slug: string;
      rank: number;
      is_paid: boolean;
      claimed_at: string | null;
    }[];

    const confirmedStripeOrders = stripeOrders.filter(
      (o) => o.payment_status === "paid" || o.status === "completed",
    );

    const activatedListings = listings.filter((l) => l.paid_active);

    const stripeBacked = confirmedStripeOrders.length > 0;
    const hasStandardListing = agency.is_paid_listing;
    const hasActivatedListing = activatedListings.some(
      (l) => l.listing_tier === "standard" || l.listing_tier === "free",
    );
    const hasTop25 = top25Paid.length > 0;
    const overrideActive = agency.paid_override_active;
    const overrideValue = agency.paid_override_value;

    let paidSourceReason = "none";
    if (overrideActive && overrideValue === true) {
      paidSourceReason = "manual_override";
    } else if (overrideActive && overrideValue === false) {
      paidSourceReason = "manual_override_free";
    } else if (stripeBacked && hasStandardListing) {
      paidSourceReason = "stripe_confirmed";
    } else if (stripeBacked && hasTop25) {
      paidSourceReason = "stripe_confirmed_top25";
    } else if (stripeBacked) {
      paidSourceReason = "stripe_payment_exists";
    } else if (hasStandardListing && !stripeBacked) {
      paidSourceReason = "webhook_set_no_order_match";
    } else if (hasActivatedListing && !hasStandardListing) {
      paidSourceReason = "listing_activated_only";
    } else if (hasTop25 && !stripeBacked) {
      paidSourceReason = "top25_webhook_set";
    }

    const products: string[] = [];
    if (hasStandardListing) products.push("standard_listing");
    if (hasTop25) products.push("top25_slot");
    if (hasActivatedListing && !hasStandardListing) products.push("listing_activated");

    const lastPaidAt =
      confirmedStripeOrders[0]?.paid_at ||
      confirmedStripeOrders[0]?.created_at ||
      (hasStandardListing ? agency.paid_override_updated_at : null) ||
      null;

    const hasAnyPaidProduct =
      overrideActive
        ? (overrideValue ?? false)
        : (stripeBacked && hasStandardListing) || hasActivatedListing || hasTop25;

    return json({
      ok: true,
      agency_id: agencyId,
      agency_name: agency.name,
      state_slug: agency.state_slug,

      is_paid_listing: agency.is_paid_listing,
      paid_listing_type: agency.paid_listing_type,

      standard_listing_active: hasActivatedListing,
      standard_listing_states: activatedListings.map((l) => l.state_slug),

      has_top25_paid: hasTop25,
      top25_paid_slots: top25Paid.map((s) => ({
        state_slug: s.state_slug,
        rank: s.rank,
        claimed_at: s.claimed_at,
      })),

      has_any_paid_product: hasAnyPaidProduct,
      products,
      paid_source_reason: paidSourceReason,
      stripe_backed: stripeBacked,

      manual_override_active: overrideActive,
      manual_override_value: overrideValue,
      manual_override_reason: agency.paid_override_reason,
      manual_override_updated_at: agency.paid_override_updated_at,
      manual_override_updated_by: agency.paid_override_updated_by,

      last_paid_event_at: lastPaidAt,

      stripe_orders: confirmedStripeOrders.map((o) => ({
        id: o.id,
        paid_at: o.paid_at || o.created_at,
        state_slug: o.state_slug,
        source_listing_type: o.source_listing_type,
        product_summary: o.product_summary,
        amount_total: o.amount_total,
        currency: o.currency,
        checkout_session_id: o.checkout_session_id,
      })),

      all_stripe_orders_count: stripeOrders.length,
    });
  } catch (err) {
    console.error("[agency-commercial-status] error:", err);
    return json(
      {
        ok: false,
        error: err instanceof Error ? err.message : "Internal error",
      },
      500,
    );
  }
});

import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
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
    const url = new URL(req.url);
    const agencyId = url.searchParams.get("agency_id");

    if (!agencyId) {
      return json({ error: "agency_id is required" }, 400);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceKey) {
      return json({ error: "Server config error" }, 500);
    }

    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const [agencyResult, stripeResult, listingResult] = await Promise.all([
      supabase
        .from("other_agencies")
        .select("id, is_paid_listing, paid_override_active, paid_override_value")
        .eq("id", agencyId)
        .maybeSingle(),

      supabase
        .from("stripe_orders")
        .select("id, payment_status, source_listing_type, amount_total")
        .eq("agency_id", agencyId)
        .eq("payment_status", "paid")
        .limit(5),

      supabase
        .from("agency_listings")
        .select("id, paid_active, listing_tier")
        .eq("agency_id", agencyId)
        .eq("paid_active", true)
        .eq("listing_tier", "standard")
        .limit(1),
    ]);

    const agency = agencyResult.data;
    if (!agency) {
      return json({ is_standard_paid: false, paid_source: "not_found" });
    }

    const overrideActive = !!agency.paid_override_active;
    const overrideValue = agency.paid_override_value;

    if (overrideActive) {
      return json({
        is_standard_paid: overrideValue === true,
        paid_source: overrideValue === true ? "manual_override_paid" : "manual_override_free",
      });
    }

    const confirmedStripeOrders = stripeResult.data ?? [];
    const hasStripePaid = confirmedStripeOrders.length > 0;
    const hasFlagSet = !!agency.is_paid_listing;

    if (hasFlagSet && hasStripePaid) {
      return json({ is_standard_paid: true, paid_source: "stripe_confirmed" });
    }

    const hasActivatedListing = (listingResult.data ?? []).length > 0;
    if (hasActivatedListing) {
      return json({ is_standard_paid: true, paid_source: "agency_listing_active" });
    }

    return json({
      is_standard_paid: false,
      paid_source: hasFlagSet ? "flag_set_no_stripe" : "none",
    });
  } catch (err) {
    console.error("[other-agency-paid-status] error:", err);
    return json({ error: "Internal error" }, 500);
  }
});

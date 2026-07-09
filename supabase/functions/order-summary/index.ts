import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import Stripe from "npm:stripe@17.7.0";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

const supabase = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
);

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const stripeSecret = Deno.env.get("STRIPE_SECRET_KEY");
    if (!stripeSecret) {
      return new Response(
        JSON.stringify({ error: "Stripe not configured" }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const stripe = new Stripe(stripeSecret, { apiVersion: "2024-11-20.acacia" });

    const url = new URL(req.url);
    const sessionId = url.searchParams.get("session_id");

    if (!sessionId) {
      return new Response(
        JSON.stringify({ error: "Missing session_id parameter" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    console.log("[order-summary] Fetching session:", sessionId);

    const session = await stripe.checkout.sessions.retrieve(sessionId);
    if (!session) {
      return new Response(
        JSON.stringify({ error: "Session not found" }),
        { status: 404, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const metadata = session.metadata || {};
    console.log("[order-summary] Session metadata:", metadata);

    const agencyName = metadata.agencyName || "Your Agency";
    const stateName = metadata.stateName || "New Jersey";
    const stateSlug = metadata.stateSlug || "new-jersey";
    const listingType = metadata.listingType || metadata.funnel || "other_listing";
    const rankNumber = metadata.rank ? parseInt(metadata.rank) : null;
    const hasCardVisualUpgrade = metadata.upsellCardVisual === "true";

    // --- Payment status + agency_id from DB (DB is authoritative over metadata) ---
    let paymentStatus = "pending";
    let orderStatus = "pending";
    let dbAgencyId: string | null = null;

    const { data: orderData } = await supabase
      .from("stripe_orders")
      .select("payment_status, status, agency_id")
      .eq("checkout_session_id", sessionId)
      .maybeSingle();

    if (orderData) {
      paymentStatus = orderData.payment_status || session.payment_status || "pending";
      orderStatus = orderData.status || "pending";
      dbAgencyId = orderData.agency_id || null;
    }

    // stripe_orders.agency_id is written by the webhook resolver and is authoritative.
    // Fall back to checkout metadata only when the DB column is missing (e.g. pre-webhook).
    const agencyId = dbAgencyId || metadata.agencyId || null;

    console.log("[order-summary] Payment status:", { paymentStatus, orderStatus });

    // --- Canonical data: top25_slots (for Top 25 purchases) ---
    let top25SlotId: string | null = null;
    let canonicalLogoUrl: string | null = null;
    let canonicalWebsite: string | null = null;
    let canonicalDescription: string | null = null;
    let canonicalServices: string[] = [];
    let logoSource: string = "none";

    const isTop25 = listingType === "top25" || listingType === "top25_rank";

    if (isTop25 && agencyId && rankNumber) {
      const { data: slotByAgency } = await supabase
        .from("top25_slots")
        .select("id, logo_url, website, description, short_description, services")
        .eq("state_slug", stateSlug)
        .eq("rank", rankNumber)
        .eq("agency_id", agencyId)
        .maybeSingle();

      if (slotByAgency) {
        top25SlotId = slotByAgency.id;
        canonicalLogoUrl = slotByAgency.logo_url || null;
        canonicalWebsite = slotByAgency.website || null;
        canonicalDescription = slotByAgency.description || slotByAgency.short_description || null;
        canonicalServices = slotByAgency.services || [];
        logoSource = canonicalLogoUrl ? "top25_slots" : "none";
      } else if (rankNumber) {
        const { data: slotByRank } = await supabase
          .from("top25_slots")
          .select("id, agency_id, logo_url, website, description, short_description, services")
          .eq("state_slug", stateSlug)
          .eq("rank", rankNumber)
          .maybeSingle();

        if (slotByRank) {
          top25SlotId = slotByRank.id;
          canonicalLogoUrl = slotByRank.logo_url || null;
          canonicalWebsite = slotByRank.website || null;
          canonicalDescription = slotByRank.description || slotByRank.short_description || null;
          canonicalServices = slotByRank.services || [];
          logoSource = canonicalLogoUrl ? "top25_slots" : "none";
        }
      }
    }

    // --- Canonical data: spotlight_placements ---
    let spotlightId: string | null = null;

    const isSpotlight = listingType === "spotlight";
    if (isSpotlight && stateSlug && rankNumber) {
      const { data: spotlightRow } = await supabase
        .from("spotlight_placements")
        .select("id, logo_url, website_url, full_description, short_description, services")
        .eq("state_slug", stateSlug)
        .eq("position", rankNumber)
        .maybeSingle();

      if (spotlightRow) {
        spotlightId = spotlightRow.id;
        if (!canonicalLogoUrl && spotlightRow.logo_url) {
          canonicalLogoUrl = spotlightRow.logo_url;
          logoSource = "spotlight_placements";
        }
        if (!canonicalWebsite) canonicalWebsite = spotlightRow.website_url || null;
        if (!canonicalDescription) canonicalDescription = spotlightRow.full_description || spotlightRow.short_description || null;
        if (canonicalServices.length === 0) canonicalServices = spotlightRow.services || [];
      }
    }

    // --- Canonical data: other_agencies ---
    let agencySlug: string | null = metadata.agencySlug || null;
    let otherAgencyData: { id: string; name: string; slug: string; logo_url: string | null } | null = null;

    if (agencyId) {
      const { data: oaData } = await supabase
        .from("other_agencies")
        .select("id, name, slug, logo_url, state_slug")
        .eq("id", agencyId)
        .maybeSingle();

      if (oaData) {
        otherAgencyData = oaData;
        agencySlug = agencySlug || oaData.slug || null;
        if (!canonicalLogoUrl && oaData.logo_url) {
          canonicalLogoUrl = oaData.logo_url;
          logoSource = "other_agencies";
        }
      }
    }

    // If slug still missing, try resolving by name + state
    if (!agencySlug && !agencyId && metadata.agencySlug) {
      agencySlug = metadata.agencySlug;
    }

    // --- Metadata fallbacks ---
    const website = canonicalWebsite || metadata.agencyWebsite || "";
    const description = canonicalDescription || metadata.agencyDescription || "";
    const services = canonicalServices.length > 0
      ? canonicalServices
      : (metadata.agencyServices ? metadata.agencyServices.split(",").map((s: string) => s.trim()).filter(Boolean) : []);

    const logoUploadStatus = canonicalLogoUrl ? "uploaded" : "not_uploaded";

    console.log("[order-summary] Resolved:", { agencySlug, logoSource, logoUrl: canonicalLogoUrl });

    const summary = {
      agencyId,
      agencyName,
      agencySlug,
      stateName,
      stateSlug,
      listingType,
      rankNumber,
      top25SlotId,
      spotlightId,
      hasCardVisualUpgrade,
      website,
      description,
      services,
      location: stateName,
      logoUrl: canonicalLogoUrl,
      logoUploadStatus,
      logoSource,
      sessionId,
      paymentStatus,
      orderStatus,
      isPaymentConfirmed: paymentStatus === "paid" || orderStatus === "completed",
      amountTotal: session.amount_total ? session.amount_total / 100 : null,
    };

    console.log("[order-summary] Returning summary:", summary);

    return new Response(JSON.stringify(summary), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("[order-summary] Error:", error);
    return new Response(
      JSON.stringify({ error: "Failed to fetch order summary", details: error instanceof Error ? error.message : "Unknown error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});

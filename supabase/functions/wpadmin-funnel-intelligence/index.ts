import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers":
    "Content-Type, Authorization, X-Client-Info, Apikey, Accept, x-admin-secret, x-admin-token",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function rangeToFromDate(range: string): string | null {
  if (range === "all") return null;
  const days =
    range === "24h" ? 1 :
    range === "7d" ? 7 :
    range === "30d" ? 30 :
    range === "90d" ? 90 : 30;
  const d = new Date();
  d.setDate(d.getDate() - days);
  return d.toISOString();
}

const FUNNEL_STEP_PRIORITY: Record<string, number> = {
  activation_page_viewed: 1,
  standard_listing_selected: 2,
  top25_upsell_viewed: 3,
  top25_upgrade_selected: 4,
  top25_confirm_viewed: 5,
  checkout_opened: 6,
  purchase_completed: 7,
};

const STEP_LABELS: Record<string, string> = {
  activation_page_viewed: "Activation viewed",
  standard_listing_selected: "Standard selected",
  top25_upsell_viewed: "Top-25 upsell viewed",
  top25_upgrade_selected: "Top-25 selected",
  top25_confirm_viewed: "Top-25 confirm viewed",
  checkout_opened: "Checkout opened",
  checkout_page_viewed: "Checkout opened",
  purchase_completed: "Purchased",
};

interface AgencyIntel {
  agency_id: string;
  agency_name: string;
  state_slug: string;
  activation_views: number;
  standard_selections: number;
  top25_upsell_views: number;
  top25_selections: number;
  top25_confirm_views: number;
  checkout_opens: number;
  purchases: number;
  last_activation_view: string | null;
  last_standard_selection: string | null;
  last_top25_upsell_view: string | null;
  last_top25_selection: string | null;
  last_top25_confirm_view: string | null;
  last_checkout_open: string | null;
  last_purchase: string | null;
  deepest_step: string;
  deepest_step_label: string;
  intent_level: string;
  is_paid: boolean;
  listing_status: string | null;
  last_selected_rank: string | null;
  last_selected_price: string | null;
  discount_token: string | null;
  discount_percent: string | null;
  last_checkout_product: string | null;
  offer_15_url: string | null;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }
  if (req.method !== "GET") {
    return json({ error: "Method not allowed" }, 405);
  }

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
  const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    return json({ error: "Missing env vars" }, 500);
  }

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) return createAuthErrorResponse(authResult, corsHeaders);

    const url = new URL(req.url);
    const range = url.searchParams.get("range") ?? "30d";
    const confidenceFilter = url.searchParams.get("confidence_filter") ?? "all"; // all | likely_human | verified_only
    const fromDate = rangeToFromDate(range);

    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

    // Source 1: email_notification_logs (most authoritative for activation/checkout events)
    let q1 = supabase
      .from("email_notification_logs")
      .select("id, created_at, notification_type, payload")
      .in("notification_type", [
        "activation_page_viewed",
        "activation_option_selected",
        "stripe_checkout_opened",
      ]);
    if (fromDate) q1 = q1.gte("created_at", fromDate);
    q1 = q1.order("created_at", { ascending: false }).limit(10000);

    // Source 2: funnel_events for top25_upsell_viewed, top25_confirm_viewed, checkout_page_viewed, standard_listing_selected
    let q2 = supabase
      .from("funnel_events")
      .select("id, created_at, event_name, agency_id, state_slug, metadata, intent_level")
      .in("event_name", [
        "activation_page_viewed",
        "top25_upsell_viewed",
        "top25_confirm_viewed",
        "top25_upgrade_selected",
        "checkout_page_viewed",
        "standard_listing_selected",
      ]);
    if (fromDate) q2 = q2.gte("created_at", fromDate);
    if (confidenceFilter === "verified_only") {
      q2 = q2.eq("intent_level", "verified_human");
    } else if (confidenceFilter === "likely_human") {
      q2 = q2.in("intent_level", ["possible_human", "verified_human"]);
    }
    q2 = q2.order("created_at", { ascending: false }).limit(10000);

    // Source 3: stripe_orders for purchase confirmation
    let q3 = supabase
      .from("stripe_orders")
      .select("id, agency_id, agency_name, state_slug, payment_status, status, product_summary, created_at, paid_at")
      .eq("payment_status", "paid");
    if (fromDate) q3 = q3.gte("created_at", fromDate);
    q3 = q3.order("created_at", { ascending: false }).limit(5000);

    const [r1, r2, r3] = await Promise.all([q1, q2, q3]);

    // Aggregate by agency_id
    const agencyMap = new Map<string, AgencyIntel>();
    // Dedup sets: track checkout_session_ids per agency to avoid double counting
    const checkoutSessionIds = new Map<string, Set<string>>();
    // Track standard selection timestamps per agency to dedupe same-minute duplicates
    const standardSelMinutes = new Map<string, Set<string>>();

    function getOrCreate(aid: string, name: string, stateSlug: string): AgencyIntel {
      if (!aid) return null as unknown as AgencyIntel;
      let entry = agencyMap.get(aid);
      if (!entry) {
        entry = {
          agency_id: aid,
          agency_name: name || "Unknown",
          state_slug: stateSlug || "",
          activation_views: 0,
          standard_selections: 0,
          top25_upsell_views: 0,
          top25_selections: 0,
          top25_confirm_views: 0,
          checkout_opens: 0,
          purchases: 0,
          last_activation_view: null,
          last_standard_selection: null,
          last_top25_upsell_view: null,
          last_top25_selection: null,
          last_top25_confirm_view: null,
          last_checkout_open: null,
          last_purchase: null,
          deepest_step: "activation_page_viewed",
          deepest_step_label: "Activation viewed",
          intent_level: "low",
          is_paid: false,
          listing_status: null,
          last_selected_rank: null,
          last_selected_price: null,
          discount_token: null,
          discount_percent: null,
          last_checkout_product: null,
          offer_15_url: null,
        };
        agencyMap.set(aid, entry);
      }
      if (name && entry.agency_name === "Unknown") entry.agency_name = name;
      if (stateSlug && !entry.state_slug) entry.state_slug = stateSlug;
      return entry;
    }

    function trackCheckoutSession(aid: string, sessionId: string | null): boolean {
      if (!sessionId) return false;
      let set = checkoutSessionIds.get(aid);
      if (!set) { set = new Set(); checkoutSessionIds.set(aid, set); }
      if (set.has(sessionId)) return true; // already seen
      set.add(sessionId);
      return false;
    }

    function trackStandardMinute(aid: string, createdAt: string): boolean {
      const minute = createdAt.slice(0, 16); // YYYY-MM-DDTHH:MM
      let set = standardSelMinutes.get(aid);
      if (!set) { set = new Set(); standardSelMinutes.set(aid, set); }
      if (set.has(minute)) return true; // duplicate same-minute
      set.add(minute);
      return false;
    }

    // Process email_notification_logs
    for (const row of (r1.data ?? []) as Record<string, unknown>[]) {
      const payload = (row.payload as Record<string, unknown>) ?? {};
      const aid = (payload.agency_id as string) ?? "";
      if (!aid) continue;
      // Strict confidence filter — consistent with wpadmin-product-funnel behavior
      if (confidenceFilter !== "all") {
        const il = (typeof payload.intent_level === "string" ? payload.intent_level : null);
        if (confidenceFilter === "verified_only") {
          // Only verified_human — null/missing excluded
          if (il !== "verified_human") continue;
        } else if (confidenceFilter === "likely_human") {
          // Only possible_human or verified_human — null/missing excluded
          if (il !== "possible_human" && il !== "verified_human") continue;
        }
      }
      const name = (payload.agency_name as string) ?? "";
      const stateSlug = (payload.state_slug as string) ?? "";
      const createdAt = row.created_at as string;
      const notifType = row.notification_type as string;

      const entry = getOrCreate(aid, name, stateSlug);
      if (!entry) continue;

      if (notifType === "activation_page_viewed") {
        entry.activation_views++;
        if (!entry.last_activation_view || createdAt > entry.last_activation_view) {
          entry.last_activation_view = createdAt;
        }
      } else if (notifType === "activation_option_selected") {
        const optType = (payload.selected_option_type as string) ?? (payload.selected_option as string) ?? "";
        if (optType === "standard" || (payload.selected_option as string)?.toLowerCase().includes("standard")) {
          if (!trackStandardMinute(aid, createdAt)) {
            entry.standard_selections++;
            if (!entry.last_standard_selection || createdAt > entry.last_standard_selection) {
              entry.last_standard_selection = createdAt;
            }
          }
        }
        if (optType === "top25" || (payload.selected_option as string)?.toLowerCase().includes("top")) {
          entry.top25_selections++;
          if (!entry.last_top25_selection || createdAt > entry.last_top25_selection) {
            entry.last_top25_selection = createdAt;
          }
          const rank = (payload.selected_rank as string) ?? "";
          const price = (payload.selected_price as string) ?? "";
          if (rank) entry.last_selected_rank = rank;
          if (price) entry.last_selected_price = price;
        }
        const dp = (payload.discount_percent as string) ?? "";
        if (dp) entry.discount_percent = dp;
      } else if (notifType === "stripe_checkout_opened") {
        const csId = (payload.checkout_session_id as string) ?? (payload.session_id as string) ?? "";
        if (!trackCheckoutSession(aid, csId || null)) {
          entry.checkout_opens++;
          if (!entry.last_checkout_open || createdAt > entry.last_checkout_open) {
            entry.last_checkout_open = createdAt;
          }
          const position = (payload.position as string) ?? "";
          if (position) entry.last_checkout_product = position;
          const offerToken = (payload.offer_token as string) ?? "";
          if (offerToken) entry.discount_token = offerToken;
        }
      }
    }

    // Process funnel_events
    for (const row of (r2.data ?? []) as Record<string, unknown>[]) {
      const aid = (row.agency_id as string) ?? "";
      if (!aid) continue;
      const meta = (row.metadata as Record<string, unknown>) ?? {};
      const name = (meta.agency_name as string) ?? (meta.agencyName as string) ?? "";
      const stateSlug = (row.state_slug as string) ?? (meta.state_slug as string) ?? "";
      const createdAt = row.created_at as string;
      const eventName = row.event_name as string;

      const entry = getOrCreate(aid, name, stateSlug);
      if (!entry) continue;

      if (eventName === "top25_upsell_viewed") {
        entry.top25_upsell_views++;
        if (!entry.last_top25_upsell_view || createdAt > entry.last_top25_upsell_view) {
          entry.last_top25_upsell_view = createdAt;
        }
      } else if (eventName === "top25_confirm_viewed") {
        entry.top25_confirm_views++;
        if (!entry.last_top25_confirm_view || createdAt > entry.last_top25_confirm_view) {
          entry.last_top25_confirm_view = createdAt;
        }
      } else if (eventName === "top25_upgrade_selected") {
        entry.top25_selections++;
        if (!entry.last_top25_selection || createdAt > entry.last_top25_selection) {
          entry.last_top25_selection = createdAt;
          const rank = (meta.selected_rank as string) ?? (meta.rank as string) ?? "";
          const price = (meta.selected_price as string) ?? (meta.price as string) ?? "";
          const dp = (meta.discount_percent as string) ?? "";
          const token = (meta.offer_token as string) ?? "";
          const product = (meta.listing_tier as string) ?? (meta.listing_type as string) ?? "";
          if (rank) entry.last_selected_rank = rank;
          if (price) entry.last_selected_price = price;
          if (dp) entry.discount_percent = dp;
          if (token) entry.discount_token = token;
          if (product && !entry.last_checkout_product) entry.last_checkout_product = product;
        } else {
          const rank = (meta.selected_rank as string) ?? (meta.rank as string) ?? "";
          const price = (meta.selected_price as string) ?? (meta.price as string) ?? "";
          const dp = (meta.discount_percent as string) ?? "";
          const token = (meta.offer_token as string) ?? "";
          if (rank && !entry.last_selected_rank) entry.last_selected_rank = rank;
          if (price && !entry.last_selected_price) entry.last_selected_price = price;
          if (dp && !entry.discount_percent) entry.discount_percent = dp;
          if (token && !entry.discount_token) entry.discount_token = token;
        }
      } else if (eventName === "checkout_page_viewed") {
        const csId = (meta.checkout_session_id as string) ?? (meta.session_id as string) ?? "";
        if (!trackCheckoutSession(aid, csId || null)) {
          entry.checkout_opens++;
          if (!entry.last_checkout_open || createdAt > entry.last_checkout_open) {
            entry.last_checkout_open = createdAt;
          }
          const rank = (meta.rank as string) ?? "";
          const product = (meta.listing_type as string) ?? (meta.listing_tier as string) ?? (meta.checkout_source as string) ?? "";
          if (product && !entry.last_checkout_product) entry.last_checkout_product = product;
          if (rank && !entry.last_selected_rank) entry.last_selected_rank = rank;
          const offerApplied = (meta.offer_applied as string) ?? (meta.offer_token as string) ?? "";
          if (offerApplied && !entry.discount_token) entry.discount_token = offerApplied;
        }
      } else if (eventName === "standard_listing_selected") {
        if (!trackStandardMinute(aid, createdAt)) {
          entry.standard_selections++;
          if (!entry.last_standard_selection || createdAt > entry.last_standard_selection) {
            entry.last_standard_selection = createdAt;
          }
        }
      } else if (eventName === "activation_page_viewed") {
        // Already counted from notification logs; only count if not already there
        if (entry.activation_views === 0) {
          entry.activation_views++;
          if (!entry.last_activation_view || createdAt > entry.last_activation_view) {
            entry.last_activation_view = createdAt;
          }
        }
      }
    }

    // Process stripe_orders for purchases
    for (const row of (r3.data ?? []) as Record<string, unknown>[]) {
      const aid = (row.agency_id as string) ?? "";
      if (!aid) continue;
      const name = (row.agency_name as string) ?? "";
      const stateSlug = (row.state_slug as string) ?? "";
      const paidAt = (row.paid_at as string) ?? (row.created_at as string) ?? "";

      const entry = getOrCreate(aid, name, stateSlug);
      if (!entry) continue;

      entry.purchases++;
      entry.is_paid = true;
      if (!entry.last_purchase || paidAt > entry.last_purchase) {
        entry.last_purchase = paidAt;
      }
      if (!entry.last_checkout_product) {
        entry.last_checkout_product = (row.product_summary as string) ?? null;
      }
    }

    // Resolve deepest step and intent level for each agency
    const agencyIds = Array.from(agencyMap.keys()).slice(0, 2000);

    // Enrich with other_agencies listing status
    if (agencyIds.length > 0) {
      const { data: oaRows } = await supabase
        .from("other_agencies")
        .select("id, is_paid_listing, listing_management_status, is_active")
        .in("id", agencyIds);
      for (const row of (oaRows ?? []) as Record<string, unknown>[]) {
        const entry = agencyMap.get(row.id as string);
        if (!entry) continue;
        if (row.is_paid_listing === true) entry.is_paid = true;
        const status = (row.listing_management_status as string) ?? (row.is_active === true ? "active" : "inactive");
        entry.listing_status = status;
      }
    }

    // Enrich with existing valid 15% discount offer URLs (read-only, no creation)
    if (agencyIds.length > 0) {
      const BASE_URL = "https://www.gappsy.com";
      const now = new Date();

      const { data: discountRows } = await supabase
        .from("discount_offers")
        .select("agency_id, token, expires_at, max_uses, usage_count, allowed_products")
        .in("agency_id", agencyIds)
        .eq("discount_value", 15)
        .eq("discount_type", "percentage")
        .eq("is_active", true)
        .order("created_at", { ascending: false });

      for (const row of (discountRows ?? []) as Record<string, unknown>[]) {
        const aid = row.agency_id as string;
        const entry = agencyMap.get(aid);
        if (!entry || entry.offer_15_url) continue;

        if (row.expires_at && new Date(row.expires_at as string) <= now) continue;
        if (row.max_uses !== null && (row.usage_count as number) >= (row.max_uses as number)) continue;
        const products = (row.allowed_products as string[]) || [];
        if (!products.includes("activation") && !products.includes("all")) continue;

        entry.offer_15_url = `${BASE_URL}/offer/${row.token as string}`;
      }
    }

    // Compute deepest step and intent level
    // Priority: purchase_completed > checkout_opened > top25_confirm_viewed > top25_upgrade_selected > top25_upsell_viewed > standard_listing_selected > activation_page_viewed
    for (const entry of agencyMap.values()) {
      let deepest = "activation_page_viewed";
      if (entry.purchases > 0) deepest = "purchase_completed";
      else if (entry.checkout_opens > 0) deepest = "checkout_opened";
      else if (entry.top25_confirm_views > 0) deepest = "top25_confirm_viewed";
      else if (entry.top25_selections > 0) deepest = "top25_upgrade_selected";
      else if (entry.top25_upsell_views > 0) deepest = "top25_upsell_viewed";
      else if (entry.standard_selections > 0) deepest = "standard_listing_selected";

      entry.deepest_step = deepest;
      entry.deepest_step_label = STEP_LABELS[deepest] ?? deepest;

      // Intent level
      if (entry.purchases > 0) {
        entry.intent_level = "purchased";
      } else if (entry.checkout_opens >= 2) {
        entry.intent_level = "very_high";
      } else if (entry.checkout_opens > 0) {
        entry.intent_level = "very_high";
      } else if (entry.top25_confirm_views > 0 || entry.top25_selections > 0) {
        entry.intent_level = "high";
      } else if (entry.top25_upsell_views > 0) {
        entry.intent_level = "medium_high";
      } else if (entry.standard_selections > 0 || entry.activation_views >= 3) {
        entry.intent_level = "medium";
      } else {
        entry.intent_level = "low";
      }
    }

    const results = Array.from(agencyMap.values());

    return json({
      range,
      from: fromDate,
      total_agencies: results.length,
      agencies: results,
    });
  } catch (err) {
    return json({ error: err instanceof Error ? err.message : String(err) }, 500);
  }
});

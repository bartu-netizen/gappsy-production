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

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    console.log("[upgrade-offer-state-slots] Request received:", req.method);
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      console.warn("[upgrade-offer-state-slots] Auth failed:", authResult.error);
      return createAuthErrorResponse(authResult, corsHeaders);
    }
    console.log("[upgrade-offer-state-slots] Auth success, sessionType:", authResult.sessionType);

    const url = new URL(req.url);
    const stateSlug = url.searchParams.get("state_slug") || (req.method === "POST" ? (await req.json().catch(() => ({}))).state_slug : null);

    if (!stateSlug) {
      console.warn("[upgrade-offer-state-slots] Missing state_slug");
      return jsonResponse({ error: "state_slug is required" }, 400);
    }
    console.log("[upgrade-offer-state-slots] Fetching slots for state_slug:", stateSlug);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !supabaseServiceKey) {
      return jsonResponse({ error: "Server configuration error" }, 500);
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const { data: slots, error } = await supabase
      .from("top25_slots")
      .select("id, rank, agency_id, agency_name, is_paid, is_available, slot_status, manual_override, state_slug")
      .eq("state_slug", stateSlug)
      .order("rank", { ascending: true });

    if (error) {
      console.error("[upgrade-offer-state-slots] DB error:", error);
      return jsonResponse({ error: "Failed to fetch slots" }, 500);
    }

    const TIER_PRICE_CENTS = { premium: 29700, priority: 24700, standard: 19700 };
    const AGENCY_ACTIVATION_CENTS = 9700;

    const slotsWithMeta = (slots || []).map((slot) => {
      let tier: "premium" | "priority" | "standard";
      if (slot.rank >= 1 && slot.rank <= 8) tier = "premium";
      else if (slot.rank >= 9 && slot.rank <= 16) tier = "priority";
      else tier = "standard";

      const fullPriceCents = TIER_PRICE_CENTS[tier];
      const baseDiffCents = fullPriceCents - AGENCY_ACTIVATION_CENTS;

      const isTaken =
        slot.is_paid === true ||
        slot.slot_status === "sold" ||
        slot.manual_override === true ||
        slot.is_available === false ||
        !!slot.agency_id;
      const isAvailable = !isTaken;

      return {
        id: slot.id,
        rank: slot.rank,
        agency_id: slot.agency_id,
        agency_name: slot.agency_name,
        is_paid: slot.is_paid,
        is_available: isAvailable,
        slot_status: slot.slot_status,
        manual_override: slot.manual_override,
        tier,
        full_price_cents: fullPriceCents,
        base_diff_cents: baseDiffCents,
        state_slug: slot.state_slug,
      };
    });

    const available = slotsWithMeta.filter((s) => s.is_available && s.rank >= 2);
    const taken = slotsWithMeta.filter((s) => !s.is_available);

    return jsonResponse({
      state_slug: stateSlug,
      total: slots?.length || 0,
      available_count: available.length,
      taken_count: taken.length,
      available_slots: available,
      all_slots: slotsWithMeta,
    });
  } catch (e) {
    console.error("[upgrade-offer-state-slots] Unexpected error:", e);
    return jsonResponse({ error: "Internal server error" }, 500);
  }
});

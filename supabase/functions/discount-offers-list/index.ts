import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return createAuthErrorResponse(authResult, corsHeaders);
    }

    const url = new URL(req.url);
    const agencyId = url.searchParams.get("agency_id");
    const pushOnly = url.searchParams.get("push_only") === "true";

    if (!agencyId) {
      return new Response(
        JSON.stringify({ error: "agency_id required" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const supabaseKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, supabaseKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const SELECT_COLS =
      "id, token, agency_id, agency_slug, state_slug, discount_type, discount_value, " +
      "allowed_products, expires_at, max_uses, usage_count, is_active, internal_note, " +
      "created_at, created_by, push_enabled, scope_type, scope_expires_at";

    let query = supabase
      .from("discount_offers")
      .select(SELECT_COLS)
      .eq("agency_id", agencyId)
      .order("created_at", { ascending: false })
      .limit(20);

    // push_only mode: only return active pushed offers that are still valid and not max-used
    if (pushOnly) {
      const now = new Date().toISOString();
      query = (supabase
        .from("discount_offers")
        .select(SELECT_COLS)
        .eq("agency_id", agencyId)
        .eq("push_enabled", true)
        .eq("is_active", true)
        .or(`expires_at.is.null,expires_at.gt.${now}`)
        .or(`scope_expires_at.is.null,scope_expires_at.gt.${now}`)
        .or("max_uses.is.null,usage_count.lt.max_uses")
        .order("created_at", { ascending: false })
        .limit(5)) as typeof query;
    }

    const { data: offers, error: offersError } = await query;

    if (offersError) {
      return new Response(
        JSON.stringify({ error: "Failed to fetch offers", details: offersError.message }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const offerIds = (offers || []).map((o: { id: string }) => o.id);

    let recentEvents: Record<string, unknown>[] = [];
    if (offerIds.length > 0) {
      const { data: events } = await supabase
        .from("funnel_events")
        .select("id, event_name, created_at, metadata")
        .or(offerIds.map((id: string) => `metadata->>offer_id.eq.${id}`).join(","))
        .order("created_at", { ascending: false })
        .limit(50);
      recentEvents = events || [];
    }

    const masked = (offers || []).map((o: Record<string, unknown>) => {
      const token = o.token as string;
      const maskedToken = token.length > 6
        ? `...${token.slice(-6)}`
        : `...${token.slice(-3)}`;
      return {
        ...o,
        masked_token: maskedToken,
      };
    });

    return new Response(
      JSON.stringify({ offers: masked, recent_events: recentEvents }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  } catch (err) {
    return new Response(
      JSON.stringify({ error: "Internal server error", details: err instanceof Error ? err.message : "Unknown" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }
});

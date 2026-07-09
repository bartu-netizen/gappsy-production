import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

const TIERS = [15, 20, 25] as const;

function generateToken(): string {
  return crypto.randomUUID().replace(/-/g, "");
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const auth = await authenticateAdmin(req);
    if (!auth.success) {
      return createAuthErrorResponse(auth, corsHeaders);
    }

    if (req.method !== "POST") {
      return new Response(JSON.stringify({ error: "Method not allowed" }), {
        status: 405,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const body = await req.json();
    const agency_id = body.agency_id || body.agencyId;
    const agency_slug = body.agency_slug || body.agencySlug;
    const state_slug = body.state_slug || body.stateSlug;

    if (!agency_id) {
      return new Response(
        JSON.stringify({ error: "agency_id is required" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    const now = new Date();

    // Fetch existing active percentage offers for this agency
    let query = supabase
      .from("discount_offers")
      .select(
        "id, token, agency_id, agency_slug, state_slug, discount_type, discount_value, " +
        "allowed_products, expires_at, max_uses, usage_count, is_active, push_enabled, " +
        "scope_type, scope_expires_at, created_at, internal_note",
      )
      .eq("agency_id", agency_id)
      .eq("is_active", true)
      .eq("discount_type", "percentage")
      .order("created_at", { ascending: false });

    // State-scoped: only match offers for the same state
    if (state_slug) {
      query = query.eq("state_slug", state_slug);
    } else {
      query = query.is("state_slug", null);
    }

    const { data: existing, error: fetchErr } = await query;

    if (fetchErr) {
      return new Response(
        JSON.stringify({ error: "Failed to fetch existing offers", details: fetchErr.message }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    // Find one valid offer per tier (newest first due to order above)
    const tierMap: Record<number, Record<string, unknown>> = {};
    for (const o of existing || []) {
      const pct = Math.round(Number(o.discount_value));
      if (!TIERS.includes(pct as 15 | 20 | 25)) continue;
      if (o.max_uses !== null && o.usage_count >= o.max_uses) continue;
      if (o.expires_at && new Date(o.expires_at) <= now) continue;
      const products: string[] = o.allowed_products || [];
      if (!products.includes("activation") && !products.includes("all")) continue;
      // Use the newest valid offer found for each tier
      if (!tierMap[pct]) {
        tierMap[pct] = o;
      }
    }

    // Create missing tiers
    const toInsert: Record<string, unknown>[] = [];
    const expiresAt = new Date(now.getTime() + 30 * 24 * 60 * 60 * 1000).toISOString();

    for (const pct of TIERS) {
      if (tierMap[pct]) continue;
      const record: Record<string, unknown> = {
        token: generateToken(),
        agency_id,
        discount_type: "percentage",
        discount_value: pct,
        allowed_products: ["activation"],
        max_uses: 1,
        usage_count: 0,
        is_active: true,
        expires_at: expiresAt,
        internal_note: `Auto-ensured tier ${pct}%`,
      };
      if (agency_slug) record.agency_slug = agency_slug;
      if (state_slug) record.state_slug = state_slug;
      toInsert.push(record);
    }

    if (toInsert.length > 0) {
      const { data: inserted, error: insertErr } = await supabase
        .from("discount_offers")
        .insert(toInsert)
        .select(
          "id, token, agency_id, agency_slug, state_slug, discount_type, discount_value, " +
          "allowed_products, expires_at, max_uses, usage_count, is_active, push_enabled, " +
          "scope_type, scope_expires_at, created_at, internal_note",
        );

      if (insertErr) {
        return new Response(
          JSON.stringify({ error: "Failed to create offers", details: insertErr.message }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
        );
      }

      for (const row of inserted || []) {
        const pct = Math.round(Number(row.discount_value));
        tierMap[pct] = row;
      }
    }

    // Build response: ordered 15/20/25
    const offers = TIERS.map((pct) => {
      const o = tierMap[pct] as Record<string, unknown> | undefined;
      if (!o) return null;
      return {
        id: o.id,
        token: o.token,
        agency_id: o.agency_id,
        agency_slug: o.agency_slug ?? null,
        state_slug: o.state_slug ?? null,
        discount_value: pct,
        allowed_products: o.allowed_products,
        expires_at: o.expires_at ?? null,
        max_uses: o.max_uses,
        usage_count: o.usage_count ?? 0,
        is_active: o.is_active,
        push_enabled: o.push_enabled ?? false,
        scope_type: o.scope_type ?? null,
        scope_expires_at: o.scope_expires_at ?? null,
        created_at: o.created_at,
        internal_note: o.internal_note ?? null,
        url: `/offer/${o.token}`,
      };
    }).filter(Boolean);

    return new Response(
      JSON.stringify({ ok: true, offers, created: toInsert.length }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  } catch (err) {
    console.error("[discount-offers-ensure-tiers] Error:", err);
    return new Response(
      JSON.stringify({ error: "Internal server error", details: err instanceof Error ? err.message : String(err) }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  }
});

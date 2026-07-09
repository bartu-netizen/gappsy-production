import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

const VALID_ACTIONS = ["keep_visible", "removal_pending", "removed"] as const;
type ManageAction = typeof VALID_ACTIONS[number];

const STATUS_MAP: Record<ManageAction, string> = {
  keep_visible: "visible_free",
  removal_pending: "removal_pending",
  removed: "removed",
};

function jsonResp(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
  });
}

async function hasTop25Slot(
  supabase: ReturnType<typeof createClient>,
  agencyId: string
): Promise<boolean> {
  // Primary: agency_listings_index is the canonical current Top 25 source of truth
  // — same logic used by owner-top25-status. Excludes historical/inactive slots.
  const { data: indexRow } = await supabase
    .from("agency_listings_index")
    .select("agency_id")
    .eq("agency_id", agencyId)
    .eq("section", "top25")
    .maybeSingle();

  if (indexRow) return true;

  // Fallback: check top25_slots directly for paid/sold slots
  // (covers the window before the index has been rebuilt after a new sale)
  const { data: slotRow } = await supabase
    .from("top25_slots")
    .select("id")
    .eq("agency_id", agencyId)
    .or("is_paid.eq.true,slot_status.eq.sold")
    .maybeSingle();

  return !!slotRow;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") || "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") || ""
    );

    // ── GET: validate token + return agency context + stats ───────────────────
    if (req.method === "GET") {
      const url = new URL(req.url);
      const token = url.searchParams.get("c") || url.searchParams.get("token");

      if (!token) {
        return jsonResp({ ok: false, valid: false, error: "Missing token" }, 400);
      }

      const { data: tokenRow, error: tokenErr } = await supabase
        .from("smart_link_tokens")
        .select("agency_id")
        .eq("token", token)
        .maybeSingle();

      if (tokenErr || !tokenRow) {
        return jsonResp({ ok: false, valid: false, error: "Invalid or expired link" });
      }

      const { data: agency, error: agencyErr } = await supabase
        .from("other_agencies")
        .select("id, name, state_slug, slug, listing_management_status, is_active, is_paid_listing, created_at")
        .eq("id", tokenRow.agency_id)
        .maybeSingle();

      if (agencyErr || !agency) {
        // Fix 2: agency not in other_agencies — try agency_listings_index first
        // (canonical source, always has a valid slug)
        const { data: indexRow } = await supabase
          .from("agency_listings_index")
          .select("agency_id, agency_slug, agency_name, state_slug")
          .eq("agency_id", tokenRow.agency_id)
          .eq("section", "top25")
          .maybeSingle();

        if (indexRow) {
          return jsonResp({
            ok: true,
            valid: true,
            agency: {
              id: tokenRow.agency_id,
              name: indexRow.agency_name,
              state_slug: indexRow.state_slug,
              slug: indexRow.agency_slug,
              listing_management_status: null,
              is_active: true,
              is_paid_listing: true,
              created_at: null,
              listing_type: "top25",
              can_self_remove: false,
            },
            snapshot: null,
          });
        }

        // Last resort: top25_slots for agencies not yet indexed
        const { data: top25Slot } = await supabase
          .from("top25_slots")
          .select("agency_name, state_slug")
          .eq("agency_id", tokenRow.agency_id)
          .or("is_paid.eq.true,slot_status.eq.sold")
          .order("rank", { ascending: true })
          .limit(1)
          .maybeSingle();

        if (top25Slot) {
          return jsonResp({
            ok: true,
            valid: true,
            agency: {
              id: tokenRow.agency_id,
              name: top25Slot.agency_name || "Your Agency",
              state_slug: top25Slot.state_slug,
              slug: null,
              listing_management_status: null,
              is_active: true,
              is_paid_listing: true,
              created_at: null,
              listing_type: "top25",
              can_self_remove: false,
            },
            snapshot: null,
          });
        }

        return jsonResp({ ok: false, valid: false, error: "Agency not found" });
      }

      const isTop25 = await hasTop25Slot(supabase, agency.id);
      const listingType: "top25" | "other_agency" = isTop25 ? "top25" : "other_agency";
      const canSelfRemove = !isTop25;

      return jsonResp({
        ok: true,
        valid: true,
        agency: {
          id: agency.id,
          name: agency.name,
          state_slug: agency.state_slug,
          slug: agency.slug,
          listing_management_status: agency.listing_management_status,
          is_active: agency.is_active,
          is_paid_listing: agency.is_paid_listing,
          created_at: agency.created_at,
          listing_type: listingType,
          can_self_remove: canSelfRemove,
        },
      });
    }

    // ── POST: perform a management action ────────────────────────────────────
    if (req.method === "POST") {
      const body = await req.json();
      const { token, action } = body;

      if (!token || typeof token !== "string") {
        return jsonResp({ ok: false, error: "Missing token" }, 400);
      }

      if (!VALID_ACTIONS.includes(action as ManageAction)) {
        return jsonResp(
          { ok: false, error: "Invalid action. Must be one of: keep_visible, removal_pending, removed" },
          400
        );
      }

      const { data: tokenRow, error: tokenError } = await supabase
        .from("smart_link_tokens")
        .select("agency_id, lead_key")
        .eq("token", token)
        .maybeSingle();

      if (tokenError) throw tokenError;

      if (!tokenRow) {
        return jsonResp({ ok: false, error: "Invalid or expired token" }, 403);
      }

      const { agency_id } = tokenRow;

      // Block removal actions for Top 25 listings — server-side enforcement
      if (action === "removal_pending" || action === "removed") {
        const isTop25 = await hasTop25Slot(supabase, agency_id);
        if (isTop25) {
          return jsonResp(
            { ok: false, error: "Top 25 placements cannot be removed through self-service. Contact support for changes." },
            403
          );
        }
      }

      const newStatus = STATUS_MAP[action as ManageAction];

      const { data: agency, error: updateError } = await supabase
        .from("other_agencies")
        .update({ listing_management_status: newStatus })
        .eq("id", agency_id)
        .select("name, state_slug, slug, listing_management_status")
        .single();

      if (updateError) throw updateError;

      return jsonResp({
        ok: true,
        agency_name: agency.name,
        state_slug: agency.state_slug,
        agency_slug: agency.slug,
        status: agency.listing_management_status,
      });
    }

    return jsonResp({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    const e = error as any;
    const message = e?.message || String(error);
    console.error("[manage-listing-action] error:", message);
    return jsonResp({ ok: false, error: message }, 500);
  }
});

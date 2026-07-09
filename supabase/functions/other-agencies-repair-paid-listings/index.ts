import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

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

function normalizeWebsiteUrl(raw: string | null | undefined): string | null {
  if (!raw) return null;
  const trimmed = raw.trim();
  if (!trimmed) return null;
  try {
    const withScheme = trimmed.startsWith("http://") || trimmed.startsWith("https://")
      ? trimmed
      : `https://${trimmed}`;
    const parsed = new URL(withScheme);
    if (parsed.protocol !== "http:" && parsed.protocol !== "https:") return null;
    if (!parsed.hostname || !parsed.hostname.includes(".")) return null;
    return withScheme;
  } catch {
    return null;
  }
}

type OtherAgencyRow = { id: string; slug: string | null; name: string; website_url: string | null };

async function resolveOtherAgency(
  supabase: ReturnType<typeof createClient>,
  params: {
    agencyId?: string | null;
    agencySlug?: string | null;
    agencyName?: string | null;
    stateSlug?: string | null;
    agencyWebsite?: string | null;
  }
): Promise<OtherAgencyRow | null> {
  // A: by id
  if (params.agencyId) {
    let q = supabase
      .from("other_agencies")
      .select("id, slug, name, website_url")
      .eq("id", params.agencyId);
    if (params.stateSlug) q = q.eq("state_slug", params.stateSlug);
    const { data } = await q.maybeSingle();
    if (data) return data;

    const { data: data2 } = await supabase
      .from("other_agencies")
      .select("id, slug, name, website_url")
      .eq("id", params.agencyId)
      .maybeSingle();
    if (data2) return data2;
  }

  // B: by slug + state
  if (params.agencySlug && params.stateSlug) {
    const { data } = await supabase
      .from("other_agencies")
      .select("id, slug, name, website_url")
      .eq("slug", params.agencySlug)
      .eq("state_slug", params.stateSlug)
      .maybeSingle();
    if (data) return data;
  }

  // C: by name + state (case-insensitive)
  if (params.agencyName && params.stateSlug) {
    const { data } = await supabase
      .from("other_agencies")
      .select("id, slug, name, website_url")
      .ilike("name", params.agencyName.trim())
      .eq("state_slug", params.stateSlug)
      .maybeSingle();
    if (data) return data;
  }

  // D: by website domain
  if (params.agencyWebsite) {
    try {
      const withScheme = params.agencyWebsite.startsWith("http")
        ? params.agencyWebsite
        : `https://${params.agencyWebsite}`;
      const hostname = new URL(withScheme).hostname.replace(/^www\./, "");
      if (hostname && hostname.includes(".")) {
        const { data } = await supabase
          .from("other_agencies")
          .select("id, slug, name, website_url")
          .ilike("website_url", `%${hostname}%`)
          .maybeSingle();
        if (data) return data;
      }
    } catch {
      // ignore parse errors
    }
  }

  return null;
}

type RepairResult = {
  order_id: string;
  checkout_session_id: string;
  resolved_agency_id: string | null;
  resolved_agency_name: string | null;
  action: "repaired" | "skipped" | "unresolved";
  detail: string;
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    console.log("[repair-paid-listings] Request received:", req.method);
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      console.warn("[repair-paid-listings] Auth failed:", authResult.error);
      return createAuthErrorResponse(authResult, corsHeaders);
    }
    console.log("[repair-paid-listings] Auth success");

    const body = await req.json().catch(() => ({})) as {
      mode?: string;
      agency_id?: string;
      agency_name?: string;
      state_slug?: string;
      dry_run?: boolean;
    };

    const mode = body.mode || "targeted";
    const dryRun = body.dry_run === true;

    console.log("[repair-paid-listings] Mode:", mode, "dry_run:", dryRun, "agency_id:", body.agency_id);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !supabaseServiceKey) {
      return jsonResponse({ error: "Server configuration error" }, 500);
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    // ── Fetch candidate orders ──────────────────────────────────────────────
    let ordersQuery = supabase
      .from("stripe_orders")
      .select("id, checkout_session_id, agency_id, agency_name, state_slug, metadata, source_listing_type, funnel_type, amount_total, payment_status, subscription_id")
      .eq("payment_status", "paid")
      .in("source_listing_type", ["other_listing", "standard", "activation", "agency_activation"]);

    if (mode === "targeted") {
      // For targeted mode, also find orders where metadata matches but agency_id is null
      // We look for:
      // 1. Orders where agency_id IS NULL but metadata matches the given agency
      // 2. Orders where the existing agency_id matches (to activate the other_agencies row)
      ordersQuery = ordersQuery.is("agency_id", null);

      // Add name/state filter if provided
      if (body.agency_name && body.state_slug) {
        ordersQuery = ordersQuery
          .or(`metadata->>agencyName.ilike.${body.agency_name.trim()},metadata->>agencySlug.eq.${body.agency_name.toLowerCase().replace(/\s+/g, "-")}`)
          .eq("state_slug", body.state_slug);
      } else if (body.agency_id) {
        // look for orders where metadata has this agencyId
        ordersQuery = ordersQuery.filter("metadata->>agencyId", "eq", body.agency_id);
      }
    } else {
      // scan_all mode: find all paid orders with null agency_id
      ordersQuery = ordersQuery.is("agency_id", null);
    }

    const { data: orders, error: ordersError } = await ordersQuery
      .order("created_at", { ascending: false })
      .limit(100);

    if (ordersError) {
      console.error("[repair-paid-listings] DB error fetching orders:", ordersError);
      return jsonResponse({ error: "Failed to fetch orders: " + ordersError.message }, 500);
    }

    console.log("[repair-paid-listings] Candidate orders found:", orders?.length ?? 0);

    if (!orders || orders.length === 0) {
      // In targeted mode, even if no null-agency_id orders exist,
      // try to activate the other_agencies row directly if agency_id provided
      if (mode === "targeted" && body.agency_id) {
        const now = new Date().toISOString();
        const { data: activateData, error: activateErr } = await supabase
          .from("other_agencies")
          .update({ is_paid_listing: true, updated_at: now })
          .eq("id", body.agency_id)
          .select("id, name, is_paid_listing");

        if (!activateErr && activateData && activateData.length > 0) {
          console.log("[repair-paid-listings] Directly activated other_agencies row:", body.agency_id);
          return jsonResponse({
            ok: true,
            mode,
            dry_run: dryRun,
            scanned: 0,
            repaired: 1,
            skipped: 0,
            unresolved: 0,
            results: [{
              order_id: "n/a",
              checkout_session_id: "n/a",
              resolved_agency_id: body.agency_id,
              resolved_agency_name: activateData[0].name,
              action: "repaired",
              detail: "Directly activated other_agencies.is_paid_listing (no stripe_orders record needed)",
            }],
          });
        }
      }

      return jsonResponse({
        ok: true,
        mode,
        dry_run: dryRun,
        scanned: 0,
        repaired: 0,
        skipped: 0,
        unresolved: 0,
        results: [],
        message: "No unactivated paid orders found",
      });
    }

    const results: RepairResult[] = [];
    const now = new Date().toISOString();

    for (const order of orders) {
      const meta = (order.metadata || {}) as Record<string, string>;

      // Use metadata fields for resolution
      const metaAgencyId = meta.agencyId || body.agency_id || null;
      const metaAgencySlug = meta.agencySlug || null;
      const metaAgencyName = meta.agencyName || order.agency_name || body.agency_name || null;
      const metaStateSlug = meta.stateSlug || meta.state_slug || order.state_slug || body.state_slug || null;
      const metaAgencyWebsite = meta.agencyWebsite || null;

      console.log("[repair-paid-listings] Resolving order:", order.checkout_session_id, {
        metaAgencyId,
        metaAgencySlug,
        metaAgencyName,
        metaStateSlug,
      });

      const resolved = await resolveOtherAgency(supabase, {
        agencyId: metaAgencyId,
        agencySlug: metaAgencySlug,
        agencyName: metaAgencyName,
        stateSlug: metaStateSlug,
        agencyWebsite: metaAgencyWebsite,
      });

      if (!resolved) {
        console.warn("[repair-paid-listings] Could not resolve agency for order:", order.checkout_session_id);
        results.push({
          order_id: order.id,
          checkout_session_id: order.checkout_session_id,
          resolved_agency_id: null,
          resolved_agency_name: metaAgencyName,
          action: "unresolved",
          detail: `No matching other_agencies row found. Tried: id=${metaAgencyId}, slug=${metaAgencySlug}, name=${metaAgencyName}, state=${metaStateSlug}`,
        });
        continue;
      }

      if (dryRun) {
        results.push({
          order_id: order.id,
          checkout_session_id: order.checkout_session_id,
          resolved_agency_id: resolved.id,
          resolved_agency_name: resolved.name,
          action: "skipped",
          detail: `DRY RUN: Would repair order ${order.checkout_session_id} → agency ${resolved.name} (${resolved.id})`,
        });
        continue;
      }

      // 1. Update stripe_orders.agency_id
      const { error: orderUpdateErr } = await supabase
        .from("stripe_orders")
        .update({
          agency_id: resolved.id,
          agency_name: resolved.name,
          updated_at: now,
        })
        .eq("id", order.id);

      if (orderUpdateErr) {
        console.error("[repair-paid-listings] Failed to update stripe_orders:", orderUpdateErr.message, order.id);
        results.push({
          order_id: order.id,
          checkout_session_id: order.checkout_session_id,
          resolved_agency_id: resolved.id,
          resolved_agency_name: resolved.name,
          action: "skipped",
          detail: "Failed to update stripe_orders: " + orderUpdateErr.message,
        });
        continue;
      }

      // 2. Activate other_agencies
      const { error: activateErr, data: activateData } = await supabase
        .from("other_agencies")
        .update({ is_paid_listing: true, updated_at: now })
        .eq("id", resolved.id)
        .select("id, name, website_url");

      if (activateErr) {
        console.error("[repair-paid-listings] Failed to activate other_agencies:", activateErr.message, resolved.id);
      } else {
        console.log("[repair-paid-listings] Activated other_agencies.is_paid_listing:", resolved.id, resolved.name);
      }

      // 3. Backfill website_url if missing
      const existingWebsite = (activateData?.[0] as { website_url?: string | null } | undefined)?.website_url?.trim() || "";
      const metaWebsite = normalizeWebsiteUrl(metaAgencyWebsite || resolved.website_url);
      if (!existingWebsite && metaWebsite) {
        const { error: websiteErr } = await supabase
          .from("other_agencies")
          .update({ website_url: metaWebsite, updated_at: now })
          .eq("id", resolved.id);
        if (websiteErr) {
          console.warn("[repair-paid-listings] Failed to backfill website_url:", websiteErr.message);
        } else {
          console.log("[repair-paid-listings] website_url backfilled:", { id: resolved.id, website: metaWebsite });
        }
      }

      results.push({
        order_id: order.id,
        checkout_session_id: order.checkout_session_id,
        resolved_agency_id: resolved.id,
        resolved_agency_name: resolved.name,
        action: "repaired",
        detail: `stripe_orders.agency_id set, other_agencies.is_paid_listing=true${!existingWebsite && metaWebsite ? ", website_url backfilled" : ""}`,
      });
    }

    // In targeted mode, also ensure the specific agency_id row is activated
    // even if we repaired orders above (handles case where order has agency_id already but is_paid_listing=false)
    if (mode === "targeted" && body.agency_id && !dryRun) {
      const { data: directActivate, error: directErr } = await supabase
        .from("other_agencies")
        .update({ is_paid_listing: true, updated_at: now })
        .eq("id", body.agency_id)
        .select("id, name");

      if (!directErr && directActivate && directActivate.length > 0) {
        const alreadyInResults = results.some((r) => r.resolved_agency_id === body.agency_id);
        if (!alreadyInResults) {
          results.push({
            order_id: "direct_activation",
            checkout_session_id: "n/a",
            resolved_agency_id: body.agency_id,
            resolved_agency_name: (directActivate[0] as { name: string }).name,
            action: "repaired",
            detail: "Directly set other_agencies.is_paid_listing=true for the requested agency",
          });
        }
        console.log("[repair-paid-listings] Direct activation applied for agency_id:", body.agency_id);
      }
    }

    const repaired = results.filter((r) => r.action === "repaired").length;
    const unresolved = results.filter((r) => r.action === "unresolved").length;
    const skipped = results.filter((r) => r.action === "skipped").length;

    console.log("[repair-paid-listings] Done. Scanned:", orders.length, "Repaired:", repaired, "Unresolved:", unresolved);

    return jsonResponse({
      ok: true,
      mode,
      dry_run: dryRun,
      scanned: orders.length,
      repaired,
      skipped,
      unresolved,
      results,
    });
  } catch (e) {
    console.error("[repair-paid-listings] Unexpected error:", e);
    return jsonResponse({ error: String(e instanceof Error ? e.message : e) }, 500);
  }
});

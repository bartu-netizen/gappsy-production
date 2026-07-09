import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

const supabase = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
);

interface SaveAndActivateRequest {
  sessionId: string;
  intro: string;
  services: string[];
  websiteUrl?: string;
  logoUrl?: string;
  agencyId?: string;
  agencyName?: string;
}

interface ValidationResult {
  valid: boolean;
  error?: string;
}

const FORBIDDEN_WORDS = ["gok", "gokautomaat", "gambling", "porn", "pornography", "sex"];
const URL_PATTERNS = [/https?:\/\/[^\s]+/gi, /www\.[^\s]+/gi, /[a-z0-9.-]+\.[a-z]{2,}(?:\/[^\s]*)?\b/gi];

function validateIntroText(text: string): ValidationResult {
  if (!text || !text.trim()) return { valid: false, error: "Intro text is required." };
  const trimmed = text.trim().toLowerCase();
  for (const word of FORBIDDEN_WORDS) {
    if (trimmed.includes(word.toLowerCase())) {
      return { valid: false, error: "Your intro contains restricted words. Please update the text and try again." };
    }
  }
  for (const pattern of URL_PATTERNS) {
    if (pattern.test(text)) return { valid: false, error: "Please remove website links from the intro text." };
  }
  return { valid: true };
}

function validateWebsiteUrl(url: string): ValidationResult {
  if (!url || !url.trim()) return { valid: true };
  const trimmed = url.trim();
  const urlPattern = /^(https?:\/\/)?(www\.)?[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z]{2,})+([\/\w\-._~:?#[\]@!$&'()*+,;=]*)?$/i;
  if (!urlPattern.test(trimmed)) {
    return { valid: false, error: "Please enter a valid website URL (e.g., example.com or https://example.com)." };
  }
  return { valid: true };
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

function domainFromEmail(email: string | null | undefined): string | null {
  if (!email) return null;
  const parts = email.split("@");
  if (parts.length !== 2) return null;
  const domain = parts[1].trim().toLowerCase();
  const genericDomains = ["gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "icloud.com", "aol.com", "protonmail.com", "me.com"];
  if (genericDomains.includes(domain)) return null;
  return domain.includes(".") ? `https://${domain}` : null;
}

function jsonRes(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

async function enforcePaidStatus(params: {
  agencyId: string;
  listingType: string;
  slotId: string | null;
  stateSlug: string | null;
}): Promise<void> {
  const { agencyId, listingType, slotId, stateSlug } = params;
  const now = new Date().toISOString();
  const isTop25 = listingType === "top25_rank" || listingType === "top25";

  if (isTop25 && slotId) {
    const { error } = await supabase
      .from("top25_slots")
      .update({ is_paid: true, updated_at: now })
      .eq("id", slotId);
    if (error) {
      console.error("[listing-save-and-activate] enforcePaidStatus top25_slots error:", error.message);
    } else {
      console.log("[listing-save-and-activate] enforcePaidStatus: top25_slots.is_paid=true enforced for slotId:", slotId);
    }
  } else if (isTop25 && agencyId && stateSlug) {
    const { error } = await supabase
      .from("top25_slots")
      .update({ is_paid: true, updated_at: now })
      .eq("agency_id", agencyId)
      .eq("state_slug", stateSlug);
    if (error) {
      console.error("[listing-save-and-activate] enforcePaidStatus top25_slots (by agency+state) error:", error.message);
    }
  }

  const { error: oaError } = await supabase
    .from("other_agencies")
    .update({ is_paid_listing: true, updated_at: now })
    .eq("id", agencyId);
  if (oaError) {
    console.error("[listing-save-and-activate] enforcePaidStatus other_agencies error:", oaError.message);
  } else {
    console.log("[listing-save-and-activate] enforcePaidStatus: other_agencies.is_paid_listing=true enforced for agencyId:", agencyId);
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: corsHeaders });
  if (req.method !== "POST") return jsonRes({ error: "Method not allowed" }, 405);

  try {
    const body: SaveAndActivateRequest = await req.json();
    const { sessionId, intro, services, websiteUrl, logoUrl, agencyId, agencyName } = body;

    if (!sessionId) return jsonRes({ error: "Missing sessionId" }, 400);

    console.log("[listing-save-and-activate] Processing:", {
      sessionId,
      hasIntro: !!intro,
      hasWebsiteUrl: !!websiteUrl,
      hasLogoUrl: !!logoUrl,
      hasAgencyId: !!agencyId,
      hasAgencyName: !!agencyName,
      servicesCount: services?.length ?? 0,
    });

    const { data: order, error: orderError } = await supabase
      .from("stripe_orders")
      .select("id, payment_status, status, metadata, agency_id, customer_email")
      .eq("checkout_session_id", sessionId)
      .maybeSingle();

    if (orderError || !order) {
      console.error("[listing-save-and-activate] Order not found:", orderError);
      return jsonRes({ error: "Order not found or not confirmed" }, 404);
    }

    const isPaymentConfirmed = order.payment_status === "paid" || order.status === "completed";
    if (!isPaymentConfirmed) {
      return jsonRes({ error: "Payment has not been confirmed yet. Please try again shortly." }, 402);
    }

    const validation = validateIntroText(intro || "");
    if (!validation.valid) return jsonRes({ error: validation.error, valid: false }, 400);

    const websiteValidation = validateWebsiteUrl(websiteUrl || "");
    if (!websiteValidation.valid) return jsonRes({ error: websiteValidation.error, valid: false }, 400);

    const metadata = order.metadata || {};
    const listingType = metadata.listingType || metadata.funnel || "other_listing";
    const finalAgencyName = agencyName || metadata.agencyName;
    const upsellCardVisual = metadata.upsellCardVisual === "true";

    // ── Agency ID resolution: 4-tier fallback ────────────────────────────────
    // 1. Explicit param from client
    // 2. Checkout metadata.agencyId
    // 3. stripe_orders.agency_id written by webhook resolver (most authoritative for standard listings)
    // 4. DB lookup by name + state from metadata (last resort)
    let listingAgencyId: string | null = agencyId || metadata.agencyId || order.agency_id || null;

    if (!listingAgencyId) {
      const nameForLookup = finalAgencyName;
      const stateForLookup = metadata.stateSlug || metadata.state_slug || null;
      if (nameForLookup && stateForLookup) {
        const { data: foundAgency } = await supabase
          .from("other_agencies")
          .select("id")
          .ilike("name", nameForLookup.trim())
          .eq("state_slug", stateForLookup)
          .maybeSingle();
        if (foundAgency?.id) {
          listingAgencyId = foundAgency.id;
          console.log("[listing-save-and-activate] Agency resolved by name+state fallback:", listingAgencyId);
        }
      }
    }

    if (!listingAgencyId) {
      console.error("[listing-save-and-activate] Agency ID unresolvable for session:", sessionId, "metadata:", metadata);
      return jsonRes({ error: "Agency information not found" }, 400);
    }

    // ── Website URL resolution: cascading fallbacks ───────────────────────────
    // 1. User-provided (highest priority)
    // 2. Checkout metadata.agencyWebsite
    // 3. Existing DB value
    // 4. Domain derived from customer email (only for business domains)
    let resolvedWebsiteUrl: string | null = normalizeWebsiteUrl(websiteUrl);

    if (!resolvedWebsiteUrl) {
      resolvedWebsiteUrl = normalizeWebsiteUrl(metadata.agencyWebsite);
      if (resolvedWebsiteUrl) {
        console.log("[listing-save-and-activate] website_url resolved from metadata:", resolvedWebsiteUrl);
      }
    }

    if (!resolvedWebsiteUrl) {
      const isStandardType = listingType === "other_listing" || listingType === "standard" || listingType === "activation";
      if (isStandardType) {
        const { data: existingRow } = await supabase
          .from("other_agencies")
          .select("website_url")
          .eq("id", listingAgencyId)
          .maybeSingle();
        if (existingRow?.website_url) {
          resolvedWebsiteUrl = existingRow.website_url;
          console.log("[listing-save-and-activate] website_url resolved from existing DB row:", resolvedWebsiteUrl);
        }
      }
    }

    if (!resolvedWebsiteUrl) {
      const emailDomain = domainFromEmail(order.customer_email);
      if (emailDomain) {
        resolvedWebsiteUrl = emailDomain;
        console.log("[listing-save-and-activate] website_url derived from customer email domain:", resolvedWebsiteUrl);
      }
    }

    console.log("[listing-save-and-activate] Saving listing:", { agencyId: listingAgencyId, listingType, resolvedWebsiteUrl });

    let saveResult;
    let savedSlotId: string | null = null;
    const stateSlug: string = metadata.stateSlug || metadata.state_slug || "";

    if (listingType === "top25_rank" || listingType === "top25") {
      const rankNumber: number | null = metadata.rank ? parseInt(metadata.rank, 10) : null;

      if (!stateSlug || !rankNumber) {
        console.error("[listing-save-and-activate] top25 missing stateSlug/rank in order metadata:", metadata);
        return jsonRes({ error: "Missing stateSlug or rank in order metadata — cannot locate Top 25 slot" }, 400);
      }

      let slotId: string | null = null;

      const { data: exactSlot } = await supabase
        .from("top25_slots")
        .select("id")
        .eq("state_slug", stateSlug)
        .eq("rank", rankNumber)
        .eq("agency_id", listingAgencyId)
        .maybeSingle();

      if (exactSlot) {
        slotId = exactSlot.id;
        console.log("[listing-save-and-activate] Found top25 slot by (state,rank,agencyId):", slotId);
      } else {
        const { data: rankSlot } = await supabase
          .from("top25_slots")
          .select("id")
          .eq("state_slug", stateSlug)
          .eq("rank", rankNumber)
          .maybeSingle();

        if (rankSlot) {
          slotId = rankSlot.id;
          console.log("[listing-save-and-activate] Found top25 slot by (state,rank) fallback:", slotId);
        }
      }

      if (!slotId) {
        console.error("[listing-save-and-activate] Top25 slot not found for", { stateSlug, rankNumber, listingAgencyId });
        return jsonRes({ error: `Top 25 slot not found for state=${stateSlug} rank=${rankNumber}` }, 404);
      }

      savedSlotId = slotId;

      // Fetch current row to preserve purchased_at if already set
      const { data: existingSlot } = await supabase
        .from("top25_slots")
        .select("purchased_at")
        .eq("id", slotId)
        .maybeSingle();

      const nowIso = new Date().toISOString();
      const updatePayload: Record<string, unknown> = {
        description: intro || null,
        short_description: intro ? intro.substring(0, 160) : null,
        services: services || [],
        website: resolvedWebsiteUrl,
        is_paid: true,
        is_available: false,
        slot_status: "sold",
        status_updated_at: nowIso,
        status_reason: "listing_activated",
        status_updated_by: "listing-save-and-activate",
        billing_status: "paid",
        agency_id: listingAgencyId,
        updated_at: nowIso,
      };
      if (!existingSlot?.purchased_at) updatePayload.purchased_at = nowIso;
      if (logoUrl) updatePayload.logo_url = logoUrl;
      if (finalAgencyName) updatePayload.agency_name = finalAgencyName;
      if (upsellCardVisual) updatePayload.show_lightning = true;

      saveResult = await supabase
        .from("top25_slots")
        .update(updatePayload)
        .eq("id", slotId)
        .select();

    } else if (listingType === "spotlight") {

      const rankNumber: number | null = metadata.rank ? parseInt(metadata.rank, 10) : null;

      const updatePayload: Record<string, unknown> = {
        full_description: intro || null,
        short_description: intro ? intro.substring(0, 200) : null,
        services: services || [],
        website_url: resolvedWebsiteUrl,
        cta_url: resolvedWebsiteUrl,
        updated_at: new Date().toISOString(),
      };
      if (logoUrl) updatePayload.logo_url = logoUrl;
      if (finalAgencyName) updatePayload.agency_name = finalAgencyName;

      if (stateSlug && rankNumber && rankNumber >= 1 && rankNumber <= 3) {
        saveResult = await supabase
          .from("spotlight_placements")
          .update(updatePayload)
          .eq("state_slug", stateSlug)
          .eq("position", rankNumber)
          .select();

        if (!saveResult.error && !saveResult.data?.length) {
          saveResult = await supabase
            .from("spotlight_placements")
            .upsert({
              state_slug: stateSlug,
              position: rankNumber,
              agency_name: finalAgencyName || "Agency",
              ...updatePayload,
            }, { onConflict: "state_slug,position" })
            .select();
        }
      } else if (stateSlug && finalAgencyName) {
        saveResult = await supabase
          .from("spotlight_placements")
          .update(updatePayload)
          .eq("state_slug", stateSlug)
          .eq("agency_name", finalAgencyName)
          .select();
      } else {
        console.warn("[listing-save-and-activate] Spotlight: missing stateSlug/rank in metadata:", metadata);
        return jsonRes({ error: "Cannot locate spotlight placement: missing stateSlug or rank in order metadata" }, 400);
      }

    } else {

      const updatePayload: Record<string, unknown> = {
        intro: intro || null,
        services: services || [],
        website_url: resolvedWebsiteUrl,
        is_paid_listing: true,
      };
      if (logoUrl) updatePayload.logo_url = logoUrl;
      if (finalAgencyName) updatePayload.name = finalAgencyName;

      saveResult = await supabase
        .from("other_agencies")
        .update(updatePayload)
        .eq("id", listingAgencyId)
        .select();

      if (!saveResult.data?.length) {
        saveResult = await supabase
          .from("other_agencies")
          .upsert({ id: listingAgencyId, ...updatePayload }, { onConflict: "id" })
          .select();
      }
    }

    if (saveResult.error) {
      console.error("[listing-save-and-activate] Save error:", saveResult.error);
      return jsonRes({ error: "Failed to save listing: " + saveResult.error.message }, 500);
    }

    // ── CRITICAL: idempotently enforce paid status regardless of webhook state ─
    await enforcePaidStatus({
      agencyId: listingAgencyId,
      listingType,
      slotId: savedSlotId,
      stateSlug: stateSlug || null,
    });

    await supabase
      .from("stripe_orders")
      .update({
        status: "listing_activated",
        agency_id: listingAgencyId,
        metadata: {
          ...metadata,
          activated_at: new Date().toISOString(),
          resolved_website_url: resolvedWebsiteUrl || null,
        },
      })
      .eq("id", order.id);

    console.log("[listing-save-and-activate] Activation complete:", { agencyId: listingAgencyId, listingType, resolvedWebsiteUrl });

    return jsonRes({
      success: true,
      message: "Listing saved and activated successfully",
      agencyId: listingAgencyId,
      listingType,
      websiteUrl: resolvedWebsiteUrl,
    });

  } catch (error) {
    console.error("[listing-save-and-activate] Error:", error);
    return jsonRes({
      error: "Failed to process request",
      details: error instanceof Error ? error.message : "Unknown error",
    }, 500);
  }
});

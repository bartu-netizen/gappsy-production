import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from 'jsr:@supabase/supabase-js@2';

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

const VAZAGENCY_URL = "https://vazagency.com";

function jsonOk(data: Record<string, unknown>): Response {
  return new Response(JSON.stringify(data), {
    status: 200,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

// ─── URL validation ───────────────────────────────────────────────────────────
// Rejects Google Maps links, empty values, placeholder domains, and non-http URLs.
// Returns null when the URL is invalid — callers must hide the button, not fallback.

const REJECTED_DOMAINS = [
  "google.com/maps",
  "maps.google.com",
  "goo.gl/maps",
  "maps.app.goo.gl",
];

const PLACEHOLDER_PATTERNS = [
  /^https?:\/\/example\./i,
  /^https?:\/\/placeholder\./i,
  /^https?:\/\/yourwebsite\./i,
  /^https?:\/\/www\.example\./i,
];

function validateWebsiteUrl(raw: string | null | undefined): string | null {
  if (!raw) return null;
  const trimmed = raw.trim();
  if (!trimmed) return null;

  const withScheme = trimmed.startsWith("http://") || trimmed.startsWith("https://")
    ? trimmed
    : `https://${trimmed}`;

  try {
    const parsed = new URL(withScheme);

    if (parsed.protocol !== "http:" && parsed.protocol !== "https:") {
      console.warn("[availability-submit:validateUrl] Rejected non-http protocol:", withScheme);
      return null;
    }

    const fullUrl = parsed.href;
    for (const rejected of REJECTED_DOMAINS) {
      if (fullUrl.includes(rejected)) {
        console.warn("[availability-submit:validateUrl] Rejected Google Maps / junk URL:", fullUrl);
        return null;
      }
    }

    for (const pattern of PLACEHOLDER_PATTERNS) {
      if (pattern.test(fullUrl)) {
        console.warn("[availability-submit:validateUrl] Rejected placeholder URL:", fullUrl);
        return null;
      }
    }

    if (!parsed.hostname || parsed.hostname.length < 4 || !parsed.hostname.includes(".")) {
      console.warn("[availability-submit:validateUrl] Rejected invalid hostname:", fullUrl);
      return null;
    }

    return withScheme;
  } catch {
    console.warn("[availability-submit:validateUrl] Rejected unparseable URL:", trimmed);
    return null;
  }
}

function fallbackOutcome(sentiment: string | null): Record<string, unknown> {
  if (sentiment === "negative") {
    return {
      recommended_provider: "vazagency",
      recommended_agency_id: null,
      recommended_agency_name: "Vazagency",
      cta_url: VAZAGENCY_URL,
      message_key: null,
    };
  }
  return {
    recommended_provider: "get_matched",
    recommended_agency_id: null,
    recommended_agency_name: null,
    cta_url: null,
    message_key: null,
  };
}

async function hasConfirmedStripeOrder(
  supabase: ReturnType<typeof createClient>,
  otherAgencyId: string,
): Promise<boolean> {
  try {
    const { data } = await supabase
      .from("stripe_orders")
      .select("id")
      .eq("agency_id", otherAgencyId)
      .eq("payment_status", "paid")
      .limit(1)
      .maybeSingle();
    return !!data;
  } catch (e) {
    console.warn("[availability-submit] hasConfirmedStripeOrder lookup failed:", e);
    return false;
  }
}

async function resolveOutcome(
  supabase: ReturnType<typeof createClient>,
  sentiment: string | null,
  stateSlug: string | null,
  agencyId: string | null,
  agencySlug: string | null,
): Promise<Record<string, unknown>> {
  if (sentiment === "negative") {
    console.log("[availability-submit] Negative sentiment — routing to fallback");
    return fallbackOutcome("negative");
  }

  try {
    if (agencyId || agencySlug) {

      // ── Path 1: top25_slots by agency_id (primary path) ──────────────────
      // STRICT: always filters by state_slug when available to prevent cross-state data mixing.
      if (agencyId) {
        let slotQuery = supabase
          .from("top25_slots")
          .select("id, agency_id, agency_name, website, state_slug, is_paid, slot_status, manual_override")
          .eq("agency_id", agencyId)
          .or("is_paid.eq.true,slot_status.eq.sold,manual_override.eq.true");

        if (stateSlug) slotQuery = slotQuery.eq("state_slug", stateSlug);

        const { data: slotByAgencyId } = await slotQuery.maybeSingle();

        console.log("[availability-submit] top25_slots lookup by agency_id:", {
          agencyId,
          stateSlug,
          found: !!slotByAgencyId,
          slotId: slotByAgencyId?.id,
          isPaid: slotByAgencyId?.is_paid,
          slotStateSlug: slotByAgencyId?.state_slug,
        });

        if (slotByAgencyId) {
          const website = validateWebsiteUrl(slotByAgencyId.website);
          if (!website) {
            console.warn("[availability-submit] Paid slot found but website URL is invalid — hiding CTA:", slotByAgencyId.agency_name);
          }
          console.log("[availability-submit] PAID slot found via agency_id — recommending:", slotByAgencyId.agency_name);
          return {
            recommended_provider: "agency",
            recommended_agency_id: slotByAgencyId.agency_id,
            recommended_agency_name: slotByAgencyId.agency_name,
            cta_url: website,
            message_key: null,
            paid_slot_id: slotByAgencyId.id,
          };
        }
      }

      // ── Path 2: top25_slots by slot id (legacy fallback) ─────────────────
      // STRICT: always filters by state_slug when available.
      if (agencyId) {
        let legacyQuery = supabase
          .from("top25_slots")
          .select("id, agency_id, agency_name, website, state_slug, is_paid, slot_status, manual_override")
          .eq("id", agencyId)
          .or("is_paid.eq.true,slot_status.eq.sold,manual_override.eq.true");

        if (stateSlug) legacyQuery = legacyQuery.eq("state_slug", stateSlug);

        const { data: slotById } = await legacyQuery.maybeSingle();

        console.log("[availability-submit] top25_slots lookup by slot id (legacy):", {
          agencyId,
          stateSlug,
          found: !!slotById,
          isPaid: slotById?.is_paid,
          slotStateSlug: slotById?.state_slug,
        });

        if (slotById) {
          const website = validateWebsiteUrl(slotById.website);
          if (!website) {
            console.warn("[availability-submit] Legacy paid slot found but website URL is invalid — hiding CTA:", slotById.agency_name);
          }
          const resolvedAgencyId = slotById.agency_id || slotById.id;
          console.log("[availability-submit] PAID slot found via slot id (legacy) — recommending:", slotById.agency_name);
          return {
            recommended_provider: "agency",
            recommended_agency_id: resolvedAgencyId,
            recommended_agency_name: slotById.agency_name,
            cta_url: website,
            message_key: null,
            paid_slot_id: slotById.id,
          };
        }
      }

      // ── Path 3: other_agencies by id ──────────────────────────────────────
      // STRICT: always filters by state_slug when available to prevent cross-state data mixing.
      if (agencyId) {
        let otherQuery = supabase
          .from("other_agencies")
          .select("id, name, website_url, is_paid_listing, state_slug")
          .eq("id", agencyId)
          .eq("is_paid_listing", true);

        if (stateSlug) otherQuery = otherQuery.eq("state_slug", stateSlug);

        const { data: otherAgency } = await otherQuery.maybeSingle();

        console.log("[availability-submit] other_agencies lookup:", {
          agencyId,
          stateSlug,
          found: !!otherAgency,
          isPaidListing: otherAgency?.is_paid_listing,
          agencyStateSlug: otherAgency?.state_slug,
        });

        if (otherAgency) {
          const stripeConfirmed = await hasConfirmedStripeOrder(supabase, otherAgency.id);
          if (!stripeConfirmed) {
            console.warn("[availability-submit] other_agency is_paid_listing=true but no confirmed Stripe order — skipping recommendation:", otherAgency.name);
          } else {
            const website = validateWebsiteUrl(otherAgency.website_url);
            if (!website) {
              console.warn("[availability-submit] Paid other_agency found but website URL is invalid — hiding CTA:", otherAgency.name);
            }
            console.log("[availability-submit] PAID other_agency found (Stripe-confirmed) — recommending:", otherAgency.name);
            return {
              recommended_provider: "agency",
              recommended_agency_id: otherAgency.id,
              recommended_agency_name: otherAgency.name,
              cta_url: website,
              message_key: null,
            };
          }
        }
      }

      // ── Path 3b: other_agencies by slug + state_slug ─────────────────────
      // Covers paid standard listings where agencyId was not passed in the request
      // (e.g. owner preview initiated from /your-agency without a resolved id).
      if (!agencyId && agencySlug && stateSlug) {
        let otherBySlugQuery = supabase
          .from("other_agencies")
          .select("id, name, website_url, is_paid_listing, state_slug")
          .eq("slug", agencySlug)
          .eq("state_slug", stateSlug)
          .eq("is_paid_listing", true);

        const { data: otherBySlug } = await otherBySlugQuery.maybeSingle();

        console.log("[availability-submit] other_agencies lookup by slug:", {
          agencySlug,
          stateSlug,
          found: !!otherBySlug,
          isPaidListing: otherBySlug?.is_paid_listing,
        });

        if (otherBySlug) {
          const stripeConfirmed = await hasConfirmedStripeOrder(supabase, otherBySlug.id);
          if (!stripeConfirmed) {
            console.warn("[availability-submit] other_agency (by slug) is_paid_listing=true but no confirmed Stripe order — skipping recommendation:", otherBySlug.name);
          } else {
            const website = validateWebsiteUrl(otherBySlug.website_url);
            if (!website) {
              console.warn("[availability-submit] Paid other_agency (by slug) found but website URL is invalid — hiding CTA:", otherBySlug.name);
            }
            console.log("[availability-submit] PAID other_agency found by slug (Stripe-confirmed) — recommending:", otherBySlug.name);
            return {
              recommended_provider: "agency",
              recommended_agency_id: otherBySlug.id,
              recommended_agency_name: otherBySlug.name,
              cta_url: website,
              message_key: null,
            };
          }
        }
      }

      // ── Path 4: slug-based lookup (last resort) ───────────────────────────
      // Requires stateSlug to prevent cross-state matches.
      if (agencySlug && stateSlug) {
        const { data: slotBySlug } = await supabase
          .from("top25_slots")
          .select("id, agency_id, agency_name, website, is_paid, slot_status, manual_override")
          .ilike("agency_name", agencySlug.replace(/-/g, " "))
          .eq("state_slug", stateSlug)
          .or("is_paid.eq.true,slot_status.eq.sold,manual_override.eq.true")
          .maybeSingle();

        if (slotBySlug) {
          const website = validateWebsiteUrl(slotBySlug.website);
          console.log("[availability-submit] PAID slot found via slug lookup — recommending:", slotBySlug.agency_name);
          return {
            recommended_provider: "agency",
            recommended_agency_id: slotBySlug.agency_id || slotBySlug.id,
            recommended_agency_name: slotBySlug.agency_name,
            cta_url: website,
            message_key: null,
            paid_slot_id: slotBySlug.id,
          };
        }
      }
    }

    console.log("[availability-submit] No paid listing found — using fallback outcome for sentiment:", sentiment);
  } catch (e) {
    console.warn("[availability-submit] resolveOutcome lookup failed:", e);
  }

  return fallbackOutcome("positive");
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return jsonOk({ ok: false, stored: false, error: "Method not allowed", outcome: fallbackOutcome(null) });
  }

  let body: Record<string, unknown> = {};
  try {
    body = await req.json();
  } catch {
    return jsonOk({ ok: false, stored: false, error: "Invalid JSON body", outcome: fallbackOutcome(null) });
  }

  const {
    agencyId,
    stateSlug,
    clientName,
    clientEmail,
    service,
    budget,
    timeline,
    agencyName,
    stateName,
    pageType,
    reviewSlug,
    sentiment,
    agencySlug,
    agencySource,
    isDemo,
    demoSource,
  } = body as Record<string, string | boolean | null | undefined>;

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
  const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    console.error("[availability-submit] Missing Supabase env vars");
    return jsonOk({
      ok: false,
      stored: false,
      request_id: null,
      error: "Server configuration error",
      outcome: fallbackOutcome(sentiment ?? null),
    });
  }

  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

  const validationErrors: string[] = [];
  if (!clientEmail || !EMAIL_RE.test(String(clientEmail)) || String(clientEmail).length > 320) {
    validationErrors.push("Invalid email address");
  }
  const effectiveStateSlug = (stateSlug as string)?.trim() || null;
  if (!effectiveStateSlug) {
    validationErrors.push("Missing stateSlug");
  }
  if (!service || !budget || !timeline) {
    validationErrors.push("Missing required fields: service, budget, timeline");
  }

  console.log("[availability-submit] Request:", {
    agencyId: agencyId || null,
    stateSlug: effectiveStateSlug,
    agencyName: agencyName || null,
    sentiment: sentiment || null,
    isDemo: !!isDemo,
    validationErrors,
  });

  if (validationErrors.length > 0) {
    const outcome = await resolveOutcome(supabase, sentiment ?? null, effectiveStateSlug, agencyId as string ?? null, agencySlug as string ?? null);
    return jsonOk({
      ok: false,
      stored: false,
      request_id: null,
      error: validationErrors.join("; "),
      outcome,
    });
  }

  const outcome = await resolveOutcome(supabase, sentiment ?? null, effectiveStateSlug, agencyId as string ?? null, agencySlug as string ?? null);

  console.log("[availability-submit] Final outcome:", {
    recommended_provider: outcome.recommended_provider,
    recommended_agency_id: outcome.recommended_agency_id,
    recommended_agency_name: outcome.recommended_agency_name,
    cta_url: outcome.cta_url,
  });

  return jsonOk({
    ok: true,
    stored: false,
    request_id: null,
    id: null,
    outcome,
  });
});

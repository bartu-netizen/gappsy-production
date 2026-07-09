import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import {
  loadIntentScores,
  IntentScore,
  SupabaseRpcClient,
} from "../_shared/agencyIntentScores.ts";
import { normalizeAgencyName, normalizeDomain } from "../_shared/normalizeHelpers.ts";

// ─── Name-cleaning constants (unchanged) ────────────────────────────────────
const URL_RE = /https?:\/\/\S+/gi;
const OWNER_PREFIX_RE = /^by\s+owner\s*[,:]?\s*/i;
const CSV_JUNK_RE = /^["',\s]+|["',\s]+$/g;
const LONG_UNBROKEN_RE = /\S{80,}/;
const COORDINATE_RE = /^-?\d+\.\d{3,}$/;
const MOSTLY_NUMERIC_RE = /^[\d\s.,()+\-/]+$/;
const MAPS_RE = /google\.com\/maps|maps\.google/i;

const JUNK_LABELS = new Set([
  "identifies as women-owned", "identifies as veteran-owned",
  "identifies as black-owned", "identifies as lgbtq+ owned",
  "identifies as asian-owned", "identifies as latino-owned",
  "women-owned", "veteran-owned", "black-owned", "lgbtq+ owned",
  "asian-owned", "latino-owned", "minority-owned",
  "wheelchair accessible", "wheelchair-accessible entrance",
  "wheelchair-accessible parking", "open 24 hours",
  "temporarily closed", "permanently closed",
  "online appointments", "in-store shopping",
  "onsite services", "lgbtq+ friendly",
  "agency", "business", "company", "n/a", "na", "none",
  "unknown", "test", "null", "undefined", "placeholder",
]);

function isDisplayableName(name: string | null | undefined): boolean {
  if (!name) return false;
  const t = name.trim();
  if (t.length < 2) return false;
  if (COORDINATE_RE.test(t)) return false;
  if (MOSTLY_NUMERIC_RE.test(t) && t.length < 20) return false;
  if (/^https?:\/\//i.test(t) && !t.includes(" ")) return false;
  if (MAPS_RE.test(t)) return false;
  if (LONG_UNBROKEN_RE.test(t)) return false;
  const lower = t.toLowerCase();
  if (JUNK_LABELS.has(lower) || lower.startsWith("identifies as ")) return false;

  let cleaned = t;
  URL_RE.lastIndex = 0;
  cleaned = cleaned.replace(URL_RE, "");
  cleaned = cleaned.replace(OWNER_PREFIX_RE, "");
  cleaned = cleaned.replace(CSV_JUNK_RE, "");
  cleaned = cleaned.replace(/\s+/g, " ").trim();
  return cleaned.length >= 2;
}

// ─── CORS ────────────────────────────────────────────────────────────────────
const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret",
  "Cache-Control": "no-store, no-cache, must-revalidate",
  "Pragma": "no-cache",
  "Expires": "0",
};

// ─── Types ───────────────────────────────────────────────────────────────────
type SelectionReason =
  | "manual_slot_owner"
  | "paid_standard_activation"
  | "high_intent"
  | "fallback";

interface OtherAgency {
  id: string;
  name: string;
  slug: string | null;
  city: string | null;
  state_slug: string;
  description: string | null;
  services: string[] | null;
  primary_service: string | null;
  is_paid_listing: boolean;
  paid_listing_type: string | null;
  website_url: string | null;
  showcase_pinned: boolean;
  showcase_position: number | null;
  paid_override_active: boolean;
  paid_override_value: boolean | null;
}

interface AgencyWithPaidStatus extends OtherAgency {
  effective_paid: boolean;
  _paid_source_reason?: string;
  _selection_reason?: SelectionReason;
  _activity_score?: number;
  _deepest_step?: number;
  _last_activity_at?: string | null;
}

// ─── SELECT fragment shared by both queries ───────────────────────────────────
const AGENCY_SELECT = `id, name, slug, city, state_slug, description, services, primary_service,
 is_paid_listing, paid_listing_type, website_url, showcase_pinned, showcase_position,
 paid_override_active, paid_override_value`;

// ─── FIX 1 — Prefetch manual showcase slot owners ─────────────────────────────
//
// This runs a SEPARATE targeted query limited to showcase_pinned = true agencies
// for the given state. It is immune to the Supabase 1000-row default cap because
// a state will never have more than 12 manually pinned showcase slots.
// Results are merged into the main dataset and deduped by ID.
//
async function prefetchManualSlotOwners(
  supabase: ReturnType<typeof createClient>,
  stateSlug: string
): Promise<OtherAgency[]> {
  const { data, error } = await supabase
    .from("other_agencies")
    .select(AGENCY_SELECT)
    .eq("state_slug", stateSlug)
    .eq("is_active", true)
    .eq("showcase_pinned", true)
    .gte("showcase_position", 1)
    .or("listing_management_status.is.null,listing_management_status.eq.visible_free,listing_management_status.eq.active_paid");

  if (error) {
    console.warn(`[showcase:${stateSlug}] prefetchManualSlotOwners error:`, error.message);
    return [];
  }
  return (data as OtherAgency[]) || [];
}

// ─── FIX B — Prefetch paid-standard agencies (immune to row-cap) ─────────────
//
// Queries other_agencies rows where is_paid_listing = true for the current state.
// A state will typically have very few paid agencies (< 20), so this targeted
// query is always safe and immune to the 1000-row default cap.
// Results are merged into mergedRaw before buildShowcase runs, guaranteeing
// every paid agency is eligible for Step B regardless of its created_at rank.
//
async function prefetchPaidStandardAgencies(
  supabase: ReturnType<typeof createClient>,
  stateSlug: string
): Promise<OtherAgency[]> {
  const { data, error } = await supabase
    .from("other_agencies")
    .select(AGENCY_SELECT)
    .eq("state_slug", stateSlug)
    .eq("is_active", true)
    .eq("is_paid_listing", true)
    .or("listing_management_status.is.null,listing_management_status.eq.visible_free,listing_management_status.eq.active_paid");

  if (error) {
    console.warn(`[showcase:${stateSlug}] prefetchPaidStandardAgencies error:`, error.message);
    return [];
  }
  return (data as OtherAgency[]) || [];
}

// ─── FIX C — Prefetch high-intent agencies by ID (immune to row-cap) ──────────
//
// compute_agency_intent_scores RPC returns ALL scored agencies for the state with
// no row-cap, since it is an RPC aggregate rather than a direct table query.
// We find which of those agency IDs are NOT yet in mergedRaw (outside the main
// 1000-row window), then fetch their full rows directly by ID.
//
// Top 25 agencies are excluded at the injection point so they cannot re-enter
// the showcase pool through this prefetch path.
//
// The .in() query on a small ID list is always safe (typically < 50 IDs).
//
// UUID v4 guard — the intent scores RPC can return synthetic IDs like
// "top25-new-jersey-13" for slots not yet linked to a real agency row.
// Passing non-UUID strings to a UUID-typed .in() query causes a Postgres
// error that silently returns [] and cancels the entire prefetch.
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

async function prefetchHighIntentAgencies(
  supabase: ReturnType<typeof createClient>,
  stateSlug: string,
  intentScores: Map<string, IntentScore>,
  top25Exclusions: Top25Exclusions,
  alreadyPresentIds: Set<string>
): Promise<OtherAgency[]> {
  const missingIds = [...intentScores.keys()].filter(
    id => UUID_RE.test(id) && !alreadyPresentIds.has(id) && !top25Exclusions.agencyIds.has(id)
  );

  console.log(`[showcase:${stateSlug}] high-intent missing IDs before fetch: ${missingIds.length}`);

  if (missingIds.length === 0) return [];

  const query = supabase
    .from("other_agencies")
    .select(AGENCY_SELECT)
    .in("id", missingIds)
    .eq("is_active", true)
    .or("listing_management_status.is.null,listing_management_status.eq.visible_free,listing_management_status.eq.active_paid");

  const finalQuery = stateSlug ? query.eq("state_slug", stateSlug) : query;

  const { data, error } = await finalQuery;

  if (error) {
    console.warn(`[showcase:${stateSlug}] prefetchHighIntentAgencies error:`, error.message);
    return [];
  }

  const rows = (data as OtherAgency[]) || [];
  const blocked = missingIds.length - rows.length;

  console.log(
    `[showcase:${stateSlug}] high-intent rows fetched after state guard: ${rows.length}` +
    (blocked > 0 ? ` | wrong-state rows blocked: ${blocked}` : "")
  );

  return rows;
}

// ─── Top 25 exclusion identity ───────────────────────────────────────────────
//
// Three complementary identity signals are used to exclude Top 25 agencies from
// the automatic Other Agencies showcase pools (Steps B, C, D). Manual pins
// (Step A) are exempt — admin intent wins.
//
// Primary:   exact agency_id match (fast, zero false positives)
// Secondary: normalized name match within same state (catches same-agency
//            duplicate rows where agency_id differs, e.g. Calta Marketing NY)
// Tertiary:  normalized domain match (catches same agency with different name
//            spellings if a shared website URL is present)
//
interface Top25Exclusions {
  agencyIds: Set<string>;
  normalizedNames: Set<string>;
  normalizedDomains: Set<string>;
}

function isTop25Excluded(
  agency: OtherAgency,
  exclusions: Top25Exclusions,
  stateSlug: string
): boolean {
  if (exclusions.agencyIds.has(agency.id)) {
    console.log(`[showcase:${stateSlug}] excluded by top25 agency_id: ${agency.name}`);
    return true;
  }
  const normName = normalizeAgencyName(agency.name);
  if (normName && exclusions.normalizedNames.has(normName)) {
    console.log(`[showcase:${stateSlug}] excluded by top25 normalized name: ${agency.name}`);
    return true;
  }
  if (agency.website_url) {
    const normDomain = normalizeDomain(agency.website_url);
    if (normDomain && exclusions.normalizedDomains.has(normDomain)) {
      console.log(`[showcase:${stateSlug}] excluded by top25 normalized domain: ${agency.name} (${normDomain})`);
      return true;
    }
  }
  return false;
}

async function loadTop25Exclusions(
  supabase: ReturnType<typeof createClient>,
  stateSlug: string
): Promise<Top25Exclusions> {
  const empty: Top25Exclusions = {
    agencyIds: new Set(),
    normalizedNames: new Set(),
    normalizedDomains: new Set(),
  };
  if (!stateSlug) return empty;
  try {
    const { data } = await supabase
      .from("top25_slots")
      .select("agency_id, agency_name, website")
      .eq("state_slug", stateSlug);

    const agencyIds = new Set<string>();
    const normalizedNames = new Set<string>();
    const normalizedDomains = new Set<string>();

    for (const row of (data || []) as { agency_id: string | null; agency_name: string | null; website: string | null }[]) {
      if (row.agency_id) agencyIds.add(row.agency_id);
      const normName = normalizeAgencyName(row.agency_name || "");
      if (normName) normalizedNames.add(normName);
      const normDomain = normalizeDomain(row.website || "");
      if (normDomain) normalizedDomains.add(normDomain);
    }

    console.log(
      `[showcase:${stateSlug}] top25 ids loaded: ${agencyIds.size} | ` +
      `top25 normalized names loaded: ${normalizedNames.size} | ` +
      `top25 normalized domains loaded: ${normalizedDomains.size}`
    );

    return { agencyIds, normalizedNames, normalizedDomains };
  } catch {
    return empty;
  }
}

// ─── Authoritative Standard Paid resolver ─────────────────────────────────────
//
// Single source of truth for effective_paid status. Matches the logic in
// get_other_agencies_stats (DB RPC) exactly so all 4 surfaces agree.
//
// Resolution order (highest → lowest precedence):
//   1. paid_override_active=true  → override value wins absolutely
//   2. is_paid_listing=true AND EXISTS stripe_orders (payment_status='paid')
//      → Stripe-confirmed purchase
//   3. EXISTS agency_listings (paid_active=true, listing_tier='standard')
//      → listing-activation path (legacy / supplemental)
//
// IMPORTANT: is_paid_listing alone (without a stripe_orders row) does NOT
// count as paid. This prevents webhook-flagged rows with no actual purchase
// from appearing as paid in the showcase, filter, and ranking.
//
// NOTE: paidLookupClient must be a SERVICE-ROLE client.
// stripe_orders and agency_listings have restrictive RLS — anon key reads
// return empty results, which causes effective_paid=false for all agencies.
async function resolveEffectivePaidStatus(
  paidLookupClient: ReturnType<typeof createClient>,
  agencies: OtherAgency[],
  stateSlug: string | null
): Promise<AgencyWithPaidStatus[]> {
  if (agencies.length === 0) return [];

  // Path 1: agency_listings standard paid (activation-backed)
  const listingPaidIds = new Set<string>();
  if (stateSlug) {
    const { data: paidListings } = await paidLookupClient
      .from("agency_listings")
      .select("agency_id")
      .eq("state_slug", stateSlug)
      .eq("paid_active", true)
      .eq("listing_tier", "standard");

    for (const listing of paidListings || []) {
      if (listing.agency_id) listingPaidIds.add(listing.agency_id as string);
    }
  }

  // Path 2: is_paid_listing=true must be backed by a confirmed Stripe order.
  // Exclude paid_listing_type='top25' — those are Top 25 product purchases and
  // must NOT count as Other Agencies Standard Paid ($97) in the showcase.
  // Batch-check only the subset that has is_paid_listing=true (typically < 20).
  const isPaidListingIds = agencies
    .filter(a => a.is_paid_listing && (a.paid_listing_type == null || a.paid_listing_type !== 'top25'))
    .map(a => a.id);
  const stripeConfirmedIds = new Set<string>();
  if (isPaidListingIds.length > 0) {
    const { data: stripeData } = await paidLookupClient
      .from("stripe_orders")
      .select("agency_id")
      .eq("payment_status", "paid")
      .in("agency_id", isPaidListingIds);

    for (const row of stripeData || []) {
      if (row.agency_id) stripeConfirmedIds.add(row.agency_id as string);
    }
  }

  console.log(
    `[paid:${stateSlug}] listing_paid: ${listingPaidIds.size} | ` +
    `is_paid_listing candidates: ${isPaidListingIds.length} | ` +
    `stripe_confirmed: ${stripeConfirmedIds.size}`
  );

  return agencies.map(agency => {
    let effectivePaid: boolean;
    let paidSourceReason: string;

    if (agency.paid_override_active) {
      effectivePaid = agency.paid_override_value ?? false;
      paidSourceReason = effectivePaid ? "manual_override_paid" : "manual_override_unpaid";
    } else if (stripeConfirmedIds.has(agency.id)) {
      effectivePaid = true;
      paidSourceReason = "stripe_confirmed";
    } else if (listingPaidIds.has(agency.id)) {
      effectivePaid = true;
      paidSourceReason = "agency_listing_active";
    } else {
      effectivePaid = false;
      paidSourceReason = agency.is_paid_listing ? "is_paid_listing_no_stripe" : "none";
    }

    return { ...agency, effective_paid: effectivePaid, _paid_source_reason: paidSourceReason };
  });
}

// ─── 4-stage showcase builder ─────────────────────────────────────────────────
//
// STEP A — exact manual slot owners         (showcase_pinned + showcase_position 1–12)
// STEP B — paid standard activation pool    (effective_paid, not Top 25, not already placed)
// STEP C — high-intent pool                 (activity_score > 0, not Top 25, not paid, not placed)
// STEP D — fallback (showcase fill only)    (everyone else NOT in Top 25, preserves sort)
//
// Top 25 exclusion applies to ALL automatic ranks — positions 1–12 AND overflow 13+.
// Manual admin pins (Step A + extendedPins) are the only exception: admin intent wins.
//
// Invariants:
//   • usedIds prevents duplicates across all steps
//   • Top 25 agencies are excluded from Steps B, C, D AND autoOverflow
//   • Manual Step A (1–12) and extendedPins (13+) are exempt from Top 25 exclusion
//   • State safety filter runs before buildShowcase — no cross-state rows enter
//
// PAID / PINNED IMMUNITY (non-negotiable):
//   • Step A (pinned)   — placement is based SOLELY on showcase_position; activity_score
//     is NOT a placement criterion.  A pinned agency is ALWAYS placed, regardless of score.
//   • Step B (paid)     — placement filter is effective_paid (3-path resolver), NOT score.
//     Score is used ONLY to sort paid agencies among themselves within Step B.
//     A paid agency with activity_score = 0 is still placed before ANY high-intent agency.
//   • The 30-day recency multiplier in compute_agency_intent_scores ONLY affects the
//     high-intent bucket (Step C) and the sort order within Step B.  It can NEVER
//     cause a paid agency to fall below Step B into Step C or D.
//
function buildShowcase(
  agencies: AgencyWithPaidStatus[],
  stateSlug: string,
  intentScores: Map<string, IntentScore>,
  top25Exclusions: Top25Exclusions
): AgencyWithPaidStatus[] {
  const SHOWCASE_SIZE = 12;
  const slots: (AgencyWithPaidStatus | null)[] = new Array(SHOWCASE_SIZE).fill(null);
  const usedIds = new Set<string>();

  // ── STEP A: manual slot owners ──────────────────────────────────────────────
  // manualOwners    → showcase_position 1–12 (placed in fixed slots array)
  // extendedPins    → showcase_position 13+  (reserved, spliced into overflow later)
  // nonManual       → everyone else          (eligible for B/C/D auto-ranking)
  const manualOwners: AgencyWithPaidStatus[] = [];
  const extendedPins: AgencyWithPaidStatus[] = [];
  const nonManual: AgencyWithPaidStatus[] = [];

  for (const a of agencies) {
    if (a.showcase_pinned && a.showcase_position !== null && a.showcase_position >= 1) {
      if (a.showcase_position <= SHOWCASE_SIZE) {
        manualOwners.push(a);
      } else {
        extendedPins.push(a);
      }
    } else {
      nonManual.push(a);
    }
  }

  for (const a of manualOwners) {
    const idx = (a.showcase_position as number) - 1;
    slots[idx] = { ...a, _selection_reason: "manual_slot_owner" };
    usedIds.add(a.id);
  }

  // Reserve extended pins from B/C/D auto pools now
  for (const a of extendedPins) {
    usedIds.add(a.id);
  }
  extendedPins.sort((a, b) => (a.showcase_position as number) - (b.showcase_position as number));

  console.log(
    `[showcase:${stateSlug}] Step A: ${manualOwners.length} manual slot owner(s) in 1–12` +
    (extendedPins.length > 0 ? `, ${extendedPins.length} extended pin(s) at 13+` : "") +
    (manualOwners.length > 0
      ? "\n" + manualOwners.map(a => `  slot ${a.showcase_position} → ${a.name}`).join("\n")
      : "") +
    (extendedPins.length > 0
      ? "\n" + extendedPins.map(a => `  slot ${a.showcase_position} → ${a.name}`).join("\n")
      : "")
  );

  // ── STEP B: paid standard activation pool ──────────────────────────────────
  const paidPool = nonManual
    .filter(a =>
      a.effective_paid &&
      !usedIds.has(a.id) &&
      !isTop25Excluded(a, top25Exclusions, stateSlug)
    )
    .sort((a, b) => {
      const sa = intentScores.get(a.id)?.activity_score ?? 0;
      const sb = intentScores.get(b.id)?.activity_score ?? 0;
      return sb - sa;
    });

  let paidPlaced = 0;
  for (const a of paidPool) {
    const emptyIdx = slots.indexOf(null);
    if (emptyIdx === -1) break;
    const scoreEntry = intentScores.get(a.id);
    slots[emptyIdx] = {
      ...a,
      _selection_reason: "paid_standard_activation",
      _activity_score: scoreEntry?.activity_score,
      _deepest_step: scoreEntry?.deepest_step,
      _last_activity_at: scoreEntry?.last_activity_at ?? null,
    };
    usedIds.add(a.id);
    paidPlaced++;
  }

  console.log(
    `[showcase:${stateSlug}] Step B: ${paidPlaced}/${paidPool.length} paid-standard placed` +
    (top25Exclusions.agencyIds.size > 0 ? ` (${top25Exclusions.agencyIds.size} top25 ids, ${top25Exclusions.normalizedNames.size} names in exclusion set)` : "")
  );

  // ── STEP C: high-intent pool ────────────────────────────────────────────────
  const intentPool = nonManual
    .filter(a => {
      if (usedIds.has(a.id)) return false;
      if (isTop25Excluded(a, top25Exclusions, stateSlug)) return false;
      if (a.effective_paid) return false;
      const score = intentScores.get(a.id);
      return score !== undefined && score.activity_score > 0;
    })
    .sort((a, b) => {
      const sa = intentScores.get(a.id)!;
      const sb = intentScores.get(b.id)!;
      const diff = sb.activity_score - sa.activity_score;
      if (diff !== 0) return diff;
      const stepDiff = sb.deepest_step - sa.deepest_step;
      if (stepDiff !== 0) return stepDiff;
      return (sb.last_activity_at ?? "").localeCompare(sa.last_activity_at ?? "");
    });

  let intentPlaced = 0;
  for (const a of intentPool) {
    if (usedIds.has(a.id)) continue;
    const emptyIdx = slots.indexOf(null);
    if (emptyIdx === -1) break;
    const score = intentScores.get(a.id)!;
    slots[emptyIdx] = {
      ...a,
      _selection_reason: "high_intent",
      _activity_score: score.activity_score,
      _deepest_step: score.deepest_step,
      _last_activity_at: score.last_activity_at,
    };
    usedIds.add(a.id);
    intentPlaced++;
  }

  console.log(
    `[showcase:${stateSlug}] Step C: ${intentPlaced}/${intentPool.length} high-intent placed`
  );

  // ── STEP D: fallback (showcase fill only) ───────────────────────────────────
  // FIX 4: Top 25 agencies are now excluded from showcase fill.
  // This prevents agencies like Vazagency from leaking into the automatic first-12
  // when no manual override exists for their position.
  const fallbackPool = nonManual
    .filter(a => !usedIds.has(a.id) && !isTop25Excluded(a, top25Exclusions, stateSlug))
    .sort((a, b) => {
      if (a.effective_paid !== b.effective_paid) return a.effective_paid ? -1 : 1;
      if (a.showcase_pinned !== b.showcase_pinned) return a.showcase_pinned ? -1 : 1;
      return 0;
    });

  let fallbackPlaced = 0;
  for (const a of fallbackPool) {
    if (usedIds.has(a.id)) continue;
    const emptyIdx = slots.indexOf(null);
    if (emptyIdx === -1) break;
    slots[emptyIdx] = { ...a, _selection_reason: "fallback" };
    usedIds.add(a.id);
    fallbackPlaced++;
  }

  console.log(`[showcase:${stateSlug}] Step D: ${fallbackPlaced} fallback placed (showcase fill)`);

  // ── Build result: showcase slots first, then overflow ──────────────────────
  const result: AgencyWithPaidStatus[] = [];
  for (const slot of slots) {
    if (slot !== null) result.push(slot);
  }

  // Overflow (position 13+): auto-sorted base, then extended manual pins spliced
  // at their exact target positions. Sorting: paid first, then by intent score.
  // Top 25 agencies are excluded from overflow (all automatic ranks, not just 1–12).
  // Manual extended pins (extendedPins) are already in usedIds and spliced in below.
  const autoOverflow = nonManual
    .filter(a => !usedIds.has(a.id) && !isTop25Excluded(a, top25Exclusions, stateSlug))
    .sort((a, b) => {
      if (a.effective_paid !== b.effective_paid) return a.effective_paid ? -1 : 1;
      const sa = intentScores.get(a.id)?.activity_score ?? 0;
      const sb = intentScores.get(b.id)?.activity_score ?? 0;
      return sb - sa;
    })
    .map(a => {
      const scoreEntry = intentScores.get(a.id);
      let reason: SelectionReason;
      if (a.effective_paid) {
        reason = "paid_standard_activation";
      } else if (scoreEntry && scoreEntry.activity_score > 0) {
        reason = "high_intent";
      } else {
        reason = "fallback";
      }
      return {
        ...a,
        _selection_reason: reason,
        _activity_score: scoreEntry?.activity_score,
        _deepest_step: scoreEntry?.deepest_step,
        _last_activity_at: scoreEntry?.last_activity_at ?? null,
      };
    });

  // Splice extended manual pins at their target overflow indices.
  // showcase_position 13 → overflow[0], 14 → overflow[1], etc.
  // Iterating in ascending position order ensures each splice is correct.
  const overflow = [...autoOverflow];
  for (const pin of extendedPins) {
    const targetIdx = (pin.showcase_position as number) - SHOWCASE_SIZE - 1;
    const insertAt = Math.min(Math.max(0, targetIdx), overflow.length);
    overflow.splice(insertAt, 0, { ...pin, _selection_reason: "manual_slot_owner" });
  }

  if (extendedPins.length > 0) {
    console.log(
      `[showcase:${stateSlug}] Overflow: ${extendedPins.length} extended pin(s) spliced into ${autoOverflow.length} auto-overflow rows`
    );
  }

  result.push(...overflow);

  // ── Final Top-12 debug log ──────────────────────────────────────────────────
  console.log(`[showcase:${stateSlug}] Final Top 12:`);
  result.slice(0, SHOWCASE_SIZE).forEach((a, i) => {
    const reason = a._selection_reason ?? "unknown";
    const score = a._activity_score != null ? ` score=${a._activity_score}` : "";
    const slotLabel = a.showcase_position != null ? ` (slot ${a.showcase_position})` : "";
    console.log(`  ${i + 1}. ${a.name} [${reason}]${score}${slotLabel}`);
  });

  return result;
}

// ─── Main handler ─────────────────────────────────────────────────────────────
Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const url     = new URL(req.url);
    const state   = url.searchParams.get("state") || null;
    const q       = url.searchParams.get("q") || "";
    const service = url.searchParams.get("service") || "";
    const status  = (url.searchParams.get("status") || "active").toLowerCase();
    const limit   = Math.min(parseInt(url.searchParams.get("limit") || "50"), 500);
    const offset  = parseInt(url.searchParams.get("offset") || "0");
    const isDebug = url.searchParams.get("_debug") === "1"
      && req.headers.has("x-admin-secret");

    const supabaseUrl   = Deno.env.get("SUPABASE_URL");
    const anonKey       = Deno.env.get("SUPABASE_ANON_KEY");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !anonKey) throw new Error("Missing environment variables");

    const supabase = createClient(supabaseUrl, anonKey);

    // Service-role client used ONLY for resolveEffectivePaidStatus.
    // stripe_orders and agency_listings have restrictive RLS that blocks anon
    // reads — without this, stripeConfirmedIds is always empty and every agency
    // gets effective_paid=false, breaking paid badges in the showcase.
    const serviceClient = serviceRoleKey
      ? createClient(supabaseUrl, serviceRoleKey, {
          auth: { autoRefreshToken: false, persistSession: false },
        })
      : supabase;

    // ── Prefetch 1 & 2: manual slot owners + paid-standard agencies (parallel) ──
    // Both run before the main query and are immune to the 1000-row cap.
    // Manual pins: always in showcase slots 1–12 by admin intent.
    // Paid standard: is_paid_listing = true rows targeted directly (typically < 20 per state).
    const [pinnedRows, paidPrefetchRows] = state
      ? await Promise.all([
          prefetchManualSlotOwners(supabase, state),
          prefetchPaidStandardAgencies(supabase, state),
        ])
      : [[], []];

    // ── Fetch raw agency rows (main query) ────────────────────────────────────
    let query = supabase
      .from("other_agencies")
      .select(AGENCY_SELECT)
      .order("created_at", { ascending: false });

    if (status === "active") {
      query = query
        .eq("is_active", true)
        .or("listing_management_status.is.null,listing_management_status.eq.visible_free,listing_management_status.eq.active_paid");
    } else if (status === "inactive") {
      query = query.eq("is_active", false);
    }

    if (state)   query = query.eq("state_slug", state);
    if (q)       query = query.ilike("name", `%${q}%`);
    if (service) query = query.contains("services", [service]);

    const { data: rawData, error } = await query;
    if (error) throw error;

    const mainRows = (rawData as OtherAgency[]) || [];

    // ── Merge manual + paid prefetched rows into main dataset (dedupe by ID) ───
    // seenIds stays mutable so the high-intent prefetch step can extend it.
    const seenIds = new Set<string>(mainRows.map(a => a.id));
    const injectedManual: OtherAgency[] = [];
    const injectedPaid:   OtherAgency[] = [];

    for (const row of pinnedRows) {
      if (!seenIds.has(row.id)) {
        injectedManual.push(row);
        seenIds.add(row.id);
      }
    }
    for (const row of paidPrefetchRows) {
      if (!seenIds.has(row.id)) {
        injectedPaid.push(row);
        seenIds.add(row.id);
      }
    }

    const mergedRaw: OtherAgency[] = [...mainRows, ...injectedManual, ...injectedPaid];

    // ── Load intent scores + Top 25 exclusions in parallel ────────────────────
    // Intent scores RPC has no row-cap — it aggregates across all state agencies.
    // Top 25 exclusions are needed for Steps B, C, D and the high-intent prefetch.
    const [intentScores, top25Exclusions] = await Promise.all([
      loadIntentScores(supabase as unknown as SupabaseRpcClient, state ?? ""),
      loadTop25Exclusions(supabase, state ?? ""),
    ]);

    // ── Prefetch 3: high-intent agencies missing from mergedRaw ───────────────
    // The intent scores RPC surfaces agency IDs that may be outside the main
    // 1000-row window. We fetch those specific rows by ID so Step C can work.
    // Top 25 agencies are excluded at injection time (double-checked in buildShowcase).
    const highIntentInjected = await prefetchHighIntentAgencies(
      supabase, state ?? "", intentScores, top25Exclusions, seenIds
    );
    for (const row of highIntentInjected) {
      mergedRaw.push(row);
      seenIds.add(row.id);
    }

    console.log(
      `[showcase:${state}] main query: ${mainRows.length} | ` +
      `manual prefetched: ${injectedManual.length} | ` +
      `paid prefetched: ${injectedPaid.length} | ` +
      `high-intent prefetched: ${highIntentInjected.length} | ` +
      `mergedRaw final: ${mergedRaw.length}`
    );

    // ── Resolve effective paid status for the now-complete dataset ─────────────
    const agenciesWithPaid = await resolveEffectivePaidStatus(serviceClient, mergedRaw, state);

    console.log(
      `[showcase:${state}] Top25 exclusions — ids: ${top25Exclusions.agencyIds.size} | ` +
      `names: ${top25Exclusions.normalizedNames.size} | ` +
      `domains: ${top25Exclusions.normalizedDomains.size} | ` +
      `paid standard agencies: ${agenciesWithPaid.filter(a => a.effective_paid).length}`
    );

    // ── Defensive state filter — remove any wrong-state rows before showcase ──
    // Guards against intent-score leakage or future data anomalies. Every
    // agency entering buildShowcase for a scoped state request must belong
    // to that state. Overflow (positions 13+) is also covered since the
    // same filtered array is the only input to buildShowcase.
    const displayableAll = agenciesWithPaid.filter(a => isDisplayableName(a.name));
    const displayable = state
      ? displayableAll.filter(a => a.state_slug === state)
      : displayableAll;

    if (state && displayableAll.length !== displayable.length) {
      console.warn(
        `[showcase:${state}] defensive filter blocked ${displayableAll.length - displayable.length} wrong-state row(s) from entering buildShowcase`
      );
    }

    // ── Build showcase with 4-stage pipeline ──────────────────────────────────
    const sorted = buildShowcase(displayable, state ?? "", intentScores, top25Exclusions);
    const paginated   = sorted.slice(offset, offset + limit);

    // ── Shape public response (omit internal _* fields unless debug) ───────────
    const agencies = paginated.map(agency => {
      const base = {
        id:               agency.id,
        name:             agency.name,
        slug:             agency.slug,
        city:             agency.city,
        state_slug:       agency.state_slug,
        description:      agency.description,
        services:         agency.services,
        primary_service:  agency.primary_service,
        is_paid_listing:  agency.effective_paid,
        website_url:      agency.website_url,
        showcase_pinned:  agency.showcase_pinned,
        showcase_position: agency.showcase_position,
      };
      if (!isDebug) return base;
      return {
        ...base,
        _selection_reason:  agency._selection_reason,
        _activity_score:    agency._activity_score ?? null,
        _deepest_step:      agency._deepest_step ?? null,
        _last_activity_at:  agency._last_activity_at ?? null,
        _paid_source_reason: agency._paid_source_reason ?? null,
      };
    });

    return new Response(
      JSON.stringify({ ok: true, agencies, total: sorted.length, limit, offset }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    return new Response(
      JSON.stringify({ ok: false, error: err instanceof Error ? err.message : "Unknown error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});

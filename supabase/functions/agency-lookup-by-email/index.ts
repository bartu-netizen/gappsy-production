import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { computeLeadKey, generateSmartToken, signLeadParams } from "../_shared/leadIdentity.ts";
import { buildActivationDirectLink } from "../_shared/activationDirectLink.ts";
import { ALL_52_STATES } from "../_shared/allStates.ts";

const BASE_URL = "https://www.gappsy.com";
const DISCOUNT_TIERS = [15, 20, 25] as const;

interface CsvLinks {
  your_agency_url: string | null;
  smart_next_url: string | null;
  manage_listing_url_v2: string | null;
  request_replay_url_v2: string | null;
  request_compare_url: string | null;
  activation_direct_link: string | null;
  activation_discount_link_15: string | null;
  activation_discount_link_20: string | null;
  activation_discount_link_25: string | null;
}

async function buildCsvLinks(
  supabase: ReturnType<typeof createClient>,
  agencyId: string,
  agencySlug: string | null,
  stateSlug: string | null,
  matchedEmail: string | null,
  agencyName: string | null,
  agencyWebsite: string | null,
  agencyDescription: string | null,
): Promise<CsvLinks> {
  const links: CsvLinks = {
    your_agency_url: agencySlug ? `${BASE_URL}/your-agency/${agencySlug}` : null,
    smart_next_url: null,
    manage_listing_url_v2: null,
    request_replay_url_v2: null,
    request_compare_url: null,
    activation_direct_link: buildActivationDirectLink({
      agencyId,
      agencyName,
      stateName: stateSlug
        ? (ALL_52_STATES.find(s => s.slug === stateSlug)?.name || null)
        : null,
      stateSlug,
      agencyWebsite,
      agencyDescription,
    }),
    activation_discount_link_15: null,
    activation_discount_link_20: null,
    activation_discount_link_25: null,
  };

  // Smart routing token (mirrors smartlead-export pre-token logic)
  if (agencySlug && matchedEmail) {
    try {
      const leadKey = computeLeadKey(matchedEmail);

      // Reuse existing token if one exists for this agency + lead_key
      let token: string | null = null;
      const { data: existingTok } = await supabase
        .from("smart_link_tokens")
        .select("token")
        .eq("agency_id", agencyId)
        .eq("lead_key", leadKey)
        .order("created_at", { ascending: false })
        .limit(1)
        .maybeSingle();

      if (existingTok?.token) {
        token = existingTok.token as string;
      } else {
        const ts = Date.now();
        const sig = signLeadParams({ agency_id: agencyId, lead_key: leadKey, timestamp: ts });
        const newToken = generateSmartToken();
        const { error: insErr } = await supabase
          .from("smart_link_tokens")
          .insert({
            token: newToken,
            agency_id: agencyId,
            agency_slug: agencySlug || null,
            lead_key: leadKey,
            ts,
            sig,
          });
        if (!insErr) token = newToken;
        else console.warn("[csv_links] smart_link_tokens insert failed (non-fatal):", insErr.message);
      }

      if (token) {
        links.smart_next_url = `${BASE_URL}/continue/${agencySlug}?c=${token}`;
        if (stateSlug) {
          const params = new URLSearchParams();
          params.set("c", token);
          params.set("aid", agencyId);
          params.set("stateSlug", stateSlug);
          links.manage_listing_url_v2 = `${BASE_URL}/manage-listing/${agencySlug}?${params.toString()}`;
          links.request_replay_url_v2 = `${BASE_URL}/request-replay/${agencySlug}?${params.toString()}`;
          links.request_compare_url = `${BASE_URL}/request-compare/${agencySlug}?${params.toString()}`;
        }
      }
    } catch (err) {
      console.warn("[csv_links] smart token build failed (non-fatal):", (err as Error).message);
    }
  }

  // Activation discount tier links (mirrors smartlead-export auto_create logic)
  try {
    const now = new Date();
    let discountQuery = supabase
      .from("discount_offers")
      .select("token, state_slug, discount_type, discount_value, allowed_products, expires_at, max_uses, usage_count, is_active")
      .eq("agency_id", agencyId)
      .eq("is_active", true)
      .eq("discount_type", "percentage");
    if (stateSlug) {
      discountQuery = discountQuery.eq("state_slug", stateSlug);
    } else {
      discountQuery = discountQuery.is("state_slug", null);
    }
    const { data: offers } = await discountQuery;

    const tierTokens = new Map<number, string>();
    for (const o of offers || []) {
      if ((o as any).max_uses !== null && (o as any).max_uses !== undefined && (o as any).usage_count >= (o as any).max_uses) continue;
      if ((o as any).expires_at && new Date((o as any).expires_at) < now) continue;
      const products: string[] = (o as any).allowed_products || [];
      if (!products.includes("activation") && !products.includes("all")) continue;
      const pct = Math.round(Number((o as any).discount_value));
      if (!DISCOUNT_TIERS.includes(pct as 15 | 20 | 25)) continue;
      if (!tierTokens.has(pct)) tierTokens.set(pct, (o as any).token);
    }

    // Auto-create missing tiers (only when we have an agency_id)
    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 30);
    const expiresIso = expiresAt.toISOString();
    for (const pct of DISCOUNT_TIERS) {
      if (tierTokens.has(pct)) continue;
      const token = crypto.randomUUID().replace(/-/g, "");
      const { error: insErr } = await supabase
        .from("discount_offers")
        .insert({
          agency_id: agencyId,
          agency_slug: agencySlug || null,
          state_slug: stateSlug || null,
          token,
          discount_type: "percentage",
          discount_value: pct,
          allowed_products: ["activation"],
          max_uses: 1,
          usage_count: 0,
          is_active: true,
          expires_at: expiresIso,
          internal_note: `${pct}% discount | created from agency lookup`,
          created_by: "agency_lookup",
        });
      if (!insErr) tierTokens.set(pct, token);
      else console.warn(`[csv_links] discount tier ${pct} insert failed (non-fatal):`, insErr.message);
    }

    const t15 = tierTokens.get(15);
    const t20 = tierTokens.get(20);
    const t25 = tierTokens.get(25);
    if (t15) links.activation_discount_link_15 = `${BASE_URL}/offer/${t15}`;
    if (t20) links.activation_discount_link_20 = `${BASE_URL}/offer/${t20}`;
    if (t25) links.activation_discount_link_25 = `${BASE_URL}/offer/${t25}`;
  } catch (err) {
    console.warn("[csv_links] discount tier build failed (non-fatal):", (err as Error).message);
  }

  return links;
}

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers":
    "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret",
};

interface AgencyMatch {
  agency_id: string;
  agency_name: string;
  agency_slug: string | null;
  agency_domain: string | null;
  website_url: string | null;
  state_slug: string;
  match_confidence: "exact" | "normalized" | "domain_match";
  matched_email: string;
  matched_email_id: string | null;
  is_primary: boolean;
}

interface AgencyListing {
  state_slug: string;
  section: "top25" | "other";
  rank: number | null;
  page_path: string;
}

interface LinkedEmail {
  id: string;
  email_raw: string;
  email_normalized: string;
  validation_status: string;
  is_primary: boolean;
  outreach_status: string;
}

function json(body: unknown, status = 200, extra: Record<string, string> = {}) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json", ...extra },
  });
}

function normalizeEmail(email: string): string {
  return email.toLowerCase().trim();
}

function extractDomain(input: string): string | null {
  const parts = input.split("@");
  if (parts.length === 2) {
    return parts[1].toLowerCase().replace(/^www\./, "");
  }
  try {
    const u = new URL(input.startsWith("http") ? input : `https://${input}`);
    return u.hostname.replace(/^www\./, "");
  } catch {
    return null;
  }
}

async function resolveAgencyDetails(
  supabase: ReturnType<typeof createClient>,
  primaryMatch: AgencyMatch,
  t0: number,
  tBeforeParallel: number,
  matchType: string,
  searchedEmail?: string,
  alternativeMatches: AgencyMatch[] = [],
) {
  const [emailsResult, listingsResult, oaResult, activatedListingsResult, stripeOrdersResult, manageFunnelResult, intentScoresResult, profileClicksResult] =
    await Promise.all([
      supabase
        .from("other_agency_emails")
        .select(
          "id, email_raw, email_normalized, validation_status, is_primary, outreach_status",
        )
        .eq("agency_id", primaryMatch.agency_id)
        .order("is_primary", { ascending: false })
        .order("created_at", { ascending: true })
        .limit(20),
      supabase
        .from("agency_listings_index")
        .select("state_slug, section, rank, page_path")
        .eq("agency_id", primaryMatch.agency_id)
        .eq("is_visible", true)
        .order("section", { ascending: true })
        .order("rank", { ascending: true, nullsFirst: false }),
      supabase
        .from("other_agencies")
        .select(
          "is_paid_listing, paid_listing_type, paid_override_active, paid_override_value, " +
            "paid_override_reason, paid_override_updated_at, paid_override_updated_by, state_slug, " +
            "listing_management_status, is_active, created_at, description, short_description, website_url",
        )
        .eq("id", primaryMatch.agency_id)
        .maybeSingle(),
      supabase
        .from("agency_listings")
        .select("state_slug, listing_tier, paid_active, updated_at")
        .eq("agency_id", primaryMatch.agency_id),
      supabase
        .from("stripe_orders")
        .select(
          "payment_status, status, paid_at, state_slug, source_listing_type, " +
            "product_summary, amount_total, currency, created_at, checkout_session_id",
        )
        .eq("agency_id", primaryMatch.agency_id)
        .in("payment_status", ["paid"])
        .order("created_at", { ascending: false })
        .limit(5),
      supabase
        .from("manage_funnel_events")
        .select("id, event_type, recovery_type, created_at, token, agency_slug, entry_reason, engaged_leads_count, total_interactions, state_slug")
        .eq("agency_id", primaryMatch.agency_id)
        .order("created_at", { ascending: false })
        .limit(200),
      supabase.rpc("compute_agency_intent_scores_v2", {
        p_state_slug: primaryMatch.state_slug,
      }),
      supabase
        .from("your_agency_profile_clicks")
        .select("id, created_at, source, state_slug", { count: "exact", head: false })
        .eq("agency_id", primaryMatch.agency_id)
        .order("created_at", { ascending: false })
        .limit(50),
    ]);

  const tParallel = performance.now();

  const linkedEmails: LinkedEmail[] = (emailsResult.data || []).map((e) => ({
    id: e.id,
    email_raw: e.email_raw,
    email_normalized: e.email_normalized,
    validation_status: e.validation_status || "unknown",
    is_primary: e.is_primary ?? false,
    outreach_status: e.outreach_status || "not_sent",
  }));

  let listings: AgencyListing[] = (listingsResult.data || []).map((l) => ({
    state_slug: l.state_slug,
    section: l.section as "top25" | "other",
    rank: l.rank,
    page_path: l.page_path,
  }));

  if (listings.length === 0) {
    const { data: fallbackListings } = await supabase
      .from("other_agencies")
      .select("state_slug")
      .eq("id", primaryMatch.agency_id)
      .eq("is_active", true)
      .limit(10);

    if (fallbackListings && fallbackListings.length > 0) {
      listings = fallbackListings.map((oa) => ({
        state_slug: oa.state_slug,
        section: "other" as const,
        rank: null,
        page_path: `/marketing-agencies-in-${oa.state_slug}-united-states/`,
      }));
    }
  }

  const yourAgencyUrl = primaryMatch.agency_slug
    ? `https://www.gappsy.com/your-agency/${primaryMatch.agency_slug}`
    : `https://www.gappsy.com/your-agency/${primaryMatch.agency_id}`;

  const oaData = oaResult.data as {
    is_paid_listing: boolean;
    paid_listing_type: string | null;
    paid_override_active: boolean;
    paid_override_value: boolean | null;
    paid_override_reason: string | null;
    paid_override_updated_at: string | null;
    paid_override_updated_by: string | null;
    state_slug: string | null;
    listing_management_status: string | null;
    is_active: boolean;
    created_at: string | null;
  } | null;

  const activatedListings = (activatedListingsResult.data || []) as {
    state_slug: string;
    listing_tier: string;
    paid_active: boolean;
    updated_at: string;
  }[];
  const activePaidListings = activatedListings.filter((l) => l.paid_active);

  const stripeOrders = (stripeOrdersResult.data || []) as {
    payment_status: string;
    status: string;
    paid_at: string | null;
    state_slug: string | null;
    source_listing_type: string | null;
    product_summary: string | null;
    amount_total: number | null;
    currency: string | null;
    created_at: string | null;
    checkout_session_id: string;
  }[];

  const stripeBacked = stripeOrders.length > 0;
  const isPaidListing = oaData?.is_paid_listing ?? false;
  const hasActivatedListing = activePaidListings.length > 0;
  const overrideActive = oaData?.paid_override_active ?? false;
  const overrideValue = oaData?.paid_override_value ?? null;

  let paidSourceReason = "none";
  if (overrideActive && overrideValue === true) {
    paidSourceReason = "manual_override";
  } else if (overrideActive && overrideValue === false) {
    paidSourceReason = "manual_override_free";
  } else if (stripeBacked && isPaidListing) {
    paidSourceReason = "stripe_confirmed";
  } else if (stripeBacked && !isPaidListing) {
    paidSourceReason = "stripe_payment_exists";
  } else if (isPaidListing && !stripeBacked) {
    paidSourceReason = "webhook_set_no_order_match";
  } else if (hasActivatedListing && !isPaidListing) {
    paidSourceReason = "listing_activated_only";
  }

  const products: string[] = [];
  if (isPaidListing && stripeBacked) products.push("standard_listing");
  if (hasActivatedListing && !isPaidListing) products.push("listing_activated");

  const hasAnyPaidProduct = overrideActive
    ? (overrideValue ?? false)
    : (stripeBacked && isPaidListing) || hasActivatedListing;

  const lastPaidEventAt =
    stripeOrders[0]?.paid_at || stripeOrders[0]?.created_at || null;

  // ── Aggregate manage_funnel_events ────────────────────────────────────────
  const manageFunnelEvents = (manageFunnelResult.data || []) as {
    id: string;
    event_type: string;
    recovery_type: string | null;
    created_at: string;
    token: string | null;
    agency_slug: string | null;
    entry_reason: string | null;
    engaged_leads_count: number | null;
    total_interactions: number | null;
    state_slug: string | null;
  }[];

  const profileClicksData = (profileClicksResult.data || []) as {
    id: string;
    created_at: string;
    source: string | null;
    state_slug: string | null;
  }[];
  const profileClicksTotal = (profileClicksResult as any).count ?? profileClicksData.length;

  const manageEventCount = manageFunnelEvents.length;
  const manageOpenedCount = manageFunnelEvents.filter(e => e.event_type === "manage_funnel_opened").length;
  const manageRemoveStartedCount = manageFunnelEvents.filter(e => e.event_type === "manage_remove_started").length;
  const manageRecoveredCount = manageFunnelEvents.filter(e => e.event_type === "manage_recovered").length;
  const manageRemoveConfirmedCount = manageFunnelEvents.filter(e => e.event_type === "manage_remove_confirmed").length;

  const lastManageEvent = manageFunnelEvents[0] || null;
  const firstManageOpened = manageFunnelEvents
    .filter(e => e.event_type === "manage_funnel_opened")
    .slice(-1)[0] || null;

  const lastRecoveryEvent = manageFunnelEvents.find(e => e.event_type === "manage_recovered");

  let manageCurrentOutcome: string | null = null;
  if (manageRemoveConfirmedCount > 0) {
    manageCurrentOutcome = "removed";
  } else if (manageRecoveredCount > 0) {
    manageCurrentOutcome = "recovered";
  } else if (manageRemoveStartedCount > 0) {
    manageCurrentOutcome = "remove_intent";
  } else if (manageOpenedCount > 0) {
    manageCurrentOutcome = "opened";
  }

  const manageListingUrl = (lastManageEvent?.agency_slug && lastManageEvent?.token)
    ? `https://www.gappsy.com/manage-listing/${lastManageEvent.agency_slug}?c=${encodeURIComponent(lastManageEvent.token)}`
    : null;

  const manageFunnelContext = {
    manage_event_count: manageEventCount,
    manage_opened_count: manageOpenedCount,
    manage_remove_started_count: manageRemoveStartedCount,
    manage_recovered_count: manageRecoveredCount,
    manage_remove_confirmed_count: manageRemoveConfirmedCount,
    last_manage_event_type: lastManageEvent?.event_type || null,
    last_manage_event_at: lastManageEvent?.created_at || null,
    first_manage_opened_at: firstManageOpened?.created_at || null,
    last_manage_recovery_type: lastRecoveryEvent?.recovery_type || null,
    manage_current_outcome: manageCurrentOutcome,
    manage_listing_url: manageListingUrl,
  };

  // ── Extract intent scores v2 (multi-dimensional scoring with manage funnel) ─
  const intentScoresData = Array.isArray(intentScoresResult.data)
    ? intentScoresResult.data.find((s: any) => s.agency_id === primaryMatch.agency_id)
    : null;

  const intentScoring = intentScoresData ? {
    positive_intent_score: intentScoresData.positive_intent_score || 0,
    churn_intent_score: intentScoresData.churn_intent_score || 0,
    recovery_opportunity_score: intentScoresData.recovery_opportunity_score || 0,
    final_priority_score: intentScoresData.final_priority_score || 0,
    recovery_priority: intentScoresData.recovery_priority || "none",
    activity_score: intentScoresData.activity_score || 0,
    deepest_step: intentScoresData.deepest_step || 0,
  } : {
    positive_intent_score: 0,
    churn_intent_score: 0,
    recovery_opportunity_score: 0,
    final_priority_score: 0,
    recovery_priority: "none",
    activity_score: 0,
    deepest_step: 0,
  };

  const commercialStatus = {
    is_paid_listing: isPaidListing,
    paid_listing_type: oaData?.paid_listing_type ?? null,
    standard_listing_active: hasActivatedListing,
    standard_listing_states: activePaidListings.map((l) => l.state_slug),
    has_any_paid_product: hasAnyPaidProduct,
    stripe_backed: stripeBacked,
    products,
    paid_source_reason: paidSourceReason,
    manual_override_active: overrideActive,
    manual_override_value: overrideValue,
    manual_override_reason: oaData?.paid_override_reason ?? null,
    last_paid_event_at: lastPaidEventAt,
    stripe_orders: stripeOrders.map((o) => ({
      paid_at: o.paid_at || o.created_at,
      state_slug: o.state_slug,
      source_listing_type: o.source_listing_type,
      product_summary: o.product_summary,
      amount_total: o.amount_total,
      currency: o.currency,
    })),
  };

  const elapsed = Math.round(performance.now() - t0);
  const parallelMs = Math.round(tParallel - tBeforeParallel);

  const matchedEmail = primaryMatch.matched_email;

  const csv_links = await buildCsvLinks(
    supabase,
    primaryMatch.agency_id,
    primaryMatch.agency_slug,
    oaData?.state_slug ?? primaryMatch.state_slug,
    matchedEmail || null,
    primaryMatch.agency_name,
    (oaData as any)?.website_url ?? primaryMatch.website_url ?? null,
    ((oaData as any)?.short_description ?? (oaData as any)?.description ?? null) as string | null,
  );

  return {
    ok: true,
    found: true,
    agency: {
      id: primaryMatch.agency_id,
      name: primaryMatch.agency_name,
      slug: primaryMatch.agency_slug,
      domain: primaryMatch.agency_domain,
      website_url: primaryMatch.website_url,
      state_slug: oaData?.state_slug ?? primaryMatch.state_slug,
      is_active: oaData?.is_active ?? true,
      created_at: oaData?.created_at ?? null,
      listing_management_status: oaData?.listing_management_status ?? null,
    },
    your_agency_url: yourAgencyUrl,
    csv_links,
    match_info: {
      searched_email: searchedEmail ?? matchedEmail,
      matched_email: matchedEmail,
      lead_key: matchedEmail ? computeLeadKey(matchedEmail) : "",
      match_type: matchType,
      matched_email_id: primaryMatch.matched_email_id,
    },
    linked_emails: linkedEmails,
    listings,
    alternative_matches: alternativeMatches,
    commercial_status: commercialStatus,
    manage_funnel_context: manageFunnelContext,
    manage_funnel_events_timeline: manageFunnelEvents,
    intent_scoring: intentScoring,
    profile_clicks: {
      total: profileClicksTotal,
      recent: profileClicksData,
    },
    _timing: {
      total_ms: elapsed,
      parallel_ms: parallelMs,
    },
  };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const t0 = performance.now();

  try {
    const body = await req.json();
    const { email, agency_id, agency_slug: bodyAgencySlug } = body as {
      email?: string;
      agency_id?: string;
      agency_slug?: string;
    };

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    // ── Path A-slug: direct agency_slug lookup ─────────────────────────────────
    if (bodyAgencySlug && typeof bodyAgencySlug === "string" && bodyAgencySlug.trim() && !agency_id) {
      const tSlugLookup = performance.now();
      const { data: agencyRow } = await supabase
        .from("other_agencies")
        .select("id, name, slug, website_url, state_slug, is_active")
        .eq("slug", bodyAgencySlug.trim())
        .eq("is_active", true)
        .maybeSingle();

      if (!agencyRow) {
        const elapsed = Math.round(performance.now() - t0);
        return json({
          ok: true,
          found: false,
          agency: null,
          your_agency_url: null,
          csv_links: null,
          match_info: null,
          linked_emails: [],
          listings: [],
          alternative_matches: [],
          manage_funnel_events_timeline: [],
          commercial_status: null,
          manage_funnel_context: null,
          intent_scoring: null,
          profile_clicks: null,
          errors: [],
          _timing: { total_ms: elapsed },
        });
      }

      const { data: primaryEmailRow } = await supabase
        .from("other_agency_emails")
        .select("id, email_normalized, email_raw, is_primary")
        .eq("agency_id", agencyRow.id)
        .eq("is_primary", true)
        .maybeSingle();

      const primaryMatch: AgencyMatch = {
        agency_id: agencyRow.id,
        agency_name: agencyRow.name,
        agency_slug: agencyRow.slug,
        agency_domain: agencyRow.website_url ? extractDomain(agencyRow.website_url) : null,
        website_url: agencyRow.website_url,
        state_slug: agencyRow.state_slug,
        match_confidence: "exact",
        matched_email: primaryEmailRow?.email_normalized ?? "",
        matched_email_id: primaryEmailRow?.id ?? null,
        is_primary: true,
      };

      const result = await resolveAgencyDetails(supabase, primaryMatch, t0, tSlugLookup, "slug_lookup", undefined, []);
      return json(result);
    }

    // ── Path A: direct agency_id lookup ────────────────────────────────────────
    if (agency_id && typeof agency_id === "string" && agency_id.trim()) {
      const tIdLookup = performance.now();

      const { data: agencyRow } = await supabase
        .from("other_agencies")
        .select("id, name, slug, website_url, state_slug, is_active")
        .eq("id", agency_id.trim())
        .maybeSingle();

      if (!agencyRow || !agencyRow.is_active) {
        const elapsed = Math.round(performance.now() - t0);
        return json({
          ok: true,
          found: false,
          agency: null,
          your_agency_url: null,
          csv_links: null,
          match_info: null,
          linked_emails: [],
          listings: [],
          alternative_matches: [],
          manage_funnel_events_timeline: [],
          commercial_status: null,
          manage_funnel_context: null,
          intent_scoring: null,
          profile_clicks: null,
          errors: [],
          _timing: { total_ms: elapsed },
        });
      }

      const { data: primaryEmailRow } = await supabase
        .from("other_agency_emails")
        .select("id, email_normalized, email_raw, is_primary")
        .eq("agency_id", agency_id.trim())
        .eq("is_primary", true)
        .maybeSingle();

      const primaryMatch: AgencyMatch = {
        agency_id: agencyRow.id,
        agency_name: agencyRow.name,
        agency_slug: agencyRow.slug,
        agency_domain: agencyRow.website_url
          ? extractDomain(agencyRow.website_url)
          : null,
        website_url: agencyRow.website_url,
        state_slug: agencyRow.state_slug,
        match_confidence: "exact",
        matched_email: primaryEmailRow?.email_normalized ?? "",
        matched_email_id: primaryEmailRow?.id ?? null,
        is_primary: true,
      };

      const result = await resolveAgencyDetails(
        supabase,
        primaryMatch,
        t0,
        tIdLookup,
        "id_lookup",
        undefined,
        [],
      );

      return json(result);
    }

    // ── Path B: email-based lookup ─────────────────────────────────────────────
    if (!email || typeof email !== "string") {
      return json({ ok: false, error: "Email or agency_id is required" }, 400);
    }

    const normalizedEmail = normalizeEmail(email);
    const domain = extractDomain(normalizedEmail);

    const tQuery = performance.now();

    const { data: exactMatches } = await supabase
      .from("other_agency_emails")
      .select(
        `id, email_raw, email_normalized, is_primary, agency_id,
         other_agencies!inner (id, name, slug, website_url, state_slug)`,
      )
      .eq("email_normalized", normalizedEmail)
      .eq("other_agencies.is_active", true)
      .eq("exclude_from_agency_lookup", false)
      .limit(10);

    const tExact = performance.now();

    const allMatches: AgencyMatch[] = [];

    if (exactMatches && exactMatches.length > 0) {
      for (const match of exactMatches) {
        const agency = match.other_agencies as unknown as {
          id: string;
          name: string;
          slug: string | null;
          website_url: string | null;
          state_slug: string;
        };
        allMatches.push({
          agency_id: agency.id,
          agency_name: agency.name,
          agency_slug: agency.slug,
          agency_domain: agency.website_url
            ? extractDomain(agency.website_url)
            : null,
          website_url: agency.website_url,
          state_slug: agency.state_slug,
          match_confidence: "exact",
          matched_email: match.email_normalized,
          matched_email_id: match.id,
          is_primary: match.is_primary ?? false,
        });
      }
    }

    let tDomain = tExact;

    if (allMatches.length === 0 && domain) {
      const { data: domainMatches } = await supabase
        .from("other_agencies")
        .select("id, name, slug, website_url, state_slug")
        .eq("is_active", true)
        .eq("website_domain_normalized", domain)
        .limit(10);

      tDomain = performance.now();

      if (domainMatches && domainMatches.length > 0) {
        for (const agency of domainMatches) {
          allMatches.push({
            agency_id: agency.id,
            agency_name: agency.name,
            agency_slug: agency.slug,
            agency_domain: agency.website_url
              ? extractDomain(agency.website_url)
              : null,
            website_url: agency.website_url,
            state_slug: agency.state_slug,
            match_confidence: "domain_match",
            matched_email: normalizedEmail,
            matched_email_id: null,
            is_primary: false,
          });
        }
      }
    }

    if (allMatches.length === 0) {
      const elapsed = Math.round(performance.now() - t0);
      return json({
        ok: true,
        found: false,
        agency: null,
        your_agency_url: null,
        csv_links: null,
        match_info: null,
        linked_emails: [],
        listings: [],
        alternative_matches: [],
        manage_funnel_events_timeline: [],
        commercial_status: null,
        manage_funnel_context: null,
        intent_scoring: null,
        profile_clicks: null,
        errors: [],
        _timing: {
          total_ms: elapsed,
          exact_ms: Math.round(tExact - tQuery),
          domain_ms: Math.round(tDomain - tExact),
        },
      });
    }

    const primaryMatch = allMatches[0];
    const alternativeMatches = allMatches.slice(1);

    const result = await resolveAgencyDetails(
      supabase,
      primaryMatch,
      t0,
      tDomain,
      primaryMatch.match_confidence,
      normalizedEmail,
      alternativeMatches,
    );

    return json({
      ...result,
      _timing: {
        ...result._timing,
        exact_ms: Math.round(tExact - tQuery),
        domain_ms: Math.round(tDomain - tExact),
      },
    });
  } catch (err) {
    const elapsed = Math.round(performance.now() - t0);
    console.error("[agency-lookup-by-email] error:", err);
    return json(
      {
        ok: false,
        found: false,
        agency: null,
        your_agency_url: null,
        csv_links: null,
        match_info: null,
        linked_emails: [],
        listings: [],
        alternative_matches: [],
        manage_funnel_events_timeline: [],
        commercial_status: null,
        manage_funnel_context: null,
        intent_scoring: null,
        profile_clicks: null,
        errors: [err instanceof Error ? err.message : "Internal error"],
        error: err instanceof Error ? err.message : "Internal error",
        _timing: { total_ms: elapsed },
      },
      500,
    );
  }
});

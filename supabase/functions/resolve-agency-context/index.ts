import { createClient } from "npm:@supabase/supabase-js@2";
import { computeRotatedBase, persistRotatedBase, pickCurrentMostRecentMs, seedFor } from "../_shared/canonicalRotation.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers":
    "Content-Type, Authorization, X-Client-Info, Apikey",
};

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function djb2(str: string): number {
  let h = 5381;
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
    h = h >>> 0;
  }
  return h;
}

interface ResolvedAgency {
  id: string;
  name: string;
  slug: string;
  domain: string | null;
  state_slug_hint?: string | null;
}

interface ListingRow {
  state_slug: string;
  section: string;
  rank: number | null;
  other_position: number | null;
  page_path: string;
  agency_domain?: string | null;
}

type ResolveSource = "token" | "agency_id" | "slug" | "name";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const url = new URL(req.url);
    let agencySlug: string | null = null;
    let agencyName: string | null = null;
    let token: string | null = null;
    let agencyId: string | null = null;

    if (req.method === "POST") {
      const body = await req.json().catch(() => ({}));
      agencySlug = body.agency_slug ?? null;
      agencyName = body.agency_name ?? null;
      token = body.token ?? null;
      agencyId = body.agency_id ?? null;
    } else {
      agencySlug = url.searchParams.get("agency_slug");
      agencyName = url.searchParams.get("agency_name");
      token = url.searchParams.get("token");
      agencyId = url.searchParams.get("agency_id");
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    const uuidRegex =
      /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

    let resolved: ResolvedAgency | null = null;
    let resolveSource: ResolveSource = "slug";
    const tokenStateSlug: string | null = null;

    if (token) {
      const { data: tokenRow } = await supabase
        .from("agency_claim_tokens")
        .select("agency_id, agency_slug, agency_name")
        .eq("token", token)
        .maybeSingle();

      if (tokenRow) {
        resolved = {
          id: tokenRow.agency_id,
          name: tokenRow.agency_name,
          slug: tokenRow.agency_slug,
          domain: null,
        };
        resolveSource = "token";

        supabase
          .from("agency_claim_tokens")
          .update({ last_used_at: new Date().toISOString() })
          .eq("token", token)
          .then(() => {})
          .catch(() => {});
      } else {
        const { data: smartToken } = await supabase
          .from("smart_link_tokens")
          .select("agency_id, agency_slug")
          .eq("token", token)
          .maybeSingle();

        if (smartToken) {
          const agencyFromToken = await resolveById(supabase, smartToken.agency_id);
          if (agencyFromToken) {
            resolved = agencyFromToken;
            resolveSource = "token";
          }
        }
      }
    }

    if (!resolved && agencyId) {
      resolved = await resolveById(supabase, agencyId);
      if (resolved) resolveSource = "agency_id";
    }

    if (!resolved && agencySlug) {
      if (uuidRegex.test(agencySlug)) {
        resolved = await resolveById(supabase, agencySlug);
        if (resolved) resolveSource = "agency_id";
      } else {
        resolved = await resolveBySlug(supabase, agencySlug);
        if (resolved) resolveSource = "slug";
      }
    }

    if (!resolved && agencyName) {
      resolved = await resolveByName(supabase, agencyName);
      if (resolved) resolveSource = "name";
    }

    if (!resolved) {
      return json({ ok: false, error: "Agency not found" }, 404);
    }

    // Re-hydrate other_agencies hints if we only resolved via listing tables.
    if (!resolved.state_slug_hint) {
      const { data: otherRow } = await supabase
        .from("other_agencies")
        .select("state_slug, website_domain_normalized")
        .eq("id", resolved.id)
        .eq("is_active", true)
        .maybeSingle();
      if (otherRow) {
        resolved.state_slug_hint = otherRow.state_slug ?? null;
        if (!resolved.domain && otherRow.website_domain_normalized) {
          resolved.domain = otherRow.website_domain_normalized;
        }
      }
    }

    const [mgmtResult, listings] = await Promise.all([
      supabase
        .from("other_agencies")
        .select("listing_management_status")
        .eq("id", resolved.id)
        .maybeSingle(),
      fetchListings(supabase, resolved.id, resolved.state_slug_hint ?? null),
    ]);

    // Agency-specific state recovery chain (no global hardcoded default).
    let lastKnownStateSlug: string | null = null;
    if (listings.length === 0 || !selectCanonicalListing(listings, tokenStateSlug)?.state_slug) {
      lastKnownStateSlug = await recoverStateSlugForAgency(
        supabase,
        resolved.id,
        resolved.slug ?? null,
      );
    }

    // If listings are empty but we have any state hint, synthesize one row
    let finalListings = listings;
    if (finalListings.length === 0) {
      const synthSlug = resolved.state_slug_hint || lastKnownStateSlug || "";
      if (synthSlug) {
        finalListings = [
          {
            state_slug: synthSlug,
            section: "other",
            rank: null,
            other_position: null,
            page_path: `/marketing-agencies-in-${synthSlug}-united-states/`,
            agency_domain: resolved.domain ?? null,
          },
        ];
      }
    }

    const canonicalListing = selectCanonicalListing(finalListings, tokenStateSlug);

    let stateSource: "listing" | "other_agencies" | "recovered" | "unresolved" =
      "unresolved";
    let canonicalStateSlug = "";
    if (canonicalListing?.state_slug) {
      canonicalStateSlug = canonicalListing.state_slug;
      stateSource = "listing";
    } else if (resolved.state_slug_hint) {
      canonicalStateSlug = resolved.state_slug_hint;
      stateSource = "other_agencies";
    } else if (lastKnownStateSlug) {
      canonicalStateSlug = lastKnownStateSlug;
      stateSource = "recovered";
    }
    const canonicalStateName = stateSlugToName(canonicalStateSlug);
    const canonicalStateAbbr = stateSlugToAbbr(canonicalStateSlug);
    const canonicalUrl = canonicalListing?.page_path
      ? `https://www.gappsy.com${canonicalListing.page_path}`
      : canonicalStateSlug
        ? `https://www.gappsy.com/marketing-agencies-in-${canonicalStateSlug}-united-states/`
        : "";

    const kpi = await resolveKpi(
      supabase,
      resolved.slug || agencySlug || "",
      resolved.id,
      canonicalStateSlug,
    );

    const listingManagementStatus: string | null =
      mgmtResult.data?.listing_management_status ?? null;

    if (!resolved.domain && finalListings.length > 0) {
      const withDomain = finalListings.find(
        (l: ListingRow) => l.agency_domain,
      );
      if (withDomain) resolved.domain = withDomain.agency_domain ?? null;
    }

    return json({
      ok: true,
      resolve_source: resolveSource,
      agency: {
        id: resolved.id,
        name: resolved.name,
        slug: resolved.slug,
        domain: resolved.domain,
        listing_management_status: listingManagementStatus,
      },
      canonical_state_slug: canonicalStateSlug,
      canonical_state_name: canonicalStateName,
      canonical_state_abbr: canonicalStateAbbr,
      canonical_url: canonicalUrl,
      state_source: stateSource,
      listings: finalListings,
      best_listing: canonicalListing,
      kpi: {
        missedCount: kpi.missedCount,
        baseGeneratedCount: kpi.baseGeneratedCount,
        anchorMs: kpi.anchorMs,
        baseAnchorMs: kpi.baseAnchorMs,
        overrideEntries: kpi.overrideEntries,
        priorityOverrideActive: kpi.priorityOverrideActive,
        priorityOverrideUntilMs: kpi.priorityOverrideUntilMs,
      },
    });
  } catch (err) {
    console.error("[resolve-agency-context]", err);
    return json({ ok: false, error: "Internal error" }, 500);
  }
});

function selectCanonicalListing(
  listings: ListingRow[],
  hintStateSlug: string | null,
): ListingRow | null {
  if (!listings || listings.length === 0) return null;

  if (listings.length === 1) return listings[0];

  const top25 = listings
    .filter((l) => l.section === "top25")
    .sort((a, b) => (a.rank ?? 99) - (b.rank ?? 99));

  if (top25.length === 1) return top25[0];

  if (hintStateSlug) {
    const hinted = listings.find((l) => l.state_slug === hintStateSlug);
    if (hinted) return hinted;
    const hintedTop25 = top25.find((l) => l.state_slug === hintStateSlug);
    if (hintedTop25) return hintedTop25;
  }

  if (top25.length > 0) return top25[0];

  const sorted = [...listings].sort(
    (a, b) => (a.other_position ?? 9999) - (b.other_position ?? 9999),
  );
  return sorted[0];
}

const STATE_NAMES: Record<string, string> = {
  'alabama': 'Alabama', 'alaska': 'Alaska', 'arizona': 'Arizona', 'arkansas': 'Arkansas',
  'california': 'California', 'colorado': 'Colorado', 'connecticut': 'Connecticut', 'delaware': 'Delaware',
  'district-of-columbia': 'District of Columbia', 'florida': 'Florida', 'georgia': 'Georgia', 'hawaii': 'Hawaii',
  'idaho': 'Idaho', 'illinois': 'Illinois', 'indiana': 'Indiana', 'iowa': 'Iowa',
  'kansas': 'Kansas', 'kentucky': 'Kentucky', 'louisiana': 'Louisiana', 'maine': 'Maine',
  'maryland': 'Maryland', 'massachusetts': 'Massachusetts', 'michigan': 'Michigan', 'minnesota': 'Minnesota',
  'mississippi': 'Mississippi', 'missouri': 'Missouri', 'montana': 'Montana', 'nebraska': 'Nebraska',
  'nevada': 'Nevada', 'new-hampshire': 'New Hampshire', 'new-jersey': 'New Jersey', 'new-mexico': 'New Mexico',
  'new-york': 'New York', 'north-carolina': 'North Carolina', 'north-dakota': 'North Dakota', 'ohio': 'Ohio',
  'oklahoma': 'Oklahoma', 'oregon': 'Oregon', 'pennsylvania': 'Pennsylvania', 'puerto-rico': 'Puerto Rico',
  'rhode-island': 'Rhode Island', 'south-carolina': 'South Carolina', 'south-dakota': 'South Dakota',
  'tennessee': 'Tennessee', 'texas': 'Texas', 'utah': 'Utah', 'vermont': 'Vermont',
  'virginia': 'Virginia', 'washington': 'Washington', 'west-virginia': 'West Virginia',
  'wisconsin': 'Wisconsin', 'wyoming': 'Wyoming',
};

const STATE_ABBRS: Record<string, string> = {
  'alabama': 'AL', 'alaska': 'AK', 'arizona': 'AZ', 'arkansas': 'AR',
  'california': 'CA', 'colorado': 'CO', 'connecticut': 'CT', 'delaware': 'DE',
  'district-of-columbia': 'DC', 'florida': 'FL', 'georgia': 'GA', 'hawaii': 'HI',
  'idaho': 'ID', 'illinois': 'IL', 'indiana': 'IN', 'iowa': 'IA',
  'kansas': 'KS', 'kentucky': 'KY', 'louisiana': 'LA', 'maine': 'ME',
  'maryland': 'MD', 'massachusetts': 'MA', 'michigan': 'MI', 'minnesota': 'MN',
  'mississippi': 'MS', 'missouri': 'MO', 'montana': 'MT', 'nebraska': 'NE',
  'nevada': 'NV', 'new-hampshire': 'NH', 'new-jersey': 'NJ', 'new-mexico': 'NM',
  'new-york': 'NY', 'north-carolina': 'NC', 'north-dakota': 'ND', 'ohio': 'OH',
  'oklahoma': 'OK', 'oregon': 'OR', 'pennsylvania': 'PA', 'puerto-rico': 'PR',
  'rhode-island': 'RI', 'south-carolina': 'SC', 'south-dakota': 'SD', 'tennessee': 'TN',
  'texas': 'TX', 'utah': 'UT', 'vermont': 'VT', 'virginia': 'VA',
  'washington': 'WA', 'west-virginia': 'WV', 'wisconsin': 'WI', 'wyoming': 'WY',
};

function stateSlugToName(slug: string): string {
  return STATE_NAMES[slug] ?? '';
}

function stateSlugToAbbr(slug: string): string {
  return STATE_ABBRS[slug] ?? '';
}

async function resolveBySlug(
  supabase: ReturnType<typeof createClient>,
  slug: string,
): Promise<ResolvedAgency | null> {
  const { data: row } = await supabase
    .from("agency_listings_index")
    .select("agency_id, agency_name, agency_slug, agency_domain")
    .eq("agency_slug", slug)
    .eq("is_visible", true)
    .limit(1)
    .maybeSingle();

  if (row) {
    return {
      id: row.agency_id,
      name: row.agency_name,
      slug: row.agency_slug,
      domain: row.agency_domain,
    };
  }

  const { data: srcRow } = await supabase
    .from("agency_listings_search_sources")
    .select("agency_id, agency_name, agency_slug, agency_domain")
    .eq("agency_slug", slug)
    .limit(1)
    .maybeSingle();

  if (srcRow) {
    return {
      id: srcRow.agency_id,
      name: srcRow.agency_name,
      slug: srcRow.agency_slug,
      domain: srcRow.agency_domain,
    };
  }

  const { data: mvRow } = await supabase
    .from("public_agency_search_mv")
    .select("source_agency_id, agency_name, agency_slug, agency_domain")
    .eq("agency_slug", slug)
    .limit(1)
    .maybeSingle();

  if (mvRow) {
    return {
      id: mvRow.source_agency_id,
      name: mvRow.agency_name,
      slug: mvRow.agency_slug,
      domain: mvRow.agency_domain,
    };
  }

  const { data: otherRow } = await supabase
    .from("other_agencies")
    .select("id, name, slug, state_slug, website_domain_normalized")
    .eq("slug", slug)
    .eq("is_active", true)
    .limit(1)
    .maybeSingle();

  if (otherRow) {
    return {
      id: otherRow.id,
      name: otherRow.name,
      slug: otherRow.slug,
      domain: otherRow.website_domain_normalized ?? null,
      state_slug_hint: otherRow.state_slug ?? null,
    };
  }

  return null;
}

async function resolveById(
  supabase: ReturnType<typeof createClient>,
  id: string,
): Promise<ResolvedAgency | null> {
  const { data: row } = await supabase
    .from("agency_listings_index")
    .select("agency_id, agency_name, agency_slug, agency_domain")
    .eq("agency_id", id)
    .eq("is_visible", true)
    .limit(1)
    .maybeSingle();

  if (row) {
    return {
      id: row.agency_id,
      name: row.agency_name,
      slug: row.agency_slug,
      domain: row.agency_domain,
    };
  }

  const { data: srcRow } = await supabase
    .from("agency_listings_search_sources")
    .select("agency_id, agency_name, agency_slug, agency_domain")
    .eq("agency_id", id)
    .limit(1)
    .maybeSingle();

  if (srcRow) {
    return {
      id: srcRow.agency_id,
      name: srcRow.agency_name,
      slug: srcRow.agency_slug,
      domain: srcRow.agency_domain,
    };
  }

  const { data: mvRow } = await supabase
    .from("public_agency_search_mv")
    .select("source_agency_id, agency_name, agency_slug, agency_domain")
    .eq("source_agency_id", id)
    .limit(1)
    .maybeSingle();

  if (mvRow) {
    return {
      id: mvRow.source_agency_id,
      name: mvRow.agency_name,
      slug: mvRow.agency_slug,
      domain: mvRow.agency_domain,
    };
  }

  const { data: otherRow } = await supabase
    .from("other_agencies")
    .select("id, name, slug, state_slug, website_domain_normalized")
    .eq("id", id)
    .eq("is_active", true)
    .limit(1)
    .maybeSingle();

  if (otherRow) {
    return {
      id: otherRow.id,
      name: otherRow.name,
      slug: otherRow.slug,
      domain: otherRow.website_domain_normalized ?? null,
      state_slug_hint: otherRow.state_slug ?? null,
    };
  }

  return null;
}

function normalizeAgencyName(raw: string): string {
  return raw
    .toLowerCase()
    .replace(/[\u2018\u2019\u201C\u201D]/g, "'")
    .replace(/[^a-z0-9]+/g, " ")
    .trim();
}

function escapeIlike(value: string): string {
  return value.replace(/[%_\\]/g, (m) => `\\${m}`);
}

async function resolveByName(
  supabase: ReturnType<typeof createClient>,
  name: string,
): Promise<ResolvedAgency | null> {
  const cleaned = name.trim();
  if (!cleaned) return null;

  const normalized = normalizeAgencyName(cleaned);
  if (!normalized) return null;

  type Candidate = {
    agency: ResolvedAgency;
    authority: number;
  };

  const candidates: Candidate[] = [];
  const seenIds = new Set<string>();
  const pushCandidate = (agency: ResolvedAgency | null, authority: number) => {
    if (!agency || !agency.id || seenIds.has(agency.id)) return;
    seenIds.add(agency.id);
    candidates.push({ agency, authority });
  };

  // Tier 1: exact normalized match across all sources (highest authority first).
  const { data: otherExact } = await supabase
    .from("other_agencies")
    .select("id, name, slug, state_slug, website_domain_normalized")
    .eq("is_active", true)
    .ilike("name", escapeIlike(cleaned))
    .limit(5);
  for (const row of otherExact ?? []) {
    if (normalizeAgencyName(row.name ?? "") === normalized) {
      pushCandidate(
        {
          id: row.id,
          name: row.name,
          slug: row.slug,
          domain: row.website_domain_normalized ?? null,
          state_slug_hint: row.state_slug ?? null,
        },
        4,
      );
    }
  }

  const { data: idxExact } = await supabase
    .from("agency_listings_index")
    .select("agency_id, agency_name, agency_slug, agency_domain")
    .eq("is_visible", true)
    .ilike("agency_name", escapeIlike(cleaned))
    .limit(5);
  for (const row of idxExact ?? []) {
    if (normalizeAgencyName(row.agency_name ?? "") === normalized) {
      pushCandidate(
        {
          id: row.agency_id,
          name: row.agency_name,
          slug: row.agency_slug,
          domain: row.agency_domain,
        },
        3,
      );
    }
  }

  const { data: srcExact } = await supabase
    .from("agency_listings_search_sources")
    .select("agency_id, agency_name, agency_slug, agency_domain")
    .ilike("agency_name", escapeIlike(cleaned))
    .limit(5);
  for (const row of srcExact ?? []) {
    if (normalizeAgencyName(row.agency_name ?? "") === normalized) {
      pushCandidate(
        {
          id: row.agency_id,
          name: row.agency_name,
          slug: row.agency_slug,
          domain: row.agency_domain,
        },
        2,
      );
    }
  }

  const { data: mvExact } = await supabase
    .from("public_agency_search_mv")
    .select("source_agency_id, agency_name, agency_slug, agency_domain")
    .ilike("agency_name", escapeIlike(cleaned))
    .limit(5);
  for (const row of mvExact ?? []) {
    if (normalizeAgencyName(row.agency_name ?? "") === normalized) {
      pushCandidate(
        {
          id: row.source_agency_id,
          name: row.agency_name,
          slug: row.agency_slug,
          domain: row.agency_domain,
        },
        1,
      );
    }
  }

  // Exact match: if a single highest-authority candidate exists, take it.
  if (candidates.length > 0) {
    const maxAuthority = Math.max(...candidates.map((c) => c.authority));
    const topTier = candidates.filter((c) => c.authority === maxAuthority);
    if (topTier.length === 1) return topTier[0].agency;
    // Ambiguous across multiple distinct agencies at same authority — refuse.
    return null;
  }

  // Tier 2: strict case-insensitive match (ilike exact value). Only unique hits are safe.
  const strictCandidates: Candidate[] = [];
  const seenStrict = new Set<string>();
  const pushStrict = (agency: ResolvedAgency | null, authority: number) => {
    if (!agency || !agency.id || seenStrict.has(agency.id)) return;
    seenStrict.add(agency.id);
    strictCandidates.push({ agency, authority });
  };

  for (const row of otherExact ?? []) {
    pushStrict(
      {
        id: row.id,
        name: row.name,
        slug: row.slug,
        domain: row.website_domain_normalized ?? null,
        state_slug_hint: row.state_slug ?? null,
      },
      4,
    );
  }
  for (const row of idxExact ?? []) {
    pushStrict(
      {
        id: row.agency_id,
        name: row.agency_name,
        slug: row.agency_slug,
        domain: row.agency_domain,
      },
      3,
    );
  }
  for (const row of srcExact ?? []) {
    pushStrict(
      {
        id: row.agency_id,
        name: row.agency_name,
        slug: row.agency_slug,
        domain: row.agency_domain,
      },
      2,
    );
  }

  if (strictCandidates.length > 0) {
    const maxAuthority = Math.max(...strictCandidates.map((c) => c.authority));
    const topTier = strictCandidates.filter((c) => c.authority === maxAuthority);
    if (topTier.length === 1) return topTier[0].agency;
    return null;
  }

  // Tier 3: loose prefix match (safer than arbitrary ilike). Require uniqueness.
  const prefix = `${escapeIlike(cleaned)}%`;
  const { data: otherLoose } = await supabase
    .from("other_agencies")
    .select("id, name, slug, state_slug, website_domain_normalized")
    .eq("is_active", true)
    .ilike("name", prefix)
    .limit(5);

  if (otherLoose && otherLoose.length === 1) {
    const row = otherLoose[0];
    return {
      id: row.id,
      name: row.name,
      slug: row.slug,
      domain: row.website_domain_normalized ?? null,
      state_slug_hint: row.state_slug ?? null,
    };
  }

  const { data: idxLoose } = await supabase
    .from("agency_listings_index")
    .select("agency_id, agency_name, agency_slug, agency_domain")
    .eq("is_visible", true)
    .ilike("agency_name", prefix)
    .limit(5);

  if (idxLoose && idxLoose.length === 1) {
    const row = idxLoose[0];
    return {
      id: row.agency_id,
      name: row.agency_name,
      slug: row.agency_slug,
      domain: row.agency_domain,
    };
  }

  return null;
}

async function recoverStateSlugForAgency(
  supabase: ReturnType<typeof createClient>,
  agencyId: string,
  agencySlug: string | null,
): Promise<string | null> {
  // Agency-specific recovery chain. Never falls back to a global default.
  // Order: authoritative listing sources -> other_agencies -> canonical_replay_state
  // -> historical availability requests -> page_path inference -> domain history.
  try {
    const { data: idxRow } = await supabase
      .from("agency_listings_index")
      .select("state_slug, page_path")
      .eq("agency_id", agencyId)
      .eq("is_visible", true)
      .not("state_slug", "is", null)
      .limit(1)
      .maybeSingle();
    if (idxRow?.state_slug) return idxRow.state_slug as string;

    const { data: srcRow } = await supabase
      .from("agency_listings_search_sources")
      .select("state_slug, page_path")
      .eq("agency_id", agencyId)
      .not("state_slug", "is", null)
      .limit(1)
      .maybeSingle();
    if (srcRow?.state_slug) return srcRow.state_slug as string;

    const { data: mvRow } = await supabase
      .from("public_agency_search_mv")
      .select("state_slug, page_path")
      .eq("source_agency_id", agencyId)
      .not("state_slug", "is", null)
      .limit(1)
      .maybeSingle();
    if (mvRow?.state_slug) return mvRow.state_slug as string;

    const { data: otherRow } = await supabase
      .from("other_agencies")
      .select("state_slug")
      .eq("id", agencyId)
      .eq("is_active", true)
      .not("state_slug", "is", null)
      .maybeSingle();
    if (otherRow?.state_slug) return otherRow.state_slug as string;

    const { data: crsRow } = await supabase
      .from("canonical_replay_state")
      .select("state_slug")
      .eq("agency_id", agencyId)
      .not("state_slug", "is", null)
      .order("updated_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    if (crsRow?.state_slug) return crsRow.state_slug as string;

    const { data: avReqRow } = await supabase
      .from("agency_availability_requests")
      .select("state_slug")
      .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
      .not("state_slug", "is", null)
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    if (avReqRow?.state_slug) return avReqRow.state_slug as string;

    const tryPath = (p: unknown): string | null => {
      if (typeof p !== "string") return null;
      const m = p.match(/\/marketing-agencies-in-([a-z-]+)-united-states\//i);
      return m?.[1] ?? null;
    };
    const inferred = tryPath(idxRow?.page_path) ?? tryPath(srcRow?.page_path) ?? tryPath(mvRow?.page_path);
    if (inferred) return inferred;

    if (agencySlug) {
      const { data: legacy } = await supabase
        .from("canonical_replay_state")
        .select("state_slug")
        .eq("agency_slug", agencySlug)
        .not("state_slug", "is", null)
        .order("updated_at", { ascending: false })
        .limit(1)
        .maybeSingle();
      if (legacy?.state_slug) return legacy.state_slug as string;
    }
  } catch (err) {
    console.error("[resolve-agency-context] recoverStateSlugForAgency error", err);
  }
  return null;
}

async function fetchListings(
  supabase: ReturnType<typeof createClient>,
  agencyId: string,
  stateHint: string | null,
): Promise<ListingRow[]> {
  const { data: listings } = await supabase
    .from("agency_listings_index")
    .select("state_slug, section, rank, other_position, page_path, agency_domain")
    .eq("agency_id", agencyId)
    .eq("is_visible", true)
    .order("section", { ascending: true })
    .order("rank", { ascending: true, nullsLast: true });

  if (listings && listings.length > 0) return listings;

  const { data: srcListings } = await supabase
    .from("agency_listings_search_sources")
    .select("state_slug, section, rank, other_position, page_path, agency_domain")
    .eq("agency_id", agencyId)
    .order("section", { ascending: true })
    .order("rank", { ascending: true, nullsLast: true });

  if (srcListings && srcListings.length > 0) return srcListings;

  const { data: mvListings } = await supabase
    .from("public_agency_search_mv")
    .select("state_slug, section, rank, page_path, agency_domain")
    .eq("source_agency_id", agencyId)
    .order("section", { ascending: true })
    .order("rank", { ascending: true, nullsLast: true });

  if (mvListings && mvListings.length > 0) {
    return mvListings.map((l: Record<string, unknown>) => ({
      state_slug: l.state_slug as string,
      section: l.section as string,
      rank: l.rank as number | null,
      other_position: null,
      page_path: l.page_path as string,
      agency_domain: l.agency_domain as string | null,
    }));
  }

  // Final fallback: derive state exclusively from agency-scoped sources.
  const { data: otherRow } = await supabase
    .from("other_agencies")
    .select("state_slug, website_domain_normalized")
    .eq("id", agencyId)
    .eq("is_active", true)
    .maybeSingle();

  const recovered = await recoverStateSlugForAgency(supabase, agencyId, null);
  const syntheticState = otherRow?.state_slug || recovered || "";
  if (syntheticState) {
    return [
      {
        state_slug: syntheticState,
        section: "other",
        rank: null,
        other_position: null,
        page_path: `/marketing-agencies-in-${syntheticState}-united-states/`,
        agency_domain: otherRow?.website_domain_normalized ?? null,
      },
    ];
  }

  // stateHint is accepted only as a last resort when every agency-scoped source is empty.
  if (stateHint) {
    return [
      {
        state_slug: stateHint,
        section: "other",
        rank: null,
        other_position: null,
        page_path: `/marketing-agencies-in-${stateHint}-united-states/`,
        agency_domain: otherRow?.website_domain_normalized ?? null,
      },
    ];
  }

  return [];
}

interface OverrideEntry {
  service: string | null;
  budget: string | null;
  timeline: string | null;
  location: string | null;
  maskedIp: string | null;
  device: string | null;
  absoluteMs: number;
}

interface KpiResult {
  missedCount: number | null;
  baseGeneratedCount: number | null;
  anchorMs: number | null;
  baseAnchorMs: number | null;
  overrideEntries: OverrideEntry[];
  priorityOverrideActive: boolean;
  priorityOverrideUntilMs: number | null;
}

async function resolveKpi(
  supabase: ReturnType<typeof createClient>,
  agencySlug: string,
  agencyId: string,
  stateSlug: string,
): Promise<KpiResult> {
  const NULL_KPI: KpiResult = { missedCount: null, baseGeneratedCount: null, anchorMs: null, baseAnchorMs: null, overrideEntries: [], priorityOverrideActive: false, priorityOverrideUntilMs: null };
  try {
    if (!agencySlug) return NULL_KPI;

    const thirtyDaysAgoIso = new Date(Date.now() - 30 * 24 * 3600_000).toISOString();

    // Fetch override entries filtered to last-30-days at the DB level
    const { data: overrideRows } = await supabase
      .from("canonical_request_overrides")
      .select("service, budget, timeline, location, masked_ip, device, request_at")
      .eq("agency_id", agencyId)
      .eq("state_slug", stateSlug)
      .gte("request_at", thirtyDaysAgoIso)
      .order("request_at", { ascending: false })
      .limit(50);

    const overrideEntries: OverrideEntry[] = (overrideRows ?? []).map((r: any) => ({
      service: r.service ?? null,
      budget: r.budget ?? null,
      timeline: r.timeline ?? null,
      location: r.location ?? null,
      maskedIp: r.masked_ip ?? null,
      device: r.device ?? null,
      absoluteMs: new Date(r.request_at).getTime(),
    }));

    const overrideCountLast30 = overrideEntries.length;
    const newestOverrideMs = overrideEntries.length > 0 ? overrideEntries[0].absoluteMs : 0;

    let storedBaseMs: number | null = null;
    let storedBaseCount: number | null = null;

    if (agencyId) {
      const { data: compositeRow } = await supabase
        .from("canonical_replay_state")
        .select("most_recent_request_ms, missed_requests_last_30_days, base_generated_anchor_ms")
        .eq("agency_id", agencyId)
        .eq("state_slug", stateSlug)
        .maybeSingle();
      if (compositeRow) {
        storedBaseMs = (compositeRow as any).base_generated_anchor_ms ?? null;
        storedBaseCount = (compositeRow as any).missed_requests_last_30_days ?? null;
      }
    }

    if (storedBaseMs === null) {
      const { data: legacyRow } = await supabase
        .from("canonical_replay_state")
        .select("most_recent_request_ms, missed_requests_last_30_days, base_generated_anchor_ms")
        .eq("agency_slug", agencySlug)
        .maybeSingle();
      if (legacyRow) {
        storedBaseMs = (legacyRow as any).base_generated_anchor_ms ?? null;
        storedBaseCount = (legacyRow as any).missed_requests_last_30_days ?? null;
      }
    }

    const { count: realCount } = await supabase
      .from("agency_availability_requests")
      .select("id", { count: "exact", head: true })
      .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
      .eq("is_demo", false)
      .is("deleted_at", null)
      .gte("created_at", thirtyDaysAgoIso);

    const real = realCount ?? 0;

    // Fetch newest real request timestamp for rotation input
    let realMostRecentMs: number | null = null;
    if (real > 0) {
      const { data: latestRequest } = await supabase
        .from("agency_availability_requests")
        .select("created_at")
        .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
        .eq("is_demo", false)
        .is("deleted_at", null)
        .order("created_at", { ascending: false })
        .limit(1)
        .maybeSingle();
      if (latestRequest?.created_at) {
        realMostRecentMs = new Date(latestRequest.created_at).getTime();
      }
    }

    const rotated = computeRotatedBase(
      agencyId,
      agencySlug,
      stateSlug,
      real,
      realMostRecentMs,
      storedBaseMs,
      storedBaseCount,
    );

    if (rotated.baseWasSeeded || rotated.baseWasRotated) {
      persistRotatedBase(supabase, agencyId, agencySlug, stateSlug, rotated).catch(() => {});
    }

    const baseGeneratedMs = rotated.baseGeneratedMs;
    const baseCount = rotated.baseCount;
    const priority = pickCurrentMostRecentMs(
      baseGeneratedMs,
      newestOverrideMs > 0 ? newestOverrideMs : null,
      seedFor(agencyId, agencySlug, stateSlug),
    );
    const displayAnchorMs = priority.currentMs;
    const totalCount = baseCount + overrideCountLast30;

    return {
      missedCount: totalCount,
      baseGeneratedCount: baseCount,
      anchorMs: displayAnchorMs,
      baseAnchorMs: baseGeneratedMs,
      overrideEntries,
      priorityOverrideActive: priority.priorityActive,
      priorityOverrideUntilMs: priority.priorityUntilMs,
    };
  } catch (err) {
    console.error("[resolve-agency-context] kpi error:", err);
    return { missedCount: null, baseGeneratedCount: null, anchorMs: null, baseAnchorMs: null, overrideEntries: [], priorityOverrideActive: false, priorityOverrideUntilMs: null };
  }
}


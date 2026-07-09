import { createClient } from 'npm:@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey',
};

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const url = new URL(req.url);
    let agency_slug: string | null = null;
    let token: string | null = null;
    let agency_id: string | null = null;

    if (req.method === 'POST') {
      const body = await req.json().catch(() => ({}));
      agency_slug = body.agency_slug ?? null;
      token = body.token ?? null;
      agency_id = body.agency_id ?? null;
    } else {
      agency_slug = url.searchParams.get('agency_slug');
      token = url.searchParams.get('token');
      agency_id = url.searchParams.get('agency_id');
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    );

    // UUID detection regex
    const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

    let resolvedAgency: { id: string; name: string; slug: string; domain: string | null } | null = null;

    // Resolve via token
    if (token) {
      const { data: tokenRow } = await supabase
        .from('agency_claim_tokens')
        .select('agency_id, agency_slug, agency_name')
        .eq('token', token)
        .maybeSingle();

      if (tokenRow) {
        resolvedAgency = {
          id: tokenRow.agency_id,
          name: tokenRow.agency_name,
          slug: tokenRow.agency_slug,
          domain: null,
        };
        // Update last_used_at and uses non-blocking
        supabase
          .from('agency_claim_tokens')
          .update({ last_used_at: new Date().toISOString(), uses: supabase.rpc('coalesce_increment', {}) })
          .eq('token', token)
          .then(() => {})
          .catch(() => {});

        // Simpler: just update last_used_at
        await supabase
          .from('agency_claim_tokens')
          .update({ last_used_at: new Date().toISOString() })
          .eq('token', token);
      }
    }

    // Resolve via agency_slug or detect if it's a UUID (legacy support)
    if (!resolvedAgency && agency_slug) {
      // Check if agency_slug is actually a UUID (legacy format)
      if (uuidRegex.test(agency_slug)) {
        // Treat as agency_id instead
        agency_id = agency_slug;
      } else {
        // Normal slug lookup - PRIMARY: try index first
        let { data: row } = await supabase
          .from('agency_listings_index')
          .select('agency_id, agency_name, agency_slug, agency_domain')
          .eq('agency_slug', agency_slug)
          .eq('is_visible', true)
          .limit(1)
          .maybeSingle();

        // FALLBACK 1: if not in index, try canonical sources
        if (!row) {
          const { data: fallbackRow } = await supabase
            .from('agency_listings_search_sources')
            .select('agency_id, agency_name, agency_slug, agency_domain')
            .eq('agency_slug', agency_slug)
            .limit(1)
            .maybeSingle();

          if (fallbackRow) {
            row = fallbackRow;
            console.log('[get-agency-listings] slug resolved via sources fallback:', agency_slug);
          }
        }

        // FALLBACK 2: query the same search MV that powers /your-agency search
        if (!row) {
          const { data: mvRow } = await supabase
            .from('public_agency_search_mv')
            .select('source_agency_id, agency_name, agency_slug, agency_domain')
            .eq('agency_slug', agency_slug)
            .limit(1)
            .maybeSingle();

          if (mvRow) {
            row = {
              agency_id: mvRow.source_agency_id,
              agency_name: mvRow.agency_name,
              agency_slug: mvRow.agency_slug,
              agency_domain: mvRow.agency_domain,
            };
            console.log('[get-agency-listings] slug resolved via search MV fallback:', agency_slug);
          }
        }

        if (row) {
          resolvedAgency = {
            id: row.agency_id,
            name: row.agency_name,
            slug: row.agency_slug,
            domain: row.agency_domain,
          };
        }
      }
    }

    // Resolve via agency_id
    if (!resolvedAgency && agency_id) {
      let { data: row } = await supabase
        .from('agency_listings_index')
        .select('agency_id, agency_name, agency_slug, agency_domain')
        .eq('agency_id', agency_id)
        .eq('is_visible', true)
        .limit(1)
        .maybeSingle();

      // FALLBACK 1: if not in index, try canonical sources
      if (!row) {
        const { data: fallbackRow } = await supabase
          .from('agency_listings_search_sources')
          .select('agency_id, agency_name, agency_slug, agency_domain')
          .eq('agency_id', agency_id)
          .limit(1)
          .maybeSingle();

        if (fallbackRow) {
          row = fallbackRow;
          console.log('[get-agency-listings] id resolved via sources fallback:', agency_id);
        }
      }

      // FALLBACK 2: query the same search MV that powers /your-agency search
      if (!row) {
        const { data: mvRow } = await supabase
          .from('public_agency_search_mv')
          .select('source_agency_id, agency_name, agency_slug, agency_domain')
          .eq('source_agency_id', agency_id)
          .limit(1)
          .maybeSingle();

        if (mvRow) {
          row = {
            agency_id: mvRow.source_agency_id,
            agency_name: mvRow.agency_name,
            agency_slug: mvRow.agency_slug,
            agency_domain: mvRow.agency_domain,
          };
          console.log('[get-agency-listings] id resolved via search MV fallback:', agency_id);
        }
      }

      if (row) {
        resolvedAgency = {
          id: row.agency_id,
          name: row.agency_name,
          slug: row.agency_slug,
          domain: row.agency_domain,
        };
      }
    }

    if (!resolvedAgency) {
      return new Response(JSON.stringify({ ok: false, error: 'Agency not found' }), {
        status: 404,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    // Check listing_management_status from other_agencies (null-safe; won't break top25-only agencies)
    const { data: mgmtRow } = await supabase
      .from('other_agencies')
      .select('listing_management_status')
      .eq('id', resolvedAgency.id)
      .maybeSingle();
    const listingManagementStatus: string | null = mgmtRow?.listing_management_status ?? null;

    // Fetch all listings for this agency - PRIMARY: from index
    let { data: listings, error: listingsError } = await supabase
      .from('agency_listings_index')
      .select('state_slug, section, rank, other_position, page_path, agency_domain')
      .eq('agency_id', resolvedAgency.id)
      .eq('is_visible', true)
      .order('section', { ascending: true })
      .order('rank', { ascending: true, nullsLast: true });

    if (listingsError) throw listingsError;

    // FALLBACK 1: if no listings in index, try canonical sources
    if (!listings || listings.length === 0) {
      const { data: fallbackListings, error: fallbackError } = await supabase
        .from('agency_listings_search_sources')
        .select('state_slug, section, rank, other_position, page_path, agency_domain')
        .eq('agency_id', resolvedAgency.id)
        .order('section', { ascending: true })
        .order('rank', { ascending: true, nullsLast: true });

      if (fallbackError) {
        console.warn('[get-agency-listings] fallback listings error:', fallbackError);
      } else if (fallbackListings && fallbackListings.length > 0) {
        listings = fallbackListings;
        console.log('[get-agency-listings] listings resolved via sources fallback for agency:', resolvedAgency.id);
      }
    }

    // FALLBACK 2: query search MV directly — same source as search
    if (!listings || listings.length === 0) {
      const { data: mvListings } = await supabase
        .from('public_agency_search_mv')
        .select('state_slug, section, rank, page_path, agency_domain')
        .eq('source_agency_id', resolvedAgency.id)
        .order('section', { ascending: true })
        .order('rank', { ascending: true, nullsLast: true });

      if (mvListings && mvListings.length > 0) {
        listings = mvListings.map(l => ({
          state_slug: l.state_slug,
          section: l.section,
          rank: l.rank,
          other_position: null,
          page_path: l.page_path,
          agency_domain: l.agency_domain,
        }));
        console.log('[get-agency-listings] listings resolved via search MV fallback for agency:', resolvedAgency.id);
      }
    }

    // If domain not set on agency, pull from first listing that has it
    if (!resolvedAgency.domain && listings) {
      const withDomain = listings.find(l => l.agency_domain);
      if (withDomain) resolvedAgency.domain = withDomain.agency_domain;
    }

    // Compute best_listing: prefer top25 with lowest rank, else first other
    let best_listing = null;
    if (listings && listings.length > 0) {
      const top25 = listings.filter(l => l.section === 'top25').sort((a, b) => (a.rank ?? 99) - (b.rank ?? 99));
      if (top25.length > 0) {
        best_listing = top25[0];
      } else {
        best_listing = listings[0];
      }
    }

    return new Response(JSON.stringify({
      ok: true,
      agency: { ...resolvedAgency, listing_management_status: listingManagementStatus },
      listings: listings ?? [],
      best_listing,
    }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  } catch (err) {
    console.error('[get-agency-listings]', err);
    return new Response(JSON.stringify({ ok: false, error: 'Internal error' }), {
      status: 500,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  }
});

/**
 * Lead Funnel State List
 *
 * Admin endpoint to list lead funnel states with filtering.
 * Used by Smart Follow-up Routing section in wp-admin/analytics/agency-funnel
 */

import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';
import { verifyAdminSession } from '../_shared/adminSession.ts';
import { paginate } from '../_shared/paginate.ts';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey, X-Admin-Token',
};

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
    const supabaseKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
    const supabase = createClient(supabaseUrl, supabaseKey);

    // Verify admin session
    const authResult = await verifyAdminSession(req, supabase);
    if (!authResult.authorized) {
      return new Response(
        JSON.stringify({ error: authResult.error || 'Unauthorized' }),
        {
          status: 401,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    const url = new URL(req.url);

    // Filter parameters (support both frontend and backend conventions)
    const stateSlug = url.searchParams.get('state_slug');
    const agencySearch = url.searchParams.get('agency_search') || url.searchParams.get('agency_id');
    const campaignName = url.searchParams.get('campaign_name') || url.searchParams.get('campaign_id');
    const sequenceName = url.searchParams.get('sequence_name');
    const bestNextStep = url.searchParams.get('best_next_step');
    const hasStandardPaid = url.searchParams.get('has_standard_paid');
    const isUpgradeEligible = url.searchParams.get('is_top25_upgrade_eligible');
    const hasManualOverride = url.searchParams.get('has_manual_override');
    const activityWindowHours = url.searchParams.get('activity_window_hours');

    // Pagination
    const page = parseInt(url.searchParams.get('page') || '1');
    const limit = Math.min(parseInt(url.searchParams.get('limit') || '50'), 100);

    // Build query
    let query = supabase
      .from('lead_funnel_state')
      .select('*', { count: 'exact' });

    if (stateSlug) {
      query = query.eq('state_slug', stateSlug);
    }
    if (agencySearch) {
      // Support search by agency_id, agency_slug, OR agency name
      // First, find agencies matching the search term by name
      const { data: matchingAgencies } = await supabase
        .from('other_agencies')
        .select('id')
        .or(`id.eq.${agencySearch},slug.ilike.%${agencySearch}%,name.ilike.%${agencySearch}%`)
        .limit(100);

      const matchingIds = matchingAgencies?.map(a => a.id) || [];

      if (matchingIds.length > 0) {
        // Filter by matching agency IDs
        query = query.in('agency_id', matchingIds);
      } else {
        // No matches found - return empty result set
        query = query.eq('agency_id', 'no-match-found');
      }
    }
    if (campaignName) {
      query = query.ilike('campaign_name', `%${campaignName}%`);
    }
    if (sequenceName) {
      query = query.ilike('sequence_name', `%${sequenceName}%`);
    }
    if (bestNextStep) {
      query = query.eq('best_next_step', bestNextStep);
    }
    if (hasStandardPaid === 'true') {
      query = query.eq('has_standard_paid', true);
    } else if (hasStandardPaid === 'false') {
      query = query.eq('has_standard_paid', false);
    }
    if (isUpgradeEligible === 'true') {
      query = query.eq('is_top25_upgrade_eligible', true);
    } else if (isUpgradeEligible === 'false') {
      query = query.eq('is_top25_upgrade_eligible', false);
    }
    if (activityWindowHours) {
      const hours = parseInt(activityWindowHours);
      const cutoff = new Date(Date.now() - hours * 60 * 60 * 1000).toISOString();
      query = query.gte('last_activity_at', cutoff);
    }

    // Apply order
    query = query.order('last_activity_at', { ascending: false });

    // When has_manual_override filter is used, we need to fetch more results to apply filtering correctly
    // Otherwise, we can paginate at the database level
    let states: any[];
    let totalCount: number;

    if (hasManualOverride) {
      // Fetch all matching states (up to 1000) to apply override filtering accurately
      const { data: allStates, error: statesError } = await query.limit(1000);

      if (statesError) {
        console.error('[lead-funnel-state-list] Error:', statesError);
        return new Response(
          JSON.stringify({ error: 'Failed to fetch states' }),
          {
            status: 500,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
          }
        );
      }

      // Fetch all overrides for these states
      const stateIds = allStates?.map(s => ({ agency_id: s.agency_id, lead_key: s.lead_key })) || [];
      let overridesMap: Map<string, any> = new Map();

      if (stateIds.length > 0) {
        const orConditions = stateIds.map(id =>
          `and(agency_id.eq.${id.agency_id},lead_key.eq.${id.lead_key})`
        ).join(',');

        const { data: overrideData } = await supabase
          .from('lead_routing_overrides')
          .select('*')
          .or(orConditions);

        overrideData?.forEach(override => {
          const key = `${override.agency_id}:${override.lead_key}`;
          overridesMap.set(key, override);
        });
      }

      // Filter by override status BEFORE pagination
      const filteredByOverride = allStates?.filter(state => {
        const overrideKey = `${state.agency_id}:${state.lead_key}`;
        const hasOverride = overridesMap.has(overrideKey);

        if (hasManualOverride === 'true') {
          return hasOverride;
        } else if (hasManualOverride === 'false') {
          return !hasOverride;
        }
        return true;
      }) || [];

      totalCount = filteredByOverride.length;

      // Apply pagination AFTER filtering
      const { from, to } = paginate(page, limit);
      states = filteredByOverride.slice(from, to + 1);
    } else {
      // No override filter - use efficient database pagination
      const { from, to } = paginate(page, limit);
      query = query.range(from, to);

      const { data: paginatedStates, error: statesError, count } = await query;

      if (statesError) {
        console.error('[lead-funnel-state-list] Error:', statesError);
        return new Response(
          JSON.stringify({ error: 'Failed to fetch states' }),
          {
            status: 500,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
          }
        );
      }

      states = paginatedStates || [];
      totalCount = count || 0;
    }

    // Fetch overrides for displayed states
    const stateIds = states?.map(s => ({ agency_id: s.agency_id, lead_key: s.lead_key })) || [];

    let overridesMap: Map<string, any> = new Map();
    if (stateIds.length > 0) {
      const orConditions = stateIds.map(id =>
        `and(agency_id.eq.${id.agency_id},lead_key.eq.${id.lead_key})`
      ).join(',');

      const { data: overrideData } = await supabase
        .from('lead_routing_overrides')
        .select('*')
        .or(orConditions);

      overrideData?.forEach(override => {
        const key = `${override.agency_id}:${override.lead_key}`;
        overridesMap.set(key, override);
      });
    }

    // Enrich agency_name from other_agencies table
    const agencyIds = [...new Set(states?.map(s => s.agency_id) || [])];
    let agencyNamesMap: Map<string, string> = new Map();

    if (agencyIds.length > 0) {
      const { data: agencies } = await supabase
        .from('other_agencies')
        .select('id, name')
        .in('id', agencyIds);

      agencies?.forEach(agency => {
        if (agency.name) {
          agencyNamesMap.set(agency.id, agency.name);
        }
      });
    }

    // Merge overrides and agency_name into states (table-ready rows)
    const mergedStates = states?.map(state => {
      const overrideKey = `${state.agency_id}:${state.lead_key}`;
      const override = overridesMap.get(overrideKey);
      const agencyName = agencyNamesMap.get(state.agency_id) || null;

      return {
        ...state,
        agency_name: agencyName,
        has_manual_override: !!override,
        override_step: override?.override_step || null,
        override_reason: override?.override_reason || null,
        override_expires_at: override?.expires_at || null,
        override_set_by: override?.set_by_admin_email || null,
      };
    }) || [];

    // Final result is already filtered and paginated
    const filteredStates = mergedStates;

    // Compute global statistics (unfiltered) by best_next_step
    const { data: globalStats } = await supabase
      .from('lead_funnel_state')
      .select('best_next_step');

    const globalStatsByStep: Record<string, number> = {};
    globalStats?.forEach(s => {
      globalStatsByStep[s.best_next_step] = (globalStatsByStep[s.best_next_step] || 0) + 1;
    });

    // Compute filtered statistics based on ALL filtered results (not just current page)
    // We need to re-run the query without pagination to get accurate totals
    let statsQuery = supabase
      .from('lead_funnel_state')
      .select('best_next_step');

    // Apply same filters as main query
    if (stateSlug) {
      statsQuery = statsQuery.eq('state_slug', stateSlug);
    }
    if (agencySearch) {
      const { data: matchingAgencies } = await supabase
        .from('other_agencies')
        .select('id')
        .or(`id.eq.${agencySearch},slug.ilike.%${agencySearch}%,name.ilike.%${agencySearch}%`)
        .limit(100);

      const matchingIds = matchingAgencies?.map(a => a.id) || [];

      if (matchingIds.length > 0) {
        statsQuery = statsQuery.in('agency_id', matchingIds);
      } else {
        statsQuery = statsQuery.eq('agency_id', 'no-match-found');
      }
    }
    if (campaignName) {
      statsQuery = statsQuery.ilike('campaign_name', `%${campaignName}%`);
    }
    if (sequenceName) {
      statsQuery = statsQuery.ilike('sequence_name', `%${sequenceName}%`);
    }
    if (bestNextStep) {
      statsQuery = statsQuery.eq('best_next_step', bestNextStep);
    }
    if (hasStandardPaid === 'true') {
      statsQuery = statsQuery.eq('has_standard_paid', true);
    } else if (hasStandardPaid === 'false') {
      statsQuery = statsQuery.eq('has_standard_paid', false);
    }
    if (isUpgradeEligible === 'true') {
      statsQuery = statsQuery.eq('is_top25_upgrade_eligible', true);
    } else if (isUpgradeEligible === 'false') {
      statsQuery = statsQuery.eq('is_top25_upgrade_eligible', false);
    }
    if (activityWindowHours) {
      const hours = parseInt(activityWindowHours);
      const cutoff = new Date(Date.now() - hours * 60 * 60 * 1000).toISOString();
      statsQuery = statsQuery.gte('last_activity_at', cutoff);
    }

    // Fetch all filtered results for accurate stats
    const { data: allFilteredStates } = await statsQuery;

    // Apply override filter if needed (since it can't be done at DB level)
    let finalFilteredStatesForStats = allFilteredStates || [];
    if (hasManualOverride && allFilteredStates) {
      const stateIdsForOverride = allFilteredStates.map(s => ({ agency_id: s.agency_id, lead_key: s.lead_key }));
      let overridesMapForStats: Map<string, any> = new Map();

      if (stateIdsForOverride.length > 0) {
        const orConditions = stateIdsForOverride.map(id =>
          `and(agency_id.eq.${id.agency_id},lead_key.eq.${id.lead_key})`
        ).join(',');

        const { data: overrideDataForStats } = await supabase
          .from('lead_routing_overrides')
          .select('agency_id, lead_key')
          .or(orConditions);

        overrideDataForStats?.forEach(override => {
          const key = `${override.agency_id}:${override.lead_key}`;
          overridesMapForStats.set(key, override);
        });
      }

      finalFilteredStatesForStats = allFilteredStates.filter(state => {
        const overrideKey = `${state.agency_id}:${state.lead_key}`;
        const hasOverride = overridesMapForStats.has(overrideKey);

        if (hasManualOverride === 'true') {
          return hasOverride;
        } else if (hasManualOverride === 'false') {
          return !hasOverride;
        }
        return true;
      });
    }

    const filteredStatsByStep: Record<string, number> = {};
    finalFilteredStatesForStats.forEach(s => {
      filteredStatsByStep[s.best_next_step] = (filteredStatsByStep[s.best_next_step] || 0) + 1;
    });

    return new Response(
      JSON.stringify({
        ok: true,
        states: filteredStates,
        stats: filteredStatsByStep,
        global_stats: globalStatsByStep,
        pagination: {
          page,
          limit,
          total: totalCount,
          pages: Math.ceil(totalCount / limit),
        },
      }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );

  } catch (err) {
    console.error('[lead-funnel-state-list] Error:', err);
    return new Response(
      JSON.stringify({ error: 'Internal server error' }),
      {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );
  }
});

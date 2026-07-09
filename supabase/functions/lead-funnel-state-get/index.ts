/**
 * Lead Funnel State Get
 *
 * Admin endpoint to retrieve a single lead's funnel state.
 * Used by SmartRoutingPanel in wp-admin/email/agency-lookup
 */

import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';
import { verifyAdminSession } from '../_shared/adminSession.ts';
import { buildSmartLink } from '../_shared/leadIdentity.ts';

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
    const agencyId = url.searchParams.get('agency_id');
    const leadKey = url.searchParams.get('lead_key');

    if (!agencyId || !leadKey) {
      return new Response(
        JSON.stringify({ error: 'Missing agency_id or lead_key' }),
        {
          status: 400,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    // Fetch lead funnel state
    const { data: state, error: stateError } = await supabase
      .from('lead_funnel_state')
      .select('*')
      .eq('agency_id', agencyId)
      .eq('lead_key', leadKey)
      .maybeSingle();

    if (stateError) {
      console.error('[lead-funnel-state-get] Error:', stateError);
      return new Response(
        JSON.stringify({ error: 'Failed to fetch state' }),
        {
          status: 500,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    // Check for active override
    const { data: override } = await supabase
      .from('lead_routing_overrides')
      .select('*')
      .eq('agency_id', agencyId)
      .eq('lead_key', leadKey)
      .maybeSingle();

    // Build signed smart link using leadIdentity.ts
    const baseUrl = Deno.env.get('VITE_APP_URL') || 'https://gappsy.com';
    const smartNextUrl = state && state.agency_slug
      ? buildSmartLink(baseUrl, state.agency_slug, {
          agency_id: agencyId,
          lead_key: leadKey,
          campaign_id: state.campaign_id || undefined,
          campaign_name: state.campaign_name || undefined,
          sequence_name: state.sequence_name || undefined,
        })
      : null;

    return new Response(
      JSON.stringify({
        ok: true,
        state,
        override,
        smart_next_url: smartNextUrl,
      }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );

  } catch (err) {
    console.error('[lead-funnel-state-get] Error:', err);
    return new Response(
      JSON.stringify({ error: 'Internal server error' }),
      {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );
  }
});

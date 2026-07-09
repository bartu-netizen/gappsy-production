/**
 * Smart Routing Track Event
 *
 * Public endpoint to track downstream funnel events for smart routing.
 * Updates lead_funnel_state based on event type.
 */

import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey',
};

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
  const supabaseKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
  const supabase = createClient(supabaseUrl, supabaseKey);

  try {
    const body = await req.json();
    const { agency_id, lead_key, event_type, metadata } = body;

    if (!agency_id || !lead_key || !event_type) {
      return new Response(
        JSON.stringify({ error: 'Missing required fields' }),
        {
          status: 400,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    // Fetch existing state
    const { data: state, error: stateError } = await supabase
      .from('lead_funnel_state')
      .select('*')
      .eq('agency_id', agency_id)
      .eq('lead_key', lead_key)
      .maybeSingle();

    if (stateError || !state) {
      console.warn('[smart-routing-track-event] State not found or error:', stateError);
      return new Response(
        JSON.stringify({ ok: true, message: 'State not found, event ignored' }),
        {
          status: 200,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    // Determine update based on event type
    const updates: Record<string, any> = {
      last_activity_at: new Date().toISOString(),
    };

    switch (event_type) {
      case 'your_agency_qualified_view':
        updates.your_agency_qualified_views_count = state.your_agency_qualified_views_count + 1;
        updates.intent_score = Math.min(state.intent_score + 10, 100);
        break;

      case 'owner_loss_step_viewed':
        updates.has_seen_loss_step = true;
        updates.intent_score = Math.min(state.intent_score + 15, 100);
        break;

      case 'offer_page_viewed':
        updates.has_seen_offer_page = true;
        updates.intent_score = Math.min(state.intent_score + 20, 100);
        break;

      case 'checkout_resume_viewed':
        updates.has_started_checkout = true;
        updates.intent_score = Math.min(state.intent_score + 25, 100);
        break;

      case 'discount_checkout_viewed':
        updates.has_started_checkout = true;
        updates.intent_score = Math.min(state.intent_score + 30, 100);
        break;

      case 'top25_upgrade_offer_viewed':
        updates.has_seen_offer_page = true;
        updates.intent_score = Math.min(state.intent_score + 25, 100);
        break;

      case 'payment_completed_from_smart_route':
        updates.has_completed_payment = true;
        updates.has_standard_paid = true;
        updates.intent_score = 100;
        break;

      default:
        console.warn('[smart-routing-track-event] Unknown event type:', event_type);
    }

    // Update state
    const { error: updateError } = await supabase
      .from('lead_funnel_state')
      .update(updates)
      .eq('id', state.id);

    if (updateError) {
      console.error('[smart-routing-track-event] Update error:', updateError);
      return new Response(
        JSON.stringify({ error: 'Failed to update state' }),
        {
          status: 500,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    // Log event to tracking table (optional, for analytics)
    await supabase
      .from('smartlead_link_events')
      .insert({
        agency_id,
        lead_key,
        event_type: `smart_routing:${event_type}`,
        metadata,
        created_at: new Date().toISOString(),
      });

    return new Response(
      JSON.stringify({
        ok: true,
        event_type,
        updates_applied: Object.keys(updates),
      }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );

  } catch (err) {
    console.error('[smart-routing-track-event] Error:', err);
    return new Response(
      JSON.stringify({ error: 'Internal server error' }),
      {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );
  }
});

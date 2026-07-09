import { createClient } from 'npm:@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey',
};

const ALLOWED_EVENTS = new Set([
  'your_agency_page_view',
  'your_agency_search',
  'your_agency_select',
  'your_agency_result_view',
  'your_agency_view_listing_click',
  'your_agency_token_open',
  'state_page_highlight_shown',
]);

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ ok: false, error: 'Method not allowed' }), {
      status: 405,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  }

  try {
    const body = await req.json().catch(() => ({}));
    const { event_name, agency_id, agency_slug, state_slug, section, token, meta } = body;

    if (!event_name || !ALLOWED_EVENTS.has(event_name)) {
      return new Response(JSON.stringify({ ok: false, error: 'Invalid event_name' }), {
        status: 400,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    );

    await supabase.from('your_agency_funnel_events').insert({
      event_name,
      agency_id: agency_id ?? null,
      agency_slug: agency_slug ?? null,
      state_slug: state_slug ?? null,
      section: section ?? null,
      token: token ?? null,
      meta: meta ?? {},
    });

    return new Response(JSON.stringify({ ok: true }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  } catch (err) {
    console.error('[track-your-agency-event]', err);
    return new Response(JSON.stringify({ ok: false, error: 'Internal error' }), {
      status: 500,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  }
});

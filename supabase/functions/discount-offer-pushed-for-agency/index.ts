import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'npm:@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey',
};

const ALLOWED_DISCOUNT_PERCENTS = [15, 20, 25];

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const url = new URL(req.url);
    const agencyId = url.searchParams.get('agency_id');
    const stateSlug = url.searchParams.get('state_slug') || null;

    if (!agencyId) {
      return new Response(
        JSON.stringify({ valid: false, reason: 'missing_agency_id' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const now = new Date().toISOString();

    // Fetch active pushed offers for this agency, most recent first
    const { data: offers, error } = await supabase
      .from('discount_offers')
      .select(
        'id, token, agency_id, agency_slug, state_slug, discount_type, discount_value, ' +
        'allowed_products, expires_at, max_uses, usage_count, is_active, created_by, ' +
        'intent_score_at_creation, push_enabled, scope_type, scope_expires_at'
      )
      .eq('agency_id', agencyId)
      .eq('push_enabled', true)
      .eq('is_active', true)
      .or(`expires_at.is.null,expires_at.gt.${now}`)
      .or(`scope_expires_at.is.null,scope_expires_at.gt.${now}`)
      .order('created_at', { ascending: false })
      .limit(5);

    if (error || !offers || offers.length === 0) {
      return new Response(
        JSON.stringify({ valid: false, reason: 'no_pushed_offer' }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Find first offer that passes all guards
    for (const offer of offers) {
      // max_uses check
      if (offer.max_uses !== null && offer.usage_count >= offer.max_uses) continue;

      // discount_percent must be 15, 20, or 25
      if (offer.discount_type === 'percentage') {
        const pct = Math.round(Number(offer.discount_value));
        if (!ALLOWED_DISCOUNT_PERCENTS.includes(pct)) continue;
      }

      // Strict state_slug match:
      // If caller provides state_slug, offer must match that exact state.
      // Offers with null state_slug do NOT match state-specific funnel traffic.
      if (stateSlug) {
        if (offer.state_slug !== stateSlug) continue;
      } else {
        // No state_slug provided — only match offers with null state_slug
        if (offer.state_slug) continue;
      }

      // Valid offer found — enrich with agency context
      let agency_name: string | null = null;
      let state_name: string | null = null;
      let agency_website: string | null = null;
      let agency_description: string | null = null;

      try {
        const { data: oa } = await supabase
          .from('other_agencies')
          .select('name, state_name, website_url, short_description, description')
          .eq('id', agencyId)
          .maybeSingle();
        if (oa) {
          agency_name = oa.name ?? null;
          state_name = oa.state_name ?? null;
          agency_website = oa.website_url ?? null;
          agency_description = (oa.short_description ?? oa.description) ?? null;
        }
      } catch (_) { /* non-fatal */ }

      return new Response(
        JSON.stringify({
          valid: true,
          token: offer.token,
          offer: {
            id: offer.id,
            token: offer.token,
            agency_id: offer.agency_id,
            agency_slug: offer.agency_slug,
            agency_name,
            state_slug: offer.state_slug,
            state_name,
            agency_website,
            agency_description,
            discount_type: offer.discount_type,
            discount_value: offer.discount_value,
            allowed_products: offer.allowed_products,
            uses_remaining: offer.max_uses !== null ? offer.max_uses - offer.usage_count : null,
            created_by: offer.created_by || null,
            intent_score_at_creation: offer.intent_score_at_creation ?? null,
            push_enabled: true,
            scope_type: offer.scope_type ?? null,
            scope_expires_at: offer.scope_expires_at ?? null,
            expires_at: offer.expires_at ?? null,
          },
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    return new Response(
      JSON.stringify({ valid: false, reason: 'no_valid_pushed_offer' }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  } catch (err) {
    console.error('[discount-offer-pushed-for-agency] Error:', err);
    return new Response(
      JSON.stringify({ valid: false, reason: 'server_error' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});

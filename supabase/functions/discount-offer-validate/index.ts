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
    const token = url.searchParams.get('token');

    // Optional context for agency-scoped validation
    const resolvedAgencyId = url.searchParams.get('agency_id') || null;
    const resolvedStateSlug = url.searchParams.get('state_slug') || null;
    // strict_context=true: missing context for scoped offers is a hard failure
    const strictContext = url.searchParams.get('strict_context') === 'true';

    if (!token) {
      return new Response(
        JSON.stringify({ valid: false, active: false, reason: 'missing_token' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const { data: offer, error } = await supabase
      .from('discount_offers')
      .select(
        'id, token, agency_id, agency_slug, state_slug, discount_type, discount_value, ' +
        'allowed_products, expires_at, max_uses, usage_count, is_active, created_by, ' +
        'intent_score_at_creation, push_enabled, scope_type, scope_expires_at'
      )
      .eq('token', token)
      .maybeSingle();

    if (error || !offer) {
      return new Response(
        JSON.stringify({ valid: false, active: false, reason: 'not_found' }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // --- Hard validation checks ---

    if (!offer.is_active) {
      return new Response(
        JSON.stringify({ valid: false, active: false, reason: 'inactive', token }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // discount_percent must be exactly 15, 20, or 25 (percentage type only)
    if (offer.discount_type === 'percentage') {
      const pct = Math.round(Number(offer.discount_value));
      if (!ALLOWED_DISCOUNT_PERCENTS.includes(pct)) {
        return new Response(
          JSON.stringify({ valid: false, active: false, reason: 'invalid_discount_percent', token }),
          { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
      }
    }

    // expires_at check
    if (offer.expires_at && new Date(offer.expires_at) <= new Date()) {
      return new Response(
        JSON.stringify({ valid: false, active: false, reason: 'expired', token }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // max_uses check
    if (offer.max_uses !== null && offer.usage_count >= offer.max_uses) {
      return new Response(
        JSON.stringify({ valid: false, active: false, reason: 'max_uses_reached', token }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // scope_expires_at check (separate from expires_at — controls push/session carryover window)
    if (offer.scope_expires_at && new Date(offer.scope_expires_at) <= new Date()) {
      // scope is expired; direct link still valid if no hard expires_at failed above,
      // but we mark scope_valid=false so caller can decide
      // We do NOT reject the offer here — only flag it
    }
    const scopeValid = !offer.scope_expires_at || new Date(offer.scope_expires_at) > new Date();

    // Agency-scope matching
    if (offer.agency_id) {
      if (!resolvedAgencyId) {
        // strict_context: missing context is a hard failure
        if (strictContext) {
          return new Response(
            JSON.stringify({ valid: false, active: false, reason: 'agency_context_missing', token }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
        // non-strict: allow — OfferRedirectPage may not have agency context yet
      } else if (offer.agency_id !== resolvedAgencyId) {
        return new Response(
          JSON.stringify({ valid: false, active: false, reason: 'agency_mismatch', token }),
          { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
      }
    }

    // State-slug matching
    if (offer.state_slug) {
      if (!resolvedStateSlug) {
        if (strictContext) {
          return new Response(
            JSON.stringify({ valid: false, active: false, reason: 'state_context_missing', token }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
          );
        }
      } else if (offer.state_slug !== resolvedStateSlug) {
        return new Response(
          JSON.stringify({ valid: false, active: false, reason: 'state_mismatch', token }),
          { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
      }
    }

    // --- Enrich with agency context ---
    let agency_name: string | null = null;
    let state_name: string | null = null;
    let agency_website: string | null = null;
    let agency_description: string | null = null;

    try {
      let oa: Record<string, unknown> | null = null;
      if (offer.agency_id) {
        const { data } = await supabase
          .from('other_agencies')
          .select('name, state_name, state_slug, website_url, description, short_description')
          .eq('id', offer.agency_id)
          .maybeSingle();
        oa = data;
      }
      if (!oa && offer.agency_slug) {
        const { data } = await supabase
          .from('other_agencies')
          .select('name, state_name, state_slug, website_url, description, short_description')
          .eq('slug', offer.agency_slug)
          .maybeSingle();
        oa = data;
      }
      if (oa) {
        agency_name = (oa.name as string) ?? null;
        state_name = (oa.state_name as string) ?? null;
        agency_website = (oa.website_url as string) ?? null;
        agency_description = ((oa.short_description ?? oa.description) as string) ?? null;
      }
    } catch (_) { /* non-fatal enrichment */ }

    return new Response(
      JSON.stringify({
        valid: true,
        active: true,
        scope_valid: scopeValid,
        reason: null,
        token: offer.token,
        discount_percent: offer.discount_type === 'percentage' ? Math.round(Number(offer.discount_value)) : null,
        agency_id: offer.agency_id,
        state_slug: offer.state_slug,
        scope_type: offer.scope_type ?? null,
        push_enabled: offer.push_enabled ?? false,
        expires_at: offer.expires_at,
        scope_expires_at: offer.scope_expires_at ?? null,
        usage_count: offer.usage_count,
        max_uses: offer.max_uses,
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
          push_enabled: offer.push_enabled ?? false,
          scope_type: offer.scope_type ?? null,
          scope_expires_at: offer.scope_expires_at ?? null,
        },
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  } catch (err) {
    console.error('[discount-offer-validate] Unexpected error:', err);
    return new Response(
      JSON.stringify({ valid: false, active: false, reason: 'server_error' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});

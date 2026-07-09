import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'npm:@supabase/supabase-js@2';
import { authenticateAdmin, createAuthErrorResponse } from '../_shared/adminAuth.ts';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token',
};

function generateToken(): string {
  const bytes = new Uint8Array(16);
  crypto.getRandomValues(bytes);
  return Array.from(bytes).map(b => b.toString(16).padStart(2, '0')).join('');
}

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    console.log('[discount-offer-create] x-admin-token present:', !!req.headers.get('x-admin-token'));
    const auth = await authenticateAdmin(req);
    console.log('[discount-offer-create] auth.success:', auth.success, auth.success ? '' : '| error: ' + (auth as any).error);
    if (!auth.success) {
      return createAuthErrorResponse(auth, corsHeaders);
    }

    if (req.method !== 'POST') {
      return new Response(JSON.stringify({ error: 'Method not allowed' }), {
        status: 405,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    const body = await req.json();
    const {
      agency_id,
      agency_slug,
      state_slug,
      discount_type,
      discount_value,
      allowed_products,
      expires_at,
      max_uses,
      created_by,
      internal_note,
      intent_score_at_creation,
    } = body;

    if (!discount_type || !['percentage', 'fixed'].includes(discount_type)) {
      return new Response(
        JSON.stringify({ error: 'discount_type must be "percentage" or "fixed"' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const numericValue = parseFloat(discount_value);
    if (isNaN(numericValue) || numericValue <= 0) {
      return new Response(
        JSON.stringify({ error: 'discount_value must be a positive number' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (discount_type === 'percentage' && numericValue > 100) {
      return new Response(
        JSON.stringify({ error: 'Percentage discount cannot exceed 100' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const numericMaxUses = parseInt(max_uses ?? '1', 10);
    if (isNaN(numericMaxUses) || numericMaxUses < 1) {
      return new Response(
        JSON.stringify({ error: 'max_uses must be at least 1' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const products: string[] = Array.isArray(allowed_products) && allowed_products.length > 0
      ? allowed_products
      : ['all'];

    const token = generateToken();

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const record: Record<string, unknown> = {
      token,
      discount_type,
      discount_value: numericValue,
      allowed_products: products,
      max_uses: numericMaxUses,
      is_active: true,
    };

    if (agency_id) record.agency_id = agency_id;
    if (agency_slug) record.agency_slug = agency_slug;
    if (state_slug) record.state_slug = state_slug;
    if (expires_at) record.expires_at = expires_at;
    if (created_by) record.created_by = created_by;
    if (internal_note) record.internal_note = internal_note;
    if (intent_score_at_creation != null) record.intent_score_at_creation = Math.round(Number(intent_score_at_creation));

    const { data: offer, error: insertError } = await supabase
      .from('discount_offers')
      .insert(record)
      .select('*')
      .single();

    if (insertError || !offer) {
      console.error('[discount-offer-create] Insert error:', insertError);
      return new Response(
        JSON.stringify({ error: 'Failed to create discount offer', details: insertError?.message }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Always return the public /offer/{token} URL. OfferRedirectPage validates
    // the token, enriches it with full agency context (name, state, website,
    // description) via discount-offer-validate, and forwards a fallback-rich
    // URL to /activation/upgrade so "Your Agency" never appears.
    const offerUrl = `/offer/${token}`;
    console.log('[discount-offer-create] generated offerUrl:', offerUrl);

    return new Response(
      JSON.stringify({ ok: true, offer: { ...offer, url: offerUrl } }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  } catch (err) {
    console.error('[discount-offer-create] Unexpected error:', err);
    return new Response(
      JSON.stringify({ error: 'Internal server error', details: err instanceof Error ? err.message : String(err) }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});

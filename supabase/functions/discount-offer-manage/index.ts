import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'npm:@supabase/supabase-js@2';
import { authenticateAdmin, createAuthErrorResponse } from '../_shared/adminAuth.ts';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret',
};

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const auth = await authenticateAdmin(req);
    if (!auth.success) {
      return createAuthErrorResponse(auth, corsHeaders);
    }

    const body = await req.json() as {
      action: 'set_push_enabled' | 'disable_offer';
      offer_id: string;
      push_enabled?: boolean;
      scope_expires_at?: string | null;
    };

    const { action, offer_id } = body;

    if (!action || !offer_id) {
      return new Response(
        JSON.stringify({ ok: false, error: 'missing_params' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    // Verify offer exists
    const { data: existing, error: fetchErr } = await supabase
      .from('discount_offers')
      .select('id, is_active, push_enabled, scope_expires_at, expires_at')
      .eq('id', offer_id)
      .maybeSingle();

    if (fetchErr || !existing) {
      return new Response(
        JSON.stringify({ ok: false, error: 'not_found' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (action === 'set_push_enabled') {
      const enable = body.push_enabled === true;
      const updates: Record<string, unknown> = {
        push_enabled: enable,
        updated_at: new Date().toISOString(),
      };

      if (enable) {
        // Always update scope_expires_at when enabling push.
        // null = unlimited (manual disable required). String = specific expiry.
        // undefined = default 24h.
        const provided = body.scope_expires_at;
        if (provided === null) {
          updates.scope_expires_at = null;
        } else if (provided) {
          updates.scope_expires_at = provided;
        } else {
          updates.scope_expires_at = new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString();
        }
        updates.scope_type = 'agency';
      } else {
        // When disabling push, do NOT clear scope_expires_at or delete token
        // Direct /offer/{token} links still work if is_active=true
        updates.scope_type = null;
      }

      const { data: updated, error: updateErr } = await supabase
        .from('discount_offers')
        .update(updates)
        .eq('id', offer_id)
        .select('id, token, discount_value, is_active, push_enabled, scope_type, scope_expires_at, expires_at, usage_count, max_uses')
        .maybeSingle();

      if (updateErr) {
        return new Response(
          JSON.stringify({ ok: false, error: updateErr.message }),
          { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
      }

      return new Response(
        JSON.stringify({
          ok: true,
          push_enabled: updated?.push_enabled ?? enable,
          scope_type: updated?.scope_type ?? null,
          scope_expires_at: updated?.scope_expires_at ?? null,
          id: updated?.id ?? offer_id,
          token: updated?.token ?? null,
          discount_value: updated?.discount_value ?? null,
          is_active: updated?.is_active ?? true,
          expires_at: updated?.expires_at ?? null,
          usage_count: updated?.usage_count ?? 0,
          max_uses: updated?.max_uses ?? null,
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (action === 'disable_offer') {
      // Sets is_active=false — copied /offer/{token} links stop validating
      const { error: disableErr } = await supabase
        .from('discount_offers')
        .update({ is_active: false, push_enabled: false, updated_at: new Date().toISOString() })
        .eq('id', offer_id);

      if (disableErr) {
        return new Response(
          JSON.stringify({ ok: false, error: disableErr.message }),
          { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
      }

      return new Response(
        JSON.stringify({ ok: true, is_active: false }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    return new Response(
      JSON.stringify({ ok: false, error: 'unknown_action' }),
      { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  } catch (err) {
    console.error('[discount-offer-manage] Error:', err);
    return new Response(
      JSON.stringify({ ok: false, error: 'server_error' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});

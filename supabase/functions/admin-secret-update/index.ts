import { createClient } from 'npm:@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token',
};

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== 'POST') {
    return new Response(
      JSON.stringify({ error: 'METHOD_NOT_ALLOWED', message: 'Only POST is allowed' }),
      { status: 405, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }

  try {
    const supabaseUrl = Deno.env.get('SUPABASE_URL');
    const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');

    if (!supabaseUrl || !supabaseServiceKey) {
      return new Response(
        JSON.stringify({ error: 'SERVER_CONFIG_ERROR', message: 'Missing Supabase configuration' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    // Parse body
    const body = await req.json();
    const { newSecret } = body;

    if (!newSecret || typeof newSecret !== 'string' || newSecret.trim().length === 0) {
      return new Response(
        JSON.stringify({ error: 'INVALID_INPUT', message: 'newSecret is required and must be a non-empty string' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // AUTHENTICATION: Check current secret from admin_secrets table
    const { data: currentSecretData, error: fetchError } = await supabase
      .from('admin_secrets')
      .select('value')
      .eq('key', 'ADMIN_IMPORT_SECRET')
      .eq('is_active', true)
      .maybeSingle();

    if (fetchError) {
      console.error('[admin-secret-update] Error fetching current secret:', fetchError);
      return new Response(
        JSON.stringify({ error: 'DB_ERROR', message: 'Failed to verify current secret', details: fetchError.message }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const receivedSecret = req.headers.get('x-admin-secret')?.trim() || '';

    // Case 1: No existing secret (BOOTSTRAP MODE)
    if (!currentSecretData || !currentSecretData.value) {
      console.log('[admin-secret-update] BOOTSTRAP MODE: No existing secret, allowing first write');

      const { error: insertError } = await supabase
        .from('admin_secrets')
        .upsert(
          {
            key: 'ADMIN_IMPORT_SECRET',
            value: newSecret.trim(),
            is_active: true,
            updated_at: new Date().toISOString(),
            created_by: 'wp-admin-ui-bootstrap',
          },
          { onConflict: 'key' }
        );

      if (insertError) {
        console.error('[admin-secret-update] Bootstrap insert error:', insertError);
        return new Response(
          JSON.stringify({ error: 'DB_INSERT_ERROR', message: 'Failed to save secret', details: insertError.message }),
          { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
      }

      console.log('[admin-secret-update] ✓ Bootstrap successful');
      return new Response(
        JSON.stringify({ ok: true, message: 'Secret saved successfully (bootstrap)' }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Case 2: Existing secret exists - require authentication
    const expectedSecret = currentSecretData.value.trim();

    if (receivedSecret !== expectedSecret) {
      console.error('[admin-secret-update] Authentication failed: secret mismatch');
      return new Response(
        JSON.stringify({
          error: 'UNAUTHORIZED',
          message: 'Invalid admin secret. Provide current secret in x-admin-secret header',
          hint: 'Use the CURRENT secret to set a NEW secret'
        }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Authenticated - update the secret
    console.log('[admin-secret-update] Authenticated, updating secret');

    const { error: updateError } = await supabase
      .from('admin_secrets')
      .upsert(
        {
          key: 'ADMIN_IMPORT_SECRET',
          value: newSecret.trim(),
          is_active: true,
          updated_at: new Date().toISOString(),
          created_by: 'wp-admin-ui',
        },
        { onConflict: 'key' }
      );

    if (updateError) {
      console.error('[admin-secret-update] Update error:', updateError);
      return new Response(
        JSON.stringify({ error: 'DB_UPDATE_ERROR', message: 'Failed to update secret', details: updateError.message }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    console.log('[admin-secret-update] ✓ Secret updated successfully');

    return new Response(
      JSON.stringify({ ok: true, message: 'Secret updated successfully' }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  } catch (error) {
    console.error('[admin-secret-update] Unexpected error:', error);
    return new Response(
      JSON.stringify({ error: 'INTERNAL_ERROR', message: error instanceof Error ? error.message : 'Unknown error' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
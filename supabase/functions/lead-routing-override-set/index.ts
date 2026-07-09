/**
 * Lead Routing Override Set
 *
 * Admin endpoint to set a manual routing override for a lead.
 * Used by SmartRoutingPanel in wp-admin/email/agency-lookup
 */

import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';
import { verifyAdminSession } from '../_shared/adminSession.ts';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
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

    const body = await req.json();
    const { agency_id, lead_key, override_step, override_reason, expires_in_hours } = body;

    if (!agency_id || !lead_key || !override_step) {
      return new Response(
        JSON.stringify({ error: 'Missing required fields' }),
        {
          status: 400,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    // Calculate expiry if provided
    let expiresAt = null;
    if (expires_in_hours) {
      expiresAt = new Date(Date.now() + expires_in_hours * 60 * 60 * 1000).toISOString();
    }

    // Upsert override
    const { data: override, error: overrideError } = await supabase
      .from('lead_routing_overrides')
      .upsert({
        agency_id,
        lead_key,
        override_step,
        override_reason: override_reason || 'Manual override from admin',
        expires_at: expiresAt,
        set_by_admin_email: authResult.session?.user_email || 'admin',
        updated_at: new Date().toISOString(),
      }, {
        onConflict: 'agency_id,lead_key',
      })
      .select()
      .single();

    if (overrideError) {
      console.error('[lead-routing-override-set] Error:', overrideError);
      return new Response(
        JSON.stringify({ error: 'Failed to set override' }),
        {
          status: 500,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    // Log to audit log
    await supabase
      .from('admin_audit_log')
      .insert({
        admin_email: authResult.session?.user_email || 'admin',
        action: 'lead_routing_override_set',
        resource_type: 'lead_routing_override',
        resource_id: `${agency_id}:${lead_key}`,
        metadata: {
          override_step,
          override_reason,
          expires_at: expiresAt,
        },
      });

    return new Response(
      JSON.stringify({
        ok: true,
        override,
      }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );

  } catch (err) {
    console.error('[lead-routing-override-set] Error:', err);
    return new Response(
      JSON.stringify({ error: 'Internal server error' }),
      {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );
  }
});

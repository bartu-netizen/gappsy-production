/**
 * Lead Routing Override Clear
 *
 * Admin endpoint to clear/remove a manual routing override for a lead.
 * Used by SmartRoutingPanel in wp-admin/email/agency-lookup
 */

import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';
import { verifyAdminSession } from '../_shared/adminSession.ts';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, DELETE, OPTIONS',
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
    const { agency_id, lead_key } = body;

    if (!agency_id || !lead_key) {
      return new Response(
        JSON.stringify({ error: 'Missing agency_id or lead_key' }),
        {
          status: 400,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    // Delete override
    const { error: deleteError } = await supabase
      .from('lead_routing_overrides')
      .delete()
      .eq('agency_id', agency_id)
      .eq('lead_key', lead_key);

    if (deleteError) {
      console.error('[lead-routing-override-clear] Error:', deleteError);
      return new Response(
        JSON.stringify({ error: 'Failed to clear override' }),
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
        action: 'lead_routing_override_clear',
        resource_type: 'lead_routing_override',
        resource_id: `${agency_id}:${lead_key}`,
        metadata: {
          cleared: true,
        },
      });

    return new Response(
      JSON.stringify({
        ok: true,
      }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );

  } catch (err) {
    console.error('[lead-routing-override-clear] Error:', err);
    return new Response(
      JSON.stringify({ error: 'Internal server error' }),
      {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );
  }
});

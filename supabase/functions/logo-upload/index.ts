import { createClient } from 'npm:@supabase/supabase-js@2.57.4';
import { authenticateAdmin, writeAuditLog, getRequestMeta, hashPayload } from '../_shared/adminAuth.ts';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret',
};

interface LogoUploadRequest {
  filename: string;
  base64Data: string;
  state: string;
  agencyRank: number;
}

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const { ip, userAgent } = getRequestMeta(req);

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      await writeAuditLog({
        actor_session_type: 'unknown',
        action: 'logo_upload',
        ip,
        user_agent: userAgent,
        status: 'rejected',
        rejection_reason: authResult.error?.code,
      });
      return new Response(
        JSON.stringify({ error: authResult.error?.code, message: authResult.error?.message }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabaseUrl = Deno.env.get('SUPABASE_URL');
    const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');
    if (!supabaseUrl || !supabaseServiceKey) {
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    let bodyData: any;
    try {
      bodyData = await req.json();
    } catch {
      return new Response(
        JSON.stringify({ error: 'Invalid request body' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (bodyData?.testAuth === true) {
      return new Response(
        JSON.stringify({ ok: true, message: 'Authentication successful', sessionType: authResult.sessionType }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (req.method !== 'POST') {
      return new Response(
        JSON.stringify({ success: false, error: 'Method not allowed' }),
        { status: 405, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    let body: LogoUploadRequest[];
    if (Array.isArray(bodyData)) {
      body = bodyData;
    } else if (bodyData && Array.isArray(bodyData.logos)) {
      body = bodyData.logos;
    } else {
      return new Response(
        JSON.stringify({ success: false, error: 'Request body must contain a logos array' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const payloadHash = await hashPayload({ count: body.length, states: [...new Set(body.map(b => b.state))] });

    const results = [];

    for (const item of body) {
      try {
        const { filename, base64Data, state, agencyRank } = item;

        if (!filename || !base64Data || !state || !agencyRank) {
          results.push({ filename: filename || 'unknown', success: false, error: 'Missing required fields' });
          continue;
        }

        const binary = Uint8Array.from(atob(base64Data), c => c.charCodeAt(0));
        const storagePath = `${state}/${filename}`;

        const { error: uploadError } = await supabase.storage
          .from('agency-logos')
          .upload(storagePath, binary, {
            contentType: filename.endsWith('.webp') ? 'image/webp'
              : filename.endsWith('.png') ? 'image/png' : 'image/jpeg',
            upsert: true,
          });

        if (uploadError) {
          results.push({ filename, success: false, error: `Storage error: ${uploadError.message}` });
          continue;
        }

        const { data: { publicUrl } } = supabase.storage.from('agency-logos').getPublicUrl(storagePath);

        if (agencyRank === 1) {
          results.push({ filename, success: true, logoUrl: publicUrl, state, agencyRank, note: 'Rank 1 reserved; logo stored without DB update' });
          continue;
        }

        const { error: dbError } = await supabase
          .from('top25_slots')
          .update({ logo_url: publicUrl })
          .eq('state_slug', state)
          .eq('rank', agencyRank);

        if (dbError) {
          results.push({ filename, success: false, error: `Database error: ${dbError.message}` });
        } else {
          results.push({ filename, success: true, logoUrl: publicUrl, state, agencyRank });
        }
      } catch (error) {
        results.push({ filename: item.filename, success: false, error: error instanceof Error ? error.message : 'Unknown error' });
      }
    }

    const successCount = results.filter(r => r.success).length;

    await writeAuditLog({
      actor_session_type: authResult.sessionType ?? 'unknown',
      action: 'logo_upload',
      target_table: 'top25_slots',
      payload_hash: payloadHash,
      ip,
      user_agent: userAgent,
      status: successCount > 0 ? 'success' : 'error',
      rejection_reason: successCount === 0 ? 'All uploads failed' : undefined,
    });

    return new Response(
      JSON.stringify({ success: true, results, summary: { total: results.length, successful: successCount, failed: results.length - successCount } }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  } catch (error) {
    return new Response(
      JSON.stringify({ success: false, error: error instanceof Error ? error.message : 'Unknown error' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});

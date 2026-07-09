import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from 'jsr:@supabase/supabase-js@2';
import { sendEmail } from '../_shared/emailClient.ts';
import {
  buildAvailabilityRequestInternalEmail,
} from '../_shared/emailTemplates.ts';

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  if (req.method !== "POST") {
    return new Response(
      JSON.stringify({ success: false, error: 'Method not allowed' }),
      {
        status: 405,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );
  }

  try {
    const SUPABASE_URL = Deno.env.get('SUPABASE_URL');
    const SUPABASE_SERVICE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');

    if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
      console.error('[availability-notify] Supabase env vars not configured');
      return new Response(
        JSON.stringify({ success: false, error: 'Configuration error' }),
        {
          status: 500,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

    const body = await req.json();

    const {
      availabilityRequestId,
      agencyId,
      stateSlug,
      clientName,
      clientEmail,
      service,
      budget,
      timeline,
    } = body || {};

    let finalAgencyId = agencyId;
    let finalStateSlug = stateSlug;
    let finalClientName = clientName;
    let finalClientEmail = clientEmail;
    let finalService = service;
    let finalBudget = budget;
    let finalTimeline = timeline;
    let createdAtIso = new Date().toISOString();

    if (availabilityRequestId) {
      console.log('[availability-notify] Fetching request by ID:', availabilityRequestId);

      const { data: reqRow, error: reqErr } = await supabase
        .from('agency_availability_requests')
        .select('*')
        .eq('id', availabilityRequestId)
        .maybeSingle();

      if (reqErr) {
        console.error('[availability-notify] Error fetching request:', reqErr);
        throw reqErr;
      }

      if (!reqRow) {
        console.error('[availability-notify] Request not found:', availabilityRequestId);
        return new Response(
          JSON.stringify({ success: false, error: 'Request not found' }),
          {
            status: 404,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
          }
        );
      }

      finalAgencyId = reqRow.agency_id;
      finalStateSlug = reqRow.state_slug;
      finalClientName = reqRow.client_name;
      finalClientEmail = reqRow.client_email;
      finalService = reqRow.service;
      finalBudget = reqRow.budget;
      finalTimeline = reqRow.timeline;
      createdAtIso = reqRow.created_at;
    }

    if (!finalAgencyId) {
      console.error('[availability-notify] Missing agencyId');
      return new Response(
        JSON.stringify({ success: false, error: 'Missing agencyId' }),
        {
          status: 400,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    console.log('[availability-notify] Fetching agency data for:', finalAgencyId);

    const { data: agency, error: agencyErr } = await supabase
      .from('other_agencies')
      .select('id, name, is_paid_listing, state_name')
      .eq('id', finalAgencyId)
      .maybeSingle();

    if (agencyErr) {
      console.error('[availability-notify] Error fetching agency:', agencyErr);
      throw agencyErr;
    }

    if (!agency) {
      console.error('[availability-notify] Agency not found:', finalAgencyId);
      return new Response(
        JSON.stringify({ success: false, error: 'Agency not found' }),
        {
          status: 404,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    const internalTo = Deno.env.get('SMTP_INTERNAL_EMAIL');
    if (!internalTo) {
      console.error('[availability-notify] SMTP_INTERNAL_EMAIL not set; skipping email');
      return new Response(
        JSON.stringify({ success: true, skipped: true, reason: 'SMTP_INTERNAL_EMAIL not configured' }),
        {
          status: 200,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    const emailData = {
      agencyName: agency.name,
      stateName: agency.state_name || finalStateSlug || 'Unknown state',
      clientName: finalClientName || '',
      clientEmail: finalClientEmail || '',
      service: finalService || '',
      budget: finalBudget || '',
      timeline: finalTimeline || '',
      submittedAtIso: new Date(createdAtIso).toISOString(),
      isPaidListing: !!agency.is_paid_listing,
    };

    console.log('[availability-notify] Building email for:', emailData.agencyName);

    const { subject, html, text } =
      buildAvailabilityRequestInternalEmail(emailData);

    console.log('[availability-notify] Sending email to:', internalTo);

    const result = await sendEmail({
      to: internalTo,
      subject,
      html,
      text,
    });

    if (!result.success) {
      console.error('[availability-notify] Failed to send email:', result.error);
      return new Response(
        JSON.stringify({ success: false, error: result.error }),
        {
          status: 500,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    console.log('[availability-notify] Email sent successfully');

    return new Response(
      JSON.stringify({ success: true }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );
  } catch (err: any) {
    console.error('[availability-notify] Unexpected error:', err);
    return new Response(
      JSON.stringify({ success: false, error: String(err?.message || err) }),
      {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    );
  }
});

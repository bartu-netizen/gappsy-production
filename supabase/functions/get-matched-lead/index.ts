import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from 'jsr:@supabase/supabase-js@2';

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  try {
    const data = await req.json();

    console.log("Received get matched lead:", {
      clientName: data.clientName,
      clientEmail: data.clientEmail,
      serviceNeeded: data.serviceNeeded
    });

    if (!data.clientName || !data.clientEmail || !data.serviceNeeded || !data.budgetRange || !data.timeline) {
      console.error("Missing required fields");
      return new Response(
        JSON.stringify({
          success: false,
          error: "Missing required fields"
        }),
        {
          headers: {
            ...corsHeaders,
            "Content-Type": "application/json",
          },
          status: 400,
        }
      );
    }

    // Extract request metadata
    const ipAddress = req.headers.get('x-forwarded-for') ||
                     req.headers.get('x-real-ip') ||
                     'unknown';
    const userAgent = req.headers.get('user-agent') || 'unknown';

    // Insert into database
    try {
      console.log('💾 GET MATCHED - Attempting database insert');

      const supabaseClient = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
      );

      const { error: insertError } = await supabaseClient
        .from('matched_leads')
        .insert({
          state_name: data.stateName || null,
          state_slug: data.stateSlug || null,
          service_needed: data.serviceNeeded,
          budget_range: data.budgetRange,
          timeline: data.timeline,
          client_email: data.clientEmail,
          client_name: data.clientName,
          additional_details: data.additionalDetails || null,
          source: 'get_matched_form',
          ip_address: ipAddress,
          user_agent: userAgent,
          status: 'pending'
        });

      if (insertError) {
        console.error('🔴 GET MATCHED - Database insert error:', insertError);
        throw insertError; // Throw for matched leads as this is critical data
      } else {
        console.log('✅ GET MATCHED - Successfully saved to database');
      }
    } catch (dbError) {
      console.error('🔴 GET MATCHED - Database operation failed:', dbError);
      return new Response(
        JSON.stringify({
          success: false,
          error: "Failed to save lead information"
        }),
        {
          headers: {
            ...corsHeaders,
            "Content-Type": "application/json",
          },
          status: 500,
        }
      );
    }

    // Optional: Send internal notification
    const notificationBody = `
New Get Matched Lead

=================================
CLIENT: ${data.clientName}
EMAIL: ${data.clientEmail}
${data.stateName ? `STATE: ${data.stateName}` : ''}
=================================

REQUIREMENTS:
Service Needed: ${data.serviceNeeded}
Budget Range: ${data.budgetRange}
Timeline: ${data.timeline}

${data.additionalDetails ? `Additional Details:\n${data.additionalDetails}` : ''}

=================================
Submitted on: ${new Date().toISOString()}
=================================
    `;

    console.log("Get Matched Lead Received:");
    console.log(notificationBody);

    return new Response(
      JSON.stringify({
        success: true,
        message: "Lead captured successfully"
      }),
      {
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
        status: 200,
      }
    );
  } catch (error) {
    console.error("Error processing get matched lead:", error);

    const errorMessage = error instanceof Error ? error.message : "Failed to process lead";

    return new Response(
      JSON.stringify({
        success: false,
        error: errorMessage
      }),
      {
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
        status: 500,
      }
    );
  }
});
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

    console.log("Received spotlight application data:", {
      agencyName: data.agencyName,
      email: data.email,
      state: data.state,
      servicesCount: data.services?.length || 0
    });

    if (!data.agencyName || !data.email || !data.state) {
      console.error("Missing required fields:", { agencyName: !!data.agencyName, email: !!data.email, state: !!data.state });
      return new Response(
        JSON.stringify({
          success: false,
          error: "Missing required fields: agency name, email, or state"
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
    const stateSlug = data.stateSlug || data.state.toLowerCase().replace(/\s+/g, '-');

    // Insert into database (non-blocking - don't break UX if this fails)
    try {
      console.log('💾 SPOTLIGHT - Attempting database insert');

      const supabaseClient = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
      );

      const { error: insertError } = await supabaseClient
        .from('spotlight_applications')
        .insert({
          state_name: data.state,
          state_slug: stateSlug,
          agency_name: data.agencyName,
          contact_name: data.contactPerson || 'Not provided',
          contact_email: data.email,
          website_url: data.websiteUrl || 'Not provided',
          description: data.description,
          budget_range: data.budgetRange,
          services: Array.isArray(data.services) ? data.services : [],
          source: 'spotlight_form',
          ip_address: ipAddress,
          user_agent: userAgent,
          status: 'pending'
        });

      if (insertError) {
        console.error('🔴 SPOTLIGHT - Database insert error:', insertError);
        // Don't throw - continue with email flow
      } else {
        console.log('✅ SPOTLIGHT - Successfully saved to database');
      }
    } catch (dbError) {
      console.error('🔴 SPOTLIGHT - Database operation failed:', dbError);
      // Don't throw - continue with email flow to not break UX
    }

    const emailBody = `
New Featured Spotlight Application

=================================
STATE: ${data.state}
=================================

AGENCY INFORMATION:
-------------------
Agency Name: ${data.agencyName}
Website URL: ${data.websiteUrl}

CONTACT INFORMATION:
-------------------
Contact Person: ${data.contactPerson}
Email Address: ${data.email}

AGENCY DETAILS:
-------------------
Short Description:
${data.description || "Not provided"}

Typical Project Budget Range: ${data.budgetRange || "Not specified"}

Main Services Offered:
${data.services && data.services.length > 0 ? data.services.join(", ") : "Not specified"}

=================================
Submission Type: PAID PROMOTIONAL SPOTLIGHT
Submitted on: ${new Date().toISOString()}
=================================
    `;

    console.log("Featured Spotlight Application Received:");
    console.log(emailBody);

    const emailData = {
      to: "bartu@gappsy.com",
      subject: `New Featured Spotlight Submission — ${data.state}`,
      body: emailBody,
      submissionData: data
    };

    console.log("Email would be sent to:", emailData.to);
    console.log("Subject:", emailData.subject);

    return new Response(
      JSON.stringify({ 
        success: true, 
        message: "Featured spotlight application received successfully",
        data: emailData
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
    console.error("Error processing spotlight submission:", error);

    const errorMessage = error instanceof Error ? error.message : "Failed to process submission";

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
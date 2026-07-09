import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from 'jsr:@supabase/supabase-js@2';

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  console.log('🟢 TOP25 EDGE FUNCTION - Request received');
  console.log('🟢 TOP25 EDGE FUNCTION - Method:', req.method);
  console.log('🟢 TOP25 EDGE FUNCTION - URL:', req.url);

  if (req.method === "OPTIONS") {
    console.log('🟢 TOP25 EDGE FUNCTION - OPTIONS request, returning CORS');
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  try {
    console.log('🟢 TOP25 EDGE FUNCTION - Parsing JSON body');
    let data;
    try {
      data = await req.json();
    } catch (parseError) {
      console.error('🔴 TOP25 EDGE FUNCTION - JSON parse error:', parseError);
      return new Response(
        JSON.stringify({ success: false, error: "Invalid JSON payload" }),
        {
          headers: { ...corsHeaders, "Content-Type": "application/json" },
          status: 400,
        }
      );
    }
    console.log('🟢 TOP25 EDGE FUNCTION - Received data:', JSON.stringify(data, null, 2));

    const agencyName = data.agencyName || "Not provided";
    const websiteUrl = data.websiteUrl || "Not provided";
    const contactPerson = data.contactPerson || "Not provided";
    const email = data.email || "Not provided";
    const cityState = data.cityState || "Not provided";
    const description = data.description || "Not provided";
    const services = Array.isArray(data.services) && data.services.length > 0
      ? data.services.join(", ")
      : "Not specified";
    const whyTop25 = data.whyTop25 || "Not provided";
    const state = data.state || "Unknown";
    const stateSlug = data.stateSlug || "unknown";

    // Extract request metadata
    const ipAddress = req.headers.get('x-forwarded-for') ||
                     req.headers.get('x-real-ip') ||
                     'unknown';
    const userAgent = req.headers.get('user-agent') || 'unknown';

    // Insert into database (non-blocking - don't break UX if this fails)
    try {
      console.log('💾 TOP25 EDGE FUNCTION - Attempting database insert');

      const supabaseClient = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
      );

      const { data: insertData, error: insertError } = await supabaseClient
        .from('top25_applications')
        .insert({
          state_name: state,
          state_slug: stateSlug,
          agency_name: agencyName,
          contact_name: contactPerson,
          contact_email: email,
          website_url: websiteUrl,
          description: description,
          services: Array.isArray(data.services) ? data.services : [],
          source: 'top25_form',
          ip_address: ipAddress,
          user_agent: userAgent,
          status: 'pending'
        });

      if (insertError) {
        console.error('🔴 TOP25 EDGE FUNCTION - Database insert error:', insertError);
        console.error('🔴 TOP25 EDGE FUNCTION - Error details:', JSON.stringify(insertError, null, 2));
        // Don't throw - continue with email flow
      } else {
        console.log('✅ TOP25 EDGE FUNCTION - Successfully saved to database');
      }
    } catch (dbError) {
      console.error('🔴 TOP25 EDGE FUNCTION - Database operation failed:', dbError);
      // Don't throw - continue with email flow to not break UX
    }

    const emailBody = `
New Top 25 Listing Submission

=================================
STATE: ${state}
=================================

AGENCY INFORMATION:
-------------------
Agency Name: ${agencyName}
Website URL: ${websiteUrl}

CONTACT INFORMATION:
-------------------
Contact Person: ${contactPerson}
Email Address: ${email}
City & State: ${cityState}

AGENCY DETAILS:
-------------------
Short Description:
${description}

Main Services Offered: ${services}

WHY TOP 25:
-------------------
${whyTop25}

=================================
Submission Type: PAID EDITORIAL LISTING
Submitted on: ${new Date().toISOString()}
=================================
    `;

    console.log("Top 25 Listing Submission Received:");
    console.log(emailBody);

    const emailData = {
      to: "bartu@gappsy.com",
      subject: `New Top 25 Listing Submission – ${state}`,
      body: emailBody,
      submissionData: data
    };

    console.log("Email would be sent to:", emailData.to);
    console.log("Subject:", emailData.subject);

    console.log('✅ TOP25 EDGE FUNCTION - Sending success response');
    const successResponse = {
      success: true,
      message: "Top 25 listing submission received successfully",
      data: emailData
    };
    console.log('✅ TOP25 EDGE FUNCTION - Response body:', JSON.stringify(successResponse, null, 2));

    return new Response(
      JSON.stringify(successResponse),
      {
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
        status: 200,
      }
    );
  } catch (error) {
    console.error("🔴 TOP25 EDGE FUNCTION - Error processing submission:", error);
    console.error("🔴 TOP25 EDGE FUNCTION - Error stack:", error.stack);
    
    return new Response(
      JSON.stringify({ 
        success: false, 
        error: "Failed to process submission" 
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
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

    if (data.spotNumber === 1) {
      console.error('[top25-claim-intent] Rank #1 claim attempt blocked');
      return new Response(
        JSON.stringify({
          error: 'Rank #1 is already sold and not available',
          details: 'Rank #1 is permanently sold and cannot be claimed.'
        }),
        {
          status: 403,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }

    // Update the database with claimed rank information
    try {
      console.log('💾 CLAIM INTENT - Attempting database update');

      const supabaseClient = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
      );

      // Find the most recent application from this email/agency
      const { data: applications, error: queryError } = await supabaseClient
        .from('top25_applications')
        .select('id')
        .eq('contact_email', data.email)
        .eq('state_slug', data.stateSlug)
        .order('created_at', { ascending: false })
        .limit(1);

      if (queryError) {
        console.error('🔴 CLAIM INTENT - Query error:', queryError);
      } else if (applications && applications.length > 0) {
        const applicationId = applications[0].id;

        // Update with claimed rank
        const { error: updateError } = await supabaseClient
          .from('top25_applications')
          .update({
            claimed_rank_number: data.spotNumber,
            claimed_at: new Date().toISOString(),
            status: 'claimed'
          })
          .eq('id', applicationId);

        if (updateError) {
          console.error('🔴 CLAIM INTENT - Update error:', updateError);
        } else {
          console.log('✅ CLAIM INTENT - Successfully updated application with claimed rank');
        }
      } else {
        console.log('⚠️ CLAIM INTENT - No matching application found to update');
      }
    } catch (dbError) {
      console.error('🔴 CLAIM INTENT - Database operation failed:', dbError);
      // Don't throw - continue with email flow
    }

    const emailBody = `
New Top 25 Spot Claim Intent

=================================
STATE: ${data.state}
POSITION REQUESTED: #${data.spotNumber}
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
Description:
${data.description || "Not provided"}

Budget Range: ${data.budgetRange || "Not specified"}

Main Services:
${data.services && data.services.length > 0 ? data.services.join(", ") : "Not specified"}

=================================
CLAIM DETAILS:
-------------------
Requested Position: #${data.spotNumber} in ${data.state} Top 25
State Slug: ${data.stateSlug}
Submitted: ${data.timestamp}

=================================
Submission Type: TOP 25 SPOT CLAIM INTENT
Next Steps: Follow up with pricing and activation timeline
=================================
    `;

    console.log("Top 25 Claim Intent Received:");
    console.log(emailBody);

    const emailData = {
      to: "bartu@gappsy.com",
      subject: `Top 25 Claim Intent: Spot #${data.spotNumber} in ${data.state}`,
      body: emailBody,
      claimData: data
    };

    console.log("Email would be sent to:", emailData.to);
    console.log("Subject:", emailData.subject);

    return new Response(
      JSON.stringify({
        success: true,
        message: "Claim intent received successfully",
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
    console.error("Error processing claim intent:", error);

    return new Response(
      JSON.stringify({
        success: false,
        error: "Failed to process claim intent"
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
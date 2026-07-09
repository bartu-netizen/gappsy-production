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

    console.log("Received other listing application data:", {
      agencyName: data.agency_name,
      stateSlug: data.state_slug,
      source: data.source
    });

    if (!data.agency_id || !data.state_slug || !data.agency_name) {
      console.error("Missing required fields:", {
        agency_id: !!data.agency_id,
        state_slug: !!data.state_slug,
        agency_name: !!data.agency_name
      });
      return new Response(
        JSON.stringify({
          success: false,
          error: "Missing required fields: agency_id, state_slug, or agency_name"
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

    // Extract contact_email with backwards compatibility for multiple field name variants
    const contactEmail = data.contact_email || data.contactEmail || data.work_email || data.workEmail || data.email || null;

    // Extract website_url with backwards compatibility for multiple field name variants
    const websiteUrl = data.website_url || data.websiteUrl || data.website || '';

    // Validate website_url is present (required field)
    if (!websiteUrl || !websiteUrl.trim()) {
      console.error("Missing required field: website_url");
      return new Response(
        JSON.stringify({
          success: false,
          error: "Missing required field: website_url"
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

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    const { error: insertError } = await supabaseClient
      .from('other_listing_applications')
      .insert({
        agency_id: data.agency_id,
        state_name: data.state_name,
        state_slug: data.state_slug,
        agency_name: data.agency_name,
        contact_name: data.contact_name || null,
        contact_email: contactEmail,
        website_url: websiteUrl,
        intro: data.intro || null,
        services: Array.isArray(data.services) ? data.services : [],
        average_retainer_amount: data.average_retainer_amount || null,
        source: data.source || 'other_listing_form',
        submission_type: data.submission_type || 'edit'
      });

    if (insertError) {
      console.error('Database insert error:', insertError);
      return new Response(
        JSON.stringify({
          success: false,
          error: "Failed to save application to database"
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

    console.log('Successfully saved other listing application');

    return new Response(
      JSON.stringify({
        success: true,
        message: "Other listing application saved successfully"
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
    console.error("Error processing other listing application:", error);

    const errorMessage = error instanceof Error ? error.message : "Failed to process application";

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

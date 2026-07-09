import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  try {
    const auth = await authenticateAdmin(req);
    if (!auth.ok) return auth.response;

    const { ads } = await req.json();

    // Validate ads array
    if (!Array.isArray(ads)) {
      return new Response(
        JSON.stringify({ error: "Invalid ads data" }),
        {
          status: 400,
          headers: {
            ...corsHeaders,
            "Content-Type": "application/json",
          },
        }
      );
    }

    // If empty array, it's just a login validation - return success
    if (ads.length === 0) {
      return new Response(
        JSON.stringify({ success: true, message: "Login successful" }),
        {
          headers: {
            ...corsHeaders,
            "Content-Type": "application/json",
          },
        }
      );
    }

    // Validate each ad
    for (const ad of ads) {
      if (!ad.id || !ad.position || typeof ad.display_order !== "number") {
        return new Response(
          JSON.stringify({ error: "Missing required fields" }),
          {
            status: 400,
            headers: {
              ...corsHeaders,
              "Content-Type": "application/json",
            },
          }
        );
      }

      if (ad.title && ad.title.length > 18) {
        return new Response(
          JSON.stringify({ error: `Title "${ad.title}" exceeds 18 characters` }),
          {
            status: 400,
            headers: {
              ...corsHeaders,
              "Content-Type": "application/json",
            },
          }
        );
      }

      if (ad.subtitle && ad.subtitle.length > 52) {
        return new Response(
          JSON.stringify({ error: `Subtitle exceeds 52 characters for ad ${ad.id}` }),
          {
            status: 400,
            headers: {
              ...corsHeaders,
              "Content-Type": "application/json",
            },
          }
        );
      }

      if (!['left', 'right'].includes(ad.position)) {
        return new Response(
          JSON.stringify({ error: `Invalid position "${ad.position}" for ad ${ad.id}` }),
          {
            status: 400,
            headers: {
              ...corsHeaders,
              "Content-Type": "application/json",
            },
          }
        );
      }
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Update each ad
    const updatePromises = ads.map((ad) =>
      supabase
        .from("sidebar_ads")
        .update({
          logo_url: ad.logo_url || '',
          title: ad.title,
          subtitle: ad.subtitle,
          target_url: ad.target_url || '',
          bg_color: ad.bg_color || '',
          is_active: ad.is_active !== false,
          updated_at: new Date().toISOString(),
        })
        .eq("id", ad.id)
    );

    const results = await Promise.all(updatePromises);

    // Check for errors
    const errors = results.filter((r) => r.error);
    if (errors.length > 0) {
      throw new Error(`Failed to update ${errors.length} ads`);
    }

    return new Response(
      JSON.stringify({ success: true, updated: ads.length }),
      {
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
      }
    );
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      {
        status: 500,
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
      }
    );
  }
});
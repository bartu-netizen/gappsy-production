import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const authHeader = req.headers.get("Authorization");
    if (!authHeader) {
      return new Response(JSON.stringify({ error: "Missing Authorization header" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
    );

    const { state_slug } = await req.json();

    if (!state_slug || typeof state_slug !== "string") {
      return new Response(JSON.stringify({ error: "Missing or invalid state_slug" }), {
        status: 400,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const slug = state_slug.trim().toLowerCase();

    let slotsCreated = 0;
    let stateContentCreated = false;

    for (let rank = 1; rank <= 25; rank++) {
      const { data: existing } = await supabase
        .from("top25_slots")
        .select("id")
        .eq("state_slug", slug)
        .eq("rank", rank)
        .maybeSingle();

      if (!existing) {
        const { error: insertError } = await supabase
          .from("top25_slots")
          .insert({
            state_slug: slug,
            rank,
            is_paid: false,
            is_available: true,
            show_lightning: false,
            agency_name: null,
            website: null,
            logo_url: null,
            short_description: null,
            description: null,
            services: [],
          });

        if (!insertError) {
          slotsCreated++;
        }
      }
    }

    const { data: existingContent } = await supabase
      .from("state_content")
      .select("id")
      .eq("state_slug", slug)
      .maybeSingle();

    if (!existingContent) {
      const stateName = slug
        .split("-")
        .map((w: string) => w.charAt(0).toUpperCase() + w.slice(1))
        .join(" ");

      const { error: contentError } = await supabase
        .from("state_content")
        .insert({
          state_slug: slug,
          hero_intro: `Welcome to our curated list of the top 25 marketing agencies in ${stateName}.`,
          hero_intro_short: `Top 25 marketing agencies in ${stateName}.`,
          state_intro_short: `Our comprehensive ranking of ${stateName}'s top marketing agencies, based on expertise, client results, innovation, and industry reputation.`,
          state_intro_full: `Our comprehensive ranking of ${stateName}'s top marketing agencies, based on expertise, client results, innovation, and industry reputation.`,
          state_description_full: "",
        });

      if (!contentError) {
        stateContentCreated = true;
      }
    }

    return new Response(
      JSON.stringify({
        ok: true,
        state_slug: slug,
        created: {
          top25_slots: slotsCreated,
          state_content: stateContentCreated,
        },
      }),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});

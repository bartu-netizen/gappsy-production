import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

const ALL_52_STATES = [
  { name: "Alabama", slug: "alabama" },
  { name: "Alaska", slug: "alaska" },
  { name: "Arizona", slug: "arizona" },
  { name: "Arkansas", slug: "arkansas" },
  { name: "California", slug: "california" },
  { name: "Colorado", slug: "colorado" },
  { name: "Connecticut", slug: "connecticut" },
  { name: "Delaware", slug: "delaware" },
  { name: "District of Columbia", slug: "district-of-columbia" },
  { name: "Florida", slug: "florida" },
  { name: "Georgia", slug: "georgia" },
  { name: "Hawaii", slug: "hawaii" },
  { name: "Idaho", slug: "idaho" },
  { name: "Illinois", slug: "illinois" },
  { name: "Indiana", slug: "indiana" },
  { name: "Iowa", slug: "iowa" },
  { name: "Kansas", slug: "kansas" },
  { name: "Kentucky", slug: "kentucky" },
  { name: "Louisiana", slug: "louisiana" },
  { name: "Maine", slug: "maine" },
  { name: "Maryland", slug: "maryland" },
  { name: "Massachusetts", slug: "massachusetts" },
  { name: "Michigan", slug: "michigan" },
  { name: "Minnesota", slug: "minnesota" },
  { name: "Mississippi", slug: "mississippi" },
  { name: "Missouri", slug: "missouri" },
  { name: "Montana", slug: "montana" },
  { name: "Nebraska", slug: "nebraska" },
  { name: "Nevada", slug: "nevada" },
  { name: "New Hampshire", slug: "new-hampshire" },
  { name: "New Jersey", slug: "new-jersey" },
  { name: "New Mexico", slug: "new-mexico" },
  { name: "New York", slug: "new-york" },
  { name: "North Carolina", slug: "north-carolina" },
  { name: "North Dakota", slug: "north-dakota" },
  { name: "Ohio", slug: "ohio" },
  { name: "Oklahoma", slug: "oklahoma" },
  { name: "Oregon", slug: "oregon" },
  { name: "Pennsylvania", slug: "pennsylvania" },
  { name: "Puerto Rico", slug: "puerto-rico" },
  { name: "Rhode Island", slug: "rhode-island" },
  { name: "South Carolina", slug: "south-carolina" },
  { name: "South Dakota", slug: "south-dakota" },
  { name: "Tennessee", slug: "tennessee" },
  { name: "Texas", slug: "texas" },
  { name: "Utah", slug: "utah" },
  { name: "Vermont", slug: "vermont" },
  { name: "Virginia", slug: "virginia" },
  { name: "Washington", slug: "washington" },
  { name: "West Virginia", slug: "west-virginia" },
  { name: "Wisconsin", slug: "wisconsin" },
  { name: "Wyoming", slug: "wyoming" },
];

async function ensureStateRanks(
  supabase: any,
  slug: string,
  stateName: string,
): Promise<{ slotsCreated: number; missingRanksBefore: number; stateContentCreated: boolean }> {
  // Fetch all existing ranks for this state
  const { data: existing } = await supabase
    .from("top25_slots")
    .select("rank")
    .eq("state_slug", slug);

  const existingRanks = new Set<number>((existing ?? []).map((r: any) => r.rank));
  const missingRanksBefore = 25 - existingRanks.size;
  let slotsCreated = 0;

  for (let rank = 1; rank <= 25; rank++) {
    if (!existingRanks.has(rank)) {
      const { error } = await supabase.from("top25_slots").insert({
        state_slug: slug,
        rank,
        is_paid: false,
        is_available: rank !== 1,
        slot_status: rank === 1 ? "sold" : "available",
        show_lightning: false,
        agency_name: null,
        website: null,
        logo_url: null,
        short_description: null,
        description: null,
        services: [],
      });
      if (!error) slotsCreated++;
    }
  }

  // Ensure state_content row exists
  let stateContentCreated = false;
  const { data: existingContent } = await supabase
    .from("state_content")
    .select("id")
    .eq("state_slug", slug)
    .maybeSingle();

  if (!existingContent) {
    const { error } = await supabase.from("state_content").insert({
      state_slug: slug,
      hero_intro: `Welcome to our curated list of the top 25 marketing agencies in ${stateName}.`,
      hero_intro_short: `Top 25 marketing agencies in ${stateName}.`,
      state_intro_short: `Our comprehensive ranking of ${stateName}'s top marketing agencies, based on expertise, client results, innovation, and industry reputation.`,
      state_intro_full: `Our comprehensive ranking of ${stateName}'s top marketing agencies, based on expertise, client results, innovation, and industry reputation.`,
      state_description_full: "",
    });
    if (!error) stateContentCreated = true;
  }

  return { slotsCreated, missingRanksBefore, stateContentCreated };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return createAuthErrorResponse(authResult, corsHeaders);
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
    );

    let totalSlotsCreated = 0;
    let statesWithMissingRanksBefore = 0;
    let statesProcessed = 0;
    const statesRepaired: string[] = [];

    for (const state of ALL_52_STATES) {
      const result = await ensureStateRanks(supabase, state.slug, state.name);
      statesProcessed++;
      totalSlotsCreated += result.slotsCreated;
      if (result.missingRanksBefore > 0) {
        statesWithMissingRanksBefore++;
        statesRepaired.push(`${state.slug}(+${result.slotsCreated})`);
      }
    }

    // Verify final state
    const { data: finalCheck } = await supabase
      .from("top25_slots")
      .select("state_slug")
      .order("state_slug");

    const finalCountMap: Record<string, number> = {};
    for (const row of (finalCheck ?? [])) {
      finalCountMap[row.state_slug] = (finalCountMap[row.state_slug] ?? 0) + 1;
    }
    const statesStillBroken = Object.entries(finalCountMap)
      .filter(([, count]) => count !== 25)
      .map(([slug, count]) => `${slug}(${count})`);

    return new Response(
      JSON.stringify({
        ok: true,
        statesProcessed,
        ranksInserted: totalSlotsCreated,
        statesWithMissingRanksBefore,
        statesRepaired,
        statesStillBroken,
        allHealthy: statesStillBroken.length === 0,
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});

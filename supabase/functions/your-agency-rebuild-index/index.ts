import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

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
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    console.log("[your-agency-rebuild-index] Starting rebuild of search MV + agency_listings_index");

    // Step 1: Rebuild search MV
    const { data: searchResult, error: searchError } = await supabase.rpc("rebuild_public_agency_search");
    if (searchError) {
      console.error("[your-agency-rebuild-index] Search MV rebuild error:", searchError);
      throw searchError;
    }

    const searchInfo = searchResult?.[0] || {};
    console.log(`[your-agency-rebuild-index] Search MV rebuilt: ${searchInfo.unique_agencies} unique agencies`);

    // Step 2: Rebuild agency_listings_index
    const { data: indexResult, error: indexError } = await supabase.rpc("rebuild_agency_listings_index");
    if (indexError) {
      console.error("[your-agency-rebuild-index] Listings index rebuild error:", indexError);
      throw indexError;
    }

    const indexInfo = indexResult?.[0] || {};
    console.log(`[your-agency-rebuild-index] Listings index rebuilt: ${indexInfo.processed_count} listings`);

    // Step 3: Diagnose coverage
    const { data: coverage, error: coverageError } = await supabase.rpc("diagnose_agency_search_coverage");
    if (coverageError) {
      console.warn("[your-agency-rebuild-index] Coverage check error:", coverageError);
    }

    console.log(`[your-agency-rebuild-index] Complete: search=${searchInfo.unique_agencies} agencies, listings=${indexInfo.processed_count} profiles`);

    return new Response(JSON.stringify({
      ok: true,
      message: "Search index and profile listings rebuilt successfully",
      search_rebuild: {
        status: searchInfo.status,
        top25_count: searchInfo.top25_count,
        other_count: searchInfo.other_count,
        multistate_count: searchInfo.multistate_count,
        total_listings: searchInfo.total_listings,
        unique_agencies: searchInfo.unique_agencies,
        duration_ms: searchInfo.duration_ms,
      },
      listings_rebuild: {
        status: indexInfo.status,
        processed_count: indexInfo.processed_count,
        updated_count: indexInfo.updated_count,
        duration_ms: indexInfo.duration_ms,
      },
      coverage: coverage || [],
    }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (err) {
    console.error("[your-agency-rebuild-index] Error:", err);
    return new Response(JSON.stringify({ ok: false, error: String(err) }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});

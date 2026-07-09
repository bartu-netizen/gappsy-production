import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";
import { fetchAllRows } from "../_shared/paginate.ts";
import { ALL_52_STATES } from "../_shared/allStates.ts";

const EXPECTED_TOTAL_ROWS = 52 * 25;

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: corsHeaders });

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) return createAuthErrorResponse(authResult, corsHeaders);

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const { rows, pages, totalFetched } = await fetchAllRows<{
      state_slug: string;
      rank: number;
      slot_status: string | null;
      is_paid: boolean | null;
      is_available: boolean | null;
      locked_by_admin: boolean | null;
    }>(supabase, "top25_slots", "state_slug, rank, slot_status, is_paid, is_available, locked_by_admin");

    const fetchIncomplete = totalFetched < EXPECTED_TOTAL_ROWS;

    type StateHealth = {
      state_slug: string;
      total: number;
      available: number;
      locked: number;
      reserved: number;
      sold: number;
      upsell_active: boolean;
      rank1_sold: boolean;
      has_all_25: boolean;
    };

    const stateMap: Record<string, StateHealth> = {};

    for (const s of ALL_52_STATES) {
      stateMap[s.slug] = {
        state_slug: s.slug,
        total: 0,
        available: 0,
        locked: 0,
        reserved: 0,
        sold: 0,
        upsell_active: false,
        rank1_sold: false,
        has_all_25: false,
      };
    }

    for (const row of rows) {
      const s = stateMap[row.state_slug];
      if (!s) continue;
      s.total++;

      const status = row.slot_status ?? "";

      if (row.rank === 1) {
        s.rank1_sold = row.is_paid === true || status === "sold";
        s.sold++;
      } else if (row.is_paid === true || status === "sold") {
        s.sold++;
      } else if (status === "reserved") {
        s.reserved++;
      } else if (row.locked_by_admin === true || status === "locked") {
        s.locked++;
      } else if (status === "available" && row.is_paid !== true) {
        s.available++;
      } else {
        s.locked++;
      }
    }

    const states = Object.values(stateMap).map(s => ({
      ...s,
      upsell_active: s.available >= 1,
      has_all_25: s.total === 25,
    }));

    states.sort((a, b) => a.state_slug.localeCompare(b.state_slug));

    const totalAvailable = states.reduce((sum, s) => sum + s.available, 0);
    const totalLocked = states.reduce((sum, s) => sum + s.locked, 0);
    const totalSold = states.reduce((sum, s) => sum + s.sold, 0);
    const totalReserved = states.reduce((sum, s) => sum + s.reserved, 0);
    const statesWithZeroAvailable = states.filter(s => s.available === 0).length;
    const statesWithMissingRanks = fetchIncomplete ? 0 : states.filter(s => !s.has_all_25).length;
    const statesWithBrokenRank1 = states.filter(s => !s.rank1_sold).length;

    const selfTestPass =
      !fetchIncomplete &&
      statesWithZeroAvailable === 0 &&
      statesWithMissingRanks === 0 &&
      statesWithBrokenRank1 === 0;

    return json({
      ok: true,
      fetch_incomplete: fetchIncomplete,
      fetch_error_hint: fetchIncomplete
        ? `Revenue Health only fetched ${totalFetched} of ${EXPECTED_TOTAL_ROWS} expected rows. Pagination or ordering issue.`
        : null,
      computed_at: new Date().toISOString(),
      debug: {
        expectedTotalRows: EXPECTED_TOTAL_ROWS,
        fetchedRows: totalFetched,
        pages,
      },
      summary: {
        total_states: states.length,
        states_with_zero_available: statesWithZeroAvailable,
        states_with_missing_ranks: statesWithMissingRanks,
        states_with_broken_rank1: statesWithBrokenRank1,
        total_available: totalAvailable,
        total_locked: totalLocked,
        total_sold: totalSold,
        total_reserved: totalReserved,
        self_test_pass: selfTestPass,
      },
      states,
    });
  } catch (err: any) {
    console.error("[top25-revenue-health] error:", err.message);
    return json({ error: err.message }, 500);
  }
});

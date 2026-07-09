import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";
import { ALL_52_STATES } from "../_shared/allStates.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
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

    const shuffled = [...ALL_52_STATES].sort(() => Math.random() - 0.5);
    const alwaysIncluded = ALL_52_STATES.find(s => s.slug === "new-jersey")!;
    const randomThree = shuffled.filter(s => s.slug !== "new-jersey").slice(0, 3);
    const testStates = [alwaysIncluded, ...randomThree];

    const results: {
      state_slug: string;
      state_name: string;
      pass: boolean;
      total_rows: number;
      has_all_25_ranks: boolean;
      rank1_not_sellable: boolean;
      available_slots_ranks_2_to_25: number;
      has_min_2_available: boolean;
      failures: string[];
    }[] = [];

    for (const state of testStates) {
      const { data: rows, error } = await supabase
        .from("top25_slots")
        .select("rank, is_paid, is_available, slot_status, manual_override, agency_id, locked_by_admin")
        .eq("state_slug", state.slug)
        .order("rank", { ascending: true });

      if (error) {
        results.push({
          state_slug: state.slug,
          state_name: state.name,
          pass: false,
          total_rows: 0,
          has_all_25_ranks: false,
          rank1_not_sellable: false,
          available_slots_ranks_2_to_25: 0,
          has_min_2_available: false,
          failures: [`DB error: ${error.message}`],
        });
        continue;
      }

      const stateRows = rows ?? [];
      const rankSet = new Set(stateRows.map(r => r.rank));
      const failures: string[] = [];

      const totalRows = stateRows.length;
      const hasAll25 = totalRows === 25 && rankSet.size === 25 &&
        Array.from({ length: 25 }, (_, i) => i + 1).every(r => rankSet.has(r));

      if (!hasAll25) {
        const missingRanks = Array.from({ length: 25 }, (_, i) => i + 1).filter(r => !rankSet.has(r));
        failures.push(`Missing ranks: ${missingRanks.join(", ") || "none"} (total rows: ${totalRows})`);
      }

      const isTaken = (r: { is_paid?: boolean | null; slot_status?: string | null; manual_override?: boolean | null; is_available?: boolean | null; agency_id?: string | null }) =>
        r.is_paid === true ||
        r.slot_status === "sold" ||
        r.manual_override === true ||
        r.is_available === false ||
        !!r.agency_id;

      const rank1Row = stateRows.find(r => r.rank === 1);
      const rank1NotSellable = rank1Row ? isTaken(rank1Row) : false;

      if (!rank1NotSellable) {
        failures.push(`Rank 1 appears sellable: is_available=${rank1Row?.is_available}, slot_status=${rank1Row?.slot_status}, manual_override=${rank1Row?.manual_override}, agency_id=${rank1Row?.agency_id}`);
      }

      const availableSlots = stateRows.filter(r => r.rank !== 1 && !isTaken(r)).length;

      const hasMin2Available = availableSlots >= 2;
      if (!hasMin2Available) {
        failures.push(`Only ${availableSlots} available slot(s) among ranks 2–25 (need at least 2)`);
      }

      results.push({
        state_slug: state.slug,
        state_name: state.name,
        pass: failures.length === 0,
        total_rows: totalRows,
        has_all_25_ranks: hasAll25,
        rank1_not_sellable: rank1NotSellable,
        available_slots_ranks_2_to_25: availableSlots,
        has_min_2_available: hasMin2Available,
        failures,
      });
    }

    const allPass = results.every(r => r.pass);

    return json({
      ok: true,
      pass: allPass,
      tested_states: results.length,
      results,
      summary: allPass
        ? "All tested states passed inventory validation."
        : `${results.filter(r => !r.pass).length} state(s) failed validation.`,
    });
  } catch (err: any) {
    console.error("[top25-inventory-self-test] error:", err.message);
    return json({ error: err.message }, 500);
  }
});

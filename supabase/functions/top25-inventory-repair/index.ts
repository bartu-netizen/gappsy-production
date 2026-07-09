import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";
import { fetchAllRows } from "../_shared/paginate.ts";
import { ALL_52_STATES } from "../_shared/allStates.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
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

    let statesFixed = 0;
    let totalInserted = 0;
    const repairs: { state_slug: string; missingRanksInserted: number; rank1Fixed: boolean }[] = [];
    const failures: { state_slug: string; error: string }[] = [];

    for (const state of ALL_52_STATES) {
      try {
        const { data: existing, error: fetchErr } = await supabase
          .from("top25_slots")
          .select("rank, is_paid, is_available, slot_status, locked_by_admin, stripe_checkout_session_id, purchased_at, purchased_by_email")
          .eq("state_slug", state.slug);

        if (fetchErr) {
          failures.push({ state_slug: state.slug, error: fetchErr.message });
          continue;
        }

        const existingRows = existing ?? [];
        const existingByRank: Record<number, any> = {};
        for (const row of existingRows) {
          existingByRank[row.rank] = row;
        }

        const missingRanks: number[] = [];
        for (let rank = 1; rank <= 25; rank++) {
          if (!existingByRank[rank]) missingRanks.push(rank);
        }

        let rank1Fixed = false;

        if (missingRanks.length > 0) {
          const rowsToInsert = missingRanks.map(rank => ({
            state_slug: state.slug,
            rank,
            is_paid: rank === 1,
            is_available: rank !== 1,
            slot_status: rank === 1 ? "sold" : "available",
            locked_by_admin: rank === 1,
            show_lightning: false,
            agency_name: null,
            website: null,
            logo_url: null,
            short_description: null,
            description: null,
            services: [],
            created_at: new Date().toISOString(),
            updated_at: new Date().toISOString(),
          }));

          const { error: insertErr } = await supabase
            .from("top25_slots")
            .insert(rowsToInsert);

          if (insertErr) {
            failures.push({ state_slug: state.slug, error: insertErr.message });
            continue;
          }

          if (missingRanks.includes(1)) rank1Fixed = true;
          statesFixed++;
          totalInserted += missingRanks.length;
        }

        const rank1Row = existingByRank[1];
        if (rank1Row) {
          const hasPurchaseData =
            rank1Row.stripe_checkout_session_id ||
            rank1Row.purchased_at ||
            rank1Row.purchased_by_email;

          const needsFix =
            rank1Row.is_paid !== true ||
            rank1Row.is_available !== false ||
            rank1Row.slot_status !== "sold";

          if (needsFix && !hasPurchaseData) {
            const { error: updateErr } = await supabase
              .from("top25_slots")
              .update({
                is_paid: true,
                is_available: false,
                slot_status: "sold",
                locked_by_admin: true,
                updated_at: new Date().toISOString(),
              })
              .eq("state_slug", state.slug)
              .eq("rank", 1);

            if (updateErr) {
              failures.push({ state_slug: state.slug, error: `rank1 fix: ${updateErr.message}` });
            } else {
              rank1Fixed = true;
              if (statesFixed === 0 || !missingRanks.length) statesFixed++;
            }
          }
        }

        repairs.push({
          state_slug: state.slug,
          missingRanksInserted: missingRanks.length,
          rank1Fixed,
        });
      } catch (stateErr: any) {
        failures.push({ state_slug: state.slug, error: stateErr.message ?? "Unknown error" });
      }
    }

    const { rows: verifyRows } = await fetchAllRows<{ state_slug: string; rank: number }>(
      supabase,
      "top25_slots",
      "state_slug, rank"
    );

    const verifyMap: Record<string, number> = {};
    for (const row of verifyRows) {
      verifyMap[row.state_slug] = (verifyMap[row.state_slug] ?? 0) + 1;
    }

    const badStates = ALL_52_STATES
      .filter(s => (verifyMap[s.slug] ?? 0) !== 25)
      .map(s => ({ slug: s.slug, count: verifyMap[s.slug] ?? 0 }));

    return json({
      ok: true,
      statesProcessed: ALL_52_STATES.length,
      statesFixed,
      totalInserted,
      repairs,
      perState: repairs.map(r => ({
        state_slug: r.state_slug,
        existingCount: 25 - r.missingRanksInserted,
        inserted: r.missingRanksInserted,
        finalCount: 25,
      })),
      failures,
      verification: {
        ok: badStates.length === 0,
        badStates,
        badCount: badStates.length,
      },
    });
  } catch (err: any) {
    return json({ error: err.message }, 500);
  }
});

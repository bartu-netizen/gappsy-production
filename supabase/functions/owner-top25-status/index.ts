import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'npm:@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey',
};

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const { agency_id } = await req.json();

    if (!agency_id) {
      return new Response(
        JSON.stringify({ ok: false, error: 'agency_id required' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
      );
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    );

    // Step 1: Use agency_listings_index as source of truth for current Top 25 membership.
    // This is the correct source — top25_slots.agency_id may be null for placeholder rows.
    const { data: indexRow, error: indexError } = await supabase
      .from('agency_listings_index')
      .select('agency_id, state_slug, rank, section')
      .eq('agency_id', agency_id)
      .eq('section', 'top25')
      .order('rank', { ascending: true })
      .limit(1)
      .maybeSingle();

    if (indexError) {
      console.error('[owner-top25-status] index query error:', indexError.message);
    }

    if (!indexRow) {
      // Agency is not currently in any Top 25 list — no special branch
      return new Response(
        JSON.stringify({
          ok: true,
          ownerFlowType: 'not_top25_current',
          isCurrentlyTop25: false,
          top25SlotId: null,
          top25Rank: null,
          top25StateSlug: null,
          canShowTop25ClaimEntry: false,
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
      );
    }

    const { state_slug: stateSlug, rank } = indexRow;

    // Step 2: Resolve the matching top25_slot by (state_slug, rank) — the safe coordinates.
    // Do not filter by agency_id since placeholder slots may have agency_id = null.
    const { data: slot, error: slotError } = await supabase
      .from('top25_slots')
      .select('id, rank, state_slug, is_paid, is_available, slot_status, agency_id')
      .eq('state_slug', stateSlug)
      .eq('rank', rank)
      .maybeSingle();

    if (slotError) {
      console.error('[owner-top25-status] slot query error:', slotError.message);
    }

    // Step 3: Slot lookup must succeed for any claimable state to be returned.
    // If slot row cannot be resolved, return a safe non-claimable state.
    if (!slot) {
      console.warn(`[owner-top25-status] Slot not found for ${stateSlug} rank ${rank} — returning top25_unresolved_current`);
      return new Response(
        JSON.stringify({
          ok: true,
          ownerFlowType: 'top25_unresolved_current',
          isCurrentlyTop25: true,
          top25SlotId: null,
          top25Rank: rank,
          top25SlotPaid: false,
          top25SlotStatus: null,
          top25StateSlug: stateSlug,
          ownerAgencyId: agency_id,
          canShowTop25ClaimEntry: false,
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
      );
    }

    // Step 4: Determine flow type from the slot's paid state
    const slotIsPaid = slot.is_paid === true || slot.slot_status === 'sold';
    const slotIsClaimable = !slotIsPaid && slot.slot_status !== 'locked';

    let ownerFlowType: 'top25_unpaid_current' | 'top25_paid_current' | 'not_top25_current' | 'top25_unresolved_current';

    if (slotIsPaid) {
      ownerFlowType = 'top25_paid_current';
    } else {
      ownerFlowType = 'top25_unpaid_current';
    }

    return new Response(
      JSON.stringify({
        ok: true,
        ownerFlowType,
        isCurrentlyTop25: true,
        top25SlotId: slot.id,
        top25Rank: rank,
        top25SlotPaid: slotIsPaid,
        top25SlotStatus: slot.slot_status ?? null,
        top25StateSlug: stateSlug,
        ownerAgencyId: agency_id,
        canShowTop25ClaimEntry: ownerFlowType === 'top25_unpaid_current' && slotIsClaimable,
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
    );
  } catch (err: any) {
    console.error('[owner-top25-status] error:', err.message);
    return new Response(
      JSON.stringify({ ok: false, error: 'Internal error' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
    );
  }
});

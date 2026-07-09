import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from 'jsr:@supabase/supabase-js@2';
import Stripe from 'npm:stripe@17.7.0';
import { revokeEntitlementAndSync, type EntitlementRow } from '../_shared/entitlementRevoke.ts';

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const supabase = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
  );

  const stripeKey = Deno.env.get('STRIPE_SECRET_KEY');
  if (!stripeKey) {
    return new Response(
      JSON.stringify({ error: 'STRIPE_SECRET_KEY not configured' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }

  const stripe = new Stripe(stripeKey, { apiVersion: '2023-10-16' });
  const nowEpoch = Math.floor(Date.now() / 1000);
  const nowIso = new Date().toISOString();
  const results = { checked: 0, revoked: 0, renewed: 0, skipped: 0, errors: [] as string[] };

  try {
    // current_period_end is stored as bigint (unix epoch seconds)
    const { data: expiredEntitlements, error: fetchError } = await supabase
      .from('agency_listing_entitlements')
      .select('id, stripe_subscription_id, entitlement_type, source_listing_type, agency_id, top25_slot_id, top25_rank, state_slug, current_period_end, is_active, status')
      .eq('is_active', true)
      .lt('current_period_end', nowEpoch);

    if (fetchError) {
      throw new Error(`Failed to fetch entitlements: ${fetchError.message}`);
    }

    results.checked = expiredEntitlements?.length ?? 0;

    for (const entitlement of (expiredEntitlements || [])) {
      try {
        if (!entitlement.stripe_subscription_id) {
          const reason = `No subscription ID — reconciler forced expiry`;
          await revokeEntitlementAndSync(supabase, entitlement as EntitlementRow, reason, 'expired');
          results.revoked++;
          continue;
        }

        let sub: Stripe.Subscription;
        try {
          sub = await stripe.subscriptions.retrieve(entitlement.stripe_subscription_id);
        } catch {
          const reason = `Stripe subscription ${entitlement.stripe_subscription_id} not found`;
          await revokeEntitlementAndSync(supabase, entitlement as EntitlementRow, reason, 'expired');
          results.revoked++;
          continue;
        }

        if (sub.status === 'active' || sub.status === 'trialing') {
          // Subscription still active — refresh period end (bigint epoch)
          const newPeriodEnd = sub.current_period_end as number;

          await supabase
            .from('agency_listing_entitlements')
            .update({
              current_period_end: newPeriodEnd,
              current_period_start: sub.current_period_start as number,
              status: 'active',
              is_active: true,
              cancel_at_period_end: sub.cancel_at_period_end ?? false,
              updated_at: nowIso,
            })
            .eq('id', entitlement.id);

          if (entitlement.top25_slot_id) {
            const lockExpiresAt = new Date(newPeriodEnd * 1000).toISOString();
            await supabase
              .from('top25_slots')
              .update({
                lock_expires_at: lockExpiresAt,
                billing_status: 'active',
                cancel_at_period_end: sub.cancel_at_period_end ?? false,
                last_billing_sync_at: nowIso,
              })
              .eq('id', entitlement.top25_slot_id);
          }

          results.renewed++;
        } else if (['canceled', 'incomplete_expired', 'unpaid'].includes(sub.status)) {
          const reason = `Reconciler: Stripe subscription status is ${sub.status} (${entitlement.stripe_subscription_id})`;
          const finalStatus = sub.status === 'canceled' ? 'canceled' : 'expired';
          await revokeEntitlementAndSync(supabase, entitlement as EntitlementRow, reason, finalStatus);
          results.revoked++;
        } else if (sub.status === 'past_due') {
          // Not yet terminal — mark past_due but do not revoke
          await supabase
            .from('agency_listing_entitlements')
            .update({ status: 'past_due', updated_at: nowIso })
            .eq('id', entitlement.id);

          if (entitlement.top25_slot_id) {
            await supabase
              .from('top25_slots')
              .update({ billing_status: 'past_due', last_billing_sync_at: nowIso })
              .eq('id', entitlement.top25_slot_id);
          }
        } else {
          // Unknown subscription status — log and skip, do NOT revoke
          console.warn(`[entitlement-reconciler] Unknown Stripe subscription status "${sub.status}" for entitlement ${entitlement.id} — skipping`);
          results.skipped++;
        }
      } catch (entitlementErr: any) {
        results.errors.push(`entitlement ${entitlement.id}: ${entitlementErr.message}`);
      }
    }

    console.log('[entitlement-reconciler] Complete:', results);

    return new Response(
      JSON.stringify({ ok: true, ...results }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  } catch (err: any) {
    console.error('[entitlement-reconciler] Fatal error:', err);
    return new Response(
      JSON.stringify({ ok: false, error: err.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});

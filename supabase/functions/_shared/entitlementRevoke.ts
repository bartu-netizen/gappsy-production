import { createClient } from 'jsr:@supabase/supabase-js@2';

type SupabaseClient = ReturnType<typeof createClient>;

export interface EntitlementRow {
  id: string;
  agency_id: string | null;
  entitlement_type: string;
  source_listing_type: string | null;
  top25_slot_id: string | null;
  top25_rank: number | null;
  state_slug: string | null;
  stripe_subscription_id?: string | null;
}

// ─────────────────────────────────────────────────────────────────────────────
// Capability model
//
// Maps entitlement types to the capabilities they grant. Used to determine
// which feature flags are safe to revoke (only when no other active
// entitlement still grants the same capability).
// ─────────────────────────────────────────────────────────────────────────────

export type Capability =
  | 'standard_listing_paid_benefits'
  | 'top25_paid_slot'
  | 'spotlight'
  | 'card_visual_upgrade'
  | 'lead_matching_upgrade';

const ENTITLEMENT_CAPABILITIES: Record<string, Capability[]> = {
  standard_listing: ['standard_listing_paid_benefits'],
  top25_slot: ['top25_paid_slot'],
  top25_claim_bundle: ['standard_listing_paid_benefits', 'top25_paid_slot'],
  spotlight: ['spotlight'],
  featured_badge: ['card_visual_upgrade'],
  visual_upgrade: ['card_visual_upgrade'],
  get_matched: ['lead_matching_upgrade'],
};

const CAPABILITY_FLAGS: Record<Capability, string[]> = {
  standard_listing_paid_benefits: ['is_paid_listing', 'paid_listing_type', 'paid_listing_rank', 'availability_redirect_enabled'],
  top25_paid_slot: ['paid_listing_rank'],
  spotlight: ['has_spotlight'],
  card_visual_upgrade: ['has_card_visual_upgrade'],
  lead_matching_upgrade: ['has_lead_matching_upgrade'],
};

export function getCapabilitiesForEntitlementType(entitlementType: string): Capability[] {
  return ENTITLEMENT_CAPABILITIES[entitlementType] ?? [];
}

// ─────────────────────────────────────────────────────────────────────────────
// fetchActiveCapabilitiesForAgency
//
// Returns the set of capabilities still granted to an agency by active
// entitlements, EXCLUDING a specific entitlement id being revoked.
// ─────────────────────────────────────────────────────────────────────────────
async function fetchActiveCapabilitiesForAgency(
  supabase: SupabaseClient,
  agencyId: string,
  excludeEntitlementIds: string[],
): Promise<Set<Capability>> {
  const { data: activeEnts, error } = await supabase
    .from('agency_listing_entitlements')
    .select('id, entitlement_type')
    .eq('agency_id', agencyId)
    .eq('is_active', true)
    .not('id', 'in', `(${excludeEntitlementIds.map(id => `"${id}"`).join(',')})`);

  if (error) {
    console.warn(`[entitlementRevoke] Could not fetch remaining entitlements for agency ${agencyId}:`, error.message);
    return new Set();
  }

  const caps = new Set<Capability>();
  for (const ent of activeEnts ?? []) {
    for (const cap of getCapabilitiesForEntitlementType(ent.entitlement_type)) {
      caps.add(cap);
    }
  }
  return caps;
}

// ─────────────────────────────────────────────────────────────────────────────
// buildOverlapAwareRevokeUpdate
//
// Builds an other_agencies update object that only clears flags for
// capabilities not granted by any remaining active entitlement.
// ─────────────────────────────────────────────────────────────────────────────
export function buildOverlapAwareRevokeUpdate(
  entitlementTypesToRevoke: string[],
  remainingCapabilities: Set<Capability>,
): Record<string, any> {
  const updates: Record<string, any> = {};

  for (const entType of entitlementTypesToRevoke) {
    const caps = getCapabilitiesForEntitlementType(entType);
    for (const cap of caps) {
      if (remainingCapabilities.has(cap)) {
        console.info(`[entitlementRevoke] Capability "${cap}" still granted by another active entitlement — skipping flag clear`);
        continue;
      }
      // Safe to clear
      for (const flag of CAPABILITY_FLAGS[cap]) {
        if (flag === 'is_paid_listing') updates.is_paid_listing = false;
        else if (flag === 'paid_listing_type') updates.paid_listing_type = null;
        else if (flag === 'paid_listing_rank') updates.paid_listing_rank = null;
        else if (flag === 'availability_redirect_enabled') updates.availability_redirect_enabled = false;
        else if (flag === 'has_spotlight') updates.has_spotlight = false;
        else if (flag === 'has_card_visual_upgrade') updates.has_card_visual_upgrade = false;
        else if (flag === 'has_lead_matching_upgrade') updates.has_lead_matching_upgrade = false;
      }
    }
  }

  return updates;
}

// ─────────────────────────────────────────────────────────────────────────────
// releaseTop25SlotOnRevoke
//
// Releases a top25 slot using strict guards:
//   - Must match claimed_by_entitlement_id (when available)
//   - Must match stripe_subscription_id (when available)
//   - Must have is_paid=true (prevent double-release)
// If no matching row is found the release is silently skipped (idempotent).
// ─────────────────────────────────────────────────────────────────────────────
export async function releaseTop25SlotOnRevoke(
  supabase: SupabaseClient,
  entitlement: Pick<EntitlementRow, 'id' | 'agency_id' | 'top25_slot_id' | 'top25_rank' | 'state_slug' | 'stripe_subscription_id'>,
  reason: string,
): Promise<void> {
  const now = new Date().toISOString();
  const { top25_slot_id, state_slug, top25_rank, stripe_subscription_id } = entitlement;

  let query = supabase
    .from('top25_slots')
    .update({
      is_paid: false,
      is_available: true,
      slot_status: 'available',
      billing_status: 'expired',
      stripe_subscription_id: null,
      stripe_customer_id: null,
      lock_expires_at: null,
      lock_started_at: null,
      cancel_at_period_end: false,
      claimed_by_entitlement_id: null,
      last_billing_sync_at: now,
      status_reason: reason,
      status_updated_at: now,
      status_updated_by: 'entitlement_revoke',
      updated_at: now,
    })
    .eq('is_paid', true);

  if (top25_slot_id) {
    query = query.eq('id', top25_slot_id);
    query = query.eq('claimed_by_entitlement_id', entitlement.id);
  } else if (state_slug && top25_rank) {
    query = query.eq('state_slug', state_slug).eq('rank', top25_rank);
    if (stripe_subscription_id) {
      query = query.eq('stripe_subscription_id', stripe_subscription_id);
    }
  } else if (stripe_subscription_id) {
    query = query.eq('stripe_subscription_id', stripe_subscription_id);
  } else {
    console.warn('[entitlementRevoke] releaseTop25SlotOnRevoke: no identifiers — skipping');
    return;
  }

  const { data: released, error } = await query.select('id, rank, state_slug');

  if (error) {
    console.error('[entitlementRevoke] releaseTop25SlotOnRevoke error:', error.message);
    return;
  }

  for (const slot of released ?? []) {
    await supabase.from('slot_status_audit_log').insert({
      state_slug: slot.state_slug,
      rank: slot.rank,
      slot_id: slot.id,
      old_status: 'sold',
      new_status: 'available',
      changed_by: 'entitlement_revoke',
      reason,
      metadata: {
        agency_id: entitlement.agency_id,
        entitlement_id: entitlement.id,
        stripe_subscription_id: stripe_subscription_id ?? null,
      },
    });
  }

  if ((released ?? []).length > 0) {
    console.info(`[entitlementRevoke] Released ${released!.length} top25 slot(s): ${reason}`);
  } else {
    console.info(`[entitlementRevoke] No top25 slots matched strict guard — skipping release (idempotent)`);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// revokeEntitlementAndSync
//
// Central downgrade handler (single entitlement). Overlap-aware: checks
// remaining active entitlements before clearing any feature flags.
// ─────────────────────────────────────────────────────────────────────────────
export async function revokeEntitlementAndSync(
  supabase: SupabaseClient,
  entitlement: EntitlementRow,
  reason: string,
  finalStatus: 'expired' | 'canceled' = 'expired',
): Promise<void> {
  const now = new Date().toISOString();

  // 1. Deactivate the entitlement record
  await supabase
    .from('agency_listing_entitlements')
    .update({ is_active: false, status: finalStatus, ended_at: now, updated_at: now })
    .eq('id', entitlement.id);

  const agencyId = entitlement.agency_id;

  if (agencyId) {
    // 2. Determine remaining capabilities after this entitlement is gone
    const remainingCaps = await fetchActiveCapabilitiesForAgency(supabase, agencyId, [entitlement.id]);

    // 3. Build overlap-aware update: only clear flags not covered by remaining entitlements
    const agencyUpdates = buildOverlapAwareRevokeUpdate([entitlement.entitlement_type], remainingCaps);

    if (Object.keys(agencyUpdates).length > 0) {
      agencyUpdates.updated_at = now;
      const { error } = await supabase.from('other_agencies').update(agencyUpdates).eq('id', agencyId);
      if (error) {
        console.error(`[entitlementRevoke] other_agencies update error for ${agencyId}:`, error.message);
      }
    }
  }

  // 4. Release top25 slot (strict-guarded, idempotent)
  if (entitlement.entitlement_type === 'top25_slot' || entitlement.entitlement_type === 'top25_claim_bundle') {
    await releaseTop25SlotOnRevoke(supabase, entitlement, reason);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// revokeEntitlementsBatch
//
// Revoke multiple entitlements for a single subscription in one pass.
// Overlap-aware: checks remaining active entitlements per agency after
// removing all entitlements in this batch, then clears only safe flags.
// ─────────────────────────────────────────────────────────────────────────────
export async function revokeEntitlementsBatch(
  supabase: SupabaseClient,
  entitlements: EntitlementRow[],
  reason: string,
  finalStatus: 'expired' | 'canceled' = 'canceled',
): Promise<void> {
  if (!entitlements.length) return;

  const now = new Date().toISOString();
  const ids = entitlements.map(e => e.id);

  // Bulk mark all as inactive
  await supabase
    .from('agency_listing_entitlements')
    .update({ is_active: false, status: finalStatus, ended_at: now, updated_at: now })
    .in('id', ids);

  // Group by agency_id
  const byAgency = new Map<string, EntitlementRow[]>();
  for (const ent of entitlements) {
    if (!ent.agency_id) continue;
    if (!byAgency.has(ent.agency_id)) byAgency.set(ent.agency_id, []);
    byAgency.get(ent.agency_id)!.push(ent);
  }

  for (const [agencyId, agencyEnts] of byAgency) {
    // Determine remaining capabilities after ALL entitlements in this batch are gone
    const remainingCaps = await fetchActiveCapabilitiesForAgency(supabase, agencyId, ids);

    const entTypesBeingRevoked = agencyEnts.map(e => e.entitlement_type);
    const agencyUpdates = buildOverlapAwareRevokeUpdate(entTypesBeingRevoked, remainingCaps);

    if (Object.keys(agencyUpdates).length > 0) {
      agencyUpdates.updated_at = now;
      const { error } = await supabase.from('other_agencies').update(agencyUpdates).eq('id', agencyId);
      if (error) {
        console.error(`[entitlementRevoke] batch other_agencies update error for ${agencyId}:`, error.message);
      }
    }

    // Release top25 slots per entitlement (strict guards applied per slot)
    for (const ent of agencyEnts.filter(e => e.entitlement_type === 'top25_slot' || e.entitlement_type === 'top25_claim_bundle')) {
      await releaseTop25SlotOnRevoke(supabase, ent, reason);
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// fallbackCleanupBySubscriptionId
//
// Safe idempotent fallback cleanup keyed by stripe_subscription_id.
// Used when customer.subscription.deleted fires but active entitlements
// were already revoked. Catches stale top25 lock/flags left behind.
//
// Safety guarantees:
//   - Only touches entitlements/slots linked to the given subscription id
//   - Does NOT release slots without strict linkage match
//   - Overlap-aware agency flag sync
//   - Idempotent (safe to call multiple times)
// ─────────────────────────────────────────────────────────────────────────────
export async function fallbackCleanupBySubscriptionId(
  supabase: SupabaseClient,
  subscriptionId: string,
  reason: string,
): Promise<void> {
  const now = new Date().toISOString();

  // Fetch all entitlements for this sub (including already-inactive)
  const { data: allEnts, error: fetchErr } = await supabase
    .from('agency_listing_entitlements')
    .select('id, entitlement_type, agency_id, state_slug, top25_slot_id, top25_rank, stripe_subscription_id, source_listing_type, is_active, status')
    .eq('stripe_subscription_id', subscriptionId);

  if (fetchErr) {
    console.error(`[entitlementRevoke] fallbackCleanup: fetch error for sub ${subscriptionId}:`, fetchErr.message);
    return;
  }

  if (!allEnts?.length) {
    // No entitlement record at all — only touch slots directly linked to this subscription
    const { data: linkedSlots } = await supabase
      .from('top25_slots')
      .select('id, rank, state_slug, is_paid, claimed_by_entitlement_id, stripe_subscription_id')
      .eq('stripe_subscription_id', subscriptionId);

    for (const slot of linkedSlots ?? []) {
      if (!slot.is_paid) continue;
      // No entitlement record exists — log mismatch, do not release
      console.warn(`[entitlementRevoke] fallbackCleanup: slot ${slot.id} (${slot.state_slug} rank ${slot.rank}) is paid but no entitlement found for sub ${subscriptionId} — manual review required`);
      await supabase.from('slot_status_audit_log').insert({
        state_slug: slot.state_slug,
        rank: slot.rank,
        slot_id: slot.id,
        old_status: 'sold',
        new_status: 'mismatch_no_entitlement',
        changed_by: 'entitlement_revoke_fallback',
        reason: `No entitlement record for subscription ${subscriptionId}`,
        metadata: { subscription_id: subscriptionId },
      });
    }
    return;
  }

  // Ensure all entitlements are marked inactive
  const activeEnts = allEnts.filter(e => e.is_active);
  if (activeEnts.length > 0) {
    await supabase
      .from('agency_listing_entitlements')
      .update({ is_active: false, status: 'canceled', ended_at: now, updated_at: now })
      .in('id', activeEnts.map(e => e.id));
    console.info(`[entitlementRevoke] fallbackCleanup: deactivated ${activeEnts.length} still-active entitlements for sub ${subscriptionId}`);
  }

  // Per-agency overlap-aware flag sync
  const allIds = allEnts.map(e => e.id);
  const byAgency = new Map<string, typeof allEnts>();
  for (const ent of allEnts) {
    if (!ent.agency_id) continue;
    if (!byAgency.has(ent.agency_id)) byAgency.set(ent.agency_id, []);
    byAgency.get(ent.agency_id)!.push(ent);
  }

  for (const [agencyId, agencyEnts] of byAgency) {
    const remainingCaps = await fetchActiveCapabilitiesForAgency(supabase, agencyId, allIds);
    const entTypesBeingRevoked = agencyEnts.map(e => e.entitlement_type);
    const agencyUpdates = buildOverlapAwareRevokeUpdate(entTypesBeingRevoked, remainingCaps);

    if (Object.keys(agencyUpdates).length > 0) {
      agencyUpdates.updated_at = now;
      await supabase.from('other_agencies').update(agencyUpdates).eq('id', agencyId);
    }

    // Attempt strict-guarded top25 slot release
    for (const ent of agencyEnts.filter(e => e.entitlement_type === 'top25_slot' || e.entitlement_type === 'top25_claim_bundle')) {
      // Verify linkage integrity before release
      if (ent.top25_slot_id) {
        const { data: slot } = await supabase
          .from('top25_slots')
          .select('id, is_paid, claimed_by_entitlement_id, stripe_subscription_id')
          .eq('id', ent.top25_slot_id)
          .maybeSingle();

        if (!slot) {
          console.info(`[entitlementRevoke] fallbackCleanup: slot ${ent.top25_slot_id} not found — already removed`);
          continue;
        }

        if (!slot.is_paid) {
          console.info(`[entitlementRevoke] fallbackCleanup: slot ${slot.id} already released (is_paid=false)`);
          continue;
        }

        const subMatches = slot.stripe_subscription_id === subscriptionId;
        const entMatches = slot.claimed_by_entitlement_id === ent.id || slot.claimed_by_entitlement_id === null;

        if (!subMatches) {
          console.warn(`[entitlementRevoke] fallbackCleanup: slot ${slot.id} subscription mismatch (slot has ${slot.stripe_subscription_id}, expected ${subscriptionId}) — skipping release, requires manual review`);
          await supabase.from('slot_status_audit_log').insert({
            state_slug: ent.state_slug,
            rank: ent.top25_rank,
            slot_id: slot.id,
            old_status: 'sold',
            new_status: 'mismatch_subscription_id',
            changed_by: 'entitlement_revoke_fallback',
            reason: `Subscription ID mismatch during fallback cleanup`,
            metadata: { expected_sub: subscriptionId, actual_sub: slot.stripe_subscription_id, entitlement_id: ent.id },
          });
          continue;
        }

        if (!entMatches) {
          console.warn(`[entitlementRevoke] fallbackCleanup: slot ${slot.id} entitlement linkage mismatch — skipping release`);
          continue;
        }
      }

      await releaseTop25SlotOnRevoke(supabase, ent as EntitlementRow, reason);
    }
  }

  console.info(`[entitlementRevoke] fallbackCleanup complete for sub ${subscriptionId}: ${allEnts.length} entitlement(s) processed`);
}

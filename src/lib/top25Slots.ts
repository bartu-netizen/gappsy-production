import { supabase } from './supabase';

export type SlotStatus = 'available' | 'locked' | 'reserved' | 'sold';

export interface Top25Slot {
  id: string;
  state_slug: string;
  rank: number;
  is_paid: boolean;
  slot_status: SlotStatus;
  claimed_at: string | null;
  created_at: string;
  status_reason?: string | null;
  sale_source?: string | null;
}

export interface AvailabilityResult {
  slots: Top25Slot[];
  error: string | null;
  fetchFailed: boolean;
}

/**
 * Determines if a slot is truly sold (paid).
 * Rank #1 is always treated as sold regardless of DB flags.
 */
export function isPaidSlot(slot: { rank: number; is_paid: boolean }): boolean {
  return slot.rank === 1 || slot.is_paid === true;
}

/**
 * Determines if a slot is available for purchase.
 * A slot is available ONLY when slot_status='available', rank != 1, and is_paid=false.
 */
export function isSlotAvailable(slot: { rank: number; is_paid: boolean; slot_status?: SlotStatus }): boolean {
  if (slot.rank === 1) return false;
  if (slot.is_paid) return false;
  if (slot.slot_status && slot.slot_status !== 'available') return false;
  return true;
}

/**
 * Get available Top 25 slots for a state.
 * Returns an AvailabilityResult so callers can distinguish "no slots" from "fetch failed".
 * Uses slot_status='available' as the canonical availability check.
 */
export async function getAvailableTop25SlotsForState(stateSlug: string): Promise<AvailabilityResult> {
  try {
    const { data, error } = await supabase
      .from('top25_slots')
      .select('*')
      .eq('state_slug', stateSlug)
      .eq('slot_status', 'available')
      .neq('rank', 1)
      .order('rank', { ascending: true });

    if (error) {
      console.error('[top25Slots] Error fetching available slots:', error);
      return { slots: [], error: error.message, fetchFailed: true };
    }

    const slots = (data ?? []).filter(s => s.rank !== 1 && !s.is_paid);
    console.log(`[top25Slots] Found ${slots.length} available slots for ${stateSlug}`);
    return { slots, error: null, fetchFailed: false };
  } catch (err: any) {
    console.error('[top25Slots] Unexpected error fetching available slots:', err);
    return { slots: [], error: err?.message ?? 'Unknown error', fetchFailed: true };
  }
}

export async function getAllTop25SlotsForState(stateSlug: string): Promise<Top25Slot[]> {
  try {
    const { data, error } = await supabase
      .from('top25_slots')
      .select('*')
      .eq('state_slug', stateSlug)
      .order('rank', { ascending: true });

    if (error) {
      console.error('Error fetching all top 25 slots:', error);
      return [];
    }

    return data ?? [];
  } catch (err) {
    console.error('Unexpected error fetching all top 25 slots:', err);
    return [];
  }
}

/**
 * Smart Routing Orchestration
 *
 * Client-side helpers for creating and managing discount/upgrade offers
 * in smart routing flows. Reuses existing backend logic.
 */

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;

export interface DiscountOfferParams {
  agency_id: string;
  agency_slug?: string;
  state_slug?: string;
  discount_type: 'percentage' | 'fixed';
  discount_value: number;
  allowed_products?: string[];
  expires_at?: string;
  max_uses?: number;
  created_by?: string;
  internal_note?: string;
}

export interface UpgradeOfferParams {
  agency_id: string;
  agency_name: string;
  state_slug: string;
  old_subscription_id?: string;
  target_rank: number;
  extra_discount_cents?: number;
  notes?: string;
  created_by_admin?: string;
}

/**
 * Ensure a discount offer exists for this agency/lead
 * Reuses existing discount-offer-create logic
 */
export async function ensureDiscountOffer(
  params: DiscountOfferParams,
  adminToken: string
): Promise<{ ok: boolean; url?: string; offer_id?: string; error?: string }> {
  try {
    const response = await fetch(`${SUPABASE_URL}/functions/v1/discount-offer-create`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-admin-token': adminToken,
      },
      body: JSON.stringify(params),
    });

    const data = await response.json();

    if (!response.ok) {
      return { ok: false, error: data.error || 'Failed to create discount offer' };
    }

    return {
      ok: true,
      url: data.offer?.url,
      offer_id: data.offer?.id,
    };
  } catch (error) {
    return {
      ok: false,
      error: error instanceof Error ? error.message : 'Network error',
    };
  }
}

/**
 * Ensure an upgrade offer exists for this agency/lead
 * Reuses existing upgrade-offer-create logic
 */
export async function ensureUpgradeOffer(
  params: UpgradeOfferParams,
  adminToken: string
): Promise<{ ok: boolean; checkout_url?: string; offer_id?: string; error?: string }> {
  try {
    const response = await fetch(`${SUPABASE_URL}/functions/v1/upgrade-offer-create`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-admin-token': adminToken,
      },
      body: JSON.stringify(params),
    });

    const data = await response.json();

    if (!response.ok) {
      return { ok: false, error: data.error || 'Failed to create upgrade offer' };
    }

    return {
      ok: true,
      checkout_url: data.checkout_url,
      offer_id: data.offer_id,
    };
  } catch (error) {
    return {
      ok: false,
      error: error instanceof Error ? error.message : 'Network error',
    };
  }
}

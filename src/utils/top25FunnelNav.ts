import type { NavigateFunction } from 'react-router-dom';
import type { Top25CheckoutData } from '../contexts/Top25CheckoutContext';

/**
 * URL param keys for the Top-25 confirm page.
 * These are encoded into the URL so the page survives refresh / direct open.
 */
const PARAM_KEYS = {
  stateSlug: 'state',
  stateName: 'stateName',
  selectedRank: 'rank',
  listingTier: 'tier',
  listingType: 'listingType',
  agencyName: 'agencyName',
  agencyWebsite: 'agencyWebsite',
  agencyDescription: 'agencyDesc',
  agencyServices: 'services',
  agencyId: 'agencyId',
  top25SlotId: 'slotId',
  logoUrl: 'logoUrl',
  creditCents: 'credit',
  extraDiscountCents: 'extra_discount',
  upgradeOfferId: 'offer_id',
} as const;

/**
 * Encode Top25CheckoutData into URLSearchParams for the confirm page.
 */
export function encodeTop25ConfirmParams(data: Top25CheckoutData): URLSearchParams {
  const p = new URLSearchParams();
  p.set(PARAM_KEYS.stateSlug, data.stateSlug);
  p.set(PARAM_KEYS.stateName, data.stateName);
  if (data.selectedRank !== null && data.selectedRank !== undefined) {
    p.set(PARAM_KEYS.selectedRank, String(data.selectedRank));
  }
  p.set(PARAM_KEYS.listingTier, data.listingTier);
  p.set(PARAM_KEYS.listingType, data.listingType);
  p.set(PARAM_KEYS.agencyName, data.agencyName);
  if (data.agencyWebsite) p.set(PARAM_KEYS.agencyWebsite, data.agencyWebsite);
  if (data.agencyDescription) p.set(PARAM_KEYS.agencyDescription, data.agencyDescription);
  if (data.agencyServices?.length) p.set(PARAM_KEYS.agencyServices, data.agencyServices.join(','));
  if (data.agencyId) p.set(PARAM_KEYS.agencyId, data.agencyId);
  if (data.top25SlotId) p.set(PARAM_KEYS.top25SlotId, data.top25SlotId);
  if (data.logoUrl) p.set(PARAM_KEYS.logoUrl, data.logoUrl);
  if (data.creditCents) p.set(PARAM_KEYS.creditCents, String(data.creditCents));
  if (data.extraDiscountCents) p.set(PARAM_KEYS.extraDiscountCents, String(data.extraDiscountCents));
  if (data.upgradeOfferId) p.set(PARAM_KEYS.upgradeOfferId, data.upgradeOfferId);
  return p;
}

/**
 * Decode Top25CheckoutData from URLSearchParams (from the confirm page URL).
 * Returns null if required params are missing.
 */
export function decodeTop25ConfirmParams(params: URLSearchParams): Top25CheckoutData | null {
  const stateSlug = params.get(PARAM_KEYS.stateSlug);
  const stateName = params.get(PARAM_KEYS.stateName);
  const listingTier = params.get(PARAM_KEYS.listingTier);
  const listingType = params.get(PARAM_KEYS.listingType);
  const agencyName = params.get(PARAM_KEYS.agencyName);

  if (!stateSlug || !stateName || !listingTier || !listingType || !agencyName) {
    return null;
  }

  const rankRaw = params.get(PARAM_KEYS.selectedRank);
  const selectedRank = rankRaw ? parseInt(rankRaw, 10) : null;
  const servicesRaw = params.get(PARAM_KEYS.agencyServices);

  return {
    stateSlug,
    stateName,
    selectedRank,
    listingTier: listingTier as Top25CheckoutData['listingTier'],
    listingType: listingType as Top25CheckoutData['listingType'],
    agencyName,
    agencyWebsite: params.get(PARAM_KEYS.agencyWebsite) ?? '',
    agencyDescription: params.get(PARAM_KEYS.agencyDescription) ?? '',
    agencyServices: servicesRaw ? servicesRaw.split(',').filter(Boolean) : [],
    agencyId: params.get(PARAM_KEYS.agencyId) ?? undefined,
    top25SlotId: params.get(PARAM_KEYS.top25SlotId) ?? undefined,
    logoUrl: params.get(PARAM_KEYS.logoUrl) ?? undefined,
    creditCents: (() => { const v = params.get(PARAM_KEYS.creditCents); return v ? Math.round(parseFloat(v)) : undefined; })(),
    extraDiscountCents: (() => { const v = params.get(PARAM_KEYS.extraDiscountCents); return v ? Math.round(parseFloat(v)) : undefined; })(),
    upgradeOfferId: params.get(PARAM_KEYS.upgradeOfferId) ?? undefined,
  };
}

/**
 * The single shared entry point for navigating to /top-25/confirm.
 *
 * - Sets checkout data in context (so confirm page has it immediately)
 * - Also encodes all data as URL params (so confirm page survives refresh)
 * - Validates required inputs before navigating; logs warning in dev if invalid
 */
export function navigateToTop25Confirm(
  navigate: NavigateFunction,
  setCheckoutData: (data: Top25CheckoutData) => void,
  data: Top25CheckoutData,
): void {
  const missing: string[] = [];
  if (!data.stateSlug) missing.push('stateSlug');
  if (!data.stateName) missing.push('stateName');
  if (!data.listingTier) missing.push('listingTier');
  if (!data.listingType) missing.push('listingType');
  if (!data.agencyName) missing.push('agencyName');

  if (missing.length > 0) {
    if (import.meta.env.DEV) {
      console.warn('[Top25Funnel] navigateToTop25Confirm called with missing fields:', missing, data);
    }
  }

  setCheckoutData(data);

  const params = encodeTop25ConfirmParams(data);
  navigate(`/top-25/confirm?${params.toString()}`);
}

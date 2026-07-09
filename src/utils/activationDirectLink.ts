/**
 * Single source of truth for the direct activation upgrade link (frontend).
 *
 * Returns the long fallback-rich URL format so activation pages always render
 * correctly even when canonical lookup is slow or unavailable:
 *   /activation/upgrade?agencyId=...&agencyName=...&stateName=...&stateSlug=...
 *                       &agencyWebsite=...&agencyDescription=...
 *
 * agencyId, agencyName, stateName, stateSlug are required.
 * agencyWebsite and agencyDescription are optional (empty string if missing).
 *
 * The destination page (ActivationUpgradePage) hydrates anything missing from
 * the canonical resolver and fires `activation_page_viewed` on load.
 *
 * Returns null when required fields are missing.
 */
export interface ActivationDirectLinkParams {
  agencyId: string | null | undefined;
  stateSlug: string | null | undefined;
  agencyName?: string | null | undefined;
  stateName?: string | null | undefined;
  agencyWebsite?: string | null | undefined;
  agencyDescription?: string | null | undefined;
}

export function buildActivationDirectLink(p: ActivationDirectLinkParams): string | null {
  const agencyId = (p.agencyId ?? '').toString().trim();
  const stateSlug = (p.stateSlug ?? '').toString().trim();
  const agencyName = (p.agencyName ?? '').toString().trim();
  const stateName = (p.stateName ?? '').toString().trim();
  const agencyWebsite = (p.agencyWebsite ?? '').toString().trim();
  const agencyDescription = (p.agencyDescription ?? '').toString().trim();

  if (!agencyId || !stateSlug || !agencyName || !stateName) return null;

  const params = new URLSearchParams();
  params.set('agencyId', agencyId);
  params.set('agencyName', agencyName);
  params.set('stateName', stateName);
  params.set('stateSlug', stateSlug);
  params.set('agencyWebsite', agencyWebsite);
  params.set('agencyDescription', agencyDescription);

  return `/activation/upgrade?${params.toString()}`;
}

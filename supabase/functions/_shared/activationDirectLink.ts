const BASE_URL = "https://www.gappsy.com";

export interface ActivationDirectLinkParams {
  agencyId: string | null | undefined;
  stateSlug: string | null | undefined;
  agencyName?: string | null | undefined;
  stateName?: string | null | undefined;
  agencyWebsite?: string | null | undefined;
  agencyDescription?: string | null | undefined;
}

/**
 * Single source of truth for the direct (no-discount) activation upgrade link.
 *
 * Emits the long fallback-rich URL so activation pages render correctly even
 * when the canonical agency resolver is slow or unavailable:
 *
 *   /activation/upgrade?agencyId=...&agencyName=...&stateName=...&stateSlug=...
 *                       &agencyWebsite=...&agencyDescription=...
 *
 * agencyId, agencyName, stateName, stateSlug are required.
 * agencyWebsite and agencyDescription are optional (empty string if missing).
 *
 * Returns null when required fields are missing.
 */
export function buildActivationDirectLink(p: ActivationDirectLinkParams): string | null {
  const agencyId = (p.agencyId ?? "").toString().trim();
  const stateSlug = (p.stateSlug ?? "").toString().trim();
  const agencyName = (p.agencyName ?? "").toString().trim();
  const stateName = (p.stateName ?? "").toString().trim();
  const agencyWebsite = (p.agencyWebsite ?? "").toString().trim();
  const agencyDescription = (p.agencyDescription ?? "").toString().trim();

  if (!agencyId || !stateSlug || !agencyName || !stateName) return null;

  const params = new URLSearchParams();
  params.set("agencyId", agencyId);
  params.set("agencyName", agencyName);
  params.set("stateName", stateName);
  params.set("stateSlug", stateSlug);
  params.set("agencyWebsite", agencyWebsite);
  params.set("agencyDescription", agencyDescription);

  return `${BASE_URL}/activation/upgrade?${params.toString()}`;
}

/**
 * Feature flag: state-page availability host
 *
 * When ON  → Other Agencies "Check Availability" opens the funnel inline on the
 *             state page (hash/local-state host) instead of navigating to /availability/start.
 * When OFF → existing /availability/start navigation (safe default).
 *
 * Rollout: start with a small allowlist of state slugs, then set
 * ENABLE_ALL to true to roll out everywhere.
 */

// To rollback instantly: set ENABLE_ALL back to false
export const AVAILABILITY_HOST_FLAG = {
  ENABLE_ALL: true,

  // ENABLED_SLUGS is only used when ENABLE_ALL is false.
  // With ENABLE_ALL: true this list is ignored — kept here for easy rollback to partial rollout.
  ENABLED_SLUGS: [] as string[],
} as const;

export function isStatepageAvailabilityEnabled(stateSlug: string): boolean {
  if (AVAILABILITY_HOST_FLAG.ENABLE_ALL) return true;
  return AVAILABILITY_HOST_FLAG.ENABLED_SLUGS.includes(stateSlug);
}

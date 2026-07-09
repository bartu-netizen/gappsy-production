export function getStateListingUrl(stateSlug: string | undefined | null): string {
  if (!stateSlug || stateSlug.trim() === '') {
    return '/marketing-agencies/';
  }

  // Return with trailing slash to match WordPress canonical structure
  return `/marketing-agencies-in-${stateSlug}-united-states/`;
}

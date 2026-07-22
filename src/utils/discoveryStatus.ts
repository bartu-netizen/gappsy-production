// Single source of truth for the Discovery Engine's discovered_tools.status
// pipeline. Mirrors utils/toolStatus.ts (the Tools system's equivalent) so
// the label/color for a given status never drifts between the Discovery
// Dashboard, Queue, Duplicate Manager, and Validation Results pages.
export const DISCOVERY_STATUSES = [
  { value: 'new', label: 'New', badgeClass: 'bg-gray-100 text-gray-600' },
  { value: 'validated', label: 'Validated', badgeClass: 'bg-sky-100 text-sky-800' },
  { value: 'needs_review', label: 'Needs Review', badgeClass: 'bg-amber-100 text-amber-800' },
  { value: 'duplicate', label: 'Duplicate', badgeClass: 'bg-orange-100 text-orange-700' },
  { value: 'rejected', label: 'Rejected', badgeClass: 'bg-red-100 text-red-700' },
  { value: 'approved_for_crawl', label: 'Approved For Crawl', badgeClass: 'bg-emerald-100 text-emerald-800' },
  { value: 'crawled', label: 'Crawled', badgeClass: 'bg-violet-100 text-violet-700' },
] as const;

export type DiscoveryStatus = typeof DISCOVERY_STATUSES[number]['value'];

const BY_VALUE = new Map(DISCOVERY_STATUSES.map((s) => [s.value, s]));

export function discoveryStatusLabel(status: string): string {
  return BY_VALUE.get(status as DiscoveryStatus)?.label || status;
}

export function discoveryStatusBadgeClass(status: string): string {
  return BY_VALUE.get(status as DiscoveryStatus)?.badgeClass || 'bg-gray-100 text-gray-600';
}

export function scoreBadgeClass(score: number | null): string {
  if (score === null) return 'bg-gray-100 text-gray-400';
  if (score >= 80) return 'bg-emerald-100 text-emerald-700';
  if (score >= 50) return 'bg-amber-100 text-amber-700';
  return 'bg-red-100 text-red-600';
}

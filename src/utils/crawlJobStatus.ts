// Single source of truth for crawl_jobs.status, mirroring the
// toolStatus.ts / discoveryStatus.ts pattern.
export const CRAWL_JOB_STATUSES = [
  { value: 'queued', label: 'Queued', badgeClass: 'bg-amber-100 text-amber-700' },
  { value: 'starting', label: 'Starting', badgeClass: 'bg-blue-100 text-blue-700' },
  { value: 'crawling', label: 'Crawling', badgeClass: 'bg-blue-100 text-blue-700' },
  { value: 'extracting', label: 'Extracting', badgeClass: 'bg-blue-100 text-blue-700' },
  { value: 'completed', label: 'Completed', badgeClass: 'bg-emerald-100 text-emerald-700' },
  { value: 'needs_review', label: 'Needs Review', badgeClass: 'bg-violet-100 text-violet-700' },
  { value: 'failed', label: 'Failed', badgeClass: 'bg-red-100 text-red-700' },
  { value: 'cancelled', label: 'Cancelled', badgeClass: 'bg-gray-200 text-gray-600' },
] as const;

export type CrawlJobStatus = typeof CRAWL_JOB_STATUSES[number]['value'];

const BY_VALUE = new Map(CRAWL_JOB_STATUSES.map((s) => [s.value, s]));

export function crawlJobStatusLabel(status: string): string {
  return BY_VALUE.get(status as CrawlJobStatus)?.label || status;
}
export function crawlJobStatusBadgeClass(status: string): string {
  return BY_VALUE.get(status as CrawlJobStatus)?.badgeClass || 'bg-gray-100 text-gray-600';
}
export const CRAWL_ACTIVE_STATUSES: CrawlJobStatus[] = ['queued', 'starting', 'crawling', 'extracting'];

// Single source of truth for AI Enrichment Engine status labels/badges,
// mirroring the crawlJobStatus.ts / discoveryStatus.ts pattern.

export const ENRICHMENT_BATCH_STATUSES = [
  { value: 'queued', label: 'Queued', badgeClass: 'bg-amber-100 text-amber-700' },
  { value: 'exported', label: 'Exported', badgeClass: 'bg-blue-100 text-blue-700' },
  { value: 'importing', label: 'Importing', badgeClass: 'bg-blue-100 text-blue-700' },
  { value: 'completed', label: 'Completed', badgeClass: 'bg-emerald-100 text-emerald-700' },
  { value: 'partially_completed', label: 'Partially Completed', badgeClass: 'bg-orange-100 text-orange-700' },
  { value: 'failed', label: 'Failed', badgeClass: 'bg-red-100 text-red-700' },
  { value: 'cancelled', label: 'Cancelled', badgeClass: 'bg-gray-200 text-gray-600' },
] as const;

export const ENRICHMENT_JOB_STATUSES = [
  { value: 'queued', label: 'Queued', badgeClass: 'bg-amber-100 text-amber-700' },
  { value: 'exported', label: 'Exported', badgeClass: 'bg-blue-100 text-blue-700' },
  { value: 'needs_review', label: 'Needs Review', badgeClass: 'bg-violet-100 text-violet-700' },
  { value: 'applied', label: 'Applied', badgeClass: 'bg-emerald-100 text-emerald-700' },
  { value: 'failed', label: 'Failed', badgeClass: 'bg-red-100 text-red-700' },
  { value: 'cancelled', label: 'Cancelled', badgeClass: 'bg-gray-200 text-gray-600' },
] as const;

export const SUGGESTION_REVIEW_STATUSES = [
  { value: 'pending', label: 'Pending', badgeClass: 'bg-amber-100 text-amber-700' },
  { value: 'approved', label: 'Approved', badgeClass: 'bg-emerald-100 text-emerald-700' },
  { value: 'rejected', label: 'Rejected', badgeClass: 'bg-red-100 text-red-700' },
  { value: 'edited', label: 'Edited', badgeClass: 'bg-blue-100 text-blue-700' },
  { value: 'unsupported', label: 'Unsupported', badgeClass: 'bg-gray-200 text-gray-600' },
] as const;

function byValue<T extends { value: string; label: string; badgeClass: string }>(list: readonly T[]) {
  return new Map(list.map((s) => [s.value, s]));
}

const BATCH_BY_VALUE = byValue(ENRICHMENT_BATCH_STATUSES);
const JOB_BY_VALUE = byValue(ENRICHMENT_JOB_STATUSES);
const SUGGESTION_BY_VALUE = byValue(SUGGESTION_REVIEW_STATUSES);

export function enrichmentBatchStatusLabel(status: string): string {
  return BATCH_BY_VALUE.get(status)?.label || status;
}
export function enrichmentBatchStatusBadgeClass(status: string): string {
  return BATCH_BY_VALUE.get(status)?.badgeClass || 'bg-gray-100 text-gray-600';
}
export function enrichmentJobStatusLabel(status: string): string {
  return JOB_BY_VALUE.get(status)?.label || status;
}
export function enrichmentJobStatusBadgeClass(status: string): string {
  return JOB_BY_VALUE.get(status)?.badgeClass || 'bg-gray-100 text-gray-600';
}
export function suggestionStatusLabel(status: string): string {
  return SUGGESTION_BY_VALUE.get(status)?.label || status;
}
export function suggestionStatusBadgeClass(status: string): string {
  return SUGGESTION_BY_VALUE.get(status)?.badgeClass || 'bg-gray-100 text-gray-600';
}

export function confidenceBand(confidence: number): { label: string; className: string } {
  if (confidence >= 90) return { label: 'High', className: 'text-emerald-700 bg-emerald-50' };
  if (confidence >= 70) return { label: 'Medium', className: 'text-blue-700 bg-blue-50' };
  if (confidence >= 50) return { label: 'Low', className: 'text-amber-700 bg-amber-50' };
  return { label: 'Unsupported', className: 'text-gray-600 bg-gray-100' };
}

export const ENRICHMENT_ACTIVE_JOB_STATUSES = ['queued', 'exported'];
export const ENRICHMENT_ACTIVE_BATCH_STATUSES = ['queued', 'exported', 'importing'];

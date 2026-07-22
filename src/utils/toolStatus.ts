// Single source of truth for the tools.status pipeline (5 values, widened
// from the original 3 by the Publishing Engine migration). Used by the
// Tools list, the tool editor, and the Publishing Queue so the label/color
// for a given status never drifts between pages.
export const TOOL_STATUSES = [
  { value: 'draft', label: 'Draft', badgeClass: 'bg-gray-100 text-gray-600' },
  { value: 'needs_review', label: 'Needs Review', badgeClass: 'bg-amber-100 text-amber-800' },
  { value: 'ready_to_publish', label: 'Ready to Publish', badgeClass: 'bg-sky-100 text-sky-800' },
  { value: 'published', label: 'Published', badgeClass: 'bg-green-100 text-green-800' },
  { value: 'archived', label: 'Archived', badgeClass: 'bg-slate-200 text-slate-600' },
] as const;

export type ToolStatus = typeof TOOL_STATUSES[number]['value'];

const BY_VALUE = new Map(TOOL_STATUSES.map((s) => [s.value, s]));

export function toolStatusLabel(status: string): string {
  return BY_VALUE.get(status as ToolStatus)?.label || status;
}

export function toolStatusBadgeClass(status: string): string {
  return BY_VALUE.get(status as ToolStatus)?.badgeClass || 'bg-gray-100 text-gray-600';
}

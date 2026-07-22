import { Fragment, useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {
  ArrowLeft, Search, ChevronLeft, ChevronRight, ChevronDown, ChevronUp,
  Workflow, RotateCcw, Ban, Loader2, ExternalLink, PencilLine,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

type ImportStatus =
  | 'pending' | 'success' | 'failed'
  | 'queued' | 'fetching' | 'extracting' | 'review_required' | 'ready' | 'published' | 'cancelled';

interface ImportQueueRow {
  id: string;
  tool_id: string | null;
  source: string;
  source_url: string | null;
  status: ImportStatus;
  progress: number;
  pages_processed: number;
  created_by: string | null;
  imported_sections: string[];
  errors: string[];
  credits_used: number;
  started_at: string;
  completed_at: string | null;
  created_at: string;
  tools: { id: string; slug: string; name: string; logo: string | null; status: string } | null;
}

interface ListResponse { ok: boolean; data: ImportQueueRow[]; total: number; page: number; per_page: number; }
interface RetryResponse { ok: boolean; data: ImportQueueRow; }
interface CancelResponse { ok: boolean; }

const PER_PAGE = 25;
const DEBOUNCE_MS = 300;

const SOURCE_LABELS: Record<string, string> = { wizard: 'New Software Wizard', bulk: 'Bulk Import', api: 'API' };

// Import-job status — distinct from a tool's publishing stage, which lives in
// utils/toolStatus. 'pending'/'success' are legacy values from before this
// lifecycle vocabulary existed; still handled here for old rows.
const STATUS_LABELS: Record<ImportStatus, string> = {
  pending: 'Pending', success: 'Success', failed: 'Failed',
  queued: 'Queued', fetching: 'Fetching', extracting: 'Extracting',
  review_required: 'Review Required', ready: 'Ready', published: 'Published', cancelled: 'Cancelled',
};

// Chip order mirrors the job lifecycle: in-flight states first, then the two
// terminal "needs a decision" states, then fully-done states.
const STATUS_CHIPS: { value: string; label: string }[] = [
  { value: 'all', label: 'All' },
  { value: 'queued', label: 'Queued' },
  { value: 'fetching', label: 'Fetching' },
  { value: 'extracting', label: 'Extracting' },
  { value: 'review_required', label: 'Review Required' },
  { value: 'ready', label: 'Ready' },
  { value: 'failed', label: 'Failed' },
  { value: 'cancelled', label: 'Cancelled' },
  { value: 'published', label: 'Published' },
];

function importStatusBadgeClass(status: ImportStatus): string {
  switch (status) {
    case 'success':
    case 'ready':
    case 'published': return 'bg-emerald-100 text-emerald-700';
    case 'failed': return 'bg-red-100 text-red-700';
    case 'cancelled': return 'bg-gray-200 text-gray-600';
    case 'pending':
    case 'queued': return 'bg-amber-100 text-amber-700';
    case 'fetching':
    case 'extracting': return 'bg-blue-100 text-blue-700';
    case 'review_required': return 'bg-violet-100 text-violet-700';
    default: return 'bg-gray-100 text-gray-600';
  }
}

function progressBarClass(status: ImportStatus): string {
  switch (status) {
    case 'failed': return 'bg-red-400';
    case 'cancelled': return 'bg-gray-300';
    case 'success':
    case 'ready':
    case 'published': return 'bg-emerald-500';
    case 'review_required': return 'bg-violet-500';
    default: return 'bg-blue-500';
  }
}

function formatDuration(startedAt: string, completedAt: string | null): string {
  if (!completedAt) return '—';
  const ms = new Date(completedAt).getTime() - new Date(startedAt).getTime();
  if (!Number.isFinite(ms) || ms < 0) return '—';
  const totalSeconds = Math.round(ms / 1000);
  if (totalSeconds < 60) return `${totalSeconds}s`;
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = totalSeconds % 60;
  return `${minutes}m ${seconds}s`;
}

function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

// Rows in a non-terminal state — the ones an admin can still act on (retry a
// failure, cancel a stuck queue entry). Terminal states (published, success,
// cancelled) are audit-only here; the full history lives on Import History.
const ACTIONABLE_RETRY: ImportStatus[] = ['failed', 'cancelled'];
const ACTIONABLE_CANCEL: ImportStatus[] = ['queued'];

// Live job-monitoring view over the same tool_import_history rows that
// Import History logs permanently. Import History is the audit trail of
// every attempt, ever; this page is "what needs my attention right now" —
// it surfaces progress and lets an admin retry a failed job or cancel a
// stuck queued one. Nothing in this codebase performs real fetching/
// extraction yet, so progress and status are rendered exactly as the API
// returns them — no simulated "processing..." animation.
export default function WpAdminImportQueuePage() {
  const [searchInput, setSearchInput] = useState('');
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState('all');
  const [page, setPage] = useState(1);
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const [retryingId, setRetryingId] = useState<string | null>(null);
  const [cancelingId, setCancelingId] = useState<string | null>(null);
  const [actionError, setActionError] = useState<string | null>(null);

  useEffect(() => {
    const timer = setTimeout(() => setSearch(searchInput.trim()), DEBOUNCE_MS);
    return () => clearTimeout(timer);
  }, [searchInput]);

  useEffect(() => { setPage(1); }, [search, statusFilter]);

  const listPath = () => {
    const params = new URLSearchParams();
    params.set('page', String(page));
    params.set('per_page', String(PER_PAGE));
    params.set('sort', 'created_at');
    params.set('dir', 'desc');
    if (search) params.set('q', search);
    if (statusFilter !== 'all') params.set('status', statusFilter);
    return `admin-import-history?${params.toString()}`;
  };

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);
  const { mutate: retryJob } = useAdminMutation<RetryResponse, { action: 'retry'; id: string }>('admin-import-history', 'POST');
  const { mutate: cancelJob } = useAdminMutation<CancelResponse, { id: string; status: 'cancelled' }>((v) => `admin-import-history?id=${v.id}`, 'PUT');

  const jobs = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  function toggleExpanded(id: string) {
    setExpandedId((prev) => (prev === id ? null : id));
  }

  async function handleRetry(id: string) {
    setActionError(null);
    setRetryingId(id);
    const result = await retryJob({ action: 'retry', id });
    setRetryingId(null);
    if (result.ok) {
      refetch();
    } else {
      setActionError(result.error?.message || 'Failed to retry this import.');
    }
  }

  async function handleCancel(id: string) {
    setActionError(null);
    setCancelingId(id);
    const result = await cancelJob({ id, status: 'cancelled' });
    setCancelingId(null);
    if (result.ok) {
      refetch();
    } else {
      setActionError(result.error?.message || 'Failed to cancel this import.');
    }
  }

  const emptyMessage = statusFilter === 'all'
    ? 'No imports yet — jobs created by the New Software wizard will show up here.'
    : 'No jobs match this filter.';

  return (
    <WpAdminLayout title="Import Queue" subtitle="Live import jobs and what needs your attention right now">
      <div className="max-w-7xl mx-auto">
        <Link to="/wp-admin/publishing" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Publishing
        </Link>

        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Import Queue</h1>
          <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} job{total === 1 ? '' : 's'}</p>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4 flex flex-wrap gap-3">
          <div className="flex-1 min-w-[200px] relative">
            <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              placeholder="Search by tool name or slug..."
              className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
          <div className="flex flex-wrap items-center gap-1.5">
            {STATUS_CHIPS.map((s) => (
              <button
                key={s.value}
                onClick={() => setStatusFilter(s.value)}
                className={`text-xs font-medium px-3 py-1.5 rounded-lg border transition ${
                  statusFilter === s.value
                    ? 'bg-gray-900 text-white border-gray-900'
                    : 'bg-white text-gray-600 border-gray-300 hover:bg-gray-50'
                }`}
              >
                {s.label}
              </button>
            ))}
          </div>
        </div>

        {actionError && (
          <div className="bg-red-50 border border-red-200 rounded-lg p-3 mb-4 text-sm text-red-700">
            {actionError}
          </div>
        )}

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading import queue..." />}

        {!isLoading && !isError && jobs.length === 0 && (
          <AdminEmptyState icon={Workflow} title="Nothing here" message={emptyMessage} />
        )}

        {!isLoading && jobs.length > 0 && (
          <>
            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Job</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Source URL</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Progress</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Timing</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Draft</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Errors</th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {jobs.map((job) => {
                    const isExpanded = expandedId === job.id;
                    const canRetry = ACTIONABLE_RETRY.includes(job.status);
                    const canCancel = ACTIONABLE_CANCEL.includes(job.status);
                    const isRetrying = retryingId === job.id;
                    const isCanceling = cancelingId === job.id;
                    return (
                      <Fragment key={job.id}>
                        <tr className="hover:bg-gray-50 transition-colors">
                          <td className="px-5 py-3.5">
                            {job.tools ? (
                              <div className="flex items-center gap-3">
                                {job.tools.logo ? (
                                  <img src={job.tools.logo} alt="" className="w-8 h-8 rounded-lg object-contain border border-gray-100 bg-white shrink-0" />
                                ) : (
                                  <div className="w-8 h-8 rounded-lg bg-gray-100 flex items-center justify-center text-gray-400 font-semibold text-xs shrink-0">
                                    {job.tools.name.charAt(0)}
                                  </div>
                                )}
                                <div className="min-w-0">
                                  <p className="font-semibold text-gray-900 text-sm truncate">{job.tools.name}</p>
                                  <p className="text-xs text-gray-400 truncate">{job.tools.slug}</p>
                                </div>
                              </div>
                            ) : (
                              <p className="text-sm text-gray-400 italic">— (no tool yet)</p>
                            )}
                          </td>
                          <td className="px-5 py-3.5 text-sm">
                            {job.source_url ? (
                              <a href={job.source_url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-blue-600 hover:underline truncate max-w-xs">
                                {job.source_url.replace(/^https?:\/\//, '')} <ExternalLink className="w-3 h-3 shrink-0" />
                              </a>
                            ) : (
                              <span className="text-gray-300">—</span>
                            )}
                          </td>
                          <td className="px-5 py-3.5">
                            <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${importStatusBadgeClass(job.status)}`}>
                              {STATUS_LABELS[job.status] || job.status}
                            </span>
                          </td>
                          <td className="px-5 py-3.5">
                            <div className="flex items-center gap-2 w-28">
                              <div className="flex-1 h-1.5 bg-gray-100 rounded-full overflow-hidden">
                                <div className={`h-full ${progressBarClass(job.status)}`} style={{ width: `${job.progress}%` }} />
                              </div>
                              <span className="text-xs text-gray-500 tabular-nums w-9 text-right">{job.progress}%</span>
                            </div>
                          </td>
                          <td className="px-5 py-3.5 text-sm text-gray-500">
                            <p>{formatDate(job.started_at)}</p>
                            <p className="text-xs text-gray-400">{formatDuration(job.started_at, job.completed_at)}</p>
                          </td>
                          <td className="px-5 py-3.5">
                            {job.tool_id ? (
                              <Link
                                to={`/wp-admin/tools/${job.tool_id}/edit`}
                                className="inline-flex items-center gap-1 text-sm text-blue-600 hover:underline"
                              >
                                <PencilLine className="w-3.5 h-3.5" />
                                Edit
                              </Link>
                            ) : (
                              <span className="text-gray-300 text-sm">—</span>
                            )}
                          </td>
                          <td className="px-5 py-3.5">
                            {job.errors.length > 0 ? (
                              <span className="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-red-100 text-red-700">
                                {job.errors.length} error{job.errors.length === 1 ? '' : 's'}
                              </span>
                            ) : (
                              <span className="text-gray-300 text-sm">—</span>
                            )}
                          </td>
                          <td className="px-5 py-3.5">
                            <div className="flex items-center justify-end gap-1">
                              {canRetry && (
                                <button
                                  onClick={() => handleRetry(job.id)}
                                  disabled={isRetrying}
                                  className="inline-flex items-center gap-1 px-2 py-1 text-xs font-medium text-blue-700 bg-blue-50 hover:bg-blue-100 rounded transition disabled:opacity-50 disabled:cursor-not-allowed"
                                  title="Retry this import"
                                >
                                  {isRetrying ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <RotateCcw className="w-3.5 h-3.5" />}
                                  Retry
                                </button>
                              )}
                              {canCancel && (
                                <button
                                  onClick={() => handleCancel(job.id)}
                                  disabled={isCanceling}
                                  className="inline-flex items-center gap-1 px-2 py-1 text-xs font-medium text-red-700 bg-red-50 hover:bg-red-100 rounded transition disabled:opacity-50 disabled:cursor-not-allowed"
                                  title="Cancel this queued import"
                                >
                                  {isCanceling ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <Ban className="w-3.5 h-3.5" />}
                                  Cancel
                                </button>
                              )}
                              <button
                                onClick={() => toggleExpanded(job.id)}
                                className="inline-flex items-center gap-1 p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                                title="View details"
                              >
                                {isExpanded ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
                              </button>
                            </div>
                          </td>
                        </tr>
                        {isExpanded && (
                          <tr className="bg-gray-50">
                            <td colSpan={8} className="px-5 py-4">
                              <div className="grid sm:grid-cols-3 gap-4">
                                <div>
                                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Job info</p>
                                  <ul className="text-sm text-gray-700 space-y-1">
                                    <li>Source: {SOURCE_LABELS[job.source] || job.source}</li>
                                    <li>Triggered by: {job.created_by || '—'}</li>
                                    <li>Pages processed: {job.pages_processed}</li>
                                    <li>Credits used: {job.credits_used}</li>
                                    <li>Finished: {job.completed_at ? formatDate(job.completed_at) : '—'}</li>
                                  </ul>
                                </div>
                                <div>
                                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Imported sections</p>
                                  {job.imported_sections.length > 0 ? (
                                    <ul className="text-sm text-gray-700 space-y-1">
                                      {job.imported_sections.map((section) => (
                                        <li key={section} className="flex items-center gap-1.5">
                                          <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0" />
                                          {section}
                                        </li>
                                      ))}
                                    </ul>
                                  ) : (
                                    <p className="text-sm text-gray-400">No sections recorded.</p>
                                  )}
                                </div>
                                <div>
                                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Errors</p>
                                  {job.errors.length > 0 ? (
                                    <ul className="text-sm text-red-700 space-y-1">
                                      {job.errors.map((err, idx) => (
                                        <li key={idx} className="flex items-start gap-1.5">
                                          <span className="w-1.5 h-1.5 rounded-full bg-red-500 shrink-0 mt-1.5" />
                                          <span>{err}</span>
                                        </li>
                                      ))}
                                    </ul>
                                  ) : (
                                    <p className="text-sm text-emerald-600">No errors.</p>
                                  )}
                                </div>
                              </div>
                            </td>
                          </tr>
                        )}
                      </Fragment>
                    );
                  })}
                </tbody>
              </table>
            </div>

            <div className="flex items-center justify-between mt-4">
              <p className="text-sm text-gray-500">Page {page} of {totalPages} &middot; {total.toLocaleString()} job{total === 1 ? '' : 's'}</p>
              <div className="flex items-center gap-2">
                <button onClick={() => setPage((p) => Math.max(1, p - 1))} disabled={page <= 1} className="inline-flex items-center gap-1 px-3 py-1.5 text-sm border border-gray-200 rounded-lg text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition">
                  <ChevronLeft className="w-4 h-4" /> Prev
                </button>
                <button onClick={() => setPage((p) => Math.min(totalPages, p + 1))} disabled={page >= totalPages} className="inline-flex items-center gap-1 px-3 py-1.5 text-sm border border-gray-200 rounded-lg text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition">
                  Next <ChevronRight className="w-4 h-4" />
                </button>
              </div>
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}

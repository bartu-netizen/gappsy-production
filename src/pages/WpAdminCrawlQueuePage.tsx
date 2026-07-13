import { useState } from 'react';
import { Link } from 'react-router-dom';
import {
  ChevronLeft, ChevronRight, ExternalLink, RotateCcw, Ban, Loader2, PencilLine, Radar,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { crawlJobStatusLabel, crawlJobStatusBadgeClass, type CrawlJobStatus } from '../utils/crawlJobStatus';

interface CandidateRef {
  id: string;
  name: string;
  official_website: string;
  status: string;
}

interface CrawlJobRow {
  id: string;
  discovery_candidate_id: string;
  requested_url: string;
  normalized_url: string | null;
  status: CrawlJobStatus;
  progress: number;
  started_at: string | null;
  completed_at: string | null;
  duration_ms: number | null;
  retry_count: number;
  error_code: string | null;
  error_message: string | null;
  crawl4ai_version: string | null;
  discovered_pages: number | null;
  crawled_pages: number | null;
  created_draft_tool_id: string | null;
  created_at: string;
  discovered_tools: CandidateRef | null;
}

interface ListResponse { ok: boolean; data: CrawlJobRow[]; total: number; page: number; page_size: number; }
interface MutateResponse { ok: boolean; data?: unknown; }

const PER_PAGE = 25;

const RUNNING_STATUSES: CrawlJobStatus[] = ['starting', 'crawling', 'extracting'];
const CANCELLABLE_STATUSES: CrawlJobStatus[] = ['queued', 'starting'];
const RETRYABLE_STATUSES: CrawlJobStatus[] = ['failed', 'cancelled'];

const STATUS_CHIPS: { value: string; label: string }[] = [
  { value: 'all', label: 'All' },
  { value: 'queued', label: 'Queued' },
  { value: 'running', label: 'Running' },
  { value: 'needs_review', label: 'Needs Review' },
  { value: 'completed', label: 'Completed' },
  { value: 'failed', label: 'Failed' },
  { value: 'cancelled', label: 'Cancelled' },
];

function formatDateTime(iso: string | null): string {
  if (!iso) return '—';
  return new Date(iso).toLocaleString('en-US', {
    month: 'short', day: 'numeric', year: 'numeric', hour: 'numeric', minute: '2-digit',
  });
}

function formatDuration(ms: number | null): string {
  if (ms == null) return '—';
  if (ms < 1000) return `${ms}ms`;
  const totalSeconds = ms / 1000;
  if (totalSeconds < 60) return `${totalSeconds.toFixed(1)}s`;
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = Math.round(totalSeconds % 60);
  return `${minutes}m ${seconds}s`;
}

// Crawl Queue — every crawl_jobs row (one per crawl attempt), independent of
// the per-candidate inline status shown in Discovery Queue. This is the
// ops-facing view: what's queued/running right now, what failed and needs a
// retry, and what already produced a tool draft.
export default function WpAdminCrawlQueuePage() {
  const [statusFilter, setStatusFilter] = useState('all');
  const [page, setPage] = useState(1);
  const [busyId, setBusyId] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);

  const listPath = () => {
    const params = new URLSearchParams();
    if (statusFilter === 'running') params.set('status', RUNNING_STATUSES.join(','));
    else if (statusFilter !== 'all') params.set('status', statusFilter);
    params.set('page', String(page));
    params.set('page_size', String(PER_PAGE));
    return `admin-crawl-jobs?${params.toString()}`;
  };

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);
  const { mutate: jobAction } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-crawl-jobs', 'POST');

  const rows = data?.data || [];
  const total = data?.total ?? 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  function handleFilterChange(value: string) {
    setStatusFilter(value);
    setPage(1);
  }

  async function handleRetry(jobId: string) {
    setBusyId(jobId);
    setMessage(null);
    const result = await jobAction({ action: 'retry', id: jobId });
    setBusyId(null);
    if (!result.ok) setMessage(result.error?.message || 'Failed to retry crawl.');
    refetch();
  }

  async function handleCancel(jobId: string) {
    setBusyId(jobId);
    setMessage(null);
    const result = await jobAction({ action: 'cancel', id: jobId });
    setBusyId(null);
    if (!result.ok) setMessage(result.error?.message || 'Failed to cancel crawl.');
    refetch();
  }

  const emptyMessage = statusFilter === 'all'
    ? 'No crawl jobs yet — start a crawl from an approved-for-crawl candidate in the Discovery Queue.'
    : 'No crawl jobs match this filter.';

  return (
    <WpAdminLayout title="Crawl Queue" subtitle="Every crawl attempt — queued, running, completed, failed, and retried">
      <div className="max-w-7xl mx-auto">
        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Crawl Queue</h1>
          <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} crawl job{total === 1 ? '' : 's'}</p>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4 flex flex-wrap items-center gap-1.5">
          {STATUS_CHIPS.map((s) => (
            <button
              key={s.value}
              onClick={() => handleFilterChange(s.value)}
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

        {message && (
          <div className="bg-gray-50 border border-gray-200 rounded-lg p-3 mb-4 text-sm text-gray-700">{message}</div>
        )}

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading crawl queue..." />}

        {!isLoading && !isError && rows.length === 0 && (
          <AdminEmptyState icon={Radar} title="Nothing here" message={emptyMessage} />
        )}

        {!isLoading && rows.length > 0 && (
          <>
            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Candidate</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Last Crawl</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Duration</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Pages</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Version</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Retries</th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {rows.map((job) => {
                    const isBusy = busyId === job.id;
                    const candidate = job.discovered_tools;
                    return (
                      <tr key={job.id} className="hover:bg-gray-50 transition-colors">
                        <td className="px-5 py-3.5">
                          <div className="min-w-0">
                            <p className="font-semibold text-gray-900 text-sm truncate">{candidate?.name || '—'}</p>
                            <a
                              href={job.normalized_url || job.requested_url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline truncate max-w-xs"
                            >
                              {job.normalized_url || job.requested_url} <ExternalLink className="w-3 h-3 shrink-0" />
                            </a>
                          </div>
                        </td>
                        <td className="px-5 py-3.5">
                          <div className="flex items-center gap-1.5">
                            <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${crawlJobStatusBadgeClass(job.status)}`}>
                              {crawlJobStatusLabel(job.status)}
                            </span>
                            {job.created_draft_tool_id && (
                              <Link
                                to={`/wp-admin/tools/${job.created_draft_tool_id}/edit`}
                                className="inline-flex items-center gap-1 text-xs font-medium text-blue-700 hover:underline"
                                title="View resulting tool draft"
                              >
                                <PencilLine className="w-3.5 h-3.5" /> Draft
                              </Link>
                            )}
                          </div>
                          {job.status === 'failed' && job.error_message && (
                            <p className="text-xs text-red-600 mt-1 max-w-xs truncate" title={job.error_message}>{job.error_message}</p>
                          )}
                        </td>
                        <td className="px-5 py-3.5 text-sm text-gray-500">{formatDateTime(job.started_at || job.completed_at)}</td>
                        <td className="px-5 py-3.5 text-sm text-gray-600">{formatDuration(job.duration_ms)}</td>
                        <td className="px-5 py-3.5 text-sm text-gray-600">
                          {job.crawled_pages ?? '—'}{job.discovered_pages != null ? ` / ${job.discovered_pages}` : ''}
                        </td>
                        <td className="px-5 py-3.5 text-sm text-gray-500">{job.crawl4ai_version || '—'}</td>
                        <td className="px-5 py-3.5 text-sm text-gray-600">{job.retry_count || 0}</td>
                        <td className="px-5 py-3.5">
                          <div className="flex items-center justify-end gap-1.5">
                            {isBusy && <Loader2 className="w-4 h-4 animate-spin text-gray-400" />}
                            {!isBusy && RETRYABLE_STATUSES.includes(job.status) && (
                              <button
                                onClick={() => handleRetry(job.id)}
                                className="inline-flex items-center gap-1 text-xs font-medium px-2 py-1 rounded bg-blue-50 text-blue-700 hover:bg-blue-100"
                              >
                                <RotateCcw className="w-3.5 h-3.5" /> Retry
                              </button>
                            )}
                            {!isBusy && CANCELLABLE_STATUSES.includes(job.status) && (
                              <button
                                onClick={() => handleCancel(job.id)}
                                className="inline-flex items-center gap-1 text-xs font-medium px-2 py-1 rounded bg-red-50 text-red-600 hover:bg-red-100"
                              >
                                <Ban className="w-3.5 h-3.5" /> Cancel
                              </button>
                            )}
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>

            <div className="flex items-center justify-between mt-4">
              <p className="text-sm text-gray-500">Page {page} of {totalPages} &middot; {total.toLocaleString()} crawl job{total === 1 ? '' : 's'}</p>
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

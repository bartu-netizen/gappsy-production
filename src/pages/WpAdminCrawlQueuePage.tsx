import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {
  ChevronLeft, ChevronRight, ExternalLink, RotateCcw, Ban, Loader2, PencilLine, Radar,
  Activity, AlertTriangle, PlayCircle, Gauge,
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
  attempt: number;
  worker_id: string | null;
  lease_expires_at: string | null;
  retry_at: string | null;
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

interface StatsResponse {
  ok: boolean;
  data: {
    max_concurrent_crawls: number | null;
    lease_seconds: number | null;
    max_auto_retries: number | null;
    active_count: number;
    queue_depth: number;
    scheduled_retry_count: number;
    stuck_lease_count: number;
    failures_last_24h: number;
    pending_auto_retries: number;
    avg_duration_ms: number | null;
    avg_duration_sample_size: number;
    throughput_last_hour: number;
    throughput_last_24h: number;
    throughput_last_7d: number;
  } | null;
}

interface SettingsResponse {
  ok: boolean;
  data: { max_concurrent_crawls: number; lease_seconds: number; max_auto_retries: number } | null;
  bounds?: { max_concurrent_crawls: { min: number; max: number } };
}

const PER_PAGE = 25;

const RUNNING_STATUSES: CrawlJobStatus[] = ['starting', 'crawling', 'extracting'];
const CANCELLABLE_STATUSES: CrawlJobStatus[] = ['queued', 'starting'];
const RETRYABLE_STATUSES: CrawlJobStatus[] = ['failed', 'cancelled'];
const CONCURRENCY_BOUNDS = { min: 1, max: 4 };

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

function formatElapsedSince(iso: string | null): string {
  if (!iso) return '—';
  const ms = Date.now() - new Date(iso).getTime();
  if (ms < 0) return '0s';
  return formatDuration(ms);
}

function formatRelativeFuture(iso: string | null): string {
  if (!iso) return '—';
  const ms = new Date(iso).getTime() - Date.now();
  if (ms <= 0) return 'due now';
  return `in ${formatDuration(ms)}`;
}

function isLeaseStuck(job: CrawlJobRow): boolean {
  return RUNNING_STATUSES.includes(job.status) && !!job.lease_expires_at && new Date(job.lease_expires_at).getTime() <= Date.now();
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

  const { data: statsData, refetch: refetchStats } = useAdminFetch<StatsResponse>('admin-crawl-stats');
  const { data: settingsData, refetch: refetchSettings } = useAdminFetch<SettingsResponse>('admin-crawl-settings');
  const { mutate: updateSettings, isLoading: isSavingConcurrency } = useAdminMutation<SettingsResponse, Record<string, unknown>>('admin-crawl-settings', 'PUT');
  const { mutate: processQueue, isLoading: isProcessingQueue } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-crawl-jobs', 'POST');

  const rows = data?.data || [];
  const total = data?.total ?? 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));
  const stats = statsData?.data || null;
  const concurrency = settingsData?.data?.max_concurrent_crawls ?? null;

  // Live-ish view of a background worker pool: poll the list + stats every
  // 10s so an operator watching this page during a concurrency run sees
  // jobs move through starting -> crawling -> needs_review without manually
  // refreshing.
  useEffect(() => {
    const timer = setInterval(() => {
      refetch();
      refetchStats();
    }, 10_000);
    return () => clearInterval(timer);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

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
    refetchStats();
  }

  async function handleCancel(jobId: string) {
    setBusyId(jobId);
    setMessage(null);
    const result = await jobAction({ action: 'cancel', id: jobId });
    setBusyId(null);
    if (!result.ok) setMessage(result.error?.message || 'Failed to cancel crawl.');
    refetch();
    refetchStats();
  }

  async function handleProcessQueue() {
    setMessage(null);
    const result = await processQueue({ action: 'process_queue' });
    if (!result.ok) {
      setMessage(result.error?.message || 'Failed to process the queue.');
    } else {
      const processed = (result.data?.data as { processed?: number } | undefined)?.processed ?? 0;
      setMessage(processed > 0 ? `Processed ${processed} crawl job${processed === 1 ? '' : 's'}.` : 'Nothing eligible to process right now.');
    }
    refetch();
    refetchStats();
  }

  async function handleConcurrencyChange(next: number) {
    const result = await updateSettings({ max_concurrent_crawls: next });
    if (!result.ok) setMessage(result.error?.message || 'Failed to update concurrency.');
    refetchSettings();
    refetchStats();
  }

  const emptyMessage = statusFilter === 'all'
    ? 'No crawl jobs yet — start a crawl from an approved-for-crawl candidate in the Discovery Queue.'
    : 'No crawl jobs match this filter.';

  return (
    <WpAdminLayout title="Crawl Queue" subtitle="Every crawl attempt — queued, running, completed, failed, and retried">
      <div className="max-w-7xl mx-auto">
        <div className="mb-6 flex flex-wrap items-start justify-between gap-3">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Crawl Queue</h1>
            <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} crawl job{total === 1 ? '' : 's'}</p>
          </div>
          <button
            onClick={handleProcessQueue}
            disabled={isProcessingQueue}
            className="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-semibold rounded-lg bg-gray-900 text-white hover:bg-gray-800 disabled:opacity-50 disabled:cursor-not-allowed transition"
          >
            {isProcessingQueue ? <Loader2 className="w-4 h-4 animate-spin" /> : <PlayCircle className="w-4 h-4" />}
            Process Queue
          </button>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
          <div className="flex flex-wrap items-center gap-x-6 gap-y-2 text-sm">
            <div className="flex items-center gap-1.5">
              <Activity className="w-4 h-4 text-gray-400" />
              <span className="text-gray-500">Active:</span>
              <span className="font-semibold text-gray-900">{stats?.active_count ?? '—'}</span>
              <span className="text-gray-400">/ {concurrency ?? '—'} slots</span>
            </div>
            <div className="flex items-center gap-1.5">
              <span className="text-gray-500">Queue depth:</span>
              <span className="font-semibold text-gray-900">{stats?.queue_depth ?? '—'}</span>
            </div>
            <div className="flex items-center gap-1.5">
              <span className="text-gray-500">Scheduled retries:</span>
              <span className="font-semibold text-gray-900">{stats?.scheduled_retry_count ?? '—'}</span>
            </div>
            <div className="flex items-center gap-1.5">
              <span className="text-gray-500">Avg duration:</span>
              <span className="font-semibold text-gray-900">{stats?.avg_duration_ms != null ? formatDuration(stats.avg_duration_ms) : '—'}</span>
            </div>
            <div className="flex items-center gap-1.5">
              <span className="text-gray-500">Failures (24h):</span>
              <span className="font-semibold text-gray-900">{stats?.failures_last_24h ?? '—'}</span>
            </div>
            <div className="flex items-center gap-1.5">
              <span className="text-gray-500">Throughput:</span>
              <span className="font-semibold text-gray-900">{stats?.throughput_last_hour ?? '—'}/hr &middot; {stats?.throughput_last_24h ?? '—'}/24h</span>
            </div>
            {!!stats?.stuck_lease_count && (
              <div className="flex items-center gap-1.5 text-amber-700">
                <AlertTriangle className="w-4 h-4" />
                <span className="font-semibold">{stats.stuck_lease_count} stuck lease{stats.stuck_lease_count === 1 ? '' : 's'} (will auto-recover on next claim)</span>
              </div>
            )}
          </div>

          <div className="mt-3 pt-3 border-t border-gray-100 flex items-center gap-2">
            <Gauge className="w-4 h-4 text-gray-400" />
            <label htmlFor="concurrency" className="text-sm text-gray-500">Max concurrent crawls:</label>
            <select
              id="concurrency"
              value={concurrency ?? ''}
              disabled={isSavingConcurrency || concurrency == null}
              onChange={(e) => handleConcurrencyChange(Number(e.target.value))}
              className="text-sm border border-gray-200 rounded-lg px-2 py-1 focus:outline-none focus:ring-2 focus:ring-gray-900"
            >
              {Array.from({ length: CONCURRENCY_BOUNDS.max - CONCURRENCY_BOUNDS.min + 1 }, (_, i) => CONCURRENCY_BOUNDS.min + i).map((n) => (
                <option key={n} value={n}>{n}</option>
              ))}
            </select>
            <span className="text-xs text-gray-400">(hard limit {CONCURRENCY_BOUNDS.min}–{CONCURRENCY_BOUNDS.max} on the current gateway)</span>
          </div>
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
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Worker / Lease</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Last Crawl</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Duration</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Pages</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Version</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Attempts</th>
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
                        <td className="px-5 py-3.5 text-sm text-gray-500">
                          {RUNNING_STATUSES.includes(job.status) ? (
                            <div>
                              <p className="text-gray-700 truncate max-w-[10rem]" title={job.worker_id || undefined}>{job.worker_id || '—'}</p>
                              <p className="text-xs text-gray-400">elapsed {formatElapsedSince(job.started_at)}</p>
                              {isLeaseStuck(job) && (
                                <p className="inline-flex items-center gap-1 text-xs text-amber-700 mt-0.5">
                                  <AlertTriangle className="w-3 h-3" /> stuck lease
                                </p>
                              )}
                            </div>
                          ) : job.status === 'queued' && job.retry_at ? (
                            <p className="text-xs text-gray-500">retry {formatRelativeFuture(job.retry_at)}</p>
                          ) : (
                            <span className="text-gray-300">—</span>
                          )}
                        </td>
                        <td className="px-5 py-3.5 text-sm text-gray-500">{formatDateTime(job.started_at || job.completed_at)}</td>
                        <td className="px-5 py-3.5 text-sm text-gray-600">{formatDuration(job.duration_ms)}</td>
                        <td className="px-5 py-3.5 text-sm text-gray-600">
                          {job.crawled_pages ?? '—'}{job.discovered_pages != null ? ` / ${job.discovered_pages}` : ''}
                        </td>
                        <td className="px-5 py-3.5 text-sm text-gray-500">{job.crawl4ai_version || '—'}</td>
                        <td className="px-5 py-3.5 text-sm text-gray-600">
                          {job.attempt > 1 ? `${job.attempt} auto` : '1'}{job.retry_count > 0 ? ` · ${job.retry_count} manual` : ''}
                        </td>
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

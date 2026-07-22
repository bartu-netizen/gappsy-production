import { useEffect, useState } from 'react';
import {
  Clock, ToggleLeft, ToggleRight, Play, Loader2, AlertTriangle, ChevronDown, ChevronUp, History, Timer,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface ScheduledJob {
  id: string;
  job_key: string;
  name: string;
  description: string | null;
  job_type: string;
  schedule_type: 'cron' | 'interval' | 'manual';
  cron_expression: string | null;
  interval_seconds: number | null;
  enabled: boolean;
  priority: number;
  max_retries: number;
  next_run_at: string | null;
  last_run_at: string | null;
  last_status: 'success' | 'failed' | 'timed_out' | 'cancelled' | null;
  last_duration_ms: number | null;
  last_error: string | null;
  consecutive_failures: number;
  worker_id: string | null;
  lease_expires_at: string | null;
}

interface ListResponse { ok: boolean; data: ScheduledJob[]; registered_job_types: string[]; }
interface UpdateResponse { ok: boolean; data?: ScheduledJob; }
interface RunNowResponse { ok: boolean; data?: { status: string; duration_ms: number; result?: Record<string, unknown>; error?: string }; }

interface RunRow {
  id: string;
  status: 'running' | 'success' | 'failed' | 'cancelled' | 'timed_out';
  triggered_by: 'cron' | 'manual' | 'retry';
  attempt: number;
  started_at: string;
  completed_at: string | null;
  duration_ms: number | null;
  error_message: string | null;
}
interface RunsResponse { ok: boolean; data: RunRow[]; total: number; }

const STATUS_BADGE: Record<string, string> = {
  success: 'bg-emerald-100 text-emerald-700',
  failed: 'bg-rose-100 text-rose-700',
  timed_out: 'bg-amber-100 text-amber-700',
  cancelled: 'bg-gray-100 text-gray-500',
  running: 'bg-blue-100 text-blue-700',
};

function formatDuration(ms: number | null): string {
  if (ms == null) return '—';
  if (ms < 1000) return `${ms}ms`;
  const s = ms / 1000;
  if (s < 60) return `${s.toFixed(1)}s`;
  return `${Math.floor(s / 60)}m ${Math.round(s % 60)}s`;
}

function formatWhen(iso: string | null): string {
  if (!iso) return '—';
  return new Date(iso).toLocaleString('en-US', { month: 'short', day: 'numeric', hour: 'numeric', minute: '2-digit' });
}

function formatRelative(iso: string | null): string {
  if (!iso) return '—';
  const ms = new Date(iso).getTime() - Date.now();
  const abs = Math.abs(ms);
  const label = formatDuration(abs);
  return ms >= 0 ? `in ${label}` : `${label} ago`;
}

function formatSchedule(job: ScheduledJob): string {
  if (job.schedule_type === 'cron') return job.cron_expression || 'cron';
  if (job.schedule_type === 'interval') {
    const s = job.interval_seconds || 0;
    if (s % 3600 === 0) return `every ${s / 3600}h`;
    if (s % 60 === 0) return `every ${s / 60}m`;
    return `every ${s}s`;
  }
  return 'manual only';
}

function isLeaseStuck(job: ScheduledJob): boolean {
  return !!job.worker_id && !!job.lease_expires_at && new Date(job.lease_expires_at).getTime() <= Date.now();
}

function RunHistory({ jobId }: { jobId: string }) {
  const { data, isLoading, isError, error } = useAdminFetch<RunsResponse>(`admin-scheduler?id=${jobId}&runs=true&page_size=15`);
  const runs = data?.data || [];

  if (isLoading) return <AdminLoadingState message="Loading run history..." />;
  if (isError && error) return <AdminErrorBanner error={error} className="mt-2" />;
  if (runs.length === 0) return <p className="text-xs text-gray-400 py-2">No runs recorded yet.</p>;

  return (
    <div className="mt-2 divide-y divide-gray-100 border border-gray-100 rounded-lg overflow-hidden">
      {runs.map((run) => (
        <div key={run.id} className="flex items-center justify-between gap-3 px-3 py-2 text-xs">
          <div className="flex items-center gap-2 min-w-0">
            <span className={`px-1.5 py-0.5 rounded font-semibold shrink-0 ${STATUS_BADGE[run.status] || ''}`}>{run.status}</span>
            <span className="text-gray-400 shrink-0">{run.triggered_by}</span>
            <span className="text-gray-500 truncate">{formatWhen(run.started_at)}</span>
          </div>
          <div className="flex items-center gap-3 shrink-0 text-gray-500">
            <span>attempt {run.attempt}</span>
            <span>{formatDuration(run.duration_ms)}</span>
          </div>
          {run.error_message && (
            <p className="w-full text-rose-600 truncate" title={run.error_message}>{run.error_message}</p>
          )}
        </div>
      ))}
    </div>
  );
}

// Scheduler Admin — the operability surface for the platform's central
// orchestration layer (bottleneck #2). Every stage below only advances
// automatically because scheduler-tick claims and runs these rows on their
// own cadence; this page is where an operator confirms that's actually
// happening, not just configured.
export default function WpAdminSchedulerPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-scheduler');
  const { mutate: updateJob } = useAdminMutation<UpdateResponse, Record<string, unknown>>('admin-scheduler', 'POST');
  const { mutate: runNow } = useAdminMutation<RunNowResponse, Record<string, unknown>>('admin-scheduler', 'POST');
  const [busyId, setBusyId] = useState<string | null>(null);
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);

  useEffect(() => {
    const timer = setInterval(() => refetch(), 15_000);
    return () => clearInterval(timer);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const jobs = data?.data || [];

  async function handleToggle(job: ScheduledJob) {
    setBusyId(job.id);
    const result = await updateJob({ action: 'update', id: job.id, enabled: !job.enabled });
    setBusyId(null);
    if (!result.ok) setMessage(result.error?.message || 'Failed to update schedule.');
    refetch();
  }

  async function handleRunNow(job: ScheduledJob) {
    setBusyId(job.id);
    setMessage(null);
    const result = await runNow({ action: 'run_now', id: job.id });
    setBusyId(null);
    if (!result.ok) {
      setMessage(result.error?.message || 'Failed to run schedule.');
    } else {
      const outcome = result.data?.data;
      setMessage(outcome ? `${job.name}: ${outcome.status} in ${formatDuration(outcome.duration_ms)}${outcome.error ? ` — ${outcome.error}` : ''}` : null);
    }
    refetch();
  }

  const activeCount = jobs.filter((j) => j.enabled).length;
  const runningCount = jobs.filter((j) => !!j.worker_id && !isLeaseStuck(j)).length;
  const failingCount = jobs.filter((j) => j.consecutive_failures > 0).length;

  return (
    <WpAdminLayout title="Scheduler" subtitle="Central orchestration — every pipeline stage's automatic cadence, in one place">
      <div className="max-w-5xl mx-auto">
        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Scheduler</h1>
          <p className="text-gray-500 mt-1 text-sm">
            {activeCount} active schedule{activeCount === 1 ? '' : 's'} &middot; {runningCount} running now
            {failingCount > 0 && <span className="text-amber-600"> &middot; {failingCount} with recent failures</span>}
          </p>
        </div>

        {message && (
          <div className="bg-gray-50 border border-gray-200 rounded-lg p-3 mb-4 text-sm text-gray-700">{message}</div>
        )}

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading schedules..." />}
        {!isLoading && !isError && jobs.length === 0 && (
          <AdminEmptyState icon={Clock} title="No schedules configured" message="Schedules are seeded by migration — none found." />
        )}

        {!isLoading && jobs.length > 0 && (
          <div className="space-y-3">
            {jobs.map((job) => {
              const isBusy = busyId === job.id;
              const isExpanded = expandedId === job.id;
              const stuck = isLeaseStuck(job);
              const running = !!job.worker_id && !stuck;
              return (
                <div key={job.id} className="bg-white border border-gray-200 rounded-lg p-4">
                  <div className="flex items-center justify-between gap-4">
                    <div className="flex items-center gap-3 min-w-0">
                      <div className="w-9 h-9 rounded-lg bg-gray-100 flex items-center justify-center shrink-0">
                        <Timer className="w-4 h-4 text-gray-600" />
                      </div>
                      <div className="min-w-0">
                        <div className="flex items-center gap-2 flex-wrap">
                          <p className="font-semibold text-gray-900 text-sm">{job.name}</p>
                          {running && <span className="text-[10px] px-2 py-0.5 rounded-full bg-blue-100 text-blue-700 font-semibold">Running</span>}
                          {job.last_status && !running && (
                            <span className={`text-[10px] px-2 py-0.5 rounded-full font-semibold ${STATUS_BADGE[job.last_status] || ''}`}>
                              Last: {job.last_status}
                            </span>
                          )}
                          {job.consecutive_failures > 0 && (
                            <span className="text-[10px] px-2 py-0.5 rounded-full bg-amber-100 text-amber-700 font-semibold inline-flex items-center gap-1">
                              <AlertTriangle className="w-3 h-3" /> {job.consecutive_failures} consecutive failure{job.consecutive_failures === 1 ? '' : 's'}
                            </span>
                          )}
                          {stuck && (
                            <span className="text-[10px] px-2 py-0.5 rounded-full bg-rose-100 text-rose-700 font-semibold">Stuck lease</span>
                          )}
                        </div>
                        <p className="text-xs text-gray-500">
                          {job.job_type} &middot; {formatSchedule(job)} &middot; priority {job.priority} &middot; max {job.max_retries} retries
                        </p>
                        {job.description && <p className="text-[11px] text-gray-400 mt-0.5">{job.description}</p>}
                        <p className="text-[11px] text-gray-400 mt-1 flex items-center gap-3 flex-wrap">
                          <span className="flex items-center gap-1"><Clock className="w-3 h-3" /> Next {formatRelative(job.next_run_at)}</span>
                          <span>Last run {formatWhen(job.last_run_at)}</span>
                          <span>Duration {formatDuration(job.last_duration_ms)}</span>
                        </p>
                        {job.last_error && job.last_status === 'failed' && (
                          <p className="text-[11px] text-rose-600 mt-1 truncate max-w-md" title={job.last_error}>{job.last_error}</p>
                        )}
                      </div>
                    </div>
                    <div className="flex items-center gap-3 shrink-0">
                      <button
                        onClick={() => setExpandedId(isExpanded ? null : job.id)}
                        className="inline-flex items-center gap-1 text-xs font-medium text-gray-500 hover:text-gray-700"
                      >
                        <History className="w-3.5 h-3.5" /> History {isExpanded ? <ChevronUp className="w-3.5 h-3.5" /> : <ChevronDown className="w-3.5 h-3.5" />}
                      </button>
                      <button
                        onClick={() => handleRunNow(job)}
                        disabled={isBusy || running}
                        className="inline-flex items-center gap-1.5 text-sm font-medium px-3 py-1.5 border border-gray-200 rounded-lg text-gray-700 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed"
                        title={running ? 'Already running' : 'Run this schedule now'}
                      >
                        {isBusy ? <Loader2 className="w-4 h-4 animate-spin" /> : <Play className="w-4 h-4" />}
                        Run now
                      </button>
                      <button
                        onClick={() => handleToggle(job)}
                        disabled={isBusy}
                        className={`inline-flex items-center gap-1.5 text-sm font-medium disabled:opacity-40 disabled:cursor-not-allowed ${job.enabled ? 'text-emerald-600' : 'text-gray-400'}`}
                      >
                        {job.enabled ? <ToggleRight className="w-6 h-6" /> : <ToggleLeft className="w-6 h-6" />}
                        {job.enabled ? 'Enabled' : 'Disabled'}
                      </button>
                    </div>
                  </div>
                  {isExpanded && <RunHistory jobId={job.id} />}
                </div>
              );
            })}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}

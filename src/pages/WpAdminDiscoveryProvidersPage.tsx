import { useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft, Plug, ToggleLeft, ToggleRight, Clock, AlertTriangle, Play, Loader2, RotateCcw, GitBranch } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface ProviderRow {
  id: string;
  key: string;
  name: string;
  type: 'manual' | 'csv' | 'api' | 'scraper' | 'crawler';
  enabled: boolean;
  candidate_count: number;
  description: string | null;
  priority: number;
  rate_limit_per_run: number;
  schedule_frequency: 'hourly' | 'daily' | 'weekly' | 'manual';
  last_run_at: string | null;
  last_run_status: 'completed' | 'failed' | 'partial' | null;
  implemented: boolean;
  disabled_reason: string | null;
  last_cursor: string | null;
  cursor_updated_at: string | null;
  cursor_reset_at: string | null;
}

interface ListResponse { ok: boolean; data: ProviderRow[]; }
interface ToggleResponse { ok: boolean; }
interface RunSummary {
  status: 'completed' | 'failed' | 'partial';
  candidates_found: number;
  candidates_created: number;
  candidates_duplicate: number;
  candidates_rejected: number;
  error_message: string | null;
}
interface RunResponse { ok: boolean; data: RunSummary; }

const TYPE_LABELS: Record<string, string> = { manual: 'Manual', csv: 'CSV', api: 'API', scraper: 'Scraper', crawler: 'Crawler' };
const FREQUENCY_LABELS: Record<string, string> = { hourly: 'Hourly', daily: 'Daily', weekly: 'Weekly', manual: 'Manual only' };
const RUN_STATUS_CLASS: Record<string, string> = {
  completed: 'bg-emerald-100 text-emerald-700',
  partial: 'bg-amber-100 text-amber-700',
  failed: 'bg-rose-100 text-rose-700',
};

// Provider registry — the whole point of the Discovery Engine's provider
// architecture is that adding Product Hunt / GitHub / npm / etc. later is a
// migration seed row + a provider module, never a change to this page or
// the core pipeline. Today: Manual Import + CSV Import.
export default function WpAdminDiscoveryProvidersPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-discovery-providers');
  const { mutate: toggleProvider } = useAdminMutation<ToggleResponse, { id: string; enabled: boolean }>((v) => `admin-discovery-providers?id=${v.id}`, 'PUT');
  const { mutate: resetCursor } = useAdminMutation<ToggleResponse, { id: string; reset_cursor: true }>((v) => `admin-discovery-providers?id=${v.id}`, 'PUT');
  const { mutate: runProviderNow } = useAdminMutation<RunResponse, { action: 'run'; id: string }>('admin-discovery-providers', 'POST');
  const [runningId, setRunningId] = useState<string | null>(null);
  const [resettingId, setResettingId] = useState<string | null>(null);
  const [lastRunResult, setLastRunResult] = useState<{ id: string; summary: RunSummary | null; error: string | null } | null>(null);

  const providers = data?.data || [];

  async function handleToggle(id: string, currentEnabled: boolean) {
    const result = await toggleProvider({ id, enabled: !currentEnabled });
    if (result.ok) refetch();
  }

  async function handleResetCursor(id: string) {
    if (!window.confirm('Reset this provider\'s cursor? Its next run will start fresh from the beginning of the source instead of resuming where it left off.')) return;
    setResettingId(id);
    await resetCursor({ id, reset_cursor: true });
    setResettingId(null);
    await refetch();
  }

  async function handleRunNow(id: string) {
    setRunningId(id);
    setLastRunResult(null);
    const result = await runProviderNow({ action: 'run', id });
    setRunningId(null);
    if (result.ok && result.data) {
      setLastRunResult({ id, summary: result.data.data, error: null });
    } else {
      setLastRunResult({ id, summary: null, error: result.error?.message || 'Failed to run provider' });
    }
    await refetch();
  }

  return (
    <WpAdminLayout title="Providers" subtitle="Discovery sources feeding the Discovery Queue">
      <div className="max-w-4xl mx-auto">
        <Link to="/wp-admin/discovery" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Discovery Dashboard
        </Link>

        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Providers</h1>
          <p className="text-gray-500 mt-1 text-sm">Each provider is isolated — adding a new one never requires changing the Queue, Validation, or Duplicate Engine.</p>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading providers..." />}

        {!isLoading && !isError && providers.length === 0 && (
          <AdminEmptyState icon={Plug} title="No providers configured" message="Providers are seeded by migration — none found." />
        )}

        {!isLoading && providers.length > 0 && (
          <div className="space-y-3">
            {providers.map((provider) => (
              <div key={provider.id} className="bg-white border border-gray-200 rounded-lg p-4">
                <div className="flex items-center justify-between gap-4">
                  <div className="flex items-center gap-3 min-w-0">
                    <div className="w-9 h-9 rounded-lg bg-gray-100 flex items-center justify-center shrink-0">
                      <Plug className="w-4 h-4 text-gray-600" />
                    </div>
                    <div className="min-w-0">
                      <div className="flex items-center gap-2 flex-wrap">
                        <p className="font-semibold text-gray-900 text-sm">{provider.name}</p>
                        {!provider.implemented && (
                          <span className="text-[10px] px-2 py-0.5 rounded-full bg-gray-100 text-gray-500 font-semibold">Planned</span>
                        )}
                        {provider.last_run_status && (
                          <span className={`text-[10px] px-2 py-0.5 rounded-full font-semibold ${RUN_STATUS_CLASS[provider.last_run_status] || ''}`}>
                            Last run: {provider.last_run_status}
                          </span>
                        )}
                      </div>
                      <p className="text-xs text-gray-500">
                        {TYPE_LABELS[provider.type] || provider.type} &middot; {provider.candidate_count.toLocaleString()} candidate{provider.candidate_count === 1 ? '' : 's'}
                        {' '}&middot; Priority {provider.priority} &middot; {FREQUENCY_LABELS[provider.schedule_frequency] || provider.schedule_frequency} &middot; up to {provider.rate_limit_per_run}/run
                      </p>
                      {provider.last_run_at && (
                        <p className="text-[11px] text-gray-400 mt-0.5 flex items-center gap-1">
                          <Clock className="w-3 h-3" /> Last run {new Date(provider.last_run_at).toLocaleString()}
                        </p>
                      )}
                      {provider.implemented && (
                        <p className="text-[11px] text-gray-400 mt-0.5 flex items-center gap-1.5">
                          <GitBranch className="w-3 h-3 shrink-0" />
                          {provider.last_cursor ? (
                            <span className="truncate max-w-xs" title={provider.last_cursor}>
                              Cursor: {provider.last_cursor}
                              {provider.cursor_updated_at && ` (advanced ${new Date(provider.cursor_updated_at).toLocaleString()})`}
                            </span>
                          ) : (
                            <span>No cursor{provider.cursor_reset_at ? ` (reset ${new Date(provider.cursor_reset_at).toLocaleString()})` : ' — next run starts fresh'}</span>
                          )}
                          {provider.last_cursor && (
                            <button
                              onClick={() => handleResetCursor(provider.id)}
                              disabled={resettingId === provider.id}
                              className="inline-flex items-center gap-0.5 text-blue-600 hover:underline disabled:opacity-40 shrink-0"
                            >
                              {resettingId === provider.id ? <Loader2 className="w-3 h-3 animate-spin" /> : <RotateCcw className="w-3 h-3" />} Reset
                            </button>
                          )}
                        </p>
                      )}
                      {provider.disabled_reason && (
                        <p className="text-[11px] text-amber-600 mt-1 flex items-start gap-1">
                          <AlertTriangle className="w-3 h-3 mt-0.5 shrink-0" /> {provider.disabled_reason}
                        </p>
                      )}
                    </div>
                  </div>
                  <div className="flex items-center gap-3 shrink-0">
                    <button
                      onClick={() => handleRunNow(provider.id)}
                      disabled={!provider.implemented || !provider.enabled || runningId === provider.id}
                      className="inline-flex items-center gap-1.5 text-sm font-medium px-3 py-1.5 border border-gray-200 rounded-lg text-gray-700 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed"
                      title={!provider.implemented ? 'Not implemented yet' : !provider.enabled ? 'Enable this provider first' : 'Run this provider now'}
                    >
                      {runningId === provider.id ? <Loader2 className="w-4 h-4 animate-spin" /> : <Play className="w-4 h-4" />}
                      {runningId === provider.id ? 'Running...' : 'Run now'}
                    </button>
                    <button
                      onClick={() => handleToggle(provider.id, provider.enabled)}
                      disabled={!provider.implemented}
                      className={`inline-flex items-center gap-1.5 text-sm font-medium disabled:opacity-40 disabled:cursor-not-allowed ${provider.enabled ? 'text-emerald-600' : 'text-gray-400'}`}
                      title={!provider.implemented ? 'Not implemented yet' : provider.enabled ? 'Disable this provider' : 'Enable this provider'}
                    >
                      {provider.enabled ? <ToggleRight className="w-6 h-6" /> : <ToggleLeft className="w-6 h-6" />}
                      {provider.enabled ? 'Enabled' : 'Disabled'}
                    </button>
                  </div>
                </div>
                {lastRunResult && lastRunResult.id === provider.id && (
                  <div className={`mt-3 pt-3 border-t border-gray-100 text-xs ${lastRunResult.error ? 'text-rose-600' : 'text-gray-600'}`}>
                    {lastRunResult.error ? (
                      <>Run failed: {lastRunResult.error}</>
                    ) : lastRunResult.summary ? (
                      <>
                        Run {lastRunResult.summary.status} — found {lastRunResult.summary.candidates_found}, created {lastRunResult.summary.candidates_created}
                        {' '}({lastRunResult.summary.candidates_duplicate} duplicate, {lastRunResult.summary.candidates_rejected} rejected)
                        {lastRunResult.summary.error_message ? ` — ${lastRunResult.summary.error_message}` : ''}
                      </>
                    ) : null}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}

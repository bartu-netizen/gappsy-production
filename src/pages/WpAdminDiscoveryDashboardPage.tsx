import { Link } from 'react-router-dom';
import {
  PlusCircle, Search, ShieldAlert, GitMerge, XCircle, CheckCircle2,
  ListChecks, History, ShieldCheck, Plug, LayoutGrid, Sparkles, HeartPulse,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { discoveryStatusLabel, discoveryStatusBadgeClass, type DiscoveryStatus } from '../utils/discoveryStatus';

interface ProviderHealthRow {
  id: string;
  key: string;
  name: string;
  enabled: boolean;
  implemented: boolean;
  last_run_status: 'completed' | 'failed' | 'partial' | null;
  recent_error_count: number;
  disabled_reason: string | null;
  last_run: { started_at: string; candidates_created: number } | null;
}

interface DiscoveryStatsResponse {
  ok: boolean;
  data: {
    total_discovered: number;
    by_status: Record<DiscoveryStatus, number>;
    by_provider: Record<string, number>;
    by_category: Record<string, number>;
    by_day: Record<string, number>;
    validation_success_rate: number | null;
    recent: Array<{ id: string; name: string; logo_url: string | null; status: DiscoveryStatus; created_at: string }>;
    provider_health: ProviderHealthRow[];
  };
}

const HEALTH_DOT_CLASS: Record<string, string> = {
  completed: 'bg-emerald-500',
  partial: 'bg-amber-500',
  failed: 'bg-rose-500',
};

function formatShortDate(iso: string): string {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
}

const SECTIONS: Array<{ label: string; description: string; href: string; icon: typeof ListChecks }> = [
  { label: 'Discovery Queue', description: 'Every candidate, all pipeline stages', href: '/wp-admin/discovery/queue', icon: ListChecks },
  { label: 'Duplicate Manager', description: 'Candidates flagged as likely duplicates', href: '/wp-admin/discovery/duplicates', icon: GitMerge },
  { label: 'Validation Results', description: 'Reachability, HTTPS, robots, sitemap health', href: '/wp-admin/discovery/validation', icon: ShieldCheck },
  { label: 'Import History', description: 'Every CSV batch and its results', href: '/wp-admin/discovery/import-history', icon: History },
  { label: 'Providers', description: 'Manage discovery sources', href: '/wp-admin/discovery/providers', icon: Plug },
];

export default function WpAdminDiscoveryDashboardPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<DiscoveryStatsResponse>('admin-discovery-stats');
  const stats = data?.data;

  const statCards = stats
    ? [
        { label: 'Total Discovered', value: stats.total_discovered, icon: Sparkles, href: '/wp-admin/discovery/queue', warn: false },
        { label: 'Validated', value: stats.by_status.validated || 0, icon: CheckCircle2, href: '/wp-admin/discovery/queue?status=validated', warn: false },
        { label: 'Needs Review', value: stats.by_status.needs_review || 0, icon: ShieldAlert, href: '/wp-admin/discovery/queue?status=needs_review', warn: (stats.by_status.needs_review || 0) > 0 },
        { label: 'Duplicates', value: stats.by_status.duplicate || 0, icon: GitMerge, href: '/wp-admin/discovery/duplicates', warn: false },
        { label: 'Rejected', value: stats.by_status.rejected || 0, icon: XCircle, href: '/wp-admin/discovery/queue?status=rejected', warn: false },
        { label: 'Approved For Crawl', value: stats.by_status.approved_for_crawl || 0, icon: CheckCircle2, href: '/wp-admin/discovery/queue?status=approved_for_crawl', warn: false },
      ]
    : [];

  return (
    <WpAdminLayout title="Discovery Dashboard" subtitle="Overview of the Discovery Engine pipeline">
      <div className="max-w-7xl mx-auto">
        <div className="flex flex-wrap items-center justify-between gap-3 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Discovery Dashboard</h1>
            <p className="text-gray-500 mt-1 text-sm">Discovery → Validation → Duplicate Detection → Approved For Crawl</p>
          </div>
          <div className="flex items-center gap-2">
            <Link
              to="/wp-admin/discovery/queue"
              className="inline-flex items-center gap-2 bg-white border border-gray-200 text-gray-700 px-4 py-2 rounded-lg font-semibold hover:bg-gray-50 transition text-sm"
            >
              <Search className="w-4 h-4" />
              Browse Queue
            </Link>
            <Link
              to="/wp-admin/discovery/import"
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
            >
              <PlusCircle className="w-4 h-4" />
              Discover Software
            </Link>
          </div>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading dashboard..." />}

        {!isLoading && !isError && !stats && (
          <AdminEmptyState icon={LayoutGrid} title="No data yet" message="Discovery stats will appear here once candidates start coming in." />
        )}

        {!isLoading && !isError && stats && (
          <div className="space-y-8">
            <div className="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-6 gap-3">
              {statCards.map((card) => (
                <Link
                  key={card.label}
                  to={card.href}
                  className={`flex items-center gap-3 p-4 rounded-lg border transition-all hover:shadow-sm ${
                    card.warn ? 'bg-amber-50 border-amber-200 hover:border-amber-300' : 'bg-white border-gray-200 hover:border-gray-300'
                  }`}
                >
                  <card.icon className={`w-5 h-5 shrink-0 ${card.warn ? 'text-amber-500' : 'text-gray-400'}`} />
                  <div className="min-w-0">
                    <div className={`text-xl font-bold leading-none ${card.warn ? 'text-amber-800' : 'text-gray-900'}`}>
                      {card.value.toLocaleString()}
                    </div>
                    <div className={`text-xs mt-1 ${card.warn ? 'text-amber-600' : 'text-gray-500'}`}>{card.label}</div>
                  </div>
                </Link>
              ))}
            </div>

            {stats.validation_success_rate !== null && (
              <div className="bg-white border border-gray-200 rounded-lg p-4 flex items-center gap-3">
                <ShieldCheck className="w-5 h-5 text-emerald-500 shrink-0" />
                <div>
                  <p className="text-sm font-semibold text-gray-900">{stats.validation_success_rate}% validation success rate</p>
                  <p className="text-xs text-gray-500">Share of reviewed candidates that passed validation cleanly</p>
                </div>
              </div>
            )}

            <div>
              <h2 className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-3">Sections</h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                {SECTIONS.map((section) => (
                  <Link
                    key={section.label}
                    to={section.href}
                    className="flex items-start gap-3 p-4 bg-white border border-gray-200 rounded-lg hover:border-gray-300 hover:shadow-sm transition-all"
                  >
                    <div className="w-9 h-9 rounded-lg bg-gray-100 flex items-center justify-center shrink-0">
                      <section.icon className="w-4 h-4 text-gray-600" />
                    </div>
                    <div className="min-w-0">
                      <p className="font-semibold text-gray-900 text-sm">{section.label}</p>
                      <p className="text-xs text-gray-500 mt-0.5">{section.description}</p>
                    </div>
                  </Link>
                ))}
              </div>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <div className="flex items-center gap-2 mb-3">
                  <Sparkles className="w-4 h-4 text-gray-400" />
                  <h3 className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Recent Discoveries</h3>
                </div>
                {stats.recent.length === 0 ? (
                  <p className="text-sm text-gray-400 py-2">No candidates yet.</p>
                ) : (
                  <ul className="divide-y divide-gray-100">
                    {stats.recent.map((item) => (
                      <li key={item.id}>
                        <Link to="/wp-admin/discovery/queue" className="flex items-center gap-3 py-2 hover:bg-gray-50 -mx-1 px-1 rounded-lg transition-colors">
                          {item.logo_url ? (
                            <img src={item.logo_url} alt="" className="w-5 h-5 rounded shrink-0 object-contain border border-gray-100 bg-white" />
                          ) : (
                            <div className="w-5 h-5 rounded bg-gray-100 flex items-center justify-center text-gray-400 font-semibold text-[10px] shrink-0">
                              {item.name.charAt(0)}
                            </div>
                          )}
                          <span className="flex-1 min-w-0 text-sm text-gray-700 truncate">{item.name}</span>
                          <span className={`text-xs px-2 py-0.5 rounded font-medium shrink-0 ${discoveryStatusBadgeClass(item.status)}`}>
                            {discoveryStatusLabel(item.status)}
                          </span>
                          <span className="text-xs text-gray-400 shrink-0">{formatShortDate(item.created_at)}</span>
                        </Link>
                      </li>
                    ))}
                  </ul>
                )}
              </div>

              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <div className="flex items-center gap-2 mb-3">
                  <Plug className="w-4 h-4 text-gray-400" />
                  <h3 className="text-xs font-semibold text-gray-500 uppercase tracking-wide">By Provider</h3>
                </div>
                {Object.keys(stats.by_provider).length === 0 ? (
                  <p className="text-sm text-gray-400 py-2">No candidates yet.</p>
                ) : (
                  <ul className="divide-y divide-gray-100">
                    {Object.entries(stats.by_provider).map(([name, count]) => (
                      <li key={name} className="flex items-center gap-3 py-2">
                        <span className="flex-1 min-w-0 text-sm text-gray-700 truncate">{name}</span>
                        <span className="text-sm font-semibold text-gray-900">{count.toLocaleString()}</span>
                      </li>
                    ))}
                  </ul>
                )}
              </div>
            </div>

            <div className="bg-white border border-gray-200 rounded-lg p-4">
              <div className="flex items-center justify-between mb-3">
                <div className="flex items-center gap-2">
                  <HeartPulse className="w-4 h-4 text-gray-400" />
                  <h3 className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Provider Health</h3>
                </div>
                <Link to="/wp-admin/discovery/providers" className="text-xs font-semibold text-blue-600 hover:underline">Manage providers</Link>
              </div>
              {(!stats.provider_health || stats.provider_health.length === 0) ? (
                <p className="text-sm text-gray-400 py-2">No providers registered.</p>
              ) : (
                <ul className="divide-y divide-gray-100">
                  {stats.provider_health.map((p) => (
                    <li key={p.id} className="flex items-center gap-3 py-2.5">
                      <span
                        className={`w-2 h-2 rounded-full shrink-0 ${p.last_run_status ? HEALTH_DOT_CLASS[p.last_run_status] : 'bg-gray-300'}`}
                        title={p.last_run_status || 'Never run'}
                      />
                      <div className="min-w-0 flex-1">
                        <p className="text-sm text-gray-800 truncate">
                          {p.name}
                          {!p.implemented && <span className="ml-2 text-[10px] px-1.5 py-0.5 rounded-full bg-gray-100 text-gray-500 font-semibold align-middle">Planned</span>}
                        </p>
                        {p.disabled_reason && !p.enabled && (
                          <p className="text-[11px] text-gray-400 truncate">{p.disabled_reason}</p>
                        )}
                      </div>
                      {p.recent_error_count > 0 && (
                        <span className="text-xs font-semibold text-rose-600 shrink-0">{p.recent_error_count} error{p.recent_error_count === 1 ? '' : 's'} (7d)</span>
                      )}
                      {p.last_run && (
                        <span className="text-xs text-gray-400 shrink-0">{formatShortDate(p.last_run.started_at)}</span>
                      )}
                    </li>
                  ))}
                </ul>
              )}
            </div>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}

import { Link } from 'react-router-dom';
import {
  Plus, Download, Clock, FileEdit, Rocket, Globe2, AlertTriangle,
  ListChecks, Workflow, Archive, History, LayoutGrid,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

type ImportStatus =
  | 'pending' | 'success' | 'failed'
  | 'queued' | 'fetching' | 'extracting' | 'review_required' | 'ready' | 'published' | 'cancelled';

interface PublishingStatsResponse {
  ok: boolean;
  data: {
    counts: {
      draft: number;
      needs_review: number;
      ready_to_publish: number;
      published: number;
      archived: number;
    };
    last_imports: Array<{
      id: string;
      source: string;
      source_url: string | null;
      status: ImportStatus;
      created_at: string;
      tools: { id: string; slug: string; name: string; logo: string | null } | null;
    }>;
    last_published: Array<{ id: string; slug: string; name: string; logo: string | null; updated_at: string }>;
    failed_imports_count: number;
    total_imports_count: number;
    imports_today_count: number;
  };
}

// Import-job status labels/colors — distinct from a tool's publishing stage
// (see utils/toolStatus). Mirrors the mapping in WpAdminImportHistoryPage.tsx
// so the same status always reads the same way across the Publishing section.
const STATUS_LABELS: Record<ImportStatus, string> = {
  pending: 'Pending', success: 'Success', failed: 'Failed',
  queued: 'Queued', fetching: 'Fetching', extracting: 'Extracting',
  review_required: 'Review Required', ready: 'Ready', published: 'Published', cancelled: 'Cancelled',
};

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

function formatShortDate(iso: string): string {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
}

// The five Publishing sub-sections plus the Import History log — this page
// is the hub they're all reachable from, not just a stats readout.
const SECTIONS: Array<{ label: string; description: string; href: string; icon: typeof Workflow }> = [
  { label: 'Queue', description: 'Every tool across all stages', href: '/wp-admin/publishing/queue', icon: Workflow },
  { label: 'Import Queue', description: 'Automated imports in progress', href: '/wp-admin/publishing/import-queue', icon: ListChecks },
  { label: 'Drafts', description: 'Tools not yet ready for review', href: '/wp-admin/publishing/drafts', icon: FileEdit },
  { label: 'Published', description: 'Everything live on the public site', href: '/wp-admin/publishing/published', icon: Globe2 },
  { label: 'Archive', description: 'Tools removed from publication', href: '/wp-admin/publishing/archive', icon: Archive },
  { label: 'Import History', description: 'Full log of every import attempt', href: '/wp-admin/publishing/imports', icon: History },
];

export default function WpAdminPublishingDashboardPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<PublishingStatsResponse>('admin-publishing-stats');
  const stats = data?.data;

  const statCards = stats
    ? [
        { label: 'Total Imports', value: stats.total_imports_count, icon: Download, href: '/wp-admin/publishing/imports', warn: false },
        { label: 'Imports Today', value: stats.imports_today_count, icon: Clock, href: '/wp-admin/publishing/imports', warn: false },
        { label: 'Drafts', value: stats.counts.draft, icon: FileEdit, href: '/wp-admin/publishing/drafts', warn: false },
        { label: 'Ready to Publish', value: stats.counts.ready_to_publish, icon: Rocket, href: '/wp-admin/publishing/queue', warn: false },
        { label: 'Published', value: stats.counts.published, icon: Globe2, href: '/wp-admin/publishing/published', warn: false },
        { label: 'Failed Imports', value: stats.failed_imports_count, icon: AlertTriangle, href: '/wp-admin/publishing/imports', warn: stats.failed_imports_count > 0 },
      ]
    : [];

  return (
    <WpAdminLayout title="Import Dashboard" subtitle="Overview of the entire publishing pipeline">
      <div className="max-w-7xl mx-auto">
        <div className="flex flex-wrap items-center justify-between gap-3 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Import Dashboard</h1>
            <p className="text-gray-500 mt-1 text-sm">Everything moving through publishing, at a glance</p>
          </div>
          <Link
            to="/wp-admin/publishing/new"
            className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
          >
            <Plus className="w-4 h-4" />
            New Software
          </Link>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading dashboard..." />}

        {!isLoading && !isError && !stats && (
          <AdminEmptyState icon={LayoutGrid} title="No data yet" message="Publishing stats will appear here once tools start moving through the pipeline." />
        )}

        {!isLoading && !isError && stats && (
          <div className="space-y-8">
            {/* Stat cards */}
            <div className="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-6 gap-3">
              {statCards.map((card) => (
                <Link
                  key={card.label}
                  to={card.href}
                  className={`flex items-center gap-3 p-4 rounded-lg border transition-all hover:shadow-sm ${
                    card.warn
                      ? 'bg-amber-50 border-amber-200 hover:border-amber-300'
                      : 'bg-white border-gray-200 hover:border-gray-300'
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

            {/* Section navigation */}
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

            {/* Mini lists */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <div className="flex items-center gap-2 mb-3">
                  <Download className="w-4 h-4 text-gray-400" />
                  <h3 className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Last Imports</h3>
                </div>
                {stats.last_imports.length === 0 ? (
                  <p className="text-sm text-gray-400 py-2">No imports yet.</p>
                ) : (
                  <ul className="divide-y divide-gray-100">
                    {stats.last_imports.map((item) => (
                      <li key={item.id}>
                        <Link
                          to="/wp-admin/publishing/imports"
                          className="flex items-center gap-3 py-2 hover:bg-gray-50 -mx-1 px-1 rounded-lg transition-colors"
                        >
                          <span className="flex-1 min-w-0 text-sm text-gray-700 truncate">
                            {item.tools?.name || '—'}
                          </span>
                          <span className={`text-xs px-2 py-0.5 rounded font-medium shrink-0 ${importStatusBadgeClass(item.status)}`}>
                            {STATUS_LABELS[item.status] || item.status}
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
                  <Globe2 className="w-4 h-4 text-gray-400" />
                  <h3 className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Last Published</h3>
                </div>
                {stats.last_published.length === 0 ? (
                  <p className="text-sm text-gray-400 py-2">No published tools yet.</p>
                ) : (
                  <ul className="divide-y divide-gray-100">
                    {stats.last_published.map((item) => (
                      <li key={item.id}>
                        <Link
                          to={`/wp-admin/tools/${item.id}/edit`}
                          className="flex items-center gap-3 py-2 hover:bg-gray-50 -mx-1 px-1 rounded-lg transition-colors"
                        >
                          {item.logo ? (
                            <img src={item.logo} alt="" className="w-5 h-5 rounded shrink-0 object-contain border border-gray-100 bg-white" />
                          ) : (
                            <div className="w-5 h-5 rounded bg-gray-100 flex items-center justify-center text-gray-400 font-semibold text-[10px] shrink-0">
                              {item.name.charAt(0)}
                            </div>
                          )}
                          <span className="flex-1 min-w-0 text-sm text-gray-700 truncate">{item.name}</span>
                          <span className="text-xs text-gray-400 shrink-0">{formatShortDate(item.updated_at)}</span>
                        </Link>
                      </li>
                    ))}
                  </ul>
                )}
              </div>
            </div>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}

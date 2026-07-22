import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import {
  Search, Compass, Radar, FileEdit, Zap, ListChecks, Rocket, Globe2, AlertTriangle,
  Clock, BarChart3, SlidersHorizontal, Loader2, ArrowRight,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { toolStatusBadgeClass } from '../utils/toolStatus';

interface DashboardResponse {
  ok: boolean;
  data: {
    discovery: { new: number; validated: number; needs_review: number; duplicate: number; approved_for_crawl: number };
    crawl: { queued: number; active: number; needs_review: number; failed: number };
    drafts: number;
    ai: { queued: number; needs_review: number; failed: number };
    needs_review: number;
    ready_to_publish: number;
    published: number;
    published_today: number;
    archived: number;
    failed_items: number;
    recently_updated: Array<{
      id: string; slug: string; name: string; status: string;
      completeness_percent: number | null; quality_score: number | null;
      updated_at: string; assigned_editor: string | null;
    }>;
  } | null;
}

interface SearchResult {
  id: string; slug: string; name: string; status: string; short_description: string | null;
  completeness_percent: number | null; quality_score: number | null;
}
interface SearchResponse { ok: boolean; data: SearchResult[]; }

function formatWhen(iso: string): string {
  return new Date(iso).toLocaleString('en-US', { month: 'short', day: 'numeric', hour: 'numeric', minute: '2-digit' });
}

const STAGE_CARDS = (data: NonNullable<DashboardResponse['data']>) => [
  { label: 'Discovery candidates', count: data.discovery.new + data.discovery.validated + data.discovery.needs_review + data.discovery.approved_for_crawl, href: '/wp-admin/discovery/queue', icon: Compass, tint: 'text-violet-600 bg-violet-50' },
  { label: 'Crawl queue', count: data.crawl.queued + data.crawl.active, href: '/wp-admin/discovery/crawl-queue', icon: Radar, tint: 'text-blue-600 bg-blue-50' },
  { label: 'Drafts', count: data.drafts, href: '/wp-admin/publishing/drafts', icon: FileEdit, tint: 'text-gray-600 bg-gray-100' },
  { label: 'AI batches', count: data.ai.queued, href: '/wp-admin/ai-enrichment/queue', icon: Zap, tint: 'text-amber-600 bg-amber-50' },
  { label: 'Needs review', count: data.needs_review, href: '/wp-admin/publishing/queue?status=needs_review', icon: ListChecks, tint: 'text-orange-600 bg-orange-50' },
  { label: 'Ready to publish', count: data.ready_to_publish, href: '/wp-admin/publishing/queue?status=ready_to_publish', icon: Rocket, tint: 'text-emerald-600 bg-emerald-50' },
  { label: 'Published today', count: data.published_today, href: '/wp-admin/publishing/published', icon: Globe2, tint: 'text-teal-600 bg-teal-50' },
  { label: 'Failed items', count: data.failed_items, href: '/wp-admin/discovery/crawl-queue?status=failed', icon: AlertTriangle, tint: 'text-red-600 bg-red-50' },
];

// The Editorial Platform's front door — every pipeline stage's queue
// depth in one place (previously scattered across 4 separate dashboards),
// a global search across every status, and quick links into Editor
// Metrics / Publishing Rules / the Scheduler that drives all of this
// automatically now.
export default function WpAdminEditorialDashboardPage() {
  const navigate = useNavigate();
  const [query, setQuery] = useState('');
  const { data, isLoading, isError, error, refetch } = useAdminFetch<DashboardResponse>('admin-editorial-dashboard');
  const { data: searchData, isLoading: isSearching } = useAdminFetch<SearchResponse>(
    () => (query.trim().length >= 2 ? `admin-editorial-search?q=${encodeURIComponent(query.trim())}` : null),
    { deps: [query] },
  );

  const stats = data?.data || null;
  const results = query.trim().length >= 2 ? (searchData?.data || []) : [];

  return (
    <WpAdminLayout title="Editorial Dashboard" subtitle="Every stage of the pipeline, one screen">
      <div className="max-w-6xl mx-auto">
        <div className="mb-6 flex flex-wrap items-start justify-between gap-3">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Editorial Dashboard</h1>
            <p className="text-gray-500 mt-1 text-sm">{stats?.published ?? '—'} published &middot; {stats ? stats.discovery.new + stats.discovery.validated + stats.discovery.needs_review + stats.discovery.approved_for_crawl + stats.crawl.queued + stats.crawl.active + stats.drafts + stats.ai.queued + stats.needs_review + stats.ready_to_publish : '—'} in the pipeline right now</p>
          </div>
          <div className="flex items-center gap-2">
            <Link to="/wp-admin/editorial/metrics" className="inline-flex items-center gap-1.5 text-sm font-medium px-3 py-2 border border-gray-200 rounded-lg text-gray-700 hover:bg-gray-50">
              <BarChart3 className="w-4 h-4" /> Editor Metrics
            </Link>
            <Link to="/wp-admin/editorial/publishing-rules" className="inline-flex items-center gap-1.5 text-sm font-medium px-3 py-2 border border-gray-200 rounded-lg text-gray-700 hover:bg-gray-50">
              <SlidersHorizontal className="w-4 h-4" /> Publishing Rules
            </Link>
            <Link to="/wp-admin/scheduler" className="inline-flex items-center gap-1.5 text-sm font-medium px-3 py-2 border border-gray-200 rounded-lg text-gray-700 hover:bg-gray-50">
              <Clock className="w-4 h-4" /> Scheduler
            </Link>
          </div>
        </div>

        <div className="relative mb-6">
          <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Find any draft, queue item, or published tool by name..."
            className="w-full pl-9 pr-3 py-2.5 border border-gray-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-gray-900"
          />
          {isSearching && <Loader2 className="w-4 h-4 text-gray-400 animate-spin absolute right-3 top-1/2 -translate-y-1/2" />}
          {results.length > 0 && (
            <div className="absolute z-10 mt-1 w-full bg-white border border-gray-200 rounded-lg shadow-lg divide-y divide-gray-100 max-h-96 overflow-y-auto">
              {results.map((r) => (
                <button
                  key={r.id}
                  onClick={() => navigate(`/wp-admin/tools/${r.id}/edit`)}
                  className="w-full text-left px-4 py-2.5 hover:bg-gray-50 flex items-center justify-between gap-3"
                >
                  <div className="min-w-0">
                    <div className="flex items-center gap-2">
                      <span className="font-medium text-gray-900 text-sm truncate">{r.name}</span>
                      <span className={`text-[10px] px-2 py-0.5 rounded-full font-semibold ${toolStatusBadgeClass(r.status)}`}>{r.status}</span>
                    </div>
                    {r.short_description && <p className="text-xs text-gray-500 truncate mt-0.5">{r.short_description}</p>}
                  </div>
                  {r.completeness_percent != null && <span className="text-xs text-gray-400 shrink-0">{r.completeness_percent}% complete</span>}
                </button>
              ))}
            </div>
          )}
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading dashboard..." />}

        {stats && (
          <>
            <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-8">
              {STAGE_CARDS(stats).map((card) => (
                <Link
                  key={card.label}
                  to={card.href}
                  className="bg-white border border-gray-200 rounded-lg p-4 hover:border-gray-300 hover:shadow-sm transition"
                >
                  <div className={`w-8 h-8 rounded-lg flex items-center justify-center mb-3 ${card.tint}`}>
                    <card.icon className="w-4 h-4" />
                  </div>
                  <p className="text-2xl font-bold text-gray-900">{card.count.toLocaleString()}</p>
                  <p className="text-xs text-gray-500 mt-0.5">{card.label}</p>
                </Link>
              ))}
            </div>

            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden">
              <div className="px-4 py-3 border-b border-gray-100 flex items-center justify-between">
                <h2 className="text-sm font-semibold text-gray-900">Recently updated tools</h2>
                <Link to="/wp-admin/publishing/queue" className="text-xs text-gray-500 hover:text-gray-700 inline-flex items-center gap-1">
                  View all <ArrowRight className="w-3 h-3" />
                </Link>
              </div>
              <div className="divide-y divide-gray-100">
                {stats.recently_updated.map((tool) => (
                  <Link
                    key={tool.id}
                    to={`/wp-admin/editorial/review/${tool.id}`}
                    className="flex items-center justify-between gap-3 px-4 py-3 hover:bg-gray-50"
                  >
                    <div className="flex items-center gap-2 min-w-0">
                      <span className="font-medium text-gray-900 text-sm truncate">{tool.name}</span>
                      <span className={`text-[10px] px-2 py-0.5 rounded-full font-semibold shrink-0 ${toolStatusBadgeClass(tool.status)}`}>{tool.status}</span>
                      {tool.assigned_editor && <span className="text-xs text-gray-400 shrink-0">{tool.assigned_editor}</span>}
                    </div>
                    <div className="flex items-center gap-3 shrink-0 text-xs text-gray-500">
                      {tool.completeness_percent != null && <span>{tool.completeness_percent}% complete</span>}
                      <span>{formatWhen(tool.updated_at)}</span>
                    </div>
                  </Link>
                ))}
                {stats.recently_updated.length === 0 && (
                  <p className="px-4 py-6 text-sm text-gray-400 text-center">No tools yet.</p>
                )}
              </div>
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}

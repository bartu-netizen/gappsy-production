import { useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft, TrendingUp, Clock, Zap, PieChart, AlertTriangle } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';

interface MetricsResponse {
  ok: boolean;
  data: {
    period_days: number;
    reviews_per_day: { day: string; review_count: number; avg_duration_ms: number | null }[];
    reviews_total_in_period: number;
    avg_review_time_ms: number | null;
    published_in_period: number;
    publish_rate_per_day: number;
    ai_acceptance_rate_percent: number | null;
    ai_suggestions_approved: number;
    ai_suggestions_rejected: number;
    completeness_distribution: { bucket: string; tool_count: number }[];
    queue_backlogs: Record<string, { count: number; oldest_age_hours: number }>;
    bottleneck: { stage: string; count: number; oldest_age_hours: number } | null;
  } | null;
}

const PERIOD_OPTIONS = [7, 14, 30, 90];
const BUCKET_ORDER = ['0-25', '26-50', '51-75', '76-100', 'unscored'];
const BUCKET_COLOR: Record<string, string> = { '0-25': 'bg-red-400', '26-50': 'bg-amber-400', '51-75': 'bg-blue-400', '76-100': 'bg-emerald-500', unscored: 'bg-gray-300' };

const STAGE_LABELS: Record<string, string> = {
  crawl_queue: 'Crawl Queue', discovery_validated: 'Discovery (Validated)', ai_queue: 'AI Queue', tools_needs_review: 'Needs Review',
};

function formatDuration(ms: number | null): string {
  if (ms == null) return '—';
  if (ms < 1000) return `${ms}ms`;
  const s = ms / 1000;
  if (s < 60) return `${s.toFixed(1)}s`;
  return `${Math.floor(s / 60)}m ${Math.round(s % 60)}s`;
}

function StatTile({ icon: Icon, label, value, sublabel }: { icon: typeof TrendingUp; label: string; value: string; sublabel?: string }) {
  return (
    <div className="bg-white border border-gray-200 rounded-lg p-4">
      <div className="w-8 h-8 rounded-lg bg-gray-100 flex items-center justify-center mb-3 text-gray-600">
        <Icon className="w-4 h-4" />
      </div>
      <p className="text-2xl font-bold text-gray-900">{value}</p>
      <p className="text-xs text-gray-500 mt-0.5">{label}</p>
      {sublabel && <p className="text-[11px] text-gray-400 mt-0.5">{sublabel}</p>}
    </div>
  );
}

// Editor Metrics — throughput and quality signals for the whole editorial
// operation. avg_review_time only reflects reviews where duration was
// actually reported (the Review Workspace's "Mark Reviewed" button); no
// number here is fabricated or estimated.
export default function WpAdminEditorialMetricsPage() {
  const [days, setDays] = useState(14);
  const { data, isLoading, isError, error, refetch } = useAdminFetch<MetricsResponse>(`admin-editorial-metrics?days=${days}`);
  const stats = data?.data || null;
  const maxReviews = stats ? Math.max(1, ...stats.reviews_per_day.map((r) => r.review_count)) : 1;
  const totalScored = stats ? stats.completeness_distribution.reduce((s, b) => s + Number(b.tool_count), 0) : 0;

  return (
    <WpAdminLayout title="Editor Metrics" subtitle="Throughput, quality, and bottlenecks across the editorial pipeline">
      <div className="max-w-5xl mx-auto">
        <Link to="/wp-admin/editorial" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" /> Back to Editorial Dashboard
        </Link>

        <div className="flex flex-wrap items-center justify-between gap-3 mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Editor Metrics</h1>
          <div className="flex items-center gap-1.5">
            {PERIOD_OPTIONS.map((d) => (
              <button
                key={d}
                onClick={() => setDays(d)}
                className={`px-3 py-1.5 rounded-lg text-xs font-semibold border transition ${days === d ? 'bg-gray-900 text-white border-gray-900' : 'bg-white text-gray-600 border-gray-200 hover:bg-gray-50'}`}
              >
                {d}d
              </button>
            ))}
          </div>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading metrics..." />}

        {stats && (
          <>
            <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-6">
              <StatTile icon={TrendingUp} label="Reviews in period" value={stats.reviews_total_in_period.toLocaleString()} sublabel={`~${Math.round((stats.reviews_total_in_period / stats.period_days) * 10) / 10}/day`} />
              <StatTile icon={Clock} label="Avg review time" value={formatDuration(stats.avg_review_time_ms)} />
              <StatTile icon={PieChart} label="Publish rate" value={`${stats.publish_rate_per_day}/day`} sublabel={`${stats.published_in_period} in ${stats.period_days}d`} />
              <StatTile icon={Zap} label="AI acceptance rate" value={stats.ai_acceptance_rate_percent != null ? `${stats.ai_acceptance_rate_percent}%` : '—'} sublabel={`${stats.ai_suggestions_approved} approved / ${stats.ai_suggestions_rejected} rejected`} />
            </div>

            {stats.bottleneck && (
              <div className="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-6 flex items-start gap-3">
                <AlertTriangle className="w-5 h-5 text-amber-600 shrink-0 mt-0.5" />
                <div>
                  <p className="text-sm font-semibold text-amber-800">Likely bottleneck: {STAGE_LABELS[stats.bottleneck.stage] || stats.bottleneck.stage}</p>
                  <p className="text-xs text-amber-700 mt-0.5">{stats.bottleneck.count.toLocaleString()} item(s) waiting, oldest {stats.bottleneck.oldest_age_hours}h</p>
                </div>
              </div>
            )}

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-6">
              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <h2 className="text-sm font-semibold text-gray-900 mb-4">Reviews per day</h2>
                <div className="space-y-2">
                  {stats.reviews_per_day.map((r) => (
                    <div key={r.day} className="flex items-center gap-2">
                      <span className="text-xs text-gray-500 w-16 shrink-0">{new Date(r.day).toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}</span>
                      <div className="flex-1 bg-gray-100 rounded-full h-3 overflow-hidden">
                        <div className="bg-blue-500 h-full rounded-full" style={{ width: `${Math.max(4, (r.review_count / maxReviews) * 100)}%` }} />
                      </div>
                      <span className="text-xs text-gray-600 w-8 text-right shrink-0">{r.review_count}</span>
                    </div>
                  ))}
                  {stats.reviews_per_day.length === 0 && <p className="text-sm text-gray-400">No reviews in this period.</p>}
                </div>
              </div>

              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <h2 className="text-sm font-semibold text-gray-900 mb-4">Completeness distribution</h2>
                <div className="space-y-2">
                  {BUCKET_ORDER.map((bucket) => {
                    const row = stats.completeness_distribution.find((b) => b.bucket === bucket);
                    const count = row ? Number(row.tool_count) : 0;
                    const pct = totalScored > 0 ? Math.round((count / totalScored) * 100) : 0;
                    return (
                      <div key={bucket} className="flex items-center gap-2">
                        <span className="text-xs text-gray-500 w-16 shrink-0">{bucket === 'unscored' ? 'Unscored' : `${bucket}%`}</span>
                        <div className="flex-1 bg-gray-100 rounded-full h-3 overflow-hidden">
                          <div className={`h-full rounded-full ${BUCKET_COLOR[bucket]}`} style={{ width: `${Math.max(count > 0 ? 4 : 0, pct)}%` }} />
                        </div>
                        <span className="text-xs text-gray-600 w-16 text-right shrink-0">{count} ({pct}%)</span>
                      </div>
                    );
                  })}
                </div>
              </div>
            </div>

            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden">
              <div className="px-4 py-3 border-b border-gray-100">
                <h2 className="text-sm font-semibold text-gray-900">Queue backlogs</h2>
              </div>
              <div className="divide-y divide-gray-100">
                {Object.entries(stats.queue_backlogs).map(([stage, b]) => (
                  <div key={stage} className="flex items-center justify-between px-4 py-3 text-sm">
                    <span className="text-gray-700">{STAGE_LABELS[stage] || stage}</span>
                    <span className="text-gray-500">{b.count.toLocaleString()} item(s){b.count > 0 ? ` · oldest ${b.oldest_age_hours}h` : ''}</span>
                  </div>
                ))}
              </div>
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}

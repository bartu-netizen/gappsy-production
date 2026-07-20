import { useCallback, useEffect, useState } from 'react';
import { Search, MousePointerClick, TrendingUp } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminApiFetch, getErrorMessage } from '../lib/adminApiFetch';

interface FallbackQuery {
  query: string;
  created_at: string;
}

interface RecentQuery {
  query: string;
  result_type: string;
  result_path: string;
  created_at: string;
}

interface StatsResponse {
  ok: boolean;
  totals: { total: number; last_24h: number; last_7d: number };
  by_type: Record<string, number>;
  fallback_rate_pct: number;
  recent_fallback_queries: FallbackQuery[];
  recent_queries: RecentQuery[];
  error?: string;
}

const TYPE_LABELS: Record<string, string> = {
  tool: 'Tool',
  category: 'Category',
  compare: 'Comparison',
  state: 'Agency / State',
  fallback: 'Fallback (no match)',
};

const TYPE_COLORS: Record<string, string> = {
  tool: 'bg-emerald-400',
  category: 'bg-indigo-400',
  compare: 'bg-violet-400',
  state: 'bg-amber-400',
  fallback: 'bg-rose-400',
};

function StatCard({ label, value, icon: Icon }: { label: string; value: string | number; icon: typeof Search }) {
  return (
    <div className="bg-white border border-slate-200 rounded-xl p-4">
      <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1 flex items-center gap-1.5">
        <Icon className="w-3.5 h-3.5" /> {label}
      </p>
      <p className="text-2xl font-bold text-[#0B1221] tabular-nums">{value}</p>
    </div>
  );
}

// Read-only observability for the homepage's smart-search chat (see
// src/components/home/HomeSmartSearch.tsx + supabase/functions/
// smart-search-route). The fallback-rate + recent-fallback-queries lists
// exist specifically to surface content gaps in visitors' own words: a
// query that lands on "fallback" means no category/tool/state confidently
// matched what they typed.
export default function WpAdminSmartSearchStatsPage() {
  const [stats, setStats] = useState<StatsResponse | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [tab, setTab] = useState<'fallback' | 'all'>('fallback');

  const fetchStats = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<StatsResponse>('admin-smart-search-stats');
    if (result.ok && result.data?.ok) {
      setStats(result.data);
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to load stats'));
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchStats();
  }, [fetchStats]);

  const total = stats?.totals.total || 0;
  const byType = stats?.by_type || {};

  return (
    <WpAdminLayout title="Smart Search" subtitle="What visitors type into the homepage's AI search, and where it sends them">
      <div className="p-6 max-w-5xl mx-auto space-y-5">
        {error && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5">{error}</p>}

        {loading ? (
          <p className="text-sm text-slate-400">Loading…</p>
        ) : !stats ? null : (
          <>
            <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
              <StatCard label="Total queries" value={total.toLocaleString()} icon={Search} />
              <StatCard label="Last 24h" value={stats.totals.last_24h.toLocaleString()} icon={TrendingUp} />
              <StatCard label="Last 7 days" value={stats.totals.last_7d.toLocaleString()} icon={TrendingUp} />
              <StatCard label="Fallback rate" value={`${stats.fallback_rate_pct}%`} icon={MousePointerClick} />
            </div>

            <div className="bg-white border border-slate-200 rounded-xl p-4">
              <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-3">Breakdown by destination</p>
              {total === 0 ? (
                <p className="text-xs text-slate-400">No queries logged yet.</p>
              ) : (
                <div className="space-y-2">
                  {Object.entries(TYPE_LABELS).map(([key, label]) => {
                    const count = byType[key] || 0;
                    const pct = total > 0 ? (count / total) * 100 : 0;
                    return (
                      <div key={key} className="flex items-center gap-3 text-xs">
                        <span className="w-36 shrink-0 font-medium text-slate-600">{label}</span>
                        <div className="flex-1 h-2 rounded-full bg-slate-100 overflow-hidden">
                          <div className={`h-full rounded-full ${TYPE_COLORS[key]}`} style={{ width: `${pct}%` }} />
                        </div>
                        <span className="w-20 shrink-0 text-right tabular-nums text-slate-500">
                          {count} ({pct.toFixed(0)}%)
                        </span>
                      </div>
                    );
                  })}
                </div>
              )}
            </div>

            <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
              <div className="flex border-b border-slate-100">
                <button
                  type="button"
                  onClick={() => setTab('fallback')}
                  className={`flex-1 px-4 py-2.5 text-sm font-medium transition-colors ${tab === 'fallback' ? 'text-indigo-600 bg-indigo-50' : 'text-slate-500 hover:bg-slate-50'}`}
                >
                  Fallback queries (content gaps)
                </button>
                <button
                  type="button"
                  onClick={() => setTab('all')}
                  className={`flex-1 px-4 py-2.5 text-sm font-medium transition-colors ${tab === 'all' ? 'text-indigo-600 bg-indigo-50' : 'text-slate-500 hover:bg-slate-50'}`}
                >
                  All recent queries
                </button>
              </div>

              {tab === 'fallback' ? (
                stats.recent_fallback_queries.length === 0 ? (
                  <p className="text-sm text-slate-400 p-6 text-center">No fallback queries recorded — every search so far found a confident match.</p>
                ) : (
                  <div className="overflow-x-auto">
                    <table className="w-full text-xs">
                      <thead>
                        <tr className="text-left text-slate-400 border-b border-slate-100">
                          <th className="px-4 py-2 font-semibold">Query</th>
                          <th className="px-4 py-2 font-semibold">When</th>
                        </tr>
                      </thead>
                      <tbody>
                        {stats.recent_fallback_queries.map((q, i) => (
                          <tr key={i} className="border-b border-slate-50 last:border-0">
                            <td className="px-4 py-2 text-slate-700">{q.query}</td>
                            <td className="px-4 py-2 whitespace-nowrap text-slate-500">{new Date(q.created_at).toLocaleString()}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                )
              ) : stats.recent_queries.length === 0 ? (
                <p className="text-sm text-slate-400 p-6 text-center">Nothing recorded yet.</p>
              ) : (
                <div className="overflow-x-auto">
                  <table className="w-full text-xs">
                    <thead>
                      <tr className="text-left text-slate-400 border-b border-slate-100">
                        <th className="px-4 py-2 font-semibold">Query</th>
                        <th className="px-4 py-2 font-semibold">Sent to</th>
                        <th className="px-4 py-2 font-semibold">Path</th>
                        <th className="px-4 py-2 font-semibold">When</th>
                      </tr>
                    </thead>
                    <tbody>
                      {stats.recent_queries.map((q, i) => (
                        <tr key={i} className="border-b border-slate-50 last:border-0">
                          <td className="px-4 py-2 text-slate-700">{q.query}</td>
                          <td className="px-4 py-2 text-slate-500">{TYPE_LABELS[q.result_type] || q.result_type}</td>
                          <td className="px-4 py-2 text-slate-400 font-mono truncate max-w-[220px]">{q.result_path}</td>
                          <td className="px-4 py-2 whitespace-nowrap text-slate-500">{new Date(q.created_at).toLocaleString()}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}

import { useState, useEffect, useCallback, useRef } from 'react';
import { useParams, useNavigate, useSearchParams, Link } from 'react-router-dom';
import {
  BarChart2, Users, Clock, TrendingUp, ArrowLeft, RefreshCw,
  ChevronDown, Search, MapPin, Eye, EyeOff, ExternalLink,
  Calendar, Activity, Target, Loader
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch, type AdminApiError } from '../lib/adminApiFetch';
import { AdminErrorBanner } from '../components/admin/AdminErrorBanner';
import AdminReAuthCard from '../components/admin/AdminReAuthCard';
import { formatStateName } from '../utils/formatLocation';

function formatDate(iso: string) {
  if (!iso) return '—';
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: '2-digit' });
}

function formatTimeAgo(iso: string) {
  if (!iso) return '—';
  const diff = Date.now() - new Date(iso).getTime();
  const m = Math.floor(diff / 60000);
  if (m < 60) return `${m}m ago`;
  const h = Math.floor(m / 60);
  if (h < 24) return `${h}h ago`;
  return `${Math.floor(h / 24)}d ago`;
}

const RANGE_OPTIONS = [
  { label: '24h', value: '1' },
  { label: '7d', value: '7' },
  { label: '30d', value: '30' },
  { label: '90d', value: '90' },
  { label: 'All', value: '0' },
];

// ── Mini bar chart ──────────────────────────────────────────────────────────
function MiniBarChart({ series }: { series: { date: string; count: number }[] }) {
  if (!series.length) return <p className="text-xs text-gray-400 py-4 text-center">No data for selected range.</p>;
  const max = Math.max(...series.map(s => s.count), 1);
  return (
    <div className="flex items-end gap-0.5 h-16 w-full overflow-hidden">
      {series.map(s => (
        <div
          key={s.date}
          title={`${s.date}: ${s.count}`}
          className="flex-1 bg-blue-500 rounded-t-sm min-w-[2px] transition-all hover:bg-blue-600"
          style={{ height: `${Math.max((s.count / max) * 100, 4)}%` }}
        />
      ))}
    </div>
  );
}

// ── KPI Card ─────────────────────────────────────────────────────────────────
function KpiCard({ label, value, sub }: { label: string; value: number | string; sub?: string }) {
  return (
    <div className="bg-white rounded-xl border border-gray-200 p-4">
      <p className="text-xs font-semibold text-gray-400 uppercase tracking-wide mb-1">{label}</p>
      <p className="text-2xl font-bold text-gray-900">{value}</p>
      {sub && <p className="text-xs text-gray-400 mt-0.5">{sub}</p>}
    </div>
  );
}

// ── Agency Detail View ────────────────────────────────────────────────────────
function AgencyDetailView({ agencyId }: { agencyId: string }) {
  const { status, isReady, isValid } = useAdminSession();
  const [searchParams, setSearchParams] = useSearchParams();
  const rangeDays = searchParams.get('range') ?? '30';
  const includeDemo = searchParams.get('demo') === '1';
  const [data, setData] = useState<Record<string, any> | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [apiError, setApiError] = useState<AdminApiError | null>(null);
  const [authError, setAuthError] = useState(false);
  const hasFetchedRef = useRef(false);

  const load = useCallback(async () => {
    if (!isReady || !isValid) {
      setAuthError(true);
      return;
    }
    setLoading(true);
    setError('');
    setApiError(null);

    const qs = new URLSearchParams({
      agency_id: agencyId,
      range_days: rangeDays,
      include_demo: includeDemo ? '1' : '0',
    }).toString();

    const result = await adminApiFetch<Record<string, any>>(`availability-analytics?${qs}`);

    if (!result.ok) {
      setLoading(false);
      if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
        setAuthError(true);
        return;
      }
      setApiError(result.error ?? null);
      setError(result.error?.message ?? 'Failed to load analytics');
      return;
    }

    setData(result.data ?? null);
    setLoading(false);
  }, [agencyId, rangeDays, includeDemo, isReady, isValid]);

  useEffect(() => {
    if (isReady && isValid && !hasFetchedRef.current) {
      hasFetchedRef.current = true;
      load();
    }
    if (isReady && !isValid) {
      setAuthError(true);
      hasFetchedRef.current = false;
    }
  }, [isReady, isValid, load]);

  useEffect(() => {
    if (isReady && isValid) {
      load();
    }
  }, [rangeDays, includeDemo]);

  const setRange = (v: string) => setSearchParams(p => { p.set('range', v); return p; });
  const toggleDemo = () => setSearchParams(p => { p.set('demo', includeDemo ? '0' : '1'); return p; });

  const handleAuthSuccess = () => {
    setAuthError(false);
    hasFetchedRef.current = false;
  };

  if (status === 'loading') {
    return (
      <WpAdminLayout>
        <div className="flex items-center justify-center py-20 gap-3">
          <Loader className="w-5 h-5 animate-spin text-blue-500" />
          <span className="text-sm text-gray-500">Restoring admin session...</span>
        </div>
      </WpAdminLayout>
    );
  }

  if (authError || status === 'invalid') {
    return (
      <WpAdminLayout>
        <div className="max-w-lg mx-auto mt-8">
          <AdminReAuthCard
            onSuccess={handleAuthSuccess}
            message="Your admin session is invalid or expired. Please log in again to view analytics."
          />
        </div>
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout>
      <div className="max-w-5xl mx-auto px-4 py-6 space-y-6">
        {/* Header */}
        <div className="flex items-center gap-3 flex-wrap">
          <Link
            to="/wp-admin/availability-analytics"
            className="flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-800 transition-colors"
          >
            <ArrowLeft className="w-4 h-4" />
            Leaderboard
          </Link>
          <span className="text-gray-300">/</span>
          <h1 className="text-lg font-bold text-gray-900 truncate">
            {loading ? 'Loading...' : (data?.agency_name || agencyId)}
          </h1>
        </div>

        {/* Controls */}
        <div className="flex items-center gap-3 flex-wrap">
          <div className="flex items-center bg-gray-100 rounded-lg p-1 gap-0.5">
            {RANGE_OPTIONS.map(o => (
              <button
                key={o.value}
                onClick={() => setRange(o.value)}
                className={`px-3 py-1 text-sm font-medium rounded-md transition-colors ${
                  rangeDays === o.value ? 'bg-white shadow text-gray-900' : 'text-gray-500 hover:text-gray-700'
                }`}
              >
                {o.label}
              </button>
            ))}
          </div>
          <button
            onClick={toggleDemo}
            className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-sm font-medium border transition-colors ${
              includeDemo
                ? 'border-red-300 bg-red-50 text-red-700'
                : 'border-gray-200 bg-white text-gray-500 hover:text-gray-700'
            }`}
          >
            {includeDemo ? <Eye className="w-3.5 h-3.5" /> : <EyeOff className="w-3.5 h-3.5" />}
            {includeDemo ? 'Demo ON' : 'Demo OFF'}
          </button>
          <button onClick={load} disabled={loading || !isValid} className="p-1.5 hover:bg-gray-100 rounded-lg transition-colors">
            <RefreshCw className={`w-4 h-4 text-gray-400 ${loading ? 'animate-spin' : ''}`} />
          </button>
        </div>

        {apiError && (
          <AdminErrorBanner
            error={apiError}
            onRetry={apiError.retryable ? () => { setApiError(null); load(); } : undefined}
            onLogin={() => setAuthError(true)}
          />
        )}
        {error && !apiError && (
          <div className="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-sm text-red-700">{error}</div>
        )}

        {loading ? (
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {Array.from({ length: 8 }).map((_, i) => (
              <div key={i} className="h-20 bg-gray-100 rounded-xl animate-pulse" />
            ))}
          </div>
        ) : data ? (
          <>
            {/* KPIs */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              <KpiCard label="Real Requests" value={data.kpis?.total_real ?? 0} sub="All time" />
              <KpiCard label="Demo Requests" value={data.kpis?.total_demo ?? 0} sub="All time" />
              <KpiCard label="Unique Requesters" value={data.kpis?.unique_requesters ?? 0} sub={`Last ${rangeDays === '0' ? 'all' : rangeDays + 'd'}`} />
              <KpiCard label="Last 24h" value={data.kpis?.last_1d ?? 0} sub="Real requests" />
            </div>
            <div className="grid grid-cols-3 gap-4">
              <KpiCard label="Last 7d" value={data.kpis?.last_7d ?? 0} />
              <KpiCard label="Last 30d" value={data.kpis?.last_30d ?? 0} />
              <KpiCard label="Last 90d" value={data.kpis?.last_90d ?? 0} />
            </div>

            {/* Trend chart */}
            <div className="bg-white rounded-xl border border-gray-200 p-5">
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-sm font-semibold text-gray-700 flex items-center gap-2">
                  <Activity className="w-4 h-4 text-blue-500" />
                  Daily Trend
                </h2>
                <span className="text-xs text-gray-400">{data.daily_series?.length ?? 0} days</span>
              </div>
              <MiniBarChart series={data.daily_series ?? []} />
              {data.daily_series?.length > 0 && (
                <div className="flex justify-between mt-2">
                  <span className="text-xs text-gray-400">{data.daily_series[0]?.date}</span>
                  <span className="text-xs text-gray-400">{data.daily_series[data.daily_series.length - 1]?.date}</span>
                </div>
              )}
            </div>

            {/* By state + Recent requests */}
            <div className="grid md:grid-cols-2 gap-4">
              {/* By State */}
              <div className="bg-white rounded-xl border border-gray-200 p-5">
                <h2 className="text-sm font-semibold text-gray-700 flex items-center gap-2 mb-4">
                  <MapPin className="w-4 h-4 text-emerald-500" />
                  Top States
                </h2>
                {(data.by_state ?? []).length === 0 ? (
                  <p className="text-xs text-gray-400 py-4 text-center">No state data.</p>
                ) : (
                  <div className="space-y-2">
                    {(data.by_state ?? []).slice(0, 10).map((s: any, i: number) => {
                      const max = data.by_state[0]?.count ?? 1;
                      return (
                        <div key={s.state_slug} className="flex items-center gap-3">
                          <span className="text-xs text-gray-400 w-4">{i + 1}</span>
                          <div className="flex-1 min-w-0">
                            <div className="flex justify-between mb-0.5">
                              <span className="text-xs font-medium text-gray-700">{formatStateName(s.state_slug)}</span>
                              <span className="text-xs text-gray-500">{s.count}</span>
                            </div>
                            <div className="h-1.5 bg-gray-100 rounded-full overflow-hidden">
                              <div
                                className="h-full bg-blue-400 rounded-full"
                                style={{ width: `${(s.count / max) * 100}%` }}
                              />
                            </div>
                          </div>
                        </div>
                      );
                    })}
                  </div>
                )}
              </div>

              {/* Recent Requests */}
              <div className="bg-white rounded-xl border border-gray-200 p-5">
                <h2 className="text-sm font-semibold text-gray-700 flex items-center gap-2 mb-4">
                  <Clock className="w-4 h-4 text-amber-500" />
                  Recent Requests
                </h2>
                {(data.recent_requests ?? []).length === 0 ? (
                  <p className="text-xs text-gray-400 py-4 text-center">No requests found.</p>
                ) : (
                  <div className="space-y-2.5">
                    {(data.recent_requests ?? []).slice(0, 10).map((r: any) => (
                      <div key={r.id} className="flex items-start gap-2 py-1.5 border-b border-gray-50 last:border-0">
                        <div className="flex-1 min-w-0">
                          <div className="flex items-center gap-2 flex-wrap">
                            <span className="text-xs font-medium text-gray-700 truncate">
                              {r.requester_email || '—'}
                            </span>
                            {r.is_demo && (
                              <span className="text-[10px] font-bold px-1.5 py-0.5 rounded-full bg-red-100 text-red-600">Demo</span>
                            )}
                            {r.paid_status === 'paid' && (
                              <span className="text-[10px] font-bold px-1.5 py-0.5 rounded-full bg-emerald-100 text-emerald-700">Paid</span>
                            )}
                          </div>
                          <div className="flex items-center gap-2 mt-0.5">
                            {r.state_slug && (
                              <span className="text-[10px] text-gray-400">{formatStateName(r.state_slug)}</span>
                            )}
                            <span className="text-[10px] text-gray-400">{formatTimeAgo(r.created_at)}</span>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            </div>
          </>
        ) : null}
      </div>
    </WpAdminLayout>
  );
}

// ── Leaderboard View ──────────────────────────────────────────────────────────
function LeaderboardView() {
  const { status, isReady, isValid } = useAdminSession();
  const [searchParams, setSearchParams] = useSearchParams();
  const navigate = useNavigate();
  const rangeDays = searchParams.get('range') ?? '30';
  const includeDemo = searchParams.get('demo') === '1';
  const stateFilter = searchParams.get('state') ?? '';

  const [data, setData] = useState<Record<string, any> | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [apiError, setApiError] = useState<AdminApiError | null>(null);
  const [authError, setAuthError] = useState(false);
  const [search, setSearch] = useState('');
  const searchTimeout = useRef<ReturnType<typeof setTimeout> | null>(null);
  const hasFetchedRef = useRef(false);

  const load = useCallback(async (q = '') => {
    if (!isReady || !isValid) {
      setAuthError(true);
      return;
    }
    setLoading(true);
    setError('');
    setApiError(null);

    const params: Record<string, string> = {
      range_days: rangeDays,
      include_demo: includeDemo ? '1' : '0',
      limit: '50',
    };
    if (stateFilter) params.state = stateFilter;
    if (q) params.q = q;

    const qs = new URLSearchParams(params).toString();
    const result = await adminApiFetch<Record<string, any>>(`availability-analytics?${qs}`);

    if (!result.ok) {
      setLoading(false);
      if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
        setAuthError(true);
        return;
      }
      setApiError(result.error ?? null);
      setError(result.error?.message ?? 'Failed to load analytics');
      return;
    }

    setData(result.data ?? null);
    setLoading(false);
  }, [rangeDays, includeDemo, stateFilter, isReady, isValid]);

  useEffect(() => {
    if (isReady && isValid && !hasFetchedRef.current) {
      hasFetchedRef.current = true;
      load(search);
    }
    if (isReady && !isValid) {
      setAuthError(true);
      hasFetchedRef.current = false;
    }
  }, [isReady, isValid, load, search]);

  useEffect(() => {
    if (isReady && isValid) {
      load(search);
    }
  }, [rangeDays, includeDemo, stateFilter]);

  const handleSearch = (v: string) => {
    setSearch(v);
    if (searchTimeout.current) clearTimeout(searchTimeout.current);
    searchTimeout.current = setTimeout(() => {
      if (isReady && isValid) {
        load(v);
      }
    }, 400);
  };

  const setRange = (v: string) => setSearchParams(p => { p.set('range', v); return p; });
  const toggleDemo = () => setSearchParams(p => { p.set('demo', includeDemo ? '0' : '1'); return p; });

  const leaderboard: any[] = data?.leaderboard ?? [];

  const handleAuthSuccess = () => {
    setAuthError(false);
    hasFetchedRef.current = false;
  };

  if (status === 'loading') {
    return (
      <WpAdminLayout>
        <div className="flex items-center justify-center py-20 gap-3">
          <Loader className="w-5 h-5 animate-spin text-blue-500" />
          <span className="text-sm text-gray-500">Restoring admin session...</span>
        </div>
      </WpAdminLayout>
    );
  }

  if (authError || status === 'invalid') {
    return (
      <WpAdminLayout>
        <div className="max-w-lg mx-auto mt-8">
          <AdminReAuthCard
            onSuccess={handleAuthSuccess}
            message="Your admin session is invalid or expired. Please log in again to view analytics."
          />
        </div>
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout>
      <div className="max-w-5xl mx-auto px-4 py-6 space-y-5">
        {/* Page header */}
        <div className="flex items-center justify-between flex-wrap gap-3">
          <div>
            <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
              <BarChart2 className="w-5 h-5 text-blue-600" />
              Availability Analytics
            </h1>
            <p className="text-sm text-gray-500 mt-0.5">See which agencies get the most availability checks</p>
          </div>
          <Link
            to="/wp-admin/submissions"
            className="flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-800 border border-gray-200 rounded-lg px-3 py-1.5 transition-colors"
          >
            <ExternalLink className="w-3.5 h-3.5" />
            Submissions Center
          </Link>
        </div>

        {apiError && (
          <AdminErrorBanner
            error={apiError}
            onRetry={apiError.retryable ? () => { setApiError(null); load(search); } : undefined}
            onLogin={() => setAuthError(true)}
          />
        )}

        {/* Controls */}
        <div className="flex items-center gap-3 flex-wrap">
          <div className="flex items-center bg-gray-100 rounded-lg p-1 gap-0.5">
            {RANGE_OPTIONS.map(o => (
              <button
                key={o.value}
                onClick={() => setRange(o.value)}
                className={`px-3 py-1 text-sm font-medium rounded-md transition-colors ${
                  rangeDays === o.value ? 'bg-white shadow text-gray-900' : 'text-gray-500 hover:text-gray-700'
                }`}
              >
                {o.label}
              </button>
            ))}
          </div>

          <button
            onClick={toggleDemo}
            className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-sm font-medium border transition-colors ${
              includeDemo
                ? 'border-red-300 bg-red-50 text-red-700'
                : 'border-gray-200 bg-white text-gray-500 hover:text-gray-700'
            }`}
          >
            {includeDemo ? <Eye className="w-3.5 h-3.5" /> : <EyeOff className="w-3.5 h-3.5" />}
            {includeDemo ? 'Demo ON' : 'Demo OFF'}
          </button>

          <div className="relative flex-1 max-w-xs">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-gray-400 pointer-events-none" />
            <input
              value={search}
              onChange={e => handleSearch(e.target.value)}
              placeholder="Search agency…"
              className="w-full pl-9 pr-3 py-1.5 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>

          <button onClick={() => load(search)} disabled={loading || !isValid} className="p-1.5 hover:bg-gray-100 rounded-lg transition-colors">
            <RefreshCw className={`w-4 h-4 text-gray-400 ${loading ? 'animate-spin' : ''}`} />
          </button>
        </div>

        <div className="text-xs text-gray-400 bg-gray-50 border border-gray-200 rounded-lg px-3 py-2">
          Confidence filtering is not available for this dataset yet.
        </div>

        {error && !apiError && (
          <div className="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-sm text-red-700">{error}</div>
        )}

        {/* Summary */}
        {!loading && data && (
          <p className="text-xs text-gray-400">
            {data.total} agencies found · last {rangeDays === '0' ? 'all time' : `${rangeDays}d`}
            {!includeDemo && ' · demo excluded'}
          </p>
        )}

        {/* Table */}
        <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide w-10">#</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">Agency</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">Real</th>
                  {includeDemo && (
                    <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">Demo</th>
                  )}
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">Unique</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">Top States</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">Last Request</th>
                  <th className="px-4 py-3 w-10" />
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {loading ? (
                  Array.from({ length: 8 }).map((_, i) => (
                    <tr key={i}>
                      {Array.from({ length: includeDemo ? 8 : 7 }).map((__, j) => (
                        <td key={j} className="px-4 py-3">
                          <div className="h-4 bg-gray-100 rounded animate-pulse" style={{ width: `${50 + (i + j) % 4 * 10}%` }} />
                        </td>
                      ))}
                    </tr>
                  ))
                ) : leaderboard.length === 0 ? (
                  <tr>
                    <td colSpan={includeDemo ? 8 : 7} className="px-4 py-16 text-center text-gray-400">
                      <BarChart2 className="w-8 h-8 mx-auto mb-2 text-gray-300" />
                      <p className="text-sm">No availability checks found for this range.</p>
                    </td>
                  </tr>
                ) : (
                  leaderboard.map(row => (
                    <tr
                      key={row.agency_id}
                      className="hover:bg-slate-50 cursor-pointer transition-colors"
                      onClick={() => navigate(`/wp-admin/availability-analytics/agency/${row.agency_id}?range=${rangeDays}&demo=${includeDemo ? '1' : '0'}`)}
                    >
                      <td className="px-4 py-3 text-xs text-gray-400 font-mono">{row.rank}</td>
                      <td className="px-4 py-3">
                        <p className="font-semibold text-gray-800 text-sm truncate max-w-[200px]">
                          {row.agency_name || row.agency_id}
                        </p>
                        <p className="text-xs text-gray-400 font-mono truncate">{row.agency_id}</p>
                      </td>
                      <td className="px-4 py-3">
                        <span className="text-sm font-bold text-gray-900">{row.real_count}</span>
                      </td>
                      {includeDemo && (
                        <td className="px-4 py-3">
                          <span className="text-sm font-semibold text-red-600">{row.demo_count}</span>
                        </td>
                      )}
                      <td className="px-4 py-3">
                        <span className="text-sm text-gray-600">{row.unique_requesters}</span>
                      </td>
                      <td className="px-4 py-3">
                        <div className="flex gap-1 flex-wrap">
                          {(row.top_states ?? []).slice(0, 3).map((s: string) => (
                            <span key={s} className="text-[10px] font-mono bg-gray-100 text-gray-600 px-1.5 py-0.5 rounded uppercase">
                              {s}
                            </span>
                          ))}
                        </div>
                      </td>
                      <td className="px-4 py-3 text-xs text-gray-400 whitespace-nowrap">
                        {formatTimeAgo(row.last_request_at)}
                      </td>
                      <td className="px-4 py-3">
                        <ExternalLink className="w-3.5 h-3.5 text-gray-300 hover:text-blue-500 transition-colors" />
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </WpAdminLayout>
  );
}

// ── Router shim ───────────────────────────────────────────────────────────────
export default function WpAdminAvailabilityAnalyticsPage() {
  const { agencyId } = useParams<{ agencyId?: string }>();
  if (agencyId) return <AgencyDetailView agencyId={agencyId} />;
  return <LeaderboardView />;
}

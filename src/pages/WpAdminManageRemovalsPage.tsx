import { useState, useEffect, useCallback, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  EyeOff, RefreshCw, Search, Filter, ExternalLink, ChevronDown,
  Building2, TrendingDown, TrendingUp, Activity, MapPin, AlertTriangle,
  Loader2, ArrowUpDown, ChevronLeft, ChevronRight, RotateCcw, Clock,
  CheckCircle2, XCircle, Minus,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import AdminReAuthCard from '../components/admin/AdminReAuthCard';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface RemovalRow {
  agency_id: string;
  agency_name: string;
  agency_slug: string;
  state_slug: string;
  primary_email: string;
  listing_management_status: string;
  is_active: boolean;
  agency_created_at: string | null;
  manage_event_count: number;
  manage_opened_count: number;
  manage_remove_started_count: number;
  manage_recovered_count: number;
  manage_remove_confirmed_count: number;
  last_manage_event_type: string | null;
  last_manage_event_at: string | null;
  first_manage_opened_at: string | null;
  last_manage_recovery_type: string | null;
  manage_current_outcome: string;
  manage_listing_url: string | null;
  recovery_priority: string | null;
  positive_intent_score: number | null;
  churn_intent_score: number | null;
  final_priority_score: number | null;
}

interface Summary {
  total: number;
  hidden_self_removed: number;
  recovered: number;
  remove_intent: number;
  opened_only: number;
  affected_states: number;
}

const OUTCOME_LABELS: Record<string, { label: string; color: string; icon: React.ReactNode }> = {
  removed:         { label: 'Hidden by owner',    color: 'bg-red-50 text-red-700 border-red-200',     icon: <EyeOff className="w-3 h-3" /> },
  hidden_self_removed: { label: 'Hidden by owner', color: 'bg-red-50 text-red-700 border-red-200',    icon: <EyeOff className="w-3 h-3" /> },
  recovered:       { label: 'Recovered',           color: 'bg-emerald-50 text-emerald-700 border-emerald-200', icon: <CheckCircle2 className="w-3 h-3" /> },
  remove_intent:   { label: 'Removal intent',      color: 'bg-amber-50 text-amber-700 border-amber-200',      icon: <TrendingDown className="w-3 h-3" /> },
  opened:          { label: 'Opened only',          color: 'bg-blue-50 text-blue-700 border-blue-200',         icon: <Activity className="w-3 h-3" /> },
  unknown:         { label: 'Unknown',              color: 'bg-slate-50 text-slate-500 border-slate-200',      icon: <Minus className="w-3 h-3" /> },
};

const MGMT_STATUS_LABELS: Record<string, { label: string; color: string }> = {
  removal_pending: { label: 'Hidden by owner', color: 'text-red-600 bg-red-50 border-red-200' },
  active:          { label: 'Active',           color: 'text-emerald-700 bg-emerald-50 border-emerald-200' },
  visible_free:    { label: 'Visible (free)',   color: 'text-sky-700 bg-sky-50 border-sky-200' },
  active_paid:     { label: 'Active paid',      color: 'text-emerald-800 bg-emerald-100 border-emerald-300' },
  removed:         { label: 'Removed',          color: 'text-slate-500 bg-slate-100 border-slate-200' },
  '':              { label: '—',                color: 'text-slate-400 bg-slate-50 border-slate-100' },
};

const EVENT_TYPE_LABELS: Record<string, string> = {
  manage_funnel_opened:    'Opened',
  manage_remove_started:   'Remove started',
  manage_recovered:        'Recovered',
  manage_remove_confirmed: 'Removal confirmed',
};

function slugToStateName(slug: string): string {
  return slug ? slug.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ') : '—';
}

function fmtDate(iso: string | null): string {
  if (!iso) return '—';
  const d = new Date(iso);
  return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

function fmtRelative(iso: string | null): string {
  if (!iso) return '—';
  const diff = Date.now() - new Date(iso).getTime();
  const mins = Math.floor(diff / 60000);
  if (mins < 60)   return `${mins}m ago`;
  const hrs = Math.floor(mins / 60);
  if (hrs < 24)    return `${hrs}h ago`;
  const days = Math.floor(hrs / 24);
  if (days < 30)   return `${days}d ago`;
  return fmtDate(iso);
}

function OutcomeBadge({ outcome }: { outcome: string }) {
  const isHidden = outcome === 'removed';
  const key = isHidden ? 'removed' : outcome;
  const cfg = OUTCOME_LABELS[key] || OUTCOME_LABELS.unknown;
  return (
    <span className={`inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded border ${cfg.color}`}>
      {cfg.icon}{cfg.label}
    </span>
  );
}

function MgmtStatusBadge({ status }: { status: string | null }) {
  const key = status ?? '';
  const cfg = MGMT_STATUS_LABELS[key] || MGMT_STATUS_LABELS[''];
  return (
    <span className={`text-[11px] font-medium px-2 py-0.5 rounded border ${cfg.color}`}>
      {cfg.label}
    </span>
  );
}

const RECOVERY_PRIORITY_CFG: Record<string, { label: string; color: string }> = {
  high:   { label: 'High',   color: 'text-orange-700 bg-orange-50 border-orange-300' },
  medium: { label: 'Medium', color: 'text-amber-700 bg-amber-50 border-amber-200' },
  low:    { label: 'Low',    color: 'text-slate-600 bg-slate-100 border-slate-200' },
  none:   { label: 'None',   color: 'text-slate-400 bg-slate-50 border-slate-100' },
};

function RecoveryBadge({ priority }: { priority: string | null }) {
  const key = priority && RECOVERY_PRIORITY_CFG[priority] ? priority : 'none';
  const cfg = RECOVERY_PRIORITY_CFG[key];
  return (
    <span className={`text-[11px] font-semibold px-2 py-0.5 rounded border ${cfg.color}`}>
      {cfg.label}
    </span>
  );
}

function SummaryCard({
  label, value, sub, icon, accent,
}: {
  label: string; value: number; sub?: string; icon: React.ReactNode; accent?: string;
}) {
  return (
    <div className="bg-white border border-slate-200 rounded-xl p-4 flex items-start gap-3 shadow-sm">
      <div className={`w-9 h-9 rounded-lg flex items-center justify-center shrink-0 ${accent || 'bg-slate-100 text-slate-500'}`}>
        {icon}
      </div>
      <div className="min-w-0">
        <p className="text-2xl font-bold text-slate-900 leading-tight">{value.toLocaleString()}</p>
        <p className="text-xs font-medium text-slate-600 mt-0.5">{label}</p>
        {sub && <p className="text-[11px] text-slate-400 mt-0.5">{sub}</p>}
      </div>
    </div>
  );
}

const PAGE_SIZE = 50;

export default function WpAdminManageRemovalsPage() {
  const navigate = useNavigate();
  const { token, isReady, isValid, logout } = useAdminSession();

  const [rows, setRows]           = useState<RemovalRow[]>([]);
  const [summary, setSummary]     = useState<Summary | null>(null);
  const [loading, setLoading]     = useState(false);
  const [error, setError]         = useState<string | null>(null);
  const [offset, setOffset]       = useState(0);
  const [hasMore, setHasMore]     = useState(false);
  const [needsReAuth, setNeedsReAuth] = useState(false);

  const [filterState,   setFilterState]   = useState('');
  const [filterOutcome, setFilterOutcome] = useState('');
  const [filterSearch,  setFilterSearch]  = useState('');
  const [filterDateFrom, setFilterDateFrom] = useState('');
  const [filterDateTo,   setFilterDateTo]   = useState('');
  const [showFilters, setShowFilters]     = useState(false);

  const searchRef = useRef<HTMLInputElement>(null);
  const abortRef  = useRef<AbortController | null>(null);

  const fetchRows = useCallback(async (pageOffset = 0, replace = true) => {
    if (!token) return;
    if (abortRef.current) abortRef.current.abort();
    const ctrl = new AbortController();
    abortRef.current = ctrl;

    setLoading(true);
    setError(null);
    if (replace) setRows([]);

    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/manage-removals-admin`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
        },
        body: JSON.stringify({
          state:     filterState   || null,
          outcome:   filterOutcome || null,
          search:    filterSearch  || null,
          date_from: filterDateFrom ? new Date(filterDateFrom).toISOString() : null,
          date_to:   filterDateTo   ? new Date(filterDateTo + 'T23:59:59').toISOString() : null,
          limit:     PAGE_SIZE,
          offset:    pageOffset,
        }),
        signal: ctrl.signal,
      });

      const data = await res.json();
      if (!data.ok) throw new Error(data.error || 'Request failed');

      const newRows = (data.rows || []) as RemovalRow[];
      setRows(prev => replace ? newRows : [...prev, ...newRows]);
      setHasMore(newRows.length === PAGE_SIZE);
      setOffset(pageOffset);
      if (data.summary) setSummary(data.summary);
    } catch (e) {
      if ((e as Error).name !== 'AbortError') {
        const msg = (e as Error).message || 'Failed to load';
        if (msg.toLowerCase().includes('session') || msg.toLowerCase().includes('expired') || msg.toLowerCase().includes('unauthorized')) {
          setNeedsReAuth(true);
          logout();
        } else {
          setError(msg);
        }
      }
    } finally {
      setLoading(false);
      abortRef.current = null;
    }
  }, [token, filterState, filterOutcome, filterSearch, filterDateFrom, filterDateTo, logout]);

  useEffect(() => {
    fetchRows(0, true);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [token]);

  const handleApply = useCallback(() => {
    fetchRows(0, true);
  }, [fetchRows]);

  const handleReset = useCallback(() => {
    setFilterState('');
    setFilterOutcome('');
    setFilterSearch('');
    setFilterDateFrom('');
    setFilterDateTo('');
  }, []);

  const handlePrev = () => {
    const newOffset = Math.max(0, offset - PAGE_SIZE);
    fetchRows(newOffset, true);
  };

  const handleNext = () => {
    fetchRows(offset + PAGE_SIZE, true);
  };

  const openDossier = (agencyId: string) => {
    navigate(`/wp-admin/email/agency-lookup?agency_id=${encodeURIComponent(agencyId)}`);
  };

  const activeFilters = [filterState, filterOutcome, filterSearch, filterDateFrom, filterDateTo].filter(Boolean).length;

  const handleReAuthSuccess = useCallback(() => {
    setNeedsReAuth(false);
    setError(null);
    fetchRows(0, true);
  }, [fetchRows]);

  if (!isReady) {
    return (
      <WpAdminLayout title="Manage Removals" icon={<EyeOff className="w-5 h-5" />}>
        <div className="flex items-center justify-center py-24 text-slate-400">
          <Loader2 className="w-5 h-5 animate-spin mr-2" />
          <span className="text-sm">Initializing admin session...</span>
        </div>
      </WpAdminLayout>
    );
  }

  if (!isValid || needsReAuth) {
    return (
      <WpAdminLayout title="Manage Removals" icon={<EyeOff className="w-5 h-5" />}>
        <div className="max-w-lg mx-auto py-12">
          <AdminReAuthCard onSuccess={handleReAuthSuccess} />
        </div>
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout title="Manage Removals" icon={<EyeOff className="w-5 h-5" />}>
      <div className="max-w-7xl mx-auto space-y-5">

        {/* Header */}
        <div className="flex items-start justify-between gap-4 flex-wrap">
          <div>
            <h1 className="text-lg font-bold text-slate-900">Manage Funnel Dashboard</h1>
            <p className="text-sm text-slate-400 mt-0.5">
              Agencies that entered the manage/remove funnel — internally preserved, not hard-deleted.
            </p>
          </div>
          <button
            onClick={() => fetchRows(0, true)}
            disabled={loading}
            className="flex items-center gap-2 text-sm font-medium text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 disabled:opacity-40 px-4 py-2 rounded-lg transition-colors shadow-sm"
          >
            <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} />
            Refresh
          </button>
        </div>

        {/* Summary Cards */}
        {summary && (
          <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-3">
            <SummaryCard
              label="Total in funnel"
              value={summary.total}
              icon={<Building2 className="w-4 h-4" />}
              accent="bg-slate-100 text-slate-600"
            />
            <SummaryCard
              label="Hidden by owner"
              value={summary.hidden_self_removed}
              sub="removal_pending"
              icon={<EyeOff className="w-4 h-4" />}
              accent="bg-red-50 text-red-600"
            />
            <SummaryCard
              label="Recovered"
              value={summary.recovered}
              icon={<CheckCircle2 className="w-4 h-4" />}
              accent="bg-emerald-50 text-emerald-600"
            />
            <SummaryCard
              label="Removal intent"
              value={summary.remove_intent}
              icon={<TrendingDown className="w-4 h-4" />}
              accent="bg-amber-50 text-amber-600"
            />
            <SummaryCard
              label="Opened only"
              value={summary.opened_only}
              icon={<Activity className="w-4 h-4" />}
              accent="bg-blue-50 text-blue-600"
            />
            <SummaryCard
              label="Affected states"
              value={summary.affected_states}
              icon={<MapPin className="w-4 h-4" />}
              accent="bg-slate-100 text-slate-600"
            />
          </div>
        )}

        {/* Filters */}
        <div className="bg-white border border-slate-200 rounded-xl shadow-sm overflow-hidden">
          <div
            className="flex items-center justify-between px-4 py-3 cursor-pointer hover:bg-slate-50 transition-colors"
            onClick={() => setShowFilters(f => !f)}
          >
            <div className="flex items-center gap-2 text-sm font-medium text-slate-700">
              <Filter className="w-4 h-4 text-slate-400" />
              Filters
              {activeFilters > 0 && (
                <span className="text-[11px] font-semibold bg-blue-100 text-blue-700 px-2 py-0.5 rounded-full">
                  {activeFilters} active
                </span>
              )}
            </div>
            <ChevronDown className={`w-4 h-4 text-slate-400 transition-transform ${showFilters ? 'rotate-180' : ''}`} />
          </div>

          {showFilters && (
            <div className="px-4 pb-4 border-t border-slate-100 pt-4 space-y-4">
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3">

                {/* Search */}
                <div className="relative lg:col-span-2">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-300" />
                  <input
                    ref={searchRef}
                    type="text"
                    value={filterSearch}
                    onChange={e => setFilterSearch(e.target.value)}
                    onKeyDown={e => e.key === 'Enter' && handleApply()}
                    placeholder="Search name, slug, email, or agency ID…"
                    className="w-full pl-9 pr-3 py-2 text-sm border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 placeholder:text-slate-300"
                  />
                </div>

                {/* Outcome filter */}
                <select
                  value={filterOutcome}
                  onChange={e => setFilterOutcome(e.target.value)}
                  className="text-sm border border-slate-200 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 text-slate-700"
                >
                  <option value="">All outcomes</option>
                  <option value="hidden_self_removed">Hidden by owner</option>
                  <option value="recovered">Recovered</option>
                  <option value="remove_intent">Removal intent</option>
                  <option value="opened">Opened only</option>
                </select>

                {/* State filter */}
                <input
                  type="text"
                  value={filterState}
                  onChange={e => setFilterState(e.target.value)}
                  placeholder="State slug (e.g. new-jersey)"
                  className="text-sm border border-slate-200 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 placeholder:text-slate-300"
                />

                {/* Date from */}
                <div>
                  <label className="block text-[11px] text-slate-400 mb-1">From date</label>
                  <input
                    type="date"
                    value={filterDateFrom}
                    onChange={e => setFilterDateFrom(e.target.value)}
                    className="w-full text-sm border border-slate-200 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 text-slate-700"
                  />
                </div>

                {/* Date to */}
                <div>
                  <label className="block text-[11px] text-slate-400 mb-1">To date</label>
                  <input
                    type="date"
                    value={filterDateTo}
                    onChange={e => setFilterDateTo(e.target.value)}
                    className="w-full text-sm border border-slate-200 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 text-slate-700"
                  />
                </div>
              </div>

              <div className="flex items-center gap-2">
                <button
                  onClick={handleApply}
                  className="flex items-center gap-2 text-sm font-semibold text-white bg-slate-800 hover:bg-slate-900 px-4 py-2 rounded-lg transition-colors"
                >
                  <ArrowUpDown className="w-3.5 h-3.5" />
                  Apply filters
                </button>
                {activeFilters > 0 && (
                  <button
                    onClick={() => { handleReset(); setTimeout(() => fetchRows(0, true), 50); }}
                    className="flex items-center gap-1.5 text-sm text-slate-500 hover:text-slate-700 px-3 py-2 rounded-lg hover:bg-slate-50 transition-colors"
                  >
                    <RotateCcw className="w-3.5 h-3.5" />
                    Reset
                  </button>
                )}
              </div>
            </div>
          )}
        </div>

        {/* Error */}
        {error && (
          <div className="flex items-center gap-3 bg-red-50 border border-red-200 rounded-xl px-4 py-3">
            <AlertTriangle className="w-4 h-4 text-red-500 shrink-0" />
            <p className="text-sm text-red-700 font-medium">{error}</p>
          </div>
        )}

        {/* Table */}
        <div className="bg-white border border-slate-200 rounded-xl shadow-sm overflow-hidden">

          {/* Table header meta */}
          <div className="px-5 py-3 border-b border-slate-100 flex items-center justify-between gap-3 flex-wrap">
            <div className="flex items-center gap-2">
              <span className="text-sm font-semibold text-slate-700">
                {loading ? 'Loading…' : `${rows.length} agencies`}
              </span>
              {offset > 0 && (
                <span className="text-xs text-slate-400">
                  (showing {offset + 1}–{offset + rows.length})
                </span>
              )}
            </div>
            <p className="text-xs text-slate-400">Click agency name to open full dossier</p>
          </div>

          {loading && rows.length === 0 ? (
            <div className="flex items-center justify-center py-16">
              <Loader2 className="w-6 h-6 animate-spin text-slate-300" />
            </div>
          ) : rows.length === 0 ? (
            <div className="py-16 text-center">
              <EyeOff className="w-8 h-8 text-slate-200 mx-auto mb-3" />
              <p className="text-sm font-medium text-slate-500">No agencies found</p>
              <p className="text-xs text-slate-400 mt-1">Try adjusting the filters or refreshing</p>
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-100 bg-slate-50/50">
                    <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Agency</th>
                    <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">State</th>
                    <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Listing status</th>
                    <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Outcome</th>
                    <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Recovery</th>
                    <th className="text-right px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">+Intent</th>
                    <th className="text-right px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Churn</th>
                    <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Last event</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Opened</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Remove started</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Confirmed</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Recovered</th>
                    <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Last event type</th>
                    <th className="text-right px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide whitespace-nowrap">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-50">
                  {rows.map(row => (
                    <tr key={row.agency_id} className="hover:bg-slate-50/60 transition-colors group">

                      {/* Agency name */}
                      <td className="px-4 py-3 min-w-[200px] max-w-[260px]">
                        <button
                          onClick={() => openDossier(row.agency_id)}
                          className="text-left group-hover:text-blue-700 font-medium text-slate-800 transition-colors hover:underline leading-tight truncate block max-w-full"
                          title={row.agency_name}
                        >
                          {row.agency_name || '(unnamed)'}
                        </button>
                        {row.primary_email && (
                          <p className="text-[11px] text-slate-400 mt-0.5 truncate">{row.primary_email}</p>
                        )}
                        <p className="text-[10px] text-slate-300 mt-0.5 font-mono truncate" title={row.agency_id}>
                          {row.agency_id.slice(0, 8)}…
                        </p>
                        <div className="flex items-center gap-2 mt-1 flex-wrap">
                          {row.agency_slug && (
                            <a
                              href={`/your-agency/${row.agency_slug}`}
                              target="_blank"
                              rel="noopener noreferrer"
                              onClick={e => e.stopPropagation()}
                              className="inline-flex items-center gap-0.5 text-[10px] text-slate-400 hover:text-blue-600 transition-colors"
                              title="Open your-agency page"
                            >
                              <ExternalLink className="w-2.5 h-2.5" />
                              profile
                            </a>
                          )}
                          {row.manage_listing_url && (
                            <a
                              href={row.manage_listing_url}
                              target="_blank"
                              rel="noopener noreferrer"
                              onClick={e => e.stopPropagation()}
                              className="inline-flex items-center gap-0.5 text-[10px] text-slate-400 hover:text-amber-600 transition-colors"
                              title="Open manage listing URL"
                            >
                              <ExternalLink className="w-2.5 h-2.5" />
                              manage
                            </a>
                          )}
                        </div>
                      </td>

                      {/* State */}
                      <td className="px-4 py-3 whitespace-nowrap">
                        <span className="text-xs text-slate-600">{slugToStateName(row.state_slug)}</span>
                      </td>

                      {/* Listing management status */}
                      <td className="px-4 py-3 whitespace-nowrap">
                        <MgmtStatusBadge status={row.listing_management_status} />
                      </td>

                      {/* Outcome */}
                      <td className="px-4 py-3 whitespace-nowrap">
                        <OutcomeBadge outcome={row.manage_current_outcome} />
                      </td>

                      {/* Recovery priority */}
                      <td className="px-4 py-3 whitespace-nowrap">
                        <RecoveryBadge priority={row.recovery_priority} />
                      </td>

                      {/* Positive intent score */}
                      <td className="px-4 py-3 text-right whitespace-nowrap">
                        {(row.positive_intent_score ?? 0) > 0 ? (
                          <span className="text-xs font-semibold text-emerald-700">
                            {Math.round(row.positive_intent_score!)}
                          </span>
                        ) : (
                          <span className="text-xs text-slate-300">0</span>
                        )}
                      </td>

                      {/* Churn intent score */}
                      <td className="px-4 py-3 text-right whitespace-nowrap">
                        {(row.churn_intent_score ?? 0) > 0 ? (
                          <span className="text-xs font-semibold text-red-600">
                            {Math.round(row.churn_intent_score!)}
                          </span>
                        ) : (
                          <span className="text-xs text-slate-300">0</span>
                        )}
                      </td>

                      {/* Last event at */}
                      <td className="px-4 py-3 whitespace-nowrap">
                        <div className="flex items-center gap-1.5 text-xs text-slate-500">
                          <Clock className="w-3 h-3 text-slate-300 shrink-0" />
                          {fmtRelative(row.last_manage_event_at)}
                        </div>
                        {row.last_manage_event_at && (
                          <p className="text-[10px] text-slate-300 mt-0.5">{fmtDate(row.last_manage_event_at)}</p>
                        )}
                      </td>

                      {/* manage_opened_count */}
                      <td className="px-4 py-3 text-center">
                        <span className={`text-xs font-semibold ${row.manage_opened_count > 0 ? 'text-blue-600' : 'text-slate-300'}`}>
                          {row.manage_opened_count}
                        </span>
                      </td>

                      {/* manage_remove_started_count */}
                      <td className="px-4 py-3 text-center">
                        <span className={`text-xs font-semibold ${row.manage_remove_started_count > 0 ? 'text-amber-600' : 'text-slate-300'}`}>
                          {row.manage_remove_started_count}
                        </span>
                      </td>

                      {/* manage_remove_confirmed_count */}
                      <td className="px-4 py-3 text-center">
                        {row.manage_remove_confirmed_count > 0 ? (
                          <span className="inline-flex items-center gap-1 text-xs font-semibold text-red-600">
                            <XCircle className="w-3 h-3" />
                            {row.manage_remove_confirmed_count}
                          </span>
                        ) : (
                          <span className="text-xs text-slate-300">0</span>
                        )}
                      </td>

                      {/* manage_recovered_count */}
                      <td className="px-4 py-3 text-center">
                        {row.manage_recovered_count > 0 ? (
                          <span className="inline-flex items-center gap-1 text-xs font-semibold text-emerald-600">
                            <TrendingUp className="w-3 h-3" />
                            {row.manage_recovered_count}
                          </span>
                        ) : (
                          <span className="text-xs text-slate-300">0</span>
                        )}
                      </td>

                      {/* Last event type */}
                      <td className="px-4 py-3 whitespace-nowrap">
                        <span className="text-xs text-slate-500">
                          {row.last_manage_event_type
                            ? (EVENT_TYPE_LABELS[row.last_manage_event_type] || row.last_manage_event_type)
                            : '—'}
                        </span>
                      </td>

                      {/* Actions */}
                      <td className="px-4 py-3 text-right whitespace-nowrap">
                        <button
                          onClick={() => openDossier(row.agency_id)}
                          className="inline-flex items-center gap-1.5 text-xs font-medium text-slate-500 hover:text-blue-700 hover:bg-blue-50 px-2.5 py-1.5 rounded-lg border border-slate-200 hover:border-blue-200 transition-colors"
                        >
                          <ExternalLink className="w-3 h-3" />
                          Dossier
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}

          {/* Pagination */}
          {(rows.length > 0 || offset > 0) && (
            <div className="px-5 py-3 border-t border-slate-100 flex items-center justify-between gap-3">
              <button
                onClick={handlePrev}
                disabled={offset === 0 || loading}
                className="flex items-center gap-1.5 text-sm font-medium text-slate-600 disabled:opacity-30 disabled:cursor-not-allowed px-3 py-1.5 rounded-lg hover:bg-slate-50 border border-slate-200 transition-colors"
              >
                <ChevronLeft className="w-4 h-4" />
                Previous
              </button>
              <span className="text-xs text-slate-400">
                Page {Math.floor(offset / PAGE_SIZE) + 1}
              </span>
              <button
                onClick={handleNext}
                disabled={!hasMore || loading}
                className="flex items-center gap-1.5 text-sm font-medium text-slate-600 disabled:opacity-30 disabled:cursor-not-allowed px-3 py-1.5 rounded-lg hover:bg-slate-50 border border-slate-200 transition-colors"
              >
                Next
                <ChevronRight className="w-4 h-4" />
              </button>
            </div>
          )}
        </div>

        {/* Legend */}
        <div className="bg-slate-50 border border-slate-200 rounded-xl p-4">
          <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-3">Outcome legend</p>
          <div className="flex flex-wrap gap-3">
            {Object.entries(OUTCOME_LABELS).filter(([k]) => k !== 'hidden_self_removed').map(([key, cfg]) => (
              <span key={key} className={`inline-flex items-center gap-1.5 text-[11px] font-medium px-2.5 py-1 rounded border ${cfg.color}`}>
                {cfg.icon}{cfg.label}
              </span>
            ))}
          </div>
          <p className="text-[11px] text-slate-400 mt-3">
            "Hidden by owner" = <code className="font-mono bg-slate-100 px-1 rounded">removal_pending</code> — listing is internally preserved and fully recoverable. Not a hard delete.
          </p>
        </div>

      </div>
    </WpAdminLayout>
  );
}

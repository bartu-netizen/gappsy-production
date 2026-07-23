import { useCallback, useEffect, useState } from 'react';
import {
  ArrowLeft, Search, Eye, FileText, MessageSquare, MousePointerClick, GitBranch,
  Globe2, MapPin, Repeat, CreditCard,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminApiFetch, getErrorMessage } from '../lib/adminApiFetch';

const ENDPOINT = 'admin-visitor-journey';
const PAGE_SIZE = 25;

interface VisitorRow {
  visitor_id: string;
  first_seen_at: string;
  last_seen_at: string;
  total_events: number;
  traffic_source: string;
  country_name: string | null;
  city: string | null;
  paid: boolean;
  revenue_cents?: number;
  // Backend may include a few more fields (e.g. email) — rendered defensively
  // wherever present, never assumed.
  [key: string]: unknown;
}

interface VisitorSummary {
  visitor_id: string;
  first_seen_at: string;
  last_seen_at: string;
  traffic_source: string;
  country_name: string | null;
  city: string | null;
  paid: boolean;
  paid_products: string[];
  total_revenue_cents?: number;
  returning_visitor: boolean;
}

interface FilterOptions {
  countries: string[];
  traffic_sources: string[];
}

function formatCurrency(cents: number | null | undefined): string {
  if (!cents) return '—';
  return `$${(cents / 100).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
}

type TimelineEventType = 'page_view' | 'tool_page_view' | 'search' | 'chat' | 'outbound_click' | 'funnel_event';

interface TimelineEvent {
  timestamp: string;
  type: TimelineEventType;
  label: string;
  detail: Record<string, unknown>;
}

interface ListVisitorsResponse {
  ok: boolean;
  visitors: VisitorRow[];
  filter_options?: FilterOptions;
  error?: string;
}

interface VisitorTimelineResponse {
  ok: boolean;
  summary: VisitorSummary;
  timeline: TimelineEvent[];
  error?: string;
}

const TYPE_ICON: Record<TimelineEventType, typeof Search> = {
  search: Search,
  page_view: Eye,
  tool_page_view: FileText,
  chat: MessageSquare,
  outbound_click: MousePointerClick,
  funnel_event: GitBranch,
};

const TYPE_COLOR: Record<TimelineEventType, string> = {
  search: 'bg-blue-100 text-blue-600',
  page_view: 'bg-slate-100 text-slate-500',
  tool_page_view: 'bg-indigo-100 text-indigo-600',
  chat: 'bg-violet-100 text-violet-600',
  outbound_click: 'bg-amber-100 text-amber-600',
  funnel_event: 'bg-emerald-100 text-emerald-600',
};

function formatLocation(row: { city?: string | null; country_name?: string | null }): string {
  if (row.city && row.country_name) return `${row.city}, ${row.country_name}`;
  if (row.country_name) return row.country_name;
  if (row.city) return row.city;
  return '—';
}

function formatDateTime(value: string | null | undefined): string {
  if (!value) return '—';
  const d = new Date(value);
  if (Number.isNaN(d.getTime())) return '—';
  return d.toLocaleString();
}

// Small, defensive rendering of up to 3 short-value keys from a detail
// object — mirrors the "generic chips" fallback used on the funnel
// analytics timeline (WpAdminFunnelAnalyticsPage.tsx), kept intentionally
// simpler here since this timeline mixes several very different event
// shapes (search / chat / page view / outbound click / funnel event).
function DetailLine({ detail }: { detail: Record<string, unknown> | undefined | null }) {
  if (!detail || typeof detail !== 'object') return null;
  const entries = Object.entries(detail)
    .filter(([, v]) => v !== null && v !== undefined && String(v).length <= 80)
    .slice(0, 3);
  if (entries.length === 0) return null;
  return (
    <p className="text-xs text-slate-400 mt-0.5 truncate">
      {entries.map(([k, v]) => `${k}: ${String(v)}`).join('  ·  ')}
    </p>
  );
}

function PaidBadge({ paid }: { paid: boolean }) {
  if (!paid) return <span className="text-slate-300">—</span>;
  return (
    <span className="inline-flex items-center gap-1 text-xs font-semibold px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-700">
      Paid
    </span>
  );
}

export default function WpAdminVisitorsPage() {
  // ── list state ──────────────────────────────────────────────────────
  const [visitors, setVisitors] = useState<VisitorRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const [search, setSearch] = useState('');
  const [searchInput, setSearchInput] = useState('');
  const [from, setFrom] = useState('');
  const [to, setTo] = useState('');
  const [onlyPaid, setOnlyPaid] = useState(false);
  const [country, setCountry] = useState('');
  const [trafficSourceFilter, setTrafficSourceFilter] = useState('');
  const [filterOptions, setFilterOptions] = useState<FilterOptions>({ countries: [], traffic_sources: [] });
  const [offset, setOffset] = useState(0);

  // ── detail state ────────────────────────────────────────────────────
  const [selectedVisitorId, setSelectedVisitorId] = useState<string | null>(null);
  const [summary, setSummary] = useState<VisitorSummary | null>(null);
  const [timeline, setTimeline] = useState<TimelineEvent[]>([]);
  const [detailLoading, setDetailLoading] = useState(false);
  const [detailError, setDetailError] = useState<string | null>(null);

  const fetchVisitors = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<ListVisitorsResponse>(ENDPOINT, {
      method: 'POST',
      body: {
        action: 'list_visitors',
        search: search.trim() || undefined,
        from: from || undefined,
        to: to || undefined,
        only_paid: onlyPaid || undefined,
        country: country || undefined,
        traffic_source: trafficSourceFilter || undefined,
        limit: PAGE_SIZE,
        offset,
      },
    });
    if (result.ok && result.data?.ok) {
      setVisitors(result.data.visitors ?? []);
      if (result.data.filter_options) setFilterOptions(result.data.filter_options);
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to load visitors'));
    }
    setLoading(false);
  }, [search, from, to, onlyPaid, country, trafficSourceFilter, offset]);

  useEffect(() => {
    fetchVisitors();
  }, [fetchVisitors]);

  const handleSearchSubmit = () => {
    setOffset(0);
    setSearch(searchInput);
  };

  const openVisitor = useCallback((visitorId: string) => {
    setSelectedVisitorId(visitorId);
  }, []);

  useEffect(() => {
    if (!selectedVisitorId) {
      setSummary(null);
      setTimeline([]);
      setDetailError(null);
      return;
    }
    let cancelled = false;
    setDetailLoading(true);
    setDetailError(null);
    adminApiFetch<VisitorTimelineResponse>(ENDPOINT, {
      method: 'POST',
      body: { action: 'visitor_timeline', visitor_id: selectedVisitorId },
    }).then((result) => {
      if (cancelled) return;
      if (result.ok && result.data?.ok) {
        setSummary(result.data.summary);
        setTimeline(result.data.timeline ?? []);
      } else {
        setDetailError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to load visitor timeline'));
      }
      setDetailLoading(false);
    });
    return () => { cancelled = true; };
  }, [selectedVisitorId]);

  return (
    <WpAdminLayout title="Analytics — All Gappsy Visitors & Revenue" subtitle="Software directory + agency/state-page funnels, unified: every visitor's journey, location, traffic source, and revenue in one place">
      <div className="p-6 max-w-6xl mx-auto space-y-5">
        {!selectedVisitorId ? (
          <>
            {/* Filter bar */}
            <div className="bg-white border border-slate-200 rounded-xl p-4 flex flex-wrap items-end gap-3">
              <div className="relative flex-1 min-w-56">
                <label className="block text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1">Search</label>
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                  <input
                    type="text"
                    value={searchInput}
                    onChange={(e) => setSearchInput(e.target.value)}
                    onKeyDown={(e) => { if (e.key === 'Enter') handleSearchSubmit(); }}
                    placeholder="Visitor ID or email..."
                    className="w-full h-10 pl-9 pr-3 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  />
                </div>
              </div>

              <div>
                <label className="block text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1">From</label>
                <input
                  type="date"
                  value={from}
                  onChange={(e) => { setFrom(e.target.value); setOffset(0); }}
                  className="h-10 px-3 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
              </div>

              <div>
                <label className="block text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1">To</label>
                <input
                  type="date"
                  value={to}
                  onChange={(e) => { setTo(e.target.value); setOffset(0); }}
                  className="h-10 px-3 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
              </div>

              <div>
                <label className="block text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1">Country</label>
                <select
                  value={country}
                  onChange={(e) => { setCountry(e.target.value); setOffset(0); }}
                  className="h-10 px-3 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white"
                >
                  <option value="">All countries</option>
                  {filterOptions.countries.map((c) => (
                    <option key={c} value={c}>{c}</option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-1">Traffic source</label>
                <select
                  value={trafficSourceFilter}
                  onChange={(e) => { setTrafficSourceFilter(e.target.value); setOffset(0); }}
                  className="h-10 px-3 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white"
                >
                  <option value="">All sources</option>
                  {filterOptions.traffic_sources.map((s) => (
                    <option key={s} value={s}>{s}</option>
                  ))}
                </select>
              </div>

              <label className="flex items-center gap-2 h-10 px-1 text-sm text-slate-600 select-none cursor-pointer">
                <input
                  type="checkbox"
                  checked={onlyPaid}
                  onChange={(e) => { setOnlyPaid(e.target.checked); setOffset(0); }}
                  className="w-4 h-4 rounded border-slate-300 text-indigo-600 focus:ring-indigo-500"
                />
                Paid only
              </label>

              <button
                type="button"
                onClick={handleSearchSubmit}
                className="h-10 px-4 rounded-lg bg-indigo-600 text-white text-sm font-semibold hover:bg-indigo-700 transition-colors"
              >
                Search
              </button>
            </div>

            {error && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5">{error}</p>}

            {loading ? (
              <p className="text-sm text-slate-400">Loading…</p>
            ) : visitors.length === 0 ? (
              <p className="text-sm text-slate-400 bg-white border border-slate-200 rounded-xl p-8 text-center">
                No visitors match these filters.
              </p>
            ) : (
              <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
                <div className="overflow-x-auto">
                  <table className="w-full text-sm">
                    <thead>
                      <tr className="border-b border-slate-100 text-left text-xs font-semibold uppercase tracking-wide text-slate-400">
                        <th className="px-4 py-3">First seen</th>
                        <th className="px-4 py-3">Last seen</th>
                        <th className="px-4 py-3">Traffic source</th>
                        <th className="px-4 py-3">Location</th>
                        <th className="px-4 py-3 text-right">Events</th>
                        <th className="px-4 py-3 text-right">Revenue</th>
                        <th className="px-4 py-3">Paid</th>
                      </tr>
                    </thead>
                    <tbody>
                      {visitors.map((v) => (
                        <tr
                          key={v.visitor_id}
                          onClick={() => openVisitor(v.visitor_id)}
                          className="border-b border-slate-50 last:border-0 hover:bg-slate-50 cursor-pointer transition-colors"
                        >
                          <td className="px-4 py-3 whitespace-nowrap text-slate-600">{formatDateTime(v.first_seen_at)}</td>
                          <td className="px-4 py-3 whitespace-nowrap text-slate-600">{formatDateTime(v.last_seen_at)}</td>
                          <td className="px-4 py-3 text-slate-600">{v.traffic_source || '—'}</td>
                          <td className="px-4 py-3 text-slate-600">{formatLocation(v)}</td>
                          <td className="px-4 py-3 text-right tabular-nums font-medium text-[#0B1221]">{v.total_events ?? 0}</td>
                          <td className="px-4 py-3 text-right tabular-nums font-medium text-emerald-700">{formatCurrency(v.revenue_cents)}</td>
                          <td className="px-4 py-3"><PaidBadge paid={!!v.paid} /></td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>

                <div className="flex items-center justify-between px-4 py-3 border-t border-slate-100">
                  <button
                    type="button"
                    disabled={offset === 0 || loading}
                    onClick={() => setOffset((o) => Math.max(0, o - PAGE_SIZE))}
                    className="px-3 py-1.5 text-sm border border-slate-200 rounded-lg hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
                  >
                    Previous
                  </button>
                  <span className="text-xs text-slate-400">Showing {offset + 1}–{offset + visitors.length}</span>
                  <button
                    type="button"
                    disabled={loading || visitors.length < PAGE_SIZE}
                    onClick={() => setOffset((o) => o + PAGE_SIZE)}
                    className="px-3 py-1.5 text-sm border border-slate-200 rounded-lg hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
                  >
                    Next
                  </button>
                </div>
              </div>
            )}
          </>
        ) : (
          <div>
            <button
              type="button"
              onClick={() => setSelectedVisitorId(null)}
              className="inline-flex items-center gap-1.5 text-sm font-medium text-slate-500 hover:text-[#0B1221] mb-4 transition-colors"
            >
              <ArrowLeft className="w-4 h-4" /> Back to list
            </button>

            {detailError && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5 mb-4">{detailError}</p>}

            {detailLoading || !summary ? (
              <p className="text-sm text-slate-400">Loading…</p>
            ) : (
              <div className="space-y-5">
                {/* Summary header */}
                <div className="bg-white border border-slate-200 rounded-xl p-4 space-y-3">
                  <div className="flex flex-wrap items-center gap-2">
                    <span className="font-mono text-xs text-slate-500 bg-slate-100 px-2 py-1 rounded-md truncate max-w-[240px]" title={summary.visitor_id}>
                      {summary.visitor_id}
                    </span>
                    {summary.returning_visitor && (
                      <span className="inline-flex items-center gap-1 text-xs font-semibold px-2 py-0.5 rounded-full bg-sky-100 text-sky-700">
                        <Repeat className="w-3 h-3" /> Returning visitor
                      </span>
                    )}
                    {summary.paid && (
                      <span className="inline-flex items-center gap-1 text-xs font-semibold px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-700">
                        <CreditCard className="w-3 h-3" /> Paid {formatCurrency(summary.total_revenue_cents)}
                      </span>
                    )}
                  </div>

                  <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 text-xs">
                    <div>
                      <p className="text-slate-400 font-semibold uppercase tracking-wide text-[10px]">First seen</p>
                      <p className="text-slate-700 font-medium mt-0.5">{formatDateTime(summary.first_seen_at)}</p>
                    </div>
                    <div>
                      <p className="text-slate-400 font-semibold uppercase tracking-wide text-[10px]">Last seen</p>
                      <p className="text-slate-700 font-medium mt-0.5">{formatDateTime(summary.last_seen_at)}</p>
                    </div>
                    <div>
                      <p className="text-slate-400 font-semibold uppercase tracking-wide text-[10px] flex items-center gap-1">
                        <Globe2 className="w-3 h-3" /> Traffic source
                      </p>
                      <p className="text-slate-700 font-medium mt-0.5">{summary.traffic_source || '—'}</p>
                    </div>
                    <div>
                      <p className="text-slate-400 font-semibold uppercase tracking-wide text-[10px] flex items-center gap-1">
                        <MapPin className="w-3 h-3" /> Location
                      </p>
                      <p className="text-slate-700 font-medium mt-0.5">{formatLocation(summary)}</p>
                    </div>
                  </div>

                  {summary.paid && summary.paid_products?.length > 0 && (
                    <div>
                      <p className="text-slate-400 font-semibold uppercase tracking-wide text-[10px] mb-1">Paid products</p>
                      <div className="flex flex-wrap gap-1.5">
                        {summary.paid_products.map((p) => (
                          <span key={p} className="text-xs bg-emerald-50 text-emerald-700 border border-emerald-100 px-2 py-0.5 rounded-full">{p}</span>
                        ))}
                      </div>
                    </div>
                  )}
                </div>

                {/* Timeline */}
                <div className="bg-white border border-slate-200 rounded-xl p-4">
                  <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-3">Full timeline</p>
                  {timeline.length === 0 ? (
                    <p className="text-sm text-slate-400 p-6 text-center">No events recorded for this visitor.</p>
                  ) : (
                    <div className="relative">
                      <div className="absolute left-4 top-0 bottom-0 w-px bg-slate-100" />
                      <div className="space-y-2">
                        {timeline.map((evt, i) => {
                          const Icon = TYPE_ICON[evt.type] ?? Eye;
                          const colorClass = TYPE_COLOR[evt.type] ?? 'bg-slate-100 text-slate-500';
                          return (
                            <div key={i} className="relative pl-10">
                              <div className={`absolute left-1 top-1 w-6 h-6 rounded-full flex items-center justify-center shrink-0 ${colorClass}`}>
                                <Icon className="w-3.5 h-3.5" />
                              </div>
                              <div className="border border-slate-100 hover:border-slate-200 rounded-xl p-3 transition-colors">
                                <div className="flex items-start justify-between gap-2">
                                  <p className="text-sm font-medium text-slate-800 leading-tight">{evt.label}</p>
                                  <span className="text-xs text-slate-400 whitespace-nowrap tabular-nums shrink-0">{formatDateTime(evt.timestamp)}</span>
                                </div>
                                <DetailLine detail={evt.detail} />
                              </div>
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  )}
                </div>
              </div>
            )}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}

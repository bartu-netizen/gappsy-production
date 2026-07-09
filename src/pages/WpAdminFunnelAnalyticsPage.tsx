import { useEffect, useState, useCallback, useRef } from 'react';
import {
  BarChart2, RefreshCw, TrendingUp, Users, Zap, CreditCard,
  ChevronDown, Activity, Filter, Eye, EyeOff,
  Search, ChevronRight, ChevronLeft, Clock, MapPin, Tag,
  LayoutList, X, Loader2, Copy, Check, Info, AlertTriangle,
  DollarSign,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch, type AdminApiError } from '../lib/adminApiFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { TrafficModeToggle, trafficModeToApiParam, type TrafficMode } from '../components/admin/TrafficModeToggle';
import { TimezoneLabel } from '../components/admin/AdminTimestamp';
import { formatAdminTimestampWithAgo, formatFullTooltip } from '../utils/adminTimestamp';
import { formatStateName } from '../utils/formatLocation';
import { useTimestampRefresh } from '../hooks/useTimestampRefresh';
import { getEventMeta } from '../utils/adminEventLabels';

const DATE_RANGES = [
  { label: 'Last 24h', value: '24h' },
  { label: 'Last 7 days', value: '7d' },
  { label: 'Last 30 days', value: '30d' },
  { label: 'Last 90 days', value: '90d' },
  { label: 'All time', value: 'all' },
];

const FUNNEL_NAMES = [
  { label: 'All funnels', value: '' },
  { label: 'Your Agency', value: 'your_agency' },
  { label: 'Manage', value: 'manage' },
  { label: 'Top 25', value: 'top25' },
  { label: 'Spotlight', value: 'spotlight' },
  { label: 'Availability', value: 'availability' },
  { label: 'Demo', value: 'demo' },
  { label: 'Get Matched', value: 'matched' },
  { label: 'Request Replay', value: 'request_replay' },
];

// Ordered list of funnels for quick-filter chips in Journeys tab
const FUNNEL_CHIPS = [
  { label: 'Your Agency', value: 'your_agency' },
  { label: 'Manage', value: 'manage' },
  { label: 'Demo', value: 'demo' },
  { label: 'Availability', value: 'availability' },
  { label: 'Top 25', value: 'top25' },
  { label: 'Spotlight', value: 'spotlight' },
  { label: 'Matched', value: 'matched' },
  { label: 'Request Replay', value: 'request_replay' },
];

const STAGE_CONFIG: Record<string, { label: string; color: string; bg: string }> = {
  paid:             { label: 'Checkout Completed',              color: 'text-emerald-700', bg: 'bg-emerald-100' },
  checkout_started: { label: 'Checkout Page Viewed',            color: 'text-amber-700',  bg: 'bg-amber-100' },
  offer_viewed:     { label: 'Activation Offer Page Viewed',    color: 'text-blue-700',   bg: 'bg-blue-100' },
  submitted:        { label: 'Availability Check Submitted',    color: 'text-sky-700',    bg: 'bg-sky-100' },
  opened:           { label: 'Funnel Entered',                  color: 'text-gray-600',   bg: 'bg-gray-100' },
  // upsell_viewed — legacy stage, kept only to render historical session badges without crashing
  upsell_viewed:    { label: 'Offer Viewed (Historical)',       color: 'text-slate-500',  bg: 'bg-slate-100' },
};

const FUNNEL_COLORS: Record<string, string> = {
  your_agency:     'bg-blue-500',
  manage:          'bg-purple-500',
  top25:           'bg-emerald-500',
  spotlight:       'bg-amber-500',
  availability:    'bg-sky-500',
  demo:            'bg-rose-500',
  matched:         'bg-teal-500',
  request_replay:  'bg-orange-500',
  unknown:         'bg-gray-400',
};

type KpiKey = 'sessions' | 'paid' | 'checkouts' | 'convrate' | 'demos' | 'upsells' | 'revenue' | 'avg_order';

interface KpiFilterCfg {
  viewingLabel: string;
  stageFilter?: string;
  hasCheckout?: boolean;
  onlyDemo?: boolean;
  stagesHighlight?: string[];
}

const KPI_FILTERS: Record<KpiKey, KpiFilterCfg> = {
  sessions:  { viewingLabel: 'All Sessions' },
  paid:      { viewingLabel: 'Paid Sessions',           stageFilter: 'paid',            stagesHighlight: ['paid'] },
  checkouts: { viewingLabel: 'Checkout Sessions',        hasCheckout: true,              stagesHighlight: ['checkout_started', 'paid'] },
  convrate:  { viewingLabel: 'Paid Sessions',            stageFilter: 'paid',            stagesHighlight: ['paid'] },
  demos:     { viewingLabel: 'Demo Sessions',            onlyDemo: true },
  upsells:   { viewingLabel: 'Offer Page Sessions',      stageFilter: 'offer_viewed',    stagesHighlight: ['offer_viewed'] },
  revenue:   { viewingLabel: 'Revenue Sessions',         stageFilter: 'paid',            stagesHighlight: ['paid', 'checkout_started'] },
  avg_order: { viewingLabel: 'Avg Order Sessions',       stageFilter: 'paid',            stagesHighlight: ['paid'] },
};

const STEP_LABELS: Record<number, string> = {
  10:  'Your-agency profile — Viewed landing page',
  20:  'Your-agency profile — Submitted search',
  25:  'Your-agency profile — Clicked profile card',
  30:  'Your-agency profile — Viewed agency profile',
  40:  'Your-agency ledger — Clicked "Start receiving these clients"',
  50:  'Owner preview — Viewed state page',
  60:  'Owner preview — Clicked "Scroll to my listing"',
  70:  'Owner preview — Opened availability form',
  80:  'Owner preview — Opened availability modal',
  90:  'Owner preview — Submitted availability form',
  100: 'Owner preview — Viewed availability result',
  110: 'Owner preview — Clicked "See missed clients"',
  120: 'Owner preview — Viewed missed clients page',
  130: 'Owner preview — Clicked "activate your listing now"',
  140: 'Activation offer — Viewed offer page',
  150: 'Checkout — Opened Stripe checkout',
  160: 'Sale — Listing activated',
};

interface OverviewData {
  total_sessions: number;
  total_events: number;
  demo_count: number;
  stage_counts: Record<string, number>;
  funnel_counts: Record<string, number>;
  paid_count: number;
  checkout_count: number;
  conv_rate: number;
  total_revenue?: number;
  avg_order_value?: number;
  revenue_order_count?: number;
}

interface StepRow {
  funnel_name: string;
  event_name: string;
  step_number: number | null;
  count: number;
  demo_count: number;
}

interface DropOffRow {
  dropoff_stage: string;
  funnel_name: string;
  count: number;
}

interface StepPreview {
  step_number: number | null;
  event_name: string;
}

interface SessionRow {
  session_id: string;
  fsid: string | null;
  created_at: string;
  last_event_at: string | null;
  funnel_name: string;
  stage: string;
  is_demo: boolean;
  lead_email: string | null;
  lead_name: string | null;
  state_slug: string | null;
  step_number: number | null;
  last_event_name: string | null;
  dropoff_stage: string | null;
  first_search_query: string | null;
  last_search_query: string | null;
  search_results_count: number | null;
  selected_agency_name: string | null;
  selected_agency_id: string | null;
  step_count: number;
  steps_preview: StepPreview[];
  first_event_step: number | null;
  has_checkout: boolean;
  has_paid: boolean;
}

interface PerAgencyRow {
  agency_key: string;
  agency_name: string | null;
  agency_slug: string | null;
  agency_id: string | null;
  state_slug: string | null;
  total_sessions: number;
  paid_sessions: number;
  revenue: number;
  checkout_opens: number;
  demo_opens: number;
  last_seen: string | null;
  last_activity_stage: string | null;
  highest_step_reached: number;
  drop_off_label: string;
  intent_signal: 'high' | 'medium' | 'low';
  funnel_types: string[];
  sources: string[];
  is_unresolved: boolean;
  replay_opens_count?: number;
  last_replay_opened_at?: string | null;
}

interface TimelineEvent {
  id: string;
  created_at: string;
  event_name: string;
  step_number: number | null;
  page_path: string | null;
  is_demo: boolean | null;
  metadata: Record<string, unknown> | null;
  funnel_name: string | null;
  event_stage: string | null;
}

interface TimelineData {
  session: Record<string, unknown>;
  events: TimelineEvent[];
}

async function apiFetch<T = unknown>(
  action: string,
  range: string,
  includeDemo: boolean,
  funnelName: string,
  extra?: Record<string, string>
): Promise<{ data?: T; error?: AdminApiError; ok: boolean }> {
  const params = new URLSearchParams({ action, range, include_demo: includeDemo ? '1' : '0' });
  if (funnelName) params.set('funnel_name', funnelName);
  if (extra) Object.entries(extra).forEach(([k, v]) => { if (v) params.set(k, v); });

  const result = await adminApiFetch<T>(`wpadmin-funnel-analytics?${params}`, {
    method: 'GET',
    timeoutMs: 15000,
    retries: 1,
  });

  if (!result.ok) {
    return { ok: false, error: result.error };
  }

  const dataObj = result.data as Record<string, unknown>;
  if (dataObj && typeof dataObj === 'object' && 'error' in dataObj && dataObj.error) {
    return {
      ok: false,
      error: {
        code: 'server_error',
        message: String(dataObj.error),
        retryable: false,
      },
    };
  }

  return { ok: true, data: result.data };
}

// ─── small shared helpers ──────────────────────────────────────────────────

function KpiCard({ icon, label, value, sub, accent, isActive, onClick }: {
  icon: React.ReactNode;
  label: string;
  value: string | number;
  sub?: string;
  accent?: string;
  isActive?: boolean;
  onClick?: () => void;
}) {
  const clickable = !!onClick;
  return (
    <div
      role={clickable ? 'button' : undefined}
      tabIndex={clickable ? 0 : undefined}
      onClick={onClick}
      onKeyDown={clickable ? (e) => { if (e.key === 'Enter' || e.key === ' ') onClick?.(); } : undefined}
      className={`bg-white rounded-xl border p-4 flex flex-col gap-2 overflow-hidden transition-all duration-150 select-none ${
        isActive
          ? 'border-slate-700 ring-2 ring-slate-700/10 shadow-md'
          : clickable
          ? 'border-slate-200 hover:border-slate-300 hover:shadow-sm cursor-pointer'
          : 'border-slate-200'
      }`}
    >
      <div className="flex items-center justify-between gap-1">
        <div className={`w-8 h-8 rounded-lg flex items-center justify-center shrink-0 ${accent ?? 'bg-slate-100'}`}>
          {icon}
        </div>
        {isActive && (
          <span className="text-[9px] font-bold tracking-wider text-slate-600 bg-slate-100 border border-slate-200 px-1.5 py-0.5 rounded-full uppercase shrink-0">
            on
          </span>
        )}
      </div>
      <div className="min-w-0">
        <p className="text-xl font-bold text-slate-900 leading-none truncate">{value}</p>
        <p className={`text-xs mt-1 leading-tight truncate ${isActive ? 'text-slate-700 font-semibold' : 'text-slate-500'}`}>{label}</p>
        {sub && <p className="text-[11px] text-slate-400 mt-0.5 leading-tight truncate">{sub}</p>}
      </div>
    </div>
  );
}

function ProgressBar({ value, max, color }: { value: number; max: number; color: string }) {
  const pct = max > 0 ? Math.round((value / max) * 100) : 0;
  return (
    <div className="flex items-center gap-3">
      <div className="flex-1 h-2 bg-slate-100 rounded-full overflow-hidden">
        <div className={`h-full rounded-full transition-all ${color}`} style={{ width: `${pct}%` }} />
      </div>
      <span className="text-xs text-slate-500 w-8 text-right">{pct}%</span>
    </div>
  );
}

function StageBadge({ stage }: { stage: string }) {
  const cfg = STAGE_CONFIG[stage] ?? { label: stage, color: 'text-gray-600', bg: 'bg-gray-100' };
  return (
    <span className={`inline-flex items-center text-xs font-semibold px-2 py-0.5 rounded-full ${cfg.bg} ${cfg.color}`}>
      {cfg.label}
    </span>
  );
}

function FunnelDot({ name }: { name: string }) {
  return <div className={`w-2 h-2 rounded-full shrink-0 mt-1.5 ${FUNNEL_COLORS[name] ?? 'bg-gray-400'}`} />;
}


function humanizeEventName(name: string): string {
  return getEventMeta(name).label;
}

function CopyButton({ text }: { text: string }) {
  const [copied, setCopied] = useState(false);
  const copy = (e: React.MouseEvent) => {
    e.stopPropagation();
    navigator.clipboard.writeText(text).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 1500);
    });
  };
  return (
    <button
      onClick={copy}
      title="Copy"
      className="ml-1 p-0.5 rounded text-slate-300 hover:text-slate-500 transition-colors"
    >
      {copied ? <Check className="w-3 h-3 text-emerald-500" /> : <Copy className="w-3 h-3" />}
    </button>
  );
}

// ─── smart metadata chips ─────────────────────────────────────────────────

function MetadataChips({ evt }: { evt: TimelineEvent }) {
  const [showRaw, setShowRaw] = useState(false);
  const meta = evt.metadata;
  if (!meta || Object.keys(meta).length === 0) return null;

  const isSearch = evt.event_name === 'your_agency_search_submitted' || evt.step_number === 20;
  const isAgency = evt.event_name?.includes('agency') || evt.event_name?.includes('listing') || evt.event_name?.includes('overview');
  const isCheckout = evt.event_name?.includes('checkout') || evt.event_name?.includes('stripe');

  const chips: React.ReactNode[] = [];

  if (isSearch) {
    const q = meta.query ?? meta.search_query;
    const rc = meta.results_count ?? meta.result_count;
    if (q != null) chips.push(
      <span key="q" className="text-xs bg-blue-50 text-blue-700 border border-blue-100 px-2 py-0.5 rounded-full">
        query: <strong>{String(q)}</strong>
      </span>
    );
    if (rc != null) chips.push(
      <span key="rc" className="text-xs bg-slate-50 text-slate-600 border border-slate-200 px-2 py-0.5 rounded-full">
        results: {String(rc)}
      </span>
    );
  } else if (isCheckout) {
    const sid = meta.checkout_session_id ?? meta.session_id;
    const prod = meta.product ?? meta.price_id ?? meta.amount;
    if (sid) chips.push(
      <span key="sid" className="text-xs bg-amber-50 text-amber-700 border border-amber-100 px-2 py-0.5 rounded-full font-mono">
        {String(sid).slice(0, 20)}…
      </span>
    );
    if (prod) chips.push(
      <span key="prod" className="text-xs bg-amber-50 text-amber-700 border border-amber-100 px-2 py-0.5 rounded-full">
        {String(prod)}
      </span>
    );
  } else if (isAgency) {
    const an = meta.agency_name;
    const aid = meta.agency_id;
    if (an) chips.push(
      <span key="an" className="text-xs bg-emerald-50 text-emerald-700 border border-emerald-100 px-2 py-0.5 rounded-full">
        {String(an)}
      </span>
    );
    if (aid) chips.push(
      <span key="aid" className="text-xs bg-slate-50 text-slate-500 border border-slate-200 px-2 py-0.5 rounded-full font-mono" title={String(aid)}>
        {String(aid).slice(0, 8)}…
      </span>
    );
  } else {
    // Generic: surface up to 3 short-value keys
    let count = 0;
    for (const [k, v] of Object.entries(meta)) {
      if (count >= 3) break;
      if (v == null || String(v).length > 60) continue;
      chips.push(
        <span key={k} className="text-xs bg-slate-50 text-slate-600 border border-slate-200 px-2 py-0.5 rounded-full">
          {k}: {String(v)}
        </span>
      );
      count++;
    }
    const remaining = Object.keys(meta).length - count;
    if (remaining > 0) chips.push(
      <button
        key="raw"
        onClick={() => setShowRaw(v => !v)}
        className="text-xs text-slate-400 hover:text-slate-600 underline underline-offset-2 transition-colors"
      >
        {showRaw ? 'hide raw' : `+${remaining} more`}
      </button>
    );
  }

  return (
    <div className="mt-2 space-y-1.5">
      {chips.length > 0 && <div className="flex flex-wrap gap-1.5">{chips}</div>}
      {showRaw && (
        <pre className="text-[10px] bg-slate-50 border border-slate-200 rounded-lg p-2 overflow-x-auto text-slate-500 leading-relaxed">
          {JSON.stringify(meta, null, 2)}
        </pre>
      )}
    </div>
  );
}

// ─── timeline modal ───────────────────────────────────────────────────────

function TimelinePanel({ sessionId, onClose }: { sessionId: string; onClose: () => void }) {
  const [data, setData] = useState<TimelineData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    setLoading(true);
    setError('');
    apiFetch<TimelineData>('session_timeline', 'all', true, '', { session_id: sessionId })
      .then((result) => {
        if (!result.ok || result.error) {
          setError(result.error?.message || 'Failed to load timeline');
          return;
        }
        setData(result.data ?? null);
      })
      .catch((e) => setError(e instanceof Error ? e.message : 'Failed to load'))
      .finally(() => setLoading(false));
  }, [sessionId]);

  const sess = data?.session;

  // Derive first search query from events for modal header
  const firstSearchQuery = data?.events.find(
    e => e.event_name === 'your_agency_search_submitted' || e.step_number === 20
  )?.metadata?.query as string | undefined;

  return (
    <div className="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-0 sm:p-6">
      <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
      <div className="relative z-10 bg-white w-full sm:max-w-2xl sm:rounded-2xl shadow-2xl flex flex-col max-h-[92vh]">

        {/* Modal header */}
        <div className="px-5 py-4 border-b border-gray-100 shrink-0">
          <div className="flex items-start justify-between gap-3">
            <div className="min-w-0 flex-1">
              <div className="flex items-center gap-2 flex-wrap mb-1">
                <p className="text-sm font-bold text-slate-800">Session timeline</p>
                {sess && <StageBadge stage={String(sess.stage ?? 'opened')} />}
                {sess?.is_demo && (
                  <span className="text-xs font-semibold px-2 py-0.5 rounded-full bg-orange-100 text-orange-700">demo</span>
                )}
              </div>
              {/* Context strip */}
              {sess && (
                <div className="grid grid-cols-2 sm:grid-cols-3 gap-x-4 gap-y-0.5 mt-2">
                  {[
                    { label: 'Funnel', value: String(sess.funnel_name ?? sess.funnel_type ?? '—') },
                    { label: 'State', value: String(sess.state_slug ?? '—') },
                    { label: 'Agency', value: String(sess.agency_name ?? '—') },
                    ...(firstSearchQuery ? [{ label: 'Searched', value: `"${firstSearchQuery}"` }] : []),
                    { label: 'Email', value: String(sess.lead_email ?? '—') },
                  ].map(item => (
                    <div key={item.label} className="flex items-baseline gap-1">
                      <span className="text-[10px] font-semibold uppercase tracking-wide text-slate-400 shrink-0">{item.label}</span>
                      <span className="text-xs text-slate-700 font-medium truncate">{item.value}</span>
                    </div>
                  ))}
                </div>
              )}
              {/* IDs with copy */}
              <div className="flex items-center gap-3 mt-2 flex-wrap">
                <div className="flex items-center gap-0.5">
                  <span className="text-[10px] text-slate-400 font-semibold uppercase tracking-wide">Session</span>
                  <span className="text-[10px] text-slate-500 font-mono ml-1 truncate max-w-[140px]">{sessionId.slice(0, 16)}…</span>
                  <CopyButton text={sessionId} />
                </div>
                {sess?.fsid && (
                  <div className="flex items-center gap-0.5">
                    <span className="text-[10px] text-slate-400 font-semibold uppercase tracking-wide">FSID</span>
                    <span className="text-[10px] text-slate-500 font-mono ml-1 truncate max-w-[120px]">{String(sess.fsid).slice(0, 16)}…</span>
                    <CopyButton text={String(sess.fsid)} />
                  </div>
                )}
              </div>
            </div>
            <button
              onClick={onClose}
              className="p-1.5 rounded-lg hover:bg-gray-100 text-gray-400 hover:text-gray-600 transition-colors shrink-0"
            >
              <X className="w-4 h-4" />
            </button>
          </div>
        </div>

        {/* Body */}
        <div className="overflow-y-auto flex-1 p-5">
          {loading && (
            <div className="flex items-center justify-center py-12">
              <Loader2 className="w-6 h-6 text-slate-400 animate-spin" />
            </div>
          )}
          {error && (
            <div className="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-sm text-red-700">{error}</div>
          )}
          {data && !loading && (
            <div className="relative">
              <div className="absolute left-4 top-0 bottom-0 w-px bg-slate-100" />
              <div className="space-y-2.5">
                {data.events.map((evt, i) => {
                  const label = evt.step_number != null
                    ? (STEP_LABELS[evt.step_number] ?? humanizeEventName(evt.event_name))
                    : humanizeEventName(evt.event_name);
                  const isSearch = evt.event_name === 'your_agency_search_submitted' || evt.step_number === 20;
                  const isCheckout = evt.step_number === 150 || evt.event_name === 'checkout_page_viewed';
                  const isPaid = (evt.step_number ?? 0) >= 160 || evt.event_name === 'checkout_completed';

                  const dotColor = isPaid
                    ? 'bg-emerald-400 border-emerald-200'
                    : isCheckout
                    ? 'bg-amber-400 border-amber-200'
                    : isSearch
                    ? 'bg-blue-400 border-blue-200'
                    : 'bg-slate-300 border-white';

                  return (
                    <div key={evt.id ?? i} className="relative pl-9">
                      <div className={`absolute left-2 top-2.5 w-3.5 h-3.5 rounded-full border-2 shadow-sm ${dotColor}`} />
                      <div className={`bg-white border rounded-xl p-3 transition-colors ${
                        isPaid ? 'border-emerald-200 bg-emerald-50/30' :
                        isCheckout ? 'border-amber-200 bg-amber-50/30' :
                        isSearch ? 'border-blue-100 bg-blue-50/20' :
                        'border-slate-100 hover:border-slate-200'
                      }`}>
                        <div className="flex items-start justify-between gap-2">
                          <div className="min-w-0 flex-1">
                            <p className="text-sm font-semibold text-slate-800 leading-tight">{label}</p>
                            {evt.page_path && (
                              <p className="text-xs text-slate-400 mt-0.5 font-mono truncate">{evt.page_path}</p>
                            )}
                          </div>
                          <div className="flex items-center gap-1.5 shrink-0">
                            {evt.step_number != null && (
                              <span className="text-xs font-bold bg-slate-100 text-slate-500 px-1.5 py-0.5 rounded-md tabular-nums">
                                #{evt.step_number}
                              </span>
                            )}
                            <span className="text-xs text-slate-400 whitespace-nowrap tabular-nums" title={formatFullTooltip(evt.created_at)}>
                              {formatAdminTimestampWithAgo(evt.created_at)}
                            </span>
                          </div>
                        </div>
                        <MetadataChips evt={evt} />
                      </div>
                    </div>
                  );
                })}
                {data.events.length === 0 && (
                  <p className="text-sm text-slate-400 pl-9 py-4">No events recorded for this session.</p>
                )}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

// ─── Journeys tab ─────────────────────────────────────────────────────────

function JourneysTab({
  range, includeDemo, funnelName, kpiFilter, onClearKpi,
}: {
  range: string;
  includeDemo: boolean;
  funnelName: string;
  kpiFilter: KpiKey | null;
  onClearKpi: () => void;
}) {
  // Default to 'your_agency' when no explicit funnel is chosen from the global filter
  const [localFunnel, setLocalFunnel] = useState(funnelName || 'your_agency');
  const [rows, setRows] = useState<SessionRow[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const pageSize = 25;

  const [q, setQ] = useState('');
  const [qInput, setQInput] = useState('');
  const [stageFilter, setStageFilter] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const [timelineId, setTimelineId] = useState<string | null>(null);
  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // Sync localFunnel when parent funnelName changes (explicit selection)
  useEffect(() => {
    if (funnelName !== '') setLocalFunnel(funnelName);
  }, [funnelName]);

  // Derive effective filter params from the active KPI
  const kpiCfg = kpiFilter ? KPI_FILTERS[kpiFilter] : null;
  const kpiStage = kpiCfg?.stageFilter ?? '';
  const kpiHasCheckout = kpiCfg?.hasCheckout ? '1' : '';
  const kpiOnlyDemo = kpiCfg?.onlyDemo ? '1' : '';
  const kpiActive = !!kpiFilter && kpiFilter !== 'sessions';

  // When a KPI filter is active, its settings override the manual stage dropdown
  const effectiveStage = kpiActive ? kpiStage : stageFilter;
  // For onlyDemo KPI, force include_demo so the backend includes demo sessions
  const effectiveIncludeDemo = kpiCfg?.onlyDemo ? true : includeDemo;

  const load = useCallback(async (
    r: string, demo: boolean, fn: string,
    pg: number, query: string, stage: string,
    hasCheckout: string, onlyDemo: string
  ) => {
    setLoading(true);
    setError('');
    try {
      const result = await apiFetch<{ rows: SessionRow[]; total: number }>('session_list', r, demo, fn, {
        page: String(pg),
        page_size: String(pageSize),
        q: query,
        stage,
        has_checkout: hasCheckout,
        only_demo: onlyDemo,
      });
      if (!result.ok || result.error) {
        setError(result.error?.message || 'Failed to load');
        return;
      }
      setRows(result.data?.rows ?? []);
      setTotal(result.data?.total ?? 0);
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Failed to load');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    setPage(1);
    load(range, effectiveIncludeDemo, localFunnel, 1, q, effectiveStage, kpiHasCheckout, kpiOnlyDemo);
  }, [range, effectiveIncludeDemo, localFunnel, q, effectiveStage, kpiHasCheckout, kpiOnlyDemo, load]);

  // page-only changes
  const pageRef = useRef(page);
  useEffect(() => {
    if (pageRef.current !== page) {
      pageRef.current = page;
      load(range, effectiveIncludeDemo, localFunnel, page, q, effectiveStage, kpiHasCheckout, kpiOnlyDemo);
    }
  });

  const handleSearch = (val: string) => {
    setQInput(val);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      setQ(val.trim());
      setPage(1);
    }, 400);
  };

  const totalPages = Math.ceil(total / pageSize);

  return (
    <div>
      {/* KPI active banner */}
      {kpiActive && kpiCfg && (
        <div className="px-5 py-2.5 bg-slate-800 text-white flex items-center gap-3">
          <span className="text-xs font-semibold uppercase tracking-wider text-slate-300">Viewing:</span>
          <span className="text-sm font-bold">{kpiCfg.viewingLabel}</span>
          <button
            onClick={onClearKpi}
            className="ml-auto flex items-center gap-1.5 text-xs font-semibold text-slate-300 hover:text-white transition-colors"
          >
            <X className="w-3.5 h-3.5" />
            Clear filter
          </button>
        </div>
      )}

      {/* Funnel quick-filter chips */}
      <div className="px-5 pt-4 pb-3 border-b border-gray-100 flex flex-wrap items-center gap-2">
        <button
          onClick={() => { setLocalFunnel(''); setPage(1); }}
          className={`px-3 py-1 text-xs font-semibold rounded-full border transition-colors ${
            localFunnel === ''
              ? 'bg-slate-800 text-white border-slate-800'
              : 'bg-white text-slate-500 border-slate-200 hover:border-slate-400 hover:text-slate-700'
          }`}
        >
          All
        </button>
        {FUNNEL_CHIPS.map(fc => (
          <button
            key={fc.value}
            onClick={() => { setLocalFunnel(fc.value); setPage(1); }}
            className={`px-3 py-1 text-xs font-semibold rounded-full border transition-colors ${
              localFunnel === fc.value
                ? 'bg-slate-800 text-white border-slate-800'
                : 'bg-white text-slate-500 border-slate-200 hover:border-slate-400 hover:text-slate-700'
            }`}
          >
            {fc.label}
          </button>
        ))}
      </div>

      {/* Search + stage filter */}
      <div className="px-5 py-3 border-b border-gray-100 flex flex-wrap items-center gap-3">
        <div className="relative flex-1 min-w-48 max-w-xs">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-gray-400" />
          <input
            type="text"
            value={qInput}
            onChange={e => handleSearch(e.target.value)}
            placeholder="Search query, agency, email, state…"
            className="w-full pl-8 pr-8 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-slate-300 bg-white"
          />
          {qInput && (
            <button
              onClick={() => { setQInput(''); setQ(''); setPage(1); }}
              className="absolute right-2 top-1/2 -translate-y-1/2 text-gray-300 hover:text-gray-500 transition-colors"
            >
              <X className="w-3.5 h-3.5" />
            </button>
          )}
        </div>

        <select
          value={kpiActive ? effectiveStage : stageFilter}
          onChange={e => { setStageFilter(e.target.value); setPage(1); }}
          disabled={kpiActive}
          title={kpiActive ? 'Stage filter is controlled by the active KPI card' : undefined}
          className={`px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-slate-300 bg-white ${kpiActive ? 'opacity-50 cursor-not-allowed' : ''}`}
        >
          <option value="">All stages</option>
          {Object.entries(STAGE_CONFIG).map(([k, v]) => (
            <option key={k} value={k}>{v.label}</option>
          ))}
        </select>

        <span className="ml-auto text-xs text-slate-400 tabular-nums">
          {total.toLocaleString()} session{total !== 1 ? 's' : ''}
        </span>
      </div>

      {error && (
        <div className="mx-5 mt-4 bg-red-50 border border-red-200 rounded-lg px-4 py-3 flex items-center gap-2">
          <AlertTriangle className="w-4 h-4 text-red-500 shrink-0" />
          <p className="text-sm text-red-700">{error}</p>
        </div>
      )}

      {loading ? (
        <div className="p-6 space-y-2">
          {Array.from({ length: 8 }).map((_, i) => (
            <div key={i} className="h-16 bg-gray-100 rounded-xl animate-pulse" />
          ))}
        </div>
      ) : rows.length === 0 ? (
        <div className="p-12 text-center">
          <LayoutList className="w-8 h-8 text-gray-300 mx-auto mb-2" />
          <p className="text-sm text-gray-400">No sessions found</p>
        </div>
      ) : (
        <div className="divide-y divide-gray-50">
          {rows.map((row) => {
            const isExpanded = expandedId === row.session_id;
            const stageCfg = STAGE_CONFIG[row.stage] ?? { label: row.stage, color: 'text-gray-600', bg: 'bg-gray-100' };
            const startedMidFunnel = row.first_event_step != null && row.first_event_step > 10;

            // Primary display title: last search query > selected agency > session agency > fallback
            const primaryTitle = row.last_search_query
              || row.selected_agency_name
              || null;

            const highestStep = row.step_number;

            return (
              <div key={row.session_id} className="hover:bg-slate-50/60 transition-colors">
                <button
                  className="w-full text-left px-5 py-4"
                  onClick={() => setExpandedId(isExpanded ? null : row.session_id)}
                >
                  <div className="flex items-start gap-3">
                    <FunnelDot name={row.funnel_name} />
                    <div className="flex-1 min-w-0">
                      {/* Primary title + badges row */}
                      <div className="flex flex-wrap items-center gap-1.5 mb-1.5">
                        {primaryTitle ? (
                          <span className="text-sm font-semibold text-slate-800 truncate max-w-[220px]">
                            {row.last_search_query ? `"${row.last_search_query}"` : primaryTitle}
                          </span>
                        ) : (
                          <span className="text-sm font-medium text-slate-400 italic">No search query</span>
                        )}
                        <span className={`text-xs font-semibold px-2 py-0.5 rounded-full ${stageCfg.bg} ${stageCfg.color}`}>
                          {stageCfg.label}
                        </span>
                        {highestStep != null && (
                          <span className="text-xs font-bold bg-slate-100 text-slate-500 px-1.5 py-0.5 rounded-md tabular-nums">
                            #{highestStep}
                          </span>
                        )}
                        {row.has_paid && (
                          <span className="text-xs font-semibold px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-700">paid</span>
                        )}
                        {row.is_demo && (
                          <span className="text-xs font-semibold px-2 py-0.5 rounded-full bg-orange-100 text-orange-700">demo</span>
                        )}
                        {startedMidFunnel && (
                          <span className="text-xs font-medium px-2 py-0.5 rounded-full bg-slate-100 text-slate-500 border border-slate-200">
                            mid-funnel entry
                          </span>
                        )}
                      </div>
                      {/* Secondary meta line */}
                      <div className="flex flex-wrap items-center gap-3 text-xs text-slate-400">
                        {row.selected_agency_name && row.last_search_query && (
                          <span className="flex items-center gap-1">
                            <Tag className="w-3 h-3" />
                            {row.selected_agency_name}
                          </span>
                        )}
                        {row.state_slug && (
                          <span className="flex items-center gap-1">
                            <MapPin className="w-3 h-3" />
                            {formatStateName(row.state_slug)}
                          </span>
                        )}
                        <span className="flex items-center gap-1" title={formatFullTooltip(row.last_event_at)}>
                          <Clock className="w-3 h-3" />
                          {formatAdminTimestampWithAgo(row.last_event_at)}
                        </span>
                        <span className="tabular-nums">{row.step_count} event{row.step_count !== 1 ? 's' : ''}</span>
                        {row.funnel_name !== 'unknown' && (
                          <span className="capitalize">{row.funnel_name.replace(/_/g, ' ')}</span>
                        )}
                      </div>
                    </div>
                    <ChevronDown
                      className={`w-4 h-4 text-slate-300 shrink-0 mt-0.5 transition-transform duration-200 ${isExpanded ? 'rotate-180' : ''}`}
                    />
                  </div>
                </button>

                {isExpanded && (
                  <div className="px-5 pb-4">
                    <div className="bg-slate-50 rounded-xl p-4 space-y-3.5">
                      {/* Detail grid */}
                      <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 text-xs">
                        {[
                          { label: 'FSID', value: row.fsid ?? '—', copyable: row.fsid },
                          { label: 'Searched', value: row.last_search_query ?? '—' },
                          { label: 'Results count', value: row.search_results_count != null ? String(row.search_results_count) : '—' },
                          { label: 'Selected agency', value: row.selected_agency_name ?? '—' },
                          { label: 'State', value: row.state_slug ?? '—' },
                          { label: 'Lead email', value: row.lead_email ?? '—' },
                          { label: 'Lead name', value: row.lead_name ?? '—' },
                          { label: 'Last event', value: row.last_event_name ? humanizeEventName(row.last_event_name) : '—' },
                          { label: 'Drop-off stage', value: row.dropoff_stage ?? '—' },
                        ].map(item => (
                          <div key={item.label}>
                            <p className="text-slate-400 font-semibold uppercase tracking-wide text-[10px]">{item.label}</p>
                            <div className="flex items-center mt-0.5">
                              <p className="text-slate-700 font-semibold truncate">{item.value}</p>
                              {item.copyable && <CopyButton text={item.copyable} />}
                            </div>
                          </div>
                        ))}
                      </div>

                      {/* Timeline preview */}
                      {row.steps_preview.length > 0 && (
                        <div>
                          <p className="text-[10px] font-semibold uppercase tracking-wide text-slate-400 mb-1.5">
                            Timeline preview
                          </p>
                          <div className="flex flex-wrap gap-1.5">
                            {row.steps_preview.map((s, i) => (
                              <span
                                key={i}
                                className="text-xs bg-white border border-slate-200 text-slate-600 px-2 py-0.5 rounded-full"
                              >
                                {s.step_number != null ? (
                                  <span className="font-bold text-slate-400 mr-1">#{s.step_number}</span>
                                ) : null}
                                {s.step_number != null && STEP_LABELS[s.step_number]
                                  ? STEP_LABELS[s.step_number]
                                  : humanizeEventName(s.event_name)}
                              </span>
                            ))}
                            {row.step_count > row.steps_preview.length && (
                              <span className="text-xs text-slate-400 px-1 py-0.5">
                                +{row.step_count - row.steps_preview.length} more
                              </span>
                            )}
                          </div>
                        </div>
                      )}

                      <button
                        onClick={() => setTimelineId(row.session_id)}
                        className="text-xs font-semibold text-blue-600 hover:text-blue-800 transition-colors flex items-center gap-1"
                      >
                        View full timeline
                        <ChevronRight className="w-3 h-3" />
                      </button>
                    </div>
                  </div>
                )}
              </div>
            );
          })}
        </div>
      )}

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="px-5 py-4 border-t border-gray-100 flex items-center justify-between gap-3">
          <button
            disabled={page <= 1 || loading}
            onClick={() => setPage(p => Math.max(1, p - 1))}
            className="flex items-center gap-1.5 px-3 py-1.5 text-sm border border-gray-200 rounded-lg hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
          >
            <ChevronLeft className="w-4 h-4" />
            Prev
          </button>
          <span className="text-xs text-slate-500 tabular-nums">
            Page {page} of {totalPages} &mdash; {total.toLocaleString()} total
          </span>
          <button
            disabled={page >= totalPages || loading}
            onClick={() => setPage(p => Math.min(totalPages, p + 1))}
            className="flex items-center gap-1.5 px-3 py-1.5 text-sm border border-gray-200 rounded-lg hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
          >
            Next
            <ChevronRight className="w-4 h-4" />
          </button>
        </div>
      )}

      {timelineId && (
        <TimelinePanel
          sessionId={timelineId}
          onClose={() => setTimelineId(null)}
        />
      )}
    </div>
  );
}

// ─── per-agency helpers ───────────────────────────────────────────────────

function rangeToDays(range: string): number {
  switch (range) {
    case '24h': return 1;
    case '7d':  return 7;
    case '30d': return 30;
    case '90d': return 90;
    default:    return 0;
  }
}

function IntentBadge({ signal }: { signal: 'high' | 'medium' | 'low' }) {
  if (signal === 'high') return (
    <span className="inline-flex text-[10px] font-bold px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-700 border border-emerald-200 uppercase tracking-wide">
      High
    </span>
  );
  if (signal === 'medium') return (
    <span className="inline-flex text-[10px] font-bold px-2 py-0.5 rounded-full bg-amber-100 text-amber-700 border border-amber-200 uppercase tracking-wide">
      Mid
    </span>
  );
  return (
    <span className="inline-flex text-[10px] font-bold px-2 py-0.5 rounded-full bg-gray-100 text-gray-500 border border-gray-200 uppercase tracking-wide">
      Low
    </span>
  );
}

type PASortKey = 'total_sessions' | 'paid_sessions' | 'revenue' | 'demo_opens' | 'checkout_opens' | 'highest_step_reached' | 'last_seen' | 'intent_signal' | 'replay_opens_count';

function PerAgencyTab({ range }: { range: string }) {
  const [rows, setRows] = useState<PerAgencyRow[]>([]);
  const [loading, setLoading] = useState(false);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const [sortKey, setSortKey] = useState<PASortKey>('total_sessions');
  const [sortDir, setSortDir] = useState<'desc' | 'asc'>('desc');
  const [kpis, setKpis] = useState<{ total_sessions: number; paid_sessions: number; revenue: number; checkout_opens: number; demo_opens: number } | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setLoadError(null);
    const days = rangeToDays(range);
    const result = await adminApiFetch<{ rows: PerAgencyRow[]; kpis: typeof kpis }>(
      `agency-funnel-analytics?action=per_agency&days=${days}`,
      { timeoutMs: 25000, retries: 0 }
    );
    if (!result.ok || result.error) {
      setLoadError(result.error?.message ?? 'Failed to load per-agency data');
    } else {
      setRows(result.data?.rows ?? []);
      setKpis(result.data?.kpis ?? null);
    }
    setLoading(false);
  }, [range]);

  useEffect(() => { load(); }, [load]);

  const handleSort = (key: PASortKey) => {
    if (sortKey === key) {
      setSortDir(d => d === 'desc' ? 'asc' : 'desc');
    } else {
      setSortKey(key);
      setSortDir('desc');
    }
  };

  const filtered = rows
    .filter(r => {
      if (!search.trim()) return true;
      const q = search.toLowerCase();
      return (
        (r.agency_name ?? '').toLowerCase().includes(q) ||
        (r.agency_slug ?? '').toLowerCase().includes(q) ||
        (r.state_slug ?? '').toLowerCase().includes(q)
      );
    })
    .sort((a, b) => {
      let av: number | string = 0;
      let bv: number | string = 0;
      if (sortKey === 'last_seen') {
        av = a.last_seen ?? '';
        bv = b.last_seen ?? '';
      } else if (sortKey === 'intent_signal') {
        const order: Record<string, number> = { high: 3, medium: 2, low: 1 };
        av = order[a.intent_signal] ?? 0;
        bv = order[b.intent_signal] ?? 0;
      } else {
        av = (a as unknown as Record<string, number>)[sortKey] ?? 0;
        bv = (b as unknown as Record<string, number>)[sortKey] ?? 0;
      }
      if (av < bv) return sortDir === 'desc' ? 1 : -1;
      if (av > bv) return sortDir === 'desc' ? -1 : 1;
      return 0;
    });

  const highIntentCount = rows.filter(r => r.intent_signal === 'high').length;
  const paidCount = rows.filter(r => r.paid_sessions > 0).length;

  function SortTh({ col, children }: { col: PASortKey; children: React.ReactNode }) {
    const isActive = sortKey === col;
    return (
      <th
        onClick={() => handleSort(col)}
        className="text-left px-3 py-2.5 text-xs font-semibold text-gray-500 uppercase tracking-wide cursor-pointer hover:text-slate-700 whitespace-nowrap select-none group"
      >
        <span className="flex items-center gap-1">
          {children}
          <span className={`text-[10px] transition-opacity ${isActive ? 'opacity-100' : 'opacity-0 group-hover:opacity-40'}`}>
            {isActive && sortDir === 'asc' ? '↑' : '↓'}
          </span>
        </span>
      </th>
    );
  }

  return (
    <div>
      <div className="px-5 py-3 border-b border-gray-100 flex items-center gap-3 bg-slate-50 flex-wrap">
        <div className="relative flex-1 min-w-48 max-w-xs">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-gray-400" />
          <input
            value={search}
            onChange={e => setSearch(e.target.value)}
            placeholder="Search agency, slug, state..."
            className="w-full pl-8 pr-3 py-1.5 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-slate-300 bg-white"
          />
        </div>
        <div className="flex items-center gap-3 ml-auto">
          {kpis && (
            <div className="hidden sm:flex items-center gap-4 text-xs text-slate-500">
              <span><strong className="text-slate-800">{rows.length}</strong> agencies</span>
              <span><strong className="text-emerald-700">{paidCount}</strong> paid</span>
              <span><strong className="text-amber-700">{highIntentCount}</strong> high intent</span>
              {kpis.revenue > 0 && (
                <span>
                  <strong className="text-emerald-700">
                    ${kpis.revenue.toLocaleString('en-US', { minimumFractionDigits: 0, maximumFractionDigits: 0 })}
                  </strong> revenue
                </span>
              )}
            </div>
          )}
          <button
            onClick={load}
            disabled={loading}
            className="p-1.5 text-slate-400 hover:text-slate-600 hover:bg-white rounded-lg border border-transparent hover:border-slate-200 transition-colors disabled:opacity-50"
          >
            <RefreshCw className={`w-3.5 h-3.5 ${loading ? 'animate-spin' : ''}`} />
          </button>
        </div>
      </div>

      {loadError && (
        <div className="px-5 py-3 flex items-center gap-2 text-sm text-red-600 bg-red-50 border-b border-red-100">
          <AlertTriangle className="w-4 h-4 shrink-0" />
          {loadError}
        </div>
      )}

      {loading && (
        <div className="p-5 space-y-2">
          {Array.from({ length: 8 }).map((_, i) => (
            <div key={i} className="h-10 bg-gray-100 rounded-lg animate-pulse" />
          ))}
        </div>
      )}

      {!loading && !loadError && filtered.length === 0 && (
        <div className="p-12 text-center">
          <Users className="w-8 h-8 text-gray-300 mx-auto mb-2" />
          <p className="text-sm text-gray-400">
            {search ? 'No agencies match your search' : 'No agency funnel data in this period'}
          </p>
        </div>
      )}

      {!loading && filtered.length > 0 && (
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-100 sticky top-0 z-10">
              <tr>
                <th className="text-left px-3 py-2.5 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Agency</th>
                <SortTh col="total_sessions">Sessions</SortTh>
                <SortTh col="paid_sessions">Paid</SortTh>
                <SortTh col="revenue">Revenue</SortTh>
                <th className="text-left px-3 py-2.5 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Conv%</th>
                <SortTh col="demo_opens">Demos</SortTh>
                <SortTh col="checkout_opens">Checkouts</SortTh>
                <SortTh col="highest_step_reached">Highest Step</SortTh>
                <th className="text-left px-3 py-2.5 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Last Stage</th>
                <SortTh col="last_seen">Last Seen</SortTh>
                <SortTh col="replay_opens_count">Replay</SortTh>
                <SortTh col="intent_signal">Intent</SortTh>
                <th className="px-3 py-2.5" />
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-50">
              {filtered.map(row => {
                const convRate = row.total_sessions > 0
                  ? Math.round((row.paid_sessions / row.total_sessions) * 100)
                  : 0;
                const stepLabel = STEP_LABELS[row.highest_step_reached]
                  ?? (row.highest_step_reached > 0 ? `Step ${row.highest_step_reached}` : '—');
                const stageCfg = STAGE_CONFIG[row.last_activity_stage ?? ''] ?? null;
                const replyKey = row.agency_id
                  ? `agency_id=${encodeURIComponent(row.agency_id)}`
                  : row.agency_slug
                  ? `agency_slug=${encodeURIComponent(row.agency_slug)}`
                  : null;
                const replyHref = replyKey
                  ? `/wp-admin/email/agency-lookup?${replyKey}${row.state_slug ? `&state=${encodeURIComponent(row.state_slug)}` : ''}`
                  : null;
                return (
                  <tr key={row.agency_key} className="hover:bg-slate-50 transition-colors">
                    <td className="px-3 py-3 max-w-[180px]">
                      <div className="min-w-0">
                        <p
                          className="text-sm font-semibold text-slate-800 truncate"
                          title={row.agency_name ?? row.agency_slug ?? row.agency_key}
                        >
                          {row.agency_name ?? row.agency_slug ?? (
                            <span className="text-slate-400 italic">Unknown</span>
                          )}
                        </p>
                        <div className="flex items-center gap-1 mt-0.5 flex-wrap">
                          {row.state_slug && (
                            <span className="text-[10px] text-slate-400 flex items-center gap-0.5">
                              <MapPin className="w-2.5 h-2.5" />{row.state_slug}
                            </span>
                          )}
                          {row.is_unresolved && (
                            <span className="text-[10px] font-semibold text-orange-600 bg-orange-50 px-1.5 py-0.5 rounded-full border border-orange-200">
                              unresolved
                            </span>
                          )}
                        </div>
                      </div>
                    </td>
                    <td className="px-3 py-3 tabular-nums text-slate-700 font-medium">
                      {row.total_sessions.toLocaleString()}
                    </td>
                    <td className="px-3 py-3 tabular-nums">
                      {row.paid_sessions > 0 ? (
                        <span className="font-bold text-emerald-700">{row.paid_sessions}</span>
                      ) : <span className="text-gray-300">—</span>}
                    </td>
                    <td className="px-3 py-3 tabular-nums">
                      {row.revenue > 0 ? (
                        <span className="font-semibold text-emerald-700">
                          ${row.revenue.toLocaleString('en-US', { minimumFractionDigits: 0, maximumFractionDigits: 0 })}
                        </span>
                      ) : <span className="text-gray-300">—</span>}
                    </td>
                    <td className="px-3 py-3 tabular-nums text-slate-600">
                      {convRate > 0 ? `${convRate}%` : <span className="text-gray-300">—</span>}
                    </td>
                    <td className="px-3 py-3 tabular-nums text-slate-600">
                      {row.demo_opens > 0 ? row.demo_opens : <span className="text-gray-300">—</span>}
                    </td>
                    <td className="px-3 py-3 tabular-nums text-slate-600">
                      {row.checkout_opens > 0 ? row.checkout_opens : <span className="text-gray-300">—</span>}
                    </td>
                    <td className="px-3 py-3 max-w-[160px]">
                      <p className="text-xs text-slate-600 truncate" title={stepLabel}>{stepLabel}</p>
                      {row.drop_off_label && (
                        <p className="text-[10px] text-slate-400 truncate mt-0.5">{row.drop_off_label}</p>
                      )}
                    </td>
                    <td className="px-3 py-3">
                      {stageCfg ? (
                        <span className={`inline-flex items-center text-xs font-semibold px-2 py-0.5 rounded-full ${stageCfg.bg} ${stageCfg.color}`}>
                          {stageCfg.label}
                        </span>
                      ) : row.last_activity_stage ? (
                        <span className="text-xs text-slate-500">{row.last_activity_stage}</span>
                      ) : <span className="text-gray-300">—</span>}
                    </td>
                    <td className="px-3 py-3 text-xs text-slate-500 whitespace-nowrap">
                      {row.last_seen
                        ? formatAdminTimestampWithAgo(row.last_seen)
                        : <span className="text-gray-300">—</span>}
                    </td>
                    <td className="px-3 py-3 tabular-nums">
                      {(row.replay_opens_count ?? 0) > 0 ? (
                        <span className={`inline-flex items-center justify-center min-w-[28px] px-1.5 py-0.5 rounded text-xs font-bold ${
                          (row.replay_opens_count ?? 0) >= 5
                            ? 'bg-red-100 text-red-700'
                            : (row.replay_opens_count ?? 0) >= 3
                            ? 'bg-orange-100 text-orange-700'
                            : (row.replay_opens_count ?? 0) >= 2
                            ? 'bg-amber-100 text-amber-700'
                            : 'bg-slate-100 text-slate-600'
                        }`}>
                          {row.replay_opens_count}×
                        </span>
                      ) : <span className="text-gray-300">—</span>}
                    </td>
                    <td className="px-3 py-3">
                      <IntentBadge signal={row.intent_signal} />
                    </td>
                    <td className="px-3 py-3">
                      {replyHref ? (
                        <a
                          href={replyHref}
                          className="text-xs font-medium text-blue-600 hover:text-blue-800 whitespace-nowrap flex items-center gap-1 transition-colors"
                          title="Open in Reply Engine"
                        >
                          Reply <ChevronRight className="w-3 h-3" />
                        </a>
                      ) : null}
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}

// ─── main page ────────────────────────────────────────────────────────────

export default function WpAdminFunnelAnalyticsPage() {
  const { isReady, isValid } = useAdminSession();
  useTimestampRefresh();
  const [range, setRange] = useState('7d');
  const [includeDemo, setIncludeDemo] = useState(false);
  const [funnelName, setFunnelName] = useState('');
  const [trafficMode, setTrafficMode] = useState<TrafficMode>('all');
  const [activeTab, setActiveTab] = useState<'overview' | 'steps' | 'dropoff' | 'journeys' | 'per_agency'>('overview');

  const [overview, setOverview] = useState<OverviewData | null>(null);
  const [steps, setSteps] = useState<StepRow[]>([]);
  const [dropOff, setDropOff] = useState<DropOffRow[]>([]);

  const [loadingOverview, setLoadingOverview] = useState(false);
  const [loadingSteps, setLoadingSteps] = useState(false);
  const [loadingDrop, setLoadingDrop] = useState(false);
  const [error, setError] = useState<AdminApiError | null>(null);

  const [showFunnelDropdown, setShowFunnelDropdown] = useState(false);
  const [activeKpi, setActiveKpi] = useState<KpiKey | null>(null);
  const tabsRef = useRef<HTMLDivElement>(null);

  const handleKpiClick = useCallback((key: KpiKey) => {
    setActiveKpi(prev => {
      const next = prev === key ? null : key;
      if (next) {
        setActiveTab('journeys');
        setTimeout(() => {
          tabsRef.current?.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }, 80);
      }
      return next;
    });
  }, []);

  const handleClearKpi = useCallback(() => {
    setActiveKpi(null);
  }, []);

  const fetchOverview = useCallback(async (r: string, demo: boolean, fn: string, tm?: string) => {
    setLoadingOverview(true);
    setError(null);
    try {
      const extra = tm ? { confidence_filter: tm } : undefined;
      const result = await apiFetch<OverviewData>('overview', r, demo, fn, extra);
      if (!result.ok || result.error) {
        setError(result.error || { code: 'unknown_error', message: 'Failed to load', retryable: true });
        return;
      }
      setOverview(result.data ?? null);
    } catch (e) {
      setError({
        code: 'unknown_error',
        message: e instanceof Error ? e.message : 'Failed to load',
        retryable: true,
      });
    } finally {
      setLoadingOverview(false);
    }
  }, []);

  const fetchSteps = useCallback(async (r: string, demo: boolean, fn: string, tm?: string) => {
    setLoadingSteps(true);
    try {
      const extra = tm ? { confidence_filter: tm } : undefined;
      const result = await apiFetch<{ rows: StepRow[] }>('step_table', r, demo, fn, extra);
      if (result.ok && result.data) {
        setSteps(result.data.rows ?? []);
      }
    } finally {
      setLoadingSteps(false);
    }
  }, []);

  const fetchDropOff = useCallback(async (r: string, demo: boolean, fn: string, tm?: string) => {
    setLoadingDrop(true);
    try {
      const extra = tm ? { confidence_filter: tm } : undefined;
      const result = await apiFetch<{ rows: DropOffRow[] }>('drop_off', r, demo, fn, extra);
      if (result.ok && result.data) {
        setDropOff(result.data.rows ?? []);
      }
    } finally {
      setLoadingDrop(false);
    }
  }, []);

  const tmParam = trafficModeToApiParam(trafficMode);

  const refresh = useCallback(() => {
    if (!isReady || !isValid) return;
    fetchOverview(range, includeDemo, funnelName, tmParam);
    if (activeTab === 'steps') fetchSteps(range, includeDemo, funnelName, tmParam);
    if (activeTab === 'dropoff') fetchDropOff(range, includeDemo, funnelName, tmParam);
  }, [range, includeDemo, funnelName, tmParam, activeTab, fetchOverview, fetchSteps, fetchDropOff, isReady, isValid]);

  useEffect(() => {
    if (!isReady || !isValid) return;
    fetchOverview(range, includeDemo, funnelName, tmParam);
  }, [range, includeDemo, funnelName, tmParam, fetchOverview, isReady, isValid]);

  useEffect(() => {
    if (!isReady || !isValid) return;
    if (activeTab === 'steps') fetchSteps(range, includeDemo, funnelName, tmParam);
    if (activeTab === 'dropoff') fetchDropOff(range, includeDemo, funnelName, tmParam);
  }, [activeTab, range, includeDemo, funnelName, tmParam, fetchSteps, fetchDropOff, isReady, isValid]);

  const totalSessions = overview?.total_sessions ?? 0;
  const stageCounts = overview?.stage_counts ?? {};
  const funnelCounts = overview?.funnel_counts ?? {};
  const topFunnelStages = ['paid', 'checkout_started', 'offer_viewed', 'submitted', 'opened'];
  const maxStage = Math.max(1, ...Object.values(stageCounts));

  // Group steps by funnel, preserving canonical order
  const FUNNEL_ORDER = ['your_agency', 'demo', 'availability', 'top25', 'spotlight', 'matched', 'request_replay'];
  const groupedSteps: Record<string, StepRow[]> = {};
  for (const row of steps) {
    const fn = row.funnel_name ?? 'unknown';
    if (!groupedSteps[fn]) groupedSteps[fn] = [];
    groupedSteps[fn].push(row);
  }
  const orderedFunnelKeys = Object.keys(groupedSteps).sort((a, b) => {
    const ai = FUNNEL_ORDER.indexOf(a), bi = FUNNEL_ORDER.indexOf(b);
    if (ai === -1 && bi === -1) return a.localeCompare(b);
    if (ai === -1) return 1;
    if (bi === -1) return -1;
    return ai - bi;
  });

  return (
    <WpAdminLayout
      title="Funnel Analytics"
      subtitle="Session progression, step-level events, and drop-off analysis"
    >
      <div className="space-y-5">

        {/* Filter bar */}
        <div className="bg-white rounded-xl border border-slate-200 p-4 flex flex-wrap items-center gap-3">
          <select
            value={range}
            onChange={e => setRange(e.target.value)}
            className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-slate-300 bg-white"
          >
            {DATE_RANGES.map(r => <option key={r.value} value={r.value}>{r.label}</option>)}
          </select>

          <div className="relative">
            <button
              onClick={() => setShowFunnelDropdown(v => !v)}
              className="flex items-center gap-2 px-3 py-2 text-sm border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors"
            >
              <Filter className="w-4 h-4 text-gray-400" />
              {FUNNEL_NAMES.find(f => f.value === funnelName)?.label ?? 'All funnels'}
              <ChevronDown className="w-3.5 h-3.5 text-gray-400" />
            </button>
            {showFunnelDropdown && (
              <div className="absolute top-full mt-1 left-0 z-10 bg-white border border-gray-200 rounded-lg shadow-lg py-1 min-w-44">
                {FUNNEL_NAMES.map(f => (
                  <button
                    key={f.value}
                    onClick={() => { setFunnelName(f.value); setShowFunnelDropdown(false); }}
                    className={`w-full text-left px-4 py-2 text-sm hover:bg-gray-50 ${funnelName === f.value ? 'font-semibold text-slate-800' : 'text-gray-700'}`}
                  >
                    {f.label}
                  </button>
                ))}
              </div>
            )}
          </div>

          <label className={`flex items-center gap-2 px-3 py-2 text-sm border rounded-lg cursor-pointer transition-colors ${
            includeDemo
              ? 'border-orange-300 bg-orange-50 text-orange-800'
              : 'border-gray-200 text-gray-600 hover:bg-gray-50'
          }`}>
            <input
              type="checkbox"
              checked={includeDemo}
              onChange={e => setIncludeDemo(e.target.checked)}
              className="w-4 h-4 rounded border-gray-300"
            />
            {includeDemo ? <Eye className="w-4 h-4" /> : <EyeOff className="w-4 h-4" />}
            Include demo
          </label>

          <div className="ml-auto flex items-center gap-3">
            <TimezoneLabel />
            <button
              onClick={refresh}
              disabled={loadingOverview}
              className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-lg transition-colors disabled:opacity-50"
              title="Refresh"
            >
              <RefreshCw className={`w-4 h-4 ${loadingOverview ? 'animate-spin' : ''}`} />
            </button>
          </div>
        </div>

        <TrafficModeToggle value={trafficMode} onChange={setTrafficMode} compact />

        {!isReady && (
          <AdminLoadingState message="Checking admin session..." />
        )}

        {isReady && !isValid && (
          <AdminErrorBanner
            error={{ code: 'no_session', message: 'Please log in to view analytics', retryable: false }}
            onLogin={() => { window.location.href = '/wp-admin'; }}
          />
        )}

        {error && (
          <AdminErrorBanner
            error={error}
            onRetry={error.retryable ? refresh : undefined}
            onLogin={error.code === 'session_expired' || error.code === 'no_session' ? () => { window.location.href = '/wp-admin'; } : undefined}
          />
        )}

        {/* KPI cards */}
        {isReady && isValid && (
          <>
            <div className="grid grid-cols-2 sm:grid-cols-4 lg:grid-cols-8 gap-3">
              <KpiCard
                icon={<Users className="w-5 h-5 text-blue-600" />}
                label="Sessions"
                value={loadingOverview ? '…' : error ? '—' : totalSessions.toLocaleString()}
                sub={includeDemo && overview ? `${overview.demo_count} demo` : undefined}
                accent="bg-blue-50"
                isActive={activeKpi === 'sessions'}
                onClick={() => handleKpiClick('sessions')}
              />
              <KpiCard
                icon={<CreditCard className="w-5 h-5 text-emerald-600" />}
                label="Paid"
                value={loadingOverview ? '…' : error ? '—' : (overview?.paid_count ?? 0).toLocaleString()}
                accent="bg-emerald-50"
                isActive={activeKpi === 'paid'}
                onClick={() => handleKpiClick('paid')}
              />
              <KpiCard
                icon={<TrendingUp className="w-5 h-5 text-amber-600" />}
                label="Checkouts"
                value={loadingOverview ? '…' : error ? '—' : (overview?.checkout_count ?? 0).toLocaleString()}
                sub="started + paid"
                accent="bg-amber-50"
                isActive={activeKpi === 'checkouts'}
                onClick={() => handleKpiClick('checkouts')}
              />
              <KpiCard
                icon={<Zap className="w-5 h-5 text-violet-500" />}
                label="Conv Rate"
                value={loadingOverview ? '…' : error ? '—' : `${overview?.conv_rate ?? 0}%`}
                sub="paid ÷ sessions"
                accent="bg-violet-50"
                isActive={activeKpi === 'convrate'}
                onClick={() => handleKpiClick('convrate')}
              />
              <KpiCard
                icon={<Eye className="w-5 h-5 text-orange-500" />}
                label="Demos Opened"
                value={loadingOverview ? '…' : error ? '—' : (overview?.demo_count ?? 0).toLocaleString()}
                accent="bg-orange-50"
                isActive={activeKpi === 'demos'}
                onClick={() => handleKpiClick('demos')}
              />
              <KpiCard
                icon={<BarChart2 className="w-5 h-5 text-rose-500" />}
                label="Offer Page Views"
                value={loadingOverview ? '…' : error ? '—' : (overview?.stage_counts?.['offer_viewed'] ?? 0).toLocaleString()}
                accent="bg-rose-50"
                isActive={activeKpi === 'upsells'}
                onClick={() => handleKpiClick('upsells')}
              />
              <KpiCard
                icon={<DollarSign className="w-5 h-5 text-emerald-600" />}
                label="Revenue"
                value={loadingOverview ? '…' : error ? '—' : overview?.total_revenue != null ? `$${overview.total_revenue.toLocaleString('en-US', { minimumFractionDigits: 0, maximumFractionDigits: 0 })}` : '$0'}
                sub={overview?.revenue_order_count != null ? `${overview.revenue_order_count} orders` : undefined}
                accent="bg-emerald-50"
                isActive={activeKpi === 'revenue'}
                onClick={() => handleKpiClick('revenue')}
              />
              <KpiCard
                icon={<Activity className="w-5 h-5 text-teal-500" />}
                label="Avg Order"
                value={loadingOverview ? '…' : error ? '—' : overview?.avg_order_value != null ? `$${overview.avg_order_value.toLocaleString('en-US', { minimumFractionDigits: 0, maximumFractionDigits: 0 })}` : '$0'}
                sub="per order"
                accent="bg-teal-50"
                isActive={activeKpi === 'avg_order'}
                onClick={() => handleKpiClick('avg_order')}
              />
            </div>
          </>
        )}

        {/* Active KPI banner */}
        {isReady && isValid && activeKpi && (
          <div className="flex items-center gap-3 bg-slate-800 text-white rounded-xl px-4 py-3">
            <span className="relative flex h-2.5 w-2.5">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75" />
              <span className="relative inline-flex rounded-full h-2.5 w-2.5 bg-emerald-400" />
            </span>
            <span className="text-sm font-semibold">
              Viewing: <span className="text-emerald-300">{KPI_FILTERS[activeKpi].viewingLabel}</span>
            </span>
            <span className="text-xs text-slate-400 hidden sm:inline">
              Journeys tab filtered below — stage distribution highlights relevant stages
            </span>
            <button
              onClick={handleClearKpi}
              className="ml-auto flex items-center gap-1.5 text-xs text-slate-300 hover:text-white bg-slate-700 hover:bg-slate-600 px-2.5 py-1.5 rounded-lg transition-colors"
            >
              <X className="w-3.5 h-3.5" />
              Clear filter
            </button>
          </div>
        )}

        {/* Overview panels */}
        {isReady && isValid && !loadingOverview && overview && !error && (
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
            <div className="bg-white rounded-xl border border-slate-200 p-5">
              <h2 className="text-sm font-semibold text-slate-700 mb-4 flex items-center gap-2">
                <Zap className="w-4 h-4 text-amber-500" />
                Stage distribution
                {activeKpi && KPI_FILTERS[activeKpi].stagesHighlight && (
                  <span className="ml-auto text-xs text-slate-400 font-normal">highlighted for active filter</span>
                )}
              </h2>
              <div className="space-y-3">
                {topFunnelStages.map(stage => {
                  const cnt = stageCounts[stage] ?? 0;
                  if (cnt === 0) return null;
                  const cfg = STAGE_CONFIG[stage] ?? { label: stage, color: 'text-gray-600', bg: 'bg-gray-100' };
                  const highlight = activeKpi ? KPI_FILTERS[activeKpi].stagesHighlight : undefined;
                  const isDimmed = highlight ? !highlight.includes(stage) : false;
                  const isHighlighted = highlight ? highlight.includes(stage) : false;
                  return (
                    <div key={stage} className={`transition-opacity ${isDimmed ? 'opacity-30' : 'opacity-100'}`}>
                      <div className="flex items-center justify-between mb-1">
                        <span className={`text-xs font-semibold px-2 py-0.5 rounded-full ${cfg.bg} ${cfg.color} ${isHighlighted ? 'ring-2 ring-offset-1 ring-current' : ''}`}>{cfg.label}</span>
                        <span className="text-sm font-bold text-slate-800">{cnt.toLocaleString()}</span>
                      </div>
                      <ProgressBar value={cnt} max={maxStage} color={
                        stage === 'paid' ? 'bg-emerald-500' :
                        stage === 'checkout_started' ? 'bg-amber-500' :
                        stage === 'offer_viewed' ? 'bg-blue-400' :
                        stage === 'submitted' ? 'bg-sky-400' :
                        'bg-gray-300'
                      } />
                    </div>
                  );
                })}
                {Object.keys(stageCounts).length === 0 && (
                  <p className="text-sm text-slate-400 text-center py-4">No sessions in this period</p>
                )}
              </div>
            </div>

            <div className="bg-white rounded-xl border border-slate-200 p-5">
              <h2 className="text-sm font-semibold text-slate-700 mb-4 flex items-center gap-2">
                <BarChart2 className="w-4 h-4 text-blue-500" />
                Sessions by funnel
              </h2>
              <div className="space-y-3">
                {Object.entries(funnelCounts)
                  .sort(([, a], [, b]) => b - a)
                  .map(([fn, cnt]) => {
                    const dotColor = FUNNEL_COLORS[fn] ?? 'bg-gray-400';
                    return (
                      <div key={fn}>
                        <div className="flex items-center justify-between mb-1">
                          <div className="flex items-center gap-2">
                            <div className={`w-2.5 h-2.5 rounded-full ${dotColor}`} />
                            <span className="text-sm text-slate-700 font-medium">{fn.replace(/_/g, ' ')}</span>
                          </div>
                          <span className="text-sm font-bold text-slate-800">{cnt.toLocaleString()}</span>
                        </div>
                        <ProgressBar value={cnt} max={totalSessions || 1} color={dotColor} />
                      </div>
                    );
                  })}
                {Object.keys(funnelCounts).length === 0 && (
                  <p className="text-sm text-slate-400 text-center py-4">No funnel data in this period</p>
                )}
              </div>
            </div>
          </div>
        )}

        {/* Tabs */}
        {isReady && isValid && (
        <div ref={tabsRef} className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="flex border-b border-gray-200 overflow-x-auto">
            {([
              { key: 'steps',      label: 'Step-level events' },
              { key: 'dropoff',    label: 'Drop-off analysis' },
              { key: 'journeys',   label: 'Journeys' },
              { key: 'per_agency', label: 'Per Agency' },
            ] as const).map(tab => (
              <button
                key={tab.key}
                onClick={() => setActiveTab(tab.key)}
                className={`px-5 py-3 text-sm font-medium transition-colors border-b-2 whitespace-nowrap ${
                  activeTab === tab.key
                    ? 'border-slate-800 text-slate-800'
                    : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
                }`}
              >
                {tab.label}
              </button>
            ))}
          </div>

          {/* ── Step-level events ── */}
          {activeTab === 'steps' && (
            <div>
              {/* Explanatory note */}
              <div className="px-5 py-3 border-b border-gray-100 flex items-start gap-2 bg-slate-50">
                <Info className="w-3.5 h-3.5 text-slate-400 shrink-0 mt-0.5" />
                <p className="text-xs text-slate-500 leading-relaxed">
                  Aggregate event counts by step — not a strict linear funnel. Counts can differ across steps when users enter mid-funnel or take alternate paths.
                </p>
              </div>

              {loadingSteps ? (
                <div className="p-6 space-y-2">
                  {Array.from({ length: 8 }).map((_, i) => (
                    <div key={i} className="h-8 bg-gray-100 rounded animate-pulse" />
                  ))}
                </div>
              ) : steps.length === 0 ? (
                <div className="p-12 text-center">
                  <Activity className="w-8 h-8 text-gray-300 mx-auto mb-2" />
                  <p className="text-sm text-gray-400">No event data in this period</p>
                </div>
              ) : (
                orderedFunnelKeys.map(fn => {
                  const rows = groupedSteps[fn];
                  return (
                    <div key={fn}>
                      <div className="px-5 py-2.5 bg-slate-50 border-b border-gray-100 flex items-center gap-2">
                        <div className={`w-2.5 h-2.5 rounded-full ${FUNNEL_COLORS[fn] ?? 'bg-gray-400'}`} />
                        <span className="text-xs font-bold text-slate-600 uppercase tracking-wide">{fn.replace(/_/g, ' ')}</span>
                      </div>
                      <div className="overflow-x-auto">
                        <table className="w-full text-sm">
                          <thead className="bg-gray-50 border-b border-gray-100">
                            <tr>
                              <th className="text-left px-5 py-2.5 text-xs font-semibold text-gray-500 uppercase tracking-wide">Step</th>
                              <th className="text-left px-5 py-2.5 text-xs font-semibold text-gray-500 uppercase tracking-wide">Event</th>
                              <th className="text-right px-5 py-2.5 text-xs font-semibold text-gray-500 uppercase tracking-wide">Count</th>
                              {includeDemo && <th className="text-right px-5 py-2.5 text-xs font-semibold text-gray-500 uppercase tracking-wide">Demo</th>}
                            </tr>
                          </thead>
                          <tbody className="divide-y divide-gray-50">
                            {rows.map((row, i) => {
                              const maxCnt = Math.max(...rows.map(r => r.count));
                              const pct = maxCnt > 0 ? Math.round((row.count / maxCnt) * 100) : 0;
                              const label = row.step_number != null && STEP_LABELS[row.step_number]
                                ? STEP_LABELS[row.step_number]
                                : humanizeEventName(row.event_name);
                              return (
                                <tr key={i} className="hover:bg-slate-50 transition-colors">
                                  <td className="px-5 py-3">
                                    {row.step_number != null ? (
                                      <span className="inline-flex items-center justify-center w-7 h-7 rounded-full bg-slate-100 text-slate-600 text-xs font-bold tabular-nums">
                                        {row.step_number}
                                      </span>
                                    ) : <span className="text-gray-300">—</span>}
                                  </td>
                                  <td className="px-5 py-3">
                                    <div>
                                      <span className="text-sm font-medium text-slate-800">{label}</span>
                                      <div className="mt-1 w-full max-w-xs h-1.5 bg-slate-100 rounded-full overflow-hidden">
                                        <div
                                          className={`h-full rounded-full ${FUNNEL_COLORS[fn] ?? 'bg-gray-400'}`}
                                          style={{ width: `${pct}%` }}
                                        />
                                      </div>
                                    </div>
                                  </td>
                                  <td className="px-5 py-3 text-right font-bold text-slate-800 tabular-nums">{row.count.toLocaleString()}</td>
                                  {includeDemo && (
                                    <td className="px-5 py-3 text-right">
                                      {row.demo_count > 0 ? (
                                        <span className="text-xs font-semibold px-2 py-0.5 rounded-full bg-orange-100 text-orange-700">
                                          {row.demo_count}
                                        </span>
                                      ) : <span className="text-gray-300 text-xs">—</span>}
                                    </td>
                                  )}
                                </tr>
                              );
                            })}
                          </tbody>
                        </table>
                      </div>
                    </div>
                  );
                })
              )}
            </div>
          )}

          {/* ── Drop-off analysis ── */}
          {activeTab === 'dropoff' && (
            <div>
              {loadingDrop ? (
                <div className="p-6 space-y-2">
                  {Array.from({ length: 6 }).map((_, i) => (
                    <div key={i} className="h-8 bg-gray-100 rounded animate-pulse" />
                  ))}
                </div>
              ) : dropOff.length === 0 ? (
                <div className="p-12 text-center">
                  <TrendingUp className="w-8 h-8 text-gray-300 mx-auto mb-2" />
                  <p className="text-sm text-gray-400">No drop-off data in this period</p>
                </div>
              ) : (
                <div>
                  <div className="px-5 py-2.5 border-b border-gray-100 flex items-center justify-between bg-slate-50">
                    <div className="flex items-center gap-2">
                      <Info className="w-3.5 h-3.5 text-slate-400" />
                      <p className="text-xs text-slate-500">Sorted by session count (highest first)</p>
                    </div>
                  </div>
                  <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                      <thead className="bg-gray-50 border-b border-gray-100">
                        <tr>
                          <th className="text-left px-5 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">Funnel</th>
                          <th className="text-left px-5 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">Drop-off stage</th>
                          <th className="text-right px-5 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide">Sessions</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-50">
                        {dropOff.map((row, i) => {
                          const maxCnt = Math.max(...dropOff.map(r => r.count));
                          const pct = maxCnt > 0 ? Math.round((row.count / maxCnt) * 100) : 0;
                          const cfg = STAGE_CONFIG[row.dropoff_stage] ?? { label: row.dropoff_stage, color: 'text-gray-600', bg: 'bg-gray-100' };
                          return (
                            <tr key={i} className="hover:bg-slate-50 transition-colors">
                              <td className="px-5 py-3">
                                <div className="flex items-center gap-2">
                                  <div className={`w-2 h-2 rounded-full ${FUNNEL_COLORS[row.funnel_name] ?? 'bg-gray-400'}`} />
                                  <span className="text-sm text-slate-600">{row.funnel_name.replace(/_/g, ' ')}</span>
                                </div>
                              </td>
                              <td className="px-5 py-3">
                                <div>
                                  <span className={`text-xs font-semibold px-2 py-0.5 rounded-full ${cfg.bg} ${cfg.color}`}>{cfg.label}</span>
                                  <div className="mt-1.5 w-full max-w-xs h-1.5 bg-slate-100 rounded-full overflow-hidden">
                                    <div className="h-full rounded-full bg-red-400" style={{ width: `${pct}%` }} />
                                  </div>
                                </div>
                              </td>
                              <td className="px-5 py-3 text-right font-bold text-slate-800 tabular-nums">{row.count.toLocaleString()}</td>
                            </tr>
                          );
                        })}
                      </tbody>
                    </table>
                  </div>
                </div>
              )}
            </div>
          )}

          {/* ── Journeys ── */}
          {activeTab === 'journeys' && (
            <JourneysTab
              range={range}
              includeDemo={includeDemo}
              funnelName={funnelName}
              kpiFilter={activeKpi}
              onClearKpi={handleClearKpi}
            />
          )}

          {/* ── Per Agency ── */}
          {activeTab === 'per_agency' && (
            <PerAgencyTab range={range} />
          )}
        </div>
        )}

      </div>
    </WpAdminLayout>
  );
}

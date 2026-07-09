import { useEffect, useState, useCallback, useRef } from 'react';
import { Link } from 'react-router-dom';
import {
  Search, Download, RefreshCw, ChevronLeft, ChevronRight,
  X, Copy, Check, Inbox, Users, Star, CheckSquare, Calendar, Activity, Monitor,
  Filter, ChevronDown, Clock, TrendingUp, CreditCard, AlertTriangle,
  MapPin, Mail, BellRing, Send, Trash2, FileDown, ChevronUp, BarChart2, MousePointerClick, Settings, Video
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch, type AdminApiError } from '../lib/adminApiFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { formatStateName } from '../utils/formatLocation';

type TabKey = 'all' | 'matched_leads' | 'spotlight_applications' | 'top25_applications' | 'agency_availability_requests' | 'demo_availability' | 'owner_demo_events' | 'your_agency_profile_clicks' | 'manage_funnel_events' | 'request_replay_events';

interface FunnelSummary {
  session_id: string | null;
  stage: string | null;
  last_event_at: string | null;
  dropoff_stage: string | null;
  dropoff_path: string | null;
  selected_offer: string | null;
  selected_upsell: string | null;
  payment_status: string | null;
  amount_total: number | null;
  currency: string | null;
  checkout_session_id: string | null;
}

interface SubmissionSummary {
  kind: string;
  id: string;
  unified_id: string;
  created_at: string;
  state_slug: string;
  primary_label: string;
  email: string;
  status: string;
  preview: string;
  funnel: FunnelSummary | null;
  is_demo?: boolean;
  display_type?: string;
  target_agency_id?: string;
}

interface FunnelEvent {
  id: string;
  created_at: string;
  event_name: string;
  event_stage: string | null;
  page_path: string | null;
  metadata: Record<string, unknown>;
}

interface Counts {
  matched_leads: number;
  spotlight_applications: number;
  top25_applications: number;
  agency_availability_requests: number;
  demo_availability: number;
  owner_demo_events: number;
  your_agency_profile_clicks: number;
  manage_funnel_events: number;
  request_replay_events?: number;
}

interface Meta {
  type: string;
  limit: number;
  offset: number;
  has_more: boolean;
}

const TAB_CONFIG: { key: TabKey; label: string; icon: JSX.Element; color: string }[] = [
  { key: 'all', label: 'All Recent', icon: <Inbox className="w-4 h-4" />, color: 'bg-gray-600' },
  { key: 'matched_leads', label: 'Get Matched', icon: <Users className="w-4 h-4" />, color: 'bg-blue-600' },
  { key: 'spotlight_applications', label: 'Sponsored Spotlight', icon: <Star className="w-4 h-4" />, color: 'bg-amber-500' },
  { key: 'top25_applications', label: 'Top 25 Submissions', icon: <CheckSquare className="w-4 h-4" />, color: 'bg-emerald-600' },
  { key: 'agency_availability_requests', label: 'Availability Checks', icon: <Calendar className="w-4 h-4" />, color: 'bg-sky-600' },
  { key: 'demo_availability', label: 'Demo - Availability', icon: <Monitor className="w-4 h-4" />, color: 'bg-orange-500' },
  { key: 'owner_demo_events', label: 'Demo', icon: <Activity className="w-4 h-4" />, color: 'bg-rose-600' },
  { key: 'your_agency_profile_clicks', label: '/your-agency Clicks', icon: <MousePointerClick className="w-4 h-4" />, color: 'bg-teal-600' },
  { key: 'manage_funnel_events', label: 'Manage Funnel', icon: <Settings className="w-4 h-4" />, color: 'bg-purple-600' },
  { key: 'request_replay_events', label: 'Request Replay', icon: <Video className="w-4 h-4" />, color: 'bg-cyan-600' },
];

const KIND_LABELS: Record<string, string> = {
  matched_leads: 'Get Matched',
  spotlight_applications: 'Spotlight',
  top25_applications: 'Top 25',
  agency_availability_requests: 'Availability',
  demo_availability: 'Demo - Availability',
  owner_demo_events: 'Demo',
  your_agency_profile_clicks: '/your-agency Click',
  manage_funnel_events: 'Manage Funnel',
  request_replay_events: 'Replay Funnel',
};

const KIND_COLORS: Record<string, string> = {
  matched_leads: 'bg-sky-100 text-sky-700',
  spotlight_applications: 'bg-amber-100 text-amber-700',
  top25_applications: 'bg-emerald-100 text-emerald-700',
  agency_availability_requests: 'bg-sky-100 text-sky-700',
  demo_availability: 'bg-orange-100 text-orange-700',
  owner_demo_events: 'bg-rose-100 text-rose-700',
  your_agency_profile_clicks: 'bg-teal-100 text-teal-700',
  manage_funnel_events: 'bg-purple-100 text-purple-700',
  request_replay_events: 'bg-cyan-100 text-cyan-700',
};

function getDisplayType(item: SubmissionSummary): string {
  if (item.kind === 'agency_availability_requests') {
    return item.is_demo ? 'demo_availability' : 'agency_availability_requests';
  }
  return item.kind;
}

const STAGE_CONFIG: Record<string, { label: string; color: string }> = {
  paid:               { label: 'Paid',              color: 'bg-emerald-100 text-emerald-700' },
  checkout_started:   { label: 'At Checkout',        color: 'bg-amber-100 text-amber-700' },
  upsell_viewed:      { label: 'Upsell Viewed',      color: 'bg-purple-100 text-purple-700' },
  offer_viewed:       { label: 'Offer Viewed',       color: 'bg-blue-100 text-blue-700' },
  submitted:          { label: 'Submitted',           color: 'bg-sky-100 text-sky-700' },
  opened:             { label: 'Opened',              color: 'bg-gray-100 text-gray-600' },
};

const PAYMENT_CONFIG: Record<string, { label: string; color: string }> = {
  paid:     { label: 'Paid',     color: 'bg-emerald-100 text-emerald-700' },
  unpaid:   { label: 'Unpaid',   color: 'bg-gray-100 text-gray-500' },
  failed:   { label: 'Failed',   color: 'bg-red-100 text-red-600' },
  refunded: { label: 'Refunded', color: 'bg-orange-100 text-orange-600' },
};

const DATE_FILTERS = [
  { label: 'Last 7 days', value: '7d' },
  { label: 'Last 30 days', value: '30d' },
  { label: 'Last 90 days', value: '90d' },
  { label: 'All time', value: 'all' },
];

const PAGE_SIZES = [25, 50, 100];

function formatDate(iso: string) {
  if (!iso) return '—';
  const d = new Date(iso);
  return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric', hour: '2-digit', minute: '2-digit' });
}

function formatShortDate(iso: string) {
  if (!iso) return '—';
  const d = new Date(iso);
  return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: '2-digit' });
}

function formatTimeAgo(iso: string) {
  if (!iso) return '—';
  const diff = Date.now() - new Date(iso).getTime();
  const mins = Math.floor(diff / 60000);
  if (mins < 60) return `${mins}m ago`;
  const hrs = Math.floor(mins / 60);
  if (hrs < 24) return `${hrs}h ago`;
  const days = Math.floor(hrs / 24);
  return `${days}d ago`;
}

function getDateFrom(range: string): string {
  if (range === 'all') return '';
  const days = range === '7d' ? 7 : range === '30d' ? 30 : 90;
  const d = new Date();
  d.setDate(d.getDate() - days);
  return d.toISOString();
}

function formatCurrency(amount: number | null, currency: string | null): string {
  if (amount === null || amount === undefined) return '';
  const cur = (currency ?? 'usd').toUpperCase();
  return `$${(amount / 100).toFixed(0)} ${cur}`;
}

function isAbandonedCheckout(funnel: FunnelSummary | null): boolean {
  if (!funnel) return false;
  if (funnel.stage !== 'checkout_started') return false;
  if (funnel.payment_status === 'paid') return false;
  if (!funnel.last_event_at) return false;
  const age = Date.now() - new Date(funnel.last_event_at).getTime();
  return age > 24 * 60 * 60 * 1000;
}

function exportCSV(items: SubmissionSummary[], tab: TabKey) {
  const headers = [
    'Date', 'Type', 'Is Demo', 'State', 'Contact / Company', 'Email', 'Status', 'Preview',
    'Funnel Stage', 'Last Seen', 'Drop-off Stage', 'Drop-off Path',
    'Selected Offer', 'Selected Upsell', 'Payment Status', 'Amount', 'Checkout Session'
  ];
  const rows = items.map(i => [
    formatDate(i.created_at),
    KIND_LABELS[getDisplayType(i)] ?? i.kind,
    i.is_demo ? 'Yes' : 'No',
    i.state_slug || '—',
    i.primary_label ? i.primary_label.replace('||', ' / ') : '—',
    i.email || '—',
    i.status || '—',
    i.preview || '—',
    i.funnel?.stage || '—',
    i.funnel?.last_event_at ? formatDate(i.funnel.last_event_at) : '—',
    i.funnel?.dropoff_stage || '—',
    i.funnel?.dropoff_path || '—',
    i.funnel?.selected_offer || '—',
    i.funnel?.selected_upsell || '—',
    i.funnel?.payment_status || '—',
    i.funnel?.amount_total ? formatCurrency(i.funnel.amount_total, i.funnel.currency) : '—',
    i.funnel?.checkout_session_id || '—',
  ]);
  const csv = [headers, ...rows].map(r => r.map(v => `"${String(v).replace(/"/g, '""')}"`).join(',')).join('\n');
  const blob = new Blob([csv], { type: 'text/csv' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `submissions-${tab}-${new Date().toISOString().slice(0, 10)}.csv`;
  a.click();
  URL.revokeObjectURL(url);
}

async function bulkExportSelected(ids: string[]): Promise<void> {
  const result = await adminApiFetch<{ csv: string }>('wpadmin-bulk?action=export', {
    method: 'POST',
    body: { ids },
  });
  if (!result.ok) {
    throw new Error(result.error?.message ?? 'Export failed');
  }
  const csv = result.data?.csv ?? '';
  const blob = new Blob([csv], { type: 'text/csv' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `submissions-selected-${new Date().toISOString().slice(0, 10)}.csv`;
  a.click();
  URL.revokeObjectURL(url);
}

async function bulkDeleteSelected(ids: string[]): Promise<number> {
  const result = await adminApiFetch<{ deleted: number }>('wpadmin-bulk?action=delete', {
    method: 'POST',
    body: { ids },
  });
  if (!result.ok) {
    throw new Error(result.error?.message ?? 'Delete failed');
  }
  return result.data?.deleted ?? ids.length;
}

// ── DeleteConfirmModal ────────────────────────────────────────────────────────
function DeleteConfirmModal({
  count, onConfirm, onCancel, loading,
}: { count: number; onConfirm: () => void; onCancel: () => void; loading: boolean }) {
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm p-4">
      <div className="bg-white rounded-2xl shadow-2xl w-full max-w-sm p-6 space-y-5">
        <div className="flex items-start gap-4">
          <div className="w-10 h-10 rounded-full bg-red-100 flex items-center justify-center shrink-0">
            <Trash2 className="w-5 h-5 text-red-600" />
          </div>
          <div>
            <h2 className="text-base font-semibold text-gray-900">Delete {count} submission{count !== 1 ? 's' : ''}?</h2>
            <p className="mt-1 text-sm text-gray-500">
              Rows will be soft-deleted and hidden from all views. This action can be reversed by the database team if needed.
            </p>
          </div>
        </div>
        <div className="flex gap-3 justify-end">
          <button
            onClick={onCancel}
            disabled={loading}
            className="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 rounded-lg hover:bg-gray-200 disabled:opacity-50 transition-colors"
          >
            Cancel
          </button>
          <button
            onClick={onConfirm}
            disabled={loading}
            className="flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-lg hover:bg-red-700 disabled:opacity-50 transition-colors"
          >
            {loading ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Trash2 className="w-4 h-4" />}
            Delete
          </button>
        </div>
      </div>
    </div>
  );
}

// ── StageBadge ──────────────────────────────────────────────────────────────
function StageBadge({ stage, funnel }: { stage: string | null; funnel: FunnelSummary | null }) {
  if (!stage) return <span className="text-gray-300 text-xs">—</span>;
  const abandoned = isAbandonedCheckout(funnel);
  if (abandoned) {
    return (
      <span className="inline-flex items-center gap-1 text-xs font-semibold px-2 py-0.5 rounded-full bg-red-100 text-red-600">
        <AlertTriangle className="w-3 h-3" />
        Abandoned
      </span>
    );
  }
  const cfg = STAGE_CONFIG[stage] ?? { label: stage, color: 'bg-gray-100 text-gray-600' };
  return <span className={`text-xs font-semibold px-2 py-0.5 rounded-full ${cfg.color}`}>{cfg.label}</span>;
}

// ── PaymentBadge ─────────────────────────────────────────────────────────────
function PaymentBadge({ status, amount, currency }: { status: string | null; amount: number | null; currency: string | null }) {
  if (!status) return <span className="text-gray-300 text-xs">—</span>;
  const cfg = PAYMENT_CONFIG[status] ?? { label: status, color: 'bg-gray-100 text-gray-600' };
  return (
    <span className={`text-xs font-semibold px-2 py-0.5 rounded-full ${cfg.color}`}>
      {cfg.label}{amount ? ` · ${formatCurrency(amount, currency)}` : ''}
    </span>
  );
}

// ── TimelineItem ─────────────────────────────────────────────────────────────
function TimelineItem({ event }: { event: FunnelEvent }) {
  const eventColors: Record<string, string> = {
    page_view: 'bg-gray-400',
    offer_view: 'bg-blue-400',
    upsell_view: 'bg-purple-400',
    cta_click: 'bg-sky-400',
    form_submit: 'bg-emerald-500',
    checkout_start: 'bg-amber-500',
    payment_success: 'bg-emerald-600',
    payment_failed: 'bg-red-500',
    confirm_connection_submit: 'bg-rose-500',
  };
  const dot = eventColors[event.event_name] ?? 'bg-gray-300';

  return (
    <div className="flex gap-3 relative">
      <div className="flex flex-col items-center">
        <div className={`w-2.5 h-2.5 rounded-full mt-1 shrink-0 ${dot}`} />
        <div className="w-px flex-1 bg-gray-200 mt-1" />
      </div>
      <div className="pb-4 flex-1 min-w-0">
        <div className="flex items-center gap-2 flex-wrap">
          <span className="text-sm font-semibold text-gray-800">{event.event_name}</span>
          {event.event_stage && (
            <span className="text-xs px-1.5 py-0.5 rounded bg-gray-100 text-gray-500">{event.event_stage}</span>
          )}
          <span className="text-xs text-gray-400 ml-auto">{formatDate(event.created_at)}</span>
        </div>
        {event.page_path && (
          <p className="text-xs text-gray-500 mt-0.5 font-mono truncate">{event.page_path}</p>
        )}
        {event.metadata && Object.keys(event.metadata).filter(k => event.metadata[k] != null).length > 0 && (
          <details className="mt-1">
            <summary className="text-xs text-gray-400 cursor-pointer hover:text-gray-600">metadata</summary>
            <pre className="text-xs text-gray-500 mt-1 bg-gray-50 rounded p-2 overflow-x-auto">
              {JSON.stringify(event.metadata, null, 2)}
            </pre>
          </details>
        )}
      </div>
    </div>
  );
}

// ── DetailDrawer ─────────────────────────────────────────────────────────────
interface DetailDrawerProps {
  item: SubmissionSummary | null;
  onClose: () => void;
}

function DetailDrawer({ item, onClose }: DetailDrawerProps) {
  const [detailTab, setDetailTab] = useState<'overview' | 'funnel' | 'raw'>('overview');
  const [fullRow, setFullRow] = useState<Record<string, unknown> | null>(null);
  const [funnelSession, setFunnelSession] = useState<Record<string, unknown> | null>(null);
  const [timeline, setTimeline] = useState<FunnelEvent[]>([]);
  const [loading, setLoading] = useState(false);
  const [copied, setCopied] = useState(false);

  useEffect(() => {
    if (!item) return;
    setFullRow(null);
    setFunnelSession(null);
    setTimeline([]);
    setDetailTab('overview');
    setLoading(true);

    (async () => {
      const result = await adminApiFetch<{
        row?: Record<string, unknown>;
        funnel_session?: Record<string, unknown>;
        timeline?: FunnelEvent[];
      }>(`wpadmin-submissions/detail?kind=${item.kind}&id=${item.id}`);

      if (result.ok && result.data) {
        if (result.data.row) setFullRow(result.data.row);
        if (result.data.funnel_session) setFunnelSession(result.data.funnel_session);
        if (result.data.timeline) setTimeline(result.data.timeline);
      }
      setLoading(false);
    })();
  }, [item]);

  const handleCopy = (text: string) => {
    navigator.clipboard.writeText(text);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  if (!item) return null;

  const funnel = item.funnel;

  return (
    <div className="fixed inset-0 z-50 flex">
      <div className="flex-1 bg-black/40" onClick={onClose} />
      <div className="w-full max-w-2xl bg-white shadow-2xl flex flex-col h-full overflow-hidden">

        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b border-gray-200 bg-gray-50 shrink-0">
          <div className="flex items-center gap-3 min-w-0">
            {(() => {
              const dt = getDisplayType(item);
              return (
                <span className={`text-xs font-semibold px-2 py-0.5 rounded-full shrink-0 ${KIND_COLORS[dt] ?? 'bg-gray-100 text-gray-600'}`}>
                  {KIND_LABELS[dt] ?? dt}
                </span>
              );
            })()}

            <span className="text-sm font-semibold text-gray-700 truncate">{item.primary_label || item.id}</span>
          </div>
          <button onClick={onClose} className="p-1.5 hover:bg-gray-200 rounded-lg transition-colors shrink-0">
            <X className="w-4 h-4 text-gray-500" />
          </button>
        </div>

        {/* Funnel quick-stats */}
        {funnel && (
          <div className="grid grid-cols-3 gap-px bg-gray-100 border-b border-gray-200 shrink-0">
            <div className="bg-white px-4 py-3">
              <p className="text-xs text-gray-400 uppercase tracking-wide mb-1">Stage</p>
              <StageBadge stage={funnel.stage} funnel={funnel} />
            </div>
            <div className="bg-white px-4 py-3">
              <p className="text-xs text-gray-400 uppercase tracking-wide mb-1">Last Seen</p>
              <p className="text-xs font-medium text-gray-700">{funnel.last_event_at ? formatTimeAgo(funnel.last_event_at) : '—'}</p>
            </div>
            <div className="bg-white px-4 py-3">
              <p className="text-xs text-gray-400 uppercase tracking-wide mb-1">Payment</p>
              <PaymentBadge status={funnel.payment_status} amount={funnel.amount_total} currency={funnel.currency} />
            </div>
          </div>
        )}

        {/* Tabs */}
        <div className="flex border-b border-gray-200 shrink-0">
          {(['overview', 'funnel', 'raw'] as const).map(t => (
            <button
              key={t}
              onClick={() => setDetailTab(t)}
              className={`flex-1 px-4 py-2.5 text-sm font-medium transition-colors ${
                detailTab === t
                  ? 'border-b-2 border-slate-800 text-slate-800'
                  : 'text-gray-500 hover:text-gray-700'
              }`}
            >
              {t === 'overview' ? 'Submission' : t === 'funnel' ? `Timeline (${timeline.length})` : 'Raw JSON'}
            </button>
          ))}
        </div>

        {/* Body */}
        <div className="flex-1 overflow-y-auto">
          {loading ? (
            <div className="p-6 space-y-3">
              {Array.from({ length: 10 }).map((_, i) => (
                <div key={i} className="h-7 bg-gray-100 rounded animate-pulse" />
              ))}
            </div>
          ) : detailTab === 'overview' ? (
            <div className="p-6">
              {/* Quick copy actions */}
              <div className="flex gap-2 mb-5 flex-wrap">
                {item.email && (
                  <button
                    onClick={() => handleCopy(item.email)}
                    className="flex items-center gap-1.5 text-xs px-3 py-1.5 bg-gray-100 hover:bg-gray-200 rounded-lg transition-colors text-gray-700"
                  >
                    <Mail className="w-3.5 h-3.5" />
                    Copy email
                  </button>
                )}
                {item.state_slug && (
                  <div className="flex items-center gap-1.5 text-xs px-3 py-1.5 bg-gray-100 rounded-lg text-gray-600">
                    <MapPin className="w-3.5 h-3.5" />
                    {formatStateName(item.state_slug)}
                  </div>
                )}
                {funnel?.checkout_session_id && (
                  <button
                    onClick={() => handleCopy(funnel.checkout_session_id!)}
                    className="flex items-center gap-1.5 text-xs px-3 py-1.5 bg-gray-100 hover:bg-gray-200 rounded-lg transition-colors text-gray-600 font-mono"
                  >
                    <CreditCard className="w-3.5 h-3.5" />
                    Copy session ID
                  </button>
                )}
              </div>

              {/* Submission fields */}
              {fullRow ? (
                <div className="space-y-1">
                  {Object.entries(fullRow).map(([k, v]) => {
                    const display = v === null || v === undefined ? '—' : typeof v === 'object' ? JSON.stringify(v, null, 2) : String(v);
                    const isJson = typeof v === 'object' && v !== null;
                    return (
                      <div key={k} className="flex gap-3 py-2 border-b border-gray-100 last:border-0">
                        <dt className="text-xs font-semibold text-gray-400 uppercase tracking-wide w-36 shrink-0 pt-0.5">{k.replace(/_/g, ' ')}</dt>
                        <dd className={`text-sm text-gray-800 break-all flex-1 ${isJson ? 'font-mono text-xs' : ''}`}>
                          {isJson ? (
                            <details>
                              <summary className="cursor-pointer text-gray-500 hover:text-gray-700">{Array.isArray(v) ? `[${(v as unknown[]).length} items]` : '{object}'}</summary>
                              <pre className="mt-1 text-xs bg-gray-50 rounded p-2 overflow-x-auto">{display}</pre>
                            </details>
                          ) : display || '—'}
                        </dd>
                      </div>
                    );
                  })}
                </div>
              ) : (
                <p className="text-sm text-gray-400 text-center py-8">No submission data.</p>
              )}

              {/* Funnel session summary */}
              {funnelSession && (
                <div className="mt-6 pt-6 border-t border-gray-200">
                  <h3 className="text-xs font-semibold text-gray-400 uppercase tracking-wide mb-3 flex items-center gap-2">
                    <TrendingUp className="w-4 h-4" />
                    Funnel Session
                  </h3>
                  <div className="space-y-1">
                    {['stage','selected_offer','selected_upsell','payment_status','amount_total','currency','dropoff_stage','dropoff_path','checkout_session_id'].map(k => {
                      const val = (funnelSession as Record<string, unknown>)[k];
                      if (val === null || val === undefined) return null;
                      return (
                        <div key={k} className="flex gap-3 py-1.5">
                          <dt className="text-xs text-gray-400 w-36 shrink-0">{k.replace(/_/g, ' ')}</dt>
                          <dd className="text-xs text-gray-700 break-all">{String(val)}</dd>
                        </div>
                      );
                    })}
                  </div>
                </div>
              )}
            </div>
          ) : detailTab === 'funnel' ? (
            <div className="p-6">
              {timeline.length === 0 ? (
                <div className="text-center py-12">
                  <Clock className="w-8 h-8 text-gray-300 mx-auto mb-2" />
                  <p className="text-sm text-gray-400">No funnel events tracked yet.</p>
                  <p className="text-xs text-gray-400 mt-1">Events are tracked as leads move through the funnel.</p>
                </div>
              ) : (
                <div>
                  <p className="text-xs text-gray-400 mb-4">{timeline.length} event{timeline.length !== 1 ? 's' : ''} · oldest first</p>
                  {timeline.map(ev => <TimelineItem key={ev.id} event={ev} />)}
                </div>
              )}
            </div>
          ) : (
            <div className="p-6">
              <div className="relative">
                <button
                  onClick={() => handleCopy(JSON.stringify({ row: fullRow, funnel_session: funnelSession, timeline }, null, 2))}
                  className="absolute top-3 right-3 flex items-center gap-1.5 text-xs px-2.5 py-1.5 bg-gray-700 text-gray-200 hover:bg-gray-600 rounded-md transition-colors"
                >
                  {copied ? <Check className="w-3.5 h-3.5" /> : <Copy className="w-3.5 h-3.5" />}
                  {copied ? 'Copied' : 'Copy all'}
                </button>
                <pre className="bg-gray-900 text-gray-100 rounded-xl p-4 text-xs overflow-x-auto leading-relaxed">
                  {JSON.stringify({ row: fullRow, funnel_session: funnelSession, timeline }, null, 2)}
                </pre>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

type DataState = 'idle' | 'waiting_session' | 'loading' | 'success' | 'error';

// ── Main Page ─────────────────────────────────────────────────────────────────
export default function WpAdminSubmissionsPage() {
  const { isReady, isValid } = useAdminSession();

  const [activeTab, setActiveTab] = useState<TabKey>('all');
  const [items, setItems] = useState<SubmissionSummary[]>([]);
  const [counts, setCounts] = useState<Counts | null>(null);
  const [meta, setMeta] = useState<Meta | null>(null);
  const [dataState, setDataState] = useState<DataState>('idle');
  const [apiError, setApiError] = useState<AdminApiError | null>(null);
  const [q, setQ] = useState('');
  const [stateFilter, setStateFilter] = useState('');
  const [dateRange, setDateRange] = useState('30d');
  const [showDemo, setShowDemo] = useState(false);
  const [pageSize, setPageSize] = useState(50);
  const [offset, setOffset] = useState(0);
  const [selectedItem, setSelectedItem] = useState<SubmissionSummary | null>(null);
  const [showStateDropdown, setShowStateDropdown] = useState(false);
  const [notifiedIds, setNotifiedIds] = useState<Set<string>>(new Set());
  const [resendingId, setResendingId] = useState<string | null>(null);
  const searchTimeout = useRef<ReturnType<typeof setTimeout> | null>(null);
  const fetchIdRef = useRef(0);

  // ── Selection state ────────────────────────────────────────────────────────
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set());
  const [showBulkMenu, setShowBulkMenu] = useState(false);
  const [showDeleteModal, setShowDeleteModal] = useState(false);
  const [bulkLoading, setBulkLoading] = useState(false);
  const [bulkError, setBulkError] = useState('');
  const bulkMenuRef = useRef<HTMLDivElement | null>(null);

  const fetchData = useCallback(async (tab: TabKey, qVal: string, stateVal: string, dateVal: string, limit: number, off: number, demoVal: boolean = false) => {
    if (!isReady) {
      setDataState('waiting_session');
      return;
    }
    if (!isValid) {
      setDataState('error');
      setApiError({
        code: 'no_session',
        message: 'No valid admin session. Please log in.',
        retryable: false,
      });
      return;
    }

    const currentFetchId = ++fetchIdRef.current;
    setDataState('loading');
    setApiError(null);

    const from = getDateFrom(dateVal);
    const params = new URLSearchParams({
      type: tab,
      limit: String(limit),
      offset: String(off),
    });
    if (qVal) params.set('q', qVal);
    if (stateVal) params.set('state', stateVal);
    if (from) params.set('from', from);
    if (tab === 'agency_availability_requests') {
      params.set('demo', demoVal ? '1' : '0');
    }
    if (tab === 'demo_availability') {
      params.set('type', 'demo_availability');
    }

    const result = await adminApiFetch<{
      items: SubmissionSummary[];
      counts: Counts;
      meta: Meta;
    }>(`wpadmin-submissions?${params}`);

    if (currentFetchId !== fetchIdRef.current) return;

    if (!result.ok) {
      setDataState('error');
      setApiError(result.error ?? null);
      return;
    }

    setItems(result.data?.items ?? []);
    setCounts(result.data?.counts ?? null);
    setMeta(result.data?.meta ?? null);
    setDataState('success');
  }, [isReady, isValid]);

  const fetchNotifiedIds = useCallback(async () => {
    if (!isReady || !isValid) return;
    const result = await adminApiFetch<{ logs: Array<{ status: string; row_id: string }> }>(
      'notification-settings-api/logs?limit=500'
    );
    if (result.ok && result.data?.logs) {
      const ids = new Set<string>(
        result.data.logs
          .filter((l) => l.status === 'sent')
          .map((l) => l.row_id)
      );
      setNotifiedIds(ids);
    }
  }, [isReady, isValid]);

  const handleResendNotification = useCallback(async (item: SubmissionSummary) => {
    if (!isReady || !isValid) return;
    setResendingId(item.id);
    await adminApiFetch('notification-settings-api/resend', {
      method: 'POST',
      body: { log_id: '', form_type: item.kind, row_id: item.id },
    });
    await fetchNotifiedIds();
    setResendingId(null);
  }, [isReady, isValid, fetchNotifiedIds]);

  useEffect(() => {
    if (!isReady) {
      setDataState('waiting_session');
      return;
    }
    fetchData(activeTab, q, stateFilter, dateRange, pageSize, offset, showDemo);
  }, [activeTab, stateFilter, dateRange, pageSize, offset, showDemo, fetchData, isReady]);

  useEffect(() => {
    if (isReady && isValid) {
      fetchNotifiedIds();
    }
  }, [fetchNotifiedIds, isReady, isValid]);

  const handleSearch = (val: string) => {
    setQ(val);
    if (searchTimeout.current) clearTimeout(searchTimeout.current);
    searchTimeout.current = setTimeout(() => {
      setOffset(0);
      fetchData(activeTab, val, stateFilter, dateRange, pageSize, 0, showDemo);
    }, 400);
  };

  const handleTabChange = (tab: TabKey) => {
    setActiveTab(tab);
    setOffset(0);
    setSelectedIds(new Set());
    setBulkError('');
  };

  // ── Selection helpers ──────────────────────────────────────────────────────
  const pageUnifiedIds = items.map(i => i.unified_id).filter(Boolean);
  const allPageSelected = pageUnifiedIds.length > 0 && pageUnifiedIds.every(uid => selectedIds.has(uid));
  const somePageSelected = pageUnifiedIds.some(uid => selectedIds.has(uid));

  const toggleSelectAll = () => {
    if (allPageSelected) {
      setSelectedIds(prev => {
        const next = new Set(prev);
        pageUnifiedIds.forEach(uid => next.delete(uid));
        return next;
      });
    } else {
      setSelectedIds(prev => {
        const next = new Set(prev);
        pageUnifiedIds.forEach(uid => next.add(uid));
        return next;
      });
    }
  };

  const toggleSelectRow = (uid: string) => {
    setSelectedIds(prev => {
      const next = new Set(prev);
      if (next.has(uid)) next.delete(uid);
      else next.add(uid);
      return next;
    });
  };

  // Close bulk menu on outside click
  useEffect(() => {
    if (!showBulkMenu) return;
    const handler = (e: MouseEvent) => {
      if (bulkMenuRef.current && !bulkMenuRef.current.contains(e.target as Node)) {
        setShowBulkMenu(false);
      }
    };
    document.addEventListener('mousedown', handler);
    return () => document.removeEventListener('mousedown', handler);
  }, [showBulkMenu]);

  const handleBulkExport = async () => {
    setShowBulkMenu(false);
    setBulkError('');
    setBulkLoading(true);
    try {
      await bulkExportSelected(Array.from(selectedIds));
    } catch (e) {
      setBulkError(e instanceof Error ? e.message : 'Export failed');
    } finally {
      setBulkLoading(false);
    }
  };

  const handleBulkDeleteConfirm = async () => {
    setBulkError('');
    setBulkLoading(true);
    try {
      const ids = Array.from(selectedIds);
      await bulkDeleteSelected(ids);
      setItems(prev => prev.filter(i => !selectedIds.has(i.unified_id)));
      setSelectedIds(new Set());
      setShowDeleteModal(false);
      fetchData(activeTab, q, stateFilter, dateRange, pageSize, offset, showDemo);
    } catch (e) {
      setBulkError(e instanceof Error ? e.message : 'Delete failed');
      setShowDeleteModal(false);
    } finally {
      setBulkLoading(false);
    }
  };

  const isLoading = dataState === 'loading' || dataState === 'waiting_session';
  const hasData = dataState === 'success' && counts !== null;

  const totalCount = hasData
    ? (counts.matched_leads ?? 0) + (counts.spotlight_applications ?? 0) + (counts.top25_applications ?? 0) + (counts.agency_availability_requests ?? 0) + (counts.owner_demo_events ?? 0) + (counts.your_agency_profile_clicks ?? 0) + (counts.manage_funnel_events ?? 0)
    : null;

  const statCards = TAB_CONFIG.filter(t => t.key !== 'all').map(t => ({
    ...t,
    count: hasData ? (counts[t.key as keyof Counts] ?? 0) : null,
  }));

  return (
    <WpAdminLayout title="Submissions Center" subtitle="All form submissions + funnel tracking across 52 state pages">
      <div className="space-y-4">
        {/* Error Banner */}
        {apiError && (
          <AdminErrorBanner
            error={apiError}
            onRetry={() => fetchData(activeTab, q, stateFilter, dateRange, pageSize, offset, showDemo)}
            onLogin={() => { window.location.href = '/wp-admin'; }}
          />
        )}

        {/* Header stats card */}
        <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="px-6 py-4 flex items-center justify-between border-b border-slate-100">
            <div className="flex items-center gap-3">
              <p className="text-2xl font-bold text-slate-900">
                {totalCount !== null ? totalCount.toLocaleString() : '---'}
              </p>
              <p className="text-slate-400 text-sm">total submissions</p>
            </div>
            <button
              onClick={() => fetchData(activeTab, q, stateFilter, dateRange, pageSize, offset)}
              disabled={isLoading}
              className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-lg transition-colors disabled:opacity-50"
              title="Refresh"
            >
              <RefreshCw className={`w-4 h-4 ${isLoading ? 'animate-spin' : ''}`} />
            </button>
          </div>

          {/* Stat cards */}
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 divide-x divide-y lg:divide-y-0 border-b border-gray-100">
            {statCards.map(card => (
              <button
                key={card.key}
                onClick={() => handleTabChange(card.key)}
                className={`flex flex-col items-center gap-1 py-3 px-2 transition-colors hover:bg-slate-50 min-w-0 ${activeTab === card.key ? 'bg-slate-50' : ''}`}
              >
                <div className={`${card.color} text-white p-1 rounded-md shrink-0`} style={{ lineHeight: 0 }}>
                  <span className="block [&>svg]:w-3.5 [&>svg]:h-3.5">{card.icon}</span>
                </div>
                <span className="text-lg font-bold text-gray-900 leading-none">
                  {card.count !== null ? card.count.toLocaleString() : '---'}
                </span>
                <span className="text-[11px] text-gray-500 text-center leading-tight truncate w-full px-1" title={card.label}>{card.label}</span>
              </button>
            ))}
          </div>
        </div>

        {/* Tabs */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 mb-4 overflow-x-auto">
          <div className="flex min-w-max">
            {TAB_CONFIG.map(tab => (
              <button
                key={tab.key}
                onClick={() => handleTabChange(tab.key)}
                className={`flex items-center gap-2 px-4 py-3 text-sm font-medium border-b-2 transition-colors whitespace-nowrap ${
                  activeTab === tab.key
                    ? 'border-slate-800 text-slate-800'
                    : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
                }`}
              >
                {tab.icon}
                {tab.label}
                {tab.key !== 'all' && (
                  <span className={`text-xs px-1.5 py-0.5 rounded-full font-semibold ${
                    activeTab === tab.key ? 'bg-slate-800 text-white' : 'bg-gray-100 text-gray-600'
                  }`}>
                    {hasData ? (counts[tab.key as keyof Counts] ?? 0).toLocaleString() : '---'}
                  </span>
                )}
              </button>
            ))}
          </div>
        </div>

        {/* Filter bar */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4 mb-4 flex flex-wrap items-center gap-3">
          <div className="relative flex-1 min-w-48">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
            <input
              type="text"
              value={q}
              onChange={e => handleSearch(e.target.value)}
              placeholder="Search email, company, agency..."
              className="w-full pl-9 pr-4 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-slate-300"
            />
          </div>

          <div className="relative">
            <button
              onClick={() => setShowStateDropdown(v => !v)}
              className="flex items-center gap-2 px-3 py-2 text-sm border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors"
            >
              <Filter className="w-4 h-4 text-gray-400" />
              {stateFilter || 'All states'}
              <ChevronDown className="w-3.5 h-3.5 text-gray-400" />
            </button>
            {showStateDropdown && (
              <div className="absolute top-full mt-1 left-0 z-10 bg-white border border-gray-200 rounded-lg shadow-lg py-1 min-w-44">
                <button
                  onClick={() => { setStateFilter(''); setShowStateDropdown(false); setOffset(0); }}
                  className="w-full text-left px-4 py-2 text-sm hover:bg-gray-50 text-gray-700"
                >
                  All states
                </button>
                <div className="px-3 py-2">
                  <input
                    type="text"
                    placeholder="Type slug (e.g. new-jersey)..."
                    className="w-full text-sm border border-gray-200 rounded px-2 py-1 focus:outline-none focus:ring-1 focus:ring-slate-300"
                    onKeyDown={e => {
                      if (e.key === 'Enter') {
                        setStateFilter((e.target as HTMLInputElement).value);
                        setShowStateDropdown(false);
                        setOffset(0);
                      }
                    }}
                  />
                </div>
              </div>
            )}
          </div>

          <select
            value={dateRange}
            onChange={e => { setDateRange(e.target.value); setOffset(0); }}
            className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-slate-300 bg-white"
          >
            {DATE_FILTERS.map(f => (
              <option key={f.value} value={f.value}>{f.label}</option>
            ))}
          </select>

          <select
            value={pageSize}
            onChange={e => { setPageSize(Number(e.target.value)); setOffset(0); }}
            className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-slate-300 bg-white"
          >
            {PAGE_SIZES.map(s => (
              <option key={s} value={s}>{s} per page</option>
            ))}
          </select>

          {activeTab === 'agency_availability_requests' && (
            <label className="flex items-center gap-2 px-3 py-2 text-sm border border-orange-200 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors cursor-pointer">
              <input
                type="checkbox"
                checked={showDemo}
                onChange={e => { setShowDemo(e.target.checked); setOffset(0); }}
                className="w-4 h-4 rounded border-orange-300 text-orange-600"
              />
              <span className="text-orange-800 font-medium">Demo Only</span>
            </label>
          )}

          {/* Export all-page CSV */}
          <button
            onClick={() => exportCSV(items, activeTab)}
            disabled={items.length === 0}
            className="flex items-center gap-2 px-3 py-2 text-sm bg-slate-800 text-white rounded-lg hover:bg-slate-700 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
          >
            <Download className="w-4 h-4" />
            Export All
          </button>

          {/* Bulk actions */}
          <div className="relative" ref={bulkMenuRef}>
            <button
              onClick={() => setShowBulkMenu(v => !v)}
              disabled={selectedIds.size === 0 || bulkLoading}
              className={`flex items-center gap-2 px-3 py-2 text-sm font-medium rounded-lg border transition-colors ${
                selectedIds.size > 0
                  ? 'border-slate-700 bg-slate-700 text-white hover:bg-slate-600'
                  : 'border-gray-200 bg-white text-gray-400 cursor-not-allowed'
              }`}
            >
              {bulkLoading
                ? <RefreshCw className="w-4 h-4 animate-spin" />
                : <CheckSquare className="w-4 h-4" />}
              {selectedIds.size > 0 ? `${selectedIds.size} selected` : 'Bulk actions'}
              {selectedIds.size > 0 && (showBulkMenu ? <ChevronUp className="w-3.5 h-3.5" /> : <ChevronDown className="w-3.5 h-3.5" />)}
            </button>

            {showBulkMenu && selectedIds.size > 0 && (
              <div className="absolute right-0 top-full mt-1 z-20 bg-white border border-gray-200 rounded-xl shadow-xl py-1.5 min-w-48">
                <button
                  onClick={handleBulkExport}
                  className="w-full flex items-center gap-3 px-4 py-2.5 text-sm text-gray-700 hover:bg-gray-50 transition-colors"
                >
                  <FileDown className="w-4 h-4 text-gray-400" />
                  Export selected ({selectedIds.size})
                </button>
                <button
                  onClick={() => { setShowBulkMenu(false); setShowDeleteModal(true); }}
                  className="w-full flex items-center gap-3 px-4 py-2.5 text-sm text-red-600 hover:bg-red-50 transition-colors"
                >
                  <Trash2 className="w-4 h-4" />
                  Delete selected ({selectedIds.size})
                </button>
                <div className="border-t border-gray-100 mt-1 pt-1">
                  <button
                    onClick={() => { setSelectedIds(new Set()); setShowBulkMenu(false); }}
                    className="w-full flex items-center gap-3 px-4 py-2.5 text-sm text-gray-500 hover:bg-gray-50 transition-colors"
                  >
                    <X className="w-4 h-4" />
                    Clear selection
                  </button>
                </div>
              </div>
            )}
          </div>
        </div>

        {/* Bulk error */}
        {bulkError && (
          <div className="bg-red-50 border border-red-200 rounded-lg px-4 py-2.5 mb-3 flex items-center justify-between">
            <p className="text-sm text-red-700">{bulkError}</p>
            <button onClick={() => setBulkError('')}><X className="w-4 h-4 text-red-400 hover:text-red-600" /></button>
          </div>
        )}

        {/* Table */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="px-4 py-3 w-8">
                    <input
                      type="checkbox"
                      checked={allPageSelected}
                      ref={el => { if (el) el.indeterminate = somePageSelected && !allPageSelected; }}
                      onChange={toggleSelectAll}
                      className="rounded border-gray-300 text-blue-600 cursor-pointer"
                    />
                  </th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Date</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Type</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">State</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Contact / Company</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Email</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Funnel Stage</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Last Seen</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Drop-off</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Payment</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Offer</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-gray-500 uppercase tracking-wide whitespace-nowrap">Notified</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {isLoading ? (
                  Array.from({ length: 8 }).map((_, i) => (
                    <tr key={i}>
                      {Array.from({ length: 12 }).map((__, j) => (
                        <td key={j} className="px-4 py-3">
                          <div className="h-4 bg-gray-100 rounded animate-pulse" style={{ width: `${50 + (i + j) % 5 * 8}%` }} />
                        </td>
                      ))}
                    </tr>
                  ))
                ) : dataState === 'error' ? (
                  <tr>
                    <td colSpan={12} className="px-6 py-16 text-center text-gray-400">
                      <AlertTriangle className="w-10 h-10 mx-auto mb-3 text-amber-400" />
                      <p className="font-medium text-gray-500">Unable to load submissions</p>
                      <p className="text-xs mt-1">Check the error above and try again</p>
                    </td>
                  </tr>
                ) : hasData && items.length === 0 ? (
                  <tr>
                    <td colSpan={12} className="px-6 py-16 text-center text-gray-400">
                      <Inbox className="w-10 h-10 mx-auto mb-3 text-gray-300" />
                      <p className="font-medium text-gray-500">No submissions found</p>
                      <p className="text-xs mt-1">Try adjusting your filters or date range</p>
                    </td>
                  </tr>
                ) : (
                  items.map(item => {
                    const funnel = item.funnel;
                    const abandoned = isAbandonedCheckout(funnel);
                    return (
                      <tr
                        key={`${item.kind}-${item.id}`}
                        onClick={() => setSelectedItem(item)}
                        className={`hover:bg-slate-50 cursor-pointer transition-colors ${abandoned ? 'bg-red-50/30' : ''} ${selectedIds.has(item.unified_id) ? 'bg-blue-50/40' : ''}`}
                      >
                        <td className="px-4 py-3 w-8" onClick={e => e.stopPropagation()}>
                          <input
                            type="checkbox"
                            checked={selectedIds.has(item.unified_id)}
                            onChange={() => toggleSelectRow(item.unified_id)}
                            className="rounded border-gray-300 text-blue-600 cursor-pointer"
                          />
                        </td>
                        <td className="px-4 py-3 text-gray-500 whitespace-nowrap text-xs">{formatShortDate(item.created_at)}</td>
                        <td className="px-4 py-3 whitespace-nowrap">
                          {(() => {
                            const dt = getDisplayType(item);
                            return (
                              <span className={`text-xs font-semibold px-2 py-0.5 rounded-full ${KIND_COLORS[dt] ?? 'bg-gray-100 text-gray-600'}`}>
                                {KIND_LABELS[dt] ?? dt}
                              </span>
                            );
                          })()}
                        </td>
                        <td className="px-4 py-3 text-gray-600 text-xs font-mono whitespace-nowrap">{item.state_slug || '—'}</td>
                        <td className="px-4 py-3 max-w-[160px]">
                          {item.primary_label ? (() => {
                            const parts = item.primary_label.split('||');
                            if (parts.length === 2) {
                              return (
                                <div className="min-w-0">
                                  <p className="text-gray-800 font-semibold text-xs truncate">{parts[0]}</p>
                                  <p className="text-gray-400 text-xs truncate">{parts[1]}</p>
                                </div>
                              );
                            }
                            return <span className="text-gray-800 font-medium text-xs truncate block">{item.primary_label}</span>;
                          })() : <span className="text-gray-300 text-xs">—</span>}
                        </td>
                        <td className="px-4 py-3 text-gray-600 max-w-[160px] truncate text-xs">{item.email || '—'}</td>
                        <td className="px-4 py-3 whitespace-nowrap">
                          <StageBadge stage={funnel?.stage ?? null} funnel={funnel} />
                        </td>
                        <td className="px-4 py-3 text-gray-500 text-xs whitespace-nowrap">
                          {funnel?.last_event_at ? (
                            <span className="flex items-center gap-1">
                              <Clock className="w-3 h-3" />
                              {formatTimeAgo(funnel.last_event_at)}
                            </span>
                          ) : '—'}
                        </td>
                        <td className="px-4 py-3 max-w-[140px]">
                          {funnel?.dropoff_path ? (
                            <span className="text-xs text-gray-500 font-mono truncate block" title={funnel.dropoff_path}>
                              {funnel.dropoff_path}
                            </span>
                          ) : funnel?.dropoff_stage ? (
                            <span className="text-xs text-gray-400">{funnel.dropoff_stage}</span>
                          ) : (
                            <span className="text-gray-300 text-xs">—</span>
                          )}
                        </td>
                        <td className="px-4 py-3 whitespace-nowrap">
                          <PaymentBadge status={funnel?.payment_status ?? null} amount={funnel?.amount_total ?? null} currency={funnel?.currency ?? null} />
                        </td>
                        <td className="px-4 py-3 max-w-[120px]">
                          {funnel?.selected_offer ? (
                            <span className="text-xs text-gray-600 truncate block">{funnel.selected_offer}</span>
                          ) : (
                            <span className="text-gray-300 text-xs">—</span>
                          )}
                        </td>
                        <td className="px-4 py-3 whitespace-nowrap" onClick={e => e.stopPropagation()}>
                          <div className="flex items-center gap-1.5 flex-wrap">
                            {notifiedIds.has(item.id) ? (
                              <span className="inline-flex items-center gap-1 text-xs font-semibold px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-700">
                                <BellRing className="w-3 h-3" />Sent
                              </span>
                            ) : (
                              <button
                                onClick={() => handleResendNotification(item)}
                                disabled={resendingId === item.id}
                                className="inline-flex items-center gap-1 text-xs font-medium px-2 py-0.5 rounded-full border border-gray-200 text-gray-500 hover:border-blue-300 hover:text-blue-600 hover:bg-blue-50 transition-colors disabled:opacity-50"
                              >
                                {resendingId === item.id
                                  ? <RefreshCw className="w-3 h-3 animate-spin" />
                                  : <Send className="w-3 h-3" />}
                                Notify
                              </button>
                            )}
                            {item.kind === 'agency_availability_requests' && item.target_agency_id && (
                              <Link
                                to={`/wp-admin/availability-analytics/agency/${item.target_agency_id}`}
                                className="inline-flex items-center gap-1 text-xs font-medium px-2 py-0.5 rounded-full border border-gray-200 text-gray-500 hover:border-blue-300 hover:text-blue-600 hover:bg-blue-50 transition-colors"
                              >
                                <BarChart2 className="w-3 h-3" />
                                Stats
                              </Link>
                            )}
                          </div>
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>

          {/* Pagination */}
          {!isLoading && hasData && items.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 flex items-center justify-between bg-gray-50">
              <p className="text-xs text-gray-500">
                Showing {offset + 1}–{offset + items.length}
                {meta?.has_more ? '+' : ''}
              </p>
              <div className="flex items-center gap-2">
                <button
                  onClick={() => setOffset(Math.max(0, offset - pageSize))}
                  disabled={offset === 0}
                  className="p-1.5 rounded-lg hover:bg-gray-200 disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                >
                  <ChevronLeft className="w-4 h-4 text-gray-600" />
                </button>
                <span className="text-xs text-gray-500 px-2">Page {Math.floor(offset / pageSize) + 1}</span>
                <button
                  onClick={() => setOffset(offset + pageSize)}
                  disabled={!meta?.has_more}
                  className="p-1.5 rounded-lg hover:bg-gray-200 disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                >
                  <ChevronRight className="w-4 h-4 text-gray-600" />
                </button>
              </div>
            </div>
          )}
        </div>

      </div>

      <DetailDrawer item={selectedItem} onClose={() => setSelectedItem(null)} />

      {showDeleteModal && (
        <DeleteConfirmModal
          count={selectedIds.size}
          loading={bulkLoading}
          onConfirm={handleBulkDeleteConfirm}
          onCancel={() => setShowDeleteModal(false)}
        />
      )}
    </WpAdminLayout>
  );
}

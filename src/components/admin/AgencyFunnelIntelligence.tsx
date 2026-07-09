import { useState, useEffect, useCallback, useRef } from 'react';
import {
  Activity, BarChart2, RefreshCw, Loader2, AlertCircle, ExternalLink,
  CheckCircle2, CreditCard, Tag, MousePointerClick, Eye, ChevronDown, ChevronUp, Zap,
  MapPin, Monitor,
} from 'lucide-react';
import { useAdminSession } from '../../contexts/AdminSessionContext';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

// ── Types ─────────────────────────────────────────────────────────────────────

interface Summary {
  total_sessions: number;
  sessions_30d: number;
  has_checkout: boolean;
  is_paid: boolean;
  revenue: number;
  last_seen: string | null;
  max_step: number;
}

interface SalesSignals {
  last_source: string | null;
  last_funnel: string | null;
  last_stage: string | null;
  last_step: string | null;
  max_depth: number;
  activation_viewed: boolean;
  activation_option_selected: boolean;
  activation_option_name: string | null;
  activation_option_price: number | null;
  activation_option_type: string | null;
  // 2-phase activation signals
  activation_phase1_standard_clicked: boolean;
  activation_top25_options_viewed: boolean;
  activation_final_option_selected: boolean;
  activation_final_option_name: string | null;
  activation_final_option_price: number | null;
  activation_final_rank: number | null;
  checkout_seen: boolean;
  discount_opened: boolean;
  discount_percent: number | null;
  paid: boolean;
  drop_off: string;
  revenue: number | null;
}

interface FunnelProgress {
  funnel: string;
  last_seen: string | null;
  max_step: string | null;
  sessions: number;
  status: string;
  details: Record<string, unknown>;
}

type TimelineBadge = 'viewed' | 'clicked' | 'selected' | 'checkout' | 'paid' | 'discount' | 'dropped' | 'manage';

interface TimelineEvent {
  id: string;
  ts: string;
  funnel: string;
  step: string;
  details: string | null;
  source: string;
  badge: TimelineBadge;
  raw_event?: string;
  ip_address?: string | null;
  user_agent?: string | null;
  country?: string | null;
  city?: string | null;
  region?: string | null;
}

interface IntelligenceData {
  ok: boolean;
  summary: Summary;
  sales_signals: SalesSignals;
  funnel_progress: FunnelProgress[];
  journey_timeline: TimelineEvent[];
  activation_option_events: Record<string, unknown>[];
  discount_events: Record<string, unknown>[];
  checkout_events: Record<string, unknown>[];
}

// ── Helpers ───────────────────────────────────────────────────────────────────

function relativeTime(dateStr: string): string {
  const diff = Date.now() - new Date(dateStr).getTime();
  const mins = Math.floor(diff / 60000);
  if (mins < 2) return 'just now';
  if (mins < 60) return `${mins}m ago`;
  const hours = Math.floor(mins / 60);
  if (hours < 24) return `${hours}h ago`;
  const days = Math.floor(hours / 24);
  if (days === 1) return 'yesterday';
  if (days < 7) return `${days}d ago`;
  if (days < 30) return `${Math.floor(days / 7)}w ago`;
  return `${Math.floor(days / 30)}mo ago`;
}

function absTime(dateStr: string): string {
  const d = new Date(dateStr);
  return d.toLocaleString('en-US', { month: 'short', day: 'numeric', hour: 'numeric', minute: '2-digit', hour12: true });
}

// ── IP / Location helpers ─────────────────────────────────────────────────────

function maskIp(ip: string): string {
  // IPv6: show first 2 groups, mask the rest
  if (ip.includes(':')) {
    const parts = ip.split(':');
    return `${parts[0]}:${parts[1]}:xxxx:xxxx`;
  }
  // IPv4: show first 2 octets + last octet, mask third
  const parts = ip.split('.');
  if (parts.length === 4) {
    return `${parts[0]}.${parts[1]}.xxx.${parts[3]}`;
  }
  return ip;
}

function deviceFromUA(ua: string | null | undefined): string | null {
  if (!ua) return null;
  const u = ua.toLowerCase();
  const browser =
    u.includes('edg/') ? 'Edge' :
    u.includes('chrome') && !u.includes('chromium') ? 'Chrome' :
    u.includes('firefox') ? 'Firefox' :
    u.includes('safari') && !u.includes('chrome') ? 'Safari' :
    u.includes('opera') || u.includes('opr/') ? 'Opera' :
    'Browser';
  const device =
    u.includes('mobile') || u.includes('android') || u.includes('iphone') ? 'Mobile' :
    u.includes('tablet') || u.includes('ipad') ? 'Tablet' :
    'Desktop';
  return `${browser} / ${device}`;
}

function formatLocation(ev: TimelineEvent): string {
  const parts: string[] = [];
  if (ev.city || ev.region || ev.country) {
    const loc = [ev.city, ev.region, ev.country].filter(Boolean).join(', ');
    parts.push(loc);
  } else {
    parts.push('Unknown location');
  }
  return parts.join('');
}

// Returns true ONLY when admin IP is known AND exactly matches the event IP.
// No UA-based guessing — if adminIp is unknown, badge is never shown.
function isProbablyAdminSelf(
  ev: TimelineEvent,
  adminIp: string | null,
): boolean {
  if (!adminIp || !ev.ip_address) return false;
  return ev.ip_address === adminIp;
}

// ── Sub-components ────────────────────────────────────────────────────────────

function KpiTile({ label, value, variant = 'default' }: {
  label: string; value: string; variant?: 'default' | 'success' | 'warning';
}) {
  const bg = variant === 'success' ? 'bg-emerald-50 border-emerald-200'
    : variant === 'warning' ? 'bg-amber-50 border-amber-200'
    : 'bg-slate-50 border-slate-200';
  const val = variant === 'success' ? 'text-emerald-700'
    : variant === 'warning' ? 'text-amber-700'
    : 'text-slate-800';
  return (
    <div className={`rounded-xl border ${bg} flex flex-col items-center justify-center px-2 py-3 min-w-0`}>
      <span className="text-[9px] font-semibold text-slate-400 uppercase tracking-widest mb-1.5 whitespace-nowrap">{label}</span>
      <span className={`text-lg font-bold leading-none ${val} whitespace-nowrap`}>{value}</span>
    </div>
  );
}

function SigRow({ label, value, yes, no, highlight }: {
  label: string; value?: string; yes?: boolean; no?: boolean; highlight?: boolean;
}) {
  return (
    <div className="flex items-start justify-between gap-3 py-1.5 border-b border-slate-50 last:border-0">
      <span className="text-xs text-slate-400 shrink-0 pt-px">{label}</span>
      {yes !== undefined ? (
        <span className={`text-[11px] font-semibold px-2 py-0.5 rounded border ${
          yes ? 'bg-emerald-50 text-emerald-700 border-emerald-200' : 'bg-slate-50 text-slate-500 border-slate-200'
        }`}>
          {yes ? 'Yes' : 'No'}
        </span>
      ) : (
        <span className={`text-xs font-medium text-right min-w-0 break-words max-w-[60%] ${
          highlight ? 'text-amber-700 font-semibold' : 'text-slate-700'
        }`}>{value ?? '—'}</span>
      )}
    </div>
  );
}

const BADGE_CONFIG: Record<TimelineBadge, { label: string; cls: string; icon: React.ReactNode }> = {
  viewed:   { label: 'Viewed',   cls: 'bg-blue-50 text-blue-700 border-blue-200',       icon: <Eye className="w-2.5 h-2.5" /> },
  clicked:  { label: 'Clicked',  cls: 'bg-slate-50 text-slate-600 border-slate-200',    icon: <MousePointerClick className="w-2.5 h-2.5" /> },
  selected: { label: 'Selected', cls: 'bg-orange-50 text-orange-700 border-orange-200', icon: <Zap className="w-2.5 h-2.5" /> },
  checkout: { label: 'Checkout', cls: 'bg-amber-50 text-amber-700 border-amber-200',    icon: <CreditCard className="w-2.5 h-2.5" /> },
  paid:     { label: 'Paid',     cls: 'bg-emerald-50 text-emerald-700 border-emerald-200', icon: <CheckCircle2 className="w-2.5 h-2.5" /> },
  discount: { label: 'Discount', cls: 'bg-teal-50 text-teal-700 border-teal-200',       icon: <Tag className="w-2.5 h-2.5" /> },
  dropped:  { label: 'Dropped',  cls: 'bg-red-50 text-red-600 border-red-200',          icon: <AlertCircle className="w-2.5 h-2.5" /> },
  manage:   { label: 'Manage',   cls: 'bg-slate-100 text-slate-600 border-slate-300',   icon: <Activity className="w-2.5 h-2.5" /> },
};

function TimelineBadge({ badge }: { badge: TimelineBadge }) {
  const cfg = BADGE_CONFIG[badge] ?? BADGE_CONFIG.viewed;
  return (
    <span className={`inline-flex items-center gap-1 px-1.5 py-0.5 rounded border text-[10px] font-semibold whitespace-nowrap ${cfg.cls}`}>
      {cfg.icon}
      {cfg.label}
    </span>
  );
}

const FUNNEL_STATUS_CLS: Record<string, string> = {
  'Paid':             'text-emerald-700 bg-emerald-50 border-emerald-200',
  'Checkout seen':    'text-amber-700 bg-amber-50 border-amber-200',
  'Option selected':  'text-orange-700 bg-orange-50 border-orange-200',
  'Offer viewed':     'text-blue-700 bg-blue-50 border-blue-200',
  'Active':           'text-slate-700 bg-slate-50 border-slate-200',
  'Discount used':    'text-teal-700 bg-teal-50 border-teal-200',
  'Discount created': 'text-teal-600 bg-teal-50 border-teal-100',
  'Removed':          'text-red-600 bg-red-50 border-red-200',
  'No activity':      'text-slate-400 bg-slate-50 border-slate-100',
};

function FunnelProgressCard({ fp }: { fp: FunnelProgress }) {
  const statusCls = FUNNEL_STATUS_CLS[fp.status] ?? 'text-slate-500 bg-slate-50 border-slate-200';
  return (
    <div className="rounded-xl border border-slate-100 bg-slate-50/50 px-3 py-2.5">
      <div className="flex items-center justify-between gap-2 mb-1">
        <span className="text-[11px] font-semibold text-slate-700">{fp.funnel}</span>
        <span className={`text-[10px] font-semibold px-1.5 py-0.5 rounded border ${statusCls}`}>
          {fp.status}
        </span>
      </div>
      <div className="space-y-0.5">
        {fp.last_seen && (
          <p className="text-[10px] text-slate-400">
            Last seen: <span className="text-slate-600">{relativeTime(fp.last_seen)}</span>
          </p>
        )}
        {fp.max_step && (
          <p className="text-[10px] text-slate-400">
            Max step: <span className="text-slate-600">{fp.max_step}</span>
          </p>
        )}
        {fp.sessions > 0 && (
          <p className="text-[10px] text-slate-400">
            Sessions: <span className="text-slate-600">{fp.sessions}</span>
          </p>
        )}
        {/* Activation option details */}
        {fp.funnel === 'Activation' && fp.details.option_selected && (
          <p className="text-[10px] text-orange-700 font-medium">
            Option: {String(fp.details.option_selected)}
            {fp.details.price ? ` · $${fp.details.price}` : ''}
          </p>
        )}
        {/* Discount details */}
        {fp.funnel === 'Discount' && fp.details.discount_value != null && (
          <p className="text-[10px] text-teal-700 font-medium">
            {fp.details.discount_value}% off
            {fp.details.usage_count ? ` · Used ${fp.details.usage_count}x` : ''}
          </p>
        )}
        {/* Checkout/paid details */}
        {fp.funnel === 'Checkout' && fp.details.amount != null && (
          <p className="text-[10px] text-emerald-700 font-medium">
            ${Number(fp.details.amount).toFixed(2)}
            {fp.details.product ? ` · ${fp.details.product}` : ''}
          </p>
        )}
      </div>
    </div>
  );
}

// ── Main component ─────────────────────────────────────────────────────────────

interface Props {
  agencyId: string;
  agencySlug: string | null;
}

export default function AgencyFunnelIntelligence({ agencyId, agencySlug }: Props) {
  const { token } = useAdminSession();

  const [data, setData] = useState<IntelligenceData | null>(null);
  const [loading, setLoading] = useState(false);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [showAllTimeline, setShowAllTimeline] = useState(false);
  const [showFullIp, setShowFullIp] = useState(false);
  const adminIpRef = useRef<string | null>(null);

  const load = useCallback(async () => {
    const key = agencyId || agencySlug;
    if (!key) return;
    setLoading(true);
    setLoadError(null);
    try {
      const params = new URLSearchParams();
      if (agencyId) params.set('agency_id', agencyId);
      if (agencySlug) params.set('agency_slug', agencySlug);

      const headers: Record<string, string> = {
        'apikey': SUPABASE_ANON_KEY,
      };
      if (token) {
        headers['Authorization'] = `Bearer ${token}`;
      }

      const res = await fetch(
        `${SUPABASE_URL}/functions/v1/admin-get-agency-funnel-intelligence?${params}`,
        { headers }
      );
      const json = await res.json();
      if (!json.ok) throw new Error(json.error ?? 'Failed to load');
      setData(json as IntelligenceData);
    } catch (err) {
      setLoadError(err instanceof Error ? err.message : 'Failed to load funnel data');
    } finally {
      setLoading(false);
    }
  }, [agencyId, agencySlug, token]);

  useEffect(() => { load(); }, [load]);

  const s = data?.summary;
  const sig = data?.sales_signals;
  const timeline = data?.journey_timeline ?? [];
  const progress = data?.funnel_progress ?? [];
  const visibleTimeline = showAllTimeline ? timeline : timeline.slice(0, 10);

  return (
    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">

      {/* Header */}
      <div className="px-5 py-3.5 border-b border-slate-100 flex items-center justify-between">
        <h3 className="text-xs font-semibold text-slate-500 uppercase tracking-wide flex items-center gap-2">
          <Activity className="w-3 h-3" />
          Funnel Intelligence
        </h3>
        <div className="flex items-center gap-1.5">
          {loading && <Loader2 className="w-3.5 h-3.5 text-slate-300 animate-spin" />}
          <button
            onClick={load}
            disabled={loading}
            className="p-1.5 rounded-lg hover:bg-slate-100 transition-colors text-slate-400 hover:text-slate-600 disabled:opacity-40"
            title="Refresh"
          >
            <RefreshCw className="w-3 h-3" />
          </button>
        </div>
      </div>

      {/* Error */}
      {loadError && (
        <div className="px-5 py-3 flex items-center gap-2 text-xs text-red-600 bg-red-50 border-b border-red-100">
          <AlertCircle className="w-3.5 h-3.5 shrink-0" />
          {loadError}
        </div>
      )}

      {/* Loading skeleton */}
      {loading && !data && (
        <div className="px-5 py-8 text-center">
          <Loader2 className="w-5 h-5 animate-spin mx-auto mb-2 text-slate-300" />
          <p className="text-xs text-slate-400">Loading funnel data…</p>
        </div>
      )}

      {/* Empty */}
      {!loading && !data && !loadError && (
        <div className="px-5 py-6 text-center text-xs text-slate-400">No data available</div>
      )}

      {data && (
        <div className="divide-y divide-slate-100">

          {/* ── KPI tiles ── */}
          <div className="px-4 py-4">
            <div className="grid grid-cols-2 sm:grid-cols-5 gap-3">
              <KpiTile label="Sessions" value={String(s?.total_sessions ?? 0)} />
              <KpiTile label="Last 30d" value={String(s?.sessions_30d ?? 0)} />
              <KpiTile
                label="Checkout"
                value={s?.has_checkout ? 'Yes' : 'No'}
                variant={s?.has_checkout ? 'warning' : 'default'}
              />
              <KpiTile
                label="Paid"
                value={s?.is_paid ? 'Yes' : 'No'}
                variant={s?.is_paid ? 'success' : 'default'}
              />
              <div className="col-span-2 sm:col-span-1">
                <KpiTile
                  label="Last Seen"
                  value={s?.last_seen ? relativeTime(s.last_seen) : 'Never'}
                />
              </div>
            </div>
          </div>

          {/* ── Sales Signals ── */}
          <div className="px-5 py-4">
            <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest mb-3">Sales Signals</p>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-8">
              <div>
                <SigRow label="Last Source" value={sig?.last_source ?? '—'} />
                <SigRow label="Last Funnel" value={sig?.last_funnel ?? '—'} />
                <SigRow label="Last Stage" value={sig?.last_stage ?? '—'} />
                <SigRow label="Last Step" value={sig?.last_step?.replace(/_/g, ' ') ?? '—'} />
                <SigRow label="Max Depth" value={sig?.max_depth ? `Step ${sig.max_depth}` : '—'} />
                <SigRow label="Drop-off" value={sig?.drop_off ?? '—'} highlight />
              </div>
              <div>
                <SigRow label="Activation Viewed" yes={sig?.activation_viewed} />
                <SigRow label="Standard clicked" yes={sig?.activation_phase1_standard_clicked} />
                <SigRow label="Top-25 options viewed" yes={sig?.activation_top25_options_viewed} />
                <SigRow label="Final option selected" yes={sig?.activation_final_option_selected} />
                {sig?.activation_final_option_selected && sig.activation_final_option_name && (
                  <SigRow
                    label="Final choice"
                    value={[
                      sig.activation_final_option_name,
                      sig.activation_final_option_price ? `$${sig.activation_final_option_price}` : null,
                      sig.activation_final_rank ? `Rank #${sig.activation_final_rank}` : null,
                    ].filter(Boolean).join(' · ')}
                    highlight
                  />
                )}
                <SigRow
                  label="Option Selected (legacy)"
                  yes={sig?.activation_option_selected}
                />
                {sig?.activation_option_selected && sig.activation_option_name && (
                  <SigRow
                    label="Legacy option"
                    value={`${sig.activation_option_name}${sig.activation_option_price ? ` · $${sig.activation_option_price}` : ''}`}
                  />
                )}
                <SigRow label="Checkout Seen" yes={sig?.checkout_seen} />
                <SigRow label="Discount Opened" yes={sig?.discount_opened} />
                {sig?.discount_opened && sig.discount_percent != null && (
                  <SigRow label="Discount %" value={`${sig.discount_percent}% off`} />
                )}
                <SigRow label="Paid" yes={sig?.paid} />
                {sig?.paid && sig.revenue != null && (
                  <SigRow label="Revenue" value={`$${sig.revenue.toFixed(2)}`} />
                )}
              </div>
            </div>
          </div>

          {/* ── Funnel Progress ── */}
          {progress.length > 0 && (
            <div className="px-5 py-4">
              <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest mb-3">Funnel Progress</p>
              <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-2">
                {progress.map((fp) => (
                  <FunnelProgressCard key={fp.funnel} fp={fp} />
                ))}
              </div>
            </div>
          )}

          {/* ── Journey Timeline ── */}
          <div className="px-5 py-4">
            <div className="flex items-center justify-between gap-2 mb-3">
              <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest">
                Journey Timeline
                {timeline.length > 10 && (
                  <span className="ml-1.5 normal-case font-normal text-slate-300">
                    (showing {showAllTimeline ? timeline.length : Math.min(10, timeline.length)} of {timeline.length})
                  </span>
                )}
              </p>
              <button
                onClick={() => setShowFullIp((v) => !v)}
                className="text-[9px] font-medium text-slate-400 hover:text-slate-600 px-1.5 py-0.5 rounded border border-slate-200 hover:border-slate-300 transition-colors whitespace-nowrap"
              >
                {showFullIp ? 'Mask IPs' : 'Show full IPs'}
              </button>
            </div>

            {timeline.length === 0 ? (
              <div className="flex flex-col items-center justify-center py-6 gap-1.5">
                <Activity className="w-5 h-5 text-slate-200" />
                <p className="text-xs text-slate-400">No funnel events recorded yet.</p>
              </div>
            ) : (
              <>
                {/* Header row */}
                <div className="hidden sm:grid grid-cols-[72px_90px_110px_1fr_80px] gap-x-3 px-2 mb-1">
                  {['Time', 'Funnel', 'Step', 'Details', 'Badge'].map((h) => (
                    <span key={h} className="text-[9px] font-semibold text-slate-300 uppercase tracking-widest">{h}</span>
                  ))}
                </div>

                <div className="space-y-1">
                  {visibleTimeline.map((ev) => {
                    const probablySelf = isProbablyAdminSelf(ev, adminIpRef.current);
                    const hasLocation = !!(ev.ip_address || ev.city || ev.country || ev.user_agent);
                    const hasVisitorCtx = hasLocation; // alias for clarity
                    const ipDisplay = ev.ip_address
                      ? (showFullIp ? ev.ip_address : maskIp(ev.ip_address))
                      : null;
                    const locationStr = hasLocation ? formatLocation(ev) : null;
                    const deviceStr = deviceFromUA(ev.user_agent);
                    // Sources that should always attempt to show visitor context
                    const ctxSources = ['funnel_events', 'manage_funnel', 'funnel_session', 'activation_log', 'top25_selected_log', 'replay_funnel'];
                    const showCtxRow = ctxSources.includes(ev.source);

                    return (
                      <div
                        key={ev.id}
                        className={`rounded-lg border transition-colors ${
                          probablySelf
                            ? 'border-amber-200 bg-amber-50/30 hover:bg-amber-50/50'
                            : 'border-slate-100 hover:border-slate-200 hover:bg-slate-50/50'
                        }`}
                      >
                        {/* Desktop row */}
                        <div className="hidden sm:grid grid-cols-[72px_90px_110px_1fr_80px] gap-x-3 items-start px-3 py-2">
                          <div>
                            <p className="text-[10px] font-mono text-slate-500 leading-tight">{relativeTime(ev.ts)}</p>
                            <p className="text-[9px] text-slate-300 leading-tight">{absTime(ev.ts)}</p>
                          </div>
                          <span className="text-[11px] font-medium text-slate-600 truncate pt-px">{ev.funnel}</span>
                          <span className="text-[11px] text-slate-700 font-semibold truncate pt-px">{ev.step}</span>
                          <div className="min-w-0">
                            <span className="text-[10px] text-slate-400 truncate block">{ev.details ?? '—'}</span>
                            {hasVisitorCtx ? (
                              <span className="text-[9px] text-slate-300 flex items-center gap-1 mt-0.5 flex-wrap">
                                <MapPin className="w-2 h-2 shrink-0" />
                                <span>{locationStr}</span>
                                {ipDisplay && (
                                  <>
                                    <span className="text-slate-200">·</span>
                                    <span>IP: {ipDisplay}</span>
                                  </>
                                )}
                                {deviceStr && (
                                  <>
                                    <span className="text-slate-200">·</span>
                                    <Monitor className="w-2 h-2 shrink-0" />
                                    <span>{deviceStr}</span>
                                  </>
                                )}
                                {probablySelf && (
                                  <span className="ml-1 px-1 py-px rounded bg-amber-100 text-amber-700 font-semibold text-[8px] border border-amber-200 shrink-0">
                                    Possible admin/self view
                                  </span>
                                )}
                              </span>
                            ) : showCtxRow ? (
                              <span className="text-[9px] text-slate-200 flex items-center gap-1 mt-0.5 italic">
                                No visitor IP captured
                              </span>
                            ) : null}
                          </div>
                          <div className="flex justify-end pt-px">
                            <TimelineBadge badge={ev.badge} />
                          </div>
                        </div>

                        {/* Mobile stacked */}
                        <div className="sm:hidden px-3 py-2">
                          <div className="flex items-center justify-between gap-2 mb-0.5">
                            <div className="flex items-center gap-2 min-w-0">
                              <span className="text-[10px] text-slate-500 font-mono shrink-0">{relativeTime(ev.ts)}</span>
                              <span className="text-[11px] font-semibold text-slate-700 truncate">{ev.funnel} · {ev.step}</span>
                            </div>
                            <TimelineBadge badge={ev.badge} />
                          </div>
                          {ev.details && (
                            <p className="text-[10px] text-slate-400 truncate">{ev.details}</p>
                          )}
                          {hasVisitorCtx ? (
                            <p className="text-[9px] text-slate-300 flex items-center gap-1 mt-0.5 flex-wrap">
                              <MapPin className="w-2 h-2 shrink-0" />
                              <span>{locationStr}</span>
                              {ipDisplay && <span>· IP: {ipDisplay}</span>}
                              {deviceStr && <span>· {deviceStr}</span>}
                              {probablySelf && (
                                <span className="ml-1 px-1 py-px rounded bg-amber-100 text-amber-700 font-semibold text-[8px] border border-amber-200 shrink-0">
                                  Possible admin/self view
                                </span>
                              )}
                            </p>
                          ) : showCtxRow ? (
                            <p className="text-[9px] text-slate-200 italic mt-0.5">No visitor IP captured</p>
                          ) : null}
                        </div>
                      </div>
                    );
                  })}
                </div>

                {timeline.length > 10 && (
                  <button
                    onClick={() => setShowAllTimeline((v) => !v)}
                    className="mt-2 w-full flex items-center justify-center gap-1.5 text-[11px] font-medium text-slate-500 hover:text-slate-700 py-1.5 rounded-lg border border-slate-100 hover:border-slate-200 hover:bg-slate-50 transition-colors"
                  >
                    {showAllTimeline ? (
                      <><ChevronUp className="w-3 h-3" /> Show fewer</>
                    ) : (
                      <><ChevronDown className="w-3 h-3" /> Show all {timeline.length} events</>
                    )}
                  </button>
                )}
              </>
            )}
          </div>

          {/* ── Footer ── */}
          <div className="px-4 py-3">
            <a
              href="/wp-admin/analytics/agency-funnel"
              target="_blank"
              rel="noopener noreferrer"
              className="w-full flex items-center justify-center gap-2 text-xs font-medium text-blue-600 py-2.5 px-3 rounded-xl border border-blue-200 bg-blue-50 hover:bg-blue-100 transition-colors"
            >
              <BarChart2 className="w-3.5 h-3.5" />
              Open Funnel Analytics
              <ExternalLink className="w-3 h-3" />
            </a>
          </div>

        </div>
      )}
    </div>
  );
}

import { useEffect, useMemo, useRef, useState } from 'react';
import {
  Activity,
  RefreshCw,
  Filter,
  Flame,
  TrendingUp,
  Eye,
  MousePointerClick,
  CreditCard,
  XOctagon,
  Zap,
  Target,
  Bell,
  BellOff,
  X,
  Mail,
  ExternalLink,
  DollarSign,
  ShieldAlert,
  Copy,
  GitBranch,
  Rocket,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { TrafficModeToggle, trafficModeToApiParam, type TrafficMode } from '../components/admin/TrafficModeToggle';
import { US_STATE_SLUG_TO_NAME } from '../lib/usStateSlugs';

type FunnelStage = 'awareness' | 'engagement' | 'high_intent' | 'checkout' | 'conversion' | 'negative';
type EventGroup = 'view' | 'engagement' | 'high_intent' | 'checkout' | 'conversion' | 'negative';

interface ActivityEvent {
  id: string;
  created_at: string;
  time_ago: string;
  agency_id: string | null;
  agency_name: string | null;
  agency_slug: string | null;
  state_slug: string | null;
  state_name: string | null;
  event_name: string;
  event_group: EventGroup;
  funnel_stage: FunnelStage;
  funnel_step: string;
  source: string;
  intent_weight: number;
  intent_score: number;
  readable_label: string;
  metadata: Record<string, unknown> | null;
  intent_stage?: string | null;
  identity_method?: string | null;
  identity_confidence?: 'high' | 'medium' | 'low' | 'none' | null;
}

interface AgencyScore {
  agency_id: string;
  intent_score: number;
  intent_score_7d: number;
  event_count_7d: number;
}

interface ReadyToCloseRow {
  agency_id: string;
  agency_name: string | null;
  agency_slug: string | null;
  state_slug: string | null;
  state_name: string | null;
  intent_score: number;
  last_action_label: string;
  last_action_event: string;
  last_action_at: string;
  last_action_ago: string;
  signal: 'checkout_abandoned' | 'activate_high_intent' | 'warm';
}

interface AtRiskRow {
  agency_id: string;
  agency_name: string | null;
  agency_slug: string | null;
  state_slug: string | null;
  state_name: string | null;
  intent_score: number;
  last_action_label: string;
  last_action_event: string;
  last_action_at: string;
  last_action_ago: string;
  hours_since_action: number | string;
  signal: 'remove_confirmed' | 'remove_started' | 'manage_opened' | 'high_intent_inactive' | 'other';
}

interface RevenueSummary {
  revenue_cents_24h: number;
  orders_24h: number;
  revenue_cents_7d: number;
  orders_7d: number;
  currency: string;
}

interface ApiResponse {
  ok: boolean;
  count: number;
  events: ActivityEvent[];
  scores: AgencyScore[];
  ready_to_close: ReadyToCloseRow[];
  at_risk: AtRiskRow[];
  revenue: RevenueSummary | null;
  window_minutes: number | null;
  generated_at: string;
}

type GroupFilter = 'all' | 'view' | 'engagement' | 'high_intent' | 'checkout' | 'conversion' | 'negative';
type Priority = 'high' | 'medium' | 'low';

interface TimeWindow {
  label: string;
  minutes: number;
}

const TIME_WINDOWS: TimeWindow[] = [
  { label: 'Last 15 min', minutes: 15 },
  { label: '1 hour', minutes: 60 },
  { label: '24 hours', minutes: 24 * 60 },
  { label: '7 days', minutes: 7 * 24 * 60 },
];

const GROUP_STYLES: Record<string, string> = {
  view: 'bg-slate-50 text-slate-600 border-slate-200',
  engagement: 'bg-blue-50 text-blue-700 border-blue-200',
  high_intent: 'bg-orange-50 text-orange-700 border-orange-200',
  checkout: 'bg-amber-50 text-amber-700 border-amber-200',
  conversion: 'bg-emerald-50 text-emerald-700 border-emerald-200',
  negative: 'bg-rose-50 text-rose-700 border-rose-200',
};

const STAGE_STYLES: Record<FunnelStage, string> = {
  awareness: 'bg-slate-100 text-slate-600 border-slate-200',
  engagement: 'bg-blue-50 text-blue-700 border-blue-200',
  high_intent: 'bg-orange-50 text-orange-700 border-orange-200',
  checkout: 'bg-amber-50 text-amber-700 border-amber-200',
  conversion: 'bg-emerald-50 text-emerald-700 border-emerald-200',
  negative: 'bg-rose-50 text-rose-700 border-rose-200',
};

const STEP_ICONS: Record<string, typeof Activity> = {
  your_agency: Eye,
  manage: MousePointerClick,
  checkout: CreditCard,
  replay: TrendingUp,
  availability: Flame,
  smartlink: Activity,
  profile: Eye,
};

const PRIORITY_ROW_STYLES: Record<Priority, string> = {
  high: 'border-l-4 border-l-rose-500 bg-rose-50/30 hover:bg-rose-50/60',
  medium: 'border-l-4 border-l-amber-400 bg-amber-50/20 hover:bg-amber-50/50',
  low: 'border-l-4 border-l-transparent hover:bg-slate-50/60',
};

const SIGNAL_LABEL: Record<string, string> = {
  checkout_abandoned: 'Opened checkout · not completed',
  activate_high_intent: 'Clicked Start receiving clients · high intent',
  warm: 'Warm lead',
  remove_started: 'Started removal',
  remove_confirmed: 'Confirmed removal',
  manage_opened: 'Opened manage listing',
  high_intent_inactive: 'High intent · inactive 48h+',
  other: 'Other',
};

const SIGNAL_TONE: Record<string, string> = {
  checkout_abandoned: 'bg-amber-100 text-amber-800 border-amber-300',
  activate_high_intent: 'bg-orange-100 text-orange-800 border-orange-300',
  warm: 'bg-slate-100 text-slate-700 border-slate-300',
  remove_started: 'bg-rose-100 text-rose-800 border-rose-300',
  remove_confirmed: 'bg-rose-200 text-rose-900 border-rose-400',
  manage_opened: 'bg-amber-100 text-amber-800 border-amber-300',
  high_intent_inactive: 'bg-orange-100 text-orange-800 border-orange-300',
  other: 'bg-slate-100 text-slate-700 border-slate-300',
};

function formatScore(n: number): string {
  if (!Number.isFinite(n) || n <= 0) return '0';
  if (n >= 1000) return `${(n / 1000).toFixed(1)}k`;
  return String(Math.round(n));
}

function scoreTone(score: number): string {
  if (score >= 100) return 'bg-rose-50 text-rose-700 border-rose-200';
  if (score >= 40) return 'bg-orange-50 text-orange-700 border-orange-200';
  if (score >= 15) return 'bg-amber-50 text-amber-700 border-amber-200';
  return 'bg-slate-50 text-slate-600 border-slate-200';
}

function formatCurrency(cents: number, currency = 'usd'): string {
  const value = (cents || 0) / 100;
  try {
    return new Intl.NumberFormat(undefined, {
      style: 'currency',
      currency: (currency || 'usd').toUpperCase(),
      maximumFractionDigits: value >= 1000 ? 0 : 2,
    }).format(value);
  } catch {
    return `$${value.toFixed(2)}`;
  }
}

function priorityFor(ev: ActivityEvent): Priority {
  if (ev.event_group === 'conversion' || ev.event_group === 'high_intent' || ev.intent_weight >= 10 || ev.intent_score >= 40) return 'high';
  if (ev.intent_weight >= 3 || ev.intent_score >= 15 || ev.event_group === 'engagement') return 'medium';
  return 'low';
}

function isHighIntentEvent(ev: ActivityEvent): boolean {
  return ev.event_group === 'high_intent' || ev.event_group === 'conversion' || ev.intent_weight >= 10;
}

function agencyHelperHref(
  agencyId: string | null | undefined,
  stateSlug: string | null | undefined,
  agencySlug?: string | null,
  email?: string | null,
  agencyName?: string | null,
): string {
  const params = new URLSearchParams();
  if (agencyId) {
    params.set('prefill_agency_id', agencyId);
  } else if (email) {
    params.set('prefill_email', email);
  } else if (agencySlug) {
    params.set('agency', agencySlug);
    if (stateSlug) params.set('state', stateSlug);
  } else if (agencyName) {
    if (import.meta.env.DEV) {
      console.warn('[agencyHelperHref] No agency_id or email available; falling back to agency_name+state', { agencyName, stateSlug });
    }
    params.set('agency_name', agencyName);
    if (stateSlug) params.set('state', stateSlug);
  }
  const qs = params.toString();
  return qs ? `/wp-admin/email/agency-lookup?${qs}` : '/wp-admin/email/agency-lookup';
}

function smartLinkUrl(slug: string | null | undefined, state: string | null | undefined): string | null {
  if (!slug) return null;
  const origin = typeof window !== 'undefined' ? window.location.origin : 'https://www.gappsy.com';
  if (state) return `${origin}/your-agency/${encodeURIComponent(state)}/${encodeURIComponent(slug)}`;
  return `${origin}/your-agency/${encodeURIComponent(slug)}`;
}

function funnelUrl(agencyId: string): string {
  return `/wp-admin/analytics/agency-funnel?agency_id=${encodeURIComponent(agencyId)}`;
}

export default function WpAdminActivityFeedPage() {
  const [stateFilter, setStateFilter] = useState('');
  const [groupFilter, setGroupFilter] = useState<GroupFilter>('all');
  const [trafficMode, setTrafficMode] = useState<TrafficMode>('all');
  const [search, setSearch] = useState('');
  const [limit, setLimit] = useState(200);
  const [windowMinutes, setWindowMinutes] = useState<number>(24 * 60);
  const [autoRefresh, setAutoRefresh] = useState(true);
  const [tick, setTick] = useState(0);
  const [alertsEnabled, setAlertsEnabled] = useState(true);
  const [alertEvent, setAlertEvent] = useState<ActivityEvent | null>(null);
  const [selectedAgencyId, setSelectedAgencyId] = useState<string | null>(null);
  const [copiedId, setCopiedId] = useState<string | null>(null);
  const seenEventIdsRef = useRef<Set<string>>(new Set());
  const isFirstLoadRef = useRef(true);
  const pulseEventIdsRef = useRef<Set<string>>(new Set());

  const functionPath = useMemo(() => {
    const params = new URLSearchParams();
    params.set('limit', String(limit));
    params.set('window_minutes', String(windowMinutes));
    if (stateFilter) params.set('state', stateFilter);
    const tmParam = trafficModeToApiParam(trafficMode);
    if (tmParam) params.set('confidence_filter', tmParam);
    return `admin-activity-feed?${params.toString()}`;
  }, [limit, stateFilter, windowMinutes, trafficMode]);

  const { data, isLoading, isError, error, refetch, isEmpty } = useAdminFetch<ApiResponse>(
    functionPath,
    {
      autoFetch: true,
      isEmptyCheck: (d) => !d?.events?.length,
    },
  );

  useEffect(() => {
    if (!autoRefresh) return;
    const timer = setInterval(() => {
      refetch();
      setTick((t) => t + 1);
    }, 10_000);
    return () => clearInterval(timer);
  }, [autoRefresh, refetch]);

  const events = data?.events ?? [];
  const scores = data?.scores ?? [];
  const readyToClose = data?.ready_to_close ?? [];
  const atRisk = data?.at_risk ?? [];
  const revenue = data?.revenue ?? null;

  useEffect(() => {
    if (!events.length) return;
    if (isFirstLoadRef.current) {
      for (const e of events) seenEventIdsRef.current.add(e.id);
      isFirstLoadRef.current = false;
      return;
    }
    const freshPulse = new Set<string>();
    const newHighIntent: ActivityEvent[] = [];
    for (const e of events) {
      if (!seenEventIdsRef.current.has(e.id)) {
        seenEventIdsRef.current.add(e.id);
        freshPulse.add(e.id);
        if (alertsEnabled && (e.event_group === 'conversion' || e.event_group === 'high_intent' || e.intent_weight >= 20)) {
          newHighIntent.push(e);
        }
      }
    }
    pulseEventIdsRef.current = freshPulse;
    if (newHighIntent.length > 0) {
      const newest = newHighIntent.sort(
        (a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime(),
      )[0];
      setAlertEvent(newest);
    }
    const t = setTimeout(() => {
      pulseEventIdsRef.current = new Set();
    }, 3000);
    return () => clearTimeout(t);
  }, [events, alertsEnabled]);

  useEffect(() => {
    if (!alertEvent) return;
    const t = setTimeout(() => setAlertEvent(null), 8_000);
    return () => clearTimeout(t);
  }, [alertEvent]);

  const filtered = useMemo(() => {
    const q = search.trim().toLowerCase();
    return events.filter((e) => {
      if (groupFilter !== 'all' && e.event_group !== groupFilter) return false;
      if (!q) return true;
      return (
        (e.agency_name || '').toLowerCase().includes(q) ||
        (e.event_name || '').toLowerCase().includes(q) ||
        (e.state_slug || '').toLowerCase().includes(q) ||
        (e.readable_label || '').toLowerCase().includes(q)
      );
    });
  }, [events, groupFilter, search]);

  const summary = useMemo(() => {
    const total = events.length;
    let sales = 0;
    let highIntent = 0;
    let engagements = 0;
    let negatives = 0;
    let unknown = 0;
    const activeAgencies = new Set<string>();
    for (const e of events) {
      if (e.event_group === 'conversion') sales++;
      else if (e.event_group === 'high_intent') highIntent++;
      else if (e.event_group === 'engagement') engagements++;
      else if (e.event_group === 'negative') negatives++;
      if (e.agency_id) activeAgencies.add(e.agency_id);
      if (!e.agency_name) unknown++;
    }
    const unknownPct = total > 0 ? Math.round((unknown / total) * 100) : 0;
    return { total, sales, highIntent, engagements, negatives, activeAgencies: activeAgencies.size, unknownPct };
  }, [events]);

  const states = useMemo(() => {
    const set = new Set<string>();
    for (const e of events) if (e.state_slug) set.add(e.state_slug);
    return Array.from(set).sort();
  }, [events]);

  const highIntentEvents = useMemo(() => {
    return events
      .filter(isHighIntentEvent)
      .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
      .slice(0, 5);
  }, [events]);

  const selectedAgency = useMemo(() => {
    if (!selectedAgencyId) return null;
    const agencyEvents = events
      .filter((e) => e.agency_id === selectedAgencyId)
      .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime());
    if (!agencyEvents.length) return null;
    const score = scores.find((s) => s.agency_id === selectedAgencyId);
    return {
      id: selectedAgencyId,
      name: agencyEvents[0].agency_name,
      slug: agencyEvents[0].agency_slug,
      state: agencyEvents[0].state_slug,
      stateName: agencyEvents[0].state_name,
      score: score?.intent_score ?? 0,
      score7d: score?.intent_score_7d ?? 0,
      eventCount7d: score?.event_count_7d ?? 0,
      lastEvents: agencyEvents.slice(0, 5),
    };
  }, [selectedAgencyId, events, scores]);

  const handleCopySmartlink = async (id: string, slug: string | null, state: string | null) => {
    const url = smartLinkUrl(slug, state);
    if (!url) return;
    try {
      await navigator.clipboard.writeText(url);
      setCopiedId(id);
      setTimeout(() => setCopiedId((cur) => (cur === id ? null : cur)), 1500);
    } catch {
      /* ignore */
    }
  };

  const windowLabel = TIME_WINDOWS.find((w) => w.minutes === windowMinutes)?.label ?? 'Custom';

  return (
    <WpAdminLayout title="Activity Feed" subtitle="Sales control center">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {alertsEnabled && alertEvent && (
          <div className="mb-4 rounded-xl border-2 border-rose-300 bg-gradient-to-r from-rose-50 to-orange-50 px-4 py-3 flex items-center gap-3 shadow-sm animate-pulse">
            <div className="flex-shrink-0 w-10 h-10 rounded-full bg-rose-500 flex items-center justify-center">
              <Zap className="w-5 h-5 text-white" />
            </div>
            <div className="flex-1 min-w-0">
              <p className="text-sm font-semibold text-rose-900">
                High-intent signal: {alertEvent.agency_name || alertEvent.agency_slug || 'Unknown'}
              </p>
              <p className="text-xs text-rose-700 mt-0.5">
                {alertEvent.readable_label} · {alertEvent.time_ago}
                {alertEvent.state_slug && ` · ${US_STATE_SLUG_TO_NAME[alertEvent.state_slug] || alertEvent.state_slug}`}
              </p>
            </div>
            {alertEvent.agency_id && (
              <button
                onClick={() => {
                  setSelectedAgencyId(alertEvent.agency_id);
                  setAlertEvent(null);
                }}
                className="text-xs font-medium px-3 py-1.5 rounded-lg bg-rose-600 text-white hover:bg-rose-700"
              >
                Open
              </button>
            )}
            <button
              onClick={() => setAlertEvent(null)}
              className="text-rose-500 hover:text-rose-700 p-1"
              aria-label="Dismiss alert"
            >
              <X className="w-4 h-4" />
            </button>
          </div>
        )}

        <header className="flex flex-wrap items-start justify-between gap-4 mb-6">
          <div>
            <div className="flex items-center gap-2 text-sm text-slate-500 mb-1">
              <Activity className="w-4 h-4" />
              <span>Sales Ops</span>
            </div>
            <h1 className="text-2xl font-semibold text-slate-900">Activity Feed</h1>
            <p className="text-sm text-slate-600 mt-1">
              Live sales control center · {windowLabel}. Real payments only in Sales. Ready-to-Close surfaces checkout
              abandoners and high-intent actives.
            </p>
          </div>

          <div className="flex items-center gap-2">
            <button
              onClick={() => setAlertsEnabled((v) => !v)}
              className={`inline-flex items-center gap-2 px-3 py-2 text-sm font-medium rounded-lg border ${
                alertsEnabled
                  ? 'bg-rose-50 border-rose-200 text-rose-700 hover:bg-rose-100'
                  : 'bg-white border-slate-300 text-slate-600 hover:bg-slate-50'
              }`}
              title={alertsEnabled ? 'Mute live alerts' : 'Enable live alerts'}
            >
              {alertsEnabled ? <Bell className="w-4 h-4" /> : <BellOff className="w-4 h-4" />}
              Alerts
            </button>
            <label className="inline-flex items-center gap-2 text-sm text-slate-700">
              <input
                type="checkbox"
                checked={autoRefresh}
                onChange={(e) => setAutoRefresh(e.target.checked)}
                className="rounded border-slate-300"
              />
              Auto-refresh (10s)
            </label>
            <button
              onClick={() => refetch()}
              disabled={isLoading}
              className="inline-flex items-center gap-2 px-3 py-2 text-sm font-medium rounded-lg border border-slate-300 bg-white hover:bg-slate-50 disabled:opacity-50"
            >
              <RefreshCw className={`w-4 h-4 ${isLoading ? 'animate-spin' : ''}`} />
              Refresh
            </button>
          </div>
        </header>

        <div className="mb-4">
          <TrafficModeToggle value={trafficMode} onChange={setTrafficMode} compact />
        </div>

        <div className="mb-4 flex flex-wrap items-center gap-1 bg-white border border-slate-200 rounded-xl p-1 w-fit">
          {TIME_WINDOWS.map((w) => (
            <button
              key={w.minutes}
              onClick={() => setWindowMinutes(w.minutes)}
              className={`px-3 py-1.5 text-xs font-medium rounded-lg transition-colors ${
                windowMinutes === w.minutes
                  ? 'bg-slate-900 text-white'
                  : 'text-slate-600 hover:bg-slate-100'
              }`}
            >
              {w.label}
            </button>
          ))}
        </div>

        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-8 gap-3 mb-6">
          <StatCard label="Events" value={summary.total} tone="slate" />
          <StatCard
            label="Revenue 24h"
            value={revenue ? formatCurrency(revenue.revenue_cents_24h, revenue.currency) : '$0'}
            sub={revenue ? `${revenue.orders_24h} orders` : '0 orders'}
            tone="emerald"
            icon={DollarSign}
            isMoney
          />
          <StatCard
            label="Revenue 7d"
            value={revenue ? formatCurrency(revenue.revenue_cents_7d, revenue.currency) : '$0'}
            sub={revenue ? `${revenue.orders_7d} orders` : '0 orders'}
            tone="emerald"
            icon={DollarSign}
            isMoney
          />
          <StatCard label="Sales" value={summary.sales} tone="emerald" />
          <StatCard label="High intent" value={summary.highIntent} tone="orange" />
          <StatCard label="Engagements" value={summary.engagements} tone="blue" />
          <StatCard label="Negatives" value={summary.negatives} tone="rose" />
          <StatCard label="Active agencies" value={summary.activeAgencies} tone="slate" sub={`${summary.unknownPct}% unknown`} />
        </div>

        {readyToClose.length > 0 && (
          <section className="mb-6 bg-gradient-to-br from-orange-50 via-amber-50 to-white border-2 border-orange-300 rounded-xl overflow-hidden shadow-sm">
            <div className="px-5 py-3 border-b border-orange-200 flex items-center gap-2 bg-orange-100/50">
              <Rocket className="w-5 h-5 text-orange-700" />
              <h2 className="text-base font-bold text-orange-900">Ready to Close</h2>
              <span className="text-[11px] px-2 py-0.5 rounded-full bg-orange-200 text-orange-900 font-semibold">
                {readyToClose.length}
              </span>
              <span className="text-xs text-orange-700 ml-auto">Checkout abandoners + high intent</span>
            </div>
            <ul className="divide-y divide-orange-100">
              {readyToClose.map((row) => (
                <li key={row.agency_id} className="px-5 py-3 hover:bg-orange-50/40 transition-colors">
                  <div className="flex items-center gap-3 flex-wrap">
                    <button
                      onClick={() => setSelectedAgencyId(row.agency_id)}
                      className="flex items-center gap-3 flex-1 min-w-0 text-left"
                    >
                      <div className="flex-shrink-0 w-9 h-9 rounded-lg bg-orange-100 text-orange-700 border border-orange-200 flex items-center justify-center">
                        {row.signal === 'checkout_abandoned' ? (
                          <CreditCard className="w-4 h-4" />
                        ) : (
                          <Flame className="w-4 h-4" />
                        )}
                      </div>
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 flex-wrap">
                          <span className="font-semibold text-slate-900 truncate">
                            {row.agency_name || row.agency_slug || 'Unknown agency'}
                          </span>
                          <span
                            className={`text-[10px] px-2 py-0.5 rounded-full border font-medium ${
                              SIGNAL_TONE[row.signal] || SIGNAL_TONE.warm
                            }`}
                          >
                            {SIGNAL_LABEL[row.signal] || row.signal}
                          </span>
                        </div>
                        <p className="text-xs text-slate-600 mt-0.5 truncate">
                          {row.last_action_label} · {row.last_action_ago}
                          {row.state_slug && ` · ${US_STATE_SLUG_TO_NAME[row.state_slug] || row.state_slug}`}
                        </p>
                      </div>
                      <span
                        className={`flex-shrink-0 text-[11px] px-2 py-0.5 rounded-full border font-medium inline-flex items-center gap-1 ${scoreTone(
                          row.intent_score,
                        )}`}
                      >
                        <Flame className="w-3 h-3" />
                        {formatScore(row.intent_score)}
                      </span>
                    </button>
                    <QuickActions
                      agencyId={row.agency_id}
                      slug={row.agency_slug}
                      state={row.state_slug}
                      copyId={`rtc-${row.agency_id}`}
                      copiedId={copiedId}
                      onCopy={handleCopySmartlink}
                    />
                  </div>
                </li>
              ))}
            </ul>
          </section>
        )}

        {atRisk.length > 0 && (
          <section className="mb-6 bg-gradient-to-br from-rose-50 to-white border-2 border-rose-300 rounded-xl overflow-hidden shadow-sm">
            <div className="px-5 py-3 border-b border-rose-200 flex items-center gap-2 bg-rose-100/50">
              <ShieldAlert className="w-5 h-5 text-rose-700" />
              <h2 className="text-base font-bold text-rose-900">At Risk · Removal / Drop-off</h2>
              <span className="text-[11px] px-2 py-0.5 rounded-full bg-rose-200 text-rose-900 font-semibold">
                {atRisk.length}
              </span>
              <span className="text-xs text-rose-700 ml-auto">Save churn</span>
            </div>
            <ul className="divide-y divide-rose-100">
              {atRisk.map((row) => (
                <li key={row.agency_id} className="px-5 py-3 hover:bg-rose-50/40 transition-colors">
                  <div className="flex items-center gap-3 flex-wrap">
                    <button
                      onClick={() => setSelectedAgencyId(row.agency_id)}
                      className="flex items-center gap-3 flex-1 min-w-0 text-left"
                    >
                      <div className="flex-shrink-0 w-9 h-9 rounded-lg bg-rose-100 text-rose-700 border border-rose-200 flex items-center justify-center">
                        {row.signal === 'remove_confirmed' || row.signal === 'remove_started' ? (
                          <XOctagon className="w-4 h-4" />
                        ) : (
                          <ShieldAlert className="w-4 h-4" />
                        )}
                      </div>
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 flex-wrap">
                          <span className="font-semibold text-slate-900 truncate">
                            {row.agency_name || row.agency_slug || 'Unknown agency'}
                          </span>
                          <span
                            className={`text-[10px] px-2 py-0.5 rounded-full border font-medium ${
                              SIGNAL_TONE[row.signal] || SIGNAL_TONE.other
                            }`}
                          >
                            {SIGNAL_LABEL[row.signal] || row.signal}
                          </span>
                        </div>
                        <p className="text-xs text-slate-600 mt-0.5 truncate">
                          {row.last_action_label} · {row.last_action_ago}
                          {row.state_slug && ` · ${US_STATE_SLUG_TO_NAME[row.state_slug] || row.state_slug}`}
                        </p>
                      </div>
                      <span
                        className={`flex-shrink-0 text-[11px] px-2 py-0.5 rounded-full border font-medium inline-flex items-center gap-1 ${scoreTone(
                          row.intent_score,
                        )}`}
                      >
                        <Flame className="w-3 h-3" />
                        {formatScore(row.intent_score)}
                      </span>
                    </button>
                    <QuickActions
                      agencyId={row.agency_id}
                      slug={row.agency_slug}
                      state={row.state_slug}
                      copyId={`risk-${row.agency_id}`}
                      copiedId={copiedId}
                      onCopy={handleCopySmartlink}
                    />
                  </div>
                </li>
              ))}
            </ul>
          </section>
        )}

        {highIntentEvents.length > 0 && (
          <section className="mb-6 bg-gradient-to-br from-rose-50/60 to-white border border-rose-200 rounded-xl overflow-hidden">
            <div className="px-4 py-3 border-b border-rose-200 flex items-center gap-2">
              <Zap className="w-4 h-4 text-rose-600" />
              <h2 className="text-sm font-semibold text-rose-900">Latest high-intent signals</h2>
              <span className="text-[11px] text-rose-600 ml-auto">last 5</span>
            </div>
            <ul className="divide-y divide-rose-100">
              {highIntentEvents.map((ev) => (
                <li key={ev.id} className="px-4 py-3 hover:bg-rose-50/30 flex items-center gap-3 flex-wrap">
                  <button
                    onClick={() => ev.agency_id && setSelectedAgencyId(ev.agency_id)}
                    className="flex items-center gap-3 flex-1 min-w-0 text-left"
                    disabled={!ev.agency_id}
                  >
                    <div className="flex-shrink-0 w-8 h-8 rounded-lg bg-rose-100 text-rose-700 border border-rose-200 flex items-center justify-center">
                      {ev.event_group === 'conversion' ? (
                        <CreditCard className="w-4 h-4" />
                      ) : (
                        <Flame className="w-4 h-4" />
                      )}
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-semibold text-slate-900 truncate">
                        {ev.agency_name || ev.agency_slug || 'Unknown agency'}
                      </p>
                      <p className="text-xs text-slate-600 truncate">{ev.readable_label}</p>
                      <p className="text-[10px] text-slate-400 font-mono truncate">{ev.event_name}</p>
                    </div>
                    <div className="flex-shrink-0 text-right">
                      <span className="text-[11px] px-2 py-0.5 rounded-full bg-emerald-50 text-emerald-700 border border-emerald-200 font-medium">
                        +{ev.intent_weight}
                      </span>
                      <p className="text-[11px] text-slate-500 mt-0.5">{ev.time_ago}</p>
                    </div>
                  </button>
                  {ev.agency_id && (
                    <QuickActions
                      agencyId={ev.agency_id}
                      slug={ev.agency_slug}
                      state={ev.state_slug}
                      copyId={`hi-${ev.id}`}
                      copiedId={copiedId}
                      onCopy={handleCopySmartlink}
                    />
                  )}
                </li>
              ))}
            </ul>
          </section>
        )}

        <div className="bg-white border border-slate-200 rounded-xl p-4 mb-4 flex flex-wrap items-end gap-3">
          <div className="flex-1 min-w-[220px]">
            <label className="block text-xs font-medium text-slate-500 mb-1">Search</label>
            <input
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Agency, event, state..."
              className="w-full rounded-lg border border-slate-300 px-3 py-2 text-sm"
            />
          </div>

          <div>
            <label className="block text-xs font-medium text-slate-500 mb-1">Group</label>
            <select
              value={groupFilter}
              onChange={(e) => setGroupFilter(e.target.value as GroupFilter)}
              className="rounded-lg border border-slate-300 px-3 py-2 text-sm bg-white"
            >
              <option value="all">All</option>
              <option value="conversion">Sales (conversion)</option>
              <option value="checkout">Checkout</option>
              <option value="high_intent">High intent</option>
              <option value="engagement">Engagement</option>
              <option value="view">View</option>
              <option value="negative">Negative</option>
            </select>
          </div>

          <div>
            <label className="block text-xs font-medium text-slate-500 mb-1">State</label>
            <select
              value={stateFilter}
              onChange={(e) => setStateFilter(e.target.value)}
              className="rounded-lg border border-slate-300 px-3 py-2 text-sm bg-white min-w-[160px]"
            >
              <option value="">All states</option>
              {states.map((s) => (
                <option key={s} value={s}>
                  {US_STATE_SLUG_TO_NAME[s] || s}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-xs font-medium text-slate-500 mb-1">Limit</label>
            <select
              value={limit}
              onChange={(e) => setLimit(Number(e.target.value))}
              className="rounded-lg border border-slate-300 px-3 py-2 text-sm bg-white"
            >
              <option value={100}>100</option>
              <option value={200}>200</option>
              <option value={500}>500</option>
            </select>
          </div>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} />}

        {isLoading && !data && <AdminLoadingState message="Loading activity feed..." />}

        {!isLoading && isEmpty && (
          <AdminEmptyState
            title="No recent activity"
            message="No events recorded in the selected window. Try widening the filter or check back shortly."
          />
        )}

        {!isEmpty && filtered.length > 0 && (
          <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
            <div className="px-4 py-3 border-b border-slate-200 text-xs font-medium text-slate-500 flex items-center justify-between">
              <span>
                Showing {filtered.length} of {events.length} events
              </span>
              {data?.generated_at && (
                <span className="text-slate-400">Updated {new Date(data.generated_at).toLocaleTimeString()}</span>
              )}
            </div>
            <ul className="divide-y divide-slate-100">
              {filtered.map((ev) => {
                const Icon = STEP_ICONS[ev.funnel_step] || Activity;
                const groupStyle = GROUP_STYLES[ev.event_group] || GROUP_STYLES.view;
                const stageStyle = STAGE_STYLES[ev.funnel_stage] || STAGE_STYLES.awareness;
                const isNegative = ev.event_group === 'negative';
                const priority = priorityFor(ev);
                const rowStyle = PRIORITY_ROW_STYLES[priority];
                const clickable = !!ev.agency_id;
                const isFresh = pulseEventIdsRef.current.has(ev.id);
                return (
                  <li
                    key={ev.id}
                    onClick={() => clickable && setSelectedAgencyId(ev.agency_id)}
                    className={`px-4 py-3 ${rowStyle} ${clickable ? 'cursor-pointer' : ''} ${
                      isFresh ? 'ring-1 ring-emerald-300 animate-[pulse_1.5s_ease-in-out_2]' : ''
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div
                        className={`flex-shrink-0 w-9 h-9 rounded-lg border flex items-center justify-center ${groupStyle}`}
                      >
                        {isNegative ? <XOctagon className="w-4 h-4" /> : <Icon className="w-4 h-4" />}
                      </div>

                      <div className="flex-1 min-w-0">
                        <div className="flex items-baseline gap-2 flex-wrap">
                          <span className="font-semibold text-slate-900 truncate">
                            {ev.agency_name || ev.agency_slug || 'Unknown agency'}
                          </span>
                          <span className="text-sm text-slate-600">{ev.readable_label}</span>
                          <span className={`text-[10px] px-1.5 py-0.5 rounded-full border font-medium ${stageStyle}`}>
                            {ev.intent_stage || ev.funnel_stage}
                          </span>
                          {ev.identity_confidence && ev.identity_confidence !== 'high' && (
                            <span
                              className={`text-[10px] px-1.5 py-0.5 rounded-full border font-medium ${
                                ev.identity_confidence === 'medium'
                                  ? 'bg-amber-50 text-amber-700 border-amber-200'
                                  : ev.identity_confidence === 'low'
                                  ? 'bg-orange-50 text-orange-700 border-orange-200'
                                  : 'bg-slate-100 text-slate-500 border-slate-200'
                              }`}
                              title={`Identity resolved via ${ev.identity_method || 'unknown'}`}
                            >
                              id: {ev.identity_confidence}
                            </span>
                          )}
                          {ev.source && ev.source !== 'direct' && (
                            <span className="text-[11px] uppercase tracking-wide text-slate-400">via {ev.source}</span>
                          )}
                        </div>
                        <div className="mt-0.5 text-xs text-slate-500 flex items-center gap-2 flex-wrap">
                          <span className="font-mono text-slate-400">{ev.event_name}</span>
                          {ev.state_slug && (
                            <>
                              <span>·</span>
                              <span>{ev.state_name || US_STATE_SLUG_TO_NAME[ev.state_slug] || ev.state_slug}</span>
                            </>
                          )}
                          <span>·</span>
                          <span>{ev.time_ago}</span>
                        </div>
                      </div>

                      <div className="flex items-center gap-2 flex-shrink-0">
                        {ev.intent_weight !== 0 && (
                          <span
                            className={`text-[11px] px-2 py-0.5 rounded-full border font-medium ${
                              ev.intent_weight < 0
                                ? 'bg-rose-50 text-rose-700 border-rose-200'
                                : ev.intent_weight >= 10
                                ? 'bg-emerald-50 text-emerald-700 border-emerald-200'
                                : 'bg-slate-50 text-slate-600 border-slate-200'
                            }`}
                          >
                            {ev.intent_weight > 0 ? `+${ev.intent_weight}` : ev.intent_weight}
                          </span>
                        )}
                        {ev.intent_score > 0 && (
                          <span
                            className={`text-[11px] px-2 py-0.5 rounded-full border font-medium inline-flex items-center gap-1 ${scoreTone(
                              ev.intent_score,
                            )}`}
                            title={`Intent score: ${ev.intent_score}`}
                          >
                            <Flame className="w-3 h-3" />
                            {formatScore(ev.intent_score)}
                          </span>
                        )}
                      </div>
                    </div>
                  </li>
                );
              })}
            </ul>
          </div>
        )}

        <div className="mt-4 text-[11px] text-slate-400 flex items-center gap-1">
          <Filter className="w-3 h-3" />
          Aggregated from funnel_events, your_agency_funnel_events, manage_funnel_events, owner_demo_events,
          agency_availability_requests, smartlead_link_events {autoRefresh && `· live (tick ${tick})`}
        </div>
      </div>

      {selectedAgency && (
        <AgencyQuickPanel
          agency={selectedAgency}
          onClose={() => setSelectedAgencyId(null)}
          onCopySmartlink={handleCopySmartlink}
          copiedId={copiedId}
        />
      )}
    </WpAdminLayout>
  );
}

function QuickActions({
  agencyId,
  slug,
  state,
  copyId,
  copiedId,
  onCopy,
}: {
  agencyId: string;
  slug: string | null | undefined;
  state: string | null | undefined;
  copyId: string;
  copiedId: string | null;
  onCopy: (id: string, slug: string | null, state: string | null) => void;
}) {
  const helperHref = agencyHelperHref(agencyId, state || null, slug || null);
  const funnelHref = funnelUrl(agencyId);
  const hasLink = !!slug;
  const copied = copiedId === copyId;
  return (
    <div className="flex items-center gap-1.5 flex-shrink-0">
      <a
        href={helperHref}
        onClick={(e) => e.stopPropagation()}
        className="inline-flex items-center gap-1 px-2.5 py-1.5 text-xs font-medium rounded-lg bg-slate-900 text-white hover:bg-slate-800"
        title="Open in Agency Helper"
      >
        <Rocket className="w-3.5 h-3.5" />
        <span className="hidden sm:inline">Helper</span>
      </a>
      <button
        type="button"
        disabled={!hasLink}
        onClick={(e) => {
          e.stopPropagation();
          if (hasLink) onCopy(copyId, slug ?? null, state ?? null);
        }}
        className={`inline-flex items-center gap-1 px-2.5 py-1.5 text-xs font-medium rounded-lg border ${
          copied
            ? 'bg-emerald-50 text-emerald-700 border-emerald-200'
            : hasLink
            ? 'bg-white text-slate-700 border-slate-300 hover:bg-slate-50'
            : 'bg-slate-50 text-slate-400 border-slate-200 cursor-not-allowed'
        }`}
        title={hasLink ? 'Copy public smartlink' : 'No slug available'}
      >
        <Copy className="w-3.5 h-3.5" />
        <span className="hidden sm:inline">{copied ? 'Copied' : 'Smartlink'}</span>
      </button>
      <a
        href={funnelHref}
        onClick={(e) => e.stopPropagation()}
        className="inline-flex items-center gap-1 px-2.5 py-1.5 text-xs font-medium rounded-lg border border-slate-300 bg-white text-slate-700 hover:bg-slate-50"
        title="View funnel"
      >
        <GitBranch className="w-3.5 h-3.5" />
        <span className="hidden sm:inline">Funnel</span>
      </a>
    </div>
  );
}

interface SelectedAgency {
  id: string;
  name: string | null;
  slug: string | null;
  state: string | null;
  stateName: string | null;
  score: number;
  score7d: number;
  eventCount7d: number;
  lastEvents: ActivityEvent[];
}

function AgencyQuickPanel({
  agency,
  onClose,
  onCopySmartlink,
  copiedId,
}: {
  agency: SelectedAgency;
  onClose: () => void;
  onCopySmartlink: (id: string, slug: string | null, state: string | null) => void;
  copiedId: string | null;
}) {
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose();
    };
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
  }, [onClose]);

  const emailLookupHref = agency.slug
    ? `/wp-admin/email/agency-lookup?agency=${encodeURIComponent(agency.slug)}${
        agency.state ? `&state=${encodeURIComponent(agency.state)}` : ''
      }`
    : '/wp-admin/email/agency-lookup';

  const profileHref = agency.slug && agency.state
    ? `/your-agency/${encodeURIComponent(agency.state)}/${encodeURIComponent(agency.slug)}`
    : null;

  const helperHref = agencyHelperHref(agency.id, agency.state);
  const funnelHref = funnelUrl(agency.id);

  return (
    <div className="fixed inset-0 z-50 flex">
      <div className="flex-1 bg-slate-900/40" onClick={onClose} aria-label="Close panel" />
      <aside className="w-full max-w-md bg-white border-l border-slate-200 shadow-2xl flex flex-col">
        <header className="px-5 py-4 border-b border-slate-200 flex items-start gap-3">
          <div className="flex-1 min-w-0">
            <p className="text-[11px] uppercase tracking-wider text-slate-400 font-semibold">Agency</p>
            <h3 className="text-lg font-semibold text-slate-900 truncate">
              {agency.name || agency.slug || 'Unknown agency'}
            </h3>
            <p className="text-xs text-slate-500 mt-0.5">
              {agency.stateName || (agency.state ? US_STATE_SLUG_TO_NAME[agency.state] : null) || 'Unknown state'}
            </p>
          </div>
          <button
            onClick={onClose}
            className="p-1.5 rounded-lg text-slate-400 hover:text-slate-700 hover:bg-slate-100"
            aria-label="Close"
          >
            <X className="w-5 h-5" />
          </button>
        </header>

        <div className="px-5 py-4 border-b border-slate-200 grid grid-cols-3 gap-3">
          <ScoreBlock label="Intent" value={formatScore(agency.score)} tone={scoreTone(agency.score)} />
          <ScoreBlock label="7d score" value={formatScore(agency.score7d)} tone="bg-blue-50 text-blue-700 border-blue-200" />
          <ScoreBlock
            label="7d events"
            value={String(agency.eventCount7d)}
            tone="bg-slate-50 text-slate-700 border-slate-200"
          />
        </div>

        <div className="px-5 py-3 border-b border-slate-200 grid grid-cols-3 gap-2">
          <a
            href={helperHref}
            className="inline-flex items-center justify-center gap-1.5 px-3 py-2 rounded-lg bg-slate-900 text-white text-xs font-medium hover:bg-slate-800"
          >
            <Rocket className="w-3.5 h-3.5" />
            Helper
          </a>
          <button
            onClick={() => onCopySmartlink(`panel-${agency.id}`, agency.slug, agency.state)}
            disabled={!agency.slug}
            className={`inline-flex items-center justify-center gap-1.5 px-3 py-2 rounded-lg border text-xs font-medium ${
              copiedId === `panel-${agency.id}`
                ? 'bg-emerald-50 text-emerald-700 border-emerald-200'
                : agency.slug
                ? 'bg-white text-slate-700 border-slate-300 hover:bg-slate-50'
                : 'bg-slate-50 text-slate-400 border-slate-200 cursor-not-allowed'
            }`}
          >
            <Copy className="w-3.5 h-3.5" />
            {copiedId === `panel-${agency.id}` ? 'Copied' : 'Smartlink'}
          </button>
          <a
            href={funnelHref}
            className="inline-flex items-center justify-center gap-1.5 px-3 py-2 rounded-lg border border-slate-300 bg-white text-slate-700 text-xs font-medium hover:bg-slate-50"
          >
            <GitBranch className="w-3.5 h-3.5" />
            Funnel
          </a>
        </div>

        <div className="flex-1 overflow-y-auto">
          <div className="px-5 py-3 text-[11px] uppercase tracking-wider text-slate-400 font-semibold">
            Last 5 actions
          </div>
          <ul className="divide-y divide-slate-100">
            {agency.lastEvents.map((ev) => {
              const Icon = STEP_ICONS[ev.funnel_step] || Activity;
              const groupStyle = GROUP_STYLES[ev.event_group] || GROUP_STYLES.view;
              return (
                <li key={ev.id} className="px-5 py-3 flex items-start gap-3">
                  <div
                    className={`flex-shrink-0 w-8 h-8 rounded-lg border flex items-center justify-center ${groupStyle}`}
                  >
                    {ev.event_group === 'negative' ? (
                      <XOctagon className="w-4 h-4" />
                    ) : (
                      <Icon className="w-4 h-4" />
                    )}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-slate-900 truncate">{ev.readable_label}</p>
                    <p className="text-[11px] text-slate-500 mt-0.5 font-mono truncate">{ev.event_name}</p>
                    <p className="text-[11px] text-slate-400 mt-0.5">
                      {ev.time_ago} · stage: {ev.funnel_stage}
                    </p>
                  </div>
                  {ev.intent_weight !== 0 && (
                    <span
                      className={`text-[11px] px-2 py-0.5 rounded-full border font-medium ${
                        ev.intent_weight < 0
                          ? 'bg-rose-50 text-rose-700 border-rose-200'
                          : ev.intent_weight >= 10
                          ? 'bg-emerald-50 text-emerald-700 border-emerald-200'
                          : 'bg-slate-50 text-slate-600 border-slate-200'
                      }`}
                    >
                      {ev.intent_weight > 0 ? `+${ev.intent_weight}` : ev.intent_weight}
                    </span>
                  )}
                </li>
              );
            })}
          </ul>
        </div>

        <footer className="px-5 py-4 border-t border-slate-200 space-y-2">
          <a
            href={emailLookupHref}
            className="w-full inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-lg bg-slate-900 text-white text-sm font-medium hover:bg-slate-800"
          >
            <Mail className="w-4 h-4" />
            Email lookup
          </a>
          {profileHref && (
            <a
              href={profileHref}
              target="_blank"
              rel="noreferrer"
              className="w-full inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-lg border border-slate-300 bg-white text-slate-700 text-sm font-medium hover:bg-slate-50"
            >
              <ExternalLink className="w-4 h-4" />
              Open agency profile
            </a>
          )}
        </footer>
      </aside>
    </div>
  );
}

function ScoreBlock({ label, value, tone }: { label: string; value: string; tone: string }) {
  return (
    <div className={`rounded-lg border px-3 py-2 ${tone}`}>
      <p className="text-[10px] uppercase tracking-wider opacity-80 font-semibold">{label}</p>
      <p className="text-base font-semibold mt-0.5">{value}</p>
    </div>
  );
}

function StatCard({
  label,
  value,
  sub,
  tone,
  icon: Icon,
  isMoney,
}: {
  label: string;
  value: number | string;
  sub?: string;
  tone: 'slate' | 'amber' | 'emerald' | 'orange' | 'blue' | 'rose';
  icon?: typeof Activity;
  isMoney?: boolean;
}) {
  const toneClasses: Record<string, string> = {
    slate: 'bg-white border-slate-200 text-slate-600',
    amber: 'bg-amber-50 border-amber-200 text-amber-700',
    emerald: 'bg-emerald-50 border-emerald-200 text-emerald-700',
    orange: 'bg-orange-50 border-orange-200 text-orange-700',
    blue: 'bg-blue-50 border-blue-200 text-blue-700',
    rose: 'bg-rose-50 border-rose-200 text-rose-700',
  };
  const displayValue = typeof value === 'number' ? value.toLocaleString() : value;
  const valueClass = isMoney
    ? 'text-lg md:text-xl font-semibold tracking-tight leading-none whitespace-nowrap text-slate-900'
    : 'text-2xl md:text-3xl font-semibold tracking-tight leading-tight whitespace-nowrap text-slate-900';
  return (
    <div className={`rounded-xl border p-3 h-full min-w-0 overflow-hidden flex flex-col justify-between ${toneClasses[tone]}`}>
      <p className="text-[10px] font-medium uppercase tracking-wide opacity-80 leading-tight break-words">
        {label}
      </p>
      <div className="flex items-center justify-between min-w-0 mt-1">
        <p className={valueClass} title={displayValue}>
          {displayValue}
        </p>
        {Icon && !isMoney && <Icon className="w-3.5 h-3.5 shrink-0 opacity-50 ml-1" />}
      </div>
      {sub && <p className="text-[10px] text-slate-500 mt-1 truncate">{sub}</p>}
    </div>
  );
}

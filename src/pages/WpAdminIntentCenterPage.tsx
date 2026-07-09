import { useMemo, useState } from 'react';
import { Flame, Copy, Check, ExternalLink, Search, RefreshCw, Target, Activity, TrendingUp, Clock, Shield, Bot } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { TrafficModeToggle, trafficModeToApiParam, type TrafficMode } from '../components/admin/TrafficModeToggle';
import { US_STATE_SLUG_TO_NAME } from '../lib/usStateSlugs';

interface IntentRow {
  agency_id: string;
  state_slug: string;
  activity_score: number;
  deepest_step: number;
  last_activity_at: string | null;
  checkout_opened_count: number;
  availability_submitted_count: number;
  upsell_viewed_count: number;
  profile_views: number;
  profile_clicks: number;
  repeat_visits: number;
  score_breakdown: Record<string, number> | null;
  agency_name: string | null;
  agency_slug: string | null;
  state_name: string | null;
  location: string | null;
  is_active: boolean | null;
  paid_override: boolean | null;
  website_url: string | null;
  replay_views_15m: number;
  replay_views_1h: number;
  replay_views_24h: number;
  availability_opens_24h: number;
  checkout_opens_24h: number;
  last_event_type: string | null;
  last_event_at: string | null;
  // Confidence fields
  scanner_session_count: number;
  possible_human_count: number;
  verified_human_count: number;
  human_activity_score: number | null;
}

interface ApiResponse {
  ok: boolean;
  count: number;
  rows: IntentRow[];
}

type StatusLabel = 'Cold' | 'Warm' | 'Hot' | 'Very Hot';
type SortMode = 'score' | 'recent' | 'hot_now';
type RecentWindow = 'any' | '15m' | '1h' | '24h';
type ConfidenceFilter = TrafficMode;

const SCORE_THRESHOLDS = {
  veryHot: 300,
  hot: 100,
  warm: 35,
} as const;

function classifyStatus(score: number): StatusLabel {
  if (score >= SCORE_THRESHOLDS.veryHot) return 'Very Hot';
  if (score >= SCORE_THRESHOLDS.hot) return 'Hot';
  if (score >= SCORE_THRESHOLDS.warm) return 'Warm';
  return 'Cold';
}

function statusStyles(label: StatusLabel): string {
  switch (label) {
    case 'Very Hot':
      return 'bg-rose-50 text-rose-700 border border-rose-200';
    case 'Hot':
      return 'bg-orange-50 text-orange-700 border border-orange-200';
    case 'Warm':
      return 'bg-amber-50 text-amber-700 border border-amber-200';
    default:
      return 'bg-slate-50 text-slate-600 border border-slate-200';
  }
}

function isHotNow(row: IntentRow, nowMs: number): boolean {
  if ((row.activity_score ?? 0) < SCORE_THRESHOLDS.hot) return false;
  if (!row.last_activity_at) return false;
  const t = new Date(row.last_activity_at).getTime();
  if (!Number.isFinite(t)) return false;
  return nowMs - t <= 15 * 60 * 1000;
}

function isWithinWindow(row: IntentRow, windowKey: RecentWindow, nowMs: number): boolean {
  if (windowKey === 'any') return true;
  const t = row.last_activity_at ? new Date(row.last_activity_at).getTime() : 0;
  if (!t) return false;
  const delta = nowMs - t;
  if (windowKey === '15m') return delta <= 15 * 60 * 1000;
  if (windowKey === '1h') return delta <= 60 * 60 * 1000;
  if (windowKey === '24h') return delta <= 24 * 60 * 60 * 1000;
  return true;
}

function formatRelativeTime(iso: string | null, nowMs: number): string {
  if (!iso) return '—';
  const t = new Date(iso).getTime();
  if (!Number.isFinite(t)) return '—';
  const d = Math.max(0, nowMs - t);
  if (d < 60_000) return `${Math.floor(d / 1000)}s ago`;
  if (d < 3600_000) return `${Math.floor(d / 60_000)}m ago`;
  if (d < 86400_000) return `${Math.floor(d / 3600_000)}h ago`;
  return `${Math.floor(d / 86400_000)}d ago`;
}

function describeWhyHot(row: IntentRow): string {
  const parts: string[] = [];
  if (row.replay_views_15m > 0) parts.push(`${row.replay_views_15m} replay view${row.replay_views_15m > 1 ? 's' : ''} in last 15m`);
  else if (row.replay_views_1h > 0) parts.push(`${row.replay_views_1h} replay view${row.replay_views_1h > 1 ? 's' : ''} in last hour`);
  else if (row.replay_views_24h > 0) parts.push(`${row.replay_views_24h} replay view${row.replay_views_24h > 1 ? 's' : ''} today`);
  if (row.availability_opens_24h > 0) parts.push(`${row.availability_opens_24h} availability open${row.availability_opens_24h > 1 ? 's' : ''}`);
  if (row.checkout_opens_24h > 0) parts.push(`${row.checkout_opens_24h} checkout open${row.checkout_opens_24h > 1 ? 's' : ''}`);
  if (row.repeat_visits > 0) parts.push(`${row.repeat_visits} repeat visit${row.repeat_visits > 1 ? 's' : ''}`);
  if (row.deepest_step && row.deepest_step > 0) parts.push(`reached step ${row.deepest_step}`);
  if (!parts.length) return 'No recent signals';
  return parts.slice(0, 3).join(', ');
}

function getConfidenceSummary(row: IntentRow): { label: string; tone: 'scanner' | 'possible' | 'verified' | 'unknown' } | null {
  const total = (row.scanner_session_count ?? 0) + (row.possible_human_count ?? 0) + (row.verified_human_count ?? 0);
  if (!total) return null;
  const verified = row.verified_human_count ?? 0;
  const scanner = row.scanner_session_count ?? 0;
  const possible = row.possible_human_count ?? 0;
  if (verified > 0) {
    const pct = Math.round((verified / total) * 100);
    return { label: `${pct}% verified`, tone: 'verified' };
  }
  if (scanner > 0 && possible === 0 && verified === 0) {
    return { label: 'Scanner only', tone: 'scanner' };
  }
  if (possible > 0) {
    return { label: 'Possible human', tone: 'possible' };
  }
  return null;
}

function ConfidenceBadge({ row }: { row: IntentRow }) {
  const summary = getConfidenceSummary(row);
  if (!summary) return null;
  const total = (row.scanner_session_count ?? 0) + (row.possible_human_count ?? 0) + (row.verified_human_count ?? 0);
  const styles: Record<string, string> = {
    verified: 'bg-emerald-50 text-emerald-700 border border-emerald-200',
    possible: 'bg-amber-50 text-amber-700 border border-amber-200',
    scanner: 'bg-slate-100 text-slate-500 border border-slate-200',
    unknown: 'bg-slate-100 text-slate-500 border border-slate-200',
  };
  const Icon = summary.tone === 'verified' ? Shield : summary.tone === 'scanner' ? Bot : HelpCircle;
  return (
    <div className={`inline-flex items-center gap-1 px-1.5 py-0.5 text-[10px] font-medium rounded ${styles[summary.tone]}`}>
      <Icon className="w-2.5 h-2.5" />
      {summary.label}
      <span className="opacity-60">({total})</span>
    </div>
  );
}

function buildReplayLink(row: IntentRow): string {
  const origin = typeof window !== 'undefined' ? window.location.origin : '';
  const slug = row.agency_slug || row.agency_id;
  const state = row.state_slug;
  if (!slug) return origin;
  const qs = state ? `?state=${encodeURIComponent(state)}` : '';
  return `${origin}/request-replay/${encodeURIComponent(slug)}${qs}`;
}

function buildDossierLink(row: IntentRow): string {
  const state = row.state_slug;
  const slug = row.agency_slug;
  if (state && slug) return `/marketing-agencies-in-${state}-united-states/${slug}/`;
  return `/wp-admin/availability-analytics/agency/${row.agency_id}`;
}

function buildFollowUpMessage(row: IntentRow): string {
  const name = row.agency_name || 'there';
  const stateName = row.state_name || US_STATE_SLUG_TO_NAME[row.state_slug] || row.state_slug;
  const lines: string[] = [];
  lines.push(`Hi ${name} team,`);
  lines.push('');

  if (row.checkout_opens_24h > 0) {
    lines.push(`Noticed you reviewed the upgrade options for your ${stateName} listing recently but didn't complete checkout.`);
    lines.push(`Happy to walk you through the plans or answer any questions before you lock in your spot.`);
  } else if (row.availability_opens_24h > 0) {
    lines.push(`Saw a lead open the availability form for your ${stateName} listing in the last day.`);
    lines.push(`Wanted to make sure you got the request and to share how warm this lead looks based on our tracking.`);
  } else if (row.replay_views_24h > 0) {
    lines.push(`You've been back to your ${stateName} listing replay page ${row.replay_views_24h} time${row.replay_views_24h > 1 ? 's' : ''} recently.`);
    lines.push(`If you want, I can walk you through what the traffic is doing and the fastest way to turn it into booked calls.`);
  } else if (row.profile_clicks > 0 || row.profile_views > 5) {
    lines.push(`Your ${stateName} profile has been getting steady attention — ${row.profile_views} views and ${row.profile_clicks} outbound clicks.`);
    lines.push(`Worth a quick 10-min chat to make sure it's converting the visits you're already getting.`);
  } else {
    lines.push(`Wanted to share a quick performance update on your ${stateName} listing.`);
    lines.push(`Let me know if it's a good time to walk through the numbers together.`);
  }

  lines.push('');
  lines.push('— Gappsy Team');
  return lines.join('\n');
}

function SummaryCard({
  label,
  value,
  icon: Icon,
  tone,
}: {
  label: string;
  value: number | string;
  icon: typeof Flame;
  tone: 'slate' | 'amber' | 'orange' | 'rose' | 'emerald';
}) {
  const toneClasses: Record<string, string> = {
    slate: 'bg-white border-slate-200 text-slate-600',
    amber: 'bg-amber-50 border-amber-200 text-amber-700',
    orange: 'bg-orange-50 border-orange-200 text-orange-700',
    rose: 'bg-rose-50 border-rose-200 text-rose-700',
    emerald: 'bg-emerald-50 border-emerald-200 text-emerald-700',
  };
  return (
    <div className={`rounded-xl border p-4 ${toneClasses[tone]}`}>
      <div className="flex items-center justify-between">
        <p className="text-xs font-medium uppercase tracking-wider opacity-80">{label}</p>
        <Icon className="w-4 h-4 opacity-70" />
      </div>
      <p className="text-2xl font-semibold mt-2 text-slate-900">{value}</p>
    </div>
  );
}

export default function WpAdminIntentCenterPage() {
  const [stateFilter, setStateFilter] = useState<string>('');
  const [statusFilter, setStatusFilter] = useState<StatusLabel | 'All'>('All');
  const [hotNowOnly, setHotNowOnly] = useState(false);
  const [recentWindow, setRecentWindow] = useState<RecentWindow>('any');
  const [search, setSearch] = useState('');
  const [sort, setSort] = useState<SortMode>('hot_now');
  const [confidenceFilter, setConfidenceFilter] = useState<ConfidenceFilter>('all');
  const [copied, setCopied] = useState<string | null>(null);

  const functionPath = useMemo(() => {
    const params = new URLSearchParams();
    if (stateFilter) params.set('state', stateFilter);
    params.set('limit', '300');
    const cfParam = trafficModeToApiParam(confidenceFilter);
    if (cfParam) params.set('confidence_filter', cfParam);
    const qs = params.toString();
    return `admin-intent-center${qs ? `?${qs}` : ''}`;
  }, [stateFilter, confidenceFilter]);

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ApiResponse>(functionPath, {
    deps: [stateFilter, confidenceFilter],
  });

  const nowMs = Date.now();
  const rows = data?.rows ?? [];

  const summary = useMemo(() => {
    let hot = 0;
    let veryHot = 0;
    let hotNow = 0;
    let active24 = 0;
    let totalScanner = 0;
    let totalVerified = 0;
    for (const r of rows) {
      const label = classifyStatus(r.activity_score ?? 0);
      if (label === 'Hot') hot++;
      if (label === 'Very Hot') veryHot++;
      if (isHotNow(r, nowMs)) hotNow++;
      if (isWithinWindow(r, '24h', nowMs)) active24++;
      totalScanner += r.scanner_session_count ?? 0;
      totalVerified += r.verified_human_count ?? 0;
    }
    return { total: rows.length, hot, veryHot, hotNow, active24, totalScanner, totalVerified };
  }, [rows, nowMs]);

  const filtered = useMemo(() => {
    const q = search.trim().toLowerCase();
    let list = rows.filter((r) => {
      if (statusFilter !== 'All' && classifyStatus(r.activity_score ?? 0) !== statusFilter) return false;
      if (hotNowOnly && !isHotNow(r, nowMs)) return false;
      if (!isWithinWindow(r, recentWindow, nowMs)) return false;
      if (q) {
        const hay = `${r.agency_name || ''} ${r.agency_slug || ''} ${r.location || ''}`.toLowerCase();
        if (!hay.includes(q)) return false;
      }
      return true;
    });

    list = [...list].sort((a, b) => {
      if (sort === 'hot_now') {
        const aHot = isHotNow(a, nowMs) ? 1 : 0;
        const bHot = isHotNow(b, nowMs) ? 1 : 0;
        if (aHot !== bHot) return bHot - aHot;
        return (b.activity_score ?? 0) - (a.activity_score ?? 0);
      }
      if (sort === 'recent') {
        const at = a.last_activity_at ? new Date(a.last_activity_at).getTime() : 0;
        const bt = b.last_activity_at ? new Date(b.last_activity_at).getTime() : 0;
        return bt - at;
      }
      return (b.activity_score ?? 0) - (a.activity_score ?? 0);
    });

    return list;
  }, [rows, search, statusFilter, hotNowOnly, recentWindow, sort, nowMs]);

  const copy = async (key: string, text: string) => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(key);
      setTimeout(() => setCopied((k) => (k === key ? null : k)), 1500);
    } catch {
      /* ignore */
    }
  };

  const stateOptions = useMemo(() => {
    const entries = Object.entries(US_STATE_SLUG_TO_NAME).sort((a, b) => a[1].localeCompare(b[1]));
    return entries;
  }, []);

  return (
    <WpAdminLayout
      title="Intent Center"
      subtitle="Hot agencies right now — intent scores, recent activity, and follow-up helpers"
    >
      <div className="space-y-6">
        <div className="grid grid-cols-2 md:grid-cols-7 gap-3">
          <SummaryCard label="Agencies tracked" value={summary.total} icon={Target} tone="slate" />
          <SummaryCard label="Hot" value={summary.hot} icon={TrendingUp} tone="orange" />
          <SummaryCard label="Very Hot" value={summary.veryHot} icon={Flame} tone="rose" />
          <SummaryCard label="HOT NOW" value={summary.hotNow} icon={Flame} tone="rose" />
          <SummaryCard label="Active last 24h" value={summary.active24} icon={Activity} tone="emerald" />
          <SummaryCard label="Verified sessions" value={summary.totalVerified} icon={Shield} tone="emerald" />
          <SummaryCard label="Scanner sessions" value={summary.totalScanner} icon={Bot} tone="slate" />
        </div>

        <TrafficModeToggle value={confidenceFilter} onChange={setConfidenceFilter} />

        <div className="bg-white border border-slate-200 rounded-xl p-4 shadow-sm">
          <div className="grid grid-cols-1 md:grid-cols-12 gap-3">
            <div className="md:col-span-4 relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
              <input
                type="text"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                placeholder="Search by agency name, slug, or location"
                className="w-full pl-9 pr-3 py-2 text-sm border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-slate-300"
              />
            </div>
            <div className="md:col-span-2">
              <select
                value={stateFilter}
                onChange={(e) => setStateFilter(e.target.value)}
                className="w-full px-3 py-2 text-sm border border-slate-200 rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-slate-300"
              >
                <option value="">All states</option>
                {stateOptions.map(([slug, name]) => (
                  <option key={slug} value={slug}>{name}</option>
                ))}
              </select>
            </div>
            <div className="md:col-span-2">
              <select
                value={statusFilter}
                onChange={(e) => setStatusFilter(e.target.value as StatusLabel | 'All')}
                className="w-full px-3 py-2 text-sm border border-slate-200 rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-slate-300"
              >
                <option value="All">All statuses</option>
                <option value="Very Hot">Very Hot (300+)</option>
                <option value="Hot">Hot (100-299)</option>
                <option value="Warm">Warm (35-99)</option>
                <option value="Cold">Cold (0-34)</option>
              </select>
            </div>
            <div className="md:col-span-2">
              <select
                value={recentWindow}
                onChange={(e) => setRecentWindow(e.target.value as RecentWindow)}
                className="w-full px-3 py-2 text-sm border border-slate-200 rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-slate-300"
              >
                <option value="any">Any time</option>
                <option value="15m">Last 15 min</option>
                <option value="1h">Last hour</option>
                <option value="24h">Last 24h</option>
              </select>
            </div>
            <div className="md:col-span-2">
              <select
                value={sort}
                onChange={(e) => setSort(e.target.value as SortMode)}
                className="w-full px-3 py-2 text-sm border border-slate-200 rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-slate-300"
              >
                <option value="hot_now">HOT NOW first</option>
                <option value="score">Highest score</option>
                <option value="recent">Most recent</option>
              </select>
            </div>
          </div>
          <div className="flex items-center justify-between mt-3">
            <label className="inline-flex items-center gap-2 text-sm text-slate-700 cursor-pointer">
              <input
                type="checkbox"
                checked={hotNowOnly}
                onChange={(e) => setHotNowOnly(e.target.checked)}
                className="rounded border-slate-300"
              />
              <Flame className="w-4 h-4 text-rose-500" />
              <span>HOT NOW only (score &ge; 100 + activity in last 15 min)</span>
            </label>
            <button
              onClick={() => refetch()}
              className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm font-medium bg-white border border-slate-200 rounded-lg hover:bg-slate-50 transition-colors"
            >
              <RefreshCw className="w-3.5 h-3.5" />
              Refresh
            </button>
          </div>
        </div>

        {isError && error && (
          <AdminErrorBanner error={error} onRetry={() => refetch()} />
        )}

        {isLoading ? (
          <AdminLoadingState message="Loading intent signals..." />
        ) : filtered.length === 0 ? (
          <AdminEmptyState
            title="No agencies match"
            message="Try widening your filters or selecting a different state."
            icon={Target}
          />
        ) : (
          <div className="bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm">
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead className="bg-slate-50 border-b border-slate-200">
                  <tr className="text-left text-xs font-semibold text-slate-600 uppercase tracking-wider">
                    <th className="px-4 py-3">Agency</th>
                    <th className="px-4 py-3">State</th>
                    <th className="px-4 py-3">Score</th>
                    <th className="px-4 py-3">Status</th>
                    <th className="px-4 py-3">Confidence</th>
                    <th className="px-4 py-3">Last activity</th>
                    <th className="px-4 py-3">Recent signals</th>
                    <th className="px-4 py-3">Why hot</th>
                    <th className="px-4 py-3 text-right">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100">
                  {filtered.map((row) => {
                    const label = classifyStatus(row.activity_score ?? 0);
                    const hot = isHotNow(row, nowMs);
                    const keyBase = `${row.agency_id}-${row.state_slug}`;
                    const replayLink = buildReplayLink(row);
                    const dossierLink = buildDossierLink(row);
                    const followUp = buildFollowUpMessage(row);
                    return (
                      <tr key={keyBase} className="hover:bg-slate-50/60">
                        <td className="px-4 py-3">
                          <div className="flex items-start gap-2">
                            {hot && (
                              <span className="inline-flex items-center gap-1 px-1.5 py-0.5 text-[10px] font-bold uppercase tracking-wider bg-rose-600 text-white rounded mt-0.5">
                                <Flame className="w-3 h-3" /> Hot now
                              </span>
                            )}
                            <div>
                              <div className="font-medium text-slate-900">{row.agency_name || '(unknown)'}</div>
                              {row.location && <div className="text-xs text-slate-500">{row.location}</div>}
                            </div>
                          </div>
                        </td>
                        <td className="px-4 py-3 text-slate-700">
                          {row.state_name || US_STATE_SLUG_TO_NAME[row.state_slug] || row.state_slug}
                        </td>
                        <td className="px-4 py-3 font-semibold text-slate-900">{Math.round(row.activity_score ?? 0)}</td>
                        <td className="px-4 py-3">
                          <span className={`inline-flex items-center px-2 py-0.5 text-xs font-medium rounded-full ${statusStyles(label)}`}>
                            {label}
                          </span>
                        </td>
                        <td className="px-4 py-3">
                          <div className="flex flex-col gap-0.5">
                            <ConfidenceBadge row={row} />
                            {(row.scanner_session_count > 0 || row.possible_human_count > 0 || row.verified_human_count > 0) && (
                              <div className="text-[10px] text-slate-400 mt-0.5">
                                <span className="text-slate-500">{row.verified_human_count}v</span>
                                {' · '}
                                <span className="text-amber-600">{row.possible_human_count}p</span>
                                {' · '}
                                <span className="text-slate-400">{row.scanner_session_count}s</span>
                              </div>
                            )}
                          </div>
                        </td>
                        <td className="px-4 py-3 text-slate-600">
                          <div className="inline-flex items-center gap-1">
                            <Clock className="w-3.5 h-3.5 text-slate-400" />
                            {formatRelativeTime(row.last_activity_at, nowMs)}
                          </div>
                          {row.last_event_type && (
                            <div className="text-[11px] text-slate-400 mt-0.5">{row.last_event_type}</div>
                          )}
                        </td>
                        <td className="px-4 py-3 text-xs text-slate-600">
                          <div className="flex flex-col gap-0.5">
                            <span>Replays: {row.replay_views_15m}/15m · {row.replay_views_1h}/1h · {row.replay_views_24h}/24h</span>
                            <span>Avail. opens: {row.availability_opens_24h}/24h</span>
                            <span>Checkout opens: {row.checkout_opens_24h}/24h</span>
                          </div>
                        </td>
                        <td className="px-4 py-3 text-xs text-slate-600 max-w-xs">{describeWhyHot(row)}</td>
                        <td className="px-4 py-3">
                          <div className="flex items-center justify-end gap-1">
                            <button
                              title="Copy replay link"
                              onClick={() => copy(`${keyBase}-rl`, replayLink)}
                              className="inline-flex items-center gap-1 px-2 py-1 text-xs bg-slate-100 hover:bg-slate-200 text-slate-700 rounded transition-colors"
                            >
                              {copied === `${keyBase}-rl` ? <Check className="w-3 h-3 text-emerald-600" /> : <Copy className="w-3 h-3" />}
                              Link
                            </button>
                            <button
                              title="Copy follow-up message"
                              onClick={() => copy(`${keyBase}-fu`, followUp)}
                              className="inline-flex items-center gap-1 px-2 py-1 text-xs bg-slate-100 hover:bg-slate-200 text-slate-700 rounded transition-colors"
                            >
                              {copied === `${keyBase}-fu` ? <Check className="w-3 h-3 text-emerald-600" /> : <Copy className="w-3 h-3" />}
                              Follow-up
                            </button>
                            <a
                              title="Open dossier"
                              href={dossierLink}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="inline-flex items-center gap-1 px-2 py-1 text-xs bg-slate-800 hover:bg-slate-700 text-white rounded transition-colors"
                            >
                              <ExternalLink className="w-3 h-3" />
                              Open
                            </a>
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}

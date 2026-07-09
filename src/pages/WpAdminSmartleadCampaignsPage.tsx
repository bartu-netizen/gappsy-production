import { useState, useEffect, useMemo, useRef, useCallback } from 'react';
import {
  AlertCircle, Search, Loader, CheckCircle, Pause, Play, RefreshCw,
  ChevronRight, BarChart2, X, TrendingUp, ArrowUpRight, Users, Mail,
  AlertTriangle, Clock, Info, Building2, MoreHorizontal, LogIn,
} from 'lucide-react';
import EmailModuleLayout from '../components/wpadmin/EmailModuleLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import AdminReAuthCard from '../components/admin/AdminReAuthCard';
import { adminApiFetch, type AdminApiError } from '../lib/adminApiFetch';
import { AdminErrorBanner } from '../components/admin/AdminErrorBanner';

// ─── Types ────────────────────────────────────────────────────────────────────

interface Campaign {
  campaign_id: string;
  name: string;
  status: string;
  created_at?: string;
  updated_at?: string;
  lead_count?: number;
  mailbox_count?: number;
  provider_sent?: number;
  provider_opened?: number;
  provider_replied?: number;
  provider_positive_reply?: number;
  provider_bounced?: number;
  provider_sender_bounced?: number;
  provider_leads_total?: number;
  provider_stats_source?: string;
}

interface RowMetrics {
  loading: boolean;
  error?: string;
  // Live from Smartlead
  sent?: number;
  opened?: number;
  replied?: number;
  bounced?: number;
  // Local overlay
  unique_agencies_contacted?: number;
  reply_rate_agency_level?: number | null;
}

interface CampaignStatRow {
  total_sent: number;
  total_opened: number;
  total_replied: number;
  unique_agencies_contacted: number;
  unique_agencies_opened: number;
  unique_agencies_replied: number;
  computed_at: string;
}

interface LiveStats {
  available: boolean;
  status?: string;
  leads_total?: number;
  sent?: number;
  delivered?: number;
  opens?: number;
  clicks?: number;
  replies?: number;
  bounces?: number;
  unsubscribed?: number;
  positive_reply?: number;
  sender_bounced?: number;
  provider_last_updated_at?: string | null;
  raw_keys?: string[];
  extraction_notes?: string[];
  warnings?: string[];
}

interface LocalOverlayStats {
  available: boolean;
  state?: string;
  synced_rows?: number;
  unique_emails_contacted?: number;
  unique_agencies_contacted?: number;
  unique_emails_opened?: number;
  unique_agencies_opened?: number;
  unique_emails_replied?: number;
  unique_agencies_replied?: number;
  unique_emails_bounced?: number;
  unique_agencies_bounced?: number;
  unique_emails_unsubscribed?: number;
  unique_agencies_unsubscribed?: number;
  total_open_events?: number;
  total_click_events?: number;
  total_reply_events?: number;
  total_bounce_events?: number;
  total_unsubscribe_events?: number;
  avg_emails_per_agency?: number | null;
  open_rate_email_level?: number | null;
  reply_rate_email_level?: number | null;
  bounce_rate_email_level?: number | null;
  open_rate_agency_level?: number | null;
  reply_rate_agency_level?: number | null;
  bounce_rate_agency_level?: number | null;
}

interface CampaignStats {
  ok: boolean;
  campaign_id: string;
  live: LiveStats;
  local_overlay: LocalOverlayStats;
  merged_notes?: string[];
}

type StatusFilter = 'all' | 'active' | 'paused' | 'completed' | 'draft';

// ─── Helpers ──────────────────────────────────────────────────────────────────

function fmt(n: number | undefined | null): string {
  if (n == null) return '—';
  if (n >= 1_000_000) return (n / 1_000_000).toFixed(1) + 'M';
  if (n >= 1000) return (n / 1000).toFixed(1) + 'k';
  return String(n);
}

function fmtPct(n: number | undefined | null): string {
  if (n == null) return '—';
  return n.toFixed(1) + '%';
}

function formatDate(dateStr?: string | null): string {
  if (!dateStr) return '—';
  try {
    return new Date(dateStr).toLocaleDateString('en-US', {
      month: 'short', day: 'numeric', year: 'numeric',
      hour: '2-digit', minute: '2-digit',
    });
  } catch { return '—'; }
}

function formatDateShort(dateStr?: string): string {
  if (!dateStr) return '—';
  try {
    return new Date(dateStr).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
  } catch { return '—'; }
}

// ─── Sub-components ───────────────────────────────────────────────────────────

function StatusBadge({ status }: { status: string }) {
  const map: Record<string, { dot: string; text: string; bg: string }> = {
    active:    { dot: 'bg-emerald-500', text: 'text-emerald-700', bg: 'bg-emerald-50 border-emerald-200' },
    paused:    { dot: 'bg-amber-400',   text: 'text-amber-700',   bg: 'bg-amber-50 border-amber-200' },
    completed: { dot: 'bg-blue-500',    text: 'text-blue-700',    bg: 'bg-blue-50 border-blue-200' },
    draft:     { dot: 'bg-slate-400',   text: 'text-slate-600',   bg: 'bg-slate-100 border-slate-200' },
  };
  const s = map[status?.toLowerCase()] ?? map.draft;
  return (
    <span className={`inline-flex items-center gap-1.5 px-2 py-0.5 rounded-full border text-xs font-medium ${s.bg} ${s.text}`}>
      <span className={`w-1.5 h-1.5 rounded-full ${s.dot}`} />
      {status ?? 'unknown'}
    </span>
  );
}

function RowMetricCell({
  value, rate, accent, loading,
}: {
  value: number | undefined | null;
  rate?: number | null;
  accent?: string;
  loading?: boolean;
}) {
  return (
    <div className="flex flex-col min-w-0 w-16">
      {loading ? (
        <span className="h-4 w-10 rounded bg-slate-200 animate-pulse inline-block" />
      ) : (
        <>
          <span className={`text-sm font-semibold leading-none ${accent ?? 'text-slate-800'}`}>
            {value == null ? <span className="text-slate-300">—</span> : fmt(value)}
          </span>
          {rate != null && (
            <span className="text-[10px] text-slate-400 mt-0.5">{fmtPct(rate)}</span>
          )}
        </>
      )}
    </div>
  );
}

function SkeletonRow() {
  return (
    <div className="flex items-center gap-4 px-5 py-3.5 animate-pulse">
      <div className="w-9 h-9 rounded-full bg-slate-200 flex-shrink-0" />
      <div className="flex-1 min-w-0 space-y-1.5">
        <div className="h-3.5 bg-slate-200 rounded w-48" />
        <div className="h-2.5 bg-slate-100 rounded w-32" />
      </div>
      <div className="hidden md:flex items-center gap-5">
        {[...Array(6)].map((_, i) => (
          <div key={i} className="w-16 space-y-1">
            <div className="h-3 bg-slate-200 rounded w-10" />
            <div className="h-2 bg-slate-100 rounded w-8" />
          </div>
        ))}
      </div>
      <div className="w-4 h-4 bg-slate-100 rounded" />
    </div>
  );
}

function pct(num: number, den: number): string {
  if (!den || !num) return '';
  return ` (${((num / den) * 100).toFixed(1)}%)`;
}

function CampaignAgencyStatsLine({ stats }: { stats: CampaignStatRow }) {
  const emailLine =
    `${fmt(stats.total_sent)} sent / ${fmt(stats.total_opened)} opened${pct(stats.total_opened, stats.total_sent)}`;
  const agencyLine =
    `${fmt(stats.unique_agencies_contacted)} contacted` +
    ` / ${fmt(stats.unique_agencies_opened)} opened${pct(stats.unique_agencies_opened, stats.unique_agencies_contacted)}` +
    ` / ${fmt(stats.unique_agencies_replied)} replied${pct(stats.unique_agencies_replied, stats.unique_agencies_contacted)}`;

  return (
    <div className="mt-1.5 flex flex-col gap-0.5">
      <div className="flex items-center gap-1.5 flex-wrap">
        <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-wide">Emails</span>
        <span className="text-[11px] text-slate-400">{emailLine}</span>
      </div>
      <div className="flex items-center gap-1.5 flex-wrap">
        <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-wide">Agencies</span>
        <span className="text-[11px] text-slate-500">{agencyLine}</span>
      </div>
    </div>
  );
}

function CampaignRow({
  campaign, metrics, precomputedStats, isSelected, onClick,
}: {
  campaign: Campaign;
  metrics: RowMetrics | undefined;
  precomputedStats?: CampaignStatRow;
  isSelected: boolean;
  onClick: () => void;
}) {
  const statusColorMap: Record<string, string> = {
    active: 'border-emerald-500 bg-emerald-50 text-emerald-700',
    paused: 'border-amber-400 bg-amber-50 text-amber-700',
    completed: 'border-blue-500 bg-blue-50 text-blue-700',
    draft: 'border-slate-300 bg-slate-100 text-slate-600',
  };
  const initials = campaign.name.split(/\s+/).slice(0, 2).map(w => w[0]).join('').toUpperCase();
  const ringColor = statusColorMap[campaign.status?.toLowerCase()] ?? statusColorMap.draft;

  const hasProviderStats = campaign.provider_sent !== undefined ||
                           campaign.provider_opened !== undefined ||
                           campaign.provider_replied !== undefined;
  const loading = hasProviderStats ? false : (metrics?.loading ?? true);

  const sent = metrics?.sent ?? campaign.provider_sent;
  const opened = metrics?.opened ?? campaign.provider_opened;
  const replied = metrics?.replied ?? campaign.provider_replied;
  const bounced = metrics?.bounced ?? campaign.provider_bounced;

  return (
    <div
      onClick={onClick}
      className={`group relative flex items-center gap-4 px-5 py-3.5 cursor-pointer transition-colors
        ${isSelected
          ? 'bg-blue-50/70 border-l-[3px] border-l-blue-500'
          : 'hover:bg-slate-50/80 border-l-[3px] border-l-transparent'}`}
    >
      <div className={`w-9 h-9 rounded-full border-2 flex items-center justify-center flex-shrink-0 text-[11px] font-bold ${ringColor}`}>
        {initials || '?'}
      </div>

      <div className="flex-1 min-w-0">
        <p className={`text-sm font-semibold truncate leading-tight ${isSelected ? 'text-blue-900' : 'text-slate-900'}`}>
          {campaign.name}
        </p>
        <div className="flex items-center gap-2 mt-0.5 flex-wrap">
          <StatusBadge status={campaign.status} />
          <span className="text-[11px] text-slate-400">{formatDateShort(campaign.created_at)}</span>
          {campaign.lead_count ? (
            <span className="text-[11px] text-slate-400">{campaign.lead_count.toLocaleString()} leads</span>
          ) : null}
        </div>
        {campaign.status?.toLowerCase() === 'active' && precomputedStats && (
          <CampaignAgencyStatsLine stats={precomputedStats} />
        )}
      </div>

      {/* 6 metric columns */}
      <div className="hidden md:flex items-center gap-4">
        {/* Sent */}
        <div className="w-16">
          <div className="text-[10px] uppercase tracking-wide text-slate-400 font-medium mb-0.5">Sent</div>
          <RowMetricCell value={sent} loading={loading} />
        </div>
        {/* Opened */}
        <div className="w-16">
          <div className="text-[10px] uppercase tracking-wide text-slate-400 font-medium mb-0.5">Opened</div>
          <RowMetricCell value={opened} rate={sent && opened ? (opened / sent) * 100 : null} loading={loading} />
        </div>
        {/* Replied */}
        <div className="w-16">
          <div className="text-[10px] uppercase tracking-wide text-slate-400 font-medium mb-0.5">Replied</div>
          <RowMetricCell value={replied} rate={sent && replied ? (replied / sent) * 100 : null} loading={loading} />
        </div>
        {/* Bounced */}
        <div className="w-16">
          <div className="text-[10px] uppercase tracking-wide text-slate-400 font-medium mb-0.5">Bounced</div>
          <RowMetricCell value={bounced} rate={sent && bounced ? (bounced / sent) * 100 : null} accent="text-red-500" loading={loading} />
        </div>
        {/* Agencies */}
        <div className="w-16">
          <div className="text-[10px] uppercase tracking-wide text-slate-400 font-medium mb-0.5">Agencies</div>
          <RowMetricCell value={metrics?.unique_agencies_contacted} loading={metrics?.loading ?? false} />
        </div>
        {/* Ag. Reply */}
        <div className="w-16">
          <div className="text-[10px] uppercase tracking-wide text-slate-400 font-medium mb-0.5">Ag. Reply</div>
          {metrics?.loading ? (
            <span className="h-4 w-10 rounded bg-slate-200 animate-pulse inline-block" />
          ) : (
            <span className={`text-sm font-semibold leading-none ${metrics?.reply_rate_agency_level != null ? 'text-emerald-700' : 'text-slate-300'}`}>
              {metrics?.reply_rate_agency_level != null ? fmtPct(metrics.reply_rate_agency_level) : '—'}
            </span>
          )}
        </div>
      </div>

      <ChevronRight className={`w-4 h-4 flex-shrink-0 transition-transform ${isSelected ? 'text-blue-500 rotate-90' : 'text-slate-300 group-hover:text-slate-500'}`} />
    </div>
  );
}

// ─── Detail panel metric card ─────────────────────────────────────────────────

function MetricCard({
  label, value, sub, accent = false, warn = false, unavailable = false,
}: {
  label: string;
  value: string;
  sub?: string;
  accent?: boolean;
  warn?: boolean;
  unavailable?: boolean;
}) {
  return (
    <div className={`rounded-xl border px-3 py-3 flex flex-col gap-0.5
      ${warn ? 'bg-amber-50 border-amber-200' : accent ? 'bg-blue-50 border-blue-200' : 'bg-white border-slate-100'}`}>
      <span className="text-[10px] uppercase tracking-wide text-slate-400 font-medium">{label}</span>
      <span className={`text-lg font-bold leading-none mt-0.5
        ${warn ? 'text-amber-800' : accent ? 'text-blue-900' : unavailable ? 'text-slate-300' : 'text-slate-900'}`}>
        {value}
      </span>
      {sub && <span className="text-[10px] text-slate-400 mt-0.5">{sub}</span>}
    </div>
  );
}

function SectionTitle({ icon, title, subtitle }: { icon: React.ReactNode; title: string; subtitle?: string }) {
  return (
    <div className="flex items-center gap-2 mb-3">
      <span className="flex-shrink-0">{icon}</span>
      <div>
        <p className="text-xs font-semibold text-slate-700 uppercase tracking-wide">{title}</p>
        {subtitle && <p className="text-[10px] text-slate-400">{subtitle}</p>}
      </div>
    </div>
  );
}

function CampaignDetailPanel({
  campaign, stats, loading, actionLoading, onAction, onClose, onRefresh,
}: {
  campaign: Campaign;
  stats: CampaignStats | null;
  loading: boolean;
  actionLoading: boolean;
  onAction: (action: 'start' | 'pause' | 'resume') => void;
  onClose: () => void;
  onRefresh: () => void;
}) {
  const live = stats?.live;
  const local = stats?.local_overlay;

  const inflatedWarning =
    local?.avg_emails_per_agency != null && local.avg_emails_per_agency > 1.5;

  const inflatedReplyWarning =
    local?.reply_rate_email_level != null &&
    local?.reply_rate_agency_level != null &&
    local.reply_rate_agency_level < local.reply_rate_email_level * 0.7;

  return (
    <div className="border-t-2 border-blue-100 bg-slate-50/40">
      {/* Panel header */}
      <div className="flex items-center justify-between px-5 py-3 border-b border-slate-100 bg-white">
        <div className="flex items-center gap-3 min-w-0">
          <BarChart2 className="w-4 h-4 text-blue-500 flex-shrink-0" />
          <div className="min-w-0">
            <p className="text-sm font-semibold text-slate-900 truncate max-w-xs">{campaign.name}</p>
            <p className="text-[11px] text-slate-400">ID: {campaign.campaign_id}</p>
          </div>
          <StatusBadge status={campaign.status} />
        </div>
        <div className="flex items-center gap-2 flex-shrink-0">
          <button
            onClick={() => onAction('start')}
            disabled={actionLoading || campaign.status === 'active'}
            className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium rounded-lg bg-emerald-600 text-white hover:bg-emerald-700 disabled:opacity-40 transition-colors"
          >
            <Play className="w-3 h-3" /> Start
          </button>
          <button
            onClick={() => onAction('pause')}
            disabled={actionLoading || campaign.status === 'paused'}
            className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium rounded-lg bg-amber-500 text-white hover:bg-amber-600 disabled:opacity-40 transition-colors"
          >
            <Pause className="w-3 h-3" /> Pause
          </button>
          <button
            onClick={() => onAction('resume')}
            disabled={actionLoading}
            className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium rounded-lg bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-40 transition-colors"
          >
            <RefreshCw className="w-3 h-3" /> Resume
          </button>
          <button
            onClick={onRefresh}
            disabled={loading}
            className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 bg-white text-slate-600 hover:bg-slate-50 disabled:opacity-40 transition-colors"
          >
            {loading ? <Loader className="w-3 h-3 animate-spin" /> : <RefreshCw className="w-3 h-3" />}
            Refresh
          </button>
          <button onClick={onClose} className="p-1.5 rounded-lg hover:bg-slate-200 text-slate-400 hover:text-slate-700 transition-colors ml-1">
            <X className="w-4 h-4" />
          </button>
        </div>
      </div>

      {loading ? (
        <div className="flex items-center justify-center py-12 gap-2">
          <Loader className="w-5 h-5 animate-spin text-blue-500" />
          <span className="text-sm text-slate-500">Loading stats…</span>
        </div>
      ) : !stats ? (
        <div className="flex flex-col items-center gap-2 py-12">
          <AlertCircle className="w-8 h-8 text-slate-300" />
          <p className="text-sm text-slate-400">No stats available</p>
        </div>
      ) : (
        <div className="px-5 py-5 space-y-6">

          {/* SECTION A — Smartlead Live */}
          <div>
            <SectionTitle
              icon={<ArrowUpRight className="w-3.5 h-3.5 text-blue-500" />}
              title="Smartlead Live"
              subtitle={live?.status ? `Source: ${live.status}` : "Provider-side totals from Smartlead API"}
            />
            {!live?.available ? (
              <div className="space-y-2">
                <div className="flex items-start gap-2 bg-amber-50 border border-amber-200 rounded-xl px-4 py-3">
                  <AlertTriangle className="w-4 h-4 text-amber-500 flex-shrink-0 mt-0.5" />
                  <div className="flex-1 min-w-0">
                    <p className="text-sm text-amber-800 font-medium">Live stats unavailable</p>
                    {live?.raw_keys && live.raw_keys.length > 0 && (
                      <p className="text-xs text-amber-700 mt-1">
                        Smartlead returned {live.raw_keys.length} fields, but none matched known metric names.
                        This may indicate a Smartlead API schema change.
                      </p>
                    )}
                    {live?.warnings?.map((w, i) => (
                      <p key={i} className="text-xs text-amber-600 mt-1">{w}</p>
                    ))}
                  </div>
                </div>
                {live?.raw_keys && live.raw_keys.length > 0 && (
                  <details className="bg-slate-50 border border-slate-200 rounded-lg px-3 py-2">
                    <summary className="text-xs text-slate-500 cursor-pointer hover:text-slate-700">
                      Debug: Show raw response keys ({live.raw_keys.length} keys)
                    </summary>
                    <pre className="text-[10px] text-slate-400 mt-2 overflow-x-auto whitespace-pre-wrap max-h-32">
                      {live.raw_keys.join(", ")}
                    </pre>
                  </details>
                )}
              </div>
            ) : (
              <>
                <div className="grid grid-cols-4 sm:grid-cols-5 lg:grid-cols-10 gap-px bg-slate-200 rounded-xl overflow-hidden border border-slate-200 shadow-sm">
                  {([
                    { label: 'Leads',    value: fmt(live.leads_total) },
                    { label: 'Sent',     value: fmt(live.sent) },
                    { label: 'Delivered',value: fmt(live.delivered) },
                    { label: 'Opened',   value: fmt(live.opens),  sub: live.sent ? fmtPct((live.opens ?? 0) / live.sent * 100) : undefined },
                    { label: 'Clicked',  value: fmt(live.clicks), sub: live.sent ? fmtPct((live.clicks ?? 0) / live.sent * 100) : undefined },
                    { label: 'Replied',  value: fmt(live.replies), sub: live.sent ? fmtPct((live.replies ?? 0) / live.sent * 100) : undefined },
                    { label: 'Positive', value: fmt(live.positive_reply), sub: live.replies ? fmtPct((live.positive_reply ?? 0) / live.replies * 100) : undefined },
                    { label: 'Bounced',  value: fmt(live.bounces), sub: live.sent ? fmtPct((live.bounces ?? 0) / live.sent * 100) : undefined },
                    { label: 'Sender Bnc', value: fmt(live.sender_bounced) },
                    { label: 'Unsub',    value: fmt(live.unsubscribed) },
                  ] as { label: string; value: string; sub?: string }[]).map(({ label, value, sub }) => (
                    <div key={label} className="bg-white px-3 py-3 flex flex-col">
                      <span className="text-[10px] text-slate-400 uppercase tracking-wide font-medium mb-1">{label}</span>
                      <span className="text-base font-bold text-slate-900 leading-none">{value}</span>
                      {sub && <span className="text-[10px] text-slate-400 mt-1">{sub}</span>}
                    </div>
                  ))}
                </div>
                <div className="flex items-center gap-4 mt-2 flex-wrap">
                  {live.provider_last_updated_at && (
                    <div className="flex items-center gap-1.5">
                      <Clock className="w-3 h-3 text-slate-400" />
                      <span className="text-[11px] text-slate-400">
                        Last provider update: {formatDate(live.provider_last_updated_at)}
                      </span>
                    </div>
                  )}
                  {live.status && (
                    <span className="text-[11px] text-slate-400 bg-slate-100 px-2 py-0.5 rounded">
                      Source: {live.status}
                    </span>
                  )}
                </div>
                {live.warnings && live.warnings.length > 0 && (
                  <div className="mt-2 space-y-1">
                    {live.warnings.map((w, i) => (
                      <div key={i} className="flex items-start gap-1.5">
                        <Info className="w-3 h-3 text-slate-400 flex-shrink-0 mt-0.5" />
                        <span className="text-[11px] text-slate-400">{w}</span>
                      </div>
                    ))}
                  </div>
                )}
              </>
            )}
          </div>

          {/* SECTION B — Unique Email Metrics */}
          {local?.available ? (
            <div>
              <SectionTitle
                icon={<Mail className="w-3.5 h-3.5 text-slate-500" />}
                title="Gappsy Unique Email Metrics"
                subtitle="Deduplicated by email identity — each address counted once per event type"
              />
              {(local.synced_rows ?? 0) === 0 ? (
                <div className="flex items-center gap-2 bg-slate-50 border border-slate-200 rounded-xl px-4 py-3">
                  <Info className="w-4 h-4 text-slate-400 flex-shrink-0" />
                  <p className="text-sm text-slate-500">No local sync data yet for this campaign.</p>
                </div>
              ) : (
                <div className="grid grid-cols-3 sm:grid-cols-7 gap-2">
                  <MetricCard label="Emails Contacted" value={fmt(local.unique_emails_contacted)} sub={`of ${fmt(local.synced_rows)} rows`} />
                  <MetricCard label="Emails Opened"    value={fmt(local.unique_emails_opened)} sub={fmtPct(local.open_rate_email_level) + ' open rate'} />
                  <MetricCard label="Emails Replied"   value={fmt(local.unique_emails_replied)} sub={fmtPct(local.reply_rate_email_level) + ' reply rate'} />
                  <MetricCard label="Emails Bounced"   value={fmt(local.unique_emails_bounced)} sub={fmtPct(local.bounce_rate_email_level) + ' bounce rate'} warn={!!(local.unique_emails_bounced && local.unique_emails_bounced > 0)} />
                  <MetricCard label="Email Open Rate"   value={fmtPct(local.open_rate_email_level)} />
                  <MetricCard label="Email Reply Rate"  value={fmtPct(local.reply_rate_email_level)} />
                  <MetricCard label="Email Bounce Rate" value={fmtPct(local.bounce_rate_email_level)} warn={!!(local.bounce_rate_email_level && local.bounce_rate_email_level > 5)} />
                </div>
              )}
            </div>
          ) : null}

          {/* SECTION C — Unique Agency Metrics */}
          {local?.available && (local.synced_rows ?? 0) > 0 ? (
            <div>
              <SectionTitle
                icon={<Building2 className="w-3.5 h-3.5 text-emerald-600" />}
                title="Gappsy Unique Agency Metrics"
                subtitle="Each agency counted once — the true sales opportunity unit"
              />
              <div className="grid grid-cols-3 sm:grid-cols-7 gap-2">
                <MetricCard label="Agencies Contacted" value={fmt(local.unique_agencies_contacted)} accent />
                <MetricCard label="Agencies Opened"    value={fmt(local.unique_agencies_opened)} sub={fmtPct(local.open_rate_agency_level) + ' open rate'} accent />
                <MetricCard label="Agencies Replied"   value={fmt(local.unique_agencies_replied)} sub={fmtPct(local.reply_rate_agency_level) + ' reply rate'} accent />
                <MetricCard label="Agencies Bounced"   value={fmt(local.unique_agencies_bounced)} sub={fmtPct(local.bounce_rate_agency_level) + ' bounce rate'} warn={!!(local.unique_agencies_bounced && local.unique_agencies_bounced > 0)} />
                <MetricCard label="Agency Open Rate"   value={fmtPct(local.open_rate_agency_level)} accent />
                <MetricCard label="Agency Reply Rate"  value={fmtPct(local.reply_rate_agency_level)} accent />
                <MetricCard label="Agency Bounce Rate" value={fmtPct(local.bounce_rate_agency_level)} warn={!!(local.bounce_rate_agency_level && local.bounce_rate_agency_level > 5)} />
              </div>
            </div>
          ) : null}

          {/* SECTION D — Outreach Quality Diagnostics */}
          {local?.available && (local.synced_rows ?? 0) > 0 ? (
            <div>
              <SectionTitle
                icon={<TrendingUp className="w-3.5 h-3.5 text-slate-500" />}
                title="Outreach Quality Diagnostics"
              />
              <div className="grid grid-cols-3 sm:grid-cols-5 gap-2 mb-3">
                <MetricCard
                  label="Avg Emails / Agency"
                  value={local.avg_emails_per_agency != null ? String(local.avg_emails_per_agency) : '—'}
                  sub={inflatedWarning ? 'Multiple per agency' : undefined}
                  warn={inflatedWarning}
                />
                <MetricCard label="Total Open Events"      value={fmt(local.total_open_events)} />
                <MetricCard label="Total Reply Events"     value={fmt(local.total_reply_events)} />
                <MetricCard label="Total Bounce Events"    value={fmt(local.total_bounce_events)} warn={!!(local.total_bounce_events && local.total_bounce_events > 0)} />
                <MetricCard label="Total Unsub Events"     value={fmt(local.total_unsubscribe_events)} />
              </div>

              {/* Interpretation warnings */}
              {inflatedWarning && (
                <div className="flex items-start gap-2 bg-amber-50 border border-amber-200 rounded-xl px-4 py-3 mb-2">
                  <AlertTriangle className="w-4 h-4 text-amber-500 flex-shrink-0 mt-0.5" />
                  <p className="text-xs text-amber-800">
                    <strong>Multiple emails per agency ({local.avg_emails_per_agency}x avg).</strong> Agency-level conversion is more reliable than raw email-level conversion — use Agencies Replied, not Emails Replied, to measure closing potential.
                  </p>
                </div>
              )}
              {inflatedReplyWarning && (
                <div className="flex items-start gap-2 bg-amber-50 border border-amber-200 rounded-xl px-4 py-3">
                  <Info className="w-4 h-4 text-amber-500 flex-shrink-0 mt-0.5" />
                  <p className="text-xs text-amber-800">
                    Email-level reply rate ({fmtPct(local.reply_rate_email_level)}) is significantly higher than agency-level reply rate ({fmtPct(local.reply_rate_agency_level)}). Multiple emails from the same agency are inflating email-level counts.
                  </p>
                </div>
              )}
            </div>
          ) : null}

          {/* Notes */}
          {stats.merged_notes && stats.merged_notes.length > 0 && (
            <div className="border-t border-slate-100 pt-3 space-y-1">
              {stats.merged_notes.map((note, i) => (
                <div key={i} className="flex items-start gap-2">
                  <Info className="w-3 h-3 text-slate-300 flex-shrink-0 mt-0.5" />
                  <p className="text-[11px] text-slate-400">{note}</p>
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  );
}

// ─── Main page ────────────────────────────────────────────────────────────────

export default function WpAdminSmartleadCampaignsPage() {
  const { status, isReady, isValid } = useAdminSession();

  const [campaigns, setCampaigns] = useState<Campaign[]>([]);
  const [rowMetricsCache, setRowMetricsCache] = useState<Record<string, RowMetrics>>({});
  const [bulkStatsMap, setBulkStatsMap] = useState<Record<string, CampaignStatRow>>({});
  const hydrationAbortRef = useRef<AbortController | null>(null);

  const [selectedCampaign, setSelectedCampaign] = useState<Campaign | null>(null);
  const [campaignStats, setCampaignStats] = useState<CampaignStats | null>(null);

  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<StatusFilter>('all');
  const [loading, setLoading] = useState(false);
  const [statsLoading, setStatsLoading] = useState(false);
  const [actionLoading, setActionLoading] = useState(false);
  const [error, setError] = useState('');
  const [apiError, setApiError] = useState<AdminApiError | null>(null);
  const [actionMessage, setActionMessage] = useState('');
  const [authError, setAuthError] = useState(false);
  const hasFetchedRef = useRef(false);

  useEffect(() => {
    if (isReady && isValid && !hasFetchedRef.current) {
      hasFetchedRef.current = true;
      loadCampaigns();
    }
    if (isReady && !isValid) {
      setAuthError(true);
      hasFetchedRef.current = false;
    }
  }, [isReady, isValid]);

  // ── Parallel row metric hydration ────────────────────────────────────────────
  // Uses include_local=true to also get unique_agencies_contacted + reply_rate_agency_level
  // for the row columns, batched at CONCURRENCY=5 to respect Smartlead rate limits.
  const hydrateRowMetrics = useCallback(async (list: Campaign[]) => {
    if (list.length === 0 || !isReady || !isValid) return;

    hydrationAbortRef.current?.abort();
    const controller = new AbortController();
    hydrationAbortRef.current = controller;

    setRowMetricsCache(prev => {
      const next = { ...prev };
      list.forEach(c => { if (!next[c.campaign_id]) next[c.campaign_id] = { loading: true }; });
      return next;
    });

    const CONCURRENCY = 5;

    async function fetchOne(campaign: Campaign) {
      if (controller.signal.aborted) return;

      const result = await adminApiFetch<CampaignStats>(
        `smartlead-campaign-stats?campaign_id=${encodeURIComponent(campaign.campaign_id)}`
      );

      if (controller.signal.aborted) return;

      if (!result.ok) {
        if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
          setAuthError(true);
          return;
        }
        setRowMetricsCache(prev => ({
          ...prev,
          [campaign.campaign_id]: { loading: false, error: result.error?.message ?? 'Stats unavailable' }
        }));
        return;
      }

      const data = result.data;
      if (!data?.ok) {
        const errMsg = (data as { error?: string })?.error ?? data?.live?.warnings?.[0] ?? 'Stats unavailable';
        setRowMetricsCache(prev => ({
          ...prev,
          [campaign.campaign_id]: { loading: false, error: errMsg }
        }));
        return;
      }

      const live = data.live;
      const local = data.local_overlay;
      const metrics: RowMetrics = {
        loading: false,
        sent:    live.available ? live.sent    : undefined,
        opened:  live.available ? live.opens   : undefined,
        replied: live.available ? live.replies : undefined,
        bounced: live.available ? live.bounces : undefined,
        unique_agencies_contacted: local.available ? local.unique_agencies_contacted : undefined,
        reply_rate_agency_level:   local.available ? local.reply_rate_agency_level   : undefined,
      };
      setRowMetricsCache(prev => ({ ...prev, [campaign.campaign_id]: metrics }));
    }

    for (let i = 0; i < list.length; i += CONCURRENCY) {
      if (controller.signal.aborted) break;
      await Promise.all(list.slice(i, i + CONCURRENCY).map(fetchOne));
    }
  }, [isReady, isValid]);

  const loadBulkStats = useCallback(async (list: Campaign[]) => {
    if (list.length === 0 || !isReady || !isValid) return;
    const ids = list.map(c => c.campaign_id).join(',');
    const result = await adminApiFetch<{ ok: boolean; stats?: Record<string, CampaignStatRow> }>(
      `smartlead-campaign-stats-bulk?campaign_ids=${encodeURIComponent(ids)}`
    );
    if (result.ok && result.data?.ok && result.data.stats) {
      setBulkStatsMap(result.data.stats);
    }
  }, [isReady, isValid]);

  const loadCampaigns = async () => {
    if (!isReady) return;
    if (!isValid) {
      setAuthError(true);
      return;
    }

    setLoading(true);
    setError('');
    setApiError(null);
    setAuthError(false);
    setRowMetricsCache({});

    const result = await adminApiFetch<{ ok: boolean; campaigns?: Campaign[]; warning?: string; error?: string }>(
      'smartlead-campaigns-admin'
    );

    if (!result.ok) {
      setLoading(false);
      if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
        setAuthError(true);
        return;
      }
      setApiError(result.error ?? null);
      setError(result.error?.message ?? 'Failed to load campaigns');
      return;
    }

    const data = result.data;
    if (data?.ok) {
      const list: Campaign[] = data.campaigns || [];
      setCampaigns(list);
      hydrateRowMetrics(list);
      loadBulkStats(list);
    } else {
      const errMsg = data?.warning || data?.error || 'Failed to load campaigns';
      setError(errMsg);
    }
    setLoading(false);
  };

  const loadCampaignStats = async (campaign: Campaign) => {
    if (!isReady || !isValid) {
      setAuthError(true);
      return;
    }

    setSelectedCampaign(campaign);
    setCampaignStats(null);
    setStatsLoading(true);
    setError('');
    setApiError(null);

    const result = await adminApiFetch<CampaignStats>(
      `smartlead-campaign-stats?campaign_id=${encodeURIComponent(campaign.campaign_id)}`
    );

    if (!result.ok) {
      setStatsLoading(false);
      if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
        setAuthError(true);
        return;
      }
      setApiError(result.error ?? null);
      setError(result.error?.message ?? 'Failed to load campaign stats');
      return;
    }

    const data = result.data;
    if (data?.ok) {
      setCampaignStats(data);
      const live = data.live;
      const local = data.local_overlay;
      setRowMetricsCache(prev => ({
        ...prev,
        [campaign.campaign_id]: {
          loading: false,
          sent:    live.available ? live.sent    : undefined,
          opened:  live.available ? live.opens   : undefined,
          replied: live.available ? live.replies : undefined,
          bounced: live.available ? live.bounces : undefined,
          unique_agencies_contacted: local.available ? local.unique_agencies_contacted : undefined,
          reply_rate_agency_level:   local.available ? local.reply_rate_agency_level   : undefined,
        },
      }));
    } else {
      const errMsg = (data as { error?: string })?.error ?? data?.live?.warnings?.[0] ?? 'Failed to load campaign stats';
      setError(errMsg);
    }
    setStatsLoading(false);
  };

  const handleRefreshStats = useCallback(() => {
    if (selectedCampaign) loadCampaignStats(selectedCampaign);
    // Also re-hydrate row that is selected
  }, [selectedCampaign]);

  const handleGlobalRefresh = async () => {
    if (!isReady || !isValid) {
      setAuthError(true);
      return;
    }
    hasFetchedRef.current = false;
    setBulkStatsMap({});
    loadCampaigns();
    if (selectedCampaign) {
      setCampaignStats(null);
      setStatsLoading(true);
      loadCampaignStats(selectedCampaign);
    }
  };

  const handleCampaignAction = async (action: 'start' | 'pause' | 'resume') => {
    if (!selectedCampaign) return;
    if (!isReady || !isValid) {
      setAuthError(true);
      return;
    }

    setActionLoading(true);
    setActionMessage('');
    setError('');
    setApiError(null);

    const result = await adminApiFetch<{ ok: boolean; error?: string }>(
      'smartlead-campaign-action',
      {
        method: 'POST',
        body: { campaign_id: selectedCampaign.campaign_id, action },
      }
    );

    if (!result.ok) {
      setActionLoading(false);
      if (result.error?.code === 'auth_error' || result.error?.code === 'session_expired' || result.error?.code === 'no_session') {
        setAuthError(true);
        return;
      }
      setApiError(result.error ?? null);
      setError(result.error?.message ?? `Failed to ${action} campaign`);
      return;
    }

    const data = result.data;
    if (data?.ok) {
      setActionMessage(`Campaign ${action} successful`);
      setTimeout(() => setActionMessage(''), 3000);
      await loadCampaignStats(selectedCampaign);
    } else {
      setError(data?.error ?? `Failed to ${action} campaign`);
    }
    setActionLoading(false);
  };

  const filteredCampaigns = useMemo(() => campaigns.filter(c => {
    const q = searchQuery.toLowerCase();
    const matchSearch = !q || c.name.toLowerCase().includes(q) || c.campaign_id.includes(q);
    const matchStatus = statusFilter === 'all' || c.status?.toLowerCase() === statusFilter;
    return matchSearch && matchStatus;
  }), [campaigns, searchQuery, statusFilter]);

  const statusCounts = useMemo(() => {
    const counts: Record<string, number> = { all: campaigns.length };
    campaigns.forEach(c => {
      const s = c.status?.toLowerCase() ?? 'draft';
      counts[s] = (counts[s] ?? 0) + 1;
    });
    return counts;
  }, [campaigns]);

  const STATUS_TABS: { key: StatusFilter; label: string }[] = [
    { key: 'all', label: 'All' },
    { key: 'active', label: 'Active' },
    { key: 'paused', label: 'Paused' },
    { key: 'completed', label: 'Completed' },
    { key: 'draft', label: 'Draft' },
  ];

  const HEADER_COLS = ['Sent', 'Opened', 'Replied', 'Bounced', 'Agencies', 'Ag. Reply'];

  const handleAuthSuccess = () => {
    setAuthError(false);
    hasFetchedRef.current = false;
  };

  if (status === 'loading') {
    return (
      <EmailModuleLayout title="Email Marketing" subtitle="Cold Outreach Campaigns">
        <div className="flex items-center justify-center py-20 gap-3">
          <Loader className="w-5 h-5 animate-spin text-blue-500" />
          <span className="text-sm text-slate-500">Restoring admin session...</span>
        </div>
      </EmailModuleLayout>
    );
  }

  if (authError || status === 'invalid') {
    return (
      <EmailModuleLayout title="Email Marketing" subtitle="Cold Outreach Campaigns">
        <div className="max-w-lg mx-auto mt-8">
          <AdminReAuthCard
            onSuccess={handleAuthSuccess}
            message="Your admin session is invalid or expired. Please log in again to access Smartlead campaigns."
          />
        </div>
      </EmailModuleLayout>
    );
  }

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="Cold Outreach Campaigns">
      <div className="space-y-0">

        {apiError && (
          <div className="mb-4">
            <AdminErrorBanner
              error={apiError}
              onRetry={apiError.retryable ? () => { setApiError(null); loadCampaigns(); } : undefined}
              onLogin={() => setAuthError(true)}
            />
          </div>
        )}
        {error && !apiError && (
          <div className="mb-4 bg-red-50 border border-red-200 rounded-xl p-3.5 flex items-start gap-3">
            <AlertCircle className="w-4 h-4 text-red-500 flex-shrink-0 mt-0.5" />
            <div className="flex-1 min-w-0">
              <p className="text-sm font-medium text-red-900">Error</p>
              <p className="text-xs text-red-700 mt-0.5">{error}</p>
            </div>
            <button onClick={() => setError('')} className="text-red-400 hover:text-red-600"><X className="w-4 h-4" /></button>
          </div>
        )}
        {actionMessage && (
          <div className="mb-4 bg-emerald-50 border border-emerald-200 rounded-xl p-3.5 flex items-center gap-3">
            <CheckCircle className="w-4 h-4 text-emerald-500 flex-shrink-0" />
            <p className="text-sm text-emerald-900">{actionMessage}</p>
          </div>
        )}

        <div className="bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm">

          {/* Toolbar */}
          <div className="flex items-center gap-3 px-5 py-3.5 border-b border-slate-100 bg-slate-50/50">
            <div className="relative flex-1 max-w-72">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400" />
              <input
                type="text"
                placeholder="Search campaigns..."
                value={searchQuery}
                onChange={e => setSearchQuery(e.target.value)}
                className="w-full pl-8 pr-3 py-1.5 text-sm border border-slate-200 rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-400 placeholder:text-slate-400"
              />
            </div>
            <button
              onClick={handleGlobalRefresh}
              disabled={loading || status !== 'valid'}
              className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium border border-slate-200 rounded-lg bg-white text-slate-600 hover:bg-slate-100 disabled:opacity-50 transition-colors"
            >
              {loading ? <Loader className="w-3.5 h-3.5 animate-spin" /> : <RefreshCw className="w-3.5 h-3.5" />}
              Refresh All
            </button>
          </div>

          {/* Status tabs */}
          <div className="flex items-center px-5 border-b border-slate-100 overflow-x-auto">
            {STATUS_TABS.map(tab => (
              <button
                key={tab.key}
                onClick={() => setStatusFilter(tab.key)}
                className={`flex items-center gap-1.5 px-3 py-2.5 text-xs font-medium whitespace-nowrap border-b-2 transition-colors ${
                  statusFilter === tab.key
                    ? 'border-blue-500 text-blue-600'
                    : 'border-transparent text-slate-500 hover:text-slate-700'
                }`}
              >
                {tab.label}
                {statusCounts[tab.key] != null && (
                  <span className={`text-[10px] px-1.5 py-0.5 rounded-full font-semibold ${
                    statusFilter === tab.key ? 'bg-blue-100 text-blue-700' : 'bg-slate-100 text-slate-500'
                  }`}>{statusCounts[tab.key] ?? 0}</span>
                )}
              </button>
            ))}
          </div>

          {/* Column headers */}
          <div className="hidden md:flex items-center gap-4 px-5 py-2 bg-slate-50/80 border-b border-slate-100">
            <div className="w-9 flex-shrink-0" />
            <div className="flex-1 text-[10px] font-semibold uppercase tracking-wide text-slate-400">Campaign</div>
            <div className="flex items-center gap-4 pr-5">
              {HEADER_COLS.map(h => (
                <div key={h} className="w-16 text-[10px] font-semibold uppercase tracking-wide text-slate-400">{h}</div>
              ))}
            </div>
            <div className="w-4" />
          </div>

          {/* Rows */}
          <div className="divide-y divide-slate-100">
            {loading ? (
              [...Array(5)].map((_, i) => <SkeletonRow key={i} />)
            ) : filteredCampaigns.length > 0 ? (
              filteredCampaigns.map(campaign => (
                <CampaignRow
                  key={campaign.campaign_id}
                  campaign={campaign}
                  metrics={rowMetricsCache[campaign.campaign_id]}
                  precomputedStats={bulkStatsMap[campaign.campaign_id]}
                  isSelected={selectedCampaign?.campaign_id === campaign.campaign_id}
                  onClick={() => loadCampaignStats(campaign)}
                />
              ))
            ) : campaigns.length === 0 && !error ? (
              <div className="flex flex-col items-center justify-center py-14 gap-2">
                <MoreHorizontal className="w-8 h-8 text-slate-300" />
                <p className="text-sm text-slate-400 font-medium">No campaigns found</p>
                <p className="text-xs text-slate-400">
                  {searchQuery ? 'Try a different search term' : 'Create a campaign in Smartlead to get started'}
                </p>
              </div>
            ) : searchQuery && filteredCampaigns.length === 0 ? (
              <div className="flex flex-col items-center justify-center py-14 gap-2">
                <Search className="w-8 h-8 text-slate-300" />
                <p className="text-sm text-slate-400 font-medium">No matching campaigns</p>
                <p className="text-xs text-slate-400">Try a different search term</p>
              </div>
            ) : null}
          </div>

          {filteredCampaigns.length > 0 && (
            <div className="px-5 py-2.5 bg-slate-50/60 border-t border-slate-100">
              <p className="text-xs text-slate-400">
                Showing {filteredCampaigns.length} of {campaigns.length} campaign{campaigns.length !== 1 ? 's' : ''}
              </p>
            </div>
          )}

          {/* Inline detail panel */}
          {selectedCampaign && (
            <CampaignDetailPanel
              campaign={selectedCampaign}
              stats={campaignStats}
              loading={statsLoading}
              actionLoading={actionLoading}
              onAction={handleCampaignAction}
              onClose={() => { setSelectedCampaign(null); setCampaignStats(null); }}
              onRefresh={handleRefreshStats}
            />
          )}
        </div>
      </div>
    </EmailModuleLayout>
  );
}

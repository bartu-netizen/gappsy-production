import {
  EyeOff, CheckCircle2, TrendingDown, Activity, Clock, ExternalLink,
  MousePointerClick, Zap, BarChart3, Target, ChevronDown, ChevronUp,
  AlertCircle,
} from 'lucide-react';
import { useState } from 'react';

/* ──────────────────────────────────────────────────────────────────────
   Shared types (defined here so sections can be used standalone)
   ────────────────────────────────────────────────────────────────────── */

export interface ManageFunnelContext {
  manage_event_count: number;
  manage_opened_count: number;
  manage_remove_started_count: number;
  manage_recovered_count: number;
  manage_remove_confirmed_count: number;
  last_manage_event_type: string | null;
  last_manage_event_at: string | null;
  first_manage_opened_at: string | null;
  last_manage_recovery_type: string | null;
  manage_current_outcome: string | null;
  manage_listing_url: string | null;
}

export interface ManageFunnelEvent {
  id: string;
  event_type: string;
  recovery_type: string | null;
  created_at: string;
  token: string | null;
  agency_slug: string | null;
  entry_reason: string | null;
  engaged_leads_count: number | null;
  total_interactions: number | null;
  state_slug: string | null;
}

export interface IntentScoring {
  positive_intent_score: number;
  churn_intent_score: number;
  recovery_opportunity_score: number;
  final_priority_score: number;
  recovery_priority: string;
  activity_score?: number;
  deepest_step?: string;
}

export interface ProfileClicks {
  total: number;
  recent: {
    id: string;
    created_at: string;
    source: string | null;
    state_slug: string | null;
  }[];
}

/* ──────────────────────────────────────────────────────────────────────
   Helpers
   ────────────────────────────────────────────────────────────────────── */

function fmtDate(iso: string | null): string {
  if (!iso) return '—';
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

function fmtDateTime(iso: string | null): string {
  if (!iso) return '—';
  return new Date(iso).toLocaleString('en-US', {
    month: 'short', day: 'numeric', year: 'numeric',
    hour: 'numeric', minute: '2-digit',
  });
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

const OUTCOME_LABELS: Record<string, { label: string; color: string; icon: React.ReactNode }> = {
  removed:       { label: 'Owner removed/hid listing', color: 'bg-red-50 text-red-700 border-red-200',         icon: <EyeOff className="w-3 h-3" /> },
  recovered:     { label: 'Recovered',                 color: 'bg-emerald-50 text-emerald-700 border-emerald-200', icon: <CheckCircle2 className="w-3 h-3" /> },
  remove_intent: { label: 'Removal intent',            color: 'bg-amber-50 text-amber-700 border-amber-200',    icon: <TrendingDown className="w-3 h-3" /> },
  opened:        { label: 'Opened only',               color: 'bg-blue-50 text-blue-700 border-blue-200',       icon: <Activity className="w-3 h-3" /> },
};

const EVENT_TYPE_META: Record<string, { label: string; color: string }> = {
  manage_funnel_opened:    { label: 'Funnel opened',     color: 'bg-blue-50 text-blue-700 border-blue-200' },
  manage_remove_started:   { label: 'Remove started',    color: 'bg-amber-50 text-amber-700 border-amber-200' },
  manage_recovered:        { label: 'Recovered',         color: 'bg-emerald-50 text-emerald-700 border-emerald-200' },
  manage_remove_confirmed: { label: 'Removal confirmed', color: 'bg-red-50 text-red-700 border-red-200' },
};

const PRIORITY_COLORS: Record<string, string> = {
  critical: 'bg-red-50 text-red-700 border-red-200',
  high:     'bg-orange-50 text-orange-700 border-orange-200',
  medium:   'bg-amber-50 text-amber-700 border-amber-200',
  low:      'bg-slate-50 text-slate-500 border-slate-200',
  none:     'bg-slate-50 text-slate-400 border-slate-100',
};

function SectionHeader({ icon, title }: { icon: React.ReactNode; title: string }) {
  return (
    <div className="px-5 py-3.5 border-b border-slate-100">
      <h3 className="text-xs font-semibold text-slate-500 uppercase tracking-wide flex items-center gap-2">
        {icon}{title}
      </h3>
    </div>
  );
}

function KV({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="flex items-center justify-between gap-4 py-1.5">
      <span className="text-xs text-slate-400 shrink-0">{label}</span>
      <div className="text-right">{children}</div>
    </div>
  );
}

/* ──────────────────────────────────────────────────────────────────────
   ManageHistorySection
   ────────────────────────────────────────────────────────────────────── */

export function ManageHistorySection({
  context,
  timeline,
}: {
  context: ManageFunnelContext | null;
  timeline: ManageFunnelEvent[];
}) {
  const [showTimeline, setShowTimeline] = useState(false);

  if (!context && timeline.length === 0) return null;

  const outcome     = context?.manage_current_outcome ?? null;
  const outcomeCfg  = outcome ? (OUTCOME_LABELS[outcome] ?? null) : null;

  return (
    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
      <SectionHeader icon={<EyeOff className="w-3 h-3" />} title="Manage Listing History" />
      <div className="p-5 space-y-3">

        {/* Outcome badge */}
        {outcomeCfg && (
          <div className={`inline-flex items-center gap-1.5 text-xs font-semibold px-3 py-1.5 rounded-lg border ${outcomeCfg.color}`}>
            {outcomeCfg.icon}
            {outcomeCfg.label}
          </div>
        )}

        {context && (
          <div className="space-y-1">
            <KV label="Total events">
              <span className="text-xs font-semibold text-slate-700">{context.manage_event_count}</span>
            </KV>
            <KV label="Funnel opens">
              <span className={`text-xs font-semibold ${context.manage_opened_count > 0 ? 'text-blue-700' : 'text-slate-400'}`}>
                {context.manage_opened_count}
              </span>
            </KV>
            <KV label="Remove started">
              <span className={`text-xs font-semibold ${context.manage_remove_started_count > 0 ? 'text-amber-700' : 'text-slate-400'}`}>
                {context.manage_remove_started_count}
              </span>
            </KV>
            <KV label="Recovered">
              <span className={`text-xs font-semibold ${context.manage_recovered_count > 0 ? 'text-emerald-700' : 'text-slate-400'}`}>
                {context.manage_recovered_count}
              </span>
            </KV>
            <KV label="Remove confirmed">
              <span className={`text-xs font-semibold ${context.manage_remove_confirmed_count > 0 ? 'text-red-700' : 'text-slate-400'}`}>
                {context.manage_remove_confirmed_count}
              </span>
            </KV>

            <div className="border-t border-slate-50 pt-2 mt-2 space-y-1">
              <KV label="First opened">
                <span className="text-xs text-slate-600">{fmtDate(context.first_manage_opened_at)}</span>
              </KV>
              <KV label="Last event type">
                {context.last_manage_event_type ? (
                  <span className={`text-[11px] font-medium px-2 py-0.5 rounded border ${EVENT_TYPE_META[context.last_manage_event_type]?.color || 'bg-slate-50 text-slate-500 border-slate-200'}`}>
                    {EVENT_TYPE_META[context.last_manage_event_type]?.label || context.last_manage_event_type}
                  </span>
                ) : <span className="text-xs text-slate-400">—</span>}
              </KV>
              <KV label="Last event at">
                <span className="text-xs text-slate-600">{fmtRelative(context.last_manage_event_at)}</span>
              </KV>
              {context.last_manage_recovery_type && (
                <KV label="Recovery type">
                  <span className="text-xs font-medium text-emerald-700">{context.last_manage_recovery_type.replace(/_/g, ' ')}</span>
                </KV>
              )}
            </div>

            {context.manage_listing_url && (
              <a
                href={context.manage_listing_url}
                target="_blank"
                rel="noopener noreferrer"
                className="mt-2 flex items-center gap-1.5 text-xs text-blue-600 hover:text-blue-700 font-medium"
              >
                <ExternalLink className="w-3 h-3" />
                Open manage listing page
              </a>
            )}
          </div>
        )}

        {/* Timeline toggle */}
        {timeline.length > 0 && (
          <div className="border-t border-slate-100 pt-3">
            <button
              onClick={() => setShowTimeline(s => !s)}
              className="flex items-center gap-1.5 text-xs font-medium text-slate-500 hover:text-slate-700 transition-colors"
            >
              {showTimeline ? <ChevronUp className="w-3.5 h-3.5" /> : <ChevronDown className="w-3.5 h-3.5" />}
              {showTimeline ? 'Hide' : 'Show'} event timeline ({timeline.length})
            </button>

            {showTimeline && (
              <div className="mt-3 overflow-x-auto">
                <table className="w-full text-xs">
                  <thead>
                    <tr className="border-b border-slate-100">
                      <th className="text-left py-1.5 pr-3 font-semibold text-slate-400 whitespace-nowrap">Date</th>
                      <th className="text-left py-1.5 pr-3 font-semibold text-slate-400 whitespace-nowrap">Event type</th>
                      <th className="text-left py-1.5 pr-3 font-semibold text-slate-400 whitespace-nowrap">Recovery</th>
                      <th className="text-left py-1.5 pr-3 font-semibold text-slate-400 whitespace-nowrap">Entry reason</th>
                      <th className="text-left py-1.5 pr-3 font-semibold text-slate-400 whitespace-nowrap">State</th>
                      <th className="text-right py-1.5 font-semibold text-slate-400 whitespace-nowrap">Leads / Interactions</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-50">
                    {timeline.map(evt => (
                      <tr key={evt.id} className="hover:bg-slate-50 transition-colors">
                        <td className="py-1.5 pr-3 text-slate-500 whitespace-nowrap">{fmtDateTime(evt.created_at)}</td>
                        <td className="py-1.5 pr-3 whitespace-nowrap">
                          <span className={`text-[11px] font-medium px-1.5 py-0.5 rounded border ${EVENT_TYPE_META[evt.event_type]?.color || 'bg-slate-50 text-slate-500 border-slate-200'}`}>
                            {EVENT_TYPE_META[evt.event_type]?.label || evt.event_type}
                          </span>
                        </td>
                        <td className="py-1.5 pr-3 text-slate-500">
                          {evt.recovery_type ? <span className="text-emerald-600 font-medium">{evt.recovery_type.replace(/_/g, ' ')}</span> : '—'}
                        </td>
                        <td className="py-1.5 pr-3 text-slate-500">
                          {evt.entry_reason ? evt.entry_reason.replace(/_/g, ' ') : '—'}
                        </td>
                        <td className="py-1.5 pr-3 text-slate-400 whitespace-nowrap">
                          {evt.state_slug || '—'}
                        </td>
                        <td className="py-1.5 text-right text-slate-400 whitespace-nowrap">
                          {evt.engaged_leads_count != null ? (
                            <span>{evt.engaged_leads_count} / {evt.total_interactions ?? '?'}</span>
                          ) : '—'}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        )}

        {context?.manage_event_count === 0 && timeline.length === 0 && (
          <p className="text-xs text-slate-400 italic">No manage funnel activity recorded.</p>
        )}
      </div>
    </div>
  );
}

/* ──────────────────────────────────────────────────────────────────────
   IntentSection
   ────────────────────────────────────────────────────────────────────── */

export function IntentSection({ scoring }: { scoring: IntentScoring | null }) {
  if (!scoring) return null;

  const priorityColor = PRIORITY_COLORS[scoring.recovery_priority] || PRIORITY_COLORS.none;

  function ScoreBar({ value, max = 100, color }: { value: number; max?: number; color: string }) {
    const pct = Math.min(100, Math.round((value / max) * 100));
    return (
      <div className="flex items-center gap-2">
        <div className="flex-1 bg-slate-100 rounded-full h-1.5 overflow-hidden">
          <div className={`h-full rounded-full ${color}`} style={{ width: `${pct}%` }} />
        </div>
        <span className="text-xs font-mono font-semibold text-slate-600 w-8 text-right">{value}</span>
      </div>
    );
  }

  return (
    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
      <SectionHeader icon={<Target className="w-3 h-3" />} title="Intent & Recovery Scoring" />
      <div className="p-5 space-y-4">

        <div className="flex items-center justify-between">
          <span className="text-xs text-slate-400">Recovery priority</span>
          <span className={`text-xs font-semibold px-2.5 py-1 rounded-full border ${priorityColor}`}>
            {scoring.recovery_priority || 'none'}
          </span>
        </div>

        <div className="space-y-3">
          <div>
            <div className="flex items-center justify-between mb-1">
              <span className="text-xs text-slate-500 flex items-center gap-1">
                <Zap className="w-3 h-3 text-emerald-500" />
                Positive intent
              </span>
            </div>
            <ScoreBar value={scoring.positive_intent_score} color="bg-emerald-400" />
          </div>
          <div>
            <div className="flex items-center justify-between mb-1">
              <span className="text-xs text-slate-500 flex items-center gap-1">
                <TrendingDown className="w-3 h-3 text-red-400" />
                Churn intent
              </span>
            </div>
            <ScoreBar value={scoring.churn_intent_score} color="bg-red-400" />
          </div>
          <div>
            <div className="flex items-center justify-between mb-1">
              <span className="text-xs text-slate-500 flex items-center gap-1">
                <CheckCircle2 className="w-3 h-3 text-blue-400" />
                Recovery opportunity
              </span>
            </div>
            <ScoreBar value={scoring.recovery_opportunity_score} color="bg-blue-400" />
          </div>
          <div>
            <div className="flex items-center justify-between mb-1">
              <span className="text-xs font-semibold text-slate-600 flex items-center gap-1">
                <BarChart3 className="w-3 h-3 text-slate-400" />
                Final priority score
              </span>
            </div>
            <ScoreBar value={scoring.final_priority_score} color="bg-slate-500" />
          </div>
        </div>

        {(scoring.activity_score != null || scoring.deepest_step) && (
          <div className="border-t border-slate-100 pt-3 space-y-1">
            {scoring.activity_score != null && (
              <KV label="Activity score">
                <span className="text-xs font-semibold text-slate-700">{scoring.activity_score}</span>
              </KV>
            )}
            {scoring.deepest_step && (
              <KV label="Deepest step">
                <span className="text-xs font-medium text-slate-600">{scoring.deepest_step.replace(/_/g, ' ')}</span>
              </KV>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

/* ──────────────────────────────────────────────────────────────────────
   ProfileClicksSection
   ────────────────────────────────────────────────────────────────────── */

export function ProfileClicksSection({ clicks }: { clicks: ProfileClicks | null }) {
  const [showRecent, setShowRecent] = useState(false);

  if (!clicks) return null;

  return (
    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
      <SectionHeader icon={<MousePointerClick className="w-3 h-3" />} title="Profile Click History" />
      <div className="p-5 space-y-3">

        <div className="flex items-center justify-between">
          <span className="text-xs text-slate-400">Total profile clicks</span>
          <span className={`text-sm font-bold ${clicks.total > 0 ? 'text-slate-800' : 'text-slate-300'}`}>
            {clicks.total}
          </span>
        </div>

        {clicks.recent.length > 0 && (
          <button
            onClick={() => setShowRecent(s => !s)}
            className="flex items-center gap-1.5 text-xs font-medium text-slate-500 hover:text-slate-700 transition-colors"
          >
            {showRecent ? <ChevronUp className="w-3.5 h-3.5" /> : <ChevronDown className="w-3.5 h-3.5" />}
            {showRecent ? 'Hide' : 'Show'} recent clicks ({clicks.recent.length})
          </button>
        )}

        {showRecent && clicks.recent.length > 0 && (
          <div className="overflow-x-auto">
            <table className="w-full text-xs">
              <thead>
                <tr className="border-b border-slate-100">
                  <th className="text-left py-1.5 pr-3 font-semibold text-slate-400">When</th>
                  <th className="text-left py-1.5 pr-3 font-semibold text-slate-400">Source</th>
                  <th className="text-left py-1.5 font-semibold text-slate-400">State</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-50">
                {clicks.recent.map(c => (
                  <tr key={c.id} className="hover:bg-slate-50 transition-colors">
                    <td className="py-1.5 pr-3 text-slate-500 whitespace-nowrap">
                      <span title={fmtDateTime(c.created_at)}>{fmtRelative(c.created_at)}</span>
                    </td>
                    <td className="py-1.5 pr-3 text-slate-500">{c.source || '—'}</td>
                    <td className="py-1.5 text-slate-400">{c.state_slug || '—'}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}

        {clicks.total === 0 && (
          <div className="flex items-center gap-2 text-xs text-slate-400">
            <AlertCircle className="w-3 h-3 shrink-0" />
            No profile clicks recorded yet.
          </div>
        )}
      </div>
    </div>
  );
}

/* ──────────────────────────────────────────────────────────────────────
   BasicInfoSection  (new dossier section for agency identity info)
   ────────────────────────────────────────────────────────────────────── */

export function BasicInfoDossierSection({
  agency,
  yourAgencyUrl,
}: {
  agency: {
    id: string;
    name: string;
    slug: string | null;
    domain: string | null;
    website_url: string | null;
    state_slug?: string | null;
    is_active?: boolean;
    created_at?: string | null;
    listing_management_status?: string | null;
  };
  yourAgencyUrl: string | null;
}) {
  const mgmtStatus = agency.listing_management_status;
  const isHidden = mgmtStatus === 'removal_pending';

  return (
    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
      <SectionHeader icon={<AlertCircle className="w-3 h-3" />} title="Agency Identity" />
      <div className="p-5 space-y-1.5">
        <KV label="Agency ID">
          <code className="text-[11px] font-mono bg-slate-50 border border-slate-100 text-slate-600 px-1.5 py-0.5 rounded" title={agency.id}>
            {agency.id.slice(0, 16)}…
          </code>
        </KV>
        <KV label="Slug">
          <span className="text-xs font-mono text-slate-600">{agency.slug || '—'}</span>
        </KV>
        {agency.state_slug && (
          <KV label="State">
            <span className="text-xs text-slate-600">
              {agency.state_slug.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
            </span>
          </KV>
        )}
        {agency.created_at && (
          <KV label="Created">
            <span className="text-xs text-slate-600">{fmtDate(agency.created_at)}</span>
          </KV>
        )}
        <KV label="Active">
          <span className={`text-xs font-semibold ${agency.is_active !== false ? 'text-emerald-600' : 'text-red-500'}`}>
            {agency.is_active !== false ? 'Yes' : 'No'}
          </span>
        </KV>
        {mgmtStatus != null && (
          <KV label="Listing status">
            {isHidden ? (
              <span className="inline-flex items-center gap-1 text-[11px] font-semibold bg-red-50 text-red-700 border border-red-200 px-2 py-0.5 rounded">
                <EyeOff className="w-3 h-3" />
                Hidden by owner
              </span>
            ) : (
              <span className="text-xs font-medium text-slate-600">{mgmtStatus || 'none'}</span>
            )}
          </KV>
        )}
        {yourAgencyUrl && (
          <div className="pt-2">
            <a
              href={yourAgencyUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center gap-1.5 text-xs font-medium text-blue-600 hover:text-blue-700 truncate"
            >
              <ExternalLink className="w-3 h-3 shrink-0" />
              {yourAgencyUrl}
            </a>
          </div>
        )}
      </div>
    </div>
  );
}

/* re-export Clock for convenience */
export { Clock };

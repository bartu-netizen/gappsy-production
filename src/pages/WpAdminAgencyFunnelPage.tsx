import { useState, useEffect, useCallback, useMemo, useRef } from "react";
import {
  TrendingUp, DollarSign, Users, ShoppingCart, RefreshCw,
  ChevronDown, ChevronUp, ExternalLink, Zap, Globe, Search,
  AlertTriangle, BarChart2, Percent, Activity, Clock, Filter,
  CheckCircle2, MousePointer, Calendar, X, ArrowRight,
  Monitor, Eye, CreditCard, Flame, Thermometer, Layers, Route,
} from "lucide-react";
import WpAdminLayout from "../components/wpadmin/WpAdminLayout";
import SessionDetailDrawer from "../components/admin/SessionDetailDrawer";
import { TrafficModeToggle, trafficModeToApiParam, type TrafficMode } from "../components/admin/TrafficModeToggle";
import { formatStateName } from "../utils/formatLocation";
import { SmartFollowupRoutingTab } from "../components/admin/SmartFollowupRoutingTab";

const SUPABASE_URL      = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

// ─── time ranges ──────────────────────────────────────────────────────────────

const RANGES = [
  { label: "24h",    days: 1  },
  { label: "3d",     days: 3  },
  { label: "7d",     days: 7  },
  { label: "30d",    days: 30 },
  { label: "90d",    days: 90 },
  { label: "All",    days: 0  },
  { label: "Custom", days: -1 },
];

// ─── types ────────────────────────────────────────────────────────────────────

interface AgencyRow {
  agency_key:             string;
  agency_name:            string | null;
  agency_slug:            string | null;
  agency_id:              string | null;
  state_slug:             string | null;
  total_sessions:         number;
  paid_sessions:          number;
  revenue:                number;
  upsells:                number;
  checkout_opens:         number;
  demo_opens:             number;
  highest_step_reached:   number | null;
  last_activity_stage:    string | null;
  drop_off_label:         string | null;
  intent_signal:          "high" | "medium" | "low" | null;
  payment_source_client:  number;
  payment_source_webhook: number;
  last_seen:              string | null;
  funnel_types:           string[];
  sources:                string[];
  is_unresolved:          boolean;
}

interface KPIs {
  total_sessions:  number;
  paid_sessions:   number;
  revenue:         number;
  upsells:         number;
  checkout_opens:  number;
  demo_opens:      number;
  stripe_orders?:  number;
  stripe_revenue?: number;
}

type AgencyKpiKey = "sessions" | "paid" | "revenue" | "avg_order" | "convrate" | "checkouts" | "demos" | "upsells";

interface KpiFilterCfg {
  viewingLabel: string;
  predicate: (row: AgencyRow) => boolean;
}

const KPI_FILTER_CFG: Record<AgencyKpiKey, KpiFilterCfg> = {
  sessions:  { viewingLabel: "All Sessions",         predicate: () => true },
  paid:      { viewingLabel: "Paid Only",            predicate: (r) => r.paid_sessions > 0 },
  revenue:   { viewingLabel: "Has Revenue",          predicate: (r) => r.revenue > 0 },
  avg_order: { viewingLabel: "Has Paid Sessions",    predicate: (r) => r.paid_sessions > 0 },
  convrate:  { viewingLabel: "Has Conversions",      predicate: (r) => r.paid_sessions > 0 },
  checkouts: { viewingLabel: "Has Checkouts",        predicate: (r) => r.checkout_opens > 0 },
  demos:     { viewingLabel: "Has Demos Opened",     predicate: (r) => r.demo_opens > 0 },
  upsells:   { viewingLabel: "Has Upsells",          predicate: (r) => r.upsells > 0 },
};

interface ActivityEvent {
  id:           string;
  session_id:   string;
  event_name:   string;
  step_number:  number;
  step_label:   string;
  agency_name:  string | null;
  agency_slug:  string | null;
  agency_id:    string | null;
  state_slug:   string | null;
  is_demo:      boolean;
  stage:        string | null;
  lead_email:   string | null;
  page_path:    string | null;
  search_query: string | null;
  funnel_name:  string | null;
  created_at:   string;
}

interface ActivitySession {
  id:                    string;
  funnel_type:           string | null;
  funnel_name:           string | null;
  stage:                 string | null;
  agency_name:           string | null;
  agency_slug:           string | null;
  agency_id:             string | null;
  display_name:          string;
  is_unresolved_session: boolean;
  state_slug:            string | null;
  step_number:           number | null;
  entry_path:            string | null;
  purchased_product:     string | null;
  purchased_amount:      number | null;
  upsell_taken:          boolean | null;
  payment_status:        string | null;
  payment_source:        string | null;
  checkout_session_id:   string | null;
  last_event_name:       string | null;
  last_event_at:         string | null;
  source_label:          string;
  created_at:            string;
}

interface FunnelStep {
  label:        string;
  min_step:     number;
  count:        number;
  pct_of_total: number;
}

interface DropOffBucket {
  step_number: number;
  label:       string;
  count:       number;
}

interface SourceBucket {
  source_label: string;
  count:        number;
  paid:         number;
}

interface DailyBucket {
  date:  string;
  total: number;
  paid:  number;
}

interface FunnelStepsData {
  steps:      FunnelStep[];
  drop_off:   DropOffBucket[];
  sources:    SourceBucket[];
  daily:      DailyBucket[];
  total:      number;
  paid_count: number;
}

interface ActivationUpgradeBreakdown {
  counts: Record<string, number>;
  conversion: {
    activation_option_ctr_pct: number;
    standard_upgrade_ctr_pct: number;
    standard_continue_rate_pct: number;
    top25_confirm_continue_ctr_pct: number;
    standard_skip_checkout_rate_pct: number;
    standard_upgrade_checkout_rate_pct: number;
    top25_confirm_checkout_rate_pct: number;
  };
  checkout_started_count: number;
  checkout_by_source: Record<string, number>;
  breakdowns: {
    activation_option_by_plan:          Array<{ plan: string; count: number }>;
    activation_option_by_position:      Array<{ position: string; count: number }>;
    activation_option_by_plan_position: Array<{ plan: string; position: string; price: number | null; count: number; ctr_pct: number }>;
    top25_addon_by_action:              Array<{ action: string; count: number }>;
    top25_addon_by_addon:               Array<{ addon: string; count: number }>;
  };
  total_events: number;
}

// ─── status system ────────────────────────────────────────────────────────────

type AgencyStatus = "paid" | "hot" | "warm" | "cold";

function computeStatus(row: AgencyRow): AgencyStatus {
  if (row.paid_sessions > 0)                                    return "paid";
  if (row.demo_opens > 0 || row.checkout_opens > 0)            return "hot";
  if (row.total_sessions > 0)                                   return "warm";
  return "cold";
}

const STATUS_CFG: Record<AgencyStatus, {
  label: string;
  cls:   string;
  dot:   string;
  icon:  React.ComponentType<{ className?: string }>;
}> = {
  paid: { label: "Paid",  cls: "bg-emerald-100 text-emerald-800 border-emerald-200", dot: "bg-emerald-500", icon: CheckCircle2 },
  hot:  { label: "Hot",   cls: "bg-orange-100 text-orange-700 border-orange-200",    dot: "bg-orange-400",  icon: Flame        },
  warm: { label: "Warm",  cls: "bg-amber-100 text-amber-700 border-amber-200",       dot: "bg-amber-400",   icon: Thermometer  },
  cold: { label: "Cold",  cls: "bg-slate-100 text-slate-500 border-slate-200",       dot: "bg-slate-300",   icon: Activity     },
};

function StatusBadge({ status }: { status: AgencyStatus }) {
  const cfg  = STATUS_CFG[status];
  const Icon = cfg.icon;
  return (
    <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[11px] font-semibold border whitespace-nowrap ${cfg.cls}`}>
      <Icon className="w-2.5 h-2.5 shrink-0" />
      {cfg.label}
    </span>
  );
}

// ─── helpers ──────────────────────────────────────────────────────────────────

function fmtDate(iso: string | null): string {
  if (!iso) return "—";
  return new Date(iso).toLocaleString("en-US", {
    month: "short", day: "numeric", hour: "numeric", minute: "2-digit",
  });
}

function timeAgo(iso: string | null): string {
  if (!iso) return "—";
  const diffMs  = Date.now() - new Date(iso).getTime();
  const diffSec = Math.floor(diffMs / 1000);
  if (diffSec < 60)  return "just now";
  const diffMin = Math.floor(diffSec / 60);
  if (diffMin < 60)  return `${diffMin} min ago`;
  const diffHr  = Math.floor(diffMin / 60);
  if (diffHr  < 24)  return `${diffHr}h ago`;
  const diffDay = Math.floor(diffHr  / 24);
  if (diffDay === 1) return "yesterday";
  if (diffDay < 7)   return `${diffDay}d ago`;
  if (diffDay < 30)  return `${Math.floor(diffDay / 7)}w ago`;
  return fmtDate(iso);
}

function fmtCurrency(n: number): string {
  return n > 0 ? `$${n.toFixed(0)}` : "—";
}

function fmtPct(n: number, d: number): string {
  if (d === 0) return "0%";
  return `${((n / d) * 100).toFixed(1)}%`;
}

function fmtAvgOrder(revenue: number, paid: number): string {
  if (paid === 0) return "—";
  return `$${(revenue / paid).toFixed(0)}`;
}

const STEP_LABELS: Record<number, string> = {
  0:   "—",          10:  "Landing",       20:  "Search",        25:  "Profile Click",
  30:  "Overview",   40:  "See Listing",   50:  "Owner Preview",
  60:  "Scroll",     70:  "Demo Step 2",   80:  "Demo Modal",
  90:  "Demo Submit",100: "Demo Result",   110: "Activation Upsell",
  120: "Upgrade",    130: "Activate",      140: "Offer",
  150: "Checkout",   160: "Paid",
};
function stepLabel(n: number | null | undefined) {
  if (n === null || n === undefined || isNaN(n as number)) return "No activity";
  return STEP_LABELS[n] ?? `Step ${n}`;
}

// ─── stage badge ──────────────────────────────────────────────────────────────

const STAGE_MAP: Record<string, { label: string; cls: string }> = {
  paid:            { label: "Paid",      cls: "bg-emerald-100 text-emerald-800 border-emerald-200" },
  checkout:        { label: "Checkout",  cls: "bg-blue-100 text-blue-700 border-blue-200"          },
  checkout_open:   { label: "Chk Open", cls: "bg-blue-50 text-blue-600 border-blue-100"            },
  payment_pending: { label: "Pending",   cls: "bg-amber-100 text-amber-700 border-amber-200"       },
  viewed:          { label: "Viewed",    cls: "bg-slate-100 text-slate-600 border-slate-200"        },
  landing:         { label: "Landing",   cls: "bg-slate-50 text-slate-500 border-slate-100"         },
};

function StageBadge({ stage }: { stage: string | null }) {
  const s   = stage || "unknown";
  const cfg = STAGE_MAP[s] ?? { label: s, cls: "bg-gray-50 text-gray-400 border-gray-100" };
  return (
    <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-medium border whitespace-nowrap ${cfg.cls}`}>
      {cfg.label}
    </span>
  );
}

function EventStepBadge({ step }: { step: number }) {
  const cls =
    step >= 160 ? "bg-emerald-100 text-emerald-800 border-emerald-200" :
    step >= 150 ? "bg-blue-100 text-blue-800 border-blue-200" :
    step >= 140 ? "bg-orange-100 text-orange-700 border-orange-200" :
    step >= 90  ? "bg-amber-100 text-amber-700 border-amber-200" :
    step >= 25  ? "bg-sky-100 text-sky-700 border-sky-200" :
    step >= 20  ? "bg-blue-100 text-blue-700 border-blue-200" :
                  "bg-slate-100 text-slate-500 border-slate-200";
  return (
    <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-semibold border whitespace-nowrap shrink-0 ${cls}`}>
      {STEP_LABELS[step] ?? `Step ${step}`}
    </span>
  );
}

function SourceLabel({ label }: { label: string }) {
  if (!label || label === "Unknown") return null;
  const isSearch = label.includes("Search");
  const isDirect = label.includes("Direct");
  const isEmail  = label.includes("Email");
  const cls = isSearch ? "bg-sky-50 text-sky-700 border-sky-200"
    : isDirect ? "bg-slate-50 text-slate-600 border-slate-200"
    : isEmail  ? "bg-amber-50 text-amber-700 border-amber-200"
    : "bg-slate-50 text-slate-500 border-slate-200";
  const Icon = isSearch ? Search : isDirect ? Globe : isEmail ? Monitor : MousePointer;
  return (
    <span className={`inline-flex items-center gap-1 px-1.5 py-0.5 rounded text-[10px] border ${cls} whitespace-nowrap truncate max-w-[130px]`}>
      <Icon className="w-2.5 h-2.5 shrink-0" />
      <span className="truncate">{label}</span>
    </span>
  );
}

function SortIcon({ active, dir }: { active: boolean; dir: "asc" | "desc" }) {
  if (!active) return <ChevronDown className="w-3 h-3 text-slate-300 ml-0.5" />;
  return dir === "desc"
    ? <ChevronDown className="w-3 h-3 text-blue-500 ml-0.5" />
    : <ChevronUp   className="w-3 h-3 text-blue-500 ml-0.5" />;
}

// ─── KPI card ─────────────────────────────────────────────────────────────────

function KpiCard({ label, value, sub, icon: Icon, iconCls, accent, isActive, onClick }: {
  label: string; value: string; sub?: string;
  icon: React.ComponentType<{ className?: string }>;
  iconCls: string; accent?: boolean;
  isActive?: boolean;
  onClick?: () => void;
}) {
  return (
    <div
      role={onClick ? "button" : undefined}
      tabIndex={onClick ? 0 : undefined}
      onClick={onClick}
      onKeyDown={onClick ? (e) => { if (e.key === "Enter" || e.key === " ") onClick(); } : undefined}
      className={`bg-white rounded-xl border p-4 flex flex-col gap-2.5 transition-all relative ${
        isActive
          ? "border-slate-700 ring-2 ring-slate-700/10 shadow-md cursor-pointer"
          : onClick
          ? "border-slate-200 hover:border-slate-300 hover:shadow-sm cursor-pointer"
          : accent ? "border-emerald-200 ring-1 ring-emerald-50" : "border-slate-200"
      }`}
    >
      {isActive && (
        <span className="absolute top-2 right-2 text-[9px] font-bold uppercase tracking-widest text-slate-600 bg-slate-100 rounded px-1.5 py-0.5">on</span>
      )}
      <div className={`inline-flex w-8 h-8 items-center justify-center rounded-lg shrink-0 ${iconCls}`}>
        <Icon className="w-3.5 h-3.5" />
      </div>
      <div>
        <div className={`text-xl font-bold tabular-nums tracking-tight leading-none ${accent ? "text-emerald-700" : "text-slate-900"}`}>{value}</div>
        <div className="text-[10px] font-semibold text-slate-400 mt-1 uppercase tracking-wide">{label}</div>
        {sub && <div className="text-[10px] text-slate-400 mt-0.5">{sub}</div>}
      </div>
    </div>
  );
}

// ─── funnel bar ───────────────────────────────────────────────────────────────

function FunnelBar({ label, count, total, pct }: { label: string; count: number; total: number; pct: number }) {
  const w      = total > 0 ? Math.max(2, (count / total) * 100) : 0;
  const isPaid = label.toLowerCase().includes("paid");
  return (
    <div className="flex items-center gap-3 group">
      <div className="w-36 shrink-0 text-xs text-slate-600 text-right font-medium">{label}</div>
      <div className="flex-1 h-6 bg-slate-100 rounded overflow-hidden">
        <div className={`h-full rounded transition-all duration-500 ${isPaid ? "bg-emerald-500" : "bg-blue-400"}`} style={{ width: `${w}%` }} />
      </div>
      <div className="w-20 shrink-0 text-right">
        <span className="text-xs font-semibold text-slate-700 tabular-nums">{count.toLocaleString()}</span>
        <span className="text-[10px] text-slate-400 ml-1">({pct.toFixed(1)}%)</span>
      </div>
    </div>
  );
}

// ─── funnel progress steps ────────────────────────────────────────────────────

const FUNNEL_STAGES: { key: string; label: string; minStep: number }[] = [
  { key: "visited",  label: "Visited",         minStep: 10  },
  { key: "viewed",   label: "Viewed Listing",  minStep: 40  },
  { key: "demo",     label: "Opened Demo",     minStep: 80  },
  { key: "offer",    label: "Offer Viewed",    minStep: 140 },
  { key: "checkout", label: "Checkout",        minStep: 150 },
  { key: "paid",     label: "Paid",            minStep: 160 },
];

function FunnelProgress({ highestStep }: { highestStep: number | null }) {
  const step = highestStep ?? 0;
  return (
    <div className="space-y-2 mt-3">
      {FUNNEL_STAGES.map((stage, idx) => {
        const reached = step >= stage.minStep;
        const isLast  = idx === FUNNEL_STAGES.length - 1;
        return (
          <div key={stage.key} className="flex items-center gap-3">
            <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center shrink-0 transition-all ${
              reached
                ? isLast
                  ? "border-emerald-500 bg-emerald-500"
                  : "border-blue-500 bg-blue-500"
                : "border-slate-200 bg-white"
            }`}>
              {reached && <div className="w-1.5 h-1.5 rounded-full bg-white" />}
            </div>
            <div className="flex-1">
              <span className={`text-xs font-medium ${reached ? (isLast ? "text-emerald-700" : "text-slate-800") : "text-slate-400"}`}>
                {stage.label}
              </span>
            </div>
            {reached && (
              <span className={`text-[10px] font-semibold px-1.5 py-0.5 rounded ${isLast ? "bg-emerald-100 text-emerald-700" : "bg-blue-50 text-blue-600"}`}>
                reached
              </span>
            )}
          </div>
        );
      })}
    </div>
  );
}

// ─── agency detail drawer ─────────────────────────────────────────────────────

interface AgencyDetailDrawerProps {
  row:            AgencyRow;
  activity:       ActivitySession[];
  onClose:        () => void;
  onOpenSession:  (id: string) => void;
}

function AgencyDetailDrawer({ row, activity, onClose, onOpenSession }: AgencyDetailDrawerProps) {
  const status = computeStatus(row);
  const cfg    = STATUS_CFG[status];

  const agencySessions = useMemo(() => {
    return activity
      .filter((s) => {
        if (s.is_unresolved_session) return false;
        if (row.agency_id && s.agency_id === row.agency_id) return true;
        if (row.agency_slug && s.agency_slug === row.agency_slug) return true;
        return false;
      })
      .slice(0, 10);
  }, [activity, row]);

  useEffect(() => {
    const handler = (e: KeyboardEvent) => { if (e.key === "Escape") onClose(); };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [onClose]);

  const convPct = row.total_sessions > 0
    ? ((row.paid_sessions / row.total_sessions) * 100).toFixed(1) + "%"
    : "0%";

  return (
    <>
      <div className="fixed inset-0 bg-black/20 backdrop-blur-[2px] z-40" onClick={onClose} />
      <div className="fixed top-0 right-0 h-full w-full max-w-[460px] bg-slate-50 border-l border-slate-200 shadow-2xl z-50 flex flex-col">

        {/* Header */}
        <div className={`px-5 py-4 border-b flex items-start gap-3 shrink-0 ${
          status === "paid" ? "bg-emerald-50 border-emerald-200" : "bg-white border-slate-200"
        }`}>
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 flex-wrap">
              <StatusBadge status={status} />
              {row.intent_signal === "high" && (
                <span className="text-[10px] font-semibold px-1.5 py-0.5 rounded-full bg-emerald-100 text-emerald-700 border border-emerald-200">High intent</span>
              )}
            </div>
            <h2 className="text-sm font-bold text-slate-900 mt-1.5 truncate">
              {row.agency_name || row.agency_slug || row.agency_key}
            </h2>
            <div className="flex items-center gap-2 mt-0.5 flex-wrap">
              {row.state_slug && (
                <span className="text-xs text-slate-400">{formatStateName(row.state_slug)}</span>
              )}
              {row.agency_slug && (
                <a
                  href={`/your-agency/${row.agency_slug}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-xs text-blue-500 hover:text-blue-700 flex items-center gap-0.5"
                >
                  <ExternalLink className="w-3 h-3" />
                  View page
                </a>
              )}
            </div>
          </div>
          <button
            onClick={onClose}
            className="p-1.5 rounded-lg text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors shrink-0"
          >
            <X className="w-4 h-4" />
          </button>
        </div>

        {/* Body */}
        <div className="flex-1 overflow-y-auto py-5 space-y-5">

          {/* Funnel Metrics */}
          <div className="px-5">
            <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-3">Funnel Metrics</p>
            <div className="grid grid-cols-3 gap-2">
              {[
                { label: "Sessions",  value: row.total_sessions.toLocaleString(),                            cls: "text-slate-800"  },
                { label: "Demos",     value: row.demo_opens > 0 ? row.demo_opens.toLocaleString() : "—",     cls: "text-sky-700"    },
                { label: "Checkouts", value: row.checkout_opens > 0 ? row.checkout_opens.toLocaleString() : "—", cls: "text-blue-700" },
                { label: "Paid",      value: row.paid_sessions > 0 ? row.paid_sessions.toLocaleString() : "—", cls: "text-emerald-700 font-bold" },
                { label: "Revenue",   value: row.revenue > 0 ? `$${row.revenue.toFixed(0)}` : "—",           cls: "text-emerald-700 font-bold" },
                { label: "Conv %",    value: convPct,                                                          cls: "text-slate-700"  },
              ].map((m) => (
                <div key={m.label} className="bg-white border border-slate-100 rounded-xl p-3 text-center">
                  <div className={`text-base font-semibold tabular-nums ${m.cls}`}>{m.value}</div>
                  <div className="text-[10px] text-slate-400 mt-0.5 uppercase tracking-wide">{m.label}</div>
                </div>
              ))}
            </div>
          </div>

          {/* Funnel Progress */}
          <div className="px-5">
            <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1">Funnel Progress</p>
            <div className="bg-white border border-slate-100 rounded-xl p-4">
              <div className="flex items-center justify-between mb-2">
                <span className="text-xs font-semibold text-slate-700 flex items-center gap-1.5">
                  <Layers className="w-3.5 h-3.5 text-slate-400" />
                  Highest Step Reached
                </span>
                <span className="text-xs text-slate-500 bg-slate-50 border border-slate-200 rounded px-2 py-0.5">
                  {stepLabel(row.highest_step_reached)}
                </span>
              </div>
              <FunnelProgress highestStep={row.highest_step_reached} />
              {row.drop_off_label && (
                <div className="mt-3 pt-3 border-t border-slate-100 flex items-center gap-2">
                  <AlertTriangle className="w-3.5 h-3.5 text-amber-400 shrink-0" />
                  <span className="text-xs text-slate-500">
                    Dropped off at: <strong className="text-slate-700">{row.drop_off_label}</strong>
                  </span>
                </div>
              )}
              {row.last_activity_stage && (
                <div className="mt-2 flex items-center gap-2">
                  <span className="text-xs text-slate-400">Last stage:</span>
                  <StageBadge stage={row.last_activity_stage} />
                </div>
              )}
            </div>
          </div>

          {/* Last Activity */}
          <div className="px-5">
            <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-3">Last Activity</p>
            {agencySessions.length === 0 ? (
              <div className="bg-white border border-slate-100 rounded-xl p-4 text-center text-xs text-slate-400">
                No recent sessions in this period
              </div>
            ) : (
              <div className="bg-white border border-slate-100 rounded-xl overflow-hidden divide-y divide-slate-50">
                {agencySessions.map((s) => (
                  <button
                    key={s.id}
                    onClick={() => onOpenSession(s.id)}
                    className={`w-full px-4 py-3 flex items-center gap-3 hover:bg-slate-50 transition-colors text-left group ${
                      s.stage === "paid" ? "bg-emerald-50/40" : ""
                    }`}
                  >
                    <div className="shrink-0 w-20">
                      <StageBadge stage={s.stage} />
                    </div>
                    <div className="flex-1 min-w-0">
                      <div className="text-xs font-medium text-slate-700 truncate">
                        {s.source_label || "Direct"}
                      </div>
                      {s.step_number !== null && (
                        <div className="text-[10px] text-slate-400 mt-0.5">
                          {stepLabel(s.step_number)}
                        </div>
                      )}
                    </div>
                    {s.stage === "paid" && s.purchased_amount && s.purchased_amount > 0 && (
                      <span className="text-xs font-bold text-emerald-700 shrink-0">
                        ${(s.purchased_amount / 100).toFixed(0)}
                      </span>
                    )}
                    <div className="shrink-0 text-[10px] text-slate-400 whitespace-nowrap" title={fmtDate(s.last_event_at || s.created_at)}>
                      {timeAgo(s.last_event_at || s.created_at)}
                    </div>
                    <ArrowRight className="w-3 h-3 text-slate-300 shrink-0 opacity-0 group-hover:opacity-100 transition-opacity" />
                  </button>
                ))}
              </div>
            )}
          </div>

          {/* Sources */}
          {row.sources.length > 0 && (
            <div className="px-5">
              <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Traffic Sources</p>
              <div className="flex flex-wrap gap-1.5">
                {row.sources.map((s) => (
                  <SourceLabel key={s} label={s} />
                ))}
              </div>
            </div>
          )}

        </div>

        {/* Footer */}
        <div className="shrink-0 px-5 py-3 border-t border-slate-200 bg-white flex items-center justify-between">
          <span className="text-[10px] text-slate-400" title={fmtDate(row.last_seen)}>
            Last seen: {timeAgo(row.last_seen)}
          </span>
          <button
            onClick={onClose}
            className="px-3 py-1.5 text-xs text-slate-600 hover:text-slate-900 bg-slate-100 hover:bg-slate-200 rounded-lg transition-colors"
          >
            Close
          </button>
        </div>
      </div>
    </>
  );
}

// ─── main page ────────────────────────────────────────────────────────────────

export default function WpAdminAgencyFunnelPage() {
  const [days,            setDays]            = useState(30);
  const [customFrom,      setCustomFrom]      = useState("");
  const [customTo,        setCustomTo]        = useState("");
  const [customApplied,   setCustomApplied]   = useState(false);
  const [kpis,            setKpis]            = useState<KPIs | null>(null);
  const [agencyRows,      setAgencyRows]      = useState<AgencyRow[]>([]);
  const [activity,        setActivity]        = useState<ActivitySession[]>([]);
  const [funnelSteps,     setFunnelSteps]     = useState<FunnelStepsData | null>(null);
  const [activationBreakdown, setActivationBreakdown] = useState<ActivationUpgradeBreakdown | null>(null);
  const [activityEvents,  setActivityEvents]  = useState<ActivityEvent[]>([]);
  const [evtLoading,      setEvtLoading]      = useState(false);
  const [loading,         setLoading]         = useState(true);
  const [actLoading,      setActLoading]      = useState(false);
  const [funnelLoading,   setFunnelLoading]   = useState(false);
  const [error,           setError]           = useState<string | null>(null);
  const [showUnresolved,  setShowUnresolved]  = useState(false);
  const [sortField,       setSortField]       = useState<keyof AgencyRow>("paid_sessions");
  const [sortDir,         setSortDir]         = useState<"asc" | "desc">("desc");
  const [activeTab,       setActiveTab]       = useState<"agencies" | "activity" | "funnel" | "routing">("agencies");
  const [showPaidOnly,    setShowPaidOnly]    = useState(false);
  const [agencySearch,    setAgencySearch]    = useState("");
  const [drawerSession,   setDrawerSession]   = useState<string | null>(null);
  const [agencyDrawer,    setAgencyDrawer]    = useState<AgencyRow | null>(null);
  const [activeKpiFilter, setActiveKpiFilter] = useState<AgencyKpiKey | null>(null);
  const [demoFilter,      setDemoFilter]      = useState<"all" | "demo_only" | "no_demo">("all");
  const [trafficMode,     setTrafficMode]     = useState<TrafficMode>("all");
  const [breakdownAgencyId,  setBreakdownAgencyId]  = useState<string>("");
  const [breakdownStateSlug, setBreakdownStateSlug] = useState<string>("");
  const tabsRef = useRef<HTMLDivElement>(null);

  const apiBase = `${SUPABASE_URL}/functions/v1/agency-funnel-analytics`;
  const headers = useMemo(() => ({ Authorization: `Bearer ${SUPABASE_ANON_KEY}` }), []);

  function buildParams(base: Record<string, string | number>) {
    const p = new URLSearchParams();
    Object.entries(base).forEach(([k, v]) => p.set(k, String(v)));
    if (days === -1 && customApplied && customFrom) {
      p.set("since_date", new Date(customFrom).toISOString());
      if (customTo) p.set("until_date", new Date(customTo + "T23:59:59").toISOString());
    } else {
      p.set("days", String(days));
    }
    if (demoFilter !== "all") p.set("demo_filter", demoFilter);
    const tmParam = trafficModeToApiParam(trafficMode);
    if (tmParam) p.set("confidence_filter", tmParam);
    return p.toString();
  }

  const fetchActivity = useCallback(async () => {
    setActLoading(true);
    try {
      const qs  = buildParams({ action: "recent_activity", limit: 200 });
      const res = await fetch(`${apiBase}?${qs}`, { headers });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const data = await res.json();
      setActivity(data.sessions || []);
    } catch { /* non-blocking */ } finally { setActLoading(false); }
  }, [apiBase, headers, days, customApplied, customFrom, customTo, demoFilter]);

  const fetchActivityEvents = useCallback(async () => {
    setEvtLoading(true);
    try {
      const qs  = buildParams({ action: "recent_events", limit: 300 });
      const res = await fetch(`${apiBase}?${qs}`, { headers });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const data = await res.json();
      setActivityEvents(data.events || []);
    } catch { /* non-blocking */ } finally { setEvtLoading(false); }
  }, [apiBase, headers, days, customApplied, customFrom, customTo, demoFilter]);

  const fetchFunnelSteps = useCallback(async () => {
    setFunnelLoading(true);
    try {
      const qs  = buildParams({ action: "funnel_steps" });
      const res = await fetch(`${apiBase}?${qs}`, { headers });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const data = await res.json();
      setFunnelSteps({
        steps:      Array.isArray(data?.steps)    ? data.steps    : [],
        drop_off:   Array.isArray(data?.drop_off) ? data.drop_off : [],
        sources:    Array.isArray(data?.sources)  ? data.sources  : [],
        daily:      Array.isArray(data?.daily)    ? data.daily    : [],
        total:      typeof data?.total      === "number" ? data.total      : 0,
        paid_count: typeof data?.paid_count === "number" ? data.paid_count : 0,
      });
    } catch { /* non-blocking */ } finally { setFunnelLoading(false); }
  }, [apiBase, headers, days, customApplied, customFrom, customTo, demoFilter]);

  const fetchActivationBreakdown = useCallback(async () => {
    try {
      const extra: Record<string, string | number> = { action: "activation_upgrade_breakdown" };
      if (breakdownAgencyId)  extra.breakdown_agency_id  = breakdownAgencyId;
      if (breakdownStateSlug) extra.breakdown_state_slug = breakdownStateSlug;
      const qs  = buildParams(extra);
      const res = await fetch(`${apiBase}?${qs}`, { headers });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const data = await res.json();
      setActivationBreakdown({
        counts: (data?.counts ?? {}) as Record<string, number>,
        conversion: {
          activation_option_ctr_pct:          Number(data?.conversion?.activation_option_ctr_pct ?? 0),
          standard_upgrade_ctr_pct:           Number(data?.conversion?.standard_upgrade_ctr_pct ?? 0),
          standard_continue_rate_pct:         Number(data?.conversion?.standard_continue_rate_pct ?? 0),
          top25_confirm_continue_ctr_pct:     Number(data?.conversion?.top25_confirm_continue_ctr_pct ?? 0),
          standard_skip_checkout_rate_pct:    Number(data?.conversion?.standard_skip_checkout_rate_pct ?? 0),
          standard_upgrade_checkout_rate_pct: Number(data?.conversion?.standard_upgrade_checkout_rate_pct ?? 0),
          top25_confirm_checkout_rate_pct:    Number(data?.conversion?.top25_confirm_checkout_rate_pct ?? 0),
        },
        checkout_started_count: Number(data?.checkout_started_count ?? 0),
        checkout_by_source: (data?.checkout_by_source ?? {}) as Record<string, number>,
        breakdowns: {
          activation_option_by_plan:          Array.isArray(data?.breakdowns?.activation_option_by_plan)          ? data.breakdowns.activation_option_by_plan          : [],
          activation_option_by_position:      Array.isArray(data?.breakdowns?.activation_option_by_position)      ? data.breakdowns.activation_option_by_position      : [],
          activation_option_by_plan_position: Array.isArray(data?.breakdowns?.activation_option_by_plan_position) ? data.breakdowns.activation_option_by_plan_position : [],
          top25_addon_by_action:              Array.isArray(data?.breakdowns?.top25_addon_by_action)              ? data.breakdowns.top25_addon_by_action              : [],
          top25_addon_by_addon:               Array.isArray(data?.breakdowns?.top25_addon_by_addon)               ? data.breakdowns.top25_addon_by_addon               : [],
        },
        total_events: Number(data?.total_events ?? 0),
      });
    } catch { /* non-blocking */ }
  }, [apiBase, headers, days, customApplied, customFrom, customTo, demoFilter, breakdownAgencyId, breakdownStateSlug]);

  const fetchData = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const qs  = buildParams({ action: "per_agency" });
      const res = await fetch(`${apiBase}?${qs}`, { headers });
      if (!res.ok) throw new Error(`per_agency HTTP ${res.status}`);
      const data = await res.json();
      setKpis(data.kpis || null);
      setAgencyRows(data.rows || []);
    } catch (e) {
      setError((e as Error).message);
    } finally {
      setLoading(false);
    }
    await Promise.all([fetchActivity(), fetchActivityEvents(), fetchFunnelSteps(), fetchActivationBreakdown()]);
  }, [days, apiBase, headers, customApplied, customFrom, customTo, demoFilter, trafficMode, fetchActivity, fetchActivityEvents, fetchFunnelSteps, fetchActivationBreakdown]);

  useEffect(() => { fetchData(); }, [fetchData]);

  // ── derived ──────────────────────────────────────────────────────────────

  const handleKpiClick = useCallback((key: AgencyKpiKey) => {
    setActiveKpiFilter((prev) => {
      const next = prev === key ? null : key;
      if (next !== null) {
        setActiveTab("agencies");
        setTimeout(() => tabsRef.current?.scrollIntoView({ behavior: "smooth", block: "start" }), 50);
      }
      return next;
    });
  }, []);

  const sortedRows = useMemo(() => {
    return [...agencyRows]
      .filter((r) => {
        if (!showUnresolved && r.is_unresolved) return false;
        if (showPaidOnly && r.paid_sessions === 0) return false;
        if (agencySearch) {
          const q    = agencySearch.toLowerCase();
          const name = (r.agency_name || r.agency_slug || "").toLowerCase();
          const state = (r.state_slug || "").toLowerCase();
          if (!name.includes(q) && !state.includes(q)) return false;
        }
        if (activeKpiFilter && activeKpiFilter !== "sessions") {
          if (!KPI_FILTER_CFG[activeKpiFilter].predicate(r)) return false;
        }
        return true;
      })
      .sort((a, b) => {
        const av = a[sortField];
        const bv = b[sortField];
        if (av === null || av === undefined) return 1;
        if (bv === null || bv === undefined) return -1;
        const cmp = av < bv ? -1 : av > bv ? 1 : 0;
        return sortDir === "desc" ? -cmp : cmp;
      });
  }, [agencyRows, showUnresolved, showPaidOnly, agencySearch, sortField, sortDir, activeKpiFilter]);

  const resolvedActivity   = useMemo(() => activity.filter((s) => !s.is_unresolved_session), [activity]);
  const unresolvedActivity = useMemo(() => activity.filter((s) =>  s.is_unresolved_session), [activity]);
  const paidActivity       = useMemo(() => resolvedActivity.filter((s) => s.stage === "paid"), [resolvedActivity]);

  const unresolvedCount = agencyRows.filter((r) => r.is_unresolved).length;
  const rangeLabel      = days === -1
    ? (customApplied && customFrom ? `${customFrom}→${customTo || "now"}` : "Custom")
    : RANGES.find((r) => r.days === days)?.label ?? `${days}d`;

  function toggleSort(field: keyof AgencyRow) {
    if (sortField === field) setSortDir((d) => (d === "desc" ? "asc" : "desc"));
    else { setSortField(field); setSortDir("desc"); }
  }

  function applyCustomRange() {
    if (!customFrom) return;
    setCustomApplied(true);
  }

  function handleOpenSession(id: string) {
    setAgencyDrawer(null);
    setTimeout(() => setDrawerSession(id), 50);
  }

  // ── render ───────────────────────────────────────────────────────────────

  return (
    <WpAdminLayout
      title="Agency Funnel Analytics"
      subtitle="Purchase attribution, funnel health & session intelligence"
    >
      {/* Session detail drawer */}
      {drawerSession && (
        <SessionDetailDrawer
          sessionId={drawerSession}
          onClose={() => setDrawerSession(null)}
        />
      )}

      {/* Agency detail drawer */}
      {agencyDrawer && !drawerSession && (
        <AgencyDetailDrawer
          row={agencyDrawer}
          activity={activity}
          onClose={() => setAgencyDrawer(null)}
          onOpenSession={handleOpenSession}
        />
      )}

      <div className="space-y-5">

        {/* ── Time range bar ── */}
        <div className="bg-white border border-slate-200 rounded-xl px-4 py-3 flex items-center gap-3 flex-wrap">
          <div className="flex items-center gap-1 text-xs font-medium text-slate-500 mr-1">
            <Clock className="w-3.5 h-3.5" />
            Period:
          </div>
          <div className="flex items-center gap-1 bg-slate-100 rounded-lg p-1">
            {RANGES.map((r) => (
              <button
                key={r.label}
                onClick={() => { setDays(r.days); if (r.days !== -1) setCustomApplied(false); }}
                className={`px-2.5 py-1 text-xs font-medium rounded-md transition-all ${
                  days === r.days ? "bg-white text-slate-900 shadow-sm" : "text-slate-500 hover:text-slate-700"
                }`}
              >
                {r.label}
              </button>
            ))}
          </div>

          {days === -1 && (
            <div className="flex items-center gap-2 flex-wrap">
              <div className="flex items-center gap-1.5">
                <Calendar className="w-3 h-3 text-slate-400" />
                <input type="date" value={customFrom}
                  onChange={(e) => { setCustomFrom(e.target.value); setCustomApplied(false); }}
                  className="text-xs border border-slate-200 rounded px-2 py-1 text-slate-700 focus:outline-none focus:ring-1 focus:ring-blue-400"
                />
              </div>
              <span className="text-xs text-slate-400">to</span>
              <input type="date" value={customTo}
                onChange={(e) => { setCustomTo(e.target.value); setCustomApplied(false); }}
                className="text-xs border border-slate-200 rounded px-2 py-1 text-slate-700 focus:outline-none focus:ring-1 focus:ring-blue-400"
              />
              <button onClick={applyCustomRange} disabled={!customFrom}
                className="px-3 py-1 text-xs bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-40 transition-colors"
              >Apply</button>
              {customApplied && (
                <button onClick={() => { setCustomApplied(false); setCustomFrom(""); setCustomTo(""); }}
                  className="p-1 text-slate-400 hover:text-slate-600"
                ><X className="w-3 h-3" /></button>
              )}
            </div>
          )}

          <div className="flex items-center gap-1 bg-slate-100 rounded-lg p-1 ml-2">
            {(["all", "no_demo", "demo_only"] as const).map((opt) => {
              const labels = { all: "All", no_demo: "Real", demo_only: "Demo" };
              return (
                <button
                  key={opt}
                  onClick={() => setDemoFilter(opt)}
                  className={`px-2.5 py-1 text-xs font-medium rounded-md transition-all ${
                    demoFilter === opt ? "bg-white text-slate-900 shadow-sm" : "text-slate-500 hover:text-slate-700"
                  }`}
                >
                  {labels[opt]}
                </button>
              );
            })}
          </div>

          <div className="ml-auto flex items-center gap-2">
            {(customApplied || days >= 0) && (
              <span className="text-xs text-slate-400">
                Showing: <span className="font-medium text-slate-600">{rangeLabel}</span>
              </span>
            )}
            <button onClick={fetchData} disabled={loading}
              className="flex items-center gap-1.5 px-3 py-1.5 bg-white border border-slate-200 rounded-lg text-xs text-slate-600 hover:bg-slate-50 disabled:opacity-50 transition-colors"
            >
              <RefreshCw className={`w-3 h-3 ${loading ? "animate-spin" : ""}`} />
              Refresh
            </button>
          </div>
        </div>

        <TrafficModeToggle value={trafficMode} onChange={setTrafficMode} compact />

        {/* ── Error ── */}
        {error && (
          <div className="bg-red-50 border border-red-200 rounded-xl p-4 flex items-center gap-3 text-sm text-red-700">
            <AlertTriangle className="w-4 h-4 shrink-0" />
            <span>{error}</span>
          </div>
        )}

        {/* ── KPI cards ── */}
        <div className="grid grid-cols-2 sm:grid-cols-4 lg:grid-cols-8 gap-3">
          {loading ? (
            Array.from({ length: 8 }).map((_, i) => (
              <div key={i} className="bg-white rounded-xl border border-slate-200 p-4 animate-pulse h-24" />
            ))
          ) : kpis ? (
            <>
              <KpiCard label="Sessions"     value={kpis.total_sessions.toLocaleString()}
                icon={Users} iconCls="bg-blue-50 text-blue-600"
                onClick={() => handleKpiClick("sessions")} isActive={activeKpiFilter === "sessions"} />
              <KpiCard label="Paid"         value={kpis.paid_sessions.toLocaleString()}
                icon={ShoppingCart} iconCls="bg-emerald-50 text-emerald-600" accent={kpis.paid_sessions > 0}
                sub={fmtPct(kpis.paid_sessions, kpis.total_sessions) + " conv."}
                onClick={() => handleKpiClick("paid")} isActive={activeKpiFilter === "paid"} />
              <KpiCard label="Revenue"      value={kpis.revenue > 0 ? `$${kpis.revenue.toFixed(0)}` : "—"}
                icon={DollarSign} iconCls="bg-emerald-50 text-emerald-700" accent={kpis.revenue > 0}
                sub={kpis.stripe_revenue && kpis.stripe_revenue !== kpis.revenue ? `$${kpis.stripe_revenue.toFixed(0)} Stripe` : undefined}
                onClick={() => handleKpiClick("revenue")} isActive={activeKpiFilter === "revenue"} />
              <KpiCard label="Avg Order"    value={fmtAvgOrder(kpis.revenue, kpis.paid_sessions)}
                icon={TrendingUp} iconCls="bg-amber-50 text-amber-600"
                onClick={() => handleKpiClick("avg_order")} isActive={activeKpiFilter === "avg_order"} />
              <KpiCard label="Conv Rate"    value={fmtPct(kpis.paid_sessions, kpis.total_sessions)}
                icon={Percent} iconCls="bg-sky-50 text-sky-600"
                onClick={() => handleKpiClick("convrate")} isActive={activeKpiFilter === "convrate"} />
              <KpiCard label="Checkouts"    value={(kpis.checkout_opens || 0).toLocaleString()}
                icon={CreditCard} iconCls="bg-blue-50 text-blue-500"
                sub={fmtPct(kpis.checkout_opens || 0, kpis.total_sessions) + " of sessions"}
                onClick={() => handleKpiClick("checkouts")} isActive={activeKpiFilter === "checkouts"} />
              <KpiCard label="Demos Opened" value={(kpis.demo_opens || 0).toLocaleString()}
                icon={Eye} iconCls="bg-sky-50 text-sky-600"
                onClick={() => handleKpiClick("demos")} isActive={activeKpiFilter === "demos"} />
              <KpiCard label="Upsells"      value={kpis.upsells.toLocaleString()}
                icon={Zap} iconCls="bg-orange-50 text-orange-600"
                sub={fmtPct(kpis.upsells, kpis.paid_sessions) + " of paid"}
                onClick={() => handleKpiClick("upsells")} isActive={activeKpiFilter === "upsells"} />
            </>
          ) : null}
        </div>

        {/* ── Active KPI filter banner ── */}
        {activeKpiFilter && (
          <div className="flex items-center gap-3 bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5">
            <span className="relative flex h-2.5 w-2.5 shrink-0">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75" />
              <span className="relative inline-flex rounded-full h-2.5 w-2.5 bg-emerald-500" />
            </span>
            <span className="text-sm text-slate-600">
              Viewing: <span className="font-semibold text-slate-800">{KPI_FILTER_CFG[activeKpiFilter].viewingLabel}</span>
              <span className="text-slate-400 ml-2">— {sortedRows.length} {sortedRows.length === 1 ? "agency" : "agencies"}</span>
            </span>
            <button
              onClick={() => setActiveKpiFilter(null)}
              className="ml-auto flex items-center gap-1.5 px-3 py-1 text-xs text-slate-500 hover:text-slate-700 bg-white border border-slate-200 rounded-lg hover:bg-slate-50 transition-colors"
            >
              <X className="w-3 h-3" />
              Clear filter
            </button>
          </div>
        )}

        {/* ── Tab strip ── */}
        <div ref={tabsRef} className="flex items-center gap-0 border-b border-slate-200 -mb-1">
          {(["agencies", "activity", "funnel", "routing"] as const).map((tab) => {
            const labels: Record<string, React.ReactNode> = {
              agencies: (
                <span className="flex items-center gap-1.5">
                  <BarChart2 className="w-3.5 h-3.5" />
                  Per-Agency
                  <span className={`text-[10px] rounded-full px-1.5 py-0.5 ${activeTab === tab ? "bg-blue-100 text-blue-700" : "bg-slate-100 text-slate-500"}`}>
                    {agencyRows.filter((r) => !r.is_unresolved).length}
                  </span>
                </span>
              ),
              activity: (
                <span className="flex items-center gap-1.5">
                  <Activity className="w-3.5 h-3.5" />
                  Activity
                  {paidActivity.length > 0 && (
                    <span className={`text-[10px] rounded-full px-1.5 py-0.5 ${activeTab === tab ? "bg-emerald-100 text-emerald-700" : "bg-slate-100 text-slate-500"}`}>
                      {paidActivity.length} paid
                    </span>
                  )}
                </span>
              ),
              funnel: (
                <span className="flex items-center gap-1.5">
                  <TrendingUp className="w-3.5 h-3.5" />
                  Funnel
                </span>
              ),
              routing: (
                <span className="flex items-center gap-1.5">
                  <Route className="w-3.5 h-3.5" />
                  Smart Follow-up
                </span>
              ),
            };
            return (
              <button
                key={tab}
                onClick={() => setActiveTab(tab)}
                className={`relative px-5 py-2.5 text-sm font-medium transition-colors ${
                  activeTab === tab
                    ? "text-blue-600 after:absolute after:bottom-0 after:inset-x-0 after:h-0.5 after:bg-blue-500"
                    : "text-slate-500 hover:text-slate-800"
                }`}
              >
                {labels[tab]}
              </button>
            );
          })}
        </div>

        {/* ════════════════════════════════════════════════════════════════════ */}
        {/* Per-Agency tab  — compact 6-column no-scroll table                 */}
        {/* ════════════════════════════════════════════════════════════════════ */}
        {activeTab === "agencies" && (
          <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-sm">

            {/* Toolbar */}
            <div className="px-5 py-3 border-b border-slate-100 flex items-center gap-3 flex-wrap">
              <div className="relative flex-1 min-w-48 max-w-xs">
                <Search className="absolute left-2.5 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400 pointer-events-none" />
                <input
                  type="text"
                  placeholder="Search agency or state…"
                  value={agencySearch}
                  onChange={(e) => setAgencySearch(e.target.value)}
                  className="w-full pl-8 pr-3 py-1.5 text-sm border border-slate-200 rounded-lg focus:outline-none focus:ring-1 focus:ring-blue-400 bg-slate-50"
                />
                {agencySearch && (
                  <button onClick={() => setAgencySearch("")} className="absolute right-2 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600">
                    <X className="w-3.5 h-3.5" />
                  </button>
                )}
              </div>

              <div className="flex items-center gap-1.5 mr-auto">
                <Filter className="w-3 h-3 text-slate-400" />
                <span className="text-xs text-slate-500">
                  <span className="font-semibold text-slate-700">{sortedRows.length}</span> agencies
                  {unresolvedCount > 0 && !showUnresolved && (
                    <span className="text-slate-400 ml-1">({unresolvedCount} unresolved hidden)</span>
                  )}
                </span>
              </div>

              <label className="flex items-center gap-1.5 text-xs text-slate-500 cursor-pointer select-none">
                <input type="checkbox" checked={showPaidOnly} onChange={(e) => setShowPaidOnly(e.target.checked)} className="rounded border-slate-300" />
                Paid only
              </label>
              <label className="flex items-center gap-1.5 text-xs text-slate-500 cursor-pointer select-none">
                <input type="checkbox" checked={showUnresolved} onChange={(e) => setShowUnresolved(e.target.checked)} className="rounded border-slate-300" />
                Show unresolved
              </label>
            </div>

            {loading ? (
              <div className="p-10 text-center text-slate-400 text-sm">
                <RefreshCw className="w-5 h-5 animate-spin mx-auto mb-2 text-slate-300" />Loading…
              </div>
            ) : sortedRows.length === 0 ? (
              <div className="p-10 text-center text-slate-400 text-sm">No agency data for this period</div>
            ) : (
              <table className="w-full text-sm">
                <thead>
                  <tr className="bg-slate-50 border-b border-slate-100 text-[10px] text-slate-500 font-semibold uppercase tracking-wider">
                    <th className="px-5 py-3 text-left">Agency</th>
                    <Th label="Sessions" field="total_sessions" sort={sortField} dir={sortDir} onSort={toggleSort} />
                    <Th label="Revenue"  field="revenue"        sort={sortField} dir={sortDir} onSort={toggleSort} />
                    <th className="px-4 py-3 text-right whitespace-nowrap">Conv %</th>
                    <th className="px-4 py-3 text-right whitespace-nowrap">Status</th>
                    <Th label="Last Activity" field="last_seen" sort={sortField} dir={sortDir} onSort={toggleSort} />
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-50">
                  {sortedRows.map((row) => {
                    const status  = computeStatus(row);
                    const convPct = row.total_sessions > 0
                      ? ((row.paid_sessions / row.total_sessions) * 100).toFixed(1) + "%"
                      : "—";
                    return (
                      <tr
                        key={row.agency_key}
                        onClick={() => setAgencyDrawer(row)}
                        className={`hover:bg-slate-50 cursor-pointer transition-colors group ${
                          status === "paid" ? "bg-emerald-50/20" : ""
                        }`}
                      >
                        {/* Agency */}
                        <td className="px-5 py-3">
                          <div className="flex items-center gap-2">
                            <div className={`w-1.5 h-1.5 rounded-full shrink-0 ${STATUS_CFG[status].dot}`} />
                            <div className="min-w-0">
                              <div className="font-semibold text-slate-900 truncate max-w-[200px] flex items-center gap-1.5">
                                <span className="truncate">{row.agency_name || row.agency_slug || row.agency_key}</span>
                                <ExternalLink className="w-3 h-3 text-slate-300 shrink-0 opacity-0 group-hover:opacity-100 transition-opacity" />
                              </div>
                              <div className="text-[11px] text-slate-400 mt-0.5 flex items-center gap-2">
                                {row.state_slug && <span>{formatStateName(row.state_slug)}</span>}
                                {row.is_unresolved && (
                                  <span className="text-slate-300 flex items-center gap-0.5">
                                    <Search className="w-2.5 h-2.5" />no agency
                                  </span>
                                )}
                              </div>
                            </div>
                          </div>
                        </td>

                        {/* Sessions */}
                        <td className="px-4 py-3 text-right tabular-nums text-slate-600 text-sm font-medium">
                          {row.total_sessions.toLocaleString()}
                        </td>

                        {/* Revenue */}
                        <td className="px-4 py-3 text-right tabular-nums text-sm font-medium">
                          {row.revenue > 0
                            ? <span className="text-emerald-700">${row.revenue.toFixed(0)}</span>
                            : <span className="text-slate-300">—</span>}
                        </td>

                        {/* Conv% */}
                        <td className="px-4 py-3 text-right text-[12px] text-slate-500 tabular-nums">
                          {convPct}
                        </td>

                        {/* Status */}
                        <td className="px-4 py-3 text-right">
                          <StatusBadge status={status} />
                        </td>

                        {/* Last Activity */}
                        <td
                          className="px-4 py-3 text-right text-[11px] text-slate-400 whitespace-nowrap cursor-default"
                          title={fmtDate(row.last_seen)}
                        >
                          {timeAgo(row.last_seen)}
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            )}
          </div>
        )}

        {/* ════════════════════════════════════════════════════════════════════ */}
        {/* Activity tab                                                        */}
        {/* ════════════════════════════════════════════════════════════════════ */}
        {activeTab === "activity" && (
          <div className="space-y-4">

            {paidActivity.length > 0 && (
              <div className="bg-emerald-50 border border-emerald-200 rounded-xl px-5 py-3 flex items-center gap-3">
                <CheckCircle2 className="w-4 h-4 text-emerald-600 shrink-0" />
                <span className="text-sm font-medium text-emerald-800">
                  {paidActivity.length} paid conversion{paidActivity.length !== 1 ? "s" : ""} in the last {rangeLabel}
                </span>
                <span className="text-sm text-emerald-700 ml-auto font-bold">
                  {fmtCurrency(paidActivity.reduce((s, a) => s + ((a.purchased_amount ?? 0) / 100), 0))} total
                </span>
              </div>
            )}

            {/* ── Event Timeline ── */}
            <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
              <div className="px-5 py-3 border-b border-slate-100 flex items-center gap-3">
                <Zap className="w-4 h-4 text-blue-400" />
                <span className="text-sm font-semibold text-slate-700">Event Timeline</span>
                <span className="text-xs text-slate-400">— every step in real time</span>
                <span className="ml-auto text-xs text-slate-400">{activityEvents.length} events</span>
              </div>
              {evtLoading ? (
                <div className="p-8 text-center text-slate-400 text-sm">
                  <RefreshCw className="w-4 h-4 animate-spin mx-auto mb-2 text-slate-300" />Loading…
                </div>
              ) : activityEvents.length === 0 ? (
                <div className="p-8 text-center text-slate-400 text-sm">No events in the last {rangeLabel}</div>
              ) : (
                <div className="divide-y divide-slate-50 max-h-[480px] overflow-y-auto">
                  {activityEvents.map((evt) => (
                    <button
                      key={evt.id}
                      onClick={() => setDrawerSession(evt.session_id)}
                      className={`w-full px-5 py-2.5 flex items-center gap-3 hover:bg-slate-50 transition-colors text-left group ${
                        evt.step_number >= 160 ? "bg-emerald-50/30 hover:bg-emerald-50/60" :
                        evt.step_number >= 150 ? "bg-blue-50/20" :
                        evt.step_number >= 140 ? "bg-orange-50/20" : ""
                      }`}
                    >
                      <EventStepBadge step={evt.step_number} />
                      <div className="flex-1 min-w-0">
                        <div className="text-xs font-medium text-slate-800 truncate flex items-center gap-1.5">
                          {evt.agency_name || evt.agency_slug || (
                            <span className="text-slate-400 italic">Anonymous</span>
                          )}
                          {evt.is_demo && (
                            <span className="text-[9px] px-1 py-0.5 rounded bg-slate-100 text-slate-400 font-semibold uppercase tracking-wide">demo</span>
                          )}
                        </div>
                        {evt.search_query && (
                          <div className="text-[10px] text-slate-400 mt-0.5 flex items-center gap-1">
                            <Search className="w-2.5 h-2.5 shrink-0" />
                            &ldquo;{evt.search_query}&rdquo;
                          </div>
                        )}
                        {!evt.search_query && evt.state_slug && (
                          <div className="text-[10px] text-slate-400 mt-0.5">{formatStateName(evt.state_slug)}</div>
                        )}
                      </div>
                      <div className="shrink-0 text-[10px] text-slate-400 whitespace-nowrap" title={fmtDate(evt.created_at)}>
                        {timeAgo(evt.created_at)}
                      </div>
                      <ArrowRight className="w-3 h-3 text-slate-300 shrink-0 opacity-0 group-hover:opacity-100 transition-opacity" />
                    </button>
                  ))}
                </div>
              )}
            </div>

            {/* ── Agency Sessions (session-level rollup) ── */}
            <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
              <div className="px-5 py-3 border-b border-slate-100 flex items-center gap-3">
                <Activity className="w-4 h-4 text-slate-400" />
                <span className="text-sm font-semibold text-slate-700">Agency Sessions</span>
                <span className="text-xs text-slate-400">— last {rangeLabel}</span>
                <span className="ml-auto text-xs text-slate-400">{resolvedActivity.length} sessions</span>
              </div>

              {actLoading ? (
                <div className="p-8 text-center text-slate-400 text-sm">
                  <RefreshCw className="w-4 h-4 animate-spin mx-auto mb-2 text-slate-300" />Loading…
                </div>
              ) : resolvedActivity.length === 0 ? (
                <div className="p-8 text-center text-slate-400 text-sm">No agency sessions in the last {rangeLabel}</div>
              ) : (
                <div className="divide-y divide-slate-50">
                  {resolvedActivity.map((s) => (
                    <button
                      key={s.id}
                      onClick={() => setDrawerSession(s.id)}
                      className={`w-full px-5 py-3 flex items-center gap-4 hover:bg-slate-50 transition-colors text-left group ${
                        s.stage === "paid" ? "bg-emerald-50/30 hover:bg-emerald-50/60" : ""
                      }`}
                    >
                      <div className="shrink-0 w-24">
                        <StageBadge stage={s.stage} />
                      </div>
                      <div className="flex-1 min-w-0">
                        <div className="font-medium text-slate-900 text-sm truncate flex items-center gap-1.5">
                          {s.display_name}
                          <ArrowRight className="w-3 h-3 text-slate-300 shrink-0 opacity-0 group-hover:opacity-100 transition-opacity" />
                        </div>
                        <div className="text-xs text-slate-400 flex items-center gap-2 mt-0.5 flex-wrap">
                          {s.state_slug && <span>{formatStateName(s.state_slug)}</span>}
                          {s.source_label && <SourceLabel label={s.source_label} />}
                          {s.funnel_name === "request_replay" && (
                            <span className="text-[9px] px-1.5 py-0.5 rounded bg-orange-100 text-orange-600 font-semibold uppercase tracking-wide">replay</span>
                          )}
                          {s.step_number !== null && (
                            <span className="text-slate-300">step: {stepLabel(s.step_number)}</span>
                          )}
                        </div>
                      </div>
                      {s.stage === "paid" && (
                        <div className="shrink-0 text-right min-w-[72px]">
                          {s.purchased_amount && s.purchased_amount > 0 && (
                            <div className="text-sm font-bold text-emerald-700">
                              ${(s.purchased_amount / 100).toFixed(0)}
                            </div>
                          )}
                          {s.purchased_product && (
                            <div className="text-[10px] text-slate-400 truncate max-w-[100px]">{s.purchased_product}</div>
                          )}
                        </div>
                      )}
                      <div className="shrink-0 text-xs text-slate-400 whitespace-nowrap" title={fmtDate(s.last_event_at || s.created_at)}>
                        {timeAgo(s.last_event_at || s.created_at)}
                      </div>
                    </button>
                  ))}
                </div>
              )}
            </div>

            {unresolvedActivity.length > 0 && (
              <details className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
                <summary className="px-5 py-3 cursor-pointer text-sm text-slate-500 hover:bg-slate-50 list-none flex items-center gap-3">
                  <Search className="w-4 h-4 text-slate-300 shrink-0" />
                  <span className="font-medium text-slate-600">Search &amp; Landing Traffic</span>
                  <span className="bg-slate-100 text-slate-500 text-xs rounded-full px-2 py-0.5">{unresolvedActivity.length}</span>
                  <span className="ml-auto text-xs text-slate-400">Expand to view anonymous visitors</span>
                </summary>
                <div className="border-t border-slate-100 divide-y divide-slate-50">
                  {unresolvedActivity.map((s) => (
                    <button
                      key={s.id}
                      onClick={() => setDrawerSession(s.id)}
                      className="w-full px-5 py-2.5 flex items-center gap-4 opacity-60 hover:opacity-100 hover:bg-slate-50 transition-all text-left"
                    >
                      <div className="shrink-0 w-24">
                        <StageBadge stage={s.stage} />
                      </div>
                      <div className="flex-1 min-w-0">
                        <div className="text-sm text-slate-600 truncate flex items-center gap-1.5">
                          <span className="inline-flex items-center gap-1 px-1.5 py-0.5 rounded text-[10px] bg-slate-50 text-slate-400 border border-slate-200">
                            <Search className="w-2.5 h-2.5" />no agency
                          </span>
                          <span>{s.display_name}</span>
                        </div>
                        <div className="text-[10px] text-slate-400 mt-0.5">
                          {s.source_label && <span className="mr-2">{s.source_label}</span>}
                          {s.entry_path ? `entry: ${s.entry_path}` : ""}
                          {s.step_number ? ` · step ${s.step_number}` : ""}
                        </div>
                      </div>
                      <div className="shrink-0 text-xs text-slate-400 whitespace-nowrap" title={fmtDate(s.created_at)}>
                        {timeAgo(s.created_at)}
                      </div>
                    </button>
                  ))}
                </div>
              </details>
            )}
          </div>
        )}

        {/* ════════════════════════════════════════════════════════════════════ */}
        {/* Funnel Analytics tab                                                */}
        {/* ════════════════════════════════════════════════════════════════════ */}
        {activeTab === "funnel" && (
          <div className="space-y-5">
            {funnelLoading ? (
              <div className="p-10 text-center text-slate-400 text-sm">
                <RefreshCw className="w-5 h-5 animate-spin mx-auto mb-2 text-slate-300" />Loading funnel data…
              </div>
            ) : !funnelSteps ? (
              <div className="p-10 text-center text-slate-400 text-sm">No funnel data for this period</div>
            ) : (
              <>
                <div className="bg-white rounded-xl border border-slate-200 shadow-sm p-5">
                  <div className="flex items-center gap-2 mb-4">
                    <TrendingUp className="w-4 h-4 text-blue-500" />
                    <h3 className="text-sm font-semibold text-slate-800">Conversion Funnel</h3>
                    <span className="text-xs text-slate-400 ml-auto">
                      {(funnelSteps.total ?? 0).toLocaleString()} total sessions · {funnelSteps.paid_count ?? 0} paid
                    </span>
                  </div>
                  <div className="space-y-2.5">
                    {(funnelSteps.steps ?? []).map((step) => (
                      <FunnelBar
                        key={step.label}
                        label={step.label}
                        count={step.count ?? 0}
                        total={funnelSteps.total ?? 0}
                        pct={step.pct_of_total ?? 0}
                      />
                    ))}
                  </div>
                </div>

                <div className="grid grid-cols-1 lg:grid-cols-2 gap-5">
                  <div className="bg-white rounded-xl border border-slate-200 shadow-sm p-5">
                    <div className="flex items-center gap-2 mb-4">
                      <AlertTriangle className="w-4 h-4 text-amber-500" />
                      <h3 className="text-sm font-semibold text-slate-800">Drop-off Distribution</h3>
                      <span className="text-xs text-slate-400 ml-auto">where sessions end</span>
                    </div>
                    {(funnelSteps.drop_off ?? []).length === 0 ? (
                      <p className="text-xs text-slate-400 text-center py-6">No drop-off data</p>
                    ) : (
                      <div className="space-y-2">
                        {(funnelSteps.drop_off ?? []).slice(0, 12).map((b) => {
                          const pct    = (funnelSteps.total ?? 0) > 0 ? (b.count / funnelSteps.total) * 100 : 0;
                          const isPaid = b.step_number >= 160;
                          return (
                            <div key={b.step_number} className="flex items-center gap-3">
                              <div className="w-28 shrink-0 text-[11px] text-slate-500 text-right">{b.label}</div>
                              <div className="flex-1 h-5 bg-slate-100 rounded overflow-hidden">
                                <div
                                  className={`h-full rounded transition-all ${isPaid ? "bg-emerald-400" : "bg-amber-300"}`}
                                  style={{ width: `${Math.max(2, pct)}%` }}
                                />
                              </div>
                              <div className="w-16 shrink-0 text-right">
                                <span className="text-xs font-medium text-slate-700">{b.count}</span>
                                <span className="text-[10px] text-slate-400 ml-0.5">({pct.toFixed(1)}%)</span>
                              </div>
                            </div>
                          );
                        })}
                      </div>
                    )}
                  </div>

                  <div className="bg-white rounded-xl border border-slate-200 shadow-sm p-5">
                    <div className="flex items-center gap-2 mb-4">
                      <Globe className="w-4 h-4 text-sky-500" />
                      <h3 className="text-sm font-semibold text-slate-800">Source Breakdown</h3>
                      <span className="text-xs text-slate-400 ml-auto">by origin</span>
                    </div>
                    {(funnelSteps.sources ?? []).length === 0 ? (
                      <p className="text-xs text-slate-400 text-center py-6">No source data</p>
                    ) : (
                      <div className="space-y-3">
                        {(funnelSteps.sources ?? []).map((src) => {
                          const pct     = (funnelSteps.total ?? 0) > 0 ? (src.count / funnelSteps.total) * 100 : 0;
                          const convPct = src.count > 0 ? (src.paid / src.count) * 100 : 0;
                          return (
                            <div key={src.source_label}>
                              <div className="flex items-center justify-between mb-1">
                                <span className="text-xs font-medium text-slate-700 truncate max-w-[160px]">{src.source_label}</span>
                                <div className="flex items-center gap-2 shrink-0">
                                  {src.paid > 0 && (
                                    <span className="text-[10px] text-emerald-600 font-semibold">
                                      {src.paid} paid ({convPct.toFixed(0)}%)
                                    </span>
                                  )}
                                  <span className="text-xs text-slate-400 tabular-nums">{src.count}</span>
                                </div>
                              </div>
                              <div className="h-1.5 bg-slate-100 rounded-full overflow-hidden">
                                <div className="h-full bg-sky-400 rounded-full transition-all" style={{ width: `${Math.max(2, pct)}%` }} />
                              </div>
                            </div>
                          );
                        })}
                      </div>
                    )}
                  </div>
                </div>

                <div className="bg-white rounded-xl border border-emerald-200 shadow-sm p-5">
                  <div className="flex flex-col gap-3 mb-4">
                    <div className="flex items-center gap-2">
                      <TrendingUp className="w-4 h-4 text-emerald-600" />
                      <h3 className="text-base font-semibold text-slate-900">Activation &amp; Upsell Funnel</h3>
                      <span className="text-[10px] uppercase tracking-wide text-emerald-700 bg-emerald-50 border border-emerald-200 rounded px-1.5 py-0.5">
                        additive
                      </span>
                      <span className="text-xs text-slate-400 ml-auto">
                        {(activationBreakdown?.total_events ?? 0).toLocaleString()} events
                      </span>
                    </div>

                    <div className="flex flex-wrap items-center gap-2">
                      <label className="text-[11px] text-slate-500 font-medium">Agency</label>
                      <select
                        value={breakdownAgencyId}
                        onChange={(e) => setBreakdownAgencyId(e.target.value)}
                        className="text-xs border border-slate-200 rounded px-2 py-1 bg-white text-slate-700 min-w-[180px] max-w-[260px]"
                      >
                        <option value="">All agencies</option>
                        {Array.from(
                          new Map(
                            agencyRows
                              .filter((r) => r.agency_id)
                              .map((r) => [r.agency_id as string, r.agency_name || r.agency_slug || (r.agency_id as string)]),
                          ).entries(),
                        )
                          .sort((a, b) => a[1].localeCompare(b[1]))
                          .map(([id, label]) => (
                            <option key={id} value={id}>{label}</option>
                          ))}
                      </select>

                      <label className="text-[11px] text-slate-500 font-medium ml-2">State</label>
                      <select
                        value={breakdownStateSlug}
                        onChange={(e) => setBreakdownStateSlug(e.target.value)}
                        className="text-xs border border-slate-200 rounded px-2 py-1 bg-white text-slate-700 min-w-[140px]"
                      >
                        <option value="">All states</option>
                        {Array.from(new Set(agencyRows.map((r) => r.state_slug).filter((s): s is string => !!s)))
                          .sort()
                          .map((s) => (
                            <option key={s} value={s}>{formatStateName(s)}</option>
                          ))}
                      </select>

                      {(breakdownAgencyId || breakdownStateSlug) && (
                        <button
                          type="button"
                          onClick={() => { setBreakdownAgencyId(""); setBreakdownStateSlug(""); }}
                          className="text-[11px] text-slate-500 hover:text-slate-700 underline"
                        >
                          Clear
                        </button>
                      )}
                      <span className="text-[10px] text-slate-400 ml-auto">Scoped by timeframe bar above</span>
                    </div>
                  </div>

                  {!activationBreakdown || activationBreakdown.total_events === 0 ? (
                    <div className="text-xs text-slate-500 border border-dashed border-slate-200 rounded-lg p-4 text-center">
                      No activation or upsell events in this range
                      {breakdownAgencyId || breakdownStateSlug ? " for the selected filters" : ""}.
                    </div>
                  ) : (
                  <>
                  <div className="flex items-center gap-2 mb-4">
                      <span className="text-xs text-slate-400">
                        {activationBreakdown.total_events.toLocaleString()} events matched
                      </span>
                    </div>

                    <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3 mb-5">
                      {[
                        { label: "Activation CTR",       value: activationBreakdown.conversion.activation_option_ctr_pct,       hint: "option_clicked / page_viewed" },
                        { label: "Std Upgrade CTR",      value: activationBreakdown.conversion.standard_upgrade_ctr_pct,        hint: "upgrade_clicked / offer_viewed" },
                        { label: "Std Continue Rate",    value: activationBreakdown.conversion.standard_continue_rate_pct,      hint: "standard_continued / offer_viewed" },
                        { label: "Confirm Continue CTR", value: activationBreakdown.conversion.top25_confirm_continue_ctr_pct,  hint: "continue_clicked / confirm_viewed" },
                      ].map((k) => (
                        <div key={k.label} className="border border-slate-200 rounded-lg p-3 bg-slate-50">
                          <div className="text-[11px] text-slate-500">{k.label}</div>
                          <div className="text-lg font-semibold text-slate-800 tabular-nums">{k.value.toFixed(2)}%</div>
                          <div className="text-[9px] text-slate-400 mt-0.5">{k.hint}</div>
                        </div>
                      ))}
                    </div>

                    <div className="mb-5 border border-slate-200 rounded-lg p-4 bg-white">
                      <div className="text-xs font-semibold text-slate-700 mb-3">
                        Checkout Starts by Source
                        <span className="ml-2 font-normal text-[10px] text-slate-400">(deduped per Stripe session)</span>
                      </div>
                      <div className="grid grid-cols-1 md:grid-cols-3 gap-3 mb-4">
                        {[
                          {
                            label: "Standard Skip Checkout Rate",
                            rate: activationBreakdown.conversion.standard_skip_checkout_rate_pct,
                            num:  activationBreakdown.checkout_by_source?.standard_upgrade_offer_skip ?? 0,
                            den:  activationBreakdown.counts["standard_upgrade_offer_standard_continued"] ?? 0,
                            hint: "source=standard_upgrade_offer_skip / standard_continued",
                          },
                          {
                            label: "Standard Upgrade Checkout Rate",
                            rate: activationBreakdown.conversion.standard_upgrade_checkout_rate_pct,
                            num:  activationBreakdown.checkout_by_source?.standard_upgrade_offer_converted ?? 0,
                            den:  activationBreakdown.counts["standard_upgrade_offer_upgrade_clicked"] ?? 0,
                            hint: "source=standard_upgrade_offer_converted / upgrade_clicked",
                          },
                          {
                            label: "Top25 Confirm Checkout Rate",
                            rate: activationBreakdown.conversion.top25_confirm_checkout_rate_pct,
                            num:  activationBreakdown.checkout_by_source?.top25_confirm ?? 0,
                            den:  activationBreakdown.counts["top25_confirm_continue_clicked"] ?? 0,
                            hint: "source=top25_confirm / confirm_continue_clicked",
                          },
                        ].map((k) => (
                          <div key={k.label} className="border border-slate-200 rounded-lg p-3 bg-slate-50">
                            <div className="text-[11px] text-slate-500">{k.label}</div>
                            <div className="text-lg font-semibold text-slate-800 tabular-nums">{k.rate.toFixed(2)}%</div>
                            <div className="text-[10px] text-slate-500 tabular-nums mt-0.5">
                              {k.num.toLocaleString()} / {k.den.toLocaleString()}
                            </div>
                            <div className="text-[9px] text-slate-400 mt-0.5">{k.hint}</div>
                          </div>
                        ))}
                      </div>
                      <div className="grid grid-cols-2 md:grid-cols-4 gap-2 text-xs">
                        {[
                          { key: "standard_upgrade_offer_skip",      label: "Standard skip" },
                          { key: "standard_upgrade_offer_converted", label: "Standard upgrade" },
                          { key: "top25_confirm",                    label: "Top25 confirm" },
                          { key: "top25_claim_confirm",              label: "Top25 claim confirm" },
                          { key: "spotlight_confirm",                label: "Spotlight confirm" },
                          { key: "activation_upgrade",               label: "Activation upgrade" },
                          { key: "upsell_modal",                     label: "Upsell modal" },
                          { key: "unknown",                          label: "Unknown (not in specific CTRs)" },
                        ].map((row) => {
                          const val = activationBreakdown.checkout_by_source?.[row.key] ?? 0;
                          return (
                            <div key={row.key} className="flex items-center justify-between border border-slate-100 rounded px-2 py-1 bg-slate-50">
                              <span className="text-slate-600 truncate">{row.label}</span>
                              <span className="text-slate-800 font-medium tabular-nums">{val.toLocaleString()}</span>
                            </div>
                          );
                        })}
                      </div>
                    </div>

                    <div className="grid grid-cols-1 lg:grid-cols-2 gap-5">
                      <div>
                        <h4 className="text-xs font-semibold text-slate-700 mb-2">Event Counts</h4>
                        <div className="space-y-1">
                          {[
                            "activation_page_viewed",
                            "activation_option_clicked",
                            "standard_upgrade_offer_viewed",
                            "standard_upgrade_offer_standard_continued",
                            "standard_upgrade_offer_upgrade_clicked",
                            "top25_confirm_viewed",
                            "top25_confirm_addon_toggled",
                            "top25_confirm_continue_clicked",
                            "checkout_page_viewed",
                          ].map((name) => {
                            const val = activationBreakdown.counts[name] ?? 0;
                            const isCheckout = name === "checkout_page_viewed";
                            return (
                              <div key={name} className="flex items-center justify-between text-xs border-b border-slate-100 py-1">
                                <span className="text-slate-600 font-mono truncate">
                                  {name}
                                  {isCheckout && (
                                    <span className="ml-2 text-[9px] text-emerald-700 bg-emerald-50 border border-emerald-200 rounded px-1 py-0.5">
                                      checkout started
                                    </span>
                                  )}
                                </span>
                                <span className="text-slate-800 font-medium tabular-nums">{val.toLocaleString()}</span>
                              </div>
                            );
                          })}
                        </div>
                      </div>

                      <div>
                        <h4 className="text-xs font-semibold text-slate-700 mb-2">Activation Option Clicks by Plan × Position</h4>
                        {activationBreakdown.breakdowns.activation_option_by_plan_position.length === 0 ? (
                          <p className="text-xs text-slate-400 py-3">No option clicks in this range</p>
                        ) : (
                          <div className="overflow-x-auto">
                            <table className="w-full text-xs">
                              <thead>
                                <tr className="text-left text-[10px] text-slate-500 border-b border-slate-200">
                                  <th className="py-1 pr-2">Plan</th>
                                  <th className="py-1 pr-2">Position</th>
                                  <th className="py-1 pr-2 text-right">Price</th>
                                  <th className="py-1 pr-2 text-right">Clicks</th>
                                  <th className="py-1 text-right">CTR</th>
                                </tr>
                              </thead>
                              <tbody>
                                {activationBreakdown.breakdowns.activation_option_by_plan_position.slice(0, 20).map((r, i) => (
                                  <tr key={`${r.plan}:${r.position}:${i}`} className="border-b border-slate-100">
                                    <td className="py-1 pr-2 font-mono text-slate-700">{r.plan}</td>
                                    <td className="py-1 pr-2 font-mono text-slate-600">{r.position}</td>
                                    <td className="py-1 pr-2 text-right tabular-nums text-slate-600">{r.price !== null ? `$${r.price}` : "—"}</td>
                                    <td className="py-1 pr-2 text-right tabular-nums font-medium">{r.count}</td>
                                    <td className="py-1 text-right tabular-nums text-emerald-700">{r.ctr_pct.toFixed(1)}%</td>
                                  </tr>
                                ))}
                              </tbody>
                            </table>
                          </div>
                        )}

                        {activationBreakdown.breakdowns.top25_addon_by_action.length > 0 && (
                          <div className="mt-4">
                            <h4 className="text-xs font-semibold text-slate-700 mb-2">Top25 Add-on Toggles</h4>
                            <div className="flex flex-wrap gap-2">
                              {activationBreakdown.breakdowns.top25_addon_by_action.map((r) => (
                                <span key={r.action} className="text-[11px] border border-slate-200 bg-slate-50 rounded px-2 py-0.5">
                                  {r.action}: <span className="font-medium text-slate-800">{r.count}</span>
                                </span>
                              ))}
                              {activationBreakdown.breakdowns.top25_addon_by_addon.map((r) => (
                                <span key={`addon:${r.addon}`} className="text-[11px] border border-emerald-200 bg-emerald-50 rounded px-2 py-0.5">
                                  {r.addon}: <span className="font-medium text-emerald-800">{r.count}</span>
                                </span>
                              ))}
                            </div>
                          </div>
                        )}
                      </div>
                    </div>
                  </>
                  )}
                </div>

                {(funnelSteps.daily ?? []).length > 1 && (
                  <div className="bg-white rounded-xl border border-slate-200 shadow-sm p-5">
                    <div className="flex items-center gap-2 mb-4">
                      <BarChart2 className="w-4 h-4 text-slate-400" />
                      <h3 className="text-sm font-semibold text-slate-800">Daily Session Trend</h3>
                    </div>
                    <div className="flex items-end gap-1 h-24 overflow-x-auto">
                      {(funnelSteps.daily ?? []).map((d) => {
                        const maxVal   = Math.max(...(funnelSteps.daily ?? []).map((x) => x.total ?? 0), 1);
                        const hPct     = (d.total / maxVal) * 100;
                        const hPctPaid = d.paid > 0 ? (d.paid / maxVal) * 100 : 0;
                        const label    = new Date(d.date).toLocaleDateString("en-US", { month: "short", day: "numeric" });
                        return (
                          <div key={d.date} className="flex flex-col items-center gap-1 flex-1 min-w-[28px] group relative" title={`${label}: ${d.total} sessions, ${d.paid} paid`}>
                            <div className="w-full flex flex-col justify-end h-20">
                              <div className="w-full bg-blue-100 rounded-t-sm relative overflow-hidden" style={{ height: `${hPct}%` }}>
                                {d.paid > 0 && (
                                  <div className="absolute bottom-0 left-0 right-0 bg-emerald-400 rounded-t-sm" style={{ height: `${hPctPaid}%` }} />
                                )}
                              </div>
                            </div>
                            <span className="text-[8px] text-slate-400 whitespace-nowrap opacity-0 group-hover:opacity-100 transition-opacity absolute -bottom-4">
                              {label}
                            </span>
                          </div>
                        );
                      })}
                    </div>
                    <div className="flex items-center gap-4 mt-3 pt-2 border-t border-slate-100">
                      <span className="flex items-center gap-1.5 text-xs text-slate-500">
                        <span className="w-3 h-3 rounded-sm bg-blue-100 inline-block" />All sessions
                      </span>
                      <span className="flex items-center gap-1.5 text-xs text-slate-500">
                        <span className="w-3 h-3 rounded-sm bg-emerald-400 inline-block" />Paid conversions
                      </span>
                    </div>
                  </div>
                )}
              </>
            )}
          </div>
        )}

        {/* ════════════════════════════════════════════════════════════════════ */}
        {/* Smart Follow-up Routing Tab                                          */}
        {/* ════════════════════════════════════════════════════════════════════ */}
        {activeTab === "routing" && (
          <div className="space-y-6">
            <SmartFollowupRoutingTab />
          </div>
        )}

      </div>
    </WpAdminLayout>
  );
}

// ─── sortable table header helper ─────────────────────────────────────────────

function Th({
  label, field, sort, dir, onSort, noIcon,
}: {
  label:   string;
  field:   keyof AgencyRow;
  sort:    keyof AgencyRow;
  dir:     "asc" | "desc";
  onSort:  (f: keyof AgencyRow) => void;
  noIcon?: boolean;
}) {
  return (
    <th
      className="px-4 py-3 text-right whitespace-nowrap cursor-pointer hover:text-slate-800 select-none"
      onClick={() => !noIcon && onSort(field)}
    >
      <span className="flex items-center justify-end gap-0.5">
        {label}
        {!noIcon && <SortIcon active={sort === field} dir={dir} />}
      </span>
    </th>
  );
}

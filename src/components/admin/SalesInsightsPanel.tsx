import { useState, useMemo } from 'react';
import {
  Flame, AlertTriangle, Clock, ShoppingCart, Send,
  ChevronDown, ChevronUp, ArrowRight, TrendingDown,
  CheckCircle,
} from 'lucide-react';

interface AgencyRow {
  agency_id: string | null;
  agency_slug: string;
  agency_name: string;
  total_sessions: number;
  unique_visitors: number;
  entry_search: number;
  entry_direct: number;
  avg_time_on_page: number;
  avg_scroll_depth: number;
  demo_started: number;
  demo_completed: number;
  sales_page_viewed: number;
  checkout_started: number;
  purchases_completed: number;
  total_revenue: number;
  upsell_taken_count: number;
  products: Record<string, number>;
  top_last_step: string;
  top_drop_off_step: string;
  last_steps: Record<string, number>;
  drop_off_steps: Record<string, number>;
}

interface Totals {
  total_agencies: number;
  total_sessions: number;
  total_unique_visitors: number;
  total_demos: number;
  total_purchases: number;
  total_revenue: number;
  entry_search_total: number;
  entry_direct_total: number;
}

function FollowUpButton({ agencyName }: { agencyName: string }) {
  const [sent, setSent] = useState(false);

  const handleClick = (e: React.MouseEvent) => {
    e.stopPropagation();
    setSent(true);
    setTimeout(() => setSent(false), 2000);
  };

  if (sent) {
    return (
      <span className="inline-flex items-center gap-1 text-[10px] text-emerald-600 font-medium">
        <CheckCircle className="w-3 h-3" />
        Queued
      </span>
    );
  }

  return (
    <button
      onClick={handleClick}
      title={`Send follow-up to ${agencyName}`}
      className="inline-flex items-center gap-1 px-2 py-1 rounded text-[10px] font-medium bg-slate-900 text-white hover:bg-slate-800 transition-colors"
    >
      <Send className="w-3 h-3" />
      Follow up
    </button>
  );
}

function SegmentCard({
  title,
  icon,
  iconBg,
  iconColor,
  agencies,
  emptyText,
  onSelectAgency,
}: {
  title: string;
  icon: React.ReactNode;
  iconBg: string;
  iconColor: string;
  agencies: AgencyRow[];
  emptyText: string;
  onSelectAgency: (slug: string, name: string) => void;
}) {
  const [expanded, setExpanded] = useState(false);
  const visible = expanded ? agencies : agencies.slice(0, 5);

  return (
    <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
      <div className="px-4 py-3 border-b border-slate-100 flex items-center justify-between">
        <div className="flex items-center gap-2.5">
          <div className={`w-7 h-7 rounded-lg ${iconBg} flex items-center justify-center`}>
            <span className={iconColor}>{icon}</span>
          </div>
          <div>
            <h4 className="text-sm font-semibold text-slate-700">{title}</h4>
            <span className="text-[10px] text-slate-400">{agencies.length} agencies</span>
          </div>
        </div>
      </div>

      {agencies.length === 0 ? (
        <div className="px-4 py-6 text-center text-xs text-slate-400">{emptyText}</div>
      ) : (
        <>
          <div className="divide-y divide-slate-50">
            {visible.map((row) => (
              <div
                key={row.agency_slug}
                className="px-4 py-2.5 flex items-center justify-between hover:bg-slate-50/50 transition-colors cursor-pointer"
                onClick={() => onSelectAgency(row.agency_slug, row.agency_name)}
              >
                <div className="flex-1 min-w-0 mr-3">
                  <div className="text-xs font-medium text-slate-900 truncate">{row.agency_name}</div>
                  <div className="flex items-center gap-3 mt-0.5">
                    <span className="text-[10px] text-slate-400">{row.total_sessions} sessions</span>
                    {row.demo_started > 0 && (
                      <span className="text-[10px] text-sky-500">{row.demo_started} demos</span>
                    )}
                    <span className="text-[10px] text-slate-400">Last: {row.top_last_step}</span>
                  </div>
                </div>
                <FollowUpButton agencyName={row.agency_name} />
              </div>
            ))}
          </div>
          {agencies.length > 5 && (
            <button
              onClick={() => setExpanded(!expanded)}
              className="w-full px-4 py-2 border-t border-slate-100 text-[10px] font-medium text-slate-500 hover:text-slate-700 hover:bg-slate-50 transition-colors flex items-center justify-center gap-1"
            >
              {expanded ? (
                <>Show less <ChevronUp className="w-3 h-3" /></>
              ) : (
                <>Show all {agencies.length} <ChevronDown className="w-3 h-3" /></>
              )}
            </button>
          )}
        </>
      )}
    </div>
  );
}

function FunnelStep({
  label,
  count,
  prevCount,
  isFirst,
}: {
  label: string;
  count: number;
  prevCount: number;
  isFirst: boolean;
}) {
  const pct = !isFirst && prevCount > 0 ? ((count / prevCount) * 100).toFixed(1) : null;
  const dropPct = pct ? (100 - parseFloat(pct)).toFixed(1) : null;
  const barWidth = prevCount > 0 ? Math.max((count / prevCount) * 100, 4) : 100;

  return (
    <div className="flex items-center gap-3">
      {!isFirst && (
        <div className="flex flex-col items-center w-10 flex-shrink-0">
          <ArrowRight className="w-3.5 h-3.5 text-slate-300" />
          <span className={`text-[10px] font-bold ${parseFloat(dropPct ?? '0') > 50 ? 'text-red-500' : 'text-slate-400'}`}>
            {pct}%
          </span>
        </div>
      )}
      <div className="flex-1 min-w-0">
        <div className="flex items-center justify-between mb-1">
          <span className="text-xs font-medium text-slate-700">{label}</span>
          <span className="text-xs font-bold text-slate-900">{count}</span>
        </div>
        <div className="h-2 rounded-full bg-slate-100 overflow-hidden">
          <div
            className="h-full rounded-full bg-gradient-to-r from-blue-500 to-blue-400 transition-all duration-500"
            style={{ width: `${barWidth}%` }}
          />
        </div>
        {dropPct && parseFloat(dropPct) > 0 && (
          <div className="flex items-center gap-1 mt-0.5">
            <TrendingDown className="w-3 h-3 text-red-400" />
            <span className="text-[10px] text-red-400">{dropPct}% drop</span>
          </div>
        )}
      </div>
    </div>
  );
}

export default function SalesInsightsPanel({
  rows,
  totals,
  onSelectAgency,
}: {
  rows: AgencyRow[];
  totals: Totals;
  onSelectAgency: (slug: string, name: string) => void;
}) {
  const highIntent = useMemo(
    () =>
      rows
        .filter((r) => r.total_sessions >= 2 && r.demo_started > 0 && r.purchases_completed === 0)
        .sort((a, b) => b.demo_started - a.demo_started || b.total_sessions - a.total_sessions),
    [rows]
  );

  const droppedAtDemo = useMemo(
    () =>
      rows
        .filter((r) => r.demo_started > 0 && r.demo_completed === 0 && r.purchases_completed === 0)
        .sort((a, b) => b.total_sessions - a.total_sessions),
    [rows]
  );

  const droppedAtSales = useMemo(
    () =>
      rows
        .filter((r) => r.sales_page_viewed > 0 && r.checkout_started === 0 && r.purchases_completed === 0)
        .sort((a, b) => b.total_sessions - a.total_sessions),
    [rows]
  );

  const droppedAtCheckout = useMemo(
    () =>
      rows
        .filter((r) => r.checkout_started > 0 && r.purchases_completed === 0)
        .sort((a, b) => b.total_sessions - a.total_sessions),
    [rows]
  );

  const engagedNotConverted = useMemo(
    () =>
      rows
        .filter((r) => r.avg_time_on_page > 30 && r.purchases_completed === 0)
        .sort((a, b) => b.avg_time_on_page - a.avg_time_on_page),
    [rows]
  );

  const funnelSteps = useMemo(() => {
    const sessions = totals.total_sessions;
    const demos = rows.reduce((s, r) => s + r.demo_started, 0);
    const salesViewed = rows.reduce((s, r) => s + r.sales_page_viewed, 0);
    const checkouts = rows.reduce((s, r) => s + r.checkout_started, 0);
    const purchases = totals.total_purchases;
    return [
      { label: 'Profile Viewed', count: sessions },
      { label: 'Demo Started', count: demos },
      { label: 'Sales Page Viewed', count: salesViewed },
      { label: 'Checkout Started', count: checkouts },
      { label: 'Purchase Completed', count: purchases },
    ];
  }, [rows, totals]);

  return (
    <div className="space-y-4">
      <div className="border-t border-slate-200 pt-4">
        <h3 className="text-sm font-bold text-slate-800 mb-3 flex items-center gap-2">
          <Flame className="w-4 h-4 text-orange-500" />
          Sales Insights
        </h3>
      </div>

      <div className="bg-white border border-slate-200 rounded-xl p-4">
        <div className="text-xs font-medium text-slate-500 uppercase tracking-wider mb-4">Funnel Step Conversion</div>
        <div className="space-y-3">
          {funnelSteps.map((step, i) => (
            <FunnelStep
              key={step.label}
              label={step.label}
              count={step.count}
              prevCount={i > 0 ? funnelSteps[i - 1].count : step.count}
              isFirst={i === 0}
            />
          ))}
        </div>
      </div>

      <SegmentCard
        title="High Intent Agencies"
        icon={<Flame className="w-3.5 h-3.5" />}
        iconBg="bg-orange-100"
        iconColor="text-orange-600"
        agencies={highIntent}
        emptyText="No high-intent agencies in this period"
        onSelectAgency={onSelectAgency}
      />

      <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
        <SegmentCard
          title="Dropped at Demo"
          icon={<AlertTriangle className="w-3.5 h-3.5" />}
          iconBg="bg-amber-100"
          iconColor="text-amber-600"
          agencies={droppedAtDemo}
          emptyText="None dropped at demo"
          onSelectAgency={onSelectAgency}
        />
        <SegmentCard
          title="Dropped at Sales Page"
          icon={<AlertTriangle className="w-3.5 h-3.5" />}
          iconBg="bg-red-50"
          iconColor="text-red-500"
          agencies={droppedAtSales}
          emptyText="None dropped at sales"
          onSelectAgency={onSelectAgency}
        />
        <SegmentCard
          title="Dropped at Checkout"
          icon={<ShoppingCart className="w-3.5 h-3.5" />}
          iconBg="bg-red-100"
          iconColor="text-red-600"
          agencies={droppedAtCheckout}
          emptyText="None dropped at checkout"
          onSelectAgency={onSelectAgency}
        />
      </div>

      <SegmentCard
        title="Engaged but Not Converted"
        icon={<Clock className="w-3.5 h-3.5" />}
        iconBg="bg-sky-100"
        iconColor="text-sky-600"
        agencies={engagedNotConverted}
        emptyText="No engaged-but-unconverted agencies"
        onSelectAgency={onSelectAgency}
      />
    </div>
  );
}

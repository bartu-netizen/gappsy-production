import { useState, useCallback, useEffect } from 'react';
import {
  RefreshCw, Search, ExternalLink,
  TrendingUp, DollarSign, ShoppingCart, AlertCircle,
  Copy, Check, Zap, Loader2,
  Activity, Repeat, ArrowUpRight,
  BarChart3, Info, Undo2, ShieldAlert
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch } from '../lib/adminApiFetch';
import AdminReAuthCard from '../components/admin/AdminReAuthCard';
import SubscriptionsTab from '../components/admin/revenue/SubscriptionsTab';
import { formatStateName } from '../utils/formatLocation';

type TabKey = 'overview' | 'orders' | 'subscriptions' | 'refunds-disputes';
type RangeKey = '7d' | '30d' | '90d' | '365d' | 'all';

interface Metrics {
  range: string;
  interval: string;
  window_start: string;
  include_unresolved_in_mrr?: boolean;
  metrics: {
    total_revenue_cents: number;
    all_time_revenue_cents: number;
    gross_revenue_cents?: number;
    net_revenue_cents?: number;
    refunded_cents?: number;
    refund_cents?: number;
    disputed_open_cents?: number;
    open_dispute_cents?: number;
    dispute_lost_cents?: number;
    lost_dispute_cents?: number;
    refund_count?: number;
    dispute_count?: number;
    open_dispute_count?: number;
    lost_dispute_count?: number;
    won_dispute_count?: number;
    paid_order_count: number;
    total_order_count: number;
    aov_cents: number;
    mrr_cents: number;
    mrr_resolved_cents?: number;
    unresolved_mrr_cents?: number;
    yrr_cents: number;
    active_sub_count: number;
    trialing_sub_count: number;
    cancelled_sub_count: number;
    cancelling_sub_count: number;
    past_due_sub_count?: number;
    unresolved_sub_count?: number;
    unresolved_subscription_count?: number;
    included_subscription_count?: number;
    excluded_subscription_count?: number;
    unlinked_refund_count?: number;
    unlinked_dispute_count?: number;
  };
  timeseries: { date: string; revenue: number; orders: number }[];
}

interface RefundRow {
  id: string;
  stripe_refund_id: string;
  stripe_charge_id: string | null;
  stripe_payment_intent_id?: string | null;
  stripe_subscription_id?: string | null;
  stripe_order_id: number | null;
  agency_id: string | null;
  amount_cents: number;
  currency: string;
  status: string | null;
  reason: string | null;
  created_at: string;
  link_status?: 'linked' | 'partial' | 'unlinked';
  agency_name?: string | null;
  customer_email?: string | null;
  product_summary?: string | null;
  state_slug?: string | null;
  top25_rank?: number | null;
  order_amount_cents?: number | null;
  order_subscription_id?: string | null;
}

interface DisputeRow {
  id: string;
  stripe_dispute_id: string;
  stripe_charge_id: string | null;
  stripe_payment_intent_id?: string | null;
  stripe_subscription_id?: string | null;
  stripe_order_id: number | null;
  agency_id: string | null;
  amount_cents: number;
  currency: string;
  status: string | null;
  reason: string | null;
  won: boolean;
  evidence_due_by: string | null;
  created_at: string;
  link_status?: 'linked' | 'partial' | 'unlinked';
  agency_name?: string | null;
  customer_email?: string | null;
  product_summary?: string | null;
  state_slug?: string | null;
  top25_rank?: number | null;
  order_amount_cents?: number | null;
  order_subscription_id?: string | null;
}

interface StripeOrder {
  id: number;
  checkout_session_id: string | null;
  payment_intent_id: string | null;
  customer_id: string | null;
  customer_email: string | null;
  customer_name: string | null;
  amount_subtotal: number;
  amount_total: number;
  currency: string;
  payment_status: string | null;
  status: string | null;
  livemode: boolean | null;
  state_slug: string | null;
  funnel_type: string | null;
  product_summary: string | null;
  invoice_id: string | null;
  metadata: Record<string, unknown> | null;
  stripe_created_at: string | null;
  created_at: string;
  checkout_mode: string | null;
  source_listing_type: string | null;
  entitlement_types: string[] | null;
  top25_slot_id: string | null;
  top25_rank: number | null;
  subscription_id: string | null;
  current_period_end: number | null;
  agency_id: string | null;
  agency_name: string | null;
  paid_at: string | null;
  reporting_category: string | null;
  discount_percentage?: number | null;
  discount_amount_cents?: number | null;
  original_amount_cents?: number | null;
  offer_token?: string | null;
  discount_source?: string | null;
  refunded_cents?: number;
  refund_count?: number;
  disputed_open_cents?: number;
  disputed_lost_cents?: number;
  disputed_won_cents?: number;
  dispute_open_count?: number;
  dispute_lost_count?: number;
  dispute_won_count?: number;
  net_cents?: number;
  has_refund?: boolean;
  has_partial_refund?: boolean;
  has_full_refund?: boolean;
  has_open_dispute?: boolean;
  has_lost_dispute?: boolean;
}

function readMetaString(meta: Record<string, unknown> | null | undefined, key: string): string | null {
  if (!meta) return null;
  const v = meta[key];
  return typeof v === 'string' && v.length > 0 ? v : null;
}

function isUpgradeOrder(order: StripeOrder): boolean {
  const meta = order.metadata || {};
  return readMetaString(meta, 'upgrade_offer') === 'true'
    || (readMetaString(meta, 'target_rank') != null && readMetaString(meta, 'target_tier') != null)
    || order.source_listing_type === 'top25_upgrade';
}

function upgradedToProduct(order: StripeOrder): string | null {
  const tier = readMetaString(order.metadata, 'target_tier');
  const rank = readMetaString(order.metadata, 'target_rank') ?? (order.top25_rank ? String(order.top25_rank) : null);
  if (!tier && !rank) return null;
  const tierLabel = tier === 'top25' ? 'Top 25' : (tier || 'Top 25');
  return rank ? `${tierLabel} #${rank}` : tierLabel;
}

interface OrdersResponse {
  ok: boolean;
  orders: StripeOrder[];
  total: number;
  page: number;
  limit: number;
}

// ── Formatting helpers ─────────────────────────────────────────────────────────

function fmt$(cents: number | null | undefined): string {
  if (cents == null) return '—';
  return `$${(cents / 100).toLocaleString('en-US', { minimumFractionDigits: 0, maximumFractionDigits: 2 })}`;
}

function fmtDate(iso: string | null | undefined): string {
  if (!iso) return '—';
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

function fmtDateTime(iso: string | null | undefined): string {
  if (!iso) return '—';
  return new Date(iso).toLocaleString('en-US', {
    month: 'short', day: 'numeric', year: 'numeric',
    hour: 'numeric', minute: '2-digit', hour12: true,
  });
}

function slugToState(slug: string | null): string {
  if (!slug) return '—';
  return formatStateName(slug);
}

// ── Stat card ──────────────────────────────────────────────────────────────────

function StatCard({
  label, value, sub, sub2, icon: Icon, color = 'slate', trend, note,
}: {
  label: string;
  value: string;
  sub?: string;
  sub2?: string;
  icon: React.ElementType;
  color?: 'slate' | 'green' | 'blue' | 'amber' | 'rose';
  trend?: string;
  note?: string;
}) {
  const colors = {
    slate: 'bg-slate-100 text-slate-500',
    green: 'bg-emerald-50 text-emerald-600',
    blue:  'bg-sky-50 text-sky-600',
    amber: 'bg-amber-50 text-amber-600',
    rose:  'bg-rose-50 text-rose-500',
  };
  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5 shadow-sm hover:shadow-md transition-shadow">
      <div className="flex items-start justify-between gap-3 mb-4">
        <div className={`w-9 h-9 rounded-xl flex items-center justify-center shrink-0 ${colors[color]}`}>
          <Icon className="w-4 h-4" />
        </div>
        {trend && (
          <span className="text-[11px] font-semibold text-emerald-600 flex items-center gap-0.5 bg-emerald-50 px-2 py-0.5 rounded-full border border-emerald-100">
            <ArrowUpRight className="w-3 h-3" /> {trend}
          </span>
        )}
      </div>
      <p className="text-2xl font-bold text-slate-900 leading-none tracking-tight mb-1">{value}</p>
      {sub && <p className="text-xs text-slate-500 mt-0.5">{sub}</p>}
      {sub2 && <p className="text-xs text-amber-600 font-medium mt-0.5">{sub2}</p>}
      <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mt-3">{label}</p>
      {note && (
        <p className="text-[10px] text-slate-400 mt-1 flex items-center gap-0.5">
          <Info className="w-2.5 h-2.5 shrink-0" /> {note}
        </p>
      )}
    </div>
  );
}

// ── Mini SVG bar chart ─────────────────────────────────────────────────────────

function MiniBarChart({
  data,
  metric,
}: {
  data: { date: string; revenue: number; orders: number }[];
  metric: 'revenue' | 'orders';
}) {
  if (!data.length) return (
    <div className="h-32 flex items-center justify-center text-sm text-slate-400">No data in range</div>
  );

  const vals = data.map((d) => metric === 'revenue' ? d.revenue : d.orders * 10000);
  const max = Math.max(...vals, 1);
  const H = 80;
  const W = 600;
  const barW = Math.max(2, Math.floor(W / data.length) - 2);
  const gap = Math.floor(W / data.length);

  return (
    <div className="overflow-x-auto">
      <svg viewBox={`0 0 ${W} ${H + 20}`} className="w-full h-24" preserveAspectRatio="none">
        {data.map((d, i) => {
          const val = metric === 'revenue' ? d.revenue : d.orders * 10000;
          const barH = Math.max(2, Math.round((val / max) * H));
          const x = i * gap + gap / 2 - barW / 2;
          const y = H - barH;
          return (
            <g key={d.date}>
              <rect
                x={x} y={y} width={barW} height={barH}
                rx={2}
                fill={metric === 'revenue' ? '#0ea5e9' : '#10b981'}
                opacity={0.85}
              />
            </g>
          );
        })}
        <line x1={0} y1={H} x2={W} y2={H} stroke="#e2e8f0" strokeWidth={1} />
      </svg>
      <div className="flex justify-between text-[10px] text-slate-400 mt-1 px-1">
        {data.length > 0 && <span>{data[0]?.date?.slice(5)}</span>}
        {data.length > 1 && <span>{data[data.length - 1]?.date?.slice(5)}</span>}
      </div>
    </div>
  );
}

// ── Order status badge ─────────────────────────────────────────────────────────

function OrderStatusBadge({ status, paymentStatus }: { status: string | null; paymentStatus: string | null }) {
  const isPaid = paymentStatus === 'paid' || status === 'completed';
  if (isPaid) {
    return (
      <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full bg-emerald-50 text-emerald-700 border border-emerald-200">
        <Zap className="w-2.5 h-2.5" /> Paid
      </span>
    );
  }
  if (status === 'pending' || paymentStatus === 'unpaid') {
    return (
      <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full bg-amber-50 text-amber-700 border border-amber-200">
        <Activity className="w-2.5 h-2.5" /> Pending
      </span>
    );
  }
  return (
    <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full bg-slate-100 text-slate-500 border border-slate-200">
      {status || paymentStatus || 'Unknown'}
    </span>
  );
}

// ── Inline copy helper ─────────────────────────────────────────────────────────

function InlineCopy({ value }: { value: string }) {
  const [copied, setCopied] = useState(false);
  return (
    <button
      onClick={async () => {
        try { await navigator.clipboard.writeText(value); setCopied(true); setTimeout(() => setCopied(false), 1500); } catch { /* */ }
      }}
      className="ml-1 text-slate-300 hover:text-slate-500 transition-colors"
    >
      {copied ? <Check className="w-3 h-3 text-emerald-500 inline" /> : <Copy className="w-3 h-3 inline" />}
    </button>
  );
}

// ── Orders tab ─────────────────────────────────────────────────────────────────

function OrdersTab({ onAuthError }: { onAuthError?: () => void }) {
  const [data, setData] = useState<OrdersResponse | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const [page, setPage] = useState(1);
  const [expandedId, setExpandedId] = useState<number | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    const params = new URLSearchParams({ search, page: String(page), limit: '50' });
    const result = await adminApiFetch<OrdersResponse>(`stripe-admin-orders?${params}`);
    setLoading(false);
    if (result.ok && result.data) {
      setData(result.data);
    } else {
      const code = result.error?.code;
      if (code === 'auth_error' || code === 'session_expired' || code === 'no_session') {
        onAuthError?.();
        return;
      }
      setError(result.error?.message || 'Failed to load orders');
    }
  }, [search, page, onAuthError]);

  useEffect(() => { load(); }, [load]);

  const orders = data?.orders ?? [];

  return (
    <div className="space-y-4">
      <div className="flex gap-2.5">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400 pointer-events-none" />
          <input
            type="text"
            placeholder="Search agency, email, session ID..."
            value={search}
            onChange={(e) => { setSearch(e.target.value); setPage(1); }}
            className="w-full pl-8 pr-3 py-2 text-sm border border-slate-200 rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-sky-500 focus:border-sky-400"
          />
        </div>
        <button
          onClick={load}
          className="flex items-center gap-1.5 px-3 py-2 text-sm text-slate-600 bg-white border border-slate-200 rounded-lg hover:bg-slate-50 transition-colors"
        >
          <RefreshCw className={`w-3.5 h-3.5 ${loading ? 'animate-spin' : ''}`} />
          Refresh
        </button>
      </div>

      {error && (
        <div className="flex items-start gap-2 bg-red-50 border border-red-200 rounded-xl p-4 text-sm text-red-700">
          <AlertCircle className="w-4 h-4 mt-0.5 shrink-0" /> {error}
        </div>
      )}

      {loading && !data && (
        <div className="flex items-center justify-center py-16 text-slate-400">
          <Loader2 className="w-5 h-5 animate-spin mr-2" /> Loading orders...
        </div>
      )}

      {orders.length > 0 && (
        <div className="bg-white border border-slate-200 rounded-2xl shadow-sm overflow-hidden">
          <div className="hidden sm:grid grid-cols-[2fr_1fr_1fr_1fr_1fr_auto] gap-4 px-5 py-3 border-b border-slate-100 bg-slate-50/70">
            {['Agency / Customer', 'State', 'Plan', 'Amount', 'Date', 'Status'].map((h) => (
              <p key={h} className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">{h}</p>
            ))}
          </div>

          {orders.map((order) => {
            const isExcluded = order.reporting_category === 'excluded_legacy_unrelated';
            const isExpanded = expandedId === order.id;
            return (
              <div key={order.id} className={`border-b border-slate-100 last:border-0 ${isExcluded ? 'bg-slate-50/60 opacity-60' : ''}`}>
                <button
                  onClick={() => setExpandedId(isExpanded ? null : order.id)}
                  className="w-full text-left hover:bg-slate-50/80 transition-colors"
                >
                  <div className="grid grid-cols-1 sm:grid-cols-[2fr_1fr_1fr_1fr_1fr_auto] gap-x-4 gap-y-1 px-5 py-3.5 items-center">
                    <div>
                      <p className="text-sm font-semibold text-slate-800 truncate">
                        {order.agency_name || order.customer_name || order.customer_email || '—'}
                      </p>
                      {order.customer_email && order.agency_name && (
                        <p className="text-xs text-slate-400 truncate">{order.customer_email}</p>
                      )}
                      {isExcluded && (
                        <span className="text-[10px] font-semibold text-slate-400 bg-slate-100 px-1.5 py-0.5 rounded-full border border-slate-200">
                          Excluded
                        </span>
                      )}
                    </div>
                    <p className="text-sm text-slate-600">{slugToState(order.state_slug)}</p>
                    <div>
                      <p className="text-sm text-slate-700 truncate">
                        {order.product_summary || order.source_listing_type || order.funnel_type || '—'}
                      </p>
                      <div className="flex flex-wrap items-center gap-1 mt-0.5">
                        {order.top25_rank && (
                          <span className="text-[10px] font-semibold text-amber-700 bg-amber-50 border border-amber-200 px-1.5 py-0.5 rounded">
                            Top 25 #{order.top25_rank}
                          </span>
                        )}
                        {isUpgradeOrder(order) && (
                          <span className="text-[10px] font-semibold text-emerald-700 bg-emerald-50 border border-emerald-200 px-1.5 py-0.5 rounded">
                            Upgrade
                          </span>
                        )}
                        {(order.discount_percentage ?? 0) > 0 && (
                          <span className="text-[10px] font-semibold text-rose-700 bg-rose-50 border border-rose-200 px-1.5 py-0.5 rounded">
                            -{order.discount_percentage}%
                          </span>
                        )}
                        {order.has_full_refund && (
                          <span className="text-[10px] font-semibold text-rose-700 bg-rose-50 border border-rose-200 px-1.5 py-0.5 rounded">
                            Refunded
                          </span>
                        )}
                        {order.has_partial_refund && !order.has_full_refund && (
                          <span className="text-[10px] font-semibold text-amber-700 bg-amber-50 border border-amber-200 px-1.5 py-0.5 rounded">
                            Partial refund
                          </span>
                        )}
                        {order.has_open_dispute && (
                          <span className="text-[10px] font-semibold text-amber-700 bg-amber-50 border border-amber-200 px-1.5 py-0.5 rounded">
                            Disputed
                          </span>
                        )}
                        {order.has_lost_dispute && (
                          <span className="text-[10px] font-semibold text-rose-700 bg-rose-50 border border-rose-200 px-1.5 py-0.5 rounded">
                            Dispute lost
                          </span>
                        )}
                      </div>
                    </div>
                    <div>
                      <p className="text-sm font-bold text-slate-900">{fmt$(order.amount_total)}</p>
                      {(order.has_refund || order.has_lost_dispute) && (
                        <p className="text-[10px] text-slate-500 mt-0.5">
                          Net <span className="font-semibold text-slate-700">{fmt$(order.net_cents ?? order.amount_total)}</span>
                        </p>
                      )}
                    </div>
                    <p className="text-xs text-slate-500">{fmtDate(order.paid_at || order.created_at)}</p>
                    <OrderStatusBadge status={order.status} paymentStatus={order.payment_status} />
                  </div>
                </button>

                {isExpanded && (
                  <div className="bg-slate-50 border-t border-slate-100 px-5 py-4 space-y-5 text-xs">
                    {(order.has_refund || order.has_open_dispute || order.has_lost_dispute) && (
                      <div className="bg-white border border-slate-200 rounded-xl p-4">
                        <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-3">Refunds &amp; Disputes</p>
                        <div className="space-y-1.5">
                          <div className="flex justify-between items-center text-slate-700">
                            <span>Gross paid</span>
                            <span className="font-semibold">{fmt$(order.amount_total)}</span>
                          </div>
                          {(order.refunded_cents ?? 0) > 0 && (
                            <div className="flex justify-between items-center text-rose-700">
                              <span>Refunded ({order.refund_count ?? 0})</span>
                              <span>-{fmt$(order.refunded_cents)}</span>
                            </div>
                          )}
                          {(order.disputed_lost_cents ?? 0) > 0 && (
                            <div className="flex justify-between items-center text-rose-700">
                              <span>Lost dispute ({order.dispute_lost_count ?? 0})</span>
                              <span>-{fmt$(order.disputed_lost_cents)}</span>
                            </div>
                          )}
                          {(order.disputed_open_cents ?? 0) > 0 && (
                            <div className="flex justify-between items-center text-amber-700">
                              <span>Open dispute ({order.dispute_open_count ?? 0})</span>
                              <span>{fmt$(order.disputed_open_cents)} at risk</span>
                            </div>
                          )}
                          <div className="flex justify-between items-center pt-2 border-t border-slate-100 text-slate-900 font-bold">
                            <span>Net</span>
                            <span>{fmt$(order.net_cents ?? order.amount_total)}</span>
                          </div>
                        </div>
                      </div>
                    )}
                    <div className="bg-white border border-slate-200 rounded-xl p-4">
                      <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-3">Order Breakdown</p>
                      <div className="space-y-1.5">
                        {(() => {
                          const upgrade = isUpgradeOrder(order);
                          const upgradedLabel = upgradedToProduct(order);
                          const orig = order.original_amount_cents ?? null;
                          const readNum = (key: string): number | null => {
                            const v = readMetaString(order.metadata, key);
                            if (!v) return null;
                            const n = Number(v);
                            return Number.isFinite(n) ? n : null;
                          };
                          const credit = readNum('credit_cents')
                            ?? readNum('upgrade_credit_cents')
                            ?? readNum('credit_applied_cents');
                          const disc = order.discount_amount_cents
                            ?? readNum('extra_discount_cents')
                            ?? readNum('discount_amount_cents');
                          const discPct = order.discount_percentage ?? null;
                          return (
                            <>
                              {upgrade && upgradedLabel && (
                                <div className="flex justify-between items-center text-slate-700">
                                  <span>Upgrade target</span>
                                  <span className="font-semibold">{upgradedLabel}</span>
                                </div>
                              )}
                              {orig != null && orig !== order.amount_total && (
                                <div className="flex justify-between items-center text-slate-600">
                                  <span>Original</span>
                                  <span>{fmt$(orig)}</span>
                                </div>
                              )}
                              {credit != null && credit > 0 && (
                                <div className="flex justify-between items-center text-emerald-700">
                                  <span>Credit applied</span>
                                  <span>-{fmt$(credit)}</span>
                                </div>
                              )}
                              {disc != null && disc > 0 && (
                                <div className="flex justify-between items-center text-rose-700">
                                  <span>Discount{discPct ? ` (${discPct}%)` : ''}</span>
                                  <span>-{fmt$(disc)}</span>
                                </div>
                              )}
                              <div className="flex justify-between items-center pt-2 border-t border-slate-100 text-slate-900 font-bold">
                                <span>Paid today</span>
                                <span>{fmt$(order.amount_total)}</span>
                              </div>
                              {order.subscription_id && (
                                <div className="flex justify-between items-center text-slate-500 pt-1">
                                  <span>Renewal</span>
                                  <span className="text-right">
                                    Subscription active — open Subscriptions tab for renewal amount
                                    {order.current_period_end && (
                                      <span className="block text-[10px] text-slate-400">
                                        Next cycle: {fmtDate(new Date(order.current_period_end * 1000).toISOString())}
                                      </span>
                                    )}
                                  </span>
                                </div>
                              )}
                            </>
                          );
                        })()}
                      </div>
                    </div>

                    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
                    <div className="space-y-1.5">
                      <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Identifiers</p>
                      {order.checkout_session_id && (
                        <p><span className="text-slate-400">Session: </span>
                          <span className="font-mono text-slate-700">{order.checkout_session_id.slice(0, 24)}…</span>
                          <InlineCopy value={order.checkout_session_id} />
                        </p>
                      )}
                      {order.payment_intent_id && (
                        <p><span className="text-slate-400">PI: </span>
                          <span className="font-mono text-slate-700">{order.payment_intent_id.slice(0, 24)}…</span>
                          <InlineCopy value={order.payment_intent_id} />
                        </p>
                      )}
                      {order.subscription_id && (
                        <p><span className="text-slate-400">Sub: </span>
                          <span className="font-mono text-slate-700">{order.subscription_id}</span>
                          <InlineCopy value={order.subscription_id} />
                        </p>
                      )}
                      {order.customer_id && (
                        <p><span className="text-slate-400">Customer: </span>
                          <span className="font-mono text-slate-700">{order.customer_id}</span>
                          <InlineCopy value={order.customer_id} />
                        </p>
                      )}
                    </div>
                    <div className="space-y-1.5">
                      <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Details</p>
                      <p><span className="text-slate-400">Mode: </span><span className="text-slate-700">{order.checkout_mode || '—'}</span></p>
                      <p><span className="text-slate-400">Funnel: </span><span className="text-slate-700">{order.funnel_type || '—'}</span></p>
                      <p><span className="text-slate-400">Agency ID: </span><span className="font-mono text-slate-700">{order.agency_id || '—'}</span></p>
                      <p><span className="text-slate-400">Category: </span><span className="text-slate-700">{order.reporting_category || '—'}</span></p>
                      <p><span className="text-slate-400">Paid at: </span><span className="text-slate-700">{fmtDateTime(order.paid_at)}</span></p>
                    </div>
                    <div className="space-y-1.5">
                      <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Actions</p>
                      {order.customer_id && (
                        <a
                          href={`https://dashboard.stripe.com/customers/${order.customer_id}`}
                          target="_blank" rel="noopener noreferrer"
                          className="flex items-center justify-between gap-2 px-3 py-2 rounded-lg bg-white border border-slate-200 text-xs font-medium text-slate-600 hover:bg-slate-50 transition-colors"
                        >
                          View Customer in Stripe <ExternalLink className="w-3.5 h-3.5 text-slate-400" />
                        </a>
                      )}
                      {order.payment_intent_id && (
                        <a
                          href={`https://dashboard.stripe.com/payments/${order.payment_intent_id}`}
                          target="_blank" rel="noopener noreferrer"
                          className="flex items-center justify-between gap-2 px-3 py-2 rounded-lg bg-white border border-slate-200 text-xs font-medium text-slate-600 hover:bg-slate-50 transition-colors"
                        >
                          View Payment in Stripe <ExternalLink className="w-3.5 h-3.5 text-slate-400" />
                        </a>
                      )}
                    </div>
                    </div>
                  </div>
                )}
              </div>
            );
          })}
        </div>
      )}

      {orders.length === 0 && !loading && !error && (
        <div className="bg-white border border-slate-200 rounded-2xl p-12 text-center shadow-sm">
          <ShoppingCart className="w-8 h-8 text-slate-300 mx-auto mb-3" />
          <p className="font-semibold text-slate-700">No orders found</p>
        </div>
      )}
    </div>
  );
}

// ── Overview tab ───────────────────────────────────────────────────────────────

function OverviewTab({ onAuthError }: { onAuthError?: () => void }) {
  const [metrics, setMetrics] = useState<Metrics | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [range, setRange] = useState<RangeKey>('30d');
  const [chartMetric, setChartMetric] = useState<'revenue' | 'orders'>('revenue');
  const [includeUnresolved, setIncludeUnresolved] = useState(false);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    const params = new URLSearchParams({ range, interval: 'day' });
    if (includeUnresolved) params.set('include_unresolved', 'true');
    const result = await adminApiFetch<Metrics>(`stripe-admin-metrics?${params}`);
    setLoading(false);
    if (result.ok && result.data) {
      setMetrics(result.data);
    } else {
      const code = result.error?.code;
      if (code === 'auth_error' || code === 'session_expired' || code === 'no_session') {
        onAuthError?.();
        return;
      }
      setError(result.error?.message || 'Failed to load metrics');
    }
  }, [range, includeUnresolved, onAuthError]);

  useEffect(() => { load(); }, [load]);

  const m = metrics?.metrics;

  const RANGES: { key: RangeKey; label: string }[] = [
    { key: '7d', label: '7 days' },
    { key: '30d', label: '30 days' },
    { key: '90d', label: '90 days' },
    { key: '365d', label: '1 year' },
    { key: 'all', label: 'All time' },
  ];

  return (
    <div className="space-y-5">
      {/* Range selector + refresh */}
      <div className="flex items-center justify-between gap-4">
        <div className="flex gap-1 bg-slate-100 rounded-xl p-1">
          {RANGES.map((r) => (
            <button
              key={r.key}
              onClick={() => setRange(r.key)}
              className={`px-3 py-1.5 text-xs font-semibold rounded-lg transition-all ${
                range === r.key
                  ? 'bg-white text-slate-900 shadow-sm'
                  : 'text-slate-500 hover:text-slate-700'
              }`}
            >
              {r.label}
            </button>
          ))}
        </div>
        <button
          onClick={load}
          className="flex items-center gap-1.5 px-3 py-1.5 text-xs text-slate-600 bg-white border border-slate-200 rounded-lg hover:bg-slate-50 transition-colors"
        >
          <RefreshCw className={`w-3 h-3 ${loading ? 'animate-spin' : ''}`} />
          Refresh
        </button>
      </div>

      {error && (
        <div className="flex items-start gap-2 bg-red-50 border border-red-200 rounded-xl p-4 text-sm text-red-700">
          <AlertCircle className="w-4 h-4 mt-0.5 shrink-0" /> {error}
        </div>
      )}

      {loading && !metrics && (
        <div className="flex items-center justify-center py-16 text-slate-400">
          <Loader2 className="w-5 h-5 animate-spin mr-2" /> Loading metrics...
        </div>
      )}

      {m && (
        <>
          {/* Section A: Cash Revenue */}
          <div>
            <div className="flex items-center justify-between mb-3">
              <h2 className="text-xs font-bold text-slate-500 uppercase tracking-widest">Cash Revenue ({range})</h2>
              <span className="text-[10px] text-slate-400">Net = Gross − refunds − lost disputes</span>
            </div>
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
              <StatCard
                label="Gross"
                value={fmt$(m.gross_revenue_cents ?? m.total_revenue_cents)}
                sub={`All time: ${fmt$(m.all_time_revenue_cents)}`}
                icon={DollarSign}
                color="green"
              />
              <StatCard
                label="Refunds"
                value={fmt$(m.refunded_cents ?? m.refund_cents ?? 0)}
                sub={`${m.refund_count ?? 0} processed`}
                icon={Undo2}
                color="amber"
              />
              <StatCard
                label="Lost Disputes"
                value={fmt$(m.dispute_lost_cents ?? m.lost_dispute_cents ?? 0)}
                sub={`${m.lost_dispute_count ?? 0} chargeback${(m.lost_dispute_count ?? 0) === 1 ? '' : 's'}`}
                icon={ShieldAlert}
                color="rose"
              />
              <StatCard
                label="Net"
                value={fmt$(m.net_revenue_cents ?? m.total_revenue_cents)}
                sub={`AOV: ${fmt$(m.aov_cents)} · ${m.paid_order_count} paid`}
                icon={TrendingUp}
                color="green"
              />
            </div>
          </div>

          {/* Section B: Recurring Revenue */}
          <div>
            <div className="flex items-center justify-between mb-3">
              <h2 className="text-xs font-bold text-slate-500 uppercase tracking-widest">Recurring Revenue</h2>
              <label className="flex items-center gap-2 text-[11px] text-slate-500 cursor-pointer">
                <input
                  type="checkbox"
                  checked={includeUnresolved}
                  onChange={(e) => setIncludeUnresolved(e.target.checked)}
                  className="w-3.5 h-3.5 rounded border-slate-300 text-sky-600 focus:ring-sky-500"
                />
                Include unresolved subs in MRR
              </label>
            </div>
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
              <StatCard
                label="MRR"
                value={fmt$(m.mrr_cents)}
                sub={includeUnresolved ? 'Includes unresolved' : 'Resolved only'}
                icon={TrendingUp}
                color="blue"
                note="Normalized: yearly/12, 6mo/6, monthly as-is"
              />
              <StatCard
                label="YRR"
                value={fmt$(m.yrr_cents)}
                sub="MRR × 12"
                icon={Repeat}
                color="blue"
              />
              <StatCard
                label="Active Subscriptions"
                value={String(m.active_sub_count)}
                sub={m.cancelling_sub_count > 0 ? `${m.cancelling_sub_count} cancelling` : (m.trialing_sub_count > 0 ? `${m.trialing_sub_count} trialing` : 'All renewing')}
                icon={Repeat}
                color="slate"
              />
              <StatCard
                label="Unresolved Recurring"
                value={fmt$(m.unresolved_mrr_cents ?? 0)}
                sub={`${m.unresolved_subscription_count ?? m.unresolved_sub_count ?? 0} sub${((m.unresolved_subscription_count ?? m.unresolved_sub_count) ?? 0) === 1 ? '' : 's'} need review`}
                icon={AlertCircle}
                color="amber"
                note={includeUnresolved ? 'Counted in MRR above' : 'NOT counted in MRR'}
              />
            </div>
          </div>

          {/* Section C: Risk */}
          <div>
            <div className="flex items-center justify-between mb-3">
              <h2 className="text-xs font-bold text-slate-500 uppercase tracking-widest">Risk &amp; Health</h2>
            </div>
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
              <StatCard
                label="Open Disputes"
                value={fmt$(m.disputed_open_cents ?? m.open_dispute_cents ?? 0)}
                sub={`${m.open_dispute_count ?? 0} at risk · NOT yet in net`}
                icon={ShieldAlert}
                color="amber"
              />
              <StatCard
                label="Unlinked Refunds"
                value={String(m.unlinked_refund_count ?? 0)}
                sub="Refunds without an order match"
                icon={Undo2}
                color="amber"
              />
              <StatCard
                label="Unlinked Disputes"
                value={String(m.unlinked_dispute_count ?? 0)}
                sub="Disputes without an order match"
                icon={ShieldAlert}
                color="amber"
              />
              <StatCard
                label="Subs Needing Review"
                value={String(m.unresolved_subscription_count ?? m.unresolved_sub_count ?? 0)}
                sub="No agency_id linked"
                icon={AlertCircle}
                color="amber"
              />
            </div>
          </div>

          {/* Chart */}
          {metrics.timeseries.length > 0 && (
            <div className="bg-white border border-slate-200 rounded-2xl shadow-sm p-5">
              <div className="flex items-center justify-between mb-4">
                <h3 className="text-sm font-semibold text-slate-700">
                  {chartMetric === 'revenue' ? 'Revenue' : 'Orders'} over time
                </h3>
                <div className="flex gap-1 bg-slate-100 rounded-lg p-0.5">
                  {(['revenue', 'orders'] as const).map((m2) => (
                    <button
                      key={m2}
                      onClick={() => setChartMetric(m2)}
                      className={`px-2.5 py-1 text-xs font-semibold rounded-md capitalize transition-colors ${
                        chartMetric === m2 ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500'
                      }`}
                    >
                      {m2}
                    </button>
                  ))}
                </div>
              </div>
              <MiniBarChart data={metrics.timeseries} metric={chartMetric} />
            </div>
          )}

          {/* Breakdown cards */}
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            {/* Subscription status breakdown */}
            <div className="bg-white border border-slate-200 rounded-2xl shadow-sm p-5">
              <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-4">Subscription Status</p>
              <div className="space-y-2.5">
                <div className="flex justify-between items-center py-1.5 border-b border-slate-50">
                  <span className="text-sm text-slate-600 flex items-center gap-2">
                    <span className="w-2 h-2 rounded-full bg-emerald-400 shrink-0" /> Active
                  </span>
                  <span className="text-sm font-bold text-slate-900">{m.active_sub_count}</span>
                </div>
                {m.trialing_sub_count > 0 && (
                  <div className="flex justify-between items-center py-1.5 border-b border-slate-50">
                    <span className="text-sm text-slate-600 flex items-center gap-2">
                      <span className="w-2 h-2 rounded-full bg-sky-400 shrink-0" /> Trialing
                    </span>
                    <span className="text-sm font-bold text-slate-900">{m.trialing_sub_count}</span>
                  </div>
                )}
                <div className="flex justify-between items-center py-1.5 border-b border-slate-50">
                  <span className="text-sm text-slate-600 flex items-center gap-2">
                    <span className="w-2 h-2 rounded-full bg-amber-400 shrink-0" /> Cancelling
                  </span>
                  <span className="text-sm font-bold text-slate-900">{m.cancelling_sub_count}</span>
                </div>
                <div className="flex justify-between items-center py-1.5 border-b border-slate-50">
                  <span className="text-sm text-slate-600 flex items-center gap-2">
                    <span className="w-2 h-2 rounded-full bg-red-400 shrink-0" /> Cancelled
                  </span>
                  <span className="text-sm font-bold text-slate-900">{m.cancelled_sub_count}</span>
                </div>
                {(m.past_due_sub_count ?? 0) > 0 && (
                  <div className="flex justify-between items-center py-1.5 border-b border-slate-50">
                    <span className="text-sm text-slate-600 flex items-center gap-2">
                      <span className="w-2 h-2 rounded-full bg-orange-400 shrink-0" /> Past due
                    </span>
                    <span className="text-sm font-bold text-slate-900">{m.past_due_sub_count}</span>
                  </div>
                )}
                {(m.unresolved_sub_count ?? 0) > 0 && (
                  <div className="flex justify-between items-center py-1.5">
                    <span className="text-sm text-slate-600 flex items-center gap-2">
                      <span className="w-2 h-2 rounded-full bg-slate-400 shrink-0" /> Unresolved
                    </span>
                    <span className="text-sm font-bold text-slate-900">{m.unresolved_sub_count}</span>
                  </div>
                )}
              </div>
            </div>

            {/* Recurring revenue breakdown */}
            <div className="bg-white border border-slate-200 rounded-2xl shadow-sm p-5">
              <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-4">Recurring Revenue</p>
              <div className="space-y-2.5">
                <div className="flex justify-between items-center py-1.5 border-b border-slate-50">
                  <span className="text-sm text-slate-600">MRR</span>
                  <span className="text-sm font-bold text-slate-900">{fmt$(m.mrr_cents)}</span>
                </div>
                <div className="flex justify-between items-center py-1.5 border-b border-slate-50">
                  <span className="text-sm text-slate-600">QRR (est.)</span>
                  <span className="text-sm font-bold text-slate-900">{fmt$(m.mrr_cents * 3)}</span>
                </div>
                <div className="flex justify-between items-center py-1.5">
                  <span className="text-sm text-slate-600">YRR</span>
                  <span className="text-sm font-bold text-slate-900">{fmt$(m.yrr_cents)}</span>
                </div>
              </div>
              <p className="text-[10px] text-slate-400 mt-3 flex items-start gap-1">
                <Info className="w-2.5 h-2.5 shrink-0 mt-0.5" />
                <span>MRR is normalized to a monthly equivalent across billing intervals. Yearly = price / 12. 6-month = price / 6. Monthly = price as-is. YRR = MRR x 12. Includes active and trialing recurring subscriptions; excludes canceled, incomplete, and unpaid.</span>
              </p>
            </div>
          </div>

          <p className="text-[11px] text-slate-400 text-center">
            Excludes legacy/unrelated records. Revenue in USD. Counts include trialing as active.
          </p>
        </>
      )}
    </div>
  );
}

// ── Refunds & Disputes tab ─────────────────────────────────────────────────────

interface RefundsDisputesResponse {
  ok: boolean;
  range: string;
  refunds: RefundRow[];
  disputes: DisputeRow[];
  summary?: {
    refund_count: number;
    dispute_count: number;
    unlinked_refund_count: number;
    unlinked_dispute_count: number;
    webhook_events_handled: string[];
  };
}

function LinkBadge({ status }: { status: 'linked' | 'partial' | 'unlinked' | undefined }) {
  if (!status || status === 'linked') return null;
  if (status === 'partial') {
    return (
      <span className="ml-1 inline-block px-1.5 py-0.5 rounded text-[9px] font-bold bg-amber-50 text-amber-700 border border-amber-200">
        partial link
      </span>
    );
  }
  return (
    <span className="ml-1 inline-block px-1.5 py-0.5 rounded text-[9px] font-bold bg-slate-100 text-slate-500 border border-slate-200">
      unlinked
    </span>
  );
}

function RefundsDisputesTab({ onAuthError }: { onAuthError?: () => void }) {
  const [data, setData] = useState<RefundsDisputesResponse | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [range, setRange] = useState<RangeKey>('all');

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<RefundsDisputesResponse>(`stripe-admin-refunds-disputes?range=${range}`);
    setLoading(false);
    if (result.ok && result.data) {
      setData(result.data);
    } else {
      const code = result.error?.code;
      if (code === 'auth_error' || code === 'session_expired' || code === 'no_session') {
        onAuthError?.();
        return;
      }
      setError(result.error?.message || 'Failed to load refunds and disputes');
    }
  }, [range, onAuthError]);

  useEffect(() => { load(); }, [load]);

  const RANGES: { key: RangeKey; label: string }[] = [
    { key: '7d', label: '7 days' },
    { key: '30d', label: '30 days' },
    { key: '90d', label: '90 days' },
    { key: '365d', label: '1 year' },
    { key: 'all', label: 'All time' },
  ];

  const refunds = data?.refunds ?? [];
  const disputes = data?.disputes ?? [];

  const totalRefunded = refunds
    .filter((r) => r.status === 'succeeded')
    .reduce((s, r) => s + r.amount_cents, 0);
  const openDisputes = disputes.filter((d) =>
    ['warning_needs_response', 'warning_under_review', 'needs_response', 'under_review'].includes(d.status ?? '')
  );
  const lostDisputes = disputes.filter((d) => d.status === 'lost');
  const wonDisputes = disputes.filter((d) => d.status === 'won');
  const openDisputesAmount = openDisputes.reduce((s, d) => s + d.amount_cents, 0);
  const lostDisputesAmount = lostDisputes.reduce((s, d) => s + d.amount_cents, 0);

  return (
    <div className="space-y-5">
      <div className="flex items-center justify-between gap-4">
        <div className="flex gap-1 bg-slate-100 rounded-xl p-1">
          {RANGES.map((r) => (
            <button
              key={r.key}
              onClick={() => setRange(r.key)}
              className={`px-3 py-1.5 text-xs font-semibold rounded-lg transition-all ${
                range === r.key ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-700'
              }`}
            >
              {r.label}
            </button>
          ))}
        </div>
        <button
          onClick={load}
          className="flex items-center gap-1.5 px-3 py-1.5 text-xs text-slate-600 bg-white border border-slate-200 rounded-lg hover:bg-slate-50 transition-colors"
        >
          <RefreshCw className={`w-3 h-3 ${loading ? 'animate-spin' : ''}`} />
          Refresh
        </button>
      </div>

      {error && (
        <div className="flex items-start gap-2 bg-red-50 border border-red-200 rounded-xl p-4 text-sm text-red-700">
          <AlertCircle className="w-4 h-4 mt-0.5 shrink-0" /> {error}
        </div>
      )}

      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <StatCard label="Total Refunded" value={fmt$(totalRefunded)} sub={`${refunds.filter(r => r.status === 'succeeded').length} processed`} icon={Undo2} color="amber" />
        <StatCard label="Open Disputes" value={fmt$(openDisputesAmount)} sub={`${openDisputes.length} at risk`} icon={ShieldAlert} color="rose" />
        <StatCard label="Lost Disputes" value={fmt$(lostDisputesAmount)} sub={`${lostDisputes.length} chargebacks`} icon={ShieldAlert} color="rose" />
        <StatCard label="Won Disputes" value={String(wonDisputes.length)} sub="Recovered" icon={Check} color="green" />
      </div>

      {((data?.summary?.unlinked_refund_count ?? 0) > 0 || (data?.summary?.unlinked_dispute_count ?? 0) > 0) && (
        <div className="bg-amber-50 border border-amber-200 rounded-xl p-3 text-xs text-amber-800 flex items-start gap-2">
          <AlertCircle className="w-3.5 h-3.5 mt-0.5 shrink-0" />
          <span>
            {data?.summary?.unlinked_refund_count ?? 0} refund(s) and {data?.summary?.unlinked_dispute_count ?? 0} dispute(s)
            could not be linked to a stripe_orders row. They are still listed below; investigate via Stripe IDs.
          </span>
        </div>
      )}

      <div className="bg-white border border-slate-200 rounded-2xl shadow-sm overflow-hidden">
        <div className="px-5 py-3 border-b border-slate-100 flex items-center justify-between">
          <h3 className="text-sm font-semibold text-slate-700 flex items-center gap-2">
            <Undo2 className="w-4 h-4 text-amber-600" /> Refunds
          </h3>
          <span className="text-xs text-slate-400">{refunds.length} total</span>
        </div>
        {refunds.length === 0 ? (
          <div className="p-12 text-center text-sm text-slate-400">
            <p>No refunds synced locally yet. Run Stripe sync or wait for webhook event.</p>
            {data?.summary?.webhook_events_handled && (
              <p className="text-[10px] mt-2 text-slate-400">
                Webhook ready: {data.summary.webhook_events_handled.join(', ')}
              </p>
            )}
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-slate-50 border-b border-slate-100">
                <tr>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Date</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Product / Agency</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Amount</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Status</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Reason</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Stripe</th>
                </tr>
              </thead>
              <tbody>
                {refunds.map((r) => (
                  <tr key={r.id} className="border-b border-slate-50 hover:bg-slate-50/40">
                    <td className="px-4 py-2.5 text-xs text-slate-600 whitespace-nowrap">{fmtDate(r.created_at)}</td>
                    <td className="px-4 py-2.5 text-xs">
                      <div className="font-semibold text-slate-700">
                        {r.product_summary || '—'}
                        <LinkBadge status={r.link_status} />
                      </div>
                      <div className="text-slate-400">{r.agency_name || r.customer_email || (r.agency_id ? r.agency_id.slice(0, 8) : 'No linked agency')}</div>
                    </td>
                    <td className="px-4 py-2.5 text-xs font-semibold text-slate-700">{fmt$(r.amount_cents)}</td>
                    <td className="px-4 py-2.5 text-xs">
                      <span className={`inline-block px-2 py-0.5 rounded-full text-[10px] font-bold ${
                        r.status === 'succeeded' ? 'bg-emerald-50 text-emerald-700' :
                        r.status === 'failed' ? 'bg-red-50 text-red-700' :
                        'bg-slate-50 text-slate-500'
                      }`}>{r.status || '—'}</span>
                    </td>
                    <td className="px-4 py-2.5 text-xs text-slate-500">{r.reason || '—'}</td>
                    <td className="px-4 py-2.5 text-xs">
                      <a href={`https://dashboard.stripe.com/refunds/${r.stripe_refund_id}`} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline inline-flex items-center gap-1">
                        Open <ExternalLink className="w-3 h-3" />
                      </a>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl shadow-sm overflow-hidden">
        <div className="px-5 py-3 border-b border-slate-100 flex items-center justify-between">
          <h3 className="text-sm font-semibold text-slate-700 flex items-center gap-2">
            <ShieldAlert className="w-4 h-4 text-red-600" /> Disputes
          </h3>
          <span className="text-xs text-slate-400">{disputes.length} total</span>
        </div>
        {disputes.length === 0 ? (
          <div className="p-12 text-center text-sm text-slate-400">
            <p>No disputes synced locally yet. Run Stripe sync or wait for webhook event.</p>
            {data?.summary?.webhook_events_handled && (
              <p className="text-[10px] mt-2 text-slate-400">
                Webhook ready: {data.summary.webhook_events_handled.join(', ')}
              </p>
            )}
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-slate-50 border-b border-slate-100">
                <tr>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Date</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Product / Agency</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Amount</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Status</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Reason</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Evidence Due</th>
                  <th className="text-left px-4 py-2.5 text-[10px] font-bold text-slate-400 uppercase tracking-widest">Stripe</th>
                </tr>
              </thead>
              <tbody>
                {disputes.map((d) => {
                  const isOpen = ['warning_needs_response', 'warning_under_review', 'needs_response', 'under_review'].includes(d.status ?? '');
                  return (
                    <tr key={d.id} className="border-b border-slate-50 hover:bg-slate-50/40">
                      <td className="px-4 py-2.5 text-xs text-slate-600 whitespace-nowrap">{fmtDate(d.created_at)}</td>
                      <td className="px-4 py-2.5 text-xs">
                        <div className="font-semibold text-slate-700">
                          {d.product_summary || '—'}
                          <LinkBadge status={d.link_status} />
                        </div>
                        <div className="text-slate-400">{d.agency_name || d.customer_email || (d.agency_id ? d.agency_id.slice(0, 8) : 'No linked agency')}</div>
                      </td>
                      <td className="px-4 py-2.5 text-xs font-semibold text-slate-700">{fmt$(d.amount_cents)}</td>
                      <td className="px-4 py-2.5 text-xs">
                        <span className={`inline-block px-2 py-0.5 rounded-full text-[10px] font-bold ${
                          d.status === 'won' ? 'bg-emerald-50 text-emerald-700' :
                          d.status === 'lost' ? 'bg-red-50 text-red-700' :
                          isOpen ? 'bg-amber-50 text-amber-700' :
                          'bg-slate-50 text-slate-500'
                        }`}>{d.status || '—'}</span>
                      </td>
                      <td className="px-4 py-2.5 text-xs text-slate-500">{d.reason || '—'}</td>
                      <td className="px-4 py-2.5 text-xs text-slate-500 whitespace-nowrap">{fmtDate(d.evidence_due_by)}</td>
                      <td className="px-4 py-2.5 text-xs">
                        <a href={`https://dashboard.stripe.com/disputes/${d.stripe_dispute_id}`} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline inline-flex items-center gap-1">
                          Open <ExternalLink className="w-3 h-3" />
                        </a>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}

// ── Sync Stripe revenue button ────────────────────────────────────────────────

interface SyncResult {
  ok: boolean;
  subscriptions_synced?: number;
  subscription_items_synced?: number;
  prices_synced?: number;
  refunds_synced?: number;
  disputes_synced?: number;
  errors?: string[];
  last_sync_at?: string;
}

function SyncStripeRevenueButton({ onAuthError }: { onAuthError?: () => void }) {
  const [running, setRunning] = useState(false);
  const [last, setLast] = useState<SyncResult | null>(null);
  const [error, setError] = useState<string | null>(null);

  const run = async () => {
    setRunning(true);
    setError(null);
    const result = await adminApiFetch<SyncResult>('stripe-admin-sync-revenue?mode=all&limit=100', {
      method: 'POST',
    });
    setRunning(false);
    if (result.ok && result.data) {
      setLast(result.data);
      window.setTimeout(() => window.location.reload(), 800);
    } else {
      const code = result.error?.code;
      if (code === 'auth_error' || code === 'session_expired' || code === 'no_session') {
        onAuthError?.();
        return;
      }
      setError(result.error?.message || 'Sync failed');
    }
  };

  return (
    <div className="flex flex-col items-end gap-1">
      <button
        onClick={run}
        disabled={running}
        className="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-medium rounded-lg border border-slate-200 bg-white text-slate-700 hover:bg-slate-50 transition-colors disabled:opacity-60"
      >
        <RefreshCw className={`w-3.5 h-3.5 ${running ? 'animate-spin' : ''}`} />
        {running ? 'Syncing Stripe...' : 'Sync Stripe revenue data'}
      </button>
      {last && (
        <p className="text-[11px] text-slate-500">
          Synced {last.subscriptions_synced ?? 0} subs · {last.refunds_synced ?? 0} refunds · {last.disputes_synced ?? 0} disputes
          {last.errors && last.errors.length > 0 ? ` · ${last.errors.length} error(s)` : ''}
        </p>
      )}
      {error && <p className="text-[11px] text-rose-600">{error}</p>}
    </div>
  );
}

// ── Main page ──────────────────────────────────────────────────────────────────

const TABS: { key: TabKey; label: string; icon: React.ElementType }[] = [
  { key: 'overview',           label: 'Overview',           icon: BarChart3 },
  { key: 'orders',             label: 'Orders',             icon: ShoppingCart },
  { key: 'subscriptions',      label: 'Subscriptions',      icon: Repeat },
  { key: 'refunds-disputes',   label: 'Refunds & Disputes', icon: ShieldAlert },
];

export default function WpAdminStripePage() {
  const { isReady, isValid, logout } = useAdminSession();
  const [activeTab, setActiveTab] = useState<TabKey>('overview');

  const handleAuthError = useCallback(() => {
    logout();
  }, [logout]);

  if (!isReady) {
    return (
      <WpAdminLayout>
        <div className="flex items-center justify-center py-24 text-slate-400">
          <Loader2 className="w-5 h-5 animate-spin mr-2" />
          <span className="text-sm">Initializing admin session...</span>
        </div>
      </WpAdminLayout>
    );
  }

  if (!isValid) {
    return (
      <WpAdminLayout>
        <AdminReAuthCard />
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout>
      <div className="max-w-7xl mx-auto px-4 py-6 space-y-6">

        {/* Page header */}
        <div className="flex items-start justify-between gap-4">
          <div>
            <h1 className="text-xl font-bold text-slate-900">Revenue</h1>
            <p className="text-sm text-slate-400 mt-0.5">Stripe payments, subscriptions &amp; recurring metrics</p>
          </div>
          <SyncStripeRevenueButton onAuthError={handleAuthError} />
        </div>

        {/* Tab bar */}
        <div className="flex gap-0.5 border-b border-slate-200">
          {TABS.map(({ key, label, icon: Icon }) => (
            <button
              key={key}
              onClick={() => setActiveTab(key)}
              className={`flex items-center gap-1.5 px-4 py-2.5 text-sm font-medium border-b-2 -mb-px transition-colors ${
                activeTab === key
                  ? 'border-slate-900 text-slate-900'
                  : 'border-transparent text-slate-400 hover:text-slate-600 hover:border-slate-300'
              }`}
            >
              <Icon className="w-3.5 h-3.5" />
              {label}
            </button>
          ))}
        </div>

        {/* Tab content */}
        <div>
          {activeTab === 'overview' && <OverviewTab onAuthError={handleAuthError} />}
          {activeTab === 'orders' && <OrdersTab onAuthError={handleAuthError} />}
          {activeTab === 'subscriptions' && <SubscriptionsTab onAuthError={handleAuthError} />}
          {activeTab === 'refunds-disputes' && <RefundsDisputesTab onAuthError={handleAuthError} />}
        </div>

      </div>
    </WpAdminLayout>
  );
}

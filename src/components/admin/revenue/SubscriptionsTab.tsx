import { useState, useCallback, useEffect } from 'react';
import {
  Search, RefreshCw, ChevronDown, ChevronUp, ExternalLink,
  AlertCircle, Loader2, CheckCircle2, XCircle, Clock, Ban,
  CreditCard, MapPin, Tag, Calendar,
  Copy, Check, ArrowRightLeft, Sparkles, Filter, Eye, EyeOff,
  Activity, AlertTriangle, Info, TrendingUp
} from 'lucide-react';
import { adminApiFetch } from '../../../lib/adminApiFetch';

interface SubscriptionRow {
  id: number;
  subscription_id: string | null;
  customer_id: string | null;
  agency_id: string | null;
  agency_name: string | null;
  customer_email: string | null;
  customer_name: string | null;
  state_slug: string | null;
  state_name: string | null;
  price_id: string | null;
  price_label: string | null;
  listing_label: string;
  listing_type: string | null;
  top25_rank: number | null;
  tier: string | null;
  amount_cents: number | null;
  order_amount_cents: number | null;
  interval: string | null;
  mrr_contribution_cents: number;
  counted_in_mrr?: boolean;
  mrr_exclusion_reason?: 'unresolved_agency' | 'canceled' | 'unpaid' | 'incomplete' | 'missing_price' | 'legacy_excluded' | null;
  status: string;
  cancel_at_period_end: boolean;
  renewal_state: 'renews' | 'ends' | 'cancelled' | 'none';
  period_start_iso: string | null;
  period_end_iso: string | null;
  payment_method: string | null;
  payment_method_brand: string | null;
  payment_method_last4: string | null;
  reporting_category: string;
  is_excluded: boolean;
  agency_resolved: boolean;
  was_replaced_by_upgrade: boolean;
  replaced_upgrade_info: unknown;
  is_upgrade_replacement: boolean;
  upgrade_from_info: {
    old_subscription_id: string;
    credit_cents: number;
    extra_discount_cents: number;
    final_upgrade_price_cents: number;
  } | null;
  has_first_term_discount: boolean;
  first_term_discount_cents: number;
  created_at: string;
  updated_at: string;
}

interface SubscriptionsSummary {
  total_included: number;
  active_count: number;
  trialing_count: number;
  cancelled_count: number;
  past_due_count: number;
  cancelling_count: number;
  replaced_count: number;
  unresolved_count: number;
  excluded_count: number;
  mrr_cents: number;
  yrr_cents: number;
  counted_in_mrr_count?: number;
  unresolved_active_count?: number;
  unresolved_mrr_cents?: number;
  unresolved_yrr_cents?: number;
}

const MRR_EXCLUSION_LABEL: Record<string, string> = {
  unresolved_agency: 'Unresolved agency',
  canceled: 'Canceled',
  unpaid: 'Unpaid',
  incomplete: 'Incomplete',
  missing_price: 'Missing price',
  legacy_excluded: 'Legacy / unrelated',
};

interface SubscriptionsResponse {
  ok: boolean;
  subscriptions: SubscriptionRow[];
  pagination: {
    page: number;
    limit: number;
    total: number;
    pages: number;
    has_next: boolean;
    has_prev: boolean;
  };
  summary: SubscriptionsSummary;
}

// ── Status badge configuration ─────────────────────────────────────────────────

const STATUS_CONFIG: Record<string, { label: string; color: string; icon: React.ElementType }> = {
  active:             { label: 'Active',      color: 'bg-emerald-50 text-emerald-700 border-emerald-200', icon: CheckCircle2 },
  cancelled:          { label: 'Cancelled',   color: 'bg-red-50 text-red-600 border-red-200',            icon: XCircle },
  canceled:           { label: 'Cancelled',   color: 'bg-red-50 text-red-600 border-red-200',            icon: XCircle },
  past_due:           { label: 'Past Due',    color: 'bg-orange-50 text-orange-700 border-orange-200',   icon: AlertCircle },
  trialing:           { label: 'Trialing',    color: 'bg-sky-50 text-sky-700 border-sky-200',            icon: Sparkles },
  incomplete:         { label: 'Incomplete',  color: 'bg-slate-50 text-slate-600 border-slate-200',      icon: Clock },
  incomplete_expired: { label: 'Expired',     color: 'bg-slate-50 text-slate-500 border-slate-200',      icon: Ban },
  unpaid:             { label: 'Unpaid',      color: 'bg-red-50 text-red-700 border-red-200',            icon: AlertCircle },
  paused:             { label: 'Paused',      color: 'bg-amber-50 text-amber-700 border-amber-200',      icon: Clock },
};

// ── Tier dot colors ────────────────────────────────────────────────────────────

const TIER_DOT: Record<string, string> = {
  premium:         'bg-amber-400',
  priority:        'bg-sky-400',
  standard:        'bg-slate-400',
  standard_listing:'bg-emerald-500',
  activation:      'bg-emerald-400',
  spotlight:       'bg-rose-400',
  addon:           'bg-slate-300',
};

// ── Tier label overrides ───────────────────────────────────────────────────────

const TIER_LABEL: Record<string, string> = {
  premium:         'Premium',
  priority:        'Priority',
  standard:        'Standard',
  standard_listing:'Standard',
  activation:      'Standard',
  spotlight:       'Spotlight',
  addon:           'Add-On',
};

// ── Formatting helpers ─────────────────────────────────────────────────────────

function fmt$(cents: number | null): string {
  if (cents === null || cents === undefined) return '—';
  return `$${(cents / 100).toFixed(cents % 100 === 0 ? 0 : 2)}`;
}

function fmtDate(iso: string | null): string {
  if (!iso) return '—';
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

// ── Status badge ──────────────────────────────────────────────────────────────

function StatusBadge({ status, cancelAtPeriodEnd }: { status: string; cancelAtPeriodEnd: boolean }) {
  if (status === 'active' && cancelAtPeriodEnd) {
    return (
      <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full border bg-amber-50 text-amber-700 border-amber-200">
        <Clock className="w-3 h-3" />
        Cancels at end
      </span>
    );
  }
  const cfg = STATUS_CONFIG[status] || { label: status, color: 'bg-slate-50 text-slate-600 border-slate-200', icon: Activity };
  const Icon = cfg.icon;
  return (
    <span className={`inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full border ${cfg.color}`}>
      <Icon className="w-3 h-3" />
      {cfg.label}
    </span>
  );
}

// ── Renewal badge ─────────────────────────────────────────────────────────────

function RenewalBadge({ sub }: { sub: SubscriptionRow }) {
  if (sub.renewal_state === 'cancelled' || sub.status === 'cancelled' || sub.status === 'canceled') {
    return <span className="text-xs text-slate-400 italic">Cancelled</span>;
  }
  if (!sub.period_end_iso) {
    return <span className="text-xs text-slate-400">No date</span>;
  }
  const label = sub.renewal_state === 'ends'
    ? `Ends ${fmtDate(sub.period_end_iso)}`
    : sub.renewal_state === 'renews'
      ? `Renews ${fmtDate(sub.period_end_iso)}`
      : fmtDate(sub.period_end_iso);
  const color = sub.renewal_state === 'ends' ? 'text-amber-600' : 'text-slate-500';
  return <span className={`text-xs font-medium ${color}`}>{label}</span>;
}

// ── Copy button ───────────────────────────────────────────────────────────────

function CopyButton({ value }: { value: string }) {
  const [copied, setCopied] = useState(false);
  const copy = async () => {
    try {
      await navigator.clipboard.writeText(value);
      setCopied(true);
      setTimeout(() => setCopied(false), 1500);
    } catch { /* ignore */ }
  };
  return (
    <button onClick={copy} className="ml-1 text-slate-300 hover:text-slate-500 transition-colors">
      {copied ? <Check className="w-3 h-3 text-emerald-500" /> : <Copy className="w-3 h-3" />}
    </button>
  );
}

// ── Detail row ────────────────────────────────────────────────────────────────

function DetailRow({ label, value, mono = false, copyable = false }: {
  label: string; value: React.ReactNode; mono?: boolean; copyable?: boolean;
}) {
  return (
    <div className="flex items-start justify-between gap-4 py-1.5 border-b border-slate-50 last:border-0">
      <span className="text-[11px] font-semibold text-slate-400 uppercase tracking-wide whitespace-nowrap shrink-0 pt-0.5">
        {label}
      </span>
      <span className={`text-xs text-slate-700 text-right flex items-center gap-0.5 ${mono ? 'font-mono' : ''}`}>
        {value}
        {copyable && typeof value === 'string' && value !== '—' && <CopyButton value={value} />}
      </span>
    </div>
  );
}

// ── Expanded detail panel ─────────────────────────────────────────────────────

function ExpandedDetail({ sub }: { sub: SubscriptionRow }) {
  const stripeSubUrl = sub.subscription_id
    ? `https://dashboard.stripe.com/subscriptions/${sub.subscription_id}`
    : null;
  const stripeCustomerUrl = sub.customer_id
    ? `https://dashboard.stripe.com/customers/${sub.customer_id}`
    : null;

  const firstPaymentCents = sub.upgrade_from_info?.final_upgrade_price_cents ?? sub.order_amount_cents;
  const mrrNormalized = sub.mrr_contribution_cents;

  return (
    <div className="bg-slate-50/80 border-t border-slate-100 px-6 py-5">
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">

        {/* Col 1: Agency & Listing */}
        <div>
          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-3">Agency & Listing</p>
          <div className="bg-white rounded-xl border border-slate-100 p-3 space-y-0">
            <DetailRow label="Agency" value={sub.agency_name || '—'} />
            <DetailRow label="Email" value={sub.customer_email || '—'} />
            <DetailRow label="State" value={sub.state_name || sub.state_slug || '—'} />
            <DetailRow label="Listing" value={sub.listing_label} />
            {sub.top25_rank && <DetailRow label="Rank" value={`#${sub.top25_rank}`} />}
            <DetailRow label="Plan" value={sub.price_label || '—'} />
            <DetailRow label="Tier" value={sub.tier ? (TIER_LABEL[sub.tier] || sub.tier) : '—'} />
            {sub.agency_id && (
              <DetailRow label="Agency ID" value={sub.agency_id} mono copyable />
            )}
            {!sub.agency_resolved && (
              <div className="mt-2 pt-2 border-t border-slate-100">
                <p className="text-[11px] text-amber-600 flex items-center gap-1">
                  <AlertTriangle className="w-3 h-3 shrink-0" />
                  Agency not resolved — no matching order found
                </p>
                <p className="text-[10px] text-slate-400 mt-0.5">
                  Customer ID: <span className="font-mono">{sub.customer_id || '—'}</span>
                </p>
              </div>
            )}
          </div>
        </div>

        {/* Col 2: Billing & Payment */}
        <div>
          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-3">Billing & Payment</p>
          <div className="bg-white rounded-xl border border-slate-100 p-3 space-y-0">
            <DetailRow
              label="Recurring"
              value={sub.amount_cents ? `${fmt$(sub.amount_cents)} / ${sub.interval || '6 months'}` : '—'}
            />
            <DetailRow
              label="MRR (normalized)"
              value={mrrNormalized > 0 ? `${fmt$(mrrNormalized)} / mo` : '—'}
            />
            {firstPaymentCents && firstPaymentCents !== sub.amount_cents && (
              <DetailRow label="First Payment" value={fmt$(firstPaymentCents)} />
            )}
            {sub.has_first_term_discount && (
              <DetailRow label="First-Term Discount" value={fmt$(sub.first_term_discount_cents)} />
            )}
            <DetailRow
              label="Billing Period"
              value={sub.period_start_iso ? `${fmtDate(sub.period_start_iso)} → ${fmtDate(sub.period_end_iso)}` : '—'}
            />
            <DetailRow
              label="Auto-Renew"
              value={sub.cancel_at_period_end ? 'No — cancels at period end' : 'Yes'}
            />
            <DetailRow label="Payment Method" value={sub.payment_method || '—'} />
            <DetailRow label="Category" value={sub.reporting_category || 'uncategorized'} />
          </div>

          {(sub.is_upgrade_replacement || sub.was_replaced_by_upgrade) && (
            <div className="mt-2 bg-sky-50 border border-sky-100 rounded-xl p-3">
              {sub.is_upgrade_replacement && sub.upgrade_from_info && (
                <>
                  <p className="text-[10px] font-bold text-sky-500 uppercase tracking-widest mb-1.5 flex items-center gap-1">
                    <ArrowRightLeft className="w-3 h-3" /> Upgraded From
                  </p>
                  <DetailRow label="Old Sub" value={sub.upgrade_from_info.old_subscription_id} mono copyable />
                  <DetailRow label="Credit Applied" value={fmt$(sub.upgrade_from_info.credit_cents)} />
                  {sub.upgrade_from_info.extra_discount_cents > 0 && (
                    <DetailRow label="Extra Discount" value={fmt$(sub.upgrade_from_info.extra_discount_cents)} />
                  )}
                </>
              )}
              {sub.was_replaced_by_upgrade && (
                <p className="text-[10px] font-semibold text-sky-600 flex items-center gap-1">
                  <ArrowRightLeft className="w-3 h-3" />
                  This subscription was replaced by an upgrade
                </p>
              )}
            </div>
          )}
        </div>

        {/* Col 3: Stripe IDs & Actions */}
        <div>
          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-3">Stripe & Actions</p>
          <div className="bg-white rounded-xl border border-slate-100 p-3 space-y-0 mb-2">
            <DetailRow label="Subscription ID" value={sub.subscription_id || '—'} mono copyable />
            <DetailRow label="Customer ID" value={sub.customer_id || '—'} mono copyable />
            <DetailRow label="Price ID" value={sub.price_id || '—'} mono copyable />
            <DetailRow label="Created" value={fmtDate(sub.created_at)} />
            <DetailRow label="Updated" value={fmtDate(sub.updated_at)} />
          </div>

          <div className="flex flex-col gap-1.5">
            {stripeSubUrl && (
              <a
                href={stripeSubUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center justify-between gap-2 px-3 py-2 rounded-lg bg-white border border-slate-200 text-xs font-medium text-slate-600 hover:bg-slate-50 transition-colors"
              >
                View Subscription in Stripe
                <ExternalLink className="w-3.5 h-3.5 text-slate-400" />
              </a>
            )}
            {stripeCustomerUrl && (
              <a
                href={stripeCustomerUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center justify-between gap-2 px-3 py-2 rounded-lg bg-white border border-slate-200 text-xs font-medium text-slate-600 hover:bg-slate-50 transition-colors"
              >
                View Customer in Stripe
                <ExternalLink className="w-3.5 h-3.5 text-slate-400" />
              </a>
            )}
          </div>
        </div>

      </div>
    </div>
  );
}

// ── Subscription table row ────────────────────────────────────────────────────

function SubscriptionTableRow({ sub }: { sub: SubscriptionRow }) {
  const [expanded, setExpanded] = useState(false);
  const isExcluded = sub.is_excluded;
  const isUnresolved = !sub.agency_resolved;

  const displayName = sub.agency_name || sub.customer_name;

  return (
    <div className={`border border-slate-200 rounded-2xl overflow-hidden transition-shadow ${expanded ? 'shadow-md ring-1 ring-slate-200' : 'shadow-sm hover:shadow-md'} ${isExcluded ? 'opacity-50' : ''}`}>
      <button
        onClick={() => setExpanded((v) => !v)}
        className="w-full text-left bg-white hover:bg-slate-50/60 transition-colors"
      >
        <div className="px-5 py-4 grid grid-cols-[1fr_auto] gap-4 items-start">
          {/* Main info grid */}
          <div className="min-w-0 grid grid-cols-1 sm:grid-cols-[2.5fr_2fr_1.2fr_1.3fr] gap-x-5 gap-y-1 items-start">

            {/* LEFT: Agency + email + state */}
            <div className="min-w-0">
              <div className="flex items-center gap-1.5 mb-0.5">
                {sub.tier && TIER_DOT[sub.tier] && (
                  <span className={`w-2 h-2 rounded-full shrink-0 ${TIER_DOT[sub.tier]}`} />
                )}
                {displayName ? (
                  <p className="text-sm font-semibold text-slate-800 truncate">{displayName}</p>
                ) : (
                  <span className="text-sm font-semibold text-amber-600 flex items-center gap-1">
                    <AlertTriangle className="w-3 h-3 shrink-0" />
                    Unresolved agency
                  </span>
                )}
              </div>
              <p className="text-xs text-slate-400 truncate">{sub.customer_email || '—'}</p>
              {sub.state_name && (
                <p className="text-[11px] text-slate-400 flex items-center gap-0.5 mt-0.5">
                  <MapPin className="w-2.5 h-2.5 shrink-0" />
                  {sub.state_name}
                </p>
              )}
            </div>

            {/* MIDDLE: Product + rank + badges */}
            <div className="min-w-0">
              <p className="text-xs font-semibold text-slate-700 truncate">{sub.listing_label}</p>
              {sub.top25_rank && (
                <p className="text-[11px] text-slate-500">Rank #{sub.top25_rank}</p>
              )}
              <div className="flex items-center gap-1 mt-1.5 flex-wrap">
                {sub.is_upgrade_replacement && (
                  <span className="inline-flex items-center gap-0.5 text-[10px] font-semibold px-1.5 py-0.5 rounded-full bg-sky-50 text-sky-600 border border-sky-100">
                    <ArrowRightLeft className="w-2.5 h-2.5" /> Upgraded
                  </span>
                )}
                {sub.was_replaced_by_upgrade && (
                  <span className="inline-flex items-center gap-0.5 text-[10px] font-semibold px-1.5 py-0.5 rounded-full bg-slate-100 text-slate-500 border border-slate-200">
                    Replaced
                  </span>
                )}
                {sub.has_first_term_discount && (
                  <span className="inline-flex items-center gap-0.5 text-[10px] font-semibold px-1.5 py-0.5 rounded-full bg-emerald-50 text-emerald-600 border border-emerald-100">
                    <Tag className="w-2.5 h-2.5" /> Discounted 1st term
                  </span>
                )}
                {isUnresolved && (
                  <span className="inline-flex items-center gap-0.5 text-[10px] font-semibold px-1.5 py-0.5 rounded-full bg-amber-50 text-amber-600 border border-amber-100">
                    <AlertTriangle className="w-2.5 h-2.5" /> Needs review
                  </span>
                )}
                {sub.counted_in_mrr === true && (
                  <span className="inline-flex items-center gap-0.5 text-[10px] font-semibold px-1.5 py-0.5 rounded-full bg-emerald-50 text-emerald-700 border border-emerald-100">
                    <CheckCircle2 className="w-2.5 h-2.5" /> In MRR
                  </span>
                )}
                {sub.counted_in_mrr === false && sub.mrr_exclusion_reason && (
                  <span className="inline-flex items-center gap-0.5 text-[10px] font-semibold px-1.5 py-0.5 rounded-full bg-slate-100 text-slate-600 border border-slate-200">
                    <Ban className="w-2.5 h-2.5" />
                    Excluded: {MRR_EXCLUSION_LABEL[sub.mrr_exclusion_reason] || sub.mrr_exclusion_reason}
                  </span>
                )}
              </div>
            </div>

            {/* RIGHT-MIDDLE: Price + MRR */}
            <div>
              {sub.amount_cents ? (
                <>
                  <p className="text-sm font-bold text-slate-900">{fmt$(sub.amount_cents)}</p>
                  <p className="text-[11px] text-slate-400">/ {sub.interval || '6 months'}</p>
                  {sub.mrr_contribution_cents > 0 && (
                    <p className="text-[11px] text-slate-400 mt-0.5 flex items-center gap-0.5">
                      <TrendingUp className="w-2.5 h-2.5" />
                      {fmt$(sub.mrr_contribution_cents)}/mo
                    </p>
                  )}
                </>
              ) : (
                <p className="text-sm text-slate-400">—</p>
              )}
            </div>

            {/* RIGHT: Status + renewal */}
            <div className="space-y-1.5">
              <StatusBadge status={sub.status} cancelAtPeriodEnd={sub.cancel_at_period_end} />
              <RenewalBadge sub={sub} />
            </div>
          </div>

          {/* Expand chevron */}
          <div className="flex items-center gap-2 shrink-0 pt-0.5">
            {isExcluded && (
              <span className="text-[10px] font-semibold px-1.5 py-0.5 rounded-full bg-slate-100 text-slate-400 border border-slate-200">
                Excluded
              </span>
            )}
            <div className="w-6 h-6 flex items-center justify-center text-slate-400">
              {expanded ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
            </div>
          </div>
        </div>
      </button>

      {expanded && <ExpandedDetail sub={sub} />}
    </div>
  );
}

// ── Filter options ────────────────────────────────────────────────────────────

const STATUS_FILTER_OPTIONS = [
  { value: 'all',               label: 'All statuses' },
  { value: 'active',            label: 'Active' },
  { value: 'trialing',          label: 'Trialing' },
  { value: 'active_cancelling', label: 'Cancelling' },
  { value: 'cancelled',         label: 'Cancelled' },
  { value: 'past_due',          label: 'Past due' },
  { value: 'replaced',          label: 'Replaced by upgrade' },
  { value: 'unresolved',        label: 'Unresolved agency' },
];

// ── Summary stat card ─────────────────────────────────────────────────────────

function SummaryCard({
  label, value, sub, sub2, highlight = false, warn = false,
}: {
  label: string; value: string | number; sub?: string; sub2?: string;
  highlight?: boolean; warn?: boolean;
}) {
  return (
    <div className={`bg-white border rounded-2xl p-4 shadow-sm ${warn ? 'border-amber-200' : 'border-slate-200'}`}>
      <p className={`text-[11px] font-bold uppercase tracking-wide mb-1.5 ${warn ? 'text-amber-500' : 'text-slate-400'}`}>
        {label}
      </p>
      <p className={`text-2xl font-bold leading-none ${highlight ? 'text-emerald-700' : 'text-slate-900'}`}>
        {value}
      </p>
      {sub && <p className="text-[11px] text-slate-400 mt-1">{sub}</p>}
      {sub2 && <p className={`text-[11px] mt-0.5 ${warn ? 'text-amber-600' : 'text-sky-600'}`}>{sub2}</p>}
    </div>
  );
}

// ── Main component ────────────────────────────────────────────────────────────

export default function SubscriptionsTab({ onAuthError }: { onAuthError?: () => void }) {
  const [data, setData] = useState<SubscriptionsResponse | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState('all');
  const [includeExcluded, setIncludeExcluded] = useState(false);
  const [page, setPage] = useState(1);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    const params = new URLSearchParams({
      status: statusFilter,
      search,
      include_excluded: String(includeExcluded),
      page: String(page),
      limit: '50',
    });
    const result = await adminApiFetch<SubscriptionsResponse>(
      `stripe-admin-subscriptions?${params}`
    );
    setLoading(false);
    if (result.ok && result.data) {
      setData(result.data);
    } else {
      const code = result.error?.code;
      if (code === 'auth_error' || code === 'session_expired' || code === 'no_session') {
        onAuthError?.();
        return;
      }
      setError(result.error?.message || 'Failed to load subscriptions');
    }
  }, [statusFilter, search, includeExcluded, page, onAuthError]);

  useEffect(() => { load(); }, [load]);

  const applySearch = (v: string) => { setSearch(v); setPage(1); };
  const applyStatus = (v: string) => { setStatusFilter(v); setPage(1); };
  const applyInclude = (v: boolean) => { setIncludeExcluded(v); setPage(1); };

  const summary = data?.summary;

  return (
    <div className="space-y-5">

      {/* Summary KPI cards */}
      {summary && (
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
          <SummaryCard
            label="Active"
            value={summary.active_count}
            sub={summary.cancelling_count > 0 ? `${summary.cancelling_count} cancelling` : undefined}
            sub2={summary.trialing_count > 0 ? `${summary.trialing_count} trialing` : undefined}
            highlight
          />
          <SummaryCard
            label="MRR"
            value={fmt$(summary.mrr_cents)}
            sub={`${fmt$(summary.yrr_cents)} / yr · ${summary.counted_in_mrr_count ?? summary.active_count} counted`}
            sub2={summary.unresolved_mrr_cents && summary.unresolved_mrr_cents > 0 ? `+${fmt$(summary.unresolved_mrr_cents)} unresolved (excluded)` : '6-month billing ÷ 6'}
            warn={!!summary.unresolved_mrr_cents && summary.unresolved_mrr_cents > 0}
          />
          <SummaryCard
            label="Cancelled"
            value={summary.cancelled_count}
            sub={summary.replaced_count > 0 ? `${summary.replaced_count} replaced by upgrade` : undefined}
          />
          <SummaryCard
            label="Total"
            value={summary.total_included}
            sub={summary.excluded_count > 0 ? `+${summary.excluded_count} excluded` : undefined}
            sub2={summary.unresolved_count > 0 ? `${summary.unresolved_count} need review` : undefined}
            warn={summary.unresolved_count > 0}
          />
        </div>
      )}

      {/* Integrity note when counts look right */}
      {summary && summary.unresolved_count > 0 && (
        <div className="flex items-start gap-2 bg-amber-50 border border-amber-200 rounded-xl p-3.5 text-sm text-amber-700">
          <AlertTriangle className="w-4 h-4 mt-0.5 shrink-0" />
          <div>
            <span className="font-semibold">{summary.unresolved_count} subscription{summary.unresolved_count !== 1 ? 's' : ''} could not be matched to an agency.</span>
            {' '}These are <span className="font-semibold">excluded from MRR</span> by default until an agency is linked. Use the filter to review them.
          </div>
        </div>
      )}

      {/* 6-month billing note */}
      <div className="flex items-start gap-2 bg-slate-50 border border-slate-200 rounded-xl px-3.5 py-2.5 text-xs text-slate-500">
        <Info className="w-3.5 h-3.5 mt-0.5 shrink-0 text-slate-400" />
        All subscriptions bill every 6 months. MRR = 6-month price ÷ 6. YRR = MRR × 12.
        Active count includes trialing subscriptions.
      </div>

      {/* Filters bar */}
      <div className="bg-white border border-slate-200 rounded-2xl shadow-sm p-3">
        <div className="flex flex-col sm:flex-row gap-2.5">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400 pointer-events-none" />
            <input
              type="text"
              placeholder="Search agency, email, state, subscription ID..."
              value={search}
              onChange={(e) => applySearch(e.target.value)}
              className="w-full pl-8 pr-3 py-2 text-sm border border-slate-200 rounded-lg bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-sky-500 focus:border-sky-400"
            />
          </div>

          <div className="relative">
            <Filter className="absolute left-2.5 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400 pointer-events-none" />
            <select
              value={statusFilter}
              onChange={(e) => applyStatus(e.target.value)}
              className="appearance-none pl-7 pr-7 py-2 text-sm border border-slate-200 rounded-lg bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-sky-500 focus:border-sky-400"
            >
              {STATUS_FILTER_OPTIONS.map((opt) => (
                <option key={opt.value} value={opt.value}>{opt.label}</option>
              ))}
            </select>
          </div>

          <button
            onClick={() => applyInclude(!includeExcluded)}
            className={`flex items-center gap-1.5 px-3 py-2 text-sm rounded-lg border transition-colors ${
              includeExcluded
                ? 'bg-amber-50 border-amber-200 text-amber-700'
                : 'bg-slate-50 border-slate-200 text-slate-500 hover:bg-slate-100'
            }`}
          >
            {includeExcluded ? <Eye className="w-3.5 h-3.5" /> : <EyeOff className="w-3.5 h-3.5" />}
            {includeExcluded ? 'Showing excluded' : 'Show excluded'}
          </button>

          <button
            onClick={load}
            className="flex items-center gap-1.5 px-3 py-2 text-sm text-slate-600 bg-slate-50 border border-slate-200 rounded-lg hover:bg-slate-100 transition-colors"
          >
            <RefreshCw className={`w-3.5 h-3.5 ${loading ? 'animate-spin' : ''}`} />
            Refresh
          </button>
        </div>
      </div>

      {/* Error */}
      {error && (
        <div className="flex items-start gap-2 bg-red-50 border border-red-200 rounded-xl p-4 text-sm text-red-700">
          <AlertCircle className="w-4 h-4 mt-0.5 shrink-0" />
          {error}
        </div>
      )}

      {/* Loading */}
      {loading && !data && (
        <div className="flex items-center justify-center py-16 text-slate-400">
          <Loader2 className="w-5 h-5 animate-spin mr-2" />
          Loading subscriptions...
        </div>
      )}

      {/* Subscription list */}
      {data && (
        <>
          {data.subscriptions.length === 0 ? (
            <div className="bg-white border border-slate-200 rounded-2xl p-12 text-center shadow-sm">
              <div className="w-12 h-12 bg-slate-50 border border-slate-100 rounded-xl flex items-center justify-center mx-auto mb-3">
                <CreditCard className="w-6 h-6 text-slate-300" />
              </div>
              <p className="font-semibold text-slate-700">No subscriptions found</p>
              <p className="text-sm text-slate-400 mt-1">
                {search || statusFilter !== 'all' ? 'Try adjusting your filters.' : 'No subscription records yet.'}
              </p>
            </div>
          ) : (
            <div className="space-y-2.5">
              <div className="flex items-center justify-between px-1">
                <p className="text-xs text-slate-400">
                  {data.pagination.total} subscription{data.pagination.total !== 1 ? 's' : ''}
                  {search && ` matching "${search}"`}
                  {statusFilter !== 'all' && ' · filtered'}
                </p>
                {loading && <Loader2 className="w-3.5 h-3.5 animate-spin text-slate-400" />}
              </div>

              {data.subscriptions.map((sub) => (
                <SubscriptionTableRow key={sub.id} sub={sub} />
              ))}

              {(data.pagination.has_prev || data.pagination.has_next) && (
                <div className="flex items-center justify-between pt-2">
                  <button
                    onClick={() => setPage((p) => Math.max(1, p - 1))}
                    disabled={!data.pagination.has_prev}
                    className="px-4 py-2 text-sm text-slate-600 bg-white border border-slate-200 rounded-lg hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
                  >
                    Previous
                  </button>
                  <span className="text-xs text-slate-400">
                    Page {data.pagination.page} of {data.pagination.pages}
                  </span>
                  <button
                    onClick={() => setPage((p) => p + 1)}
                    disabled={!data.pagination.has_next}
                    className="px-4 py-2 text-sm text-slate-600 bg-white border border-slate-200 rounded-lg hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
                  >
                    Next
                  </button>
                </div>
              )}
            </div>
          )}
        </>
      )}
    </div>
  );
}

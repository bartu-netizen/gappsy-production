import { useState, useEffect, useCallback } from 'react';
import { TrendingUp, Check, Copy, Loader2, AlertCircle, ExternalLink, RefreshCw, ChevronDown, ArrowRight, Star, ShieldCheck, Clock, Wrench } from 'lucide-react';
import { adminApiFetch } from '../../lib/adminApiFetch';
import { formatStateName } from '../../utils/formatLocation';

interface AgencyStatus {
  agency_id: string;
  is_eligible_for_upgrade: boolean;
  is_on_activation_plan: boolean;
  current_tier: string | null;
  current_price_id: string | null;
  active_subscription: {
    subscription_id: string;
    price_id: string;
    price_label: string;
    tier: string;
    status: string;
    current_period_end: string | null;
    cancel_at_period_end: boolean;
  } | null;
  activation_order: {
    subscription_id: string | null;
    amount_total: number;
    paid_at: string | null;
  } | null;
  pending_upgrade_offers: PendingOffer[];
}

interface PendingOffer {
  id: string;
  status: string;
  target_tier: string;
  target_rank: number | null;
  final_upgrade_price_cents: number;
  created_at: string;
  expires_at: string;
  checkout_url: string | null;
}

interface SlotInfo {
  id: string;
  rank: number;
  tier: 'standard' | 'priority' | 'premium';
  is_available: boolean;
  agency_name: string | null;
  full_price_cents: number;
  base_diff_cents: number;
}

interface SlotsData {
  available_slots: SlotInfo[];
  all_slots: SlotInfo[];
  available_count: number;
}

interface CreatedOffer {
  offer_id: string | null;
  checkout_url: string;
  pricing: {
    full_price_cents: number;
    credit_cents: number;
    extra_discount_cents: number;
    discount_total_cents: number;
    final_upgrade_price_cents: number;
    final_upgrade_price_dollars: number;
    renewal_price_cents: number;
    renewal_price_dollars: number;
  };
  target: {
    rank: number;
    tier: string;
    label: string;
  };
}

interface RepairOrderResult {
  order_id: string;
  checkout_session_id: string;
  resolved_agency_id: string | null;
  resolved_agency_name: string | null;
  action: 'repaired' | 'skipped' | 'unresolved';
  detail: string;
}

interface RepairReport {
  ok: boolean;
  scanned: number;
  repaired: number;
  skipped: number;
  unresolved: number;
  results: RepairOrderResult[];
  message?: string;
}

interface UpgradeOfferPanelProps {
  agencyId: string;
  agencyName: string;
  stateSlug: string;
}

const TIER_COLORS = {
  premium: 'bg-amber-50 text-amber-800 border-amber-200',
  priority: 'bg-blue-50 text-blue-800 border-blue-200',
  standard: 'bg-slate-50 text-slate-700 border-slate-200',
};

const TIER_LABELS = {
  premium: 'Premium',
  priority: 'Priority',
  standard: 'Standard',
};

function formatDollars(cents: number): string {
  return `$${(cents / 100).toFixed(2)}`;
}

function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

function buildGappsyUpgradeUrl(
  offer: CreatedOffer,
  agencyId: string,
  agencyName: string,
  stateSlug: string,
  slotId: string | undefined,
): string {
  const stateName = formatStateName(stateSlug);
  const origin = typeof window !== 'undefined' ? window.location.origin : 'https://gappsy.com';
  const params = new URLSearchParams({
    state: stateSlug,
    stateName,
    rank: String(offer.target.rank),
    tier: offer.target.tier,
    agencyName,
    credit: String(offer.pricing.credit_cents),
  });
  if (agencyId) params.set('agencyId', agencyId);
  if (slotId) params.set('slotId', slotId);
  if (offer.pricing.extra_discount_cents > 0) {
    params.set('extra_discount', String(offer.pricing.extra_discount_cents));
  }
  if (offer.offer_id) params.set('offer_id', offer.offer_id);
  return `${origin}/top25/upgrade?${params.toString()}`;
}

export default function UpgradeOfferPanel({ agencyId, agencyName, stateSlug }: UpgradeOfferPanelProps) {
  const [statusLoading, setStatusLoading] = useState(false);
  const [slotsLoading, setSlotsLoading] = useState(false);
  const [createLoading, setCreateLoading] = useState(false);

  const [agencyStatus, setAgencyStatus] = useState<AgencyStatus | null>(null);
  const [slotsData, setSlotsData] = useState<SlotsData | null>(null);
  const [createdOffer, setCreatedOffer] = useState<CreatedOffer | null>(null);

  const [statusError, setStatusError] = useState<string | null>(null);
  const [slotsError, setSlotsError] = useState<string | null>(null);
  const [createError, setCreateError] = useState<string | null>(null);

  const [selectedRank, setSelectedRank] = useState<number | null>(null);
  const [extraDiscount, setExtraDiscount] = useState('0');
  const [notes, setNotes] = useState('');
  const [copied, setCopied] = useState(false);

  const [repairLoading, setRepairLoading] = useState(false);
  const [repairReport, setRepairReport] = useState<RepairReport | null>(null);
  const [repairError, setRepairError] = useState<string | null>(null);

  const loadStatus = useCallback(async () => {
    if (!agencyId) return;
    setStatusLoading(true);
    setStatusError(null);
    const result = await adminApiFetch<AgencyStatus>(
      `upgrade-offer-agency-status?agency_id=${encodeURIComponent(agencyId)}`
    );
    setStatusLoading(false);
    if (result.ok && result.data) {
      setAgencyStatus(result.data);
    } else {
      setStatusError(result.error?.message || 'Failed to load agency status');
    }
  }, [agencyId]);

  const loadSlots = useCallback(async () => {
    if (!stateSlug) return;
    setSlotsLoading(true);
    setSlotsError(null);
    const result = await adminApiFetch<SlotsData>(
      `upgrade-offer-state-slots?state_slug=${encodeURIComponent(stateSlug)}`
    );
    setSlotsLoading(false);
    if (result.ok && result.data) {
      setSlotsData(result.data);
    } else {
      setSlotsError(result.error?.message || 'Failed to load slots');
    }
  }, [stateSlug]);

  useEffect(() => {
    loadStatus();
    loadSlots();
  }, [loadStatus, loadSlots]);

  const selectedSlot = slotsData?.available_slots.find((s) => s.rank === selectedRank) || null;
  const extraDiscountCents = Math.max(0, Math.round(parseFloat(extraDiscount || '0') * 100));

  const creditCents = 9700;
  const fullPriceCents = selectedSlot?.full_price_cents ?? 0;
  const discountTotal = creditCents + extraDiscountCents;
  const finalPriceCents = Math.max(0, fullPriceCents - discountTotal);

  const handleCreateOffer = async () => {
    if (!selectedRank || !agencyStatus?.is_eligible_for_upgrade) return;
    setCreateLoading(true);
    setCreateError(null);
    setCreatedOffer(null);

    const oldSubscriptionId = agencyStatus.active_subscription?.subscription_id || null;

    const result = await adminApiFetch<CreatedOffer>('upgrade-offer-create', {
      method: 'POST',
      body: {
        agency_id: agencyId,
        agency_name: agencyName,
        state_slug: stateSlug,
        old_subscription_id: oldSubscriptionId,
        target_rank: selectedRank,
        extra_discount_cents: extraDiscountCents,
        notes,
        created_by_admin: 'admin-lookup-tool',
      },
    });

    setCreateLoading(false);
    if (result.ok && result.data) {
      setCreatedOffer(result.data);
      loadStatus();
    } else {
      setCreateError(result.error?.message || 'Failed to create upgrade offer');
    }
  };

  const copyToClipboard = async (text: string) => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch {
      /* ignore */
    }
  };

  const handleRepair = async () => {
    setRepairLoading(true);
    setRepairError(null);
    setRepairReport(null);
    const result = await adminApiFetch<RepairReport>('other-agencies-repair-paid-listings', {
      method: 'POST',
      body: {
        mode: 'targeted',
        agency_id: agencyId,
        agency_name: agencyName,
        state_slug: stateSlug,
        dry_run: false,
      },
    });
    setRepairLoading(false);
    if (result.ok && result.data) {
      setRepairReport(result.data);
      if ((result.data.repaired ?? 0) > 0) {
        setTimeout(() => {
          loadStatus();
          loadSlots();
        }, 800);
      }
    } else {
      setRepairError(result.error?.message || 'Repair failed');
    }
  };

  const generateEmailCopy = (offer: CreatedOffer, upgradeUrl?: string): string => {
    const finalDollars = offer.pricing.final_upgrade_price_dollars.toFixed(2);
    const renewalDollars = offer.pricing.renewal_price_dollars.toFixed(2);
    const rank = offer.target.rank;
    const tier = TIER_LABELS[offer.target.tier as keyof typeof TIER_LABELS] || offer.target.tier;
    const linkUrl = upgradeUrl ?? offer.checkout_url;
    return `Hi,

I wanted to reach out about upgrading your current listing to a Top 25 ranked position.

Since you're already active on Gappsy, we've applied your $97 payment as a credit toward a ${tier} Top 25 placement at Rank #${rank}.

Your upgrade price: $${finalDollars} for the first 6 months (then $${renewalDollars}/6mo)

Complete your upgrade here:
${linkUrl}

This link is unique to your agency. Once you complete the checkout, your listing will move to Rank #${rank} and you'll start receiving ranked visibility and availability requests.

Let me know if you have any questions.

Best,
The Gappsy Team`;
  };

  const isEligible = agencyStatus?.is_eligible_for_upgrade ?? false;

  return (
    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
      {/* Header */}
      <div className="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
        <div className="flex items-center gap-2.5">
          <div className="w-7 h-7 bg-emerald-50 border border-emerald-100 rounded-lg flex items-center justify-center">
            <TrendingUp className="w-3.5 h-3.5 text-emerald-600" />
          </div>
          <div>
            <h3 className="text-sm font-semibold text-slate-800">Top 25 Upgrade Offer</h3>
            <p className="text-[11px] text-slate-400">Generate a discounted upgrade link for $97-activated agencies</p>
          </div>
        </div>
        <button
          onClick={() => { loadStatus(); loadSlots(); setCreatedOffer(null); }}
          className="p-1.5 rounded-lg hover:bg-slate-50 transition-colors"
          title="Refresh"
        >
          <RefreshCw className={`w-3.5 h-3.5 text-slate-400 ${statusLoading || slotsLoading ? 'animate-spin' : ''}`} />
        </button>
      </div>

      <div className="p-5 space-y-5">

        {/* Agency Status Card */}
        {statusLoading && (
          <div className="flex items-center gap-2 text-sm text-slate-400">
            <Loader2 className="w-4 h-4 animate-spin" />
            Loading agency plan status...
          </div>
        )}

        {statusError && (
          <div className="flex items-start gap-2 text-sm text-red-600 bg-red-50 rounded-lg p-3 border border-red-100">
            <AlertCircle className="w-4 h-4 mt-0.5 shrink-0" />
            {statusError}
          </div>
        )}

        {agencyStatus && !statusLoading && (
          <div className={`rounded-xl p-4 border ${isEligible ? 'bg-emerald-50 border-emerald-200' : 'bg-slate-50 border-slate-200'}`}>
            <div className="flex items-start justify-between gap-3">
              <div>
                <div className="flex items-center gap-2 mb-1">
                  {isEligible ? (
                    <span className="flex items-center gap-1 text-[11px] font-semibold text-emerald-700 bg-emerald-100 px-2 py-0.5 rounded-full">
                      <ShieldCheck className="w-3 h-3" />
                      Eligible for upgrade
                    </span>
                  ) : (
                    <span className="text-[11px] font-semibold text-slate-500 bg-slate-200 px-2 py-0.5 rounded-full">
                      Not eligible
                    </span>
                  )}
                  {agencyStatus.active_subscription && (
                    <span className={`text-[11px] font-semibold px-2 py-0.5 rounded-full border ${TIER_COLORS[agencyStatus.current_tier as keyof typeof TIER_COLORS] || TIER_COLORS.standard}`}>
                      {agencyStatus.active_subscription.price_label}
                    </span>
                  )}
                </div>

                {agencyStatus.active_subscription ? (
                  <div className="space-y-0.5">
                    <p className="text-xs text-slate-600">
                      Sub: <span className="font-mono text-[11px]">{agencyStatus.active_subscription.subscription_id}</span>
                    </p>
                    {agencyStatus.active_subscription.current_period_end && (
                      <p className="text-xs text-slate-500 flex items-center gap-1">
                        <Clock className="w-3 h-3" />
                        Renews {formatDate(agencyStatus.active_subscription.current_period_end)}
                        {agencyStatus.active_subscription.cancel_at_period_end && (
                          <span className="text-orange-500 font-medium">(cancels at period end)</span>
                        )}
                      </p>
                    )}
                  </div>
                ) : (
                  <p className="text-xs text-slate-500">No active subscription found</p>
                )}
              </div>

              {agencyStatus.activation_order && (
                <div className="text-right shrink-0">
                  <p className="text-[10px] text-slate-400 uppercase tracking-wide">Paid</p>
                  <p className="text-sm font-bold text-slate-700">
                    {formatDollars(agencyStatus.activation_order.amount_total)}
                  </p>
                  {agencyStatus.activation_order.paid_at && (
                    <p className="text-[11px] text-slate-400">{formatDate(agencyStatus.activation_order.paid_at)}</p>
                  )}
                </div>
              )}
            </div>

            {!isEligible && !statusLoading && (
              <div className="mt-3 space-y-2">
                <p className="text-xs text-slate-500">
                  {!agencyStatus.active_subscription
                    ? 'No active subscription found in stripe_orders. If the agency paid but activation data is missing, use the repair tool below.'
                    : agencyStatus.is_on_activation_plan === false
                      ? 'Agency is already on a Top 25 plan and does not need an upgrade offer.'
                      : 'Agency does not meet upgrade eligibility criteria.'}
                </p>

                {!agencyStatus.active_subscription && (
                  <button
                    onClick={handleRepair}
                    disabled={repairLoading}
                    className="flex items-center gap-1.5 text-xs font-semibold text-amber-700 bg-amber-50 border border-amber-200 px-3 py-1.5 rounded-lg hover:bg-amber-100 transition-colors disabled:opacity-50"
                  >
                    {repairLoading
                      ? <><Loader2 className="w-3 h-3 animate-spin" /> Repairing...</>
                      : <><Wrench className="w-3 h-3" /> Repair Activation Data</>}
                  </button>
                )}
              </div>
            )}
          </div>
        )}

        {/* Pending Offers */}
        {(agencyStatus?.pending_upgrade_offers?.length ?? 0) > 0 && (
          <div className="space-y-2">
            <p className="text-[11px] font-semibold text-slate-400 uppercase tracking-widest">Pending Upgrade Offers</p>
            {agencyStatus!.pending_upgrade_offers.map((offer) => (
              <div key={offer.id} className="flex items-center justify-between gap-3 bg-amber-50 border border-amber-200 rounded-xl p-3">
                <div>
                  <p className="text-xs font-semibold text-amber-800">
                    Rank #{offer.target_rank} · {TIER_LABELS[offer.target_tier as keyof typeof TIER_LABELS] || offer.target_tier}
                  </p>
                  <p className="text-[11px] text-amber-600">
                    {formatDollars(offer.final_upgrade_price_cents)} first 6mo · expires {formatDate(offer.expires_at)}
                  </p>
                </div>
                {offer.checkout_url && (
                  <a
                    href={offer.checkout_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-[11px] font-medium text-amber-700 hover:text-amber-900 flex items-center gap-1"
                  >
                    Open <ExternalLink className="w-3 h-3" />
                  </a>
                )}
              </div>
            ))}
          </div>
        )}

        {/* Repair error */}
        {repairError && (
          <div className="flex items-start gap-2 text-sm text-red-600 bg-red-50 rounded-lg p-3 border border-red-100">
            <AlertCircle className="w-4 h-4 mt-0.5 shrink-0" />
            {repairError}
          </div>
        )}

        {/* Repair report */}
        {repairReport && (
          <div className={`rounded-xl p-4 border space-y-2 ${repairReport.repaired > 0 ? 'bg-emerald-50 border-emerald-200' : 'bg-slate-50 border-slate-200'}`}>
            <div className="flex items-center gap-2">
              {repairReport.repaired > 0
                ? <Check className="w-4 h-4 text-emerald-600 shrink-0" />
                : <AlertCircle className="w-4 h-4 text-slate-400 shrink-0" />}
              <p className="text-sm font-semibold text-slate-800">
                {repairReport.repaired > 0
                  ? `Activation repaired — ${repairReport.repaired} record${repairReport.repaired > 1 ? 's' : ''} fixed`
                  : repairReport.message || 'No repairs needed'}
              </p>
            </div>
            <div className="grid grid-cols-3 gap-2 text-xs text-center">
              <div className="bg-white rounded-lg py-1.5 border border-slate-200">
                <div className="font-bold text-slate-800">{repairReport.scanned}</div>
                <div className="text-slate-400">scanned</div>
              </div>
              <div className="bg-white rounded-lg py-1.5 border border-emerald-200">
                <div className="font-bold text-emerald-700">{repairReport.repaired}</div>
                <div className="text-slate-400">repaired</div>
              </div>
              <div className="bg-white rounded-lg py-1.5 border border-slate-200">
                <div className={`font-bold ${repairReport.unresolved > 0 ? 'text-red-600' : 'text-slate-400'}`}>{repairReport.unresolved}</div>
                <div className="text-slate-400">unresolved</div>
              </div>
            </div>
            {repairReport.results.map((r, i) => (
              <div key={i} className={`rounded-lg p-2.5 border text-xs ${r.action === 'repaired' ? 'bg-white border-emerald-200' : r.action === 'unresolved' ? 'bg-red-50 border-red-200' : 'bg-white border-slate-200'}`}>
                <div className="flex items-center gap-1.5 mb-0.5">
                  <span className={`font-semibold ${r.action === 'repaired' ? 'text-emerald-700' : r.action === 'unresolved' ? 'text-red-600' : 'text-slate-500'}`}>
                    {r.action.toUpperCase()}
                  </span>
                  {r.resolved_agency_name && <span className="text-slate-700">{r.resolved_agency_name}</span>}
                </div>
                <p className="text-slate-500">{r.detail}</p>
              </div>
            ))}
            {repairReport.repaired > 0 && (
              <p className="text-xs text-emerald-600 font-medium">Status refreshing automatically...</p>
            )}
          </div>
        )}

        {/* Slot Selector — only show when eligible */}
        {isEligible && (
          <>
            {slotsLoading && (
              <div className="flex items-center gap-2 text-sm text-slate-400">
                <Loader2 className="w-4 h-4 animate-spin" />
                Loading available slots...
              </div>
            )}

            {slotsError && (
              <div className="flex items-start gap-2 text-sm text-red-600 bg-red-50 rounded-lg p-3 border border-red-100">
                <AlertCircle className="w-4 h-4 mt-0.5 shrink-0" />
                {slotsError}
              </div>
            )}

            {slotsData && !slotsLoading && (
              <div className="space-y-3">
                <div>
                  <label className="block text-[11px] font-semibold text-slate-500 uppercase tracking-widest mb-2">
                    Target Rank — {slotsData.available_count} slots open in {formatStateName(stateSlug)}
                  </label>

                  {slotsData.available_slots.length === 0 ? (
                    <div className="bg-red-50 border border-red-200 rounded-xl p-3 text-sm text-red-600">
                      No open slots in {formatStateName(stateSlug)}. All Top 25 positions are taken.
                    </div>
                  ) : (
                    <div className="relative">
                      <select
                        value={selectedRank ?? ''}
                        onChange={(e) => setSelectedRank(e.target.value ? Number(e.target.value) : null)}
                        className="w-full appearance-none bg-white border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm text-slate-800 pr-9 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-400"
                      >
                        <option value="">— Select a rank slot —</option>
                        {slotsData.available_slots.map((slot) => (
                          <option key={slot.id} value={slot.rank}>
                            Rank #{slot.rank} · {TIER_LABELS[slot.tier]} · {formatDollars(slot.full_price_cents)}/6mo
                          </option>
                        ))}
                      </select>
                      <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                    </div>
                  )}
                </div>

                {/* Price Calculator */}
                {selectedSlot && (
                  <div className="bg-slate-50 border border-slate-200 rounded-xl p-4 space-y-3">
                    <p className="text-[11px] font-semibold text-slate-400 uppercase tracking-widest">Price Breakdown</p>

                    <div className="space-y-1.5 text-sm">
                      <div className="flex justify-between text-slate-600">
                        <span>{TIER_LABELS[selectedSlot.tier]} listing (6mo)</span>
                        <span className="font-medium">{formatDollars(fullPriceCents)}</span>
                      </div>
                      <div className="flex justify-between text-emerald-600">
                        <span>Credit — existing $97 payment</span>
                        <span className="font-medium">−{formatDollars(creditCents)}</span>
                      </div>
                      {extraDiscountCents > 0 && (
                        <div className="flex justify-between text-blue-600">
                          <span>Extra admin discount</span>
                          <span className="font-medium">−{formatDollars(extraDiscountCents)}</span>
                        </div>
                      )}
                      <div className="border-t border-slate-200 pt-1.5 flex justify-between font-bold text-slate-900">
                        <span>First 6 months</span>
                        <span className="text-lg">{formatDollars(finalPriceCents)}</span>
                      </div>
                      <div className="flex justify-between text-xs text-slate-400">
                        <span>Renewal (6mo)</span>
                        <span>{formatDollars(fullPriceCents)}/6mo</span>
                      </div>
                    </div>

                    <div>
                      <label className="block text-[11px] font-semibold text-slate-500 uppercase tracking-widest mb-1.5">
                        Extra Discount ($)
                      </label>
                      <input
                        type="number"
                        min="0"
                        step="1"
                        value={extraDiscount}
                        onChange={(e) => setExtraDiscount(e.target.value)}
                        placeholder="0"
                        className="w-full bg-white border border-slate-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-400"
                      />
                      <p className="mt-1 text-[11px] text-slate-400">First billing cycle only. Leave 0 for no extra discount.</p>
                    </div>

                    <div>
                      <label className="block text-[11px] font-semibold text-slate-500 uppercase tracking-widest mb-1.5">
                        Internal Note (optional)
                      </label>
                      <input
                        type="text"
                        value={notes}
                        onChange={(e) => setNotes(e.target.value)}
                        placeholder="e.g. from follow-up on 3/25"
                        className="w-full bg-white border border-slate-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-400"
                      />
                    </div>

                    {createError && (
                      <div className="flex items-start gap-2 text-sm text-red-600 bg-red-50 rounded-lg p-3 border border-red-100">
                        <AlertCircle className="w-4 h-4 mt-0.5 shrink-0" />
                        {createError}
                      </div>
                    )}

                    <button
                      onClick={handleCreateOffer}
                      disabled={createLoading || !selectedRank}
                      className="w-full flex items-center justify-center gap-2 py-2.5 px-4 rounded-xl bg-emerald-600 text-white text-sm font-semibold hover:bg-emerald-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed shadow-sm"
                    >
                      {createLoading ? (
                        <><Loader2 className="w-4 h-4 animate-spin" /> Creating upgrade link...</>
                      ) : (
                        <><Star className="w-4 h-4" /> Generate Upgrade Link for Rank #{selectedRank}</>
                      )}
                    </button>
                  </div>
                )}
              </div>
            )}

            {/* Created Offer Result */}
            {createdOffer && (
              <div className="bg-emerald-50 border border-emerald-200 rounded-xl p-4 space-y-3">
                <div className="flex items-center gap-2">
                  <div className="w-6 h-6 bg-emerald-600 rounded-full flex items-center justify-center">
                    <Check className="w-3.5 h-3.5 text-white" />
                  </div>
                  <p className="text-sm font-semibold text-emerald-800">
                    Upgrade link created — Rank #{createdOffer.target.rank} ({TIER_LABELS[createdOffer.target.tier as keyof typeof TIER_LABELS] || createdOffer.target.tier})
                  </p>
                </div>

                <div className="bg-white border border-emerald-200 rounded-lg p-3 space-y-2">
                  <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-wider">Summary</p>
                  <div className="grid grid-cols-2 gap-x-4 gap-y-1 text-xs text-slate-600">
                    <span>First payment:</span>
                    <span className="font-bold text-slate-900">{formatDollars(createdOffer.pricing.final_upgrade_price_cents)}</span>
                    <span>Renewal:</span>
                    <span>{formatDollars(createdOffer.pricing.renewal_price_cents)}/6mo</span>
                    <span>Credit applied:</span>
                    <span className="text-emerald-600">−{formatDollars(createdOffer.pricing.credit_cents)}</span>
                    {createdOffer.pricing.extra_discount_cents > 0 && (
                      <>
                        <span>Extra discount:</span>
                        <span className="text-blue-600">−{formatDollars(createdOffer.pricing.extra_discount_cents)}</span>
                      </>
                    )}
                  </div>
                </div>

                {(() => {
                  const gappsyUrl = buildGappsyUpgradeUrl(createdOffer, agencyId, agencyName, stateSlug, selectedSlot?.id);
                  return (
                    <>
                      <div>
                        <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-wider mb-1.5">
                          Public Upgrade Link <span className="normal-case text-slate-300">(share this with the agency)</span>
                        </p>
                        <div className="flex items-center gap-2">
                          <input
                            readOnly
                            value={gappsyUrl}
                            className="flex-1 bg-white border border-slate-200 rounded-lg px-3 py-2 text-xs font-mono text-slate-700 truncate focus:outline-none"
                          />
                          <button
                            onClick={() => copyToClipboard(gappsyUrl)}
                            className="shrink-0 flex items-center gap-1.5 text-xs font-medium text-slate-600 bg-white border border-slate-200 px-3 py-2 rounded-lg hover:bg-slate-50 transition-colors"
                          >
                            {copied ? <Check className="w-3.5 h-3.5 text-emerald-500" /> : <Copy className="w-3.5 h-3.5" />}
                            {copied ? 'Copied' : 'Copy'}
                          </button>
                          <a
                            href={gappsyUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="shrink-0 p-2 rounded-lg bg-white border border-slate-200 hover:bg-slate-50 transition-colors"
                          >
                            <ExternalLink className="w-3.5 h-3.5 text-slate-400" />
                          </a>
                        </div>
                        <p className="mt-1.5 text-[10px] text-slate-400">
                          Direct Stripe link (no pricing preview):{' '}
                          <a
                            href={createdOffer.checkout_url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="underline hover:text-slate-600 truncate max-w-[200px] inline-block align-bottom"
                          >
                            {createdOffer.checkout_url.replace('https://', '')}
                          </a>
                        </p>
                      </div>

                      <div>
                        <div className="flex items-center justify-between mb-1.5">
                          <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-wider">Email Copy</p>
                          <button
                            onClick={() => copyToClipboard(generateEmailCopy(createdOffer, gappsyUrl))}
                            className="flex items-center gap-1 text-[11px] font-medium text-slate-500 hover:text-slate-700 transition-colors"
                          >
                            <Copy className="w-3 h-3" />
                            Copy email
                          </button>
                        </div>
                        <pre className="bg-white border border-slate-200 rounded-lg p-3 text-xs text-slate-700 whitespace-pre-wrap font-sans leading-relaxed max-h-48 overflow-y-auto">
                          {generateEmailCopy(createdOffer, gappsyUrl)}
                        </pre>
                      </div>
                    </>
                  );
                })()}

                <div className="flex items-start gap-2 text-xs text-slate-500 bg-slate-50 rounded-lg p-2.5 border border-slate-200">
                  <ArrowRight className="w-3.5 h-3.5 mt-0.5 shrink-0 text-slate-400" />
                  <span>
                    The old $97 subscription will <strong>not</strong> be cancelled until the new upgrade subscription is confirmed active via Stripe webhook.
                  </span>
                </div>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  );
}

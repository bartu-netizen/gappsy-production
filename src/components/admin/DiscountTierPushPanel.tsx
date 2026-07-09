import { useState, useEffect, useCallback } from 'react';
import { Copy, Check, ExternalLink, ToggleLeft, ToggleRight, RefreshCw, Clock, Zap, Loader2 } from 'lucide-react';
import { adminApiFetch } from '../../lib/adminApiFetch';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface TierOffer {
  id: string;
  token: string;
  discount_value: number;
  expires_at: string | null;
  max_uses: number;
  usage_count: number;
  is_active: boolean;
  push_enabled: boolean;
  scope_type: string | null;
  scope_expires_at: string | null;
  created_at: string;
  url: string;
}

interface Props {
  agencyId: string;
  agencySlug: string | null;
  stateSlug: string;
}

const DURATION_OPTIONS: { label: string; hours: number | null }[] = [
  { label: '24h', hours: 24 },
  { label: '3d', hours: 72 },
  { label: '7d', hours: 168 },
  { label: '14d', hours: 336 },
  { label: '30d', hours: 720 },
  { label: 'Unlimited', hours: null },
];

async function callManage(
  action: 'set_push_enabled' | 'disable_offer',
  offerId: string,
  extra?: Record<string, unknown>,
): Promise<{ ok: boolean; error?: string; push_enabled?: boolean; scope_expires_at?: string | null }> {
  try {
    const adminToken = localStorage.getItem('gappsy_admin_token') || localStorage.getItem('wp_admin_token') || '';
    const res = await fetch(`${SUPABASE_URL}/functions/v1/discount-offer-manage`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
        apikey: SUPABASE_ANON_KEY,
        'Content-Type': 'application/json',
        'x-admin-token': adminToken,
      },
      body: JSON.stringify({ action, offer_id: offerId, ...extra }),
    });
    const data = await res.json();
    if (res.status === 401) {
      return { ok: false, error: 'Push update unauthorized — admin auth missing.' };
    }
    return data;
  } catch {
    return { ok: false, error: 'network_error' };
  }
}

function formatExpiry(iso: string | null): string {
  if (!iso) return 'No expiry';
  const d = new Date(iso);
  const now = new Date();
  const diffMs = d.getTime() - now.getTime();
  if (diffMs <= 0) return 'Expired';
  const hours = Math.floor(diffMs / (1000 * 60 * 60));
  if (hours < 1) return `${Math.ceil(diffMs / (1000 * 60))}m left`;
  if (hours < 48) return `${hours}h left`;
  return `${Math.ceil(hours / 24)}d left`;
}

function getFullUrl(token: string): string {
  return `https://www.gappsy.com/offer/${token}`;
}

export default function DiscountTierPushPanel({ agencyId, agencySlug, stateSlug }: Props) {
  const [offers, setOffers] = useState<TierOffer[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [copiedId, setCopiedId] = useState<string | null>(null);
  const [togglingId, setTogglingId] = useState<string | null>(null);
  const [selectedDuration, setSelectedDuration] = useState<number | null>(24);

  const canLoad = !!agencyId;

  const load = useCallback(async () => {
    if (!agencyId) return;
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<{ ok: boolean; offers: TierOffer[]; created: number }>(
      'discount-offers-ensure-tiers',
      {
        method: 'POST',
        body: {
          agency_id: agencyId,
          agency_slug: agencySlug || undefined,
          state_slug: stateSlug || undefined,
        },
      },
    );
    if (result.ok && result.data?.offers) {
      setOffers(result.data.offers);
    } else {
      setError(result.error?.message || 'Failed to load tier offers');
    }
    setLoading(false);
  }, [agencyId, agencySlug, stateSlug]);

  useEffect(() => { if (canLoad) load(); }, [canLoad, load]);

  const handleTogglePush = async (offer: TierOffer) => {
    setTogglingId(offer.id);
    const nextEnabled = !offer.push_enabled;
    let scopeExpiresAt: string | null | undefined;
    if (nextEnabled) {
      scopeExpiresAt = selectedDuration === null
        ? null
        : new Date(Date.now() + selectedDuration * 60 * 60 * 1000).toISOString();
    }
    const res = await callManage('set_push_enabled', offer.id, {
      push_enabled: nextEnabled,
      ...(nextEnabled ? { scope_expires_at: scopeExpiresAt } : {}),
    });
    if (res.ok) {
      setOffers((prev) =>
        prev.map((o) =>
          o.id === offer.id
            ? {
                ...o,
                push_enabled: res.push_enabled ?? nextEnabled,
                scope_expires_at: 'scope_expires_at' in res ? res.scope_expires_at! : o.scope_expires_at,
              }
            : o,
        ),
      );
    } else {
      setError(res.error || 'Toggle failed');
    }
    setTogglingId(null);
  };

  const copyLink = (token: string, id: string) => {
    navigator.clipboard.writeText(getFullUrl(token)).then(() => {
      setCopiedId(id);
      setTimeout(() => setCopiedId(null), 2000);
    });
  };

  if (!agencyId) {
    return (
      <div className="rounded-xl border border-slate-200 bg-slate-50/60 px-4 py-3">
        <p className="text-xs text-slate-500">Select an agency to manage discount tiers.</p>
      </div>
    );
  }

  if (loading && offers.length === 0) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white px-4 py-3">
        <div className="flex items-center gap-2 text-slate-400 text-xs">
          <Loader2 className="w-3.5 h-3.5 animate-spin" />
          Loading discount tiers...
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-2">
      {/* State warning */}
      {!stateSlug && (
        <div className="rounded-xl border border-amber-100 bg-amber-50/60 px-3 py-2 mb-2">
          <p className="text-[10px] text-amber-700">State missing — automatic funnel push disabled until state is resolved.</p>
        </div>
      )}

      {error && (
        <div className="rounded-xl border border-red-100 bg-red-50/60 px-3 py-2 mb-2">
          <p className="text-[10px] text-red-600">{error}</p>
        </div>
      )}

      {/* Duration selector */}
      <div className="flex items-center gap-2 mb-1">
        <span className="text-[10px] text-slate-500 font-medium flex items-center gap-1">
          <Clock className="w-2.5 h-2.5" />
          Push duration:
        </span>
        <div className="flex gap-0.5 flex-wrap">
          {DURATION_OPTIONS.map((opt) => (
            <button
              key={opt.label}
              onClick={() => setSelectedDuration(opt.hours)}
              className={`px-2 py-0.5 rounded text-[10px] font-semibold transition-all ${
                selectedDuration === opt.hours
                  ? 'bg-slate-700 text-white'
                  : 'bg-slate-100 text-slate-500 hover:bg-slate-200'
              }`}
            >
              {opt.label}
            </button>
          ))}
        </div>
        <button
          onClick={load}
          disabled={loading}
          className="ml-auto p-1 rounded hover:bg-slate-100 text-slate-400 hover:text-slate-600 transition-colors"
          title="Refresh"
        >
          <RefreshCw className={`w-3 h-3 ${loading ? 'animate-spin' : ''}`} />
        </button>
      </div>

      {/* Tier cards */}
      {offers.map((offer) => {
        const isToggling = togglingId === offer.id;
        const isCopied = copiedId === offer.id;
        const isUsed = offer.max_uses > 0 && offer.usage_count >= offer.max_uses;
        const isExpired = offer.expires_at && new Date(offer.expires_at) <= new Date();
        const isDisabled = !offer.is_active || isUsed || !!isExpired;
        const fullUrl = getFullUrl(offer.token);

        return (
          <div key={offer.id} className={`rounded-xl border border-slate-100 bg-slate-50/60 px-3 py-2.5 ${isDisabled ? 'opacity-50' : ''}`}>
            {/* Row 1: label + status badges + actions */}
            <div className="flex items-start justify-between gap-2 mb-1">
              <div className="min-w-0">
                <p className="text-xs font-semibold text-slate-700 leading-tight flex items-center gap-1.5">
                  {offer.discount_value}% Activation Discount Link
                  {offer.push_enabled && (
                    <span className="text-[9px] font-semibold bg-blue-100 text-blue-700 px-1.5 py-0.5 rounded-full inline-flex items-center gap-0.5">
                      <Zap className="w-2 h-2" />
                      PUSHED
                    </span>
                  )}
                  {isUsed && (
                    <span className="text-[9px] font-semibold bg-red-100 text-red-600 px-1.5 py-0.5 rounded-full">USED</span>
                  )}
                  {isExpired && !isUsed && (
                    <span className="text-[9px] font-semibold bg-amber-100 text-amber-600 px-1.5 py-0.5 rounded-full">EXPIRED</span>
                  )}
                </p>
                <p className="text-[10px] text-slate-400 mt-0.5 leading-tight">
                  Single-use offer — {offer.discount_value}% off
                  {offer.expires_at && <> · Exp: {formatExpiry(offer.expires_at)}</>}
                  {' · '}Uses: {offer.usage_count}/{offer.max_uses}
                </p>
              </div>
              <div className="flex items-center gap-1 shrink-0">
                <button
                  onClick={() => copyLink(offer.token, offer.id)}
                  className="inline-flex items-center gap-1 text-[11px] font-medium text-slate-600 px-2 py-1 rounded-lg border border-slate-200 bg-white hover:bg-slate-50 transition-colors"
                >
                  {isCopied ? <Check className="w-3 h-3 text-emerald-500" /> : <Copy className="w-3 h-3 text-slate-400" />}
                  Copy
                </button>
                <a
                  href={fullUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-1 text-[11px] font-medium text-emerald-700 border-emerald-200 bg-emerald-50 hover:bg-emerald-100 px-2 py-1 rounded-lg border transition-colors"
                >
                  <ExternalLink className="w-3 h-3" />
                  Open
                </a>
              </div>
            </div>

            {/* Row 2: URL */}
            <p className="text-[10px] font-mono text-slate-400 break-all leading-relaxed mb-1.5">{fullUrl}</p>

            {/* Row 3: Push controls + status */}
            <div className="flex items-center gap-2 pt-1 border-t border-slate-100">
              {!isDisabled ? (
                <button
                  onClick={() => handleTogglePush(offer)}
                  disabled={isToggling}
                  className={`inline-flex items-center gap-1 text-[11px] font-semibold px-2.5 py-1 rounded-lg border transition-all ${
                    offer.push_enabled
                      ? 'bg-blue-50 border-blue-200 text-blue-700 hover:bg-blue-100'
                      : 'bg-white border-slate-200 text-slate-500 hover:bg-slate-50'
                  } ${isToggling ? 'opacity-50' : ''}`}
                >
                  {offer.push_enabled
                    ? <ToggleRight className="w-3.5 h-3.5" />
                    : <ToggleLeft className="w-3.5 h-3.5" />}
                  {isToggling ? '...' : offer.push_enabled ? 'Push ON' : 'Push OFF'}
                </button>
              ) : (
                <span className="text-[10px] text-slate-400">Push unavailable</span>
              )}

              {/* Status */}
              <span className="text-[10px] text-slate-400 ml-auto">
                {offer.push_enabled
                  ? offer.scope_expires_at
                    ? `Push enabled until ${new Date(offer.scope_expires_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric' })} (${formatExpiry(offer.scope_expires_at)})`
                    : 'Push enabled indefinitely'
                  : 'Push disabled'}
              </span>
            </div>
          </div>
        );
      })}

      {offers.length === 0 && !loading && !error && (
        <div className="rounded-xl border border-slate-100 bg-slate-50/60 px-3 py-2.5">
          <p className="text-[10px] text-slate-400 italic">No discount tier offers found.</p>
        </div>
      )}
    </div>
  );
}

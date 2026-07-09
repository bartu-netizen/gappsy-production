import { useState, useEffect, useCallback } from 'react';
import { Tag, Copy, Check, RefreshCw, ExternalLink, Clock, ToggleLeft, ToggleRight, XCircle, Zap } from 'lucide-react';
import { adminApiFetch } from '../../lib/adminApiFetch';

interface DiscountOfferRow {
  id: string;
  token: string;
  masked_token: string;
  discount_type: 'percentage' | 'fixed';
  discount_value: number;
  allowed_products: string[];
  expires_at: string | null;
  scope_expires_at: string | null;
  max_uses: number;
  usage_count: number;
  is_active: boolean;
  push_enabled: boolean;
  scope_type: string | null;
  internal_note: string | null;
  created_at: string;
}

interface DiscountEvent {
  id: string;
  event_name: string;
  created_at: string;
  metadata: Record<string, unknown>;
}

interface Props {
  agencyId: string;
  agencySlug?: string;
  stateSlug?: string;
}

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface ManageResponse {
  ok: boolean;
  error?: string;
  push_enabled?: boolean;
  scope_type?: string | null;
  scope_expires_at?: string | null;
  is_active?: boolean;
}

async function callManage(
  action: 'set_push_enabled' | 'disable_offer',
  offerId: string,
  extra?: Record<string, unknown>,
): Promise<ManageResponse> {
  try {
    const adminToken = localStorage.getItem('wp_admin_token') || '';
    const res = await fetch(`${SUPABASE_URL}/functions/v1/discount-offer-manage`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
        'Content-Type': 'application/json',
        'x-admin-token': adminToken,
      },
      body: JSON.stringify({ action, offer_id: offerId, ...extra }),
    });
    return await res.json();
  } catch {
    return { ok: false, error: 'network_error' };
  }
}

type StatusLabel = 'Active' | 'Push enabled' | 'Expired' | 'Max uses reached' | 'Disabled';

interface StatusPill {
  label: StatusLabel;
  bg: string;
  color: string;
}

function getStatusPills(offer: DiscountOfferRow): StatusPill[] {
  const pills: StatusPill[] = [];

  if (!offer.is_active) {
    pills.push({ label: 'Disabled', bg: '#374151', color: '#9ca3af' });
    return pills;
  }
  if (offer.max_uses > 0 && offer.usage_count >= offer.max_uses) {
    pills.push({ label: 'Max uses reached', bg: '#7f1d1d', color: '#fca5a5' });
    return pills;
  }
  if (offer.expires_at && new Date(offer.expires_at) < new Date()) {
    pills.push({ label: 'Expired', bg: '#78350f', color: '#fcd34d' });
    return pills;
  }

  pills.push({ label: 'Active', bg: '#065f46', color: '#6ee7b7' });

  if (offer.push_enabled) {
    pills.push({ label: 'Push enabled', bg: '#1e3a5f', color: '#93c5fd' });
  }

  return pills;
}

function formatDiscount(offer: DiscountOfferRow) {
  return offer.discount_type === 'percentage'
    ? `${offer.discount_value}% off`
    : `$${offer.discount_value} off`;
}

function formatDate(iso: string) {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

function formatEventName(name: string) {
  return name.replace(/^discount_/, '').replace(/_/g, ' ');
}

function getOfferLink(token: string): string {
  const origin = typeof window !== 'undefined' ? window.location.origin : '';
  return `${origin}/offer/${encodeURIComponent(token)}`;
}

export default function ActiveDiscountLinksPanel({ agencyId }: Props) {
  const [offers, setOffers] = useState<DiscountOfferRow[]>([]);
  const [events, setEvents] = useState<DiscountEvent[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [copiedId, setCopiedId] = useState<string | null>(null);
  const [togglingId, setTogglingId] = useState<string | null>(null);
  const [disablingId, setDisablingId] = useState<string | null>(null);
  const [confirmDisableId, setConfirmDisableId] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<{ offers: DiscountOfferRow[]; recent_events: DiscountEvent[] }>(
      `discount-offers-list?agency_id=${encodeURIComponent(agencyId)}`,
    );
    if (result.ok && result.data) {
      setOffers(result.data.offers || []);
      setEvents(result.data.recent_events || []);
    } else {
      setError(result.error?.message || 'Failed to load');
    }
    setLoading(false);
  }, [agencyId]);

  useEffect(() => { load(); }, [load]);

  const copyText = (text: string, id: string) => {
    navigator.clipboard.writeText(text).then(() => {
      setCopiedId(id);
      setTimeout(() => setCopiedId(null), 2000);
    });
  };

  const handleTogglePush = async (offer: DiscountOfferRow) => {
    if (!offer.is_active) return;
    setTogglingId(offer.id);
    const next = !offer.push_enabled;
    const res = await callManage('set_push_enabled', offer.id, { push_enabled: next });
    if (res.ok) {
      setOffers((prev) =>
        prev.map((o) => o.id === offer.id ? {
          ...o,
          push_enabled: res.push_enabled ?? next,
          scope_type: res.scope_type !== undefined ? res.scope_type : o.scope_type,
          scope_expires_at: res.scope_expires_at !== undefined ? res.scope_expires_at : o.scope_expires_at,
        } : o)
      );
    } else {
      setError(res.error || 'Toggle failed');
    }
    setTogglingId(null);
  };

  const handleDisable = async (offerId: string) => {
    setDisablingId(offerId);
    const res = await callManage('disable_offer', offerId);
    if (res.ok) {
      setOffers((prev) =>
        prev.map((o) => o.id === offerId ? { ...o, is_active: false, push_enabled: false } : o)
      );
    } else {
      setError(res.error || 'Disable failed');
    }
    setDisablingId(null);
    setConfirmDisableId(null);
  };

  if (loading && offers.length === 0) {
    return (
      <div style={{ padding: '16px', color: '#94a3b8', fontSize: '13px' }}>
        Loading discount offers...
      </div>
    );
  }

  if (offers.length === 0 && !loading) return null;

  return (
    <div
      style={{
        background: '#1e293b',
        border: '1px solid #334155',
        borderRadius: '8px',
        marginTop: '12px',
        overflow: 'hidden',
      }}
    >
      {/* Header */}
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          padding: '10px 14px',
          borderBottom: '1px solid #334155',
        }}
      >
        <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
          <Tag size={14} style={{ color: '#22d3ee' }} />
          <span style={{ fontSize: '13px', fontWeight: 600, color: '#e2e8f0' }}>
            Discount Offers ({offers.length})
          </span>
        </div>
        <button
          onClick={load}
          disabled={loading}
          style={{ background: 'none', border: 'none', cursor: 'pointer', color: '#64748b', padding: '2px' }}
        >
          <RefreshCw size={13} className={loading ? 'animate-spin' : ''} />
        </button>
      </div>

      {error && (
        <div style={{ padding: '8px 14px', fontSize: '12px', color: '#f87171' }}>{error}</div>
      )}

      <div style={{ maxHeight: '400px', overflowY: 'auto' }}>
        {offers.map((offer) => {
          const pills = getStatusPills(offer);
          const isExpiredOrConsumed =
            !offer.is_active ||
            (offer.max_uses > 0 && offer.usage_count >= offer.max_uses) ||
            (!!offer.expires_at && new Date(offer.expires_at) < new Date());
          const isCopiedToken = copiedId === offer.id;
          const isCopiedLink = copiedId === `link-${offer.id}`;
          const isToggling = togglingId === offer.id;
          const isDisabling = disablingId === offer.id;
          const awaitingConfirm = confirmDisableId === offer.id;

          return (
            <div
              key={offer.id}
              style={{
                padding: '10px 14px',
                borderBottom: '1px solid #0f172a',
                background: offer.is_active ? '#0f172a' : '#0a0f1a',
                opacity: offer.is_active ? 1 : 0.65,
              }}
            >
              {/* Row 1: token + status badges + discount label */}
              <div style={{ display: 'flex', alignItems: 'center', gap: '8px', flexWrap: 'wrap' }}>
                <code
                  style={{
                    fontSize: '12px',
                    color: '#94a3b8',
                    background: '#1e293b',
                    padding: '2px 6px',
                    borderRadius: '4px',
                    fontFamily: 'monospace',
                  }}
                >
                  {offer.masked_token}
                </code>

                {/* Status pills */}
                {pills.map((p) => (
                  <span
                    key={p.label}
                    style={{
                      fontSize: '10px',
                      fontWeight: 600,
                      background: p.bg,
                      color: p.color,
                      padding: '1px 7px',
                      borderRadius: '9999px',
                    }}
                  >
                    {p.label}
                  </span>
                ))}

                <span style={{ fontSize: '11px', color: '#cbd5e1', fontWeight: 600 }}>
                  {formatDiscount(offer)}
                </span>

                {offer.allowed_products.length === 1 && offer.allowed_products[0] !== 'all' && (
                  <span style={{ fontSize: '10px', color: '#64748b' }}>
                    [{offer.allowed_products[0]}]
                  </span>
                )}
              </div>

              {/* Row 2: usage + expiry + note */}
              <div style={{ display: 'flex', gap: '12px', marginTop: '4px', fontSize: '11px', color: '#64748b', flexWrap: 'wrap' }}>
                <span>Uses: {offer.usage_count}/{offer.max_uses}</span>
                {offer.expires_at && (
                  <span style={{ display: 'flex', alignItems: 'center', gap: '3px' }}>
                    <Clock size={10} />
                    Exp: {formatDate(offer.expires_at)}
                  </span>
                )}
                {offer.scope_expires_at && offer.push_enabled && (
                  <span style={{ display: 'flex', alignItems: 'center', gap: '3px', color: '#60a5fa' }}>
                    <Zap size={9} />
                    Push until: {formatDate(offer.scope_expires_at)}
                  </span>
                )}
                <span>Created: {formatDate(offer.created_at)}</span>
                {offer.internal_note && (
                  <span style={{ color: '#475569', fontStyle: 'italic' }}>
                    {offer.internal_note.length > 30
                      ? `${offer.internal_note.slice(0, 30)}...`
                      : offer.internal_note}
                  </span>
                )}
              </div>

              {/* Row 3: actions */}
              <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginTop: '6px', flexWrap: 'wrap' }}>
                {/* Copy token */}
                <button
                  onClick={() => copyText(offer.token, offer.id)}
                  title="Copy full token"
                  style={actionBtnStyle(isCopiedToken ? '#4ade80' : '#64748b')}
                >
                  {isCopiedToken ? <Check size={11} /> : <Copy size={11} />}
                  <span>{isCopiedToken ? 'Copied' : 'Token'}</span>
                </button>

                {/* Copy link */}
                <button
                  onClick={() => copyText(getOfferLink(offer.token), `link-${offer.id}`)}
                  title="Copy /offer/ link"
                  style={actionBtnStyle(isCopiedLink ? '#4ade80' : '#64748b')}
                >
                  {isCopiedLink ? <Check size={11} /> : <ExternalLink size={11} />}
                  <span>{isCopiedLink ? 'Copied' : 'Link'}</span>
                </button>

                {/* Open link in new tab */}
                <a
                  href={getOfferLink(offer.token)}
                  target="_blank"
                  rel="noopener noreferrer"
                  style={{ ...actionBtnStyle('#64748b'), textDecoration: 'none' }}
                >
                  <ExternalLink size={11} />
                  <span>Open</span>
                </a>

                {/* Push to funnels toggle */}
                {!isExpiredOrConsumed && (
                  <button
                    onClick={() => handleTogglePush(offer)}
                    disabled={isToggling}
                    title={offer.push_enabled ? 'Disable funnel push' : 'Enable funnel push'}
                    style={{
                      ...actionBtnStyle(offer.push_enabled ? '#60a5fa' : '#64748b'),
                      opacity: isToggling ? 0.5 : 1,
                    }}
                  >
                    {offer.push_enabled
                      ? <ToggleRight size={13} />
                      : <ToggleLeft size={13} />}
                    <span>{isToggling ? '...' : offer.push_enabled ? 'Push ON' : 'Push OFF'}</span>
                  </button>
                )}

                {/* Disable offer */}
                {offer.is_active && (
                  awaitingConfirm ? (
                    <span style={{ display: 'flex', gap: '6px', alignItems: 'center' }}>
                      <button
                        onClick={() => handleDisable(offer.id)}
                        disabled={isDisabling}
                        style={{ ...actionBtnStyle('#ef4444'), fontSize: '10px' }}
                      >
                        {isDisabling ? '...' : 'Confirm disable'}
                      </button>
                      <button
                        onClick={() => setConfirmDisableId(null)}
                        style={actionBtnStyle('#64748b')}
                      >
                        Cancel
                      </button>
                    </span>
                  ) : (
                    <button
                      onClick={() => setConfirmDisableId(offer.id)}
                      title="Disable this discount link permanently"
                      style={actionBtnStyle('#ef4444')}
                    >
                      <XCircle size={11} />
                      <span>Disable link</span>
                    </button>
                  )
                )}
              </div>
            </div>
          );
        })}
      </div>

      {/* Recent Events */}
      {events.length > 0 && (
        <>
          <div
            style={{
              padding: '8px 14px',
              borderTop: '1px solid #334155',
              fontSize: '12px',
              fontWeight: 600,
              color: '#94a3b8',
            }}
          >
            Recent Events
          </div>
          <div style={{ maxHeight: '120px', overflowY: 'auto' }}>
            {events.slice(0, 10).map((evt) => (
              <div
                key={evt.id}
                style={{
                  padding: '4px 14px',
                  fontSize: '11px',
                  color: '#64748b',
                  display: 'flex',
                  gap: '8px',
                }}
              >
                <span style={{ color: '#94a3b8', fontWeight: 500 }}>{formatEventName(evt.event_name)}</span>
                <span>{formatDate(evt.created_at)}</span>
                {evt.metadata?.source != null && (
                  <span style={{ color: '#475569' }}>src: {String(evt.metadata.source)}</span>
                )}
              </div>
            ))}
          </div>
        </>
      )}
    </div>
  );
}

function actionBtnStyle(color: string): React.CSSProperties {
  return {
    background: 'none',
    border: 'none',
    cursor: 'pointer',
    color,
    padding: '1px',
    display: 'flex',
    alignItems: 'center',
    gap: '3px',
    fontSize: '11px',
  };
}

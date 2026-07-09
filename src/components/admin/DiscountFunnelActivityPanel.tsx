import { useState, useEffect, useCallback } from 'react';
import { Activity, RefreshCw, TrendingUp, MousePointerClick, ShoppingCart, DollarSign, XCircle } from 'lucide-react';
import { adminApiFetch } from '../../lib/adminApiFetch';

interface TimelineEntry {
  type: string;
  event: string;
  timestamp: string;
  details: Record<string, unknown>;
}

interface TierStats {
  clicks: number;
  checkouts: number;
  purchases: number;
  revenue_cents: number;
}

interface FunnelStats {
  total_offers_created: number;
  active_offers: number;
  total_link_clicks: number;
  total_validations: number;
  total_checkout_opened: number;
  total_completed: number;
  total_consumed: number;
  total_invalid_expired: number;
  discounted_orders: number;
  total_revenue_cents: number;
  discounted_revenue_cents: number;
  total_discount_given_cents: number;
  by_tier: Record<string, TierStats>;
}

interface TimelineResponse {
  timeline: TimelineEntry[];
  stats: FunnelStats;
  offers_count: number;
}

interface Props {
  agencyId: string;
}

const TYPE_COLORS: Record<string, { bg: string; text: string }> = {
  offer_created: { bg: '#1e3a5f', text: '#7dd3fc' },
  funnel_event: { bg: '#1a2e1a', text: '#86efac' },
  purchase: { bg: '#3b1f0b', text: '#fdba74' },
};

function formatCents(cents: number): string {
  return `$${(cents / 100).toFixed(2)}`;
}

function formatTimestamp(iso: string): string {
  const d = new Date(iso);
  return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric' }) +
    ' ' + d.toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit' });
}

export default function DiscountFunnelActivityPanel({ agencyId }: Props) {
  const [data, setData] = useState<TimelineResponse | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [expanded, setExpanded] = useState(false);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<TimelineResponse>(
      `discount-funnel-timeline?agency_id=${encodeURIComponent(agencyId)}`,
    );
    if (result.ok && result.data) {
      setData(result.data);
    } else {
      setError(result.error?.message || 'Failed to load');
    }
    setLoading(false);
  }, [agencyId]);

  useEffect(() => { load(); }, [load]);

  if (loading && !data) {
    return (
      <div style={{ padding: '16px', color: '#94a3b8', fontSize: '13px' }}>
        Loading discount funnel activity...
      </div>
    );
  }

  if (!data || (data.timeline.length === 0 && data.stats.total_offers_created === 0)) return null;

  const stats = data.stats;
  const timeline = data.timeline;
  const lastClick = timeline.find(e => e.type === 'funnel_event' && e.details.event_name === 'discount_checkout_link_opened');
  const hasPurchased = stats.total_consumed > 0 || stats.discounted_orders > 0;
  const hasCheckoutOpened = stats.total_checkout_opened > 0;

  const tierKeys = Object.keys(stats.by_tier).filter(k => k !== 'unknown').sort((a, b) => Number(a) - Number(b));

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
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          padding: '10px 14px',
          borderBottom: '1px solid #334155',
          cursor: 'pointer',
        }}
        onClick={() => setExpanded(!expanded)}
      >
        <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
          <Activity size={14} style={{ color: '#f59e0b' }} />
          <span style={{ fontSize: '13px', fontWeight: 600, color: '#e2e8f0' }}>
            Discount Funnel Activity
          </span>
          {hasPurchased && (
            <span style={{ fontSize: '10px', fontWeight: 600, background: '#065f46', color: '#6ee7b7', padding: '1px 6px', borderRadius: '9999px' }}>
              CONVERTED
            </span>
          )}
          {!hasPurchased && hasCheckoutOpened && (
            <span style={{ fontSize: '10px', fontWeight: 600, background: '#78350f', color: '#fcd34d', padding: '1px 6px', borderRadius: '9999px' }}>
              CHECKOUT OPENED
            </span>
          )}
          {!hasPurchased && !hasCheckoutOpened && stats.total_link_clicks > 0 && (
            <span style={{ fontSize: '10px', fontWeight: 600, background: '#1e3a5f', color: '#7dd3fc', padding: '1px 6px', borderRadius: '9999px' }}>
              CLICKED
            </span>
          )}
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          <span style={{ fontSize: '11px', color: '#64748b' }}>
            {timeline.length} events
          </span>
          <button
            onClick={(e) => { e.stopPropagation(); load(); }}
            disabled={loading}
            style={{ background: 'none', border: 'none', cursor: 'pointer', color: '#64748b', padding: '2px' }}
          >
            <RefreshCw size={13} className={loading ? 'animate-spin' : ''} />
          </button>
        </div>
      </div>

      {error && (
        <div style={{ padding: '8px 14px', fontSize: '12px', color: '#f87171' }}>{error}</div>
      )}

      {/* KPI Row */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '1px', background: '#334155' }}>
        {[
          { icon: MousePointerClick, label: 'Clicks', value: stats.total_link_clicks, color: '#7dd3fc' },
          { icon: ShoppingCart, label: 'Checkouts', value: stats.total_checkout_opened, color: '#fcd34d' },
          { icon: DollarSign, label: 'Purchases', value: stats.discounted_orders, color: '#6ee7b7' },
          { icon: TrendingUp, label: 'Revenue', value: formatCents(stats.discounted_revenue_cents), color: '#fdba74' },
        ].map(({ icon: Icon, label, value, color }) => (
          <div key={label} style={{ background: '#0f172a', padding: '8px 10px', textAlign: 'center' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '4px', marginBottom: '2px' }}>
              <Icon size={11} style={{ color }} />
              <span style={{ fontSize: '10px', color: '#64748b', textTransform: 'uppercase', letterSpacing: '0.5px' }}>{label}</span>
            </div>
            <span style={{ fontSize: '16px', fontWeight: 700, color }}>{value}</span>
          </div>
        ))}
      </div>

      {/* Last Click + Conversion Summary */}
      <div style={{ padding: '8px 14px', background: '#0f172a', borderTop: '1px solid #334155', display: 'flex', gap: '16px', flexWrap: 'wrap', fontSize: '11px' }}>
        <span style={{ color: '#94a3b8' }}>
          Last click: {lastClick ? formatTimestamp(lastClick.timestamp) : 'none'}
        </span>
        <span style={{ color: '#94a3b8' }}>
          Checkout opened: <span style={{ color: hasCheckoutOpened ? '#6ee7b7' : '#f87171', fontWeight: 600 }}>{hasCheckoutOpened ? 'Yes' : 'No'}</span>
        </span>
        <span style={{ color: '#94a3b8' }}>
          Purchased: <span style={{ color: hasPurchased ? '#6ee7b7' : '#f87171', fontWeight: 600 }}>{hasPurchased ? 'Yes' : 'No'}</span>
        </span>
        {stats.total_discount_given_cents > 0 && (
          <span style={{ color: '#fcd34d' }}>
            Discount given: {formatCents(stats.total_discount_given_cents)}
          </span>
        )}
        {stats.total_invalid_expired > 0 && (
          <span style={{ color: '#f87171', display: 'flex', alignItems: 'center', gap: '3px' }}>
            <XCircle size={10} /> {stats.total_invalid_expired} invalid/expired
          </span>
        )}
      </div>

      {/* Tier Breakdown */}
      {tierKeys.length > 0 && (
        <div style={{ padding: '6px 14px', background: '#0f172a', borderTop: '1px solid #1e293b' }}>
          <span style={{ fontSize: '11px', fontWeight: 600, color: '#94a3b8', marginBottom: '4px', display: 'block' }}>
            By Tier
          </span>
          <div style={{ display: 'flex', gap: '12px', flexWrap: 'wrap' }}>
            {tierKeys.map(tier => {
              const t = stats.by_tier[tier];
              return (
                <div key={tier} style={{ fontSize: '11px', color: '#64748b' }}>
                  <span style={{ color: '#cbd5e1', fontWeight: 600 }}>{tier}%</span>
                  {' '}{t.clicks}c / {t.checkouts}co / {t.purchases}p
                  {t.revenue_cents > 0 && <span style={{ color: '#fdba74' }}> {formatCents(t.revenue_cents)}</span>}
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Expandable Timeline */}
      {expanded && (
        <div style={{ borderTop: '1px solid #334155' }}>
          <div style={{ padding: '6px 14px', fontSize: '12px', fontWeight: 600, color: '#94a3b8' }}>
            Timeline ({timeline.length})
          </div>
          <div style={{ maxHeight: '280px', overflowY: 'auto' }}>
            {timeline.map((entry, i) => {
              const colors = TYPE_COLORS[entry.type] || { bg: '#1e293b', text: '#94a3b8' };
              return (
                <div
                  key={i}
                  style={{
                    padding: '6px 14px',
                    borderBottom: '1px solid #1e293b',
                    display: 'flex',
                    alignItems: 'flex-start',
                    gap: '8px',
                  }}
                >
                  <span
                    style={{
                      fontSize: '9px',
                      fontWeight: 600,
                      background: colors.bg,
                      color: colors.text,
                      padding: '1px 5px',
                      borderRadius: '3px',
                      whiteSpace: 'nowrap',
                      marginTop: '2px',
                      textTransform: 'uppercase',
                    }}
                  >
                    {entry.type === 'offer_created' ? 'offer' : entry.type === 'purchase' ? 'paid' : 'event'}
                  </span>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <span style={{ fontSize: '12px', color: '#e2e8f0', fontWeight: 500 }}>
                      {entry.event}
                    </span>
                    <div style={{ fontSize: '10px', color: '#64748b', marginTop: '1px' }}>
                      {formatTimestamp(entry.timestamp)}
                      {entry.details.offer_token_last6 && (
                        <span style={{ marginLeft: '8px', fontFamily: 'monospace' }}>
                          ...{String(entry.details.offer_token_last6)}
                        </span>
                      )}
                      {entry.details.token_last6 && (
                        <span style={{ marginLeft: '8px', fontFamily: 'monospace' }}>
                          ...{String(entry.details.token_last6)}
                        </span>
                      )}
                      {entry.details.source && (
                        <span style={{ marginLeft: '8px' }}>src: {String(entry.details.source)}</span>
                      )}
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {!expanded && timeline.length > 0 && (
        <button
          onClick={() => setExpanded(true)}
          style={{
            width: '100%',
            padding: '6px',
            background: 'none',
            border: 'none',
            borderTop: '1px solid #334155',
            color: '#64748b',
            fontSize: '11px',
            cursor: 'pointer',
            textAlign: 'center',
          }}
        >
          Show full timeline ({timeline.length} events)
        </button>
      )}
    </div>
  );
}

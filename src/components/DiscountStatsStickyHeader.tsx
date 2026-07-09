import { useState, useEffect } from 'react';
import { TrendingUp } from 'lucide-react';
import { getRetainerAmountWithFallback } from '../utils/retainerUtils';
import { getUnifiedAgencyKpi, normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

const DEFAULT_RETAINER_FALLBACK = 1500;

interface Props {
  agencyId: string;
  agencySlug?: string;
  agencyName: string;
}

export default function DiscountStatsStickyHeader({ agencyId, agencySlug: agencySlugProp, agencyName }: Props) {
  const [requests30d, setRequests30d] = useState<number | null>(null);
  const [missedRevenue, setMissedRevenue] = useState<number | null>(null);
  const [ready, setReady] = useState(false);

  useEffect(() => {
    if (!agencyId && !agencySlugProp) return;

    async function load() {
      try {
        let resolvedSlug: string | null = agencySlugProp || null;
        let retainerAmount = DEFAULT_RETAINER_FALLBACK;

        if (!resolvedSlug) {
          const agencyRes = await fetch(
            `${SUPABASE_URL}/rest/v1/other_agencies?id=eq.${agencyId}&select=slug,average_retainer_amount,average_retainer_range`,
            {
              headers: {
                'apikey': SUPABASE_ANON_KEY,
                'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
              },
            }
          );

          if (agencyRes.ok) {
            const agencyData = await agencyRes.json();
            if (Array.isArray(agencyData) && agencyData.length > 0) {
              const row = agencyData[0];
              resolvedSlug = row.slug || null;
              const fetched = getRetainerAmountWithFallback(
                row.average_retainer_amount,
                row.average_retainer_range
              );
              if (fetched && fetched > 0) retainerAmount = fetched;
            }
          }
        } else {
          const agencyRes = await fetch(
            `${SUPABASE_URL}/rest/v1/other_agencies?slug=eq.${resolvedSlug}&select=average_retainer_amount,average_retainer_range`,
            {
              headers: {
                'apikey': SUPABASE_ANON_KEY,
                'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
              },
            }
          );
          if (agencyRes.ok) {
            const agencyData = await agencyRes.json();
            if (Array.isArray(agencyData) && agencyData.length > 0) {
              const row = agencyData[0];
              const fetched = getRetainerAmountWithFallback(
                row.average_retainer_amount,
                row.average_retainer_range
              );
              if (fetched && fetched > 0) retainerAmount = fetched;
            }
          }
        }

        if (!resolvedSlug) {
          setReady(true);
          return;
        }

        const kpi = await getUnifiedAgencyKpi(resolvedSlug);
        const displayCount = normalizeDisplayedMissedCount(kpi?.missedCount ?? null);

        setRequests30d(displayCount);
        setMissedRevenue(retainerAmount * displayCount);

        setReady(true);
      } catch (err) {
        console.error('[DiscountStatsStickyHeader] error loading stats:', err);
        setReady(true);
      }
    }

    load();
  }, [agencyId, agencySlugProp]);

  if (!ready || requests30d == null) return null;

  const formattedRevenue = missedRevenue && missedRevenue > 0
    ? new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0,
        maximumFractionDigits: 0,
      }).format(missedRevenue)
    : null;

  return (
    <div
      style={{
        position: 'sticky',
        top: 0,
        zIndex: 50,
        backgroundColor: '#0f172a',
        borderBottom: '1px solid rgba(71, 85, 105, 0.4)',
        padding: '9px 16px',
      }}
    >
      <div
        style={{
          maxWidth: '860px',
          margin: '0 auto',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          gap: '7px',
          flexWrap: 'wrap',
        }}
      >
        <TrendingUp size={13} style={{ color: '#f97316', flexShrink: 0 }} />
        <span
          style={{
            fontSize: '12.5px',
            fontWeight: 600,
            color: '#cbd5e1',
            lineHeight: 1.45,
            textAlign: 'center',
          }}
        >
          <span style={{ color: '#fb923c', fontWeight: 700 }}>{agencyName}</span>
          {' '}missed{' '}
          <span style={{ color: '#fb923c', fontWeight: 700 }}>
            {requests30d} client request{requests30d !== 1 ? 's' : ''}
          </span>
          {' '}in the last 30 days
          {formattedRevenue && (
            <>
              {' '}&bull;{' '}
              <span style={{ color: '#4ade80', fontWeight: 700 }}>~{formattedRevenue}</span>
              {' '}potential revenue
            </>
          )}
        </span>
      </div>
    </div>
  );
}

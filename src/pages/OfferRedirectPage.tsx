import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Zap, AlertTriangle } from 'lucide-react';
import { storeScopedDiscountMarker, setActiveOfferFlow } from '../utils/discountOffer';
import {
  extractDiscountContext,
  trackDiscountLinkOpened,
  trackDiscountValidated,
  trackDiscountInvalidOrExpired,
} from '../utils/discountCheckoutTracking';
import { useNoindex } from '../components/NoindexMeta';
import { getStateName } from '../utils/stateUtils';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

type Status = 'loading' | 'redirecting' | 'invalid' | 'error';

export default function OfferRedirectPage() {
  useNoindex();
  const { token } = useParams<{ token: string }>();
  const navigate = useNavigate();
  const [status, setStatus] = useState<Status>('loading');

  useEffect(() => {
    if (!token) {
      setStatus('invalid');
      return;
    }

    let cancelled = false;

    (async () => {
      try {
        const res = await fetch(
          `${SUPABASE_URL}/functions/v1/discount-offer-validate?token=${encodeURIComponent(token)}`,
          { headers: { Authorization: `Bearer ${SUPABASE_ANON_KEY}`, 'Content-Type': 'application/json' } }
        );

        if (cancelled) return;

        if (!res.ok) {
          setStatus('error');
          return;
        }

        const data = await res.json();

        if (!data.valid) {
          const ctx = extractDiscountContext(null, { offer_token: token });
          trackDiscountInvalidOrExpired(ctx, data.reason || 'invalid');
          setStatus('invalid');
          return;
        }

        const offer = data.offer;

        const ctx = extractDiscountContext(offer, { offer_token: token });
        trackDiscountLinkOpened(ctx);
        trackDiscountValidated(ctx);

        // Store agency-scoped marker to prevent cross-agency leakage
        const markerAgencyId = offer.agency_id || '';
        const markerStateSlug = offer.state_slug || '';
        if (markerAgencyId && markerStateSlug) {
          const pct = offer.discount_type === 'percentage' ? Math.round(Number(offer.discount_value)) : 0;
          const scopeMs = offer.scope_expires_at ? new Date(offer.scope_expires_at).getTime() : null;
          const expiresMs = offer.expires_at ? new Date(offer.expires_at).getTime() : null;
          storeScopedDiscountMarker(markerAgencyId, markerStateSlug, {
            token,
            discount_percent: pct,
            created_at: Date.now(),
            expires_at: expiresMs,
            scope_expires_at: scopeMs,
          });
        }
        const sessionExpiry = offer.scope_expires_at
          ? Math.min(new Date(offer.scope_expires_at).getTime(), Date.now() + 24 * 60 * 60 * 1000)
          : Date.now() + 24 * 60 * 60 * 1000;
        setActiveOfferFlow(token, 'offer_redirect', offer.agency_id, offer.state_slug, sessionExpiry);
        setStatus('redirecting');

        const stateSlug: string = offer.state_slug || '';
        const stateName: string =
          offer.state_name || (stateSlug ? getStateName(stateSlug) : '') || '';

        const params = new URLSearchParams();
        params.set('offer', token);
        if (offer.agency_id) params.set('agencyId', offer.agency_id);
        if (offer.agency_slug) params.set('agencySlug', offer.agency_slug);
        if (offer.agency_name) params.set('agencyName', offer.agency_name);
        if (stateSlug) params.set('stateSlug', stateSlug);
        if (stateName) params.set('stateName', stateName);
        if (offer.agency_website) params.set('agencyWebsite', offer.agency_website);
        if (offer.agency_description) params.set('agencyDescription', offer.agency_description);
        params.set('src', 'offer');

        navigate(`/activation/upgrade?${params.toString()}`, { replace: true });
      } catch {
        if (!cancelled) setStatus('error');
      }
    })();

    return () => { cancelled = true; };
  }, [token, navigate]);

  if (status === 'loading' || status === 'redirecting') {
    return (
      <div style={{ minHeight: '100svh', backgroundColor: '#F8FAFC', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '24px' }}>
        <div style={{ textAlign: 'center' }}>
          <div
            style={{
              width: '40px',
              height: '40px',
              border: '3px solid #e2e8f0',
              borderTop: '3px solid #16a34a',
              borderRadius: '50%',
              animation: 'spin 1s linear infinite',
              margin: '0 auto 16px',
            }}
          />
          <p style={{ color: '#475569', fontSize: '14px', margin: 0 }}>
            {status === 'redirecting' ? 'Redirecting to your exclusive offer...' : 'Verifying your offer...'}
          </p>
          <style>{`@keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }`}</style>
        </div>
      </div>
    );
  }

  return (
    <div style={{ minHeight: '100svh', backgroundColor: '#F8FAFC', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '24px' }}>
      <div style={{ maxWidth: '440px', width: '100%', textAlign: 'center' }}>
        <div
          style={{
            width: '48px',
            height: '48px',
            borderRadius: '50%',
            backgroundColor: '#fee2e2',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            margin: '0 auto 16px',
          }}
        >
          <AlertTriangle size={22} style={{ color: '#dc2626' }} />
        </div>
        <h1 style={{ fontSize: '20px', fontWeight: 700, color: '#0f172a', marginBottom: '8px', lineHeight: 1.2 }}>
          This offer link is not valid
        </h1>
        <p style={{ fontSize: '14px', color: '#475569', lineHeight: 1.6, marginBottom: '24px' }}>
          The offer link you followed could not be verified. You can still activate your listing at the standard price.
        </p>
        <div style={{ display: 'flex', gap: '10px', justifyContent: 'center', flexWrap: 'wrap' }}>
          <button
            onClick={() => navigate('/activation/upgrade')}
            style={{
              backgroundColor: '#0f172a',
              color: '#fff',
              padding: '10px 20px',
              borderRadius: '8px',
              border: 'none',
              fontSize: '14px',
              fontWeight: 500,
              cursor: 'pointer',
              display: 'inline-flex',
              alignItems: 'center',
              gap: '6px',
            }}
          >
            <Zap size={14} />
            Continue to Activation
          </button>
          <button
            onClick={() => navigate('/')}
            style={{
              backgroundColor: '#fff',
              color: '#374151',
              padding: '10px 20px',
              borderRadius: '8px',
              border: '1.5px solid #cbd5e1',
              fontSize: '14px',
              fontWeight: 500,
              cursor: 'pointer',
            }}
          >
            Return Home
          </button>
        </div>
      </div>
    </div>
  );
}

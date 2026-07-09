import { useEffect, useRef } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import { storeOfferToken, setActiveOfferFlow } from '../utils/discountOffer';
import { navigateToTop25Confirm } from '../utils/top25FunnelNav';
import type { ListingTier } from '../config/stripe';
import { hasSmartRoutingContext, getSmartRoutingContext } from '../utils/smartRoutingContext';
import { formatStateName } from '../utils/formatLocation';
import { useNoindex } from '../components/NoindexMeta';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export default function Top25UpgradeLandingPage() {
  useNoindex();
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const { setCheckoutData } = useTop25Checkout();
  const smartRoutingEventFiredRef = useRef(false);

  useEffect(() => {
    try {
      const stateSlug = searchParams.get('state') || '';
      const stateName = searchParams.get('stateName') || (stateSlug ? formatStateName(stateSlug) : '');
      const rankRaw = searchParams.get('rank');
      const tier = (searchParams.get('tier') || 'standard') as ListingTier;
      const agencyName = searchParams.get('agencyName') || '';
      const agencyId = searchParams.get('agencyId') || undefined;
      const slotId = searchParams.get('slotId') || undefined;
      const creditRaw = searchParams.get('credit');
      const extraDiscountRaw = searchParams.get('extra_discount');
      const token = searchParams.get('token') || '';
      const offerId = searchParams.get('offer_id') || undefined;
      const logoUrl = searchParams.get('logoUrl') || undefined;

      if (!stateSlug || !agencyName) {
        navigate('/', { replace: true });
        return;
      }

      // Fire smart routing tracking if context present
      if (!smartRoutingEventFiredRef.current && hasSmartRoutingContext(searchParams)) {
        const smartContext = getSmartRoutingContext(searchParams);
        if (smartContext.aid && smartContext.lid) {
          smartRoutingEventFiredRef.current = true;
          fetch(`${SUPABASE_URL}/functions/v1/smart-routing-track-event`, {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
            },
            body: JSON.stringify({
              agency_id: smartContext.aid,
              lead_key: smartContext.lid,
              event_type: "top25_upgrade_offer_viewed",
              metadata: {
                state_slug: stateSlug,
                agency_name: agencyName,
                rank: rankRaw,
                tier,
                offer_id: offerId,
              },
            }),
          }).catch((err) => {
            console.error("[Top25UpgradeLandingPage] Smart routing tracking error:", err);
          });
        }
      }

      if (token) {
        storeOfferToken(token);
        setActiveOfferFlow(token, 'top25_landing');
      }

      navigateToTop25Confirm(navigate, setCheckoutData, {
        stateSlug,
        stateName,
        selectedRank: rankRaw ? parseInt(rankRaw, 10) : null,
        listingTier: tier,
        listingType: 'top25_upgrade',
        agencyName,
        agencyWebsite: '',
        agencyDescription: '',
        agencyServices: [],
        agencyId,
        top25SlotId: slotId,
        logoUrl,
        creditCents: creditRaw ? Math.round(parseFloat(creditRaw)) : 9700,
        extraDiscountCents: extraDiscountRaw ? Math.round(parseFloat(extraDiscountRaw)) : undefined,
        upgradeOfferId: offerId,
      });
    } catch (err) {
      console.warn('[Top25UpgradeLandingPage] Error reading params, redirecting home', err);
      navigate('/', { replace: true });
    }
  }, []);

  return (
    <div style={{
      minHeight: '100vh',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      backgroundColor: '#f8fafc',
      gap: '16px',
    }}>
      <div style={{
        width: '40px',
        height: '40px',
        border: '4px solid #e2e8f0',
        borderTopColor: '#3b82f6',
        borderRadius: '50%',
        animation: 'spin 0.8s linear infinite',
      }} />
      <p style={{ fontSize: '14px', color: '#64748b' }}>Preparing your upgrade offer...</p>
      <style>{`@keyframes spin { to { transform: rotate(360deg); } }`}</style>
    </div>
  );
}

import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { MapPin } from 'lucide-react';
import ServicesBadges from '../components/ServicesBadges';
import { getAvailableTop25SlotsForState, type Top25Slot } from '../lib/top25Slots';
import { AlertTriangle } from 'lucide-react';
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import type { ListingTier } from '../config/stripe';
import { getListingProductByTier } from '../config/stripe';
import { navigateToTop25Confirm } from '../utils/top25FunnelNav';

interface SubmittedAgency {
  agencyName: string;
  contactPerson: string;
  email: string;
  websiteUrl: string;
  description: string;
  services: string[];
  budgetRange?: string;
  state: string;
  logoUrl?: string;
}

interface SubmitAgencyOfferPageProps {
  submittedAgency: SubmittedAgency;
  stateSlug: string;
  onClaimSpot: (spotNumber: number) => void;
}

export default function SubmitAgencyOfferPage({
  submittedAgency,
  stateSlug,
  onClaimSpot
}: SubmitAgencyOfferPageProps) {
  const navigate = useNavigate();
  const { setCheckoutData } = useTop25Checkout();
  const stateName = submittedAgency.state;
  const isMobile = typeof window !== 'undefined' && window.innerWidth < 768;
  const [availableSlots, setAvailableSlots] = useState<Top25Slot[]>([]);
  const [isLoadingSlots, setIsLoadingSlots] = useState(true);
  const [fetchError, setFetchError] = useState<string | null>(null);

  useEffect(() => {
    window.scrollTo({
      top: 0,
      left: 0,
      behavior: "instant"
    });
    setTimeout(() => {
      window.scrollTo(0, 0);
    }, 50);
  }, []);

  useEffect(() => {
    document.title = `Claim Your Top 25 ${stateName} Spot | Gappsy`;
  }, [stateName]);

  useEffect(() => {
    async function loadAvailableSlots() {
      setIsLoadingSlots(true);
      setFetchError(null);
      const result = await getAvailableTop25SlotsForState(stateSlug);
      if (result.fetchFailed) {
        setFetchError(result.error ?? 'Could not load available spots');
        setAvailableSlots([]);
      } else {
        setAvailableSlots(result.slots);
      }
      setIsLoadingSlots(false);
    }

    loadAvailableSlots();
  }, [stateSlug]);

  // Select two slots: best available + one ~10 ranks lower
  const getSelectedSlots = (): Top25Slot[] => {
    if (availableSlots.length === 0) return [];
    if (availableSlots.length === 1) return [availableSlots[0]];

    const higherRankSlot = availableSlots[0];
    const targetRank = higherRankSlot.rank + 10;

    // Find the slot closest to targetRank that is >= targetRank
    let lowerRankSlot = availableSlots.find(slot => slot.rank >= targetRank);

    // If no slot at or above targetRank, fallback to the last available slot
    if (!lowerRankSlot) {
      lowerRankSlot = availableSlots[availableSlots.length - 1];
    }

    return [higherRankSlot, lowerRankSlot];
  };

  const selectedSlots = getSelectedSlots();

  // Helper to determine tier and price for a given spot.
  // Position-based: left card (index 0) = premium, right card (index 1) = priority.
  const getTierAndPriceForSpot = (spotNumber: number): { tier: ListingTier; price: number } => {
    const index = selectedSlots.findIndex(s => s.rank === spotNumber);
    const tier: ListingTier = index === 0 || index === -1 ? 'premium' : 'priority';

    const product = getListingProductByTier(tier);

    // If product is null (misconfigured), fallback to a default price
    // This prevents the app from crashing - the user can still see the UI
    if (!product) {
      console.error(`[SubmitAgencyOffer] Missing product for tier: ${tier}`);
      return { tier, price: 0 };
    }

    return { tier, price: product.amount };
  };

  const handleClaimSpot = (spotNumber: number) => {
    const { tier: listingTier } = getTierAndPriceForSpot(spotNumber);

    navigateToTop25Confirm(navigate, setCheckoutData, {
      stateSlug,
      stateName,
      selectedRank: spotNumber,
      listingTier,
      listingType: 'top25',
      agencyName: submittedAgency.agencyName,
      agencyWebsite: submittedAgency.websiteUrl,
      agencyDescription: submittedAgency.description,
      agencyServices: submittedAgency.services,
      logoUrl: submittedAgency.logoUrl,
    });
  };

  const renderAgencyCard = (spotNumber: number) => {
    const { price } = getTierAndPriceForSpot(spotNumber);

    return (
      <div
        className="agency-card"
        data-rank={spotNumber}
        style={{
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'space-between',
          height: '100%',
          padding: isMobile ? '12px 12px 14px' : '16px',
          borderRadius: '10px',
          backgroundColor: '#ffffff',
          boxShadow: '0 4px 12px rgba(15, 23, 42, 0.08)',
          border: '1px solid #e2e8f0',
          transition: 'transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease',
          position: 'relative',
          overflow: 'hidden'
        }}
      >
        <div
          style={{
            content: '',
            position: 'absolute',
            left: 0,
            right: 0,
            top: 0,
            height: '2px',
            borderRadius: '10px 10px 0 0',
            background:
              spotNumber === selectedSlots[0]?.rank
                ? '#FFAE00'
                : '#4F46E5'
          }}
        />

        <div style={{ marginBottom: isMobile ? '6px' : '10px' }}>
          <div
            style={{
              display: 'flex',
              alignItems: 'flex-start',
              gap: '10px',
              marginTop: '0px'
            }}
          >
            <div
              style={{
                minWidth: '28px',
                height: '28px',
                borderRadius: '7px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                fontWeight: 700,
                fontSize: '12px',
                color: '#ffffff',
                background:
                  spotNumber === selectedSlots[0]?.rank
                    ? '#FFAE00'
                    : '#4F46E5',
                boxShadow:
                  spotNumber === selectedSlots[0]?.rank
                    ? '0 2px 6px rgba(255, 174, 0, 0.3)'
                    : '0 2px 6px rgba(74, 92, 255, 0.3)',
                flexShrink: 0
              }}
            >
              {spotNumber}
            </div>

            <div style={{ flex: 1 }}>
              <h3
                style={{
                  fontSize: '16px',
                  fontWeight: 600,
                  color: '#0F172A',
                  margin: 0,
                  lineHeight: 1.3,
                  marginBottom: '4px'
                }}
              >
                {submittedAgency.agencyName}
              </h3>

              <div
                style={{
                  display: 'inline-flex',
                  alignItems: 'center',
                  gap: '5px',
                  fontSize: '13px',
                  margin: 0,
                  lineHeight: 1.4
                }}
              >
                <MapPin size={15} style={{ flexShrink: 0, color: '#A5B4FC' }} />
                <span style={{ color: '#4B5563' }}>{stateName}</span>
              </div>
            </div>
          </div>
        </div>

        <div
          style={{
            flex: 1,
            display: 'flex',
            flexDirection: 'column',
            gap: '6px'
          }}
        >

          <p
            style={{
              fontSize: '13px',
              lineHeight: 1.6,
              color: '#475569',
              margin: isMobile ? '0px 0 0 0' : '8px 0 0 0'
            }}
          >
            {submittedAgency.description}
          </p>

          {submittedAgency.services.length > 0 && (
            <div style={{ marginTop: isMobile ? '4px' : '8px' }}>
              <ServicesBadges
                services={submittedAgency.services}
                containerStyle={{ gap: '4px' }}
                badgeStyle={{
                  fontSize: '10px',
                  fontWeight: 600,
                  color: '#475569',
                  backgroundColor: '#f1f5f9',
                  padding: '3px 7px',
                  borderRadius: '4px',
                  border: '1px solid #e2e8f0'
                }}
              />
            </div>
          )}

          {submittedAgency.budgetRange && (
            <p
              style={{
                fontSize: '11px',
                color: '#64748b',
                margin: isMobile ? '3px 0 0 0' : '6px 0 0 0',
                lineHeight: 1.4
              }}
            >
              Typical budget: {submittedAgency.budgetRange}
            </p>
          )}
        </div>

        <div style={{ marginTop: isMobile ? '10px' : '12px' }}>
          <button
            onClick={() => handleClaimSpot(spotNumber)}
            style={{
              width: '100%',
              backgroundColor:
                spotNumber === selectedSlots[0]?.rank ? '#FFAE00' : '#4F46E5',
              color: '#FFFFFF',
              padding: isMobile ? '10px 16px' : '10px 16px',
              borderRadius: '7px',
              fontWeight: 600,
              fontSize: '13px',
              border: 'none',
              cursor: 'pointer',
              transition: 'background-color 0.2s ease',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              gap: '6px',
              boxShadow:
                spotNumber === selectedSlots[0]?.rank
                  ? '0 2px 6px rgba(255, 174, 0, 0.35)'
                  : 'none'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.backgroundColor =
                spotNumber === selectedSlots[0]?.rank ? '#E59E00' : '#4338CA';
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.backgroundColor =
                spotNumber === selectedSlots[0]?.rank ? '#FFAE00' : '#4F46E5';
            }}
          >
            Claim this spot — ${price} every 6 months — cancel anytime
          </button>
        </div>
      </div>
    );
  };

  return (
    <div
      className="funnelBackground"
      style={{
        padding: isMobile ? '16px 16px 20px' : '48px 24px'
      }}
    >
      <div style={{ maxWidth: '1200px', margin: '0 auto' }}>
        <div style={{ textAlign: 'center', marginBottom: isMobile ? '12px' : '48px', maxWidth: '800px', margin: isMobile ? '0 auto 12px' : '0 auto 48px' }}>
          {!isMobile && (
            <div style={{ marginBottom: '16px' }}>
              <span style={{
                display: 'inline-block',
                backgroundColor: '#4F46E5',
                color: '#ffffff',
                fontSize: '11px',
                fontWeight: 600,
                padding: '6px 14px',
                borderRadius: '6px',
                textTransform: 'uppercase',
                letterSpacing: '0.5px'
              }}>
                Limited Availability
              </span>
            </div>
          )}

          <h1
            className="font-bold"
            style={{
              color: '#0f172a',
              textAlign: 'center',
              maxWidth: isMobile ? '260px' : '700px',
              marginLeft: 'auto',
              marginRight: 'auto',
              lineHeight: isMobile ? 1.3 : 1.35,
              fontSize: isMobile ? '20px' : '28px',
              marginTop: isMobile ? '0px' : '16px',
              marginBottom: isMobile ? '6px' : '16px'
            }}
          >
            {isMobile
              ? `We Can List ${submittedAgency.agencyName} in ${stateName}'s Top 25`
              : `We Can List ${submittedAgency.agencyName} in ${stateName}'s Top 25`}
          </h1>

          <p
            style={{
              fontSize: isMobile ? '14px' : '18px',
              color: '#475569',
              lineHeight: isMobile ? 1.45 : 1.7,
              marginTop: isMobile ? '0px' : '12px',
              marginBottom: isMobile ? '6px' : '12px',
              maxWidth: '640px',
              marginLeft: 'auto',
              marginRight: 'auto',
              textAlign: 'center'
            }}
          >
            {isLoadingSlots ? (
              'Loading available spots...'
            ) : selectedSlots.length >= 2 ? (
              <>Two ranking spots — #{selectedSlots[0].rank} and #{selectedSlots[1].rank} — are available. Claim a spot to start attracting new {stateName} clients immediately.</>
            ) : selectedSlots.length === 1 ? (
              <>One ranking spot — #{selectedSlots[0].rank} — is available. Claim this spot to start attracting new {stateName} clients immediately.</>
            ) : (
              'No available spots at the moment. Please check back later.'
            )}
          </p>

          <p
            style={{
              fontSize: isMobile ? '14px' : '18px',
              color: '#475569',
              lineHeight: isMobile ? 1.45 : 1.7,
              marginBottom: isMobile ? '0px' : '20px',
              maxWidth: '640px',
              marginLeft: 'auto',
              marginRight: 'auto',
              textAlign: 'center'
            }}
          >
            This listing renews <strong style={{ fontWeight: 600 }}>every 6 months</strong> — long enough for your agency to attract new {stateName} clients and deliver results that far exceed the cost of the listing.
          </p>
        </div>

        <div
          style={{
            display: 'grid',
            gridTemplateColumns: isMobile ? '1fr' : 'repeat(auto-fit, minmax(280px, 1fr))',
            gap: isMobile ? '10px' : '24px',
            maxWidth: isMobile ? '100%' : '900px',
            margin: isMobile ? '10px auto 0' : '24px auto 0'
          }}
          className="submit-agency-cards"
        >
          {isLoadingSlots ? (
            <div style={{
              textAlign: 'center',
              padding: '40px',
              gridColumn: '1 / -1',
              color: '#475569'
            }}>
              Loading available spots...
            </div>
          ) : fetchError ? (
            <div style={{
              gridColumn: '1 / -1',
              padding: '20px 24px',
              backgroundColor: '#fff7ed',
              border: '1px solid #fed7aa',
              borderRadius: '10px',
              display: 'flex',
              alignItems: 'flex-start',
              gap: '12px'
            }}>
              <AlertTriangle size={20} style={{ color: '#ea580c', flexShrink: 0, marginTop: '2px' }} />
              <div>
                <p style={{ fontWeight: 600, color: '#9a3412', margin: '0 0 4px 0', fontSize: '15px' }}>
                  Listing spots loading
                </p>
                <p style={{ color: '#c2410c', margin: 0, fontSize: '13px', lineHeight: 1.5 }}>
                  We could not load available listing spots. Please refresh the page or contact us directly to secure your spot.
                </p>
              </div>
            </div>
          ) : selectedSlots.length === 0 ? (
            <div style={{
              textAlign: 'center',
              padding: '40px',
              gridColumn: '1 / -1',
              color: '#475569'
            }}>
              No available spots at the moment. Please check back later.
            </div>
          ) : (
            selectedSlots.map((slot) => renderAgencyCard(slot.rank))
          )}
        </div>

        {/* DEBUG SECTION - Remove before production */}
        {import.meta.env.DEV && (
          <div style={{
            marginTop: '40px',
            padding: '20px',
            backgroundColor: '#f8f9fa',
            border: '2px solid #e9ecef',
            borderRadius: '8px',
            maxWidth: '800px',
            marginLeft: 'auto',
            marginRight: 'auto'
          }}>
            <h3 style={{ margin: '0 0 16px 0', fontSize: '16px', fontWeight: 600, color: '#212529' }}>
              🐛 DEBUG INFO (Development Only)
            </h3>
            <pre style={{
              backgroundColor: '#fff',
              padding: '12px',
              borderRadius: '4px',
              fontSize: '12px',
              lineHeight: 1.5,
              overflow: 'auto',
              margin: 0
            }}>
{`State Slug: "${stateSlug}"
Loading: ${isLoadingSlots}
Available Slots Found: ${availableSlots.length}
Available Ranks: [${availableSlots.map(s => s.rank).join(', ')}]
Selected Slots: [${selectedSlots.map(s => s.rank).join(', ')}]

Environment Check:
- VITE_SUPABASE_URL: ${import.meta.env.VITE_SUPABASE_URL ? '✅ SET' : '❌ MISSING'}
- VITE_SUPABASE_ANON_KEY: ${import.meta.env.VITE_SUPABASE_ANON_KEY ? '✅ SET' : '❌ MISSING'}

Full Available Slots Data:
${JSON.stringify(availableSlots, null, 2)}`}
            </pre>
          </div>
        )}
      </div>
    </div>
  );
}

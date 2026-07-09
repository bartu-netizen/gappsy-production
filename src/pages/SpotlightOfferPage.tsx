import React, { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { MapPin } from 'lucide-react';
import ServicesBadges from '../components/ServicesBadges';
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import { getSpotlightPlacementProduct } from '../config/stripe';

interface SpotlightFormData {
  agencyName: string;
  contactPerson: string;
  email: string;
  websiteUrl: string;
  description: string;
  services: string[];
  budgetRange: string;
  state: string;
  stateSlug: string;
}

interface SpotlightOfferPageProps {
  formData: SpotlightFormData;
  onProceed?: () => void;
}

export default function SpotlightOfferPage({
  formData,
  onProceed
}: SpotlightOfferPageProps) {
  const navigate = useNavigate();
  const { setCheckoutData } = useTop25Checkout();
  const stateName = formData.state;
  const stateSlug = formData.stateSlug;
  const isMobile = typeof window !== 'undefined' && window.innerWidth < 768;

  console.log('🔵 SpotlightOfferPage state context:', { stateName, stateSlug });

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

  const handleClaimSpotlight = () => {
    const spotlightProduct = getSpotlightPlacementProduct();

    if (!spotlightProduct) {
      alert('Spotlight product is not configured. Please contact support.');
      return;
    }

    setCheckoutData({
      stateSlug: stateSlug,
      stateName: stateName,
      selectedRank: 0,
      listingTier: 'spotlight',
      listingType: 'spotlight',
      agencyName: formData.agencyName,
      agencyWebsite: formData.websiteUrl,
      agencyDescription: formData.description,
      agencyServices: formData.services
    });

    navigate('/spotlight/confirm');
  };

  useEffect(() => {
    document.title = `Your Spotlight Preview | Gappsy`;
  }, []);

  return (
    <div
      className="funnelBackground"
      style={{ padding: isMobile ? '16px 16px 32px' : '48px 24px' }}
    >
      <div style={{ maxWidth: '1200px', margin: '0 auto' }}>
        <div style={{ textAlign: 'center', maxWidth: '700px', margin: isMobile ? '0 auto 20px' : '0 auto 48px' }}>
          <h1
            style={{
              fontSize: isMobile ? '18px' : '22px',
              fontWeight: 600,
              color: '#0f172a',
              marginBottom: isMobile ? '8px' : '12px',
              lineHeight: 1.3
            }}
          >
            ⭐ Your Spotlight Listing Is Ready
          </h1>

          <p
            style={{
              fontSize: isMobile ? '13px' : '14px',
              color: '#475569',
              lineHeight: 1.5,
              marginBottom: isMobile ? '12px' : '16px'
            }}
          >
            Your Spotlight placement puts {formData.agencyName} above the Top 25 rankings in {stateName}, ensuring your agency is seen first by businesses ready to hire.
          </p>

          <p
            style={{
              fontSize: isMobile ? '13px' : '14px',
              color: '#475569',
              lineHeight: 1.5,
              marginBottom: isMobile ? '16px' : '24px'
            }}
          >
            This placement renews every 6 months — long enough for your agency to attract new {stateName} clients and deliver results that meaningfully exceed the cost of the listing.
          </p>
        </div>

        <div
          style={{
            maxWidth: '420px',
            margin: '0 auto'
          }}
        >
          <div
            className="spotlight-preview-card"
            style={{
              display: 'flex',
              flexDirection: 'column',
              padding: isMobile ? '14px' : '20px',
              borderRadius: '12px',
              backgroundColor: '#ffffff',
              boxShadow: '0 4px 12px rgba(15, 23, 42, 0.08)',
              border: '1px solid #e2e8f0',
              position: 'relative',
              overflow: 'hidden'
            }}
          >
            <div
              style={{
                position: 'absolute',
                left: 0,
                right: 0,
                top: 0,
                height: '3px',
                borderRadius: '12px 12px 0 0',
                background: '#4F46E5'
              }}
            />

            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: isMobile ? '8px' : '12px' }}>
              <div style={{ flex: 1 }}>
                <h3
                  style={{
                    fontSize: isMobile ? '16px' : '18px',
                    fontWeight: 600,
                    color: '#0F172A',
                    margin: 0,
                    lineHeight: 1.3,
                    marginBottom: isMobile ? '4px' : '6px'
                  }}
                >
                  {formData.agencyName}
                </h3>

                <div
                  style={{
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '5px',
                    fontSize: isMobile ? '12px' : '13px',
                    margin: 0,
                    lineHeight: 1.4
                  }}
                >
                  <MapPin size={isMobile ? 13 : 15} style={{ flexShrink: 0, color: '#A5B4FC' }} />
                  <span style={{ color: '#4B5563' }}>{stateName}</span>
                </div>
              </div>

              <div
                style={{
                  display: 'inline-block',
                  backgroundColor: '#EFF6FF',
                  color: '#4F46E5',
                  fontSize: isMobile ? '9px' : '11px',
                  fontWeight: 600,
                  padding: isMobile ? '4px 8px' : '6px 12px',
                  borderRadius: '6px',
                  textTransform: 'uppercase',
                  letterSpacing: '0.5px',
                  flexShrink: 0,
                  marginLeft: isMobile ? '8px' : '12px'
                }}
              >
                Top Rated
              </div>
            </div>

            <p
              style={{
                fontSize: isMobile ? '13px' : '14px',
                lineHeight: 1.5,
                color: '#475569',
                margin: isMobile ? '8px 0' : '12px 0'
              }}
            >
              {formData.description}
            </p>

            {formData.services.length > 0 && (
              <div style={{ marginTop: isMobile ? '8px' : '12px', marginBottom: isMobile ? '10px' : '16px' }}>
                <ServicesBadges
                  services={formData.services}
                  containerStyle={{ gap: isMobile ? '4px' : '6px' }}
                  badgeStyle={{
                    fontSize: isMobile ? '10px' : '11px',
                    fontWeight: 600,
                    color: '#475569',
                    backgroundColor: '#f1f5f9',
                    padding: isMobile ? '3px 8px' : '4px 10px',
                    borderRadius: '6px',
                    border: '1px solid #e2e8f0'
                  }}
                />
              </div>
            )}

            <div style={{ marginTop: isMobile ? '12px' : '20px', paddingTop: isMobile ? '10px' : '16px', borderTop: '1px solid #e2e8f0' }}>
              <button
                type="button"
                onClick={handleClaimSpotlight}
                style={{
                  width: '100%',
                  backgroundColor: '#4F46E5',
                  color: '#ffffff',
                  padding: isMobile ? '10px 16px' : '12px 24px',
                  borderRadius: '8px',
                  fontWeight: 600,
                  fontSize: isMobile ? '13px' : '14px',
                  border: 'none',
                  cursor: 'pointer',
                  transition: 'background-color 0.2s ease',
                  whiteSpace: 'normal',
                  lineHeight: 1.4,
                  boxShadow: '0 2px 8px rgba(79, 70, 229, 0.2)'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.backgroundColor = '#4338CA';
                  e.currentTarget.style.transform = 'translateY(-1px)';
                  e.currentTarget.style.boxShadow = '0 4px 12px rgba(79, 70, 229, 0.3)';
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.backgroundColor = '#4F46E5';
                  e.currentTarget.style.transform = 'translateY(0)';
                  e.currentTarget.style.boxShadow = '0 2px 8px rgba(58, 90, 254, 0.2)';
                }}
              >
                Claim Spotlight — $997 every 6 months — cancel anytime
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

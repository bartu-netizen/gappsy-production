import { useEffect, useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import { getSpotlightPlacementProduct } from '../config/stripe';

export default function SpotlightSubmitPage() {
  const navigate = useNavigate();
  const location = useLocation();
  const { setCheckoutData } = useTop25Checkout();
  const isMobile = typeof window !== 'undefined' && window.innerWidth < 768;

  // Get state context from navigation
  const { stateName = '', stateSlug = '' } =
    (location.state as any) || {};

  const prefilledData = location.state as any;

  console.log('🔵 Spotlight state context:', { stateName, stateSlug });

  const [agencyName, setAgencyName] = useState(prefilledData?.agencyName || '');
  const [contactPerson, setContactPerson] = useState(prefilledData?.contactPerson || '');
  const [email, setEmail] = useState(prefilledData?.email || '');
  const [websiteUrl, setWebsiteUrl] = useState(prefilledData?.websiteUrl || '');
  const [description, setDescription] = useState(prefilledData?.description || '');
  const [services, setServices] = useState<string[]>(prefilledData?.services || []);

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
    document.title = `Apply for Spotlight Placement – ${stateName} Marketing Agencies | Gappsy`;
  }, [stateName]);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

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
      agencyName: agencyName,
      agencyWebsite: websiteUrl,
      agencyDescription: description,
      agencyServices: services
    });

    navigate('/spotlight/confirm');
  };

  return (
    <div
      className="funnelBackground"
      style={{
        padding: isMobile ? '20px 16px 40px' : '40px 24px 60px'
      }}
    >
      <div style={{ maxWidth: isMobile ? '100%' : '600px', margin: '0 auto' }}>
        <h1 style={{
          fontSize: isMobile ? '22px' : '28px',
          fontWeight: 700,
          color: '#0f172a',
          lineHeight: 1.3,
          marginBottom: isMobile ? '12px' : '16px',
          textAlign: 'center'
        }}>
          Apply for a Spotlight Placement in {stateName}
        </h1>

        <p style={{
          fontSize: isMobile ? '14px' : '16px',
          color: '#475569',
          lineHeight: 1.6,
          textAlign: 'center',
          maxWidth: '540px',
          margin: '0 auto',
          marginBottom: isMobile ? '24px' : '32px'
        }}>
          We can feature your agency in a premium Spotlight section on our {stateName} page.
          Fill out your details below and, if approved, you'll be offered a 6-month Spotlight Placement.
        </p>

        <form onSubmit={handleSubmit} style={{
          backgroundColor: '#ffffff',
          borderRadius: '12px',
          padding: isMobile ? '20px' : '32px',
          boxShadow: '0 4px 16px rgba(15, 23, 42, 0.08)',
          border: '1px solid #e2e8f0'
        }}>
          <div style={{ marginBottom: '20px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: 600,
              color: '#0f172a',
              marginBottom: '8px'
            }}>
              Agency Name *
            </label>
            <input
              type="text"
              required
              value={agencyName}
              onChange={(e) => setAgencyName(e.target.value)}
              style={{
                width: '100%',
                padding: '12px 14px',
                fontSize: '15px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                boxSizing: 'border-box'
              }}
              placeholder="Your Agency Name"
            />
          </div>

          <div style={{ marginBottom: '20px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: 600,
              color: '#0f172a',
              marginBottom: '8px'
            }}>
              Contact Person *
            </label>
            <input
              type="text"
              required
              value={contactPerson}
              onChange={(e) => setContactPerson(e.target.value)}
              style={{
                width: '100%',
                padding: '12px 14px',
                fontSize: '15px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                boxSizing: 'border-box'
              }}
              placeholder="Your Full Name"
            />
          </div>

          <div style={{ marginBottom: '20px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: 600,
              color: '#0f172a',
              marginBottom: '8px'
            }}>
              Email *
            </label>
            <input
              type="email"
              required
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              style={{
                width: '100%',
                padding: '12px 14px',
                fontSize: '15px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                boxSizing: 'border-box'
              }}
              placeholder="your@email.com"
            />
          </div>

          <div style={{ marginBottom: '20px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: 600,
              color: '#0f172a',
              marginBottom: '8px'
            }}>
              Website URL *
            </label>
            <input
              type="url"
              required
              value={websiteUrl}
              onChange={(e) => setWebsiteUrl(e.target.value)}
              style={{
                width: '100%',
                padding: '12px 14px',
                fontSize: '15px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                boxSizing: 'border-box'
              }}
              placeholder="https://youragency.com"
            />
          </div>

          <div style={{ marginBottom: '20px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: 600,
              color: '#0f172a',
              marginBottom: '8px'
            }}>
              Agency Description *
            </label>
            <textarea
              required
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              rows={4}
              style={{
                width: '100%',
                padding: '12px 14px',
                fontSize: '15px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                boxSizing: 'border-box',
                resize: 'vertical',
                fontFamily: 'inherit'
              }}
              placeholder="Brief description of your agency and services..."
            />
          </div>

          <button
            type="submit"
            style={{
              width: '100%',
              backgroundColor: '#4F46E5',
              color: '#FFFFFF',
              fontSize: isMobile ? '15px' : '16px',
              fontWeight: 600,
              padding: '14px 20px',
              borderRadius: '10px',
              border: 'none',
              cursor: 'pointer',
              boxShadow: '0 4px 14px rgba(79, 70, 229, 0.25)',
              transition: 'all 0.3s ease'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.backgroundColor = '#4338CA';
              e.currentTarget.style.transform = 'translateY(-1px)';
              e.currentTarget.style.boxShadow = '0 6px 20px rgba(79, 70, 229, 0.35)';
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.backgroundColor = '#4F46E5';
              e.currentTarget.style.transform = 'translateY(0)';
              e.currentTarget.style.boxShadow = '0 4px 14px rgba(58, 90, 254, 0.25)';
            }}
          >
            Submit Application
          </button>
        </form>
      </div>
    </div>
  );
}

import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

interface FeaturedAgency {
  rank: number;
  name: string;
  city: string;
  state: string;
  websiteUrl: string;
  shortDescription: string;
  logo?: {
    originalUrl?: string;
    localPath?: string;
    boltUrl?: string | null;
  };
}

function getAgencyLogoUrl(agency: FeaturedAgency): string {
  if (!agency.logo) {
    return '';
  }

  if (agency.logo.boltUrl) {
    return agency.logo.boltUrl;
  }

  if (agency.logo.originalUrl) {
    return agency.logo.originalUrl;
  }

  return '';
}

function getAgencyInitials(name: string): string {
  return name
    .split(' ')
    .map(word => word[0])
    .join('')
    .toUpperCase()
    .slice(0, 2);
}

// Same-size (32px), same-shape logo slot as the Recently Featured Tools
// rail right above this section — falls back to initials on a broken image
// (onError) or a missing logo URL, instead of leaving an empty box.
function AgencyLogo({ agency }: { agency: FeaturedAgency }) {
  const [failed, setFailed] = useState(false);
  const logoUrl = getAgencyLogoUrl(agency);
  const showImage = logoUrl && !failed;

  return (
    <div className="ad-card-logo flex-shrink-0 w-8 h-8 rounded-lg bg-[#EFF6FF] flex items-center justify-center overflow-hidden">
      {showImage ? (
        <img
          src={logoUrl}
          alt={agency.name}
          width={32}
          height={32}
          loading="lazy"
          decoding="async"
          className="w-8 h-8 object-contain"
          onError={() => setFailed(true)}
        />
      ) : (
        <span className="text-[11px] font-semibold text-[#3B82F6]">{getAgencyInitials(agency.name)}</span>
      )}
    </div>
  );
}

interface RecentFeaturedAgenciesProps {
  isMobile?: boolean;
}

export function RecentFeaturedAgencies({ isMobile = false }: RecentFeaturedAgenciesProps) {
  const [agencies, setAgencies] = useState<FeaturedAgency[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadAgencies = async () => {
      try {
        const response = await fetch('/data/new-jersey.json');
        const data = await response.json();

        const featured = (data.agencies || []).slice(0, 4).map((agency: FeaturedAgency) => ({
          rank: agency.rank,
          name: agency.name,
          city: agency.city,
          state: agency.state,
          websiteUrl: agency.websiteUrl,
          shortDescription: agency.shortDescription,
          logo: agency.logo
        }));

        setAgencies(featured);
      } catch (error) {
        console.error('Failed to load featured agencies:', error);
      } finally {
        setLoading(false);
      }
    };

    loadAgencies();
  }, []);

  if (loading || agencies.length === 0) {
    return null;
  }

  if (isMobile) {
    return (
      <section className="mb-5">
        <div className="flex items-center justify-between mb-1.5">
          <h2 className="font-bold text-[#0B1221] leading-tight" style={{ fontSize: '14.04px' }}>
            Recently Featured Agencies
          </h2>
          <span className="text-gray-500 flex items-center gap-1 leading-tight" style={{ fontSize: '10.92px' }}>
            Swipe to explore →
          </span>
        </div>
        <div
          className="-mx-4 overflow-x-auto overflow-y-hidden snap-x snap-mandatory scroll-smooth scrollbar-hide"
          style={{ scrollPaddingLeft: 16, scrollPaddingRight: 16 }}
        >
          <div className="flex gap-4 px-4 pb-2">
            {agencies.map((agency) => {
              const hasWebsite = !!agency.websiteUrl;

              return (
                <a
                  key={agency.rank}
                  href={hasWebsite ? agency.websiteUrl : '#'}
                  target={hasWebsite ? '_blank' : undefined}
                  rel={hasWebsite ? 'noopener noreferrer' : undefined}
                  className="agency-card bg-white rounded-[14px] p-3 border border-[#eef0f3] hover:shadow-md transition-shadow flex items-center gap-2.5 flex-shrink-0 w-[230px] min-w-[230px] max-w-[230px] snap-start relative"
                  style={{ textDecoration: 'none' }}
                  onClick={hasWebsite ? undefined : (e) => e.preventDefault()}
                >
                  <span className="card-click-arrow">→</span>
                  <AgencyLogo agency={agency} />
                  <div className="flex-1 min-w-0">
                    <h3 className="text-xs font-bold text-gray-800 leading-tight truncate">{agency.name}</h3>
                    <p className="text-[10.5px] text-slate-400 leading-tight mb-0.5">New Jersey</p>
                    <p className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">{agency.shortDescription}</p>
                  </div>
                </a>
              );
            })}
          </div>
        </div>
      </section>
    );
  }

  return (
    <section className="recent-agencies mb-10" style={{ maxWidth: '1300px', margin: '40px auto', padding: '0 20px' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: '14px' }}>
        <h2 style={{ fontSize: '18px', fontWeight: '600', color: '#0A0F1B', margin: 0 }}>
          Recently Featured Agencies
        </h2>
        <Link
          to="/marketing-agencies/usa"
          style={{
            fontSize: '12px',
            fontWeight: '500',
            color: '#94A3B8',
            textDecoration: 'none',
            display: 'flex',
            alignItems: 'center',
            gap: '4px'
          }}
          onMouseOver={(e) => e.currentTarget.style.color = '#64748B'}
          onMouseOut={(e) => e.currentTarget.style.color = '#94A3B8'}
        >
          View all →
        </Link>
      </div>

      <div
        className="horizontal-scroll-container"
        style={{
          display: 'flex',
          gap: '20px',
          overflowX: 'auto',
          scrollBehavior: 'smooth',
          paddingBottom: '10px',
          scrollbarWidth: 'thin',
          scrollbarColor: '#E5E7EB #F9FAFB'
        }}
      >
        {agencies.map((agency) => {
          const hasWebsite = !!agency.websiteUrl;

          return (
            <a
              key={agency.rank}
              href={hasWebsite ? agency.websiteUrl : '#'}
              target={hasWebsite ? '_blank' : undefined}
              rel={hasWebsite ? 'noopener noreferrer' : undefined}
              className="agency-card bg-white rounded-[14px] border border-[#eef0f3] hover:shadow-md transition-shadow p-3 flex items-center gap-2.5 relative"
              style={{
                flex: '0 0 240px',
                textDecoration: 'none'
              }}
              onClick={hasWebsite ? undefined : (e) => e.preventDefault()}
            >
              <span className="card-click-arrow">→</span>
              <AgencyLogo agency={agency} />
              <div className="flex-1 min-w-0">
                <h3 className="text-xs font-bold text-gray-800 leading-tight truncate">{agency.name}</h3>
                <p className="text-[10.5px] text-slate-400 leading-tight mb-0.5">New Jersey</p>
                <p className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">{agency.shortDescription}</p>
              </div>
            </a>
          );
        })}
      </div>
    </section>
  );
}

import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { MapPin } from 'lucide-react';

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

interface RecentFeaturedAgenciesProps {
  isMobile?: boolean;
}

export function RecentFeaturedAgencies({ isMobile = false }: RecentFeaturedAgenciesProps) {
  const [agencies, setAgencies] = useState<FeaturedAgency[]>([]);
  const [loading, setLoading] = useState(true);

  const isDesktop = !isMobile;

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
              const logoUrl = getAgencyLogoUrl(agency);
              const initials = getAgencyInitials(agency.name);
              const hasWebsite = !!agency.websiteUrl;

              return (
                <a
                  key={agency.rank}
                  href={hasWebsite ? agency.websiteUrl : '#'}
                  target={hasWebsite ? '_blank' : undefined}
                  rel={hasWebsite ? 'noopener noreferrer' : undefined}
                  className="bg-white rounded-[14px] border border-[#eef0f3] hover:shadow-md transition-shadow p-3.5 flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
                  style={{ textDecoration: 'none' }}
                  onClick={hasWebsite ? undefined : (e) => e.preventDefault()}
                >
                  <span className="card-click-arrow">→</span>
                  <div className="agency-logo-wrapper-strict mb-2">
                    {logoUrl ? (
                      <img
                        src={logoUrl}
                        alt={agency.name}
                        className="agencyLogoImg"
                        loading="lazy"
                        decoding="async"
                        onError={(e) => {
                          (e.target as HTMLImageElement).style.display = 'none';
                        }}
                      />
                    ) : null}
                    {!logoUrl && (
                      <div
                        style={{
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center',
                          height: '24px',
                          width: '100%',
                          backgroundColor: '#EFF6FF',
                          borderRadius: '6px',
                          fontSize: '11px',
                          fontWeight: '600',
                          color: '#3B82F6'
                        }}
                      >
                        {initials}
                      </div>
                    )}
                  </div>
                  <h3 className="text-xs font-bold text-gray-800 leading-tight mb-1">{agency.name}</h3>
                  <p className="text-[11px] text-slate-500 leading-[1.35] flex items-center gap-1 mb-1">
                    <MapPin className="w-3.5 h-3.5 text-slate-400" /> New Jersey
                  </p>
                  <p className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">{agency.shortDescription}</p>
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
          to="/new-jersey"
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
          const logoUrl = getAgencyLogoUrl(agency);
          const initials = getAgencyInitials(agency.name);
          const hasWebsite = !!agency.websiteUrl;

          return (
            <a
              key={agency.rank}
              href={hasWebsite ? agency.websiteUrl : '#'}
              target={hasWebsite ? '_blank' : undefined}
              rel={hasWebsite ? 'noopener noreferrer' : undefined}
              className="agency-card bg-white rounded-[14px] border border-[#eef0f3] hover:shadow-md transition-shadow p-3"
              style={{
                flex: '0 0 210px',
                textDecoration: 'none',
                display: 'flex',
                flexDirection: 'column',
                gap: '2px',
                minHeight: '120px',
                position: 'relative'
              }}
              onClick={hasWebsite ? undefined : (e) => e.preventDefault()}
            >
              <span className="card-click-arrow">→</span>
              <div className="agency-logo-wrapper-strict">
                {logoUrl ? (
                  <img
                    src={logoUrl}
                    alt={agency.name}
                    className="agencyLogoImg"
                    loading="lazy"
                    decoding="async"
                    onError={(e) => {
                      (e.target as HTMLImageElement).style.display = 'none';
                    }}
                  />
                ) : null}
                {!logoUrl && (
                  <div
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      height: isDesktop ? '32px' : '24px',
                      width: '100%',
                      backgroundColor: '#EFF6FF',
                      borderRadius: '6px',
                      fontSize: isDesktop ? '13px' : '11px',
                      fontWeight: '600',
                      color: '#3B82F6'
                    }}
                  >
                    {initials}
                  </div>
                )}
              </div>
              <div style={{ flex: 1, display: 'flex', flexDirection: 'column', gap: '2px' }}>
                <h3 className="text-xs font-bold text-gray-800 leading-tight mb-0.5">{agency.name}</h3>
                <p className="text-[11px] text-slate-500 leading-[1.35] flex items-center gap-1">
                  <MapPin className="w-3.5 h-3.5 text-slate-400" /> New Jersey
                </p>
                <p className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">{agency.shortDescription}</p>
              </div>
            </a>
          );
        })}
      </div>
    </section>
  );
}

import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import FooterWrapper from '../components/FooterWrapper';
import MiniHeader from '../components/MiniHeader';

const globalRegions = [
  {
    name: 'United States',
    badge: 'USA',
    description: 'Discover top marketing agencies across all 50 states, from major metropolitan hubs to emerging regional markets.',
    path: '/marketing-agencies/usa'
  }
];

function MarketingAgenciesHub() {
  const [isIntroExpanded, setIsIntroExpanded] = useState(false);

  useEffect(() => {
    document.title = 'Marketing Agencies — Top Agency Rankings by Region';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Find the best marketing agencies worldwide. Browse curated rankings and discover top agencies by region and specialty.');
    }
  }, []);

  return (
    <div>
      <div className="pt-6 pb-2">
        <MiniHeader />
      </div>

      <section className="hero-section">
        <div className="hero-container">
          <div className="hero-dark-card">
            <div className="hero-left-content">
              <nav className="hero-breadcrumbs" aria-label="breadcrumb">
                <span className="font-semibold text-white">Marketing Agencies</span>
              </nav>

              <h1 className="hero-title">Top Marketing Agencies by Region</h1>

              {!isIntroExpanded && (
                <>
                  <p className="hero-intro-text hero-intro-desktop">
                    Explore curated rankings of top marketing agencies organized by region. Whether you're looking for local expertise or global reach, find the perfect agency partner for your business.{' '}
                    <button
                      className="hero-inline-read-more"
                      onClick={() => setIsIntroExpanded(true)}
                      aria-expanded={false}
                    >
                      Read more
                    </button>
                  </p>

                  <p className="hero-intro-text hero-intro-mobile">
                    Explore curated rankings of top marketing agencies…{' '}
                    <button
                      className="hero-inline-read-more"
                      onClick={() => setIsIntroExpanded(true)}
                      aria-expanded={false}
                    >
                      Read more
                    </button>
                  </p>
                </>
              )}

              {isIntroExpanded && (
                <div className="hero-expanded-content visible">
                  <p className="hero-intro-text">
                    Explore curated rankings of top marketing agencies organized by region. Whether you're looking for local expertise or global reach, find the perfect agency partner for your business. Our comprehensive directory features verified agencies with detailed profiles, specialties, and performance metrics to help you make informed decisions.
                  </p>
                  <button
                    className="hero-collapse-btn"
                    onClick={() => setIsIntroExpanded(false)}
                    aria-expanded={true}
                  >
                    Show less
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      </section>

      <section className="premium-regions-section">
        <div className="container">
          <div className="premium-regions-grid">
            {globalRegions.map((region, idx) => (
              <div key={idx} className="premium-region-card">
                <span className="region-badge">{region.badge}</span>
                <h3 className="premium-region-title">{region.name}</h3>
                <p className="premium-region-description">{region.description}</p>
                <div className="premium-state-chips">
                  <Link
                    to={region.path}
                    className="premium-state-chip"
                    title={`Top Marketing Agencies in ${region.name}`}
                  >
                    View {region.name} →
                  </Link>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      <FooterWrapper />
    </div>
  );
}

export default MarketingAgenciesHub;

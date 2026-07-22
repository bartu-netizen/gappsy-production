import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Top25Header from './components/Top25Header';
import Footer from './components/Footer';
import { getStatesByRegion, type StateRegion } from './lib/stateDatabase';

function USAHub() {
  const [isIntroExpanded, setIsIntroExpanded] = useState(false);
  const [stateRegions, setStateRegions] = useState<StateRegion[]>([]);

  useEffect(() => {
    async function loadRegions() {
      const regions = await getStatesByRegion();
      setStateRegions(regions);
    }
    loadRegions();
  }, []);

  useEffect(() => {
    document.title = 'Marketing Agencies in the United States — Top Agencies by State';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Explore the best marketing agencies across the United States. Browse curated Top 25 marketing agency rankings for every U.S. state.');
    }
  }, []);

  return (
    <div className="app">
      <Top25Header stateSlug="usa" type="default" />

      <section className="hero-section">
        <div className="hero-container">
          <div className="hero-dark-card">
            <div className="hero-left-content">
              <nav className="hero-breadcrumbs" aria-label="breadcrumb">
                <Link to="/marketing-agencies" className="hover:text-white transition-colors">Marketing Agencies</Link>
                <span>›</span>
                <span className="font-semibold text-white">United States</span>
              </nav>

              <h1 className="hero-title">Top Marketing Agencies in the United States</h1>

              {/* Collapsed state - show short intro */}
              {!isIntroExpanded && (
                <>
                  <p className="hero-intro-text hero-intro-desktop">
                    Discover the top marketing agencies across the United States. Browse curated Top 25 rankings for every U.S. state to evaluate regional strengths, compare specialties, and find the agency that best fits your goals.{' '}
                    <button
                      className="hero-inline-read-more"
                      onClick={() => setIsIntroExpanded(true)}
                      aria-expanded={false}
                    >
                      Read more
                    </button>
                  </p>

                  <p className="hero-intro-text hero-intro-mobile">
                    Discover the top marketing agencies across the United States…{' '}
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

              {/* Expanded state - show full text */}
              {isIntroExpanded && (
                <div className="hero-expanded-content visible">
                  <p className="hero-intro-text">
                    Discover the top marketing agencies across the United States. Browse curated Top 25 rankings for every U.S. state to evaluate regional strengths, compare specialties, and find the agency that best fits your goals. Whether you're looking for expertise in the Northeast, innovation in the West, or growth in the South and Midwest, find the perfect marketing partner for your business needs.
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
            {stateRegions.map((region, idx) => (
              <div key={idx} className="premium-region-card">
                <span className="region-badge">{region.badge}</span>
                <h3 className="premium-region-title">{region.name}</h3>
                <p className="premium-region-description">{region.description}</p>
                <div className="premium-state-chips">
                  {region.states.map((state, stateIdx) => (
                    <Link
                      key={stateIdx}
                      to={state.canonical_url}
                      className="premium-state-chip"
                      title={`Top 25 Marketing Agencies in ${state.state_name}, USA`}
                    >
                      {state.state_name}
                    </Link>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      <Footer />
    </div>
  );
}

export default USAHub;

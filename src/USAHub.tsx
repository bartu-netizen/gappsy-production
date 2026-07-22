import { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import Top25Header from './components/Top25Header';
import Footer from './components/Footer';
import SmartSearchBox from './components/search/SmartSearchBox';
import StatePickerModal from './components/StatePickerModal';
import FeaturedAgencyRail from './components/FeaturedAgencyRail';
import { getStatesByRegion, type StateRegion } from './lib/stateDatabase';

const AGENCY_STATE_EXAMPLE_QUERIES = [
  'Marketing agency in New Jersey',
  'Marketing agency in California',
  'Marketing agency in Texas',
];

function USAHub() {
  const navigate = useNavigate();
  const [isIntroExpanded, setIsIntroExpanded] = useState(false);
  const [stateRegions, setStateRegions] = useState<StateRegion[]>([]);
  // Top25Header's Find/List buttons dispatch these two global events on
  // every page (see Top25Header.tsx) — StatePageTemplate.tsx listens and
  // opens a state-scoped modal directly, but USAHub isn't scoped to one
  // state, so here they open a state picker first (same list US_STATES /
  // navigate pattern as GetListedPage.tsx's agency step) and only then hand
  // off to that state's own Top 25 page / submission form.
  const [statePickerMode, setStatePickerMode] = useState<'find' | 'list' | null>(null);

  useEffect(() => {
    async function loadRegions() {
      const regions = await getStatesByRegion();
      setStateRegions(regions);
    }
    loadRegions();
  }, []);

  useEffect(() => {
    const openFind = () => setStatePickerMode('find');
    const openList = () => setStatePickerMode('list');
    window.addEventListener('openGetMatchedForm', openFind);
    window.addEventListener('openSubmitAgencyForm', openList);
    return () => {
      window.removeEventListener('openGetMatchedForm', openFind);
      window.removeEventListener('openSubmitAgencyForm', openList);
    };
  }, []);

  function handleSelectState(slug: string) {
    const suffix = statePickerMode === 'list' ? '/?submit=1' : '';
    setStatePickerMode(null);
    navigate(`/marketing-agencies-in-${slug}-united-states${suffix}`);
  }

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

              <div className="mt-6">
                <SmartSearchBox
                  mode="general"
                  title="Which state are you looking for?"
                  subtitle="Tell us a state — we'll point you to the right agency rankings"
                  placeholder="A state, or 'agency in New Jersey'…"
                  exampleQueries={AGENCY_STATE_EXAMPLE_QUERIES}
                />
              </div>
            </div>

            <FeaturedAgencyRail />
          </div>
        </div>
      </section>

      <StatePickerModal
        open={statePickerMode !== null}
        onClose={() => setStatePickerMode(null)}
        title={statePickerMode === 'list' ? 'Which state?' : 'Which state are you looking for?'}
        subtitle={
          statePickerMode === 'list'
            ? "We'll open the Top 25 submission form for that state."
            : "We'll take you to that state's Top 25 marketing agencies."
        }
        onSelectState={handleSelectState}
      />

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

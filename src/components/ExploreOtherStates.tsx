import { getStaticExploreRegions, top25StateUrl } from '../lib/stateUrls';

const EXPLORE_REGIONS = getStaticExploreRegions();

interface ExploreOtherStatesProps {
  currentStateSlug?: string;
}

export default function ExploreOtherStates({ currentStateSlug }: ExploreOtherStatesProps) {
  return (
    <section className="states-section section-block">
      <div className="container">
        <h2 className="states-section-title">Explore Marketing Agencies in Other States</h2>
        <p className="states-section-subtitle">
          Browse our curated Top 25 rankings for every U.S. state to find the perfect marketing partner.
        </p>
        <div className="regions-grid">
          {EXPLORE_REGIONS.map((region) => (
            <div key={region.name} className="region-card">
              <h3 className="region-title">{region.name}</h3>
              <p className="region-description">{region.description}</p>
              <div className="state-pills">
                {region.states.map((state) => {
                  const isCurrentState = state.slug === currentStateSlug;
                  const url = top25StateUrl(state.slug);
                  return (
                    <a
                      key={state.slug}
                      href={url}
                      className={`state-pill${isCurrentState ? ' state-pill-current' : ''}`}
                      title={`Top 25 Marketing Agencies in ${state.name}`}
                      aria-label={`Marketing agencies in ${state.name}`}
                      aria-current={isCurrentState ? 'page' : undefined}
                    >
                      {state.name}
                    </a>
                  );
                })}
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

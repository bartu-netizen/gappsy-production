import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { formatStateName } from '../utils/formatLocation';
import SpotlightCard from './SpotlightCard';

interface SpotlightPlacement {
  id: string;
  position: number;
  agency_name: string;
  tagline?: string;
  short_description?: string;
  logo_url?: string;
  featured_image_url?: string;
  background_color?: string;
  cta_text?: string;
  cta_url?: string;
  services?: string[];
  state_slug?: string;
}

interface SpotlightSectionProps {
  stateSlug: string;
  stateName?: string;
}

export default function SpotlightSection({ stateSlug, stateName }: SpotlightSectionProps) {
  const [spotlights, setSpotlights] = useState<SpotlightPlacement[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadSpotlights() {
      try {
        const { data } = await supabase
          .from('spotlight_placements')
          .select('*')
          .eq('state_slug', stateSlug)
          .order('position');

        setSpotlights(data || []);
      } catch (error) {
        console.error('Failed to load spotlights:', error);
      } finally {
        setLoading(false);
      }
    }

    loadSpotlights();
  }, [stateSlug]);

  if (loading || !spotlights || spotlights.length === 0) {
    return null;
  }

  const displayStateName = stateName || formatStateName(stateSlug);

  async function trackSpotlightView(spotlightId: string) {
    try {
      await supabase.rpc('increment_spotlight_views', { spotlight_id: spotlightId });
    } catch (error) {
      console.error('Failed to track spotlight view:', error);
    }
  }

  async function trackSpotlightClick(spotlightId: string) {
    try {
      await supabase.rpc('track_spotlight_click', { spotlight_id: spotlightId });
    } catch (error) {
      console.error('Failed to track spotlight click:', error);
    }
  }

  return (
    <section className="spotlight-section py-12 bg-gradient-to-b from-blue-50 to-white">
      <div className="container mx-auto px-4">
        <div className="text-center mb-8">
          <h2 className="text-3xl font-bold mb-2">
            Featured Agencies in {displayStateName}
          </h2>
          <p className="text-gray-600">
            Premium marketing agencies delivering exceptional results
          </p>
        </div>

        <div className="spotlight-grid">
          {spotlights.map(agency => (
            <SpotlightCard
              key={agency.id}
              position={agency.position}
              name={agency.agency_name}
              tagline={agency.tagline}
              description={agency.short_description}
              logo={agency.logo_url}
              featuredImage={agency.featured_image_url}
              backgroundColor={agency.background_color}
              ctaText={agency.cta_text}
              ctaUrl={agency.cta_url}
              services={agency.services}
              onView={() => trackSpotlightView(agency.id)}
              onClick={() => trackSpotlightClick(agency.id)}
            />
          ))}
        </div>
      </div>

      <style>{`
        .spotlight-grid {
          display: grid;
          gap: 2rem;
          margin-bottom: 4rem;
        }

        .spotlight-position-1 {
          grid-column: 1 / -1;
          min-height: 500px;
        }

        @media (min-width: 768px) {
          .spotlight-grid {
            grid-template-columns: repeat(2, 1fr);
          }

          .spotlight-position-2,
          .spotlight-position-3 {
            grid-column: span 1;
            min-height: 400px;
          }
        }

        @media (max-width: 767px) {
          .spotlight-position-2,
          .spotlight-position-3 {
            grid-column: 1 / -1;
          }
        }
      `}</style>
    </section>
  );
}

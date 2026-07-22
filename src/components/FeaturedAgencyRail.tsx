import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowRight, Sparkles } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { US_STATES } from '../lib/usStates';

interface FeaturedAgency {
  slug: string;
  name: string;
  city: string | null;
  state_slug: string | null;
  logo_url: string | null;
  short_description: string | null;
  website_url: string | null;
}

const REAL_STATE_SLUGS = new Set(US_STATES.map((s) => s.slug));

// Fills the empty 30fr column of .hero-dark-card on USAHub.tsx with a
// featured-agency ad rail — the agency equivalent of
// FeaturedToolPromo.tsx's tool pool, reading other_agencies.featured
// (added by the same 2025-12-09 migration that added is_paid_listing, but
// never queried until now). Fixed order (not shuffled like the tool pool)
// so Vazagency — Gappsy's own cross-state sponsor — always leads.
export default function FeaturedAgencyRail() {
  const [agencies, setAgencies] = useState<FeaturedAgency[] | undefined>(undefined);

  useEffect(() => {
    let cancelled = false;
    supabase
      .from('other_agencies')
      .select('slug, name, city, state_slug, logo_url, short_description, website_url')
      .eq('featured', true)
      .order('name', { ascending: true })
      .limit(6)
      .then(({ data }) => {
        if (cancelled) return;
        const rows = (data || []) as FeaturedAgency[];
        // Vazagency first (the cross-state sponsor), then the rest — not a
        // per-page pool needing exclusion/shuffle, so a stable order reads
        // more like a curated placement than a lottery.
        const sorted = [...rows].sort((a, b) => {
          if (a.slug === 'vazagency-global') return -1;
          if (b.slug === 'vazagency-global') return 1;
          return 0;
        });
        setAgencies(sorted.slice(0, 3));
      });
    return () => { cancelled = true; };
  }, []);

  if (!agencies || agencies.length === 0) return null;

  return (
    <div className="hero-featured-agencies">
      <p className="hero-featured-agencies-label">Featured agencies</p>
      <div className="hero-featured-agencies-list">
        {agencies.map((agency) => (
          <FeaturedAgencyCard key={agency.slug} agency={agency} />
        ))}
      </div>
    </div>
  );
}

function FeaturedAgencyCard({ agency }: { agency: FeaturedAgency }) {
  const linkableState = agency.state_slug && REAL_STATE_SLUGS.has(agency.state_slug);
  const content = (
    <>
      {agency.logo_url ? (
        <img src={agency.logo_url} alt="" className="hero-featured-agency-logo" />
      ) : (
        <div className="hero-featured-agency-logo hero-featured-agency-logo-fallback">{agency.name.charAt(0)}</div>
      )}
      <div className="hero-featured-agency-info">
        <span className="hero-featured-agency-badge">
          <Sparkles className="w-2.5 h-2.5" aria-hidden="true" />
          Featured
        </span>
        <p className="hero-featured-agency-name">{agency.name}</p>
        {agency.short_description && (
          <p className="hero-featured-agency-desc">{agency.short_description}</p>
        )}
      </div>
      <ArrowRight className="hero-featured-agency-arrow" aria-hidden="true" />
    </>
  );

  if (linkableState) {
    return (
      <Link to={`/marketing-agencies-in-${agency.state_slug}-united-states`} className="hero-featured-agency-card">
        {content}
      </Link>
    );
  }

  return (
    <a
      href={agency.website_url || '#'}
      target="_blank"
      rel="noopener noreferrer nofollow"
      className="hero-featured-agency-card"
    >
      {content}
    </a>
  );
}

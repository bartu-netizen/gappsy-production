import { useState, useEffect, useRef } from 'react';
import { useParams, Link, useNavigate } from 'react-router-dom';
import {
  MapPin, Star, Building2, ChevronRight,
  Globe, ExternalLink, AlertCircle,
} from 'lucide-react';
import {
  getAgencyListings,
  trackYourAgencyEvent,
  slugToStateName,
  buildStatePageUrl,
  INDEX_AGENCY_PAGES,
  type AgencyListing,
  type ResolvedAgency,
} from '../lib/yourAgencyApi';
import FooterWrapper from '../components/FooterWrapper';
import YourAgencySEO from '../components/YourAgencySEO';

function SectionBadge({ section, rank }: { section: string; rank: number | null }) {
  if (section === 'top25') {
    return (
      <span className="inline-flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-amber-50 text-amber-700 border border-amber-200 shrink-0">
        <Star className="w-3 h-3 fill-amber-500 text-amber-500" />
        Top 25{rank ? ` — #${rank}` : ''}
      </span>
    );
  }
  return (
    <span className="inline-flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-slate-100 text-slate-600 border border-slate-200 shrink-0">
      <Building2 className="w-3 h-3" />
      Other Agencies
    </span>
  );
}

export default function YourAgencyTokenPage() {
  const { token } = useParams<{ token: string }>();
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [agency, setAgency] = useState<ResolvedAgency | null>(null);
  const [listings, setListings] = useState<AgencyListing[]>([]);
  const [error, setError] = useState(false);
  const trackedRef = useRef(false);

  useEffect(() => {
    if (!token) return;
    let cancelled = false;

    async function load() {
      setLoading(true);
      const result = await getAgencyListings({ token });
      if (cancelled) return;
      if (!result) {
        setError(true);
      } else {
        setAgency(result.agency);
        setListings(result.listings);

        if (!trackedRef.current) {
          trackedRef.current = true;
          trackYourAgencyEvent({
            event_name: 'your_agency_token_open',
            agency_id: result.agency.id,
            agency_slug: result.agency.slug,
            token,
          });
        }
      }
      setLoading(false);
    }
    load();
    return () => { cancelled = true; };
  }, [token]);

  const handleCtaClick = (listing: AgencyListing) => {
    if (!agency) return;
    trackYourAgencyEvent({
      event_name: 'your_agency_view_listing_click',
      agency_id: agency.id,
      agency_slug: agency.slug,
      state_slug: listing.state_slug,
      section: listing.section,
      token,
    });
  };

  const top25Count = listings.filter((l) => l.section === 'top25').length;
  const stateCount = new Set(listings.map((l) => l.state_slug)).size;
  const noindexMeta = true;
  const pageTitle = agency ? `${agency.name} — Your Gappsy listing` : 'Your agency listing | Gappsy';

  return (
    <>
      <YourAgencySEO
        title={pageTitle}
        description={agency ? `See where ${agency.name} is featured on Gappsy.` : ''}
        canonical={token ? `https://www.gappsy.com/your-agency/t/${token}` : 'https://www.gappsy.com/your-agency'}
        noindex={noindexMeta}
      />

      <div className="min-h-screen flex flex-col bg-gradient-to-b from-slate-900 via-slate-800 to-slate-900">
        {/* Grid background pattern */}
        <div className="absolute inset-0 opacity-5 pointer-events-none" style={{
          backgroundImage: 'linear-gradient(0deg, transparent 24%, rgba(79, 172, 254, .05) 25%, rgba(79, 172, 254, .05) 26%, transparent 27%, transparent 74%, rgba(79, 172, 254, .05) 75%, rgba(79, 172, 254, .05) 76%, transparent 77%, transparent), linear-gradient(90deg, transparent 24%, rgba(79, 172, 254, .05) 25%, rgba(79, 172, 254, .05) 26%, transparent 27%, transparent 74%, rgba(79, 172, 254, .05) 75%, rgba(79, 172, 254, .05) 76%, transparent 77%, transparent)',
          backgroundSize: '50px 50px'
        }} />

        <main className="flex-1 flex flex-col items-center justify-center px-4 py-12 relative z-10">
          <div className="w-full max-w-lg">
            {/* Logo */}
            <div className="flex justify-center mb-12">
              <Link to="/">
                <img
                  src="/logos/gappsy-logo-white.webp"
                  alt="Gappsy"
                  className="h-10 w-auto"
                />
              </Link>
            </div>

            {/* Agency card */}
            {loading ? (
              <div className="space-y-4">
                <div className="h-8 w-48 bg-slate-700/50 rounded animate-pulse mx-auto" />
                <div className="h-4 w-40 bg-slate-700/50 rounded animate-pulse mx-auto" />
              </div>
            ) : error ? (
              <div className="bg-red-900/20 border border-red-500/30 rounded-2xl p-6 text-center">
                <AlertCircle className="w-8 h-8 text-red-400 mx-auto mb-3" />
                <p className="font-semibold text-red-100">Link not found or expired</p>
                <p className="text-sm text-red-200/70 mt-2">Please request a new preview link from your account.</p>
                <Link to="/your-agency" className="inline-block mt-4 text-blue-300 hover:text-blue-200 text-sm font-semibold underline">
                  Search for your agency
                </Link>
              </div>
            ) : agency && listings.length > 0 ? (
              <div className="space-y-6">
                {/* Agency summary */}
                <div className="bg-slate-800/40 backdrop-blur-sm border border-slate-700/50 rounded-2xl p-6 text-center">
                  <div className="mb-4 flex justify-center">
                    <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-blue-400 to-blue-600 flex items-center justify-center">
                      <Building2 className="w-6 h-6 text-white" />
                    </div>
                  </div>
                  <h1 className="text-2xl font-bold text-white mb-1">{agency.name}</h1>
                  {agency.domain && (
                    <a
                      href={`https://${agency.domain}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-sm text-slate-300 hover:text-blue-300 transition-colors"
                    >
                      <Globe className="w-3.5 h-3.5" />
                      {agency.domain}
                      <ExternalLink className="w-3.5 h-3.5" />
                    </a>
                  )}
                  <div className="flex flex-wrap gap-2 mt-4 justify-center">
                    <span className="inline-flex items-center gap-1.5 text-xs font-semibold px-3 py-1.5 rounded-full bg-blue-500/20 text-blue-200 border border-blue-500/30">
                      <MapPin className="w-3 h-3" />
                      Listed in {stateCount} state{stateCount !== 1 ? 's' : ''}
                    </span>
                    {top25Count > 0 && (
                      <span className="inline-flex items-center gap-1.5 text-xs font-semibold px-3 py-1.5 rounded-full bg-amber-500/20 text-amber-200 border border-amber-500/30">
                        <Star className="w-3 h-3 fill-amber-400 text-amber-400" />
                        Top 25 in {top25Count}
                      </span>
                    )}
                  </div>
                </div>

                {/* CTA section */}
                <div className="space-y-3">
                  {listings.length === 1 ? (
                    <Link
                      to={buildStatePageUrl(listings[0].page_path, agency.id, listings[0].section)}
                      onClick={() => handleCtaClick(listings[0])}
                      className="block w-full bg-blue-600 hover:bg-blue-500 text-white font-semibold py-3 px-4 rounded-xl transition-colors text-center"
                    >
                      Continue to my listing
                    </Link>
                  ) : (
                    <div className="space-y-2">
                      <p className="text-xs font-semibold text-slate-300 uppercase tracking-wider text-center mb-3">Your listings:</p>
                      {listings.map((listing) => (
                        <Link
                          key={`${listing.state_slug}-${listing.section}`}
                          to={buildStatePageUrl(listing.page_path, agency.id, listing.section)}
                          onClick={() => handleCtaClick(listing)}
                          className="flex items-center justify-between gap-3 p-3 bg-slate-700/40 hover:bg-slate-700/60 border border-slate-600/50 rounded-lg transition-colors"
                        >
                          <span className="text-sm font-medium text-white">{slugToStateName(listing.state_slug)}</span>
                          <div className="flex items-center gap-2">
                            <SectionBadge section={listing.section} rank={listing.rank} />
                            <ChevronRight className="w-4 h-4 text-slate-400" />
                          </div>
                        </Link>
                      ))}
                    </div>
                  )}
                </div>

                {/* Private link notice */}
                <p className="text-xs text-slate-400 text-center">
                  This is a private preview link.
                </p>

                {/* Secondary link */}
                <div className="text-center">
                  <button
                    onClick={() => navigate('/your-agency')}
                    className="text-sm text-slate-300 hover:text-slate-100 font-medium transition-colors"
                  >
                    Search another agency
                  </button>
                </div>
              </div>
            ) : !error ? (
              <div className="bg-amber-900/20 border border-amber-500/30 rounded-2xl p-6 text-center">
                <AlertCircle className="w-8 h-8 text-amber-400 mx-auto mb-3" />
                <p className="font-semibold text-amber-100">No listings found</p>
                <p className="text-sm text-amber-200/70 mt-2">{agency?.name ?? 'This agency'} is not listed yet.</p>
              </div>
            ) : null}
          </div>
        </main>

        <FooterWrapper />
      </div>
    </>
  );
}

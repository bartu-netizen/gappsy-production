import { useState, useRef, useEffect, useCallback } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import {
  Search, Building2, ChevronRight, X, Star, MapPin,
  RefreshCw, TrendingUp,
} from 'lucide-react';
import {
  searchAgencies,
  trackYourAgencyEvent,
  slugToStateName,
  buildStatePageUrl,
  prefetchAgencyListings,
  type AgencyResult,
  type PrefetchedAgencyData,
} from '../lib/yourAgencyApi';
import FooterWrapper from '../components/FooterWrapper';
import YourAgencySEO from '../components/YourAgencySEO';
import { createFsid, getFsid, logFunnelEvent, FUNNEL_EVENTS, setEntryPath } from '../utils/yourAgencyFunnel';
import { cleanAgencyDomain } from '../utils/urlNormalizer';

const cleanDomain = cleanAgencyDomain;

function StateBadge({ section, rank }: { section: string; rank: number | null }) {
  if (section === 'top25') {
    return (
      <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full bg-amber-50 text-amber-700 border border-amber-200">
        <Star className="w-2.5 h-2.5 fill-amber-500 text-amber-500" />
        Top 25{rank ? ` #${rank}` : ''}
      </span>
    );
  }
  return (
    <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full bg-slate-100 text-slate-600 border border-slate-200">
      <Building2 className="w-2.5 h-2.5" />
      Listed
    </span>
  );
}

function AgencyDropdownItem({
  agency,
  isActive,
  onSelect,
  onHover,
}: {
  agency: AgencyResult;
  isActive: boolean;
  onSelect: (a: AgencyResult) => void;
  onHover: (a: AgencyResult) => void;
}) {
  const listings = agency.states || agency.listings || [];
  const top25Listings = listings.filter((l) => l.section === 'top25');
  const stateCount = new Set(listings.map((l) => l.state_slug)).size;
  const bestRank = top25Listings.sort((a, b) => (a.rank ?? 99) - (b.rank ?? 99))[0];
  const bestStateListing = listings[0];

  return (
    <button
      type="button"
      onMouseDown={() => onSelect(agency)}
      onMouseEnter={() => onHover(agency)}
      className={`w-full text-left flex items-center gap-3 px-4 py-3 transition-colors group ${isActive ? 'bg-blue-50' : 'hover:bg-slate-50'}`}
    >
      <div className={`w-9 h-9 rounded-xl flex items-center justify-center shrink-0 transition-all ${isActive ? 'bg-blue-100' : 'bg-gradient-to-br from-slate-100 to-slate-200 group-hover:from-blue-50 group-hover:to-blue-100'}`}>
        <Building2 className={`w-4 h-4 transition-colors ${isActive ? 'text-blue-600' : 'text-slate-400 group-hover:text-blue-500'}`} />
      </div>
      <div className="flex-1 min-w-0">
        <div className="flex items-center gap-2 flex-wrap">
          <span className="text-sm font-semibold text-slate-900 truncate">{agency.agency_name}</span>
          {bestRank && <StateBadge section="top25" rank={bestRank.rank} />}
          {!top25Listings.length && listings.length > 0 && (
            <StateBadge section="other" rank={null} />
          )}
        </div>
        <div className="flex items-center gap-2 mt-0.5 flex-wrap">
          {cleanDomain(agency.agency_domain) ? (
            <span className="text-xs text-slate-400">{cleanDomain(agency.agency_domain)}</span>
          ) : (
            <span className="text-xs text-slate-400">
              Listed in {stateCount} state{stateCount !== 1 ? 's' : ''}
            </span>
          )}
          {bestStateListing && (
            <span
              className="text-xs font-medium text-blue-500 hover:text-blue-600 flex items-center gap-0.5"
              onMouseDown={(e) => {
                e.stopPropagation();
                const url = buildStatePageUrl(
                  bestStateListing.page_path,
                  agency.agency_id || '',
                  bestStateListing.section
                );
                window.location.href = url;
              }}
            >
              View in {slugToStateName(bestStateListing.state_slug)}
              <ChevronRight className="w-3 h-3" />
            </span>
          )}
        </div>
      </div>
      <ChevronRight className={`w-4 h-4 shrink-0 transition-colors ${isActive ? 'text-blue-400' : 'text-slate-200 group-hover:text-slate-400'}`} />
    </button>
  );
}

const HOW_IT_WORKS = [
  {
    step: '01',
    title: 'Search your agency',
    body: 'Type your agency name. We index all agencies across 52 US state and territory pages in real time.',
  },
  {
    step: '02',
    title: 'See your listings',
    body: 'View every state where you appear — Top 25 rank or Other Agencies — and see who\'s checking your availability.',
  },
];

const TRUST_PILLS = [
  { icon: <MapPin className="w-3.5 h-3.5" />, label: 'Agencies in 50+ states' },
  { icon: <RefreshCw className="w-3.5 h-3.5" />, label: 'Updated daily' },
  { icon: <TrendingUp className="w-3.5 h-3.5" />, label: '1,300+ agencies listed' },
];

export default function YourAgencySearchPage() {
  const navigate = useNavigate();
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<AgencyResult[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [open, setOpen] = useState(false);
  const [activeIndex, setActiveIndex] = useState(-1);
  const inputRef = useRef<HTMLInputElement>(null);
  const dropdownRef = useRef<HTMLDivElement>(null);
  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const abortControllerRef = useRef<AbortController | null>(null);
  const trackedPageView = useRef(false);
  const prefetchedSlugs = useRef<Set<string>>(new Set());

  useEffect(() => {
    if (trackedPageView.current) return;
    trackedPageView.current = true;
    createFsid();
    setEntryPath('search');
    trackYourAgencyEvent({ event_name: 'your_agency_page_view' });
    logFunnelEvent({ ...FUNNEL_EVENTS.LANDING_VIEWED, entry_path: 'search' });
  }, []);

  const doSearch = useCallback(async (q: string) => {
    if (q.length < 3) {
      setResults([]);
      setOpen(false);
      setError('');
      return;
    }

    abortControllerRef.current?.abort();
    abortControllerRef.current = new AbortController();

    setLoading(true);
    setError('');
    const searchStart = performance.now();

    try {
      console.log(`[AgencySearch] input="${q}"`);
      const res = await searchAgencies(q);

      if (abortControllerRef.current?.signal.aborted) {
        console.log('[AgencySearch] aborted');
        return;
      }

      setResults(res);
      setOpen(true);
      setActiveIndex(-1);
      const duration = performance.now() - searchStart;
      console.log(`[AgencySearch] success count=${res.length} duration=${duration.toFixed(2)}ms`);

      trackYourAgencyEvent({
        event_name: 'your_agency_search',
        meta: { q_length: q.length, results_count: res.length },
      });
      logFunnelEvent({ ...FUNNEL_EVENTS.SEARCH_SUBMITTED, metadata: { query: q, results_count: res.length } });
    } catch (err: unknown) {
      if (abortControllerRef.current?.signal.aborted) {
        console.log('[AgencySearch] aborted');
        return;
      }
      console.error('[AgencySearch] error:', err);
      setError('Unable to complete search. Please try again.');
      setResults([]);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => doSearch(query), 350);
    return () => {
      if (debounceRef.current) clearTimeout(debounceRef.current);
    };
  }, [query, doSearch]);

  useEffect(() => {
    function onClickOutside(e: MouseEvent) {
      if (
        dropdownRef.current?.contains(e.target as Node) === false &&
        inputRef.current?.contains(e.target as Node) === false
      ) {
        setOpen(false);
      }
    }
    document.addEventListener('mousedown', onClickOutside);
    return () => document.removeEventListener('mousedown', onClickOutside);
  }, []);

  const handlePrefetch = useCallback((agency: AgencyResult) => {
    if (!agency.agency_slug) return;
    if (prefetchedSlugs.current.has(agency.agency_slug)) return;

    prefetchedSlugs.current.add(agency.agency_slug);
    prefetchAgencyListings(agency.agency_slug);
  }, []);

  const handleHover = useCallback((agency: AgencyResult) => {
    handlePrefetch(agency);
  }, [handlePrefetch]);

  const handleSelect = (agency: AgencyResult) => {
    setOpen(false);

    handlePrefetch(agency);

    trackYourAgencyEvent({
      event_name: 'your_agency_select',
      agency_id: agency.agency_id,
      agency_slug: agency.agency_slug,
    });

    const url = agency.agency_slug ? `/your-agency/${agency.agency_slug}` : `/your-agency/${agency.agency_id}`;
    const profileUrl = `https://gappsy.com${url}`;
    const fsid = getFsid();

    const listings = agency.states || agency.listings || [];
    const primaryState = listings[0]?.state_slug ?? null;
    const resultPosition = results.indexOf(agency);

    logFunnelEvent({
      ...FUNNEL_EVENTS.PROFILE_CLICKED,
      agency_id: agency.agency_id ?? undefined,
      agency_slug: agency.agency_slug ?? undefined,
      agency_name: agency.agency_name,
      state_slug: primaryState ?? undefined,
      metadata: {
        search_query: query,
        result_position: resultPosition >= 0 ? resultPosition : undefined,
        total_results: results.length,
      },
    });

    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL as string;
    const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

    fetch(`${supabaseUrl}/functions/v1/your-agency-profile-click`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${anonKey}`,
        'apikey': anonKey,
      },
      body: JSON.stringify({
        agency_id: agency.agency_id,
        agency_slug: agency.agency_slug,
        agency_name: agency.agency_name,
        profile_url: profileUrl,
        search_query: query,
        source: 'your_agency_searchbar',
        visitor_session_id: fsid ?? undefined,
        state_slug: primaryState ?? undefined,
        request_id: `${agency.agency_slug ?? agency.agency_id}-${fsid ?? ''}-${Date.now()}`,
        meta: {
          result_position: resultPosition >= 0 ? resultPosition : undefined,
          total_results: results.length,
          state_slug: primaryState,
        },
      }),
    }).catch(e => console.warn('[AgencySearch] profile-click fire failed:', e));

    const prefetchedData: PrefetchedAgencyData = {
      agency_id: agency.agency_id,
      agency_name: agency.agency_name,
      agency_slug: agency.agency_slug,
      agency_domain: agency.agency_domain,
      listings: listings.map(l => ({
        state_slug: l.state_slug,
        section: l.section,
        rank: l.rank,
        page_path: l.page_path,
      })),
      prefetchedAt: Date.now(),
      searchQuery: query,
    };

    console.log(`[AgencySearch] navigating with prefetched state for slug=${agency.agency_slug}`);
    navigate(url, { state: { prefetchedAgency: prefetchedData } });
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (!open || !results.length) return;
    if (e.key === 'ArrowDown') {
      e.preventDefault();
      const newIndex = Math.min(activeIndex + 1, results.length - 1);
      setActiveIndex(newIndex);
      if (results[newIndex]) {
        handlePrefetch(results[newIndex]);
      }
    } else if (e.key === 'ArrowUp') {
      e.preventDefault();
      const newIndex = Math.max(activeIndex - 1, -1);
      setActiveIndex(newIndex);
      if (newIndex >= 0 && results[newIndex]) {
        handlePrefetch(results[newIndex]);
      }
    } else if (e.key === 'Enter' && activeIndex >= 0) {
      e.preventDefault();
      handleSelect(results[activeIndex]);
    } else if (e.key === 'Escape') {
      setOpen(false);
    }
  };

  return (
    <>
      <YourAgencySEO
        title="Find your agency listing | Gappsy"
        description="Search and see where your agency is listed across our Top-25 marketing agency pages in every US state. Updated daily."
        canonical="https://gappsy.com/your-agency"
        noindex={false}
      />

      <div className="min-h-screen flex flex-col bg-white">
        <main className="flex-1">
          <section className="relative">
            <div className="pointer-events-none absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-blue-950 overflow-hidden">
              <div
                className="absolute inset-0 opacity-40"
                style={{
                  backgroundImage:
                    'radial-gradient(circle at 15% 60%, rgba(59,130,246,0.35) 0%, transparent 50%), radial-gradient(circle at 85% 15%, rgba(14,165,233,0.2) 0%, transparent 45%)',
                }}
              />
              <div
                className="absolute inset-0 opacity-[0.04]"
                style={{
                  backgroundImage:
                    'linear-gradient(rgba(255,255,255,.5) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,.5) 1px, transparent 1px)',
                  backgroundSize: '48px 48px',
                }}
              />
            </div>

            <div className="relative max-w-3xl mx-auto px-4 pt-4 pb-12 md:pt-5 md:pb-16 lg:pt-5 lg:pb-16 text-center">
              <div className="mx-auto mb-2 md:mb-3 w-fit select-none">
                <img
                  src="/logos/gappsy-logo-white.webp"
                  alt="Gappsy"
                  className="h-10 md:h-11 lg:h-12 w-auto opacity-95"
                  onError={(e) => {
                    (e.currentTarget as HTMLImageElement).src =
                      '/logos/Gappsy-logo-white.webp';
                  }}
                />
              </div>

              <div className="inline-flex items-center gap-2 bg-white/10 backdrop-blur border border-white/15 rounded-full px-4 py-1.5 mb-3 md:mb-4">
                <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
                <span className="text-xs font-medium text-white/80">
                  Your agency is listed
                </span>
              </div>

              <h1 className="text-3xl md:text-4xl lg:text-4xl font-bold text-white leading-tight tracking-tight mb-2 md:mb-2.5">
                See where your agency appears
              </h1>
              <p className="text-base md:text-base lg:text-lg text-blue-200/75 mb-5 md:mb-6 leading-relaxed max-w-2xl mx-auto">
                See how clients find your agency — and what happens when they try to contact you.
              </p>

              <div className="relative z-[100] w-full max-w-xl mx-auto overflow-visible">
                <div className="relative flex items-center overflow-visible">
                  {loading ? (
                    <div className="absolute left-4 w-5 h-5 border-2 border-blue-400 border-t-transparent rounded-full animate-spin z-10" />
                  ) : (
                    <Search className="absolute left-4 w-5 h-5 text-slate-400 pointer-events-none z-10" />
                  )}
                  <input
                    ref={inputRef}
                    type="text"
                    value={query}
                    onChange={(e) => setQuery(e.target.value)}
                    onKeyDown={handleKeyDown}
                    onFocus={() => results.length > 0 && setOpen(true)}
                    placeholder="Search by agency name…"
                    autoComplete="off"
                    spellCheck={false}
                    className="w-full pl-12 pr-12 py-4 rounded-2xl text-base text-slate-900 bg-white shadow-2xl shadow-black/30 border border-transparent focus:outline-none focus:ring-2 focus:ring-blue-500 placeholder:text-slate-400"
                  />
                  {query && (
                    <button
                      type="button"
                      onClick={() => {
                        setQuery('');
                        setResults([]);
                        setOpen(false);
                        inputRef.current?.focus();
                      }}
                      className="absolute right-4 p-1 rounded-full text-slate-400 hover:text-slate-600 transition-colors"
                    >
                      <X className="w-4 h-4" />
                    </button>
                  )}
                </div>

                {open && results.length > 0 && (
                  <div
                    ref={dropdownRef}
                    className="absolute top-full left-0 right-0 mt-2 bg-white rounded-2xl shadow-2xl shadow-black/20 border border-slate-100 z-[200] max-h-80 overflow-y-auto"
                  >
                    {results.map((agency, idx) => (
                      <AgencyDropdownItem
                        key={agency.agency_slug || agency.agency_id || idx}
                        agency={agency}
                        isActive={idx === activeIndex}
                        onSelect={handleSelect}
                        onHover={handleHover}
                      />
                    ))}
                  </div>
                )}

                {query.length > 0 && query.length < 3 && (
                  <div className="absolute top-full left-0 right-0 mt-2 bg-white rounded-2xl shadow-xl border border-slate-100 px-5 py-4 z-[200] text-center">
                    <p className="text-sm text-slate-600">Type at least 3 letters to search your agency</p>
                  </div>
                )}

                {open && results.length === 0 && query.length >= 3 && !loading && !error && (
                  <div className="absolute top-full left-0 right-0 mt-2 bg-white rounded-2xl shadow-xl border border-slate-100 px-5 py-5 z-[200] text-center">
                    <p className="text-sm font-semibold text-slate-700 mb-1">No results for "{query}"</p>
                    <p className="text-xs text-slate-400">
                      Try a different spelling or{' '}
                      <Link to="/your-agency/not-found" className="text-blue-600 hover:underline">
                        submit your agency
                      </Link>
                    </p>
                  </div>
                )}

                {error && (
                  <div className="absolute top-full left-0 right-0 mt-2 bg-white rounded-2xl shadow-xl border border-red-200 px-5 py-4 z-[200] text-center">
                    <p className="text-sm text-red-700 mb-2">{error}</p>
                    <button
                      type="button"
                      onClick={() => doSearch(query)}
                      className="text-xs text-blue-600 hover:text-blue-700 font-medium"
                    >
                      Try again
                    </button>
                  </div>
                )}
              </div>

              <div className="flex flex-wrap items-center justify-center gap-2 mt-5 md:mt-6">
                {TRUST_PILLS.map(({ icon, label }) => (
                  <div
                    key={label}
                    className="inline-flex items-center gap-1.5 bg-white/10 border border-white/10 rounded-full px-3 py-1 text-xs text-white/70"
                  >
                    {icon}
                    {label}
                  </div>
                ))}
              </div>
            </div>
          </section>

          <section className="relative z-0 max-w-3xl mx-auto px-4 py-16 bg-white">
            <p className="text-center text-xs font-semibold uppercase tracking-widest text-slate-400 mb-3">
              How it works
            </p>
            <h2 className="text-center text-2xl font-bold text-slate-900 mb-10">
              Find your listing in seconds
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5 max-w-2xl mx-auto">
              {HOW_IT_WORKS.map(({ step, title, body }) => (
                <div
                  key={step}
                  className="relative bg-white rounded-2xl border border-slate-100 p-6 shadow-sm hover:shadow-md transition-shadow"
                >
                  <span className="text-5xl font-black text-slate-100 absolute top-3 right-5 select-none leading-none">
                    {step}
                  </span>
                  <h3 className="text-sm font-bold text-slate-900 mb-2 relative">{title}</h3>
                  <p className="text-sm text-slate-500 leading-relaxed relative">{body}</p>
                </div>
              ))}
            </div>
          </section>
        </main>

        <FooterWrapper />
      </div>
    </>
  );
}

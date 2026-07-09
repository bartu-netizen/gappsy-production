import { useState, useEffect, useRef, useMemo } from 'react';
import { useLocation } from 'react-router-dom';
import { Search, X, ChevronRight } from 'lucide-react';
import OtherAgencyCard from './OtherAgencyCard';
import { supabase } from '../lib/supabase';
import { trackYourAgencyEvent } from '../lib/yourAgencyApi';
import { assignServices } from '../utils/deterministicServiceAssignment';
import { sanitizeAgencyName, isDisplayableAgencyName } from '../utils/sanitizeAgencyName';
import { getCached, setCache } from '../utils/dataCache';
import type { OwnerPreviewStep } from './OwnerStickyBar';

interface OtherAgency {
  id: string;
  name: string;
  location: string;
  intro: string;
  services: string[];
  isPaidListing?: boolean;
  hasCardVisualUpgrade?: boolean;
  isPlaceholder?: boolean;
}

interface OtherAgenciesSectionProps {
  stateName: string;
  stateSlug: string;
  highlightAgencyId?: string | null;
  highlightNonce?: number;
  ownerMode?: boolean;
  ownerPreviewStep?: OwnerPreviewStep;
  ownerAgencyId?: string | null;
  onOwnerCheckAvailability?: () => void;
  onOpenStatepageAvailability?: (agencyId: string, directClient?: boolean) => void;
  onOwnerCardReady?: () => void;
}

const MOCK_OTHER_AGENCIES: OtherAgency[] = [
  {
    id: "0a13b250-b119-45fc-84ce-d3848dcff951",
    name: "Garden State Digital",
    location: "",
    intro: "Full-service digital marketing agency helping local businesses grow through data-driven campaigns and conversion-focused websites.",
    services: assignServices("garden-state-digital", ["SEO", "PPC", "Web Design", "Content Marketing"], "Garden State Digital", null),
    isPlaceholder: true
  },
  {
    id: "e748c792-3bc0-4c05-8eaa-33320f2d97e1",
    name: "Shoreline Marketing Co.",
    location: "",
    intro: "Specialized in performance marketing for startups and ecommerce brands, with a strong focus on ROI and lead generation.",
    services: assignServices("shoreline-marketing-co", ["Paid Social", "Email Marketing", "Conversion Optimization", "Analytics"], "Shoreline Marketing Co.", null),
    isPlaceholder: true
  },
  {
    id: "0076a8ed-86da-461a-a3f0-8b0041fac8c2",
    name: "Hudson River Creative",
    location: "",
    intro: "Branding and creative studio that builds modern digital experiences, from strategy and design to launch.",
    services: assignServices("hudson-river-creative", ["Branding", "Web Development", "UX/UI Design", "Content Creation"], "Hudson River Creative", null),
    isPlaceholder: true
  },
  {
    id: "431c15ac-0039-431b-b4e1-56aef27cd281",
    name: "Pinecone Performance Agency",
    location: "",
    intro: "Performance-driven agency helping B2B and local service companies generate high-quality leads online.",
    services: assignServices("pinecone-performance-agency", ["Lead Generation", "Local SEO", "Google Ads", "Marketing Strategy"], "Pinecone Performance Agency", null),
    isPlaceholder: true
  }
];

function simpleHash(str: string): number {
  const safe = (str ?? '').toString();
  if (!safe) return 0;
  let hash = 0;
  for (let i = 0; i < safe.length; i++) {
    hash = ((hash << 5) - hash) + safe.charCodeAt(i);
    hash |= 0;
  }
  return Math.abs(hash);
}

function stableShuffleArray<T>(array: T[], seed?: string): T[] {
  const safeSeed = (seed ?? '').toString();
  const shuffled = [...array];
  const hash = simpleHash(safeSeed);
  let currentSeed = hash;

  for (let i = shuffled.length - 1; i > 0; i--) {
    currentSeed = (currentSeed * 9301 + 49297) % 233280;
    const j = Math.floor((currentSeed / 233280) * (i + 1));
    [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
  }

  return shuffled;
}

function transformAgencyToCard(agency: any): OtherAgency {
  const seed = agency.slug || agency.id || agency.name || '';
  const rawName = typeof agency.name === 'string' ? agency.name : '';
  const name = sanitizeAgencyName(rawName, agency.website_url);
  const description = agency.description || null;
  const rawServices = Array.isArray(agency.services) ? agency.services : [];
  const services = assignServices(seed, rawServices, name, description);
  return {
    id: agency.id,
    name,
    location: agency.city || '',
    intro: description || '',
    services,
    isPaidListing: !!agency.is_paid_listing,
    isPlaceholder: false,
  };
}

function OtherAgenciesSection({
  stateName,
  stateSlug,
  highlightAgencyId,
  highlightNonce,
  ownerMode = false,
  ownerPreviewStep = 1,
  ownerAgencyId,
  onOwnerCheckAvailability,
  onOpenStatepageAvailability,
  onOwnerCardReady,
}: OtherAgenciesSectionProps) {
  const location = useLocation();
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedService, setSelectedService] = useState<string | null>(null);
  const [showAllServices, setShowAllServices] = useState(false);
  const [isVisible, setIsVisible] = useState(false);
  const [dbAgencies, setDbAgencies] = useState<OtherAgency[]>([]);
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [totalFromAPI, setTotalFromAPI] = useState<number | null>(null);
  const [visibleCount, setVisibleCount] = useState(12);
  const [localHighlightedId, setLocalHighlightedId] = useState<string | null>(null);
  const [toast, setToast] = useState<string | null>(null);
  const highlightScrolledRef = useRef(false);
  const sectionRef = useRef<HTMLDivElement>(null);
  const ownerCardReadyFiredRef = useRef(false);

  // Parse query params for highlight feature (legacy query-param path)
  const searchParams = new URLSearchParams(location.search);
  const targetAgencyId = searchParams.get('agency');
  const targetSection = searchParams.get('section');
  const fromYourAgency = searchParams.get('from') === 'your-agency';
  const isOtherSection = targetSection === 'other';

  // SINGLE SOURCE OF TRUTH: Determine the priority agency to guarantee in DOM
  const priorityAgencyId = (ownerMode && ownerAgencyId)
    ? ownerAgencyId
    : (fromYourAgency && isOtherSection && targetAgencyId)
      ? targetAgencyId
      : null;

  // Merge: owner-driven highlight (parent prop) takes precedence over local query-param highlight
  const effectiveHighlightedId = highlightAgencyId ?? localHighlightedId;

  // Load agencies from API with caching (including force-load of priority agency if missing).
  //
  // Owner-preview fast path: when a priorityAgencyId is set (only triggered from
  // /your-agency owner-preview entry), the single-row priority fetch runs in
  // PARALLEL with the full list fetch. The priority card is rendered the
  // moment its row returns, so the first row appears in ~1s without waiting
  // for the full list, intent scoring, logos, or enrichment.
  useEffect(() => {
    let cancelled = false;
    async function loadAgencies() {
      if (!stateSlug) {
        setLoading(false);
        return;
      }

      const cacheKey = `other-agencies-${stateSlug}`;
      const cached = getCached<OtherAgency[]>(cacheKey);

      if (priorityAgencyId) {
        // 1) Cache fast-path: if the priority agency is already in cache,
        //    render the cached list (with priority pinned) immediately.
        if (cached) {
          const idx = cached.findIndex(a => a.id === priorityAgencyId);
          if (idx >= 0) {
            const reordered = idx === 0
              ? cached
              : [cached[idx], ...cached.filter((_, i) => i !== idx)];
            if (!cancelled) {
              setDbAgencies(reordered);
              setLoading(false);
            }
          }
        }

        // 2) Single-row priority fetch (fast) — parallel with list fetch below.
        //    Renders the first card as soon as it returns, even before the list.
        supabase
          .from('other_agencies')
          .select('id, name, city, description, services, slug, website_url, is_paid_listing')
          .eq('id', priorityAgencyId)
          .or('listing_management_status.is.null,listing_management_status.eq.visible_free,listing_management_status.eq.active_paid')
          .maybeSingle()
          .then(({ data }) => {
            if (cancelled || !data) return;
            const card = transformAgencyToCard(data);
            setDbAgencies(prev => {
              const existingIdx = prev.findIndex(a => a.id === card.id);
              if (existingIdx === 0) return prev;
              if (existingIdx > 0) {
                const next = [...prev];
                const [item] = next.splice(existingIdx, 1);
                return [item, ...next];
              }
              return [card, ...prev];
            });
            setLoading(false);
          })
          .then(undefined, () => { /* swallow; list fetch is the safety net */ });
      } else if (cached) {
        setDbAgencies(cached);
        setLoading(false);
        return;
      }

      try {
        const supabaseUrl = import.meta.env.VITE_SUPABASE_URL as string;
        const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

        const response = await fetch(
          `${supabaseUrl}/functions/v1/other-agencies-list?state=${stateSlug}&limit=100&offset=0&_ts=${Date.now()}`,
          {
            headers: {
              'Authorization': `Bearer ${anonKey}`,
            },
            cache: 'no-store',
          }
        );

        const result = await response.json();
        let transformed: OtherAgency[] = [];

        if (result.ok && result.agencies && result.agencies.length > 0) {
          transformed = result.agencies
            .filter((a: any) => isDisplayableAgencyName(a.name, a.website_url))
            .map(transformAgencyToCard);
          if (!cancelled) setTotalFromAPI(typeof result.total === 'number' ? result.total : null);
        } else {
          if (!cancelled) setTotalFromAPI(0);
        }

        if (priorityAgencyId) {
          const priorityIdx = transformed.findIndex(a => a.id === priorityAgencyId);
          if (priorityIdx > 0) {
            const [item] = transformed.splice(priorityIdx, 1);
            transformed = [item, ...transformed];
          } else if (priorityIdx === -1) {
            // Priority not in list → preserve a previously force-loaded card if present.
            if (!cancelled) {
              setDbAgencies(prev => {
                const existing = prev.find(a => a.id === priorityAgencyId);
                const merged = existing ? [existing, ...transformed] : transformed;
                setCache(cacheKey, merged, 120_000);
                return merged;
              });
              setLoading(false);
            }
            return;
          }
        }

        if (cancelled) return;
        setCache(cacheKey, transformed, 120_000);
        setDbAgencies(prev => {
          // If the priority card is already pinned (from the fast-path single-row
          // fetch), keep it at index 0 even if the list fetch returned a slightly
          // different ordering for downstream rows.
          if (!priorityAgencyId) return transformed;
          const pinned = prev[0]?.id === priorityAgencyId ? prev[0] : null;
          if (!pinned) return transformed;
          return [pinned, ...transformed.filter(a => a.id !== priorityAgencyId)];
        });
      } catch (error) {
        if (import.meta.env.DEV) {
          console.error('[OtherAgenciesSection] Error loading agencies:', error);
        }
      } finally {
        if (!cancelled) setLoading(false);
      }
    }

    loadAgencies();
    return () => { cancelled = true; };
  }, [stateSlug, priorityAgencyId]);

  useEffect(() => {
    if (isVisible) return;

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setIsVisible(true);
          }
        });
      },
      { threshold: 0.05 }
    );

    if (sectionRef.current) {
      observer.observe(sectionRef.current);
    }

    const fallbackTimer = setTimeout(() => {
      setIsVisible(true);
    }, 3000);

    return () => {
      clearTimeout(fallbackTimer);
      if (sectionRef.current) {
        observer.unobserve(sectionRef.current);
      }
    };
  }, [isVisible]);

  // Scroll + highlight logic for legacy query-param path (only, not owner mode)
  // Owner mode scrolling/highlight is handled by parent OwnerStickyBar
  useEffect(() => {
    if (!fromYourAgency || !targetAgencyId || loading || highlightScrolledRef.current) return;
    // Skip if parent is already handling highlight via owner mode props
    if (ownerMode && ownerAgencyId === targetAgencyId) return;
    highlightScrolledRef.current = true;

    setTimeout(() => {
      const el = document.getElementById(`agency-${targetAgencyId}`);
      if (el) {
        el.scrollIntoView({ behavior: 'smooth', block: 'center' });
        setLocalHighlightedId(targetAgencyId);
        trackYourAgencyEvent({
          event_name: 'state_page_highlight_shown',
          agency_id: targetAgencyId,
          state_slug: stateSlug,
          section: 'other',
        });
        setTimeout(() => setLocalHighlightedId(null), 6000);
      } else {
        setToast("We couldn't find that agency on this page.");
        setTimeout(() => setToast(null), 4000);
      }
    }, 200);
  }, [loading, fromYourAgency, targetAgencyId, stateSlug, ownerMode, ownerAgencyId]);

  // Reset ready-fired flag when priority agency changes (new owner session)
  useEffect(() => {
    ownerCardReadyFiredRef.current = false;
  }, [priorityAgencyId]);

  // Signal parent when owner card is confirmed at index 0 in the rendered list
  useEffect(() => {
    if (!priorityAgencyId || loading || ownerCardReadyFiredRef.current) return;
    if (dbAgencies.length > 0 && dbAgencies[0].id === priorityAgencyId) {
      ownerCardReadyFiredRef.current = true;
      console.log('[OwnerPreview] Owner card confirmed at index 0, signaling ready');
      onOwnerCardReady?.();
    }
  }, [priorityAgencyId, loading, dbAgencies, onOwnerCardReady]);

  // Reset visible count + total when state changes
  useEffect(() => {
    setVisibleCount(12);
    setTotalFromAPI(null);
  }, [stateSlug]);

  // When "Scroll to my listing" fires (highlightNonce increments), clear any active
  // search/service filters so the priority agency is visible and at position 0
  useEffect(() => {
    if (!ownerMode || !ownerAgencyId || !highlightNonce) return;
    setSearchQuery('');
    setSelectedService(null);
  }, [highlightNonce]);

  const handleShowMore = async () => {
    const PAGE_SIZE = 12;
    const nextOffset = dbAgencies.length;

    if (visibleCount < dbAgencies.length) {
      setVisibleCount(c => c + PAGE_SIZE);
      return;
    }

    if (totalFromAPI !== null && dbAgencies.length >= totalFromAPI) return;

    setLoadingMore(true);
    try {
      const supabaseUrl = import.meta.env.VITE_SUPABASE_URL as string;
      const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

      const response = await fetch(
        `${supabaseUrl}/functions/v1/other-agencies-list?state=${stateSlug}&limit=${PAGE_SIZE}&offset=${nextOffset}`,
        { headers: { 'Authorization': `Bearer ${anonKey}` } }
      );
      const result = await response.json();

      if (result.ok && Array.isArray(result.agencies) && result.agencies.length > 0) {
        const newAgencies = result.agencies
          .filter((a: any) => isDisplayableAgencyName(a.name, a.website_url))
          .map(transformAgencyToCard);
        const existingIds = new Set(dbAgencies.map(a => a.id));
        const deduped = newAgencies.filter((a: OtherAgency) => !existingIds.has(a.id));
        setDbAgencies(prev => [...prev, ...deduped]);
        if (typeof result.total === 'number') setTotalFromAPI(result.total);
      }
      setVisibleCount(c => c + PAGE_SIZE);
    } catch {
      // silently ignore
    } finally {
      setLoadingMore(false);
    }
  };

  // Use DB agencies if available, otherwise fall back to mock data with stable shuffle
  const seed = stateSlug || 'default';
  const baseAgencies = dbAgencies.length > 0
    ? dbAgencies
    : stableShuffleArray(MOCK_OTHER_AGENCIES, seed);

  // RENDER-TIME GUARANTEE: Priority agency is always at index 0.
  // loadAgencies() handles this asynchronously, but this useMemo enforces it
  // synchronously on every render — covering edge cases like component re-mounts
  // or any scenario where dbAgencies order drifts.
  const agenciesToRender = useMemo(() => {
    if (!priorityAgencyId) return baseAgencies;
    const idx = baseAgencies.findIndex(a => a.id === priorityAgencyId);
    if (idx <= 0) return baseAgencies;
    const reordered = [...baseAgencies];
    const [item] = reordered.splice(idx, 1);
    return [item, ...reordered];
  }, [baseAgencies, priorityAgencyId]);

  const allServices = useMemo(() =>
    Array.from(new Set(agenciesToRender.flatMap(agency => agency.services))).sort(),
    [agenciesToRender]
  );

  // Split services into primary (first 6) and additional
  const PRIMARY_SERVICES_COUNT = 6;
  const primaryServices = allServices.slice(0, PRIMARY_SERVICES_COUNT);
  const additionalServices = allServices.slice(PRIMARY_SERVICES_COUNT);
  const hasMoreServices = additionalServices.length > 0;

  // Filter by search query and selected service
  const filteredAgencies = agenciesToRender.filter(agency => {
    const matchesSearch = (agency.name || '').toLowerCase().includes(searchQuery.toLowerCase());
    const matchesService = !selectedService || agency.services.includes(selectedService);
    return matchesSearch && matchesService;
  });

  const clearSearch = () => {
    setSearchQuery('');
  };

  const clearFilters = () => {
    setSelectedService(null);
  };

  const handleServiceClick = (service: string) => {
    setSelectedService(selectedService === service ? null : service);
  };

  const toggleShowAllServices = () => {
    setShowAllServices(!showAllServices);
  };

  const isFiltering = !!(searchQuery || selectedService);
  const allDisplayAgencies = isFiltering
    ? filteredAgencies
    : agenciesToRender.slice(0, visibleCount);

  const hasMore = !isFiltering && (
    visibleCount < agenciesToRender.length ||
    (totalFromAPI !== null && dbAgencies.length < totalFromAPI)
  );

  const BATCH_SIZE = 20;
  const [renderedCount, setRenderedCount] = useState(12);

  useEffect(() => {
    setRenderedCount(12);
  }, [searchQuery, selectedService]);

  useEffect(() => {
    if (!isFiltering || renderedCount >= allDisplayAgencies.length) return;
    const id = requestAnimationFrame(() => {
      setRenderedCount((c) => Math.min(c + BATCH_SIZE, allDisplayAgencies.length));
    });
    return () => cancelAnimationFrame(id);
  }, [renderedCount, allDisplayAgencies.length, isFiltering]);

  const displayAgencies = isFiltering
    ? allDisplayAgencies.slice(0, renderedCount)
    : allDisplayAgencies;

  return (
    <>
      <section id="other-agencies-section" className="other-agencies-section section-block" ref={sectionRef}>
        <div className="other-agencies-container">
          <div className={`other-agencies-header-content ${(isVisible || !!priorityAgencyId) ? 'animate-in' : ''}`}>
            <h2 className="text-xl md:text-3xl font-bold leading-tight">Other Agencies in {stateName}</h2>
            <p className="other-agencies-subtitle">
              Explore additional agencies serving businesses across {stateName}.
            </p>
          </div>

          {loading ? (
            <div className="py-8">
              <p className="text-sm text-slate-500">Loading agencies...</p>
            </div>
          ) : (
            <div className={`other-agencies-content ${(isVisible || !!priorityAgencyId) ? 'animate-in' : ''}`}>
              <div className="other-agencies-search-container">
                <div className="other-agencies-search-wrapper">
                  <Search className="search-icon" size={20} />
                  <input
                    type="text"
                    className="other-agencies-search"
                    placeholder={`Search agencies in ${stateName}…`}
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                  />
                  {searchQuery && (
                    <button
                      className="search-clear-btn"
                      onClick={clearSearch}
                      aria-label="Clear search"
                    >
                      <X size={18} />
                    </button>
                  )}
                </div>
              </div>

              <section aria-label="Service Filters" className="service-filters-section">
                <p className="service-filters-label">
                  Click to filter agencies by service:
                </p>

                <div className="service-filters-chips-container">
                  <div className="service-filters-chips relative overflow-x-auto md:overflow-visible">
                    {primaryServices.map((service) => (
                      <button
                        key={service}
                        onClick={() => handleServiceClick(service)}
                        className={`service-chip ${selectedService === service ? 'active' : ''}`}
                        aria-pressed={selectedService === service}
                      >
                        {service}
                      </button>
                    ))}
                    {hasMoreServices && (
                      <button
                        onClick={toggleShowAllServices}
                        className="service-chip more-chip"
                        aria-expanded={showAllServices}
                      >
                        {showAllServices ? 'Show less' : 'More'}
                      </button>
                    )}

                    <div className="pointer-events-none absolute inset-y-0 right-0 w-10 bg-gradient-to-l from-white to-transparent flex items-center justify-end pr-1 md:hidden">
                      <ChevronRight className="h-4 w-4 text-indigo-500 animate-pulse-slow" aria-hidden="true" />
                    </div>
                  </div>
                </div>

                {showAllServices && additionalServices.length > 0 && (
                  <div className="service-filters-chips-container additional-services">
                    <div className="service-filters-chips">
                      {additionalServices.map((service) => (
                        <button
                          key={service}
                          onClick={() => handleServiceClick(service)}
                          className={`service-chip ${selectedService === service ? 'active' : ''}`}
                          aria-pressed={selectedService === service}
                        >
                          {service}
                        </button>
                      ))}
                    </div>
                  </div>
                )}

                {selectedService && (
                  <button
                    onClick={clearFilters}
                    className="clear-filters-btn"
                  >
                    Clear filters
                  </button>
                )}
              </section>

              {displayAgencies.length > 0 ? (
                <>
                  <div className="other-agencies-grid">
                    {displayAgencies.map((agency, index) => {
                      const isOwnerCard = ownerMode && !!ownerAgencyId && agency.id === ownerAgencyId;
                      const isHighlighted = effectiveHighlightedId === agency.id;

                      return (
                        <div
                          key={agency.id}
                          className={`other-agency-card-wrapper ${isVisible ? 'animate-in' : ''}`}
                          style={{ animationDelay: `${50 + index * 40}ms` }}
                        >
                          <OtherAgencyCard
                            agencyId={agency.id}
                            name={agency.name}
                            location={agency.location}
                            stateName={stateName}
                            stateSlug={stateSlug}
                            intro={agency.intro}
                            services={agency.services}
                            hasCardVisualUpgrade={agency.hasCardVisualUpgrade}
                            isPlaceholder={agency.isPlaceholder}
                            highlighted={isHighlighted}
                            ownerMode={ownerMode}
                            ownerPreviewStep={ownerPreviewStep}
                            isOwnerCard={isOwnerCard}
                            onOwnerCheckAvailability={onOwnerCheckAvailability}
                            onOpenStatepageAvailability={onOpenStatepageAvailability}
                            isPaidListing={agency.isPaidListing}
                          />
                        </div>
                      );
                    })}
                  </div>

                  {hasMore && (
                    <div className="flex justify-center mt-8">
                      <button
                        onClick={handleShowMore}
                        disabled={loadingMore}
                        className="inline-flex items-center gap-2 px-6 py-3 rounded-xl border border-slate-200 bg-white text-slate-700 text-sm font-medium shadow-sm hover:border-slate-300 hover:bg-slate-50 hover:shadow transition-all duration-150 disabled:opacity-60 disabled:cursor-not-allowed"
                      >
                        {loadingMore ? (
                          <>
                            <span className="inline-block w-4 h-4 border-2 border-slate-300 border-t-slate-600 rounded-full animate-spin" />
                            Loading…
                          </>
                        ) : (
                          <>
                            Show more agencies
                            {totalFromAPI !== null && totalFromAPI > 0 && (
                              <span className="text-slate-400 font-normal">
                                · {displayAgencies.length} of {totalFromAPI}
                              </span>
                            )}
                          </>
                        )}
                      </button>
                    </div>
                  )}
                </>
              ) : (
                <div className="py-8">
                  <p className="text-sm text-slate-500">
                    No agencies found for this state yet.
                  </p>
                </div>
              )}
            </div>
          )}
        </div>
      </section>

      {/* Toast notification */}
      {toast && (
        <div className="fixed bottom-6 left-1/2 -translate-x-1/2 z-50 bg-slate-900 text-white text-sm font-medium px-5 py-3 rounded-xl shadow-xl shadow-black/20 flex items-center gap-2 animate-fade-in">
          <span>{toast}</span>
        </div>
      )}
    </>
  );
}

export default OtherAgenciesSection;

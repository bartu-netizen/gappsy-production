import { useState, useEffect, useRef, useCallback } from 'react';
import { Search, X, ChevronRight, Building2, Users, ArrowLeft, CheckCircle, AlertCircle, Link2, Building, MapPin, Star, Loader2 } from 'lucide-react';
import { searchAgencies, getAgencyListings, trackYourAgencyEvent, type AgencyResult } from '../lib/yourAgencyApi';
import { US_STATES } from '../lib/usStates';
import { useCanonicalAgency } from '../hooks/useCanonicalAgency';
import { cleanAgencyDomain } from '../utils/urlNormalizer';
import { launchOwnerPreview } from '../utils/ownerMode';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';

type Step = 'intent' | 'search' | 'confirm';
type EntryMode = 'intent' | 'search' | 'direct-selected-agency';
type AgencyListingItem = NonNullable<AgencyResult['listings']>[0];

function resolveListings(agency: AgencyResult): AgencyListingItem[] {
  return (agency.listings ?? agency.states ?? []) as AgencyListingItem[];
}

interface SelectedAgency {
  result: AgencyResult;
  listing: AgencyListingItem | null;
  isOnNJ: boolean;
}

interface NJOwnerIntentModalProps {
  open: boolean;
  onClose: () => void;
  onReturnToTop25?: () => void;
  openedFromTop25Submission?: boolean;
  returnTo?: 'top25_submission_modal' | 'get_matched_modal' | 'find_agency_modal' | null;
  onReturnToOrigin?: () => void;
  onOpenFindAgency: () => void;
  onStartOwnerPreview: (agencyId: string, section: 'top25' | 'other', rank: number) => void;
  skipIntentStep?: boolean;
  preselectedAgency?: AgencyResult | null;
}

const NJ_SLUG = 'new-jersey';

function getStateNameFromSlug(slug: string): string {
  const state = US_STATES.find(s => s.slug === slug);
  return state ? state.name : slug;
}

function findBestListing(listings: AgencyListingItem[]): AgencyListingItem | null {
  if (!listings || listings.length === 0) return null;
  const top25 = listings.find(l => l.section === 'top25');
  return top25 || listings[0];
}

function useDebounce<T>(value: T, delay: number): T {
  const [debounced, setDebounced] = useState(value);
  useEffect(() => {
    const t = setTimeout(() => setDebounced(value), delay);
    return () => clearTimeout(t);
  }, [value, delay]);
  return debounced;
}

export default function NJOwnerIntentModal({
  open,
  onClose,
  onReturnToTop25,
  openedFromTop25Submission = false,
  returnTo = null,
  onReturnToOrigin,
  onOpenFindAgency,
  onStartOwnerPreview: _onStartOwnerPreview,
  skipIntentStep = false,
  preselectedAgency = null,
}: NJOwnerIntentModalProps) {
  const requestIdRef = useRef<string>('');
  const [entryMode, setEntryMode] = useState<EntryMode>('intent');
  const [isInitializing, setIsInitializing] = useState(false);
  const [step, setStep] = useState<Step>('intent');
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<AgencyResult[]>([]);
  const [searching, setSearching] = useState(false);
  const [selected, setSelected] = useState<SelectedAgency | null>(null);
  const [activeIdx, setActiveIdx] = useState(-1);
  const [idResolving, setIdResolving] = useState(false);
  const [idResolveFailed, setIdResolveFailed] = useState(false);
  const [searchError, setSearchError] = useState<string | null>(null);

  const { agency: selectedAgencyKpi } = useCanonicalAgency(selected?.result.agency_slug || undefined);

  const debouncedQuery = useDebounce(query, 250);
  const inputRef = useRef<HTMLInputElement>(null);
  const listRef = useRef<HTMLUListElement>(null);

  useEffect(() => {
    if (!open) {
      console.log('[NJOwnerIntentModal] modal closed - resetting all state');
      setIsInitializing(false);
      setEntryMode('intent');
      setStep('intent');
      setQuery('');
      setResults([]);
      setSelected(null);
      setActiveIdx(-1);
      setIdResolving(false);
      setIdResolveFailed(false);
      setSearchError(null);
    } else {
      const requestId = Math.random().toString(36).substring(7);
      requestIdRef.current = requestId;

      console.log('[NJOwnerIntentModal] init start open=true requestId=' + requestId + ' preselectedAgency=' + (preselectedAgency?.agency_id || 'null') + ' skipIntentStep=' + skipIntentStep + ' hostname=' + window.location.hostname + ' origin=' + window.location.origin);
      setIsInitializing(true);

      if (preselectedAgency) {
        console.log('[NJOwnerIntentModal] init: direct-selected-agency mode requestId=' + requestId);
        setEntryMode('direct-selected-agency');
        const bestListing = findBestListing(resolveListings(preselectedAgency));
        const isOnNJ = !!bestListing && bestListing.state_slug === NJ_SLUG;
        setSelected({ result: preselectedAgency, listing: bestListing, isOnNJ });
        setStep('confirm');
        if (!preselectedAgency.agency_id) {
          console.warn('[NJOwnerIntentModal] init: preselectedAgency has no agency_id — resolving via slug=' + preselectedAgency.agency_slug);
          setIdResolving(true);
          setIdResolveFailed(false);
          getAgencyListings({ agency_slug: preselectedAgency.agency_slug }).then(resolved => {
            if (requestIdRef.current !== requestId) return;
            if (resolved?.agency?.id) {
              console.log('[NJOwnerIntentModal] init: resolved agency_id=' + resolved.agency.id);
              setSelected(prev => {
                if (!prev) return null;
                return { ...prev, result: { ...prev.result, agency_id: resolved.agency.id } };
              });
              setIdResolving(false);
            } else {
              console.warn('[NJOwnerIntentModal] init: agency_id resolution failed for slug=' + preselectedAgency.agency_slug);
              setIdResolving(false);
              setIdResolveFailed(true);
            }
            setIsInitializing(false);
          }).catch(() => {
            if (requestIdRef.current !== requestId) return;
            setIdResolving(false);
            setIdResolveFailed(true);
            setIsInitializing(false);
          });
        } else {
          setIsInitializing(false);
        }
      } else if (skipIntentStep) {
        console.log('[NJOwnerIntentModal] init: search mode (skipIntentStep=true) requestId=' + requestId);
        setEntryMode('search');
        setStep('search');
        setIsInitializing(false);
      } else {
        console.log('[NJOwnerIntentModal] init: intent mode requestId=' + requestId);
        setEntryMode('intent');
        setStep('intent');
        setIsInitializing(false);
      }
    }
  }, [open, skipIntentStep, preselectedAgency]);

  useEffect(() => {
    if (step === 'search') {
      setTimeout(() => inputRef.current?.focus(), 80);
    }
  }, [step]);

  useEffect(() => {
    if (!debouncedQuery.trim()) {
      setResults([]);
      setSearching(false);
      setSearchError(null);
      return;
    }
    setSearching(true);
    setSearchError(null);
    console.log('[NJOwnerIntentModal] search query=' + debouncedQuery);
    searchAgencies(debouncedQuery, 8).then(r => {
      console.log('[NJOwnerIntentModal] search results=' + r.length + ' query=' + debouncedQuery);
      setResults(r);
      setSearching(false);
      setActiveIdx(-1);
      try {
        trackYourAgencyEvent({ event_name: 'nj_owner_search_submit', meta: { query: debouncedQuery } });
      } catch {}
    }).catch(err => {
      console.error('[NJOwnerIntentModal] search failed query=' + debouncedQuery, err);
      setSearching(false);
      setResults([]);
      setSearchError('Search failed. Please try again.');
    });
  }, [debouncedQuery]);

  const handleSelectAgency = useCallback((agency: AgencyResult) => {
    const listings = resolveListings(agency);
    const njListing = listings.find(l => l.state_slug === NJ_SLUG) ?? null;
    const isOnNJ = !!njListing;
    const hasId = !!agency.agency_id;
    console.log('[NJOwnerIntentModal] agency selected agencyId=' + (agency.agency_id ?? 'MISSING') + ' hasId=' + hasId + ' slug=' + agency.agency_slug + ' isOnNJ=' + isOnNJ + ' listings=' + listings.length);

    setIdResolving(!hasId);
    setIdResolveFailed(false);
    setSelected({ result: agency, listing: njListing, isOnNJ });
    setStep('confirm');

    if (!hasId) {
      console.log('[NJOwnerIntentModal] agency_id missing — resolving via slug=' + agency.agency_slug);
      getAgencyListings({ agency_slug: agency.agency_slug }).then(resolved => {
        if (resolved?.agency?.id) {
          console.log('[NJOwnerIntentModal] agency_id resolved=' + resolved.agency.id + ' for slug=' + agency.agency_slug);
          setSelected(prev => {
            if (!prev) return null;
            return { ...prev, result: { ...prev.result, agency_id: resolved.agency.id } };
          });
          setIdResolving(false);
          setIdResolveFailed(false);
        } else {
          console.warn('[NJOwnerIntentModal] agency_id resolution failed for slug=' + agency.agency_slug);
          setIdResolving(false);
          setIdResolveFailed(true);
        }
      }).catch(() => {
        console.warn('[NJOwnerIntentModal] agency_id resolution error for slug=' + agency.agency_slug);
        setIdResolving(false);
        setIdResolveFailed(true);
      });
    }

    try {
      trackYourAgencyEvent({
        event_name: 'nj_owner_search_select',
        agency_id: agency.agency_id,
        agency_slug: agency.agency_slug,
        state_slug: NJ_SLUG,
        meta: { is_on_nj: isOnNJ, had_id: hasId },
      });
    } catch {}
  }, []);

  const handleKeyDown = useCallback((e: React.KeyboardEvent<HTMLInputElement>) => {
    if (!results.length) return;
    if (e.key === 'ArrowDown') {
      e.preventDefault();
      setActiveIdx(i => Math.min(i + 1, results.length - 1));
    } else if (e.key === 'ArrowUp') {
      e.preventDefault();
      setActiveIdx(i => Math.max(i - 1, -1));
    } else if (e.key === 'Enter' && activeIdx >= 0) {
      e.preventDefault();
      handleSelectAgency(results[activeIdx]);
    }
  }, [results, activeIdx, handleSelectAgency]);

  const handleContinueSamePage = useCallback(() => {
    if (!selected || !selected.isOnNJ || !selected.listing) return;
    const agencyId = selected.result.agency_id;
    const section = (selected.listing.section === 'other' ? 'other' : 'top25') as 'top25' | 'other';
    const rank = selected.listing.rank ?? 1;

    if (!agencyId) {
      console.warn('[NJOwnerIntentModal] handleContinueSamePage: agency_id still missing at click, triggering re-resolve for slug=' + selected.result.agency_slug);
      setIdResolving(true);
      setIdResolveFailed(false);
      getAgencyListings({ agency_slug: selected.result.agency_slug }).then(resolved => {
        if (resolved?.agency?.id) {
          const resolvedId = resolved.agency.id;
          console.log('[NJOwnerIntentModal] re-resolve success id=' + resolvedId);
          setIdResolving(false);
          onClose();
          setTimeout(() => {
            launchOwnerPreview(resolvedId, section, rank, NJ_SLUG, NJ_SLUG);
          }, 60);
        } else {
          console.error('[NJOwnerIntentModal] re-resolve failed — cannot launch owner preview');
          setIdResolving(false);
          setIdResolveFailed(true);
        }
      }).catch(() => {
        console.error('[NJOwnerIntentModal] re-resolve error — cannot launch owner preview');
        setIdResolving(false);
        setIdResolveFailed(true);
      });
      return;
    }

    console.log('[NJOwnerIntentModal] continue same-page agencyId=' + agencyId + ' section=' + section + ' rank=' + rank);
    try {
      trackYourAgencyEvent({
        event_name: 'nj_owner_modal_continue_same_page',
        agency_id: agencyId,
        agency_slug: selected.result.agency_slug,
        state_slug: NJ_SLUG,
      });
    } catch {}
    onClose();
    setTimeout(() => {
      launchOwnerPreview(agencyId, section, rank, NJ_SLUG, NJ_SLUG);
      try {
        trackYourAgencyEvent({
          event_name: 'nj_owner_preview_started_same_page',
          agency_id: agencyId,
          state_slug: NJ_SLUG,
        });
      } catch {}
    }, 60);
  }, [selected, onClose]);

  const handleContinueCrossState = useCallback((listing: AgencyListingItem) => {
    if (!selected) return;
    const agencyId = selected.result.agency_id;
    const section = (listing.section === 'other' ? 'other' : 'top25') as 'top25' | 'other';
    const rank = listing.rank ?? 1;

    if (!agencyId) {
      console.warn('[NJOwnerIntentModal] handleContinueCrossState: agency_id still missing at click, triggering re-resolve for slug=' + selected.result.agency_slug);
      setIdResolving(true);
      setIdResolveFailed(false);
      getAgencyListings({ agency_slug: selected.result.agency_slug }).then(resolved => {
        if (resolved?.agency?.id) {
          const resolvedId = resolved.agency.id;
          console.log('[NJOwnerIntentModal] cross-state re-resolve success id=' + resolvedId);
          setIdResolving(false);
          onClose();
          setTimeout(() => {
            launchOwnerPreview(resolvedId, section, rank, listing.state_slug, NJ_SLUG);
          }, 80);
        } else {
          console.error('[NJOwnerIntentModal] cross-state re-resolve failed');
          setIdResolving(false);
          setIdResolveFailed(true);
        }
      }).catch(() => {
        console.error('[NJOwnerIntentModal] cross-state re-resolve error');
        setIdResolving(false);
        setIdResolveFailed(true);
      });
      return;
    }

    console.log('[NJOwnerIntentModal] continue cross-state agencyId=' + agencyId + ' targetState=' + listing.state_slug + ' section=' + section + ' rank=' + rank);
    try {
      trackYourAgencyEvent({
        event_name: 'nj_owner_modal_continue_cross_state',
        agency_id: agencyId,
        agency_slug: selected.result.agency_slug,
        target_state_slug: listing.state_slug,
        target_section: section,
      });
    } catch {}
    onClose();
    setTimeout(() => {
      launchOwnerPreview(agencyId, section, rank, listing.state_slug, NJ_SLUG);
    }, 80);
  }, [selected, onClose]);

  const handleHiringClick = useCallback(() => {
    try {
      trackYourAgencyEvent({ event_name: 'nj_owner_intent_hiring' });
    } catch {}
    onClose();
    setTimeout(() => onOpenFindAgency(), 80);
  }, [onClose, onOpenFindAgency]);

  const handleOwnerClick = useCallback(() => {
    try {
      trackYourAgencyEvent({ event_name: 'nj_owner_intent_owner' });
    } catch {}
    setStep('search');
  }, []);

  if (!open) return null;

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    e.preventDefault();
    e.stopPropagation();
  };

  console.log('[NJOwnerIntentModal] rendering entryMode=' + entryMode + ' step=' + step + ' isInitializing=' + isInitializing);

  return (
    <div
      className="fixed inset-0 z-[200] flex items-center justify-center bg-black/60 backdrop-blur-sm overflow-y-auto py-4 md:py-16"
      role="dialog"
      aria-modal="true"
      aria-label="Owner intent"
      onClick={handleBackdropClick}
    >
      <div
        className="absolute inset-0 bg-black/60 backdrop-blur-sm"
        onClick={handleBackdropClick}
        aria-hidden="true"
      />

      <div className="relative w-full max-w-md mx-4 bg-white rounded-2xl shadow-[0_8px_24px_rgba(0,0,0,0.06)] overflow-hidden flex flex-col max-h-[90dvh]">
        {isInitializing && entryMode === 'direct-selected-agency' && (
          <div className="p-8 flex flex-col items-center justify-center min-h-[200px]">
            <div className="animate-spin mb-4">
              <div className="w-8 h-8 border-3 border-slate-200 border-t-indigo-600 rounded-full" />
            </div>
            <p className="text-sm text-slate-600">Loading your listing…</p>
          </div>
        )}

        {!isInitializing && step === 'confirm' && (
          <div className="px-4 py-3 sm:px-6 sm:py-4 border-b border-slate-100 bg-white flex items-center justify-between">
            <button
              onClick={() => { setSelected(null); setStep('search'); }}
              className="flex items-center gap-1.5 text-sm text-slate-600 hover:text-slate-700 hover:bg-slate-100 transition px-3 py-1.5 rounded-lg border border-slate-200 focus-visible:ring-2 focus-visible:ring-slate-300 outline-none"
              aria-label="Search another agency"
            >
              <ArrowLeft size={14} />
              <span>Search another agency</span>
            </button>
            <button
              onClick={() => {
                if (returnTo && onReturnToOrigin) {
                  console.log('[NJOwnerIntentModal] X clicked in confirm step - returning to ' + returnTo);
                  onReturnToOrigin();
                } else if (openedFromTop25Submission && onReturnToTop25) {
                  console.log('[NJOwnerIntentModal] X clicked in confirm step from Top 25 Submission - returning to Top 25');
                  onReturnToTop25();
                } else {
                  console.log('[NJOwnerIntentModal] X clicked in confirm step from default path - closing');
                  onClose();
                }
              }}
              className="p-1.5 rounded-full text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition focus-visible:ring-2 focus-visible:ring-slate-300 outline-none"
              aria-label="Close"
            >
              <X size={18} />
            </button>
          </div>
        )}
        {step !== 'confirm' && (
          <button
            onClick={() => {
              if (returnTo && onReturnToOrigin) {
                console.log('[NJOwnerIntentModal] X clicked in ' + step + ' step - returning to ' + returnTo);
                onReturnToOrigin();
              } else if (openedFromTop25Submission && onReturnToTop25) {
                console.log('[NJOwnerIntentModal] X clicked in ' + step + ' step from Top 25 Submission - returning to Top 25');
                onReturnToTop25();
              } else {
                console.log('[NJOwnerIntentModal] X clicked in ' + step + ' step from default path - closing');
                onClose();
              }
            }}
            className="absolute top-3 right-3 z-10 p-1.5 rounded-full text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition focus-visible:ring-2 focus-visible:ring-slate-300 outline-none"
            aria-label="Close"
          >
            <X size={18} />
          </button>
        )}

        {!isInitializing && step === 'intent' && (
          <div className="p-4 sm:p-8">
            <h2 className="text-xl font-bold text-slate-900 mb-1 pr-6">
              What would you like to do?
            </h2>
            <p className="text-sm text-slate-500 mb-6">
              Choose the option that matches your goal on this page.
            </p>

            <div className="space-y-3">
              <button
                onClick={handleOwnerClick}
                className="w-full text-left rounded-xl border-2 border-slate-200 hover:border-blue-400 hover:bg-blue-50 transition p-4 group focus-visible:ring-2 focus-visible:ring-blue-400 outline-none"
              >
                <div className="flex items-start gap-3">
                  <div className="mt-0.5 flex-shrink-0 w-9 h-9 rounded-lg bg-blue-100 flex items-center justify-center text-blue-600 group-hover:bg-blue-200 transition">
                    <Building2 size={18} />
                  </div>
                  <div>
                    <div className="font-semibold text-slate-900 text-[15px]">I'm an agency owner</div>
                    <div className="text-[13px] text-slate-500 mt-0.5 leading-relaxed">
                      Check if your agency is listed and preview how it appears on this page.
                    </div>
                  </div>
                  <ChevronRight size={16} className="ml-auto mt-1 flex-shrink-0 text-slate-300 group-hover:text-blue-400 transition" />
                </div>
              </button>

              <button
                onClick={handleHiringClick}
                className="w-full text-left rounded-xl border-2 border-slate-200 hover:border-emerald-400 hover:bg-emerald-50 transition p-4 group focus-visible:ring-2 focus-visible:ring-emerald-400 outline-none"
              >
                <div className="flex items-start gap-3">
                  <div className="mt-0.5 flex-shrink-0 w-9 h-9 rounded-lg bg-emerald-100 flex items-center justify-center text-emerald-600 group-hover:bg-emerald-200 transition">
                    <Users size={18} />
                  </div>
                  <div>
                    <div className="font-semibold text-slate-900 text-[15px]">I'm hiring an agency</div>
                    <div className="text-[13px] text-slate-500 mt-0.5 leading-relaxed">
                      I just want to find an agency to hire.
                    </div>
                  </div>
                  <ChevronRight size={16} className="ml-auto mt-1 flex-shrink-0 text-slate-300 group-hover:text-emerald-400 transition" />
                </div>
              </button>
            </div>
          </div>
        )}

        {!isInitializing && step === 'search' && (
          <div className="flex flex-col overflow-hidden">
            <div className="px-4 pt-4 pb-3 sm:px-6 sm:pt-6 sm:pb-4 border-b border-slate-100">
              <button
                onClick={() => {
                  if (returnTo && onReturnToOrigin) {
                    console.log('[NJOwnerIntentModal] Back clicked in search step - returning to ' + returnTo);
                    onReturnToOrigin();
                  } else if (openedFromTop25Submission && onReturnToTop25) {
                    console.log('[NJOwnerIntentModal] Back clicked in search step from Top 25 Submission - returning to Top 25');
                    onReturnToTop25();
                  } else {
                    console.log('[NJOwnerIntentModal] Back clicked in search step from default path - going to intent');
                    setStep('intent');
                  }
                }}
                className="flex items-center gap-1.5 text-sm text-slate-400 hover:text-slate-700 transition mb-3 focus-visible:ring-2 focus-visible:ring-slate-300 outline-none rounded"
              >
                <ArrowLeft size={14} /> Back
              </button>
              <h2 className="text-xl font-bold text-slate-900 mb-1 pr-6">
                Find your agency
              </h2>
              <p className="text-sm text-slate-500 mb-4">
                Search for your agency name to find your listing.
              </p>
              <div className="relative">
                <Search size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none" />
                <input
                  ref={inputRef}
                  type="text"
                  value={query}
                  onChange={e => setQuery(e.target.value)}
                  onKeyDown={handleKeyDown}
                  placeholder="Search your agency name..."
                  className="w-full pl-9 pr-4 py-2.5 rounded-lg border border-slate-300 text-[15px] text-slate-900 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:border-transparent bg-white"
                  autoComplete="off"
                  spellCheck={false}
                />
                {searching && (
                  <span className="absolute right-3 top-1/2 -translate-y-1/2">
                    <svg className="animate-spin h-4 w-4 text-slate-400" viewBox="0 0 24 24" fill="none">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v4l3-3-3-3v4a8 8 0 00-8 8h4z" />
                    </svg>
                  </span>
                )}
              </div>
            </div>

            {searchError && (
              <div className="px-5 py-3 flex items-center gap-2 bg-red-50 border-b border-red-100 text-sm text-red-700">
                <AlertCircle size={14} className="flex-shrink-0" />
                {searchError}
              </div>
            )}

            <div className="overflow-y-auto flex-1 min-h-0">
              {results.length > 0 ? (
                <ul ref={listRef} className="py-2" role="listbox">
                  {results.map((agency, idx) => {
                    const agencyListings = resolveListings(agency);
                    const njListing = agencyListings.find(l => l.state_slug === NJ_SLUG);
                    const isActive = idx === activeIdx;
                    const displayDomain = cleanAgencyDomain(agency.agency_domain);
                    return (
                      <li key={agency.agency_id ?? idx} role="option" aria-selected={isActive}>
                        <button
                          onClick={() => handleSelectAgency(agency)}
                          className={`w-full text-left px-5 py-3 flex items-center gap-3 transition focus-visible:ring-2 focus-visible:ring-inset focus-visible:ring-blue-300 outline-none ${isActive ? 'bg-blue-50' : 'hover:bg-slate-50'}`}
                        >
                          <div className="flex-1 min-w-0">
                            <div className="font-medium text-[14px] text-slate-900 truncate">{agency.agency_name}</div>
                            {displayDomain ? (
                              <div className="text-[12px] text-slate-400 truncate">{displayDomain}</div>
                            ) : agencyListings.length > 0 && !njListing ? (
                              <div className="text-[12px] text-slate-400">
                                {agencyListings.length} state{agencyListings.length !== 1 ? 's' : ''}
                              </div>
                            ) : null}
                          </div>
                          {njListing ? (
                            njListing.section === 'top25' ? (
                              <span className="flex-shrink-0 inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full bg-amber-50 text-amber-700 border border-amber-200 whitespace-nowrap">
                                <Star className="w-2.5 h-2.5 fill-amber-500 text-amber-500 flex-shrink-0" />
                                {njListing.rank ? `Top 25 #${njListing.rank}` : 'Top 25'}
                              </span>
                            ) : (
                              <span className="flex-shrink-0 inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full bg-blue-50 text-blue-700 border border-blue-200 whitespace-nowrap">
                                <Building2 className="w-2.5 h-2.5 flex-shrink-0" />
                                New Jersey
                              </span>
                            )
                          ) : agencyListings.length > 0 ? (
                            <span className="flex-shrink-0 text-[11px] text-slate-400 whitespace-nowrap">
                              {agencyListings.length} state{agencyListings.length !== 1 ? 's' : ''}
                            </span>
                          ) : null}
                        </button>
                      </li>
                    );
                  })}
                </ul>
              ) : query.trim() && !searching ? (
                <div className="px-5 py-8 text-center text-sm text-slate-400">
                  No agencies found for "{query}"
                </div>
              ) : !query.trim() ? (
                <div className="px-5 py-8 text-center text-sm text-slate-400">
                  Type your agency name above to search
                </div>
              ) : null}
            </div>
          </div>
        )}

        {step === 'confirm' && selected && (
          <div className="flex flex-col overflow-hidden max-h-[calc(100vh-120px)]">
            <div className="px-4 py-2.5 sm:px-6 sm:py-5 overflow-y-auto flex-1 min-h-0">
              {selected.isOnNJ ? (
                <>
                  <div className="mb-5 sm:mb-6">
                    <div className="flex items-start gap-3 mb-3">
                      <div className="flex-shrink-0 w-9 h-9 rounded-full bg-emerald-100 flex items-center justify-center mt-0.5">
                        <CheckCircle size={20} className="text-emerald-600" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <h1 className="text-lg font-bold text-slate-900 leading-snug">
                          You're listed on this page
                        </h1>
                        <p className="text-[13px] text-slate-500 mt-1">
                          Preview how potential clients see your agency.
                        </p>
                      </div>
                    </div>
                  </div>

                  <div className="mb-4 sm:mb-5">
                    <div className="bg-slate-50 rounded-xl p-4 border border-slate-200">
                      <div className="font-semibold text-slate-900 text-[15px]">{selected.result.agency_name}</div>
                      {selected.listing && (
                        <div className="mt-2 flex items-center gap-2">
                          {selected.listing.section === 'top25' ? (
                            <span className="inline-flex items-center gap-1 text-[12px] font-semibold bg-amber-50 text-amber-700 border border-amber-200 rounded-full px-2.5 py-1">
                              <Star className="w-3 h-3 fill-amber-500 text-amber-500" />
                              {selected.listing.rank ? `Top 25 #${selected.listing.rank}` : 'Top 25'}
                            </span>
                          ) : (
                            <span className="inline-flex items-center gap-1 text-[12px] font-semibold bg-blue-50 text-blue-700 border border-blue-200 rounded-full px-2.5 py-1">
                              <Building2 className="w-3 h-3" />
                              Other Agencies
                            </span>
                          )}
                        </div>
                      )}
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-3 sm:gap-4 mb-5 sm:mb-6">
                    <div className="bg-white border border-slate-200 rounded-lg p-3 sm:p-4">
                      <div className="text-[11px] font-semibold text-slate-500 uppercase tracking-wide mb-2">Location</div>
                      <div className="text-[15px] font-semibold text-slate-900">New Jersey</div>
                    </div>
                    <div className="bg-white border border-slate-200 rounded-lg p-3 sm:p-4 flex flex-col">
                      <div className="text-[11px] font-semibold text-slate-500 uppercase tracking-wide mb-0.5">Availability checks</div>
                      <div className="text-[10px] text-slate-400 mb-2">(last 30 days)</div>
                      <div className="text-[15px] font-semibold text-emerald-600 mb-2">{normalizeDisplayedMissedCount(selectedAgencyKpi.missedCount)}</div>
                      <div className="text-[11px] text-slate-500 leading-relaxed">Times businesses clicked "Check availability"</div>
                    </div>
                  </div>
                </>
              ) : (
                <>
                  <div className="mb-3 sm:mb-6">
                    <div className="flex items-start gap-3">
                      <div className="flex-shrink-0 w-9 h-9 rounded-full bg-amber-100 flex items-center justify-center mt-0.5 flex-shrink-0">
                        <AlertCircle size={20} className="text-amber-600" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <h1 className="text-lg sm:text-lg font-bold text-slate-900 sm:leading-snug leading-tight">
                          Not listed on this page
                        </h1>
                        <p className="text-[13px] text-slate-500 mt-0.5 sm:mt-1" style={{ lineHeight: '1.4' }}>
                          {resolveListings(selected.result).length > 0
                            ? `We found ${selected.result.agency_name} listed on another state page.`
                            : 'This agency is not yet on the Gappsy network.'}
                        </p>
                      </div>
                    </div>
                  </div>

                  {resolveListings(selected.result).length > 0 ? (
                    <>
                      <div className="mb-3 sm:mb-6">
                        <div className="rounded-xl p-3 sm:p-5 border border-slate-200 bg-white">
                          <div className="flex gap-2.5 sm:gap-3">
                            <div className="flex-shrink-0 w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center">
                              <Building size={20} className="text-blue-600" />
                            </div>
                            <div className="flex-1 min-w-0">
                              <div className="font-semibold text-slate-900 text-[15px]">{selected.result.agency_name}</div>
                              {cleanAgencyDomain(selected.result.agency_domain) && (
                                <div className="flex items-center gap-2 mt-1 mb-1 sm:mt-1.5 sm:mb-1.5 text-[13px] text-slate-600">
                                  <Link2 size={12} className="flex-shrink-0 text-slate-400" />
                                  <span className="truncate">{cleanAgencyDomain(selected.result.agency_domain)}</span>
                                </div>
                              )}
                              {(() => {
                                const bestListing = findBestListing(resolveListings(selected.result));
                                if (!bestListing) return null;
                                const stateName = getStateNameFromSlug(bestListing.state_slug);
                                return (
                                  <div className="flex items-center gap-1.5 text-[13px] text-slate-500">
                                    <MapPin size={12} className="flex-shrink-0 text-slate-400" />
                                    <span>Listed on the {stateName} page</span>
                                  </div>
                                );
                              })()}
                            </div>
                          </div>
                        </div>
                      </div>

                      <div className="mb-3 sm:mb-6">
                        <div className="rounded-xl p-3 sm:p-6 border border-slate-200 bg-white">
                          <div className="text-[11px] font-semibold text-slate-500 uppercase tracking-wider mb-3 sm:mb-4">Your listing insights</div>
                          <div className="mb-3 sm:mb-4">
                            <div className="text-[32px] font-bold text-emerald-600 leading-none mb-1.5">{normalizeDisplayedMissedCount(selectedAgencyKpi.missedCount)}</div>
                            <div className="flex items-center gap-2 text-[13px] text-slate-600 font-medium">
                              availability checks
                              <span className="text-[12px] text-emerald-600 font-normal">• Last 30 days</span>
                            </div>
                          </div>
                          <div className="text-[13px] text-slate-600" style={{ lineHeight: '1.4' }}>
                            Businesses clicked "Check availability" on your listing — they're checking whether you're available for new projects.
                          </div>
                        </div>
                      </div>

                      {resolveListings(selected.result).length > 1 && (
                        <div className="mb-5 sm:mb-6 p-3 bg-slate-50 rounded-lg border border-slate-200">
                          <p className="text-[12px] font-semibold text-slate-600 uppercase tracking-wide mb-2.5">Also listed in:</p>
                          <div className="space-y-1.5">
                            {resolveListings(selected.result).map((listing, idx) => {
                              const bestListing = findBestListing(resolveListings(selected.result));
                              if (listing.state_slug === bestListing?.state_slug) return null;
                              const name = getStateNameFromSlug(listing.state_slug);
                              return (
                                <button
                                  key={`${listing.state_slug}-${idx}`}
                                  onClick={() => handleContinueCrossState(listing)}
                                  disabled={idResolving}
                                  className="w-full text-left text-[13px] text-slate-600 hover:text-blue-600 disabled:opacity-50 disabled:cursor-not-allowed transition focus-visible:ring-2 focus-visible:ring-blue-300 outline-none rounded px-2 py-1.5 hover:bg-white"
                                >
                                  {name} →
                                </button>
                              );
                            })}
                          </div>
                        </div>
                      )}
                    </>
                  ) : null}
                </>
              )}
            </div>

            <div className="px-4 py-2 sm:px-6 sm:py-4 border-t border-slate-100 bg-white">
              {idResolveFailed ? (
                <div className="flex items-center gap-2 py-2.5 px-3 rounded-lg bg-red-50 border border-red-200 text-red-700 text-[13px]">
                  <AlertCircle size={15} className="flex-shrink-0" />
                  <span>Could not verify this agency's listing. Try searching again or contact support.</span>
                </div>
              ) : selected.isOnNJ ? (
                <>
                  <div className="text-[12px] text-slate-500 mb-2 sm:mb-3 text-center">
                    See how your listing appears to potential clients.
                  </div>
                  <button
                    onClick={handleContinueSamePage}
                    disabled={idResolving}
                    className="w-full py-2.5 sm:py-3 px-4 sm:px-5 rounded-lg bg-blue-600 hover:bg-blue-700 active:bg-blue-800 disabled:opacity-60 disabled:cursor-not-allowed text-white font-semibold text-[15px] transition-all duration-200 flex items-center justify-center gap-2 focus-visible:ring-2 focus-visible:ring-blue-400 outline-none group hover:shadow-sm hover:shadow-blue-500/20"
                  >
                    {idResolving ? (
                      <>
                        <Loader2 size={16} className="animate-spin" />
                        Verifying listing…
                      </>
                    ) : (
                      <>
                        See my listing in New Jersey
                        <ChevronRight size={16} className="group-hover:translate-x-0.5 transition-transform" />
                      </>
                    )}
                  </button>
                </>
              ) : resolveListings(selected.result).length > 0 ? (
                (() => {
                  const bestListing = findBestListing(resolveListings(selected.result));
                  if (!bestListing) return null;
                  const stateName = getStateNameFromSlug(bestListing.state_slug);
                  return (
                    <>
                      <div className="text-[12px] text-slate-500 mb-2 sm:mb-3 text-center">
                        See how your listing appears to potential clients.
                      </div>
                      <button
                        onClick={() => handleContinueCrossState(bestListing)}
                        disabled={idResolving}
                        className="w-full py-2.5 sm:py-3 px-4 sm:px-5 rounded-lg bg-blue-600 hover:bg-blue-700 active:bg-blue-800 disabled:opacity-60 disabled:cursor-not-allowed text-white font-semibold text-[15px] transition-all duration-200 flex items-center justify-center gap-2 focus-visible:ring-2 focus-visible:ring-blue-400 outline-none group hover:shadow-sm hover:shadow-blue-500/20"
                      >
                        {idResolving ? (
                          <>
                            <Loader2 size={16} className="animate-spin" />
                            Verifying listing…
                          </>
                        ) : (
                          <>
                            View my listing in {stateName}
                            <ChevronRight size={16} className="group-hover:translate-x-0.5 transition-transform" />
                          </>
                        )}
                      </button>
                    </>
                  );
                })()
              ) : null}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

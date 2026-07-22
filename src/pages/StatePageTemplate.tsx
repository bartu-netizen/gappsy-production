import { useState, useEffect, useRef, useCallback, lazy, Suspense } from 'react';
import { useParams, Link, useLocation, useNavigate } from 'react-router-dom';
import { ArrowRight, X } from 'lucide-react';
import { getStateAbbr, isValidStateSlug, getStateName } from '../utils/stateUtils';
import { formatStateName } from '../utils/formatLocation';
import { getUpdatedLabelWithOffsetDays } from '../utils/timeUtils';
import { ensureAgencyServices, validateAgency } from '../utils/serviceGenerator';
import { getIntroVariants } from '../utils/descriptionSplitter';
import { supabase } from '../lib/supabase';
import { getLegacyStateData, isPlaceholderSlot } from '../lib/legacyStateData';
import { isPaidSlot } from '../lib/top25Slots';
import { resolveStateByUrl } from '../utils/stateRouting';
import { buildStateCanonicalUrl } from '../utils/canonicalUrl';
import { getStateSeo, extractStateSlugFromPath } from '../utils/seoHelper';
import { parseOwnerHash, resolveOwnerAgency, buildOwnerPreviewHash } from '../utils/ownerMode';
import { scrollToAgencyWithRetry, scrollToOwnerCardNative } from '../utils/ownerHighlight';
import { getFsid, logFunnelEvent, FUNNEL_EVENTS } from '../utils/yourAgencyFunnel';
import { buildActivationDirectLink } from '../utils/activationDirectLink';

import Top25Header from '../components/Top25Header';
import FooterWrapper from '../components/FooterWrapper';
import SEOTags from '../components/SEOTags';
import SEODebugOverlay from '../components/SEODebugOverlay';
import NoSnippetVerifier from '../components/NoSnippetVerifier';
import OwnerUpsellDashboard from '../components/OwnerUpsellDashboard';
import ErrorBoundary from '../components/ErrorBoundary';
import ThreeColumnLayout from '../components/ThreeColumnLayout';
import OwnerStickyBar, { type OwnerPreviewStep } from '../components/OwnerStickyBar';
import OwnerPreviewIntro from '../components/OwnerPreviewIntro';
import { OwnerBannerProvider } from '../contexts/OwnerBannerContext';
import LazyLoad from '../components/LazyLoad';
import OtherAgenciesSection from '../components/OtherAgenciesSection';

import NewJerseyAgencyGrid from '../NewJerseyAgencyGrid';
import AvailabilityModal from '../AvailabilityModal';

// Owner bar height for offsetting Top25Header when owner mode is active
const OWNER_BAR_TOP_OFFSET_DESKTOP = 96; // md: ~84px + padding
const OWNER_BAR_TOP_OFFSET_MOBILE = 80; // ~72px + padding

const NewJerseyFAQ = lazy(() => import('../NewJerseyFAQ'));
const ExploreOtherStates = lazy(() => import('../components/ExploreOtherStates'));
const SubmitAgencyModal = lazy(() => import('../SubmitAgencyModal'));
const FeaturedSpotlightModal = lazy(() => import('../FeaturedSpotlightModal'));
const GetMatchedModal = lazy(() => import('../GetMatchedModal'));
const StatePageAvailabilityHost = lazy(() => import('../components/StatePageAvailabilityHost'));
const NJOwnerIntentModal = lazy(() => import('../components/NJOwnerIntentModal'));

interface Agency {
  rank: number;
  name: string;
  website: string;
  phone?: string;
  city: string;
  state: string;
  description?: string;
  services?: string[];
  employees?: string;
  hourlyRate?: string;
  minProjectSize?: string;
  founded?: number;
  logoUrl?: string;
}

interface FAQ {
  question: string;
  answer: string;
}

interface StateData {
  state_name?: string;
  state_slug?: string;
  stateName?: string;
  state?: string;
  seo?: {
    title: string;
    meta_description: string;
    canonical_url: string;
    og_title?: string;
    og_description?: string;
    og_image?: string;
    og_url?: string;
    twitter_title?: string;
    twitter_description?: string;
    twitter_image?: string;
  };
  state_intro_short?: string;
  state_intro_full?: string;
  state_description_full?: string;
  hero_intro?: string;
  hero_intro_short?: string;
  agencies: Agency[];
  faqs?: FAQ[];
}

interface StatePageTemplateProps {
  stateSlugOverride?: string;
}

// Helper: Deduplicate FAQs based on normalized question
function dedupeFaqs(faqs: FAQ[]): FAQ[] {
  if (!faqs || faqs.length === 0) return [];

  const seen = new Set<string>();
  const unique: FAQ[] = [];

  for (const faq of faqs) {
    // Normalize question: trim, lowercase, collapse multiple spaces
    const normalized = faq.question
      .trim()
      .toLowerCase()
      .replace(/\s+/g, ' ');

    if (!seen.has(normalized)) {
      seen.add(normalized);
      unique.push(faq);
    }
  }

  return unique;
}

export default function StatePageTemplate({ stateSlugOverride }: StatePageTemplateProps) {
  const navigate = useNavigate();
  const location = useLocation();
  const params = useParams<{ stateSlug: string }>();
  const paramSlug = params.stateSlug;

  // CRITICAL: Extract state slug SYNCHRONOUSLY for immediate SEO
  // This ensures SEO Boost prerenderer captures metadata BEFORE async data loads
  const immediateSlug = stateSlugOverride || paramSlug || extractStateSlugFromPath(location.pathname);

  // Get SEO metadata IMMEDIATELY (synchronous, no async calls)
  // This is the ONLY source of truth for <head> tags during prerender
  const seoData = immediateSlug ? getStateSeo(immediateSlug) : null;

  const [resolvedSlug, setResolvedSlug] = useState<string | null>(immediateSlug);
  const [stateData, setStateData] = useState<StateData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [debugInfo, setDebugInfo] = useState<any>(null);

  // Resolve state slug from URL using database lookup (SEO-safe routing)
  // This is now ONLY for content loading, not SEO
  useEffect(() => {
    async function resolveSlug() {
      if (stateSlugOverride) {
        setResolvedSlug(stateSlugOverride);
        return;
      }

      if (paramSlug) {
        setResolvedSlug(paramSlug);
        return;
      }

      // Database lookup for canonical URL
      const pathname = location.pathname;
      console.log('[StatePageTemplate] Resolving state from URL:', pathname);

      const stateInfo = await resolveStateByUrl(pathname);
      if (stateInfo) {
        console.log('[StatePageTemplate] ✅ Resolved to state:', stateInfo.stateSlug);
        setResolvedSlug(stateInfo.stateSlug);
      } else {
        console.error('[StatePageTemplate] ❌ No state found for URL:', pathname);
        setError(`Page not found: ${pathname}`);
        setLoading(false);
      }
    }

    // Only resolve if we don't already have immediateSlug
    if (!immediateSlug) {
      resolveSlug();
    }
  }, [stateSlugOverride, paramSlug, location.pathname, immediateSlug]);

  const [isSubmitAgencyModalOpen, setIsSubmitAgencyModalOpen] = useState(false);
  const [isFeaturedModalOpen, setIsFeaturedModalOpen] = useState(false);
  const [isMatchingModalOpen, setIsMatchingModalOpen] = useState(false);
  const [isNJOwnerIntentOpen, setIsNJOwnerIntentOpen] = useState(false);
  const [skipNJOwnerIntentStep, setSkipNJOwnerIntentStep] = useState(false);
  const [preselectedNJAgency, setPreselectedNJAgency] = useState<any>(null);
  const [njOwnerIntentOrigin, setNjOwnerIntentOrigin] = useState<'top25_submission' | 'get_matched_modal' | 'default' | null>(null);
  const [submitAgencyFormState, setSubmitAgencyFormState] = useState<any>(null);
  const [matchedAgencyFormState, setMatchedAgencyFormState] = useState<any>(null);
  const [isIntroExpanded, setIsIntroExpanded] = useState(false);

  const [statepageAvailabilityAgencyId, setStatepageAvailabilityAgencyId] = useState<string | null>(null);
  const [statepageAvailabilityDirectClient, setStatepageAvailabilityDirectClient] = useState(false);
  const [statepageAvailabilitySource, setStatepageAvailabilitySource] = useState<'other' | 'top25'>('other');

  // Owner mode (hash-based)
  const [ownerMode, setOwnerMode] = useState(false);
  const [ownerPreviewStep, setOwnerPreviewStep] = useState<OwnerPreviewStep>(1);
  const [ownerAgencyId, setOwnerAgencyId] = useState<string | null>(null);
  const [ownerAgencyName, setOwnerAgencyName] = useState<string>('');
  const [ownerAgencySlug, setOwnerAgencySlug] = useState<string | null>(null);
  const [ownerAgencyRank, setOwnerAgencyRank] = useState<number | undefined>();
  const [ownerAgencySection, setOwnerAgencySection] = useState<'top25' | 'other'>('top25');
  const [ownerAgencyNotFound, setOwnerAgencyNotFound] = useState(false);
  const [ownerLoading, setOwnerLoading] = useState(false);
  const [ownerWrongState, setOwnerWrongState] = useState(false);
  const [ownerCorrectStateSlug, setOwnerCorrectStateSlug] = useState<string | null>(null);
  // Demo availability modal (opened in Step 2 -> Step 3 transition)
  const [isDemoAvailabilityOpen, setIsDemoAvailabilityOpen] = useState(false);
  // Countdown state from NewJerseyAgencyGrid (for banner display)
  const [ownerCountdownSeconds, setOwnerCountdownSeconds] = useState<number | null>(null);
  // Step 4 countdown state reported back from AvailabilityModal
  const [ownerStep4Seconds, setOwnerStep4Seconds] = useState(3);
  const [ownerStep4CtaVisible, setOwnerStep4CtaVisible] = useState(false);
  const [ownerCardReadyForCountdown, setOwnerCardReadyForCountdown] = useState(false);
  const [ownerIsPaidListing, setOwnerIsPaidListing] = useState(false);
  // True when the owner's listing card is confirmed rendered in the DOM and ready to scroll to
  const [ownerCardReady, setOwnerCardReady] = useState(false);
  // True once section+rank are known from hash params — prevents false notFound state
  const [ownerHashHasLocation, setOwnerHashHasLocation] = useState(false);

  // Highlight state management (React-driven, not DOM-driven)
  const [highlightAgencyId, setHighlightAgencyId] = useState<string | null>(null);
  const [highlightNonce, setHighlightNonce] = useState(0);
  const highlightTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const statePageViewedRef = useRef<string | null>(null);
  // Owner-preview Step 2 → Step 3 auto-open: single source of truth
  const ownerAutoOpenTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const ownerScrollSettleTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const ownerAutoOpenStartedRef = useRef(false);
  const hasStartedAvailabilityFlowRef = useRef(false);

  // Persistent highlight for Top-25 summary clicks — no auto-clear timer
  const [summaryHighlightAgencyId, setSummaryHighlightAgencyId] = useState<string | null>(null);
  const [summaryHighlightNonce, setSummaryHighlightNonce] = useState(0);

  // Effective highlight: summary takes precedence when set, otherwise owner-mode highlight
  const effectiveHighlightAgencyId = summaryHighlightAgencyId ?? highlightAgencyId;
  const effectiveHighlightNonce = summaryHighlightAgencyId ? summaryHighlightNonce : highlightNonce;

  const triggerHighlight = useCallback((agencyId: string) => {
    if (highlightTimerRef.current) clearTimeout(highlightTimerRef.current);
    setHighlightAgencyId(null);
    requestAnimationFrame(() => {
      setHighlightAgencyId(agencyId);
      setHighlightNonce(n => n + 1);
      highlightTimerRef.current = setTimeout(() => {
        setHighlightAgencyId(null);
      }, 10000);
    });
  }, []);

  const handleOwnerCardReady = useCallback(() => {
    // The owner card being confirmed at index 0 only signals the card is
    // mounted/scrollable — it must NOT arm the Step 2 → Step 3 auto-open
    // timer. The timer is started centrally in handleScrollToListing.onFound
    // AFTER smooth scroll completes and the highlight is visible.
    setOwnerCardReady(true);
  }, []);

  const handleNJOwnerPreviewStart = useCallback((agencyId: string, section: 'top25' | 'other', rank: number) => {
    const canonicalHash = buildOwnerPreviewHash(agencyId, section, rank);
    history.replaceState(
      null,
      '',
      window.location.pathname + window.location.search + canonicalHash
    );
    setOwnerMode(true);
    setOwnerPreviewStep(1);
    setOwnerAgencyId(agencyId);
    setOwnerAgencySection(section);
    setOwnerAgencyRank(rank);
    setOwnerAgencyNotFound(false);
    setOwnerWrongState(false);
    setOwnerLoading(false);
    setOwnerHashHasLocation(true);
    setOwnerCardReadyForCountdown(false);
    // No auto-scroll or auto-highlight here.
    // The user must click "Scroll to my listing" to begin the reveal sequence.
  }, []);

  useEffect(() => {
    const onHashChange = () => {
      const hashParams = parseOwnerHash();
      if (hashParams.owner === '1' && hashParams.agency && hashParams.section && hashParams.rank !== null) {
        handleNJOwnerPreviewStart(hashParams.agency, hashParams.section, hashParams.rank);
      }
    };
    window.addEventListener('hashchange', onHashChange);
    return () => window.removeEventListener('hashchange', onHashChange);
  }, [handleNJOwnerPreviewStart]);

  const handleSubmitAgencyExistingAgencySelected = useCallback((agencyMatch: any, formState?: any) => {
    const requestId = Math.random().toString(36).substring(7);
    if (!agencyMatch) {
      console.log('[StatePageTemplate][NJ] owner modal open requested entryMode=search requestId=' + requestId);
      console.log('[StatePageTemplate][NJ] Setting origin to top25_submission and storing formState');
      setIsSubmitAgencyModalOpen(false);
      setSkipNJOwnerIntentStep(true);
      setPreselectedNJAgency(null);
      setNjOwnerIntentOrigin('top25_submission');
      setSubmitAgencyFormState(formState || null);
      setIsNJOwnerIntentOpen(true);
    } else {
      console.log('[StatePageTemplate][NJ] owner modal open requested entryMode=direct-selected-agency requestId=' + requestId + ' agencyId=' + agencyMatch.agency_id);
      console.log('[StatePageTemplate][NJ] preselectedAgency=' + agencyMatch.agency_id);
      setIsSubmitAgencyModalOpen(false);
      setSkipNJOwnerIntentStep(true);
      setPreselectedNJAgency(agencyMatch);
      setNjOwnerIntentOrigin('top25_submission');
      setSubmitAgencyFormState(formState || null);
      setIsNJOwnerIntentOpen(true);
    }
  }, []);

  const handleSummaryAgencyClick = useCallback((anchorId: string, agency: { id?: string; slug?: string; name: string }) => {
    const agencyId = agency.id;
    if (import.meta.env.DEV) {
      console.log('[Top25Summary][Click]', {
        anchorId,
        agencyName: agency.name,
        agencyId,
        agencySlug: agency.slug,
        hasId: !!agencyId,
        state: resolvedSlug,
      });
    }
    if (agencyId) {
      if (import.meta.env.DEV) {
        console.log('[Top25Summary][Highlight Applied] Using ID:', agencyId);
      }
      setSummaryHighlightAgencyId(agencyId);
      setSummaryHighlightNonce(n => n + 1);
      scrollToAgencyWithRetry(agencyId, { maxRetries: 30, retryIntervalMs: 80 });
    } else {
      // No id — fall back to DOM scroll by anchorId
      if (import.meta.env.DEV) {
        console.log('[Top25Summary][Fallback] Using DOM scroll with anchorId:', anchorId);
      }
      setSummaryHighlightAgencyId(null);
      const el = document.getElementById(anchorId);
      if (el) {
        const offset = 96;
        const top = el.getBoundingClientRect().top + window.scrollY - offset;
        window.scrollTo({ top: Math.max(0, top), behavior: 'smooth' });
      }
    }
  }, [resolvedSlug]);

  // Deep-link hash highlight: if page loads with #agency-<id> and it's not an owner hash,
  // apply the persistent summary highlight to that card.
  useEffect(() => {
    if (!stateData) return;
    const hash = window.location.hash;
    if (!hash || hash.includes('owner=')) return;

    const rawAnchor = hash.replace(/^#/, '');
    // Match #agency-<uuid-or-slug> style anchors from Top25Summary
    const match = rawAnchor.match(/^agency-(.+)$/);
    if (!match) return;

    const idOrSlug = match[1];
    const agency = stateData.agencies.find(
      (a: any) => a.id === idOrSlug || a.slug === idOrSlug
    );
    if (agency && (agency as any).id) {
      const agencyId = (agency as any).id as string;
      setSummaryHighlightAgencyId(agencyId);
      setSummaryHighlightNonce(n => n + 1);
      scrollToAgencyWithRetry(agencyId, { maxRetries: 30, retryIntervalMs: 80 });
    }
  }, [stateData]);

  // Check for ?debug=1 and ?seoDebug=1 query params
  const [showDebug, setShowDebug] = useState(false);
  const [showSeoDebug, setShowSeoDebug] = useState(false);
  useEffect(() => {
    const urlParams = new URLSearchParams(window.location.search);
    setShowDebug(urlParams.get('debug') === '1');
    setShowSeoDebug(urlParams.get('seoDebug') === '1');
  }, []);

  // Parse hash for owner mode (#owner=1&agency=<UUID>&section=other&rank=N)
  const showOwnerDebug = showDebug;
  useEffect(() => {
    const hashParams = parseOwnerHash();
    const isOwner = hashParams.owner === '1';
    const agencyId = hashParams.agency;

    if (isOwner && agencyId) {
      setOwnerMode(true);
      setOwnerPreviewStep(1);
      setOwnerAgencyId(agencyId);
      setOwnerLoading(true);
      setOwnerCardReadyForCountdown(false);
      clearOwnerAutoOpenTimers();
      ownerAutoOpenStartedRef.current = false;
      hasStartedAvailabilityFlowRef.current = false;

      // If the hash already tells us the section, set it immediately so
      // OtherAgenciesSection receives owner-preview props before the
      // resolver runs (which currently passes [] for other agencies).
      if (hashParams.section === 'other') {
        setOwnerAgencySection('other');
        if (hashParams.rank !== null) {
          setOwnerAgencyRank(hashParams.rank);
          setOwnerHashHasLocation(true);
        }
      } else if (hashParams.section === 'top25') {
        setOwnerAgencySection('top25');
        if (hashParams.rank !== null) {
          setOwnerAgencyRank(hashParams.rank);
          setOwnerHashHasLocation(true);
        }
      }

      if (showOwnerDebug) console.log('[OwnerMode] Parsed from hash:', { agencyId, section: hashParams.section, rank: hashParams.rank });
      if (!statePageViewedRef.current || statePageViewedRef.current !== agencyId) {
        statePageViewedRef.current = agencyId;
        logFunnelEvent({
          ...FUNNEL_EVENTS.STATE_PAGE_VIEWED,
          agency_id: agencyId,
          state_slug: immediateSlug ?? undefined,
        });
      }
    } else {
      setOwnerMode(false);
      setOwnerAgencyId(null);
      setOwnerLoading(false);
    }
  }, [showOwnerDebug, immediateSlug]);

  // Step 4 dynamic escalation timer
  useEffect(() => {
    if (ownerPreviewStep !== 4) {
      setOwnerStep4Seconds(0);
      return;
    }

    const intervalId = setInterval(() => {
      setOwnerStep4Seconds(prev => prev + 1);
    }, 1000);

    return () => clearInterval(intervalId);
  }, [ownerPreviewStep]);

  useEffect(() => {
    const handleOpenGetMatched = () => setIsMatchingModalOpen(true);
    const handleOpenSubmitAgency = () => setIsSubmitAgencyModalOpen(true);

    window.addEventListener('openGetMatchedForm', handleOpenGetMatched);
    window.addEventListener('openSubmitAgencyForm', handleOpenSubmitAgency);

    return () => {
      window.removeEventListener('openGetMatchedForm', handleOpenGetMatched);
      window.removeEventListener('openSubmitAgencyForm', handleOpenSubmitAgency);
    };
  }, []);

  // Auto-open the Submit Agency modal when arriving via ?submit=1 — used by
  // the /get-listed intermediate page's state picker to drop a visitor
  // straight into this state's Top 25 submission flow.
  useEffect(() => {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('submit') === '1') {
      setIsSubmitAgencyModalOpen(true);
    }
  }, []);

  useEffect(() => {
    async function loadStateData() {
      // Wait for slug resolution
      if (!resolvedSlug) {
        return;
      }

      if (!isValidStateSlug(resolvedSlug)) {
        console.error('Invalid state slug:', resolvedSlug);
        setError(`Invalid state: ${resolvedSlug}`);
        setLoading(false);
        return;
      }

      const stateSlug = resolvedSlug;

      // Reset error state when loading new data
      setError(null);

      try {
        const normalizedStateName = getStateName(stateSlug) || formatStateName(stateSlug);
        const debug: any = { stateSlug, normalizedStateName };

        // Try loading legacy data first (for New Jersey)
        const legacyData = await getLegacyStateData(stateSlug);

        if (legacyData) {
          console.log('🟢 Loading state data from LEGACY JSON for:', stateSlug);
          debug.source = 'legacy';

          // Query ALL editable DB fields for NJ so admin editor changes reflect on live page
          const { data: dbSlots } = await supabase
            .from('top25_slots')
            .select('rank, agency_id, agency_name, website, logo_url, description, short_description, services, is_paid, show_lightning')
            .eq('state_slug', stateSlug)
            .order('rank', { ascending: true });

          const dbSlotMap = new Map<number, any>();
          dbSlots?.forEach(slot => {
            dbSlotMap.set(slot.rank, slot);
          });

          // NJ: DB fields override legacy JSON — editor changes are immediately live
          const agencies = legacyData.agencies
            .filter((agency: any) => agency.rank >= 1 && agency.rank <= 25)
            .map((agency: any) => {
              const db = dbSlotMap.get(agency.rank);

              // DB overrides JSON for all editor-controlled fields
              const name = db?.agency_name || agency.name;
              const website = db?.website || agency.website || agency.websiteUrl || '';
              const rawServices = db?.services || agency.services;
              const services = ensureAgencyServices(rawServices);

              const legacyFullDesc = agency.fullDescription || agency.description || '';
              const fullDesc = db?.description || legacyFullDesc;
              const shortDesc = db?.short_description || agency.shortDescription || (fullDesc.length > 150 ? fullDesc.substring(0, 150).trim() + '...' : fullDesc);

              // Logo: DB takes priority over JSON
              let logoUrl = '';
              if (db?.logo_url) {
                logoUrl = db.logo_url;
              } else if (agency.logo && typeof agency.logo === 'object' && agency.logo.localPath) {
                logoUrl = `/logos/${agency.logo.localPath}`;
              } else if (agency.logoUrl) {
                logoUrl = agency.logoUrl;
              }

              const isPaid = db ? isPaidSlot({ rank: agency.rank, is_paid: !!db.is_paid }) : isPaidSlot({ rank: agency.rank, is_paid: !!agency.isPaid });

              // CRITICAL: Ensure every agency has a stable ID for highlight matching
              // Use agency_id from DB if available, otherwise generate from rank
              // This ID must match data-agency-id in the rendered card for highlighting to work
              const agencyId = db?.agency_id || `nj-rank-${agency.rank}`;

              if (import.meta.env.DEV) {
                if (!db?.agency_id) {
                  console.log(`[NJ Agency ${agency.rank}] No agency_id in DB, using fallback: ${agencyId}`, {
                    dbSlotFound: !!db,
                    dbAgencyId: db?.agency_id,
                    name,
                  });
                }
              }

              return {
                rank: agency.rank,
                name,
                website,
                logoUrl,
                description: fullDesc,
                shortDescription: shortDesc,
                fullDescription: fullDesc,
                services,
                isPaid,
                show_lightning: db?.show_lightning ?? false,
                city: agency.city || '',
                state: normalizedStateName,
                id: agencyId
              };
            })
            .sort((a, b) => a.rank - b.rank);

          debug.validAgencies = agencies.length;
          debug.paidAgencies = agencies.filter(a => a.isPaid).length;
          debug.unpaidAgencies = agencies.filter(a => !a.isPaid).length;

          // Build state data with legacy agencies
          const normalizedData: StateData = {
            state_name: legacyData.stateName || normalizedStateName,
            state_slug: stateSlug,
            seo: legacyData.seo || {
              title: `Top 25 Marketing Agencies in ${normalizedStateName}`,
              meta_description: `Looking for Marketing Agencies in ${normalizedStateName}? Here are the best ones listed just for you. Take a look at our list.`,
              canonical_url: buildStateCanonicalUrl(stateSlug),
              og_title: `Top 25 Marketing Agencies in ${normalizedStateName}`,
              og_description: `Looking for Marketing Agencies in ${normalizedStateName}? Here are the best ones listed just for you.`
            },
            state_intro_short: legacyData.state_intro_short || `Our comprehensive ranking of ${normalizedStateName}'s top marketing agencies, based on expertise, client results, innovation, and industry reputation.`,
            state_intro_full: legacyData.state_intro_full || '',
            agencies: agencies,
            faqs: dedupeFaqs(legacyData.faqs || [])
          };

          if (import.meta.env.DEV) {
            console.log('[NJ Agencies Loaded]', {
              source: 'LEGACY',
              state: stateSlug,
              totalAgencies: agencies.length,
              agenciesWithId: agencies.filter(a => !!a.id).length,
              agenciesWithoutId: agencies.filter(a => !a.id).length,
              firstFewAgencies: agencies.slice(0, 3).map(a => ({
                rank: a.rank,
                name: a.name,
                id: a.id || 'MISSING',
              })),
            });
          }
          console.log('✅ State data loaded from LEGACY:', normalizedStateName, `(${agencies.length} agencies)`);
          setStateData(normalizedData);
          setDebugInfo(debug);
          setLoading(false);
          return;
        }

        // Fall back to database for non-legacy states
        console.log('🔵 Loading state data from DATABASE for:', stateSlug);
        debug.source = 'database';

        // Load agencies from database
        const { data: dbAgencies, error: dbError } = await supabase
          .from('top25_slots')
          .select('*')
          .eq('state_slug', stateSlug)
          .order('rank', { ascending: true });

        if (dbError) {
          console.error('Database error:', dbError);
          throw new Error(`Failed to load agencies from database: ${dbError.message}`);
        }

        debug.dbAgenciesCount = dbAgencies?.length || 0;
        debug.firstAgency = dbAgencies?.[0]?.agency_name || 'None';

        // CRITICAL: Fetch agency_listings_index to get agency_id for owner mode
        // This is the source of truth for agency identity (not top25_slots.agency_id which may be null)
        const { data: agencyListingsIndex, error: indexError } = await supabase
          .from('agency_listings_index')
          .select('agency_id, state_slug, section, rank')
          .eq('state_slug', stateSlug)
          .eq('section', 'top25');

        if (indexError) {
          console.warn('⚠️ Failed to load agency_listings_index:', indexError);
        }

        // Build map: rank -> agency_id for easy lookup
        const agencyIdByRank = new Map<number, string>();
        agencyListingsIndex?.forEach((listing: any) => {
          if (listing.rank && listing.agency_id) {
            agencyIdByRank.set(listing.rank, listing.agency_id);
          }
        });

        debug.agencyListingsIndexCount = agencyListingsIndex?.length || 0;

        // CRITICAL: Load state content from database (hero, intro, lastUpdated)
        const { data: dbStateContent, error: contentError } = await supabase
          .from('state_content')
          .select('*')
          .eq('state_slug', stateSlug)
          .maybeSingle();

        if (contentError) {
          console.warn('⚠️ Failed to load state content:', contentError);
        }

        debug.dbStateContent = dbStateContent ? 'loaded' : 'not found';

        // CRITICAL: Load FAQs from database (per-state questions/answers)
        const { data: dbFaqs, error: faqsError } = await supabase
          .from('state_faqs')
          .select('*')
          .eq('state_slug', stateSlug)
          .order('position', { ascending: true });

        if (faqsError) {
          console.warn('⚠️ Failed to load FAQs:', faqsError);
        }

        debug.dbFaqsCount = dbFaqs?.length || 0;

        // If no agencies in database, show error
        if (!dbAgencies || dbAgencies.length === 0) {
          console.warn(`⚠️ No agencies found in database for ${stateSlug}`);
          setError(`No agencies found for ${normalizedStateName}. This state has not been imported yet.`);
          setDebugInfo(debug);
          setLoading(false);
          return;
        }

        // STRICT MODE: DB IS THE ONLY SOURCE OF TRUTH
        // All content must come from database (imported via state-json-import edge function)
        debug.jsonMetadata = 'disabled (DB-only mode)';
        debug.jsonFetchUrl = 'N/A';
        debug.jsonStatus = 0;

        // Build agencies array from DATABASE ONLY (no JSON merging)
        // CRITICAL: Use agencyIdByRank map to ensure agency_id is always set for owner mode matching
        const agencies = dbAgencies
          .filter((slot: any) => slot.rank >= 1 && slot.rank <= 25)
          .map((slot: any) => {
            const services = ensureAgencyServices(slot.services);

            // Use DB description (stored during import from JSON)
            // short_description is for truncated display, description is full
            const fullDesc = slot.description || '';
            const shortDesc = slot.short_description || (fullDesc.length > 150 ? fullDesc.substring(0, 150).trim() + '...' : fullDesc);

            // Use agency_name if available, otherwise placeholder
            const agencyName = slot.agency_name || `Top 25 Slot #${slot.rank}`;

            // Get agency_id. Prefer the real UUID on top25_slots (populated for paid
            // sold slots) so downstream lookups (availability modal) find the agency
            // in other_agencies / top25_slots. Fall back to the listings index id
            // (used as a stable handle for unpaid placeholder cards in owner mode).
            const agencyId = slot.agency_id ?? agencyIdByRank.get(slot.rank) ?? undefined;

            return {
              rank: slot.rank,
              name: agencyName,
              website: slot.website || '',
              logoUrl: slot.logo_url || '',
              description: fullDesc,
              shortDescription: shortDesc,
              fullDescription: fullDesc,
              services: services,
              isPaid: isPaidSlot({ rank: slot.rank, is_paid: !!slot.is_paid }),
              show_lightning: !!slot.show_lightning,
              city: slot.city || '',
              state: normalizedStateName,
              id: agencyId
            };
          })
          .sort((a, b) => a.rank - b.rank);

        debug.validAgencies = agencies.length;
        debug.paidAgencies = agencies.filter(a => a.isPaid).length;
        debug.unpaidAgencies = agencies.filter(a => !a.isPaid).length;
        debug.agenciesWithLongDescription = agencies.filter(a => a.description && a.description.length > 100).length;
        debug.faqsCount = dbFaqs?.length || 0;
        debug.firstFaqQuestion = dbFaqs?.[0]?.question || 'None';
        debug.faqsSource = dbFaqs?.length > 0 ? 'database' : 'none';

        // Validate state content exists (DB-only mode)
        if (!dbStateContent) {
          console.error(`❌ MISSING STATE CONTENT for ${stateSlug}. Import required.`);
          setError(`Missing state content for ${stateSlug}. This state needs to be imported with proper content.`);
          setDebugInfo({ error: 'Missing state_content', stateSlug, dbStateContent: 'none' });
          setLoading(false);
          return;
        }

        // Validate hero_intro exists (required field)
        const heroIntro = dbStateContent?.hero_intro;
        if (!heroIntro) {
          console.error(`❌ MISSING hero_intro for ${stateSlug}. Import with valid JSON required.`);
        }

        // Sanitize FAQs: Remove placeholders and "click to expand" items
        const rawFaqs = dbFaqs || [];
        const filteredFaqs = rawFaqs.filter((faq: any) => {
          if (!faq.question || !faq.answer) return false;
          if (/click to expand/i.test(faq.question) || /click to expand/i.test(faq.answer)) {
            console.warn(`⚠️ Filtered out placeholder FAQ: "${faq.question}"`);
            return false;
          }
          return true;
        });

        // Deduplicate FAQs to prevent duplicate questions in UI and schema
        const sanitizedFaqs = dedupeFaqs(filteredFaqs);

        debug.faqsRaw = rawFaqs.length;
        debug.faqsFiltered = filteredFaqs.length;
        debug.faqsUnique = sanitizedFaqs.length;

        // Build state data - DATABASE ONLY, NO JSON fallbacks
        const normalizedData: StateData = {
          state_name: normalizedStateName,
          state_slug: stateSlug,
          seo: {
            title: `Top 25 Marketing Agencies in ${normalizedStateName}`,
            meta_description: `Looking for Marketing Agencies in ${normalizedStateName}? Here are the best ones listed just for you. Take a look at our list.`,
            canonical_url: buildStateCanonicalUrl(stateSlug),
            og_title: `Top 25 Marketing Agencies in ${normalizedStateName}`,
            og_description: `Looking for Marketing Agencies in ${normalizedStateName}? Here are the best ones listed just for you.`
          },
          // STRICT: DB ONLY, no JSON fallbacks
          state_intro_short: dbStateContent?.state_intro_short || '',
          state_intro_full: dbStateContent?.state_intro_full || '',
          state_description_full: dbStateContent?.state_description_full || '',
          hero_intro: heroIntro || '',
          hero_intro_short: dbStateContent?.hero_intro_short || '',
          agencies: agencies,
          // STRICT: Only sanitized FAQs from DB (no placeholders)
          faqs: sanitizedFaqs
        };

        console.log('✅ State data loaded from DATABASE:', normalizedStateName, `(${agencies.length} agencies)`);

        setStateData(normalizedData);
        setDebugInfo(debug);
      } catch (err: any) {
        console.error('❌ Failed to load state data:', err);
        setError(err.message);
        setDebugInfo({ error: err.message, stateSlug });
      } finally {
        setLoading(false);
      }
    }

    loadStateData();
  }, [resolvedSlug]);

  // Find owner agency with robust resolver (tries multiple ID keys) + database fallback.
  // This resolver's ONLY job is to confirm the agency name, section, and rank.
  // It does NOT scroll, highlight, or start countdowns — those happen only when
  // the user clicks "Scroll to my listing" in Phase 2.
  useEffect(() => {
    if (!ownerMode || !ownerAgencyId || !stateData || !resolvedSlug) {
      return;
    }

    async function findOwnerAgency() {
      const match = resolveOwnerAgency(
        ownerAgencyId,
        stateData.state_name || '',
        resolvedSlug,
        stateData.agencies,
        [],
        showOwnerDebug
      );

      if (match && match.found) {
        setOwnerAgencyName(match.agencyName);
        setOwnerAgencyRank(match.rank);
        setOwnerAgencySection(match.section);
        setOwnerAgencyNotFound(false);
        setOwnerWrongState(false);
        setOwnerLoading(false);
        const matchedAgency = (stateData.agencies as Array<{ id?: string; slug?: string }>)
          .find(a => a.id === ownerAgencyId);
        if (matchedAgency?.slug) setOwnerAgencySlug(matchedAgency.slug);
        if (showOwnerDebug) console.log('[OwnerMode] Match found in agencies list:', match);
        // No scroll, highlight, or countdown here — that only happens on user click.
        return;
      }

      // Fallback: Query agency_listings_index directly
      if (showOwnerDebug) console.log('[OwnerMode] Not found in agencies list, querying index...');

      const { data: indexListing, error: indexError } = await supabase
        .from('agency_listings_index')
        .select('*')
        .eq('agency_id', ownerAgencyId)
        .eq('state_slug', resolvedSlug)
        .maybeSingle();

      if (indexError) {
        console.warn('[OwnerMode] Index query failed:', indexError);
        // If section+rank are known from the hash URL, do NOT mark as not-found —
        // we already know where the listing lives; a DB error is not a definitive miss.
        if (!ownerHashHasLocation) {
          setOwnerAgencyNotFound(true);
        }
        setOwnerLoading(false);
        return;
      }

      if (indexListing) {
        if (showOwnerDebug) console.log('[OwnerMode] Found in index:', indexListing);
        setOwnerAgencyName(indexListing.agency_name || '');
        setOwnerAgencyRank(indexListing.rank);
        setOwnerAgencySection(indexListing.section);
        setOwnerAgencyNotFound(false);
        setOwnerWrongState(false);
        setOwnerLoading(false);
        if (indexListing.agency_slug) setOwnerAgencySlug(indexListing.agency_slug);
        // No scroll, highlight, or countdown here — that only happens on user click.
      } else {
        if (showOwnerDebug) console.log('[OwnerMode] Not found in index either');
        // Only mark truly not-found when section+rank are not already established
        // from the hash. If they are, the listing exists on this page even if the
        // index query returned nothing.
        if (!ownerHashHasLocation) {
          setOwnerAgencyNotFound(true);
        }
        setOwnerLoading(false);
      }
    }

    findOwnerAgency();
  }, [ownerMode, ownerAgencyId, stateData, resolvedSlug, ownerHashHasLocation, showOwnerDebug]);

  // Track whether the owner's listing card is genuinely ready in the DOM.
  // For 'top25': the card is in the static page DOM, so it is ready as soon as
  // the resolver finishes (ownerLoading = false).
  // For 'other': OtherAgenciesSection must finish its data fetch and confirm the
  // card is at position 0 (via handleOwnerCardReady / onOwnerCardReady).
  useEffect(() => {
    if (!ownerMode || ownerLoading) {
      setOwnerCardReady(false);
      return;
    }
    if (ownerAgencySection === 'top25') {
      setOwnerCardReady(true);
    } else {
      setOwnerCardReady(false);
    }
  }, [ownerMode, ownerLoading, ownerAgencySection]);

  // Resolve paid listing status once owner agency section + ID are known
  useEffect(() => {
    if (!ownerAgencyId || ownerLoading) {
      setOwnerIsPaidListing(false);
      return;
    }
    if (ownerAgencySection === 'top25' && stateData) {
      const match = (stateData.agencies as Array<{ id?: string; isPaid?: boolean }>)
        .find(a => a.id === ownerAgencyId);
      setOwnerIsPaidListing(!!match?.isPaid);
      return;
    }
    if (ownerAgencySection === 'other') {
      const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || '';
      const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY || '';
      fetch(`${supabaseUrl}/functions/v1/other-agency-paid-status?agency_id=${ownerAgencyId}`, {
        headers: {
          'Authorization': `Bearer ${anonKey}`,
          'Content-Type': 'application/json',
          'Apikey': anonKey,
        },
      })
        .then(r => r.json())
        .then((result: { is_standard_paid?: boolean }) => {
          setOwnerIsPaidListing(result.is_standard_paid === true);
        })
        .catch(() => {
          setOwnerIsPaidListing(false);
        });
    }
  }, [ownerAgencyId, ownerAgencySection, ownerLoading, stateData]);

  // Safety timeout: if owner mode is active and the hash already has location info,
  // never let ownerLoading block the sticky bar CTA for more than ~1.1s.
  useEffect(() => {
    if (!ownerMode || !ownerHashHasLocation || !ownerLoading) return;
    const t = setTimeout(() => setOwnerLoading(false), 1100);
    return () => clearTimeout(t);
  }, [ownerMode, ownerHashHasLocation, ownerLoading]);

  // Adjust document padding when owner mode is active
  useEffect(() => {
    if (ownerMode) {
      document.documentElement.style.scrollPaddingTop = '96px';
    } else {
      document.documentElement.style.scrollPaddingTop = '0';
    }

    return () => {
      document.documentElement.style.scrollPaddingTop = '0';
    };
  }, [ownerMode]);

  const clearOwnerAutoOpenTimers = useCallback(() => {
    if (ownerScrollSettleTimerRef.current) {
      clearTimeout(ownerScrollSettleTimerRef.current);
      ownerScrollSettleTimerRef.current = null;
    }
    if (ownerAutoOpenTimerRef.current) {
      clearTimeout(ownerAutoOpenTimerRef.current);
      ownerAutoOpenTimerRef.current = null;
    }
  }, []);

  // Clear highlight + auto-open timers on unmount
  useEffect(() => {
    return () => {
      if (highlightTimerRef.current) clearTimeout(highlightTimerRef.current);
      clearOwnerAutoOpenTimers();
    };
  }, [clearOwnerAutoOpenTimers]);


  const handleOwnerExit = () => {
    if (highlightTimerRef.current) clearTimeout(highlightTimerRef.current);
    clearOwnerAutoOpenTimers();
    ownerAutoOpenStartedRef.current = false;
    hasStartedAvailabilityFlowRef.current = false;
    setOwnerMode(false);
    setOwnerPreviewStep(1);
    setOwnerAgencyId(null);
    setOwnerAgencySlug(null);
    setOwnerAgencyNotFound(false);
    setHighlightAgencyId(null);
    setIsDemoAvailabilityOpen(false);
    setOwnerCardReadyForCountdown(false);
    setOwnerHashHasLocation(false);
    history.replaceState(null, '', window.location.pathname);
  };

  const handleOpenStatepageAvailability = useCallback((agencyId: string, directClient?: boolean, source: 'other' | 'top25' = 'other') => {
    setStatepageAvailabilityAgencyId(agencyId);
    setStatepageAvailabilityDirectClient(!!directClient);
    setStatepageAvailabilitySource(source);
  }, []);

  const handleCloseStatepageAvailability = useCallback(() => {
    setStatepageAvailabilityAgencyId(null);
    setStatepageAvailabilityDirectClient(false);
    setStatepageAvailabilitySource('other');
  }, []);

  const handleOwnerStepChange = (newStep: OwnerPreviewStep) => {
    if (newStep === 5) {
      return;
    }
    if (newStep !== 2) {
      clearOwnerAutoOpenTimers();
    }
    setOwnerPreviewStep(newStep);
    if (newStep === 2) {
      logFunnelEvent({
        ...FUNNEL_EVENTS.STEP2_STARTED,
        agency_id: ownerAgencyId ?? undefined,
        agency_name: ownerAgencyName,
        state_slug: resolvedSlug ?? undefined,
      });
    }
  };

  const startOwnerPreviewAvailabilityFlow = (_opts: { source: 'auto_timer' | 'manual_click' }) => {
    if (hasStartedAvailabilityFlowRef.current) return;
    hasStartedAvailabilityFlowRef.current = true;
    clearOwnerAutoOpenTimers();
    setOwnerPreviewStep(3);
    setIsDemoAvailabilityOpen(true);
  };

  const handleOwnerCheckAvailabilityClick = (opts?: { auto?: boolean }) => {
    startOwnerPreviewAvailabilityFlow({
      source: opts?.auto ? 'auto_timer' : 'manual_click',
    });
  };

  const handleOwnerStep4Activate = () => {
    if (!ownerAgencyId) return;

    const params = new URLSearchParams();
    params.set('agencyId', ownerAgencyId);
    if (resolvedSlug) params.set('state', resolvedSlug);
    if (stateData?.state_name) params.set('stateName', stateData.state_name);
    if (ownerAgencyName) params.set('agencyName', ownerAgencyName);

    if (ownerIsPaidListing) {
      navigate(`/availability/owner-dashboard?${params.toString()}`);
    } else {
      const activationUrl = buildActivationDirectLink({
        agencyId: ownerAgencyId,
        stateSlug: resolvedSlug,
        agencyName: ownerAgencyName,
        stateName: stateData?.state_name || '',
      });
      if (activationUrl) {
        navigate(activationUrl);
      } else {
        params.set('step', '5');
        params.set('fromDemo', '1');
        navigate(`/availability/owner-preview?${params.toString()}`);
      }
    }
  };

  const handleScrollToListing = () => {
    if (!ownerAgencyId || ownerLoading) return;

    logFunnelEvent({
      ...FUNNEL_EVENTS.SCROLL_TO_LISTING_CLICKED,
      agency_id: ownerAgencyId,
      agency_name: ownerAgencyName,
      state_slug: resolvedSlug ?? undefined,
    });

    handleOwnerStepChange(2);

    scrollToOwnerCardNative(ownerAgencyId, {
      onFound: () => {
        triggerHighlight(ownerAgencyId!);

        // Single source of truth for Step 2 → Step 3 auto-open.
        // Guard against duplicate timers from re-entry / re-renders.
        if (ownerAutoOpenStartedRef.current) return;
        ownerAutoOpenStartedRef.current = true;
        clearOwnerAutoOpenTimers();

        // Wait for smooth scroll to settle / listing reveal to complete,
        // then keep the highlight visible for 3000ms before opening the
        // Check Availability form preview.
        ownerScrollSettleTimerRef.current = setTimeout(() => {
          ownerScrollSettleTimerRef.current = null;
          ownerAutoOpenTimerRef.current = setTimeout(() => {
            ownerAutoOpenTimerRef.current = null;
            handleOwnerCheckAvailabilityClick({ auto: true });
          }, 3700);
        }, 800);
      },
    });
  };

  // CRITICAL: Render SEO tags IMMEDIATELY, even during loading
  // This ensures SEO Boost captures metadata before async content loads
  if (loading && seoData) {
    return (
      <>
        <SEOTags
          title={seoData.title}
          description={seoData.description}
          canonicalUrl={seoData.canonical}
          stateSlug={immediateSlug || undefined}
          proofTag={seoData.proofTag}
          ogTitle={seoData.ogTitle}
          ogDescription={seoData.ogDescription}
          ogImage={seoData.ogImage}
          ogUrl={seoData.ogUrl}
          twitterCard={seoData.twitterCard}
          twitterTitle={seoData.twitterTitle}
          twitterDescription={seoData.twitterDescription}
          twitterImage={seoData.twitterImage}
        />
        <div className="min-h-screen flex items-center justify-center bg-white">
          <div className="text-center">
            <div className="animate-spin rounded-full h-16 w-16 border-b-4 border-indigo-600 mx-auto mb-4"></div>
            <p className="text-gray-600 text-lg">Loading {resolvedSlug ? formatStateName(resolvedSlug) : 'state'} data...</p>
          </div>
        </div>
      </>
    );
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-white">
        <div className="max-w-5xl mx-auto px-4 pt-20 pb-12 space-y-6 animate-pulse">
          <div className="h-8 bg-slate-200 rounded-lg w-3/4" />
          <div className="h-4 bg-slate-100 rounded w-1/2" />
          <div className="h-64 bg-slate-100 rounded-xl" />
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {[1, 2, 3, 4].map((i) => (
              <div key={i} className="h-32 bg-slate-50 rounded-xl border border-slate-100" />
            ))}
          </div>
        </div>
      </div>
    );
  }

  if (error || !stateData || !resolvedSlug) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-white">
        <div className="text-center max-w-md mx-auto px-4">
          <div className="text-6xl mb-4">🔍</div>
          <h1 className="text-3xl font-bold text-gray-900 mb-4">State Not Found</h1>
          <p className="text-gray-600 mb-6">
            {error || `Could not load data for ${resolvedSlug || 'this state'}`}
          </p>
          <a
            href="/marketing-agencies/usa"
            className="inline-block bg-indigo-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors"
          >
            View All States
          </a>
        </div>
      </div>
    );
  }

  const stateSlug = resolvedSlug;
  const stateAbbr = getStateAbbr(stateSlug);
  const currentDate = new Date();
  const dateModified = `${currentDate.toLocaleString('en-US', { month: 'long' })} ${currentDate.getFullYear()}`;

  const stateIntroShort = stateData.state_intro_short?.trim() ?? '';
  const finalDescription = stateIntroShort.length > 50
    ? stateIntroShort.substring(0, 155)
    : (seoData?.description ?? '');

  // Format for "Updated Dec 7" pill in hero - always shows "today minus 2 days"
  const updatedLabelForHero = getUpdatedLabelWithOffsetDays(2);

  const handleViewList = () => {
    const listSection = document.getElementById('top25-list');
    if (listSection) {
      listSection.scrollIntoView({ behavior: 'smooth' });
    }
  };

  const fullDescription: string =
    stateData.state_intro_full ??
    stateData.state_description_full ??
    '';

  const { mobileIntro, desktopIntro } = fullDescription
    ? getIntroVariants(fullDescription)
    : { mobileIntro: '', desktopIntro: '' };

  return (
    <OwnerBannerProvider>
    <div className="app">
      {import.meta.env.DEV && stateSlug && (
        <div className="fixed top-0 right-0 z-50 bg-blue-600 text-white px-4 py-2 text-xs font-mono rounded-bl-lg shadow-lg">
          <div>📍 State: <strong>{stateSlug}</strong></div>
          <div>🔄 Resolved: <strong>{resolvedSlug || 'override'}</strong></div>
        </div>
      )}
      {/* CRITICAL: Use synchronous SEO data for consistent metadata + unified schema */}
      {seoData && (
        <SEOTags
          title={seoData.title}
          description={finalDescription}
          canonicalUrl={seoData.canonical}
          stateSlug={immediateSlug || undefined}
          stateName={stateData.state_name}
          proofTag={seoData.proofTag}
          ogTitle={seoData.ogTitle}
          ogDescription={finalDescription}
          ogImage={seoData.ogImage}
          ogImageWidth={seoData.ogImageWidth}
          ogImageHeight={seoData.ogImageHeight}
          ogImageType={seoData.ogImageType}
          ogUrl={seoData.ogUrl}
          twitterCard={seoData.twitterCard}
          twitterTitle={seoData.twitterTitle}
          twitterDescription={finalDescription}
          twitterImage={seoData.twitterImage}
          dateModified={dateModified}
          agencies={stateData.agencies as any}
          faqs={stateData.faqs}
        />
      )}

      <Top25Header
        stateSlug={stateData.state_slug!}
        topOffset={ownerMode && ownerPreviewStep !== 1 ? OWNER_BAR_TOP_OFFSET_DESKTOP : 0}
      />

      {/* Owner highlight styles are defined globally in src/styles/owner-preview.css (green, matches the owner sticky bar) */}

      {ownerMode && ownerPreviewStep === 1 && (
        <OwnerPreviewIntro
          agencyId={ownerAgencyId}
          agencyName={ownerAgencyName || ''}
          stateSlug={resolvedSlug ?? undefined}
          onReveal={() => {
            // Keep the user at the top of the revealed state page for 2000ms
            // before initiating the smooth scroll to their listing.
            window.setTimeout(() => {
              handleScrollToListing();
            }, 2000);
          }}
        />
      )}

      {ownerMode && ownerPreviewStep !== 1 && (
        <OwnerStickyBar
          agencyName={ownerAgencyName}
          agencyId={ownerAgencyId}
          stateName={stateData.state_name || ''}
          rank={ownerAgencyRank}
          section={ownerAgencySection}
          onExit={handleOwnerExit}
          onScrollToListing={handleScrollToListing}
          onStepChange={handleOwnerStepChange}
          step={ownerPreviewStep}
          notFound={ownerAgencyNotFound}
          loading={ownerLoading && !ownerHashHasLocation}
          wrongState={ownerWrongState}
          correctStateSlug={ownerCorrectStateSlug || ''}
          debug={showOwnerDebug}
          countdownSeconds={ownerCountdownSeconds}
          step4Seconds={ownerStep4Seconds}
          step4CtaVisible={ownerStep4CtaVisible}
          onStep4Activate={handleOwnerStep4Activate}
        />
      )}

      {ownerMode && ownerPreviewStep !== 1 && (
        <div aria-hidden="true" style={{ height: 'var(--owner-banner-h, 180px)' }} />
      )}
      <ThreeColumnLayout>
      <section className={`hero-section${ownerMode && ownerPreviewStep === 1 ? ' hero-section-step-1' : ''}`}>
        <div className="hero-container">
          <div className="hero-dark-card">
            <div className="hero-left-content">
              <div className="flex items-center text-sm lg:pt-0 lg:mb-6">
                <Link to="/marketing-agencies" className="text-white/70 hover:text-white transition-colors">
                  Marketing Agencies
                </Link>
                <span className="mx-1 text-white/40">›</span>

                <Link to="/marketing-agencies/usa" className="text-white/70 hover:text-white transition-colors">
                  USA
                </Link>
                <span className="mx-1 text-white/40">›</span>

                <span className="font-semibold text-white">
                  {stateData.state_name}
                </span>
              </div>

              <h1
                className="
                  mt-4 lg:mt-0
                  font-extrabold text-2xl leading-tight
                  sm:text-4xl
                  lg:text-5xl lg:leading-tight
                  text-white
                "
              >
                {/* MOBILE version forces two lines */}
                <span className="block whitespace-nowrap sm:hidden">
                  Top 25 Marketing Agencies
                </span>
                <span className="block whitespace-nowrap sm:hidden">
                  in {stateData.state_name} ({currentDate.getFullYear()})
                </span>

                {/* DESKTOP version - stays inline, one line */}
                <span className="hidden sm:inline">
                  Top 25 Marketing Agencies in {stateData.state_name} ({currentDate.getFullYear()})
                </span>
              </h1>

              {/* Hero intro content - snippet-eligible for SEO */}
              {fullDescription && (
                <>
                  <div className="mt-6 max-w-3xl hidden md:block">
                    {!isIntroExpanded ? (
                      <p className="text-slate-200 text-base md:text-lg leading-relaxed mb-6 whitespace-pre-wrap">
                        {desktopIntro}
                        {desktopIntro !== fullDescription && (
                          <>
                            {' '}
                            <button
                              type="button"
                              onClick={() => setIsIntroExpanded(true)}
                              className="inline-flex items-center rounded-full border border-slate-600/70 px-4 py-1 text-xs font-medium text-slate-100 hover:bg-slate-800/80 transition ml-2"
                            >
                              Read more
                            </button>
                          </>
                        )}
                      </p>
                    ) : (
                      <>
                        <p className="text-slate-200 text-base md:text-lg leading-relaxed mb-4 whitespace-pre-wrap">
                          {fullDescription}
                        </p>
                        <button
                          type="button"
                          onClick={() => setIsIntroExpanded(false)}
                          className="inline-flex items-center rounded-full border border-slate-600/70 px-4 py-1 text-xs font-medium text-slate-100 hover:bg-slate-800/80 transition mb-6"
                        >
                          Read less
                        </button>
                      </>
                    )}
                  </div>

                  <div className="mt-3 mb-4 max-w-3xl md:hidden">
                    {!isIntroExpanded ? (
                      <p className="text-[15px] leading-[1.5] text-slate-200 whitespace-pre-wrap">
                        {mobileIntro}
                        {mobileIntro !== fullDescription && (
                          <>
                            {' '}
                            <button
                              type="button"
                              onClick={() => setIsIntroExpanded(true)}
                              className="inline-flex items-center whitespace-nowrap rounded-full border border-white/20 px-[10px] py-1 text-[13px] font-medium text-slate-100 hover:border-slate-300 hover:text-slate-50 transition"
                            >
                              Read more
                            </button>
                          </>
                        )}
                      </p>
                    ) : (
                      <>
                        <p className="text-[15px] leading-[1.5] text-slate-200 whitespace-pre-wrap">
                          {fullDescription}
                        </p>
                        <button
                          type="button"
                          onClick={() => setIsIntroExpanded(false)}
                          className="mt-3 inline-flex items-center whitespace-nowrap rounded-full border border-white/20 px-[10px] py-1 text-[13px] font-medium text-slate-100 hover:border-slate-300 hover:text-slate-50 transition"
                        >
                          Read less
                        </button>
                      </>
                    )}
                  </div>
                </>
              )}

              <div className="flex flex-col sm:flex-row sm:items-center gap-3 sm:gap-4 mt-2">
                <a
                  href="#top-25-summary"
                  className="inline-flex items-center justify-center bg-indigo-600 text-white px-5 py-2 rounded-lg text-sm font-semibold transition-all duration-200 hover:bg-indigo-700 whitespace-nowrap sm:flex-shrink-0"
                >
                  View Top 25
                </a>

                <button
                  type="button"
                  onClick={() => {
                    try {
                      import('../lib/yourAgencyApi').then(m => m.trackYourAgencyEvent({ event_name: 'owner_cta_click', state: resolvedSlug })).catch(() => {});
                    } catch {}
                    setIsNJOwnerIntentOpen(true);
                  }}
                  className="inline-flex items-center justify-center px-5 py-2 rounded-lg border-2 border-white bg-transparent text-white text-sm font-semibold transition-all duration-200 hover:bg-white/10 focus-visible:ring-2 focus-visible:ring-white/70 outline-none whitespace-nowrap"
                >
                  Agency owner? Find your listing
                </button>
              </div>
            </div>

            <div className="hero-right-card match-card match-card-gap-tight match-card-tight" data-nosnippet>
              <h3 className="hero-matching-headline">Get Matched with Your Best-Fit Marketing Agency</h3>
              <p className="hero-matching-subtext">
                Tell us your goals, budget, and timeline — and we'll recommend the best agency from our curated Top 25 {stateData.state_name} list.
              </p>
              <button
                onClick={() => setIsMatchingModalOpen(true)}
                className="w-full flex items-center justify-center bg-indigo-600 text-white px-5 py-2 rounded-lg text-sm font-semibold transition-all duration-200 hover:bg-indigo-700"
              >
                Get Matched
              </button>
              <div className="mt-3 flex justify-center">
                <div className="inline-flex items-center px-4 py-1 rounded-full bg-indigo-50 text-xs font-medium text-indigo-600">
                  {updatedLabelForHero}
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Debug Panel - visible in dev mode OR with ?debug=1 */}
      {(import.meta.env.DEV || showDebug) && debugInfo && stateData && (
        <section style={{
          background: '#1a1a2e',
          border: '2px solid #16213e',
          borderRadius: '8px',
          padding: '20px',
          margin: '20px auto',
          maxWidth: '1200px',
          fontFamily: 'monospace',
          fontSize: '13px',
          color: '#e0e0e0'
        }}>
          <div style={{ marginBottom: '15px', fontSize: '16px', fontWeight: 'bold', color: '#00d9ff' }}>
            🔧 State Metadata Debug Panel {showDebug ? '(Production Debug Mode)' : '(Dev Mode)'}
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: '250px 1fr', gap: '10px' }}>
            <div style={{ color: '#ffd700' }}>State Slug:</div>
            <div>{stateSlug}</div>

            <div style={{ color: '#ffd700' }}>JSON Fetch URL:</div>
            <div>{debugInfo.jsonFetchUrl || 'N/A'}</div>

            <div style={{ color: '#ffd700' }}>JSON Status:</div>
            <div style={{
              color: debugInfo.jsonStatus === 200 ? '#00ff88' : '#ff6b6b',
              fontWeight: 'bold'
            }}>
              {debugInfo.jsonStatus === 200 ? '200 OK - JSON LOADED' :
               debugInfo.jsonStatus === 404 ? '404 NOT FOUND' :
               debugInfo.jsonStatus === 0 ? 'FETCH ERROR' :
               debugInfo.jsonStatus}
            </div>

            {debugInfo.jsonKeys && (
              <>
                <div style={{ color: '#ffd700' }}>JSON Keys:</div>
                <div style={{ fontSize: '11px' }}>{debugInfo.jsonKeys.join(', ')}</div>
              </>
            )}

            <div style={{ color: '#ffd700' }}>FAQs Count:</div>
            <div style={{ color: debugInfo.faqsCount > 0 ? '#00ff88' : '#ff6b6b' }}>
              {debugInfo.faqsCount} questions
            </div>

            {debugInfo.firstFaqQuestion && debugInfo.firstFaqQuestion !== 'None' && (
              <>
                <div style={{ color: '#ffd700' }}>First FAQ Question:</div>
                <div style={{ fontSize: '11px' }}>{debugInfo.firstFaqQuestion}</div>
              </>
            )}

            <div style={{ color: '#ffd700' }}>Agencies With Long Description:</div>
            <div style={{ color: debugInfo.agenciesWithLongDescription > 20 ? '#00ff88' : '#ff6b6b' }}>
              {debugInfo.agenciesWithLongDescription} / {debugInfo.validAgencies || 0}
            </div>

            <div style={{ color: '#ffd700' }}>Hero Intro (first 100 chars):</div>
            <div style={{ fontSize: '11px' }}>
              {stateData.hero_intro?.substring(0, 100) || 'MISSING'}...
            </div>

            <div style={{ color: '#ffd700' }}>State Intro Short:</div>
            <div style={{ fontSize: '11px' }}>
              {stateData.state_intro_short?.substring(0, 80) || 'MISSING'}...
            </div>

            <div style={{ color: '#ffd700' }}>Metadata Source:</div>
            <div style={{
              color: debugInfo.source === 'legacy' ? '#00ff88' : debugInfo.jsonStatus === 200 ? '#00ff88' : '#ff6b6b',
              fontWeight: 'bold'
            }}>
              {debugInfo.source === 'legacy' ? 'LEGACY JSON (NJ)' :
               debugInfo.jsonStatus === 200 ? 'STATE JSON (/data/)' :
               'FALLBACK (NO JSON)'}
            </div>
          </div>
          <div style={{ marginTop: '15px', padding: '10px', background: '#0f0f1e', borderRadius: '4px' }}>
            <div style={{ fontSize: '12px', color: '#888' }}>
              ✅ Green = JSON loaded successfully, content is state-specific<br/>
              ❌ Red = Missing JSON or fallback content being used<br/>
              Access this panel: Add <span style={{ color: '#00d9ff' }}>?debug=1</span> to URL
            </div>
          </div>
        </section>
      )}

      <section id="featured" className="featured-section spotlight-section section-block">
        <div className="container">
          <div className="featured-header">
            <h2>Spotlight Placements</h2>
            <span className="ad-badge">Ad</span>
          </div>
          <p className="featured-description">
            Premium marketing agencies in {stateData.state_name} delivering exceptional results for their clients.
          </p>

          <div className="agencies-grid">
            {/* Left Spotlight card – Vazagency */}
            <div className="agency-card featured">
              <div className="agency-logo">
                <img
                  src="/images/vazagency_logo_-_top_25_gappsy.webp"
                  alt="Vazagency Logo"
                  width={200}
                  height={60}
                  className="img-agency-featured"
                  // @ts-ignore
                  fetchpriority="high"
                  onError={(e) => { (e.target as HTMLImageElement).style.display = 'none'; }}
                />
              </div>
              <div className="agency-header">
                <h3>Vazagency</h3>
                <span style={{
                  display: 'inline-flex',
                  alignItems: 'center',
                  background: '#F4F6F9',
                  color: '#4A4F57',
                  padding: '4px 10px',
                  borderRadius: '6px',
                  fontSize: '9px',
                  fontWeight: 700,
                  letterSpacing: '0.5px',
                  textTransform: 'uppercase',
                  border: '1px solid #E1E4E8'
                }}>
                  FEATURED
                </span>
              </div>
              <p className="location">{stateData.state_name}</p>
              <p className="description">
                Vazagency stands at the forefront of digital marketing innovation, offering a comprehensive range of services including SEO, web development, content creation, design, and social media marketing.
              </p>
              <div className="services">
                {['SEO', 'Web Development', 'Content Creation', 'Design', 'Social Media Marketing'].map((service, idx) => (
                  <span key={idx} className="service-tag">{service}</span>
                ))}
              </div>
              <div className="agency-footer">
                <a
                  href="https://vazagency.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="btn-secondary"
                >
                  Visit Website
                </a>
              </div>
            </div>

            <div className="agency-card cta-card">
              <span className="sponsored-badge">Sponsored</span>
              <div className="cta-content">
                <h4 className="cta-heading">Your Agency Here</h4>
                <p className="cta-subtext">
                  Get premium visibility and connect with businesses actively seeking marketing services in {stateData.state_name}.
                </p>
                <button
                  className="btn-secondary cta-button"
                  onClick={() => setIsFeaturedModalOpen(true)}
                >
                  Learn More
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>

      <NewJerseyAgencyGrid
        agencies={stateData.agencies as any}
        stateName={stateData.state_name!}
        stateSlug={stateData.state_slug!}
        onSubmitAgency={() => setIsSubmitAgencyModalOpen(true)}
        highlightAgencyId={effectiveHighlightAgencyId}
        highlightNonce={effectiveHighlightNonce}
        ownerMode={ownerMode}
        ownerPreviewStep={ownerPreviewStep}
        ownerAgencyId={ownerAgencyId}
        onOwnerCheckAvailability={handleOwnerCheckAvailabilityClick}
        onCountdownChange={(seconds) => {
          setOwnerCountdownSeconds(seconds);
        }}
        onSummaryAgencyClick={handleSummaryAgencyClick}
        ownerCardReadyForCountdown={ownerCardReadyForCountdown}
      />

      <OtherAgenciesSection
        stateSlug={stateData.state_slug!}
        stateName={stateData.state_name!}
        highlightAgencyId={ownerAgencySection === 'other' ? highlightAgencyId : null}
        highlightNonce={highlightNonce}
        ownerMode={ownerMode && ownerAgencySection === 'other'}
        ownerPreviewStep={ownerPreviewStep}
        ownerAgencyId={ownerAgencySection === 'other' ? ownerAgencyId : null}
        onOwnerCheckAvailability={handleOwnerCheckAvailabilityClick}
        onOpenStatepageAvailability={handleOpenStatepageAvailability}
        onOwnerCardReady={ownerMode && ownerAgencySection === 'other' ? handleOwnerCardReady : undefined}
      />

      <Suspense fallback={null}>
        <NewJerseyFAQ
          faqs={stateData.faqs}
          stateName={stateData.state_name!}
        />
      </Suspense>

      <Suspense fallback={null}>
        <ExploreOtherStates currentStateSlug={stateData.state_slug} />
      </Suspense>

      {/* Debug Panel - Only show in development */}
      {debugInfo && import.meta.env.DEV && (
        <div className="bg-gray-900 text-white p-4 border-t-4 border-indigo-500">
          <div className="container mx-auto">
            <h3 className="text-sm font-bold mb-2 text-indigo-400">🐛 DEBUG INFO</h3>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-xs font-mono">
              <div>
                <span className="text-gray-400">State Slug:</span>
                <div className="text-white font-semibold">{debugInfo.stateSlug}</div>
              </div>
              <div>
                <span className="text-gray-400">State Name:</span>
                <div className="text-white font-semibold">{debugInfo.normalizedStateName}</div>
              </div>
              <div>
                <span className="text-gray-400">Data Source:</span>
                <div className={`font-semibold ${debugInfo.source === 'legacy' ? 'text-green-400' : 'text-blue-400'}`}>
                  {debugInfo.source === 'legacy' ? '🟢 LEGACY' : '🔵 DATABASE'}
                </div>
              </div>
              <div>
                <span className="text-gray-400">Total Shown:</span>
                <div className="text-white font-semibold">{debugInfo.validAgencies}</div>
              </div>
              <div>
                <span className="text-gray-400">Paid:</span>
                <div className="text-green-400 font-semibold">{debugInfo.paidAgencies || 0}</div>
              </div>
              <div>
                <span className="text-gray-400">Unpaid:</span>
                <div className="text-amber-400 font-semibold">{debugInfo.unpaidAgencies || 0}</div>
              </div>
              {debugInfo.dbAgenciesCount !== undefined && (
                <div>
                  <span className="text-gray-400">DB Rows:</span>
                  <div className="text-white font-semibold">{debugInfo.dbAgenciesCount}</div>
                </div>
              )}
              {debugInfo.firstAgency && (
                <div>
                  <span className="text-gray-400">First Agency:</span>
                  <div className="text-white font-semibold">{debugInfo.firstAgency}</div>
                </div>
              )}
            </div>
          </div>
        </div>
      )}

      <FooterWrapper currentState={stateData.state_slug} />

      </ThreeColumnLayout>

      <Suspense fallback={null}>
        {ownerMode && isDemoAvailabilityOpen && ownerPreviewStep < 5 && (
          <AvailabilityModal
            isOpen={isDemoAvailabilityOpen}
            onClose={() => { setIsDemoAvailabilityOpen(false); }}
            agencyName={ownerAgencyName}
            stateName={stateData.state_name!}
            agencyId={ownerAgencyId || undefined}
            stateSlug={stateData.state_slug!}
            mode="owner-demo"
            demoMode={true}
            onOwnerStepChange={handleOwnerStepChange}
            onStep4StateChange={(seconds, ctaVisible) => {
              setOwnerStep4Seconds(seconds);
              setOwnerStep4CtaVisible(ctaVisible);
            }}
          />
        )}
        {ownerMode && ownerPreviewStep === 5 && isDemoAvailabilityOpen && (
          <ErrorBoundary>
            <div className="fixed inset-0 z-50 flex items-start justify-center overflow-y-auto px-3 sm:px-4" style={{ paddingTop: 'calc(var(--owner-banner-h, 120px) + 4px)', paddingBottom: '0.5rem', backgroundColor: 'rgb(248 250 252)' }}>
              <div className="relative w-full max-w-2xl bg-white rounded-xl shadow-[0_8px_24px_rgba(0,0,0,0.06)]">
                <button
                  onClick={() => { setIsDemoAvailabilityOpen(false); }}
                  className="absolute top-2 right-2 p-1.5 hover:bg-gray-100 rounded-lg transition-colors z-10"
                >
                  <X className="w-4 h-4" />
                </button>
                <div className="p-2.5 sm:p-4">
                  {stateData.state_slug && stateData.state_name && ownerAgencyId ? (
                    <OwnerUpsellDashboard
                      agencyId={ownerAgencyId}
                      agencySlug={ownerAgencySlug || undefined}
                      stateSlug={stateData.state_slug}
                      stateName={stateData.state_name}
                      agencyName={ownerAgencyName || undefined}
                      isDemoStep5={true}
                      isTop25Unpaid={
                        ownerAgencySection === 'top25' &&
                        ownerAgencyRank != null &&
                        stateData.agencies.some(a => a.rank === ownerAgencyRank && !a.isPaid)
                      }
                    />
                  ) : (
                    <p className="text-sm text-slate-500">Loading agency data...</p>
                  )}
                </div>
              </div>
            </div>
          </ErrorBoundary>
        )}
        <SubmitAgencyModal
          isOpen={isSubmitAgencyModalOpen}
          onClose={() => setIsSubmitAgencyModalOpen(false)}
          stateName={stateData.state_name!}
          stateSlug={stateData.state_slug!}
          enableInlineExistingAgencySuggestions={true}
          onExistingAgencySelected={handleSubmitAgencyExistingAgencySelected}
        />
        <FeaturedSpotlightModal
          isOpen={isFeaturedModalOpen}
          onClose={() => setIsFeaturedModalOpen(false)}
          stateName={stateData.state_name!}
          stateSlug={stateData.state_slug!}
        />
        <GetMatchedModal
          isOpen={isMatchingModalOpen}
          onClose={() => setIsMatchingModalOpen(false)}
          stateName={stateData.state_name!}
          stateSlug={stateData.state_slug!}
          isNJ={true}
          onOwnerSwitchClick={() => {
            console.log('[StatePageTemplate] Get Matched modal onOwnerSwitchClick - opening owner flow with get_matched origin');
            setSkipNJOwnerIntentStep(true);
            setNjOwnerIntentOrigin('get_matched_modal');
            setIsMatchingModalOpen(false);
            setIsNJOwnerIntentOpen(true);
          }}
        />

        <ErrorBoundary fallback={null}>
          <NJOwnerIntentModal
              open={isNJOwnerIntentOpen}
              onClose={() => {
                setIsNJOwnerIntentOpen(false);
                setSkipNJOwnerIntentStep(false);
                setPreselectedNJAgency(null);
                setNjOwnerIntentOrigin(null);
                setSubmitAgencyFormState(null);
                setMatchedAgencyFormState(null);
              }}
              onReturnToTop25={() => {
                setIsNJOwnerIntentOpen(false);
                setSkipNJOwnerIntentStep(false);
                setPreselectedNJAgency(null);
                setNjOwnerIntentOrigin(null);
                setIsSubmitAgencyModalOpen(true);
              }}
              returnTo={njOwnerIntentOrigin === 'top25_submission' ? 'top25_submission_modal' : njOwnerIntentOrigin === 'get_matched_modal' ? 'get_matched_modal' : null}
              onReturnToOrigin={() => {
                console.log('[StatePageTemplate] NJOwnerIntentModal onReturnToOrigin called with origin=' + njOwnerIntentOrigin);
                if (njOwnerIntentOrigin === 'top25_submission') {
                  setIsNJOwnerIntentOpen(false);
                  setSkipNJOwnerIntentStep(false);
                  setPreselectedNJAgency(null);
                  setNjOwnerIntentOrigin(null);
                  setIsSubmitAgencyModalOpen(true);
                } else if (njOwnerIntentOrigin === 'get_matched_modal') {
                  setIsNJOwnerIntentOpen(false);
                  setSkipNJOwnerIntentStep(false);
                  setPreselectedNJAgency(null);
                  setNjOwnerIntentOrigin(null);
                  setIsMatchingModalOpen(true);
                }
              }}
              openedFromTop25Submission={njOwnerIntentOrigin === 'top25_submission'}
              onOpenFindAgency={() => setIsMatchingModalOpen(true)}
              onStartOwnerPreview={handleNJOwnerPreviewStart}
              skipIntentStep={skipNJOwnerIntentStep}
              preselectedAgency={preselectedNJAgency}
            />
        </ErrorBoundary>

        {statepageAvailabilityAgencyId && stateData.state_slug && (
          <StatePageAvailabilityHost
            agencyId={statepageAvailabilityAgencyId}
            stateSlug={stateData.state_slug}
            onClose={handleCloseStatepageAvailability}
            directClient={statepageAvailabilityDirectClient}
            source={statepageAvailabilitySource}
          />
        )}
      </Suspense>

      <SEODebugOverlay enabled={showSeoDebug} />
      <NoSnippetVerifier />
    </div>
    </OwnerBannerProvider>
  );
}

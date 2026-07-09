import { useState, useEffect, useRef, useCallback, useMemo } from 'react';
import { useParams, Link, useNavigate, useLocation, useSearchParams } from 'react-router-dom';
import {
  MapPin, Star, ChevronRight,
  Globe, AlertCircle, Building2, RefreshCw, ArrowLeft, Loader2, ArrowRight
} from 'lucide-react';
import {
  getAgencyListingsWithFallback,
  trackYourAgencyEvent,
  slugToStateName,
  INDEX_AGENCY_PAGES,
  convertPrefetchedToResult,
  waitForPrefetch,
  type AgencyListing,
  type ResolvedAgency,
  type PrefetchedAgencyData,
  type FetchDebugInfo,
  type GetAgencyListingsResult,
} from '../lib/yourAgencyApi';
import { getFsid, logFunnelEvent, FUNNEL_EVENTS, getEntryPath, setEntryPath, createFsid, logEngagement } from '../utils/yourAgencyFunnel';
import { storeScopedDiscountMarker, setActiveOfferFlow, validateOfferToken, type DiscountOffer } from '../utils/discountOffer';
import FooterWrapper from '../components/FooterWrapper';
import YourAgencySEO from '../components/YourAgencySEO';
import DiscountOfferBanner from '../components/DiscountOfferBanner';
import { SkeletonShimmer } from '../components/ui/SkeletonShimmer';
import { ListingLoadingProgress } from '../components/ListingLoadingProgress';
import { AvailabilityStatsCard } from '../components/AvailabilityStatsCard';
import { useCanonicalAgency } from '../hooks/useCanonicalAgency';
import { buildInitialEntries } from '../utils/canonicalReplayData';
import { buildDeterministicFallback } from '../utils/deterministicFallback';
import { ClientRequestLedger } from '../components/ClientRequestLedger';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';
import { getSmartRoutingTracker, isSmartRoutingContext, extractRoutingParams } from '../utils/smartRoutingTracker';
import { getSmartRoutingContext, appendSmartRoutingParams } from '../utils/smartRoutingContext';

const MAX_LOADING_TIME_MS = 20000;
const SOFT_TIMEOUT_MS = 12000;

function agencyNameClasses(name: string): string {
  const len = (name || '').trim().length;
  if (len <= 22) return 'text-2xl sm:text-3xl';
  if (len <= 32) return 'text-xl sm:text-2xl';
  if (len <= 42) return 'text-lg sm:text-xl';
  return 'text-base sm:text-lg';
}

function extractDisplayUrl(urlString: string | null | undefined): string {
  if (!urlString) return '';
  try {
    const urlObj = new URL(urlString.includes('://') ? urlString : `https://${urlString}`);
    return urlObj.hostname.startsWith('www.')
      ? urlObj.hostname
      : urlObj.hostname;
  } catch {
    return urlString.replace(/^https?:\/\/(www\.)?/, '').split(/[/?]/)[0] || urlString;
  }
}

function SectionBadge({ section, rank }: { section: string; rank: number | null }) {
  if (section === 'top25') {
    return (
      <span className="inline-flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-amber-50 text-amber-700 border border-amber-200">
        <Star className="w-3 h-3 fill-amber-500 text-amber-500" />
        Top 25{rank ? ` — #${rank}` : ''}
      </span>
    );
  }
  return (
    <span className="inline-flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full bg-slate-100 text-slate-600 border border-slate-200">
      <Globe className="w-3 h-3" />
      Other Agencies
    </span>
  );
}

type LoadState = 'idle' | 'loading' | 'soft_timeout' | 'hard_timeout' | 'success' | 'error' | 'removed';

interface NavigationState {
  prefetchedAgency?: PrefetchedAgencyData;
}

export default function YourAgencyProfilePage() {
  const { agencySlug } = useParams<{ agencySlug: string }>();
  const navigate = useNavigate();
  const location = useLocation();
  const [searchParams] = useSearchParams();
  const navState = location.state as NavigationState | null;
  const isLedgerView = searchParams.get('view') === 'ledger';
  const isFromManageListing = searchParams.get('source') === 'manage_listing';

  const [loadState, setLoadState] = useState<LoadState>('idle');
  const [agency, setAgency] = useState<ResolvedAgency | null>(null);
  const [listings, setListings] = useState<AgencyListing[]>([]);
  const [usedPrefetchedState, setUsedPrefetchedState] = useState(false);
  const [liveDataSynced, setLiveDataSynced] = useState(false);
  const [loadingMessage, setLoadingMessage] = useState('Loading your listing...');
  const [debugInfo, setDebugInfo] = useState<FetchDebugInfo | null>(null);
  const [statsLoaded, setStatsLoaded] = useState(false);
  const [activeOffer, setActiveOffer] = useState<DiscountOffer | null>(null);

  const { agency: canonical, loading: canonicalLoading } = useCanonicalAgency(agencySlug);
  const [ctaTimeoutFired, setCtaTimeoutFired] = useState(false);
  useEffect(() => {
    if (!canonicalLoading) return;
    const t = setTimeout(() => setCtaTimeoutFired(true), 5000);
    return () => clearTimeout(t);
  }, [canonicalLoading]);
  const ctaEnabled = !canonicalLoading || ctaTimeoutFired;

  const slugForLedger = canonical.agencySlug || agencySlug || 'unknown';
  const fallback = useMemo(() => buildDeterministicFallback(slugForLedger), [slugForLedger]);
  const missedCountRaw = canonical.missedCount > 0 ? canonical.missedCount : fallback.missedCount;
  const missedCountResolved = normalizeDisplayedMissedCount(missedCountRaw);
  const anchorMsResolved = canonical.anchorMs > 0 ? canonical.anchorMs : fallback.anchorMs;
  // Stable generation anchor — use baseAnchorMs when available, fall back to display anchor
  const baseAnchorMsResolved = (canonical.baseAnchorMs > 0 ? canonical.baseAnchorMs : null) ?? anchorMsResolved;
  const availabilityCount = missedCountResolved;
  const stateReady = !canonicalLoading && !!canonical.stateSlug && !!canonical.agencyId;

  const baseGeneratedCountResolved = typeof canonical.baseGeneratedCount === "number" ? canonical.baseGeneratedCount : undefined;
  const ledgerEntries = useMemo(
    () =>
      buildInitialEntries({
        agencyId: canonical.agencyId,
        agencySlug: slugForLedger,
        stateSlug: canonical.stateSlug,
        missedCount: missedCountResolved,
        baseGeneratedCount: baseGeneratedCountResolved,
        anchorMs: baseAnchorMsResolved,
        overrideEntries: canonical.overrideEntries.length > 0 ? canonical.overrideEntries : undefined,
      }),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [canonical.agencyId, canonical.overrideEntries, slugForLedger, canonical.stateSlug, missedCountResolved, baseAnchorMsResolved, baseGeneratedCountResolved],
  );

  const hoursAgoLabel = useMemo(() => {
    if (!anchorMsResolved || anchorMsResolved <= 0) return '';
    const diffMin = Math.floor((Date.now() - anchorMsResolved) / 60_000);
    // Floor at 3h — sub-3h displays feel too realtime and reduce credibility
    if (diffMin < 180) return '3h ago';
    const h = Math.floor(diffMin / 60);
    if (h < 72) return `${h}h ago`;
    const d = Math.floor(h / 24);
    return d === 1 ? '1 day ago' : `${d} days ago`;
  }, [anchorMsResolved]);

  const ledgerListRef = useRef<HTMLDivElement | null>(null);
  const ledgerEngagedRef = useRef(false);
  const ledgerViewOpenedFiredRef = useRef(false);
  const ledgerCtaClickStartedRef = useRef(false);

  const [ledgerHeight, setLedgerHeight] = useState<number>(() => {
    if (typeof window === 'undefined') return 280;
    const h = window.innerHeight;
    return Math.max(180, Math.min(432, h - 320));
  });
  useEffect(() => {
    function onResize() {
      const h = window.innerHeight;
      setLedgerHeight(Math.max(180, Math.min(432, h - 320)));
    }
    window.addEventListener('resize', onResize);
    return () => window.removeEventListener('resize', onResize);
  }, []);

  const [loadingProgress, setLoadingProgress] = useState({
    listing: false,
    assets: false,
    reviews: false,
    finalize: false,
  });

  const trackedResultView = useRef(false);
  const trackedDirectEntry = useRef(false);
  const pageEnteredAt = useRef<number>(Date.now());
  const maxScrollDepth = useRef<number>(0);
  const engagementFlushed = useRef(false);
  const loadStartTime = useRef<number>(0);
  const softTimeoutRef = useRef<NodeJS.Timeout | null>(null);
  const hardTimeoutRef = useRef<NodeJS.Timeout | null>(null);
  const cancelledRef = useRef(false);

  // Smart routing tracking
  const smartRoutingTracker = useRef(getSmartRoutingTracker());
  const isSmartRouting = useRef(false);
  const routingParams = useRef<{ agencyId: string | null; leadKey: string | null }>({ agencyId: null, leadKey: null });

  const clearTimeouts = useCallback(() => {
    if (softTimeoutRef.current) {
      clearTimeout(softTimeoutRef.current);
      softTimeoutRef.current = null;
    }
    if (hardTimeoutRef.current) {
      clearTimeout(hardTimeoutRef.current);
      hardTimeoutRef.current = null;
    }
  }, []);

  const applyResultData = useCallback((result: GetAgencyListingsResult, source: string) => {
    console.log(`[YourAgencyPage] applyResultData source=${source}`);
    setAgency(result.agency);
    setListings(result.listings);
    setLoadingProgress((prev) => ({ ...prev, listing: true, assets: true }));
  }, []);

  useEffect(() => {
    if (!canonicalLoading) {
      setStatsLoaded(true);
      setLoadingProgress((prev) => ({ ...prev, reviews: true }));
    }
  }, [canonicalLoading]);

  const trackResultView = useCallback((agencyData: ResolvedAgency, resolvedListings?: AgencyListing[]) => {
    if (trackedResultView.current) return;
    trackedResultView.current = true;

    const existingEntry = getEntryPath();
    const isDirectEntry = !existingEntry || !navState?.prefetchedAgency;

    if (isDirectEntry && !trackedDirectEntry.current) {
      trackedDirectEntry.current = true;
      if (!getFsid(false)) createFsid();

      // Resolve canonical state_slug from listings: prefer top25 listing, then first listing
      const listingsToUse = resolvedListings ?? [];
      const canonicalListing =
        listingsToUse.find(l => l.section === 'top25') ??
        listingsToUse[0] ??
        null;
      const resolvedStateSlug = canonicalListing?.state_slug ?? null;

      const supabaseUrl = import.meta.env.VITE_SUPABASE_URL as string;
      const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string;
      const profileUrl = `https://www.gappsy.com/your-agency/${agencyData.slug ?? agencySlug}`;
      const fsid = getFsid(false);

      const urlParams   = new URLSearchParams(window.location.search);
      const utmSource   = urlParams.get('utm_source')   ?? '';
      const utmMedium   = urlParams.get('utm_medium')   ?? '';
      const utmCampaign = urlParams.get('utm_campaign') ?? '';
      const utmContent  = urlParams.get('utm_content')  ?? '';
      const emailParam  = urlParams.get('email')        ?? '';
      const clickId     = urlParams.get('click_id')     ?? '';
      const sourceParam = urlParams.get('source')       ?? '';

      const isFromManageListing = sourceParam === 'manage_listing';

      const resolvedEntryPath = isFromManageListing
        ? 'manage_listing_to_your_agency' as const
        : 'direct_profile' as const;

      setEntryPath(resolvedEntryPath);

      console.log('[YourAgencyPage] direct profile-click tracking:', {
        agency_slug: agencyData.slug ?? agencySlug,
        agency_id: agencyData.id,
        resolved_state_slug: resolvedStateSlug,
        listing_count: listingsToUse.length,
        entry_path: resolvedEntryPath,
        is_from_manage_listing: isFromManageListing,
      });

      logFunnelEvent({
        ...FUNNEL_EVENTS.LANDING_VIEWED,
        agency_id: agencyData.id,
        agency_slug: agencyData.slug ?? agencySlug,
        agency_name: agencyData.name,
        entry_path: resolvedEntryPath,
      });

      const isColdEmail =
        utmSource === 'cold_email' ||
        utmMedium === 'email' ||
        !!emailParam ||
        !!clickId;

      const detectedSource = isFromManageListing
        ? 'manage_listing_to_your_agency'
        : isColdEmail
          ? 'cold_email_click'
          : 'direct_profile_visit';

      const meta: Record<string, string> = {
        entry_type: isFromManageListing ? 'manage_listing' : 'direct',
        entry_path: resolvedEntryPath,
      };
      if (isFromManageListing) {
        meta.source      = 'manage_listing';
        meta.origin_page = '/manage-listing';
      }
      if (utmSource)   meta.utm_source   = utmSource;
      if (utmMedium)   meta.utm_medium   = utmMedium;
      if (utmCampaign) meta.utm_campaign = utmCampaign;
      if (utmContent)  meta.utm_content  = utmContent;
      if (emailParam)  meta.email        = emailParam;
      if (clickId)     meta.click_id     = clickId;

      if (!isFromManageListing) {
        fetch(`${supabaseUrl}/functions/v1/your-agency-profile-click`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${anonKey}`,
            'apikey': anonKey,
          },
          body: JSON.stringify({
            agency_id:          agencyData.id ?? null,
            agency_slug:        agencyData.slug ?? agencySlug,
            agency_name:        agencyData.name,
            profile_url:        profileUrl,
            source:             detectedSource,
            visitor_session_id: fsid ?? undefined,
            state_slug:         resolvedStateSlug ?? undefined,
            request_id: `direct-${agencyData.slug ?? agencySlug}-${fsid ?? ''}-${Date.now()}`,
            meta,
          }),
        }).catch(e => console.warn('[YourAgencyPage] direct profile-click fire failed:', e));
      } else {
        console.log('[YourAgencyPage] manage-origin visit — skipping your-agency-profile-click (no contamination)');
      }
    }

    trackYourAgencyEvent({
      event_name: 'your_agency_result_view',
      agency_id: agencyData.id,
      agency_slug: agencyData.slug,
    });
    logFunnelEvent({
      ...FUNNEL_EVENTS.PROFILE_PAGE_VIEWED,
      agency_id: agencyData.id,
      agency_slug: agencyData.slug ?? agencySlug,
      agency_name: agencyData.name,
    });
  }, [agencySlug, navState]);

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const offerToken = params.get('offer');
    if (!offerToken) return;

    console.log('[YourAgencyPage] offer token detected — validating for upgrade redirect...');

    validateOfferToken(offerToken).then(({ valid, offer: validatedOffer }) => {
      if (valid && validatedOffer) {
        const _aid = validatedOffer.agency_id || '';
        const _ss = validatedOffer.state_slug || '';
        if (_aid && _ss) {
          const pct = validatedOffer.discount_type === 'percentage' ? Math.round(Number(validatedOffer.discount_value)) : 0;
          const scopeMs = validatedOffer.scope_expires_at ? new Date(validatedOffer.scope_expires_at).getTime() : null;
          const expiresMs = null;
          storeScopedDiscountMarker(_aid, _ss, { token: offerToken, discount_percent: pct, created_at: Date.now(), expires_at: expiresMs, scope_expires_at: scopeMs });
        }
        const sessionExpiry = validatedOffer.scope_expires_at
          ? Math.min(new Date(validatedOffer.scope_expires_at).getTime(), Date.now() + 24 * 60 * 60 * 1000)
          : Date.now() + 24 * 60 * 60 * 1000;
        setActiveOfferFlow(offerToken, 'offer_redirect', validatedOffer.agency_id, validatedOffer.state_slug, sessionExpiry);

        const dest = new URLSearchParams();
        dest.set('offer', offerToken);
        if (validatedOffer.agency_id) dest.set('agencyId', validatedOffer.agency_id);
        if (validatedOffer.agency_slug) dest.set('agencySlug', validatedOffer.agency_slug);

        // Fallback-rich agency context — prefer offer fields, fall back to the
        // currently loaded profile so /activation/upgrade never shows
        // "Your Agency" when data is available.
        const agencyName = validatedOffer.agency_name || agency?.name || '';
        if (agencyName) dest.set('agencyName', agencyName);

        const stateSlug = validatedOffer.state_slug || '';
        if (stateSlug) dest.set('stateSlug', stateSlug);

        const stateName = validatedOffer.state_name || '';
        if (stateName) dest.set('stateName', stateName);

        if (validatedOffer.agency_website) dest.set('agencyWebsite', validatedOffer.agency_website);
        if (validatedOffer.agency_description) dest.set('agencyDescription', validatedOffer.agency_description);
        dest.set('src', 'offer');

        // Preserve smart routing context
        const searchParams = new URLSearchParams(location.search);
        const smartContext = getSmartRoutingContext(searchParams);
        if (smartContext.aid) dest.set('aid', smartContext.aid);
        if (smartContext.lid) dest.set('lid', smartContext.lid);
        if (smartContext.ts) dest.set('ts', smartContext.ts);
        if (smartContext.sig) dest.set('sig', smartContext.sig);

        console.log('[YourAgencyPage] valid offer → redirecting to /activation/upgrade');
        navigate(`/activation/upgrade?${dest.toString()}`, { replace: true });
      } else {
        console.log('[YourAgencyPage] offer token invalid/expired — continuing normal page flow');
      }
    });
  }, [navigate, agency]);

  const hasContent = !!(agency && listings.length > 0);

  const handleRetry = useCallback(() => {
    console.log('[YourAgencyPage] manual retry triggered');
    setLoadState('loading');
    setLoadingMessage('Retrying...');
    cancelledRef.current = false;
    loadStartTime.current = performance.now();
  }, []);

  useEffect(() => {
    if (!agencySlug) {
      setLoadState('error');
      return;
    }

    cancelledRef.current = false;
    loadStartTime.current = performance.now();
    setLoadState('loading');
    setLoadingProgress({ listing: false, assets: false, reviews: false, finalize: false });
    setLiveDataSynced(false);

    const prefetched = navState?.prefetchedAgency;
    const hasPrefetched = !!(prefetched && prefetched.agency_slug && prefetched.listings?.length > 0);

    console.log(`[YourAgencyPage] load start slug=${agencySlug} hasPrefetchedState=${hasPrefetched}`);

    if (hasPrefetched) {
      console.log('[YourAgencyPage] using navigation state for instant render');
      const converted = convertPrefetchedToResult(prefetched);
      applyResultData(converted, 'navigation_state');
      setUsedPrefetchedState(true);
      setLoadState('success');
      setLoadingMessage('Syncing latest details...');

      if (converted.agency.id) {
        trackResultView(converted.agency, converted.listings);
      }
    }

    softTimeoutRef.current = setTimeout(() => {
      if (!cancelledRef.current && loadState === 'loading') {
        console.log('[YourAgencyPage] soft timeout reached');
        setLoadState('soft_timeout');
        setLoadingMessage('Still loading... Please wait a moment.');
      }
    }, SOFT_TIMEOUT_MS);

    hardTimeoutRef.current = setTimeout(() => {
      if (!cancelledRef.current && (loadState === 'loading' || loadState === 'soft_timeout')) {
        console.log('[YourAgencyPage] hard timeout reached');
        if (usedPrefetchedState && agency) {
          setLoadState('success');
          setLoadingMessage('Using cached data. Live sync unavailable.');
        } else {
          setLoadState('hard_timeout');
        }
      }
    }, MAX_LOADING_TIME_MS);

    async function load() {
      try {
        const prefetchedResult = await waitForPrefetch(agencySlug!, 1500);
        if (prefetchedResult && !cancelledRef.current) {
          console.log('[YourAgencyPage] using prefetch cache');
          applyResultData(prefetchedResult, 'prefetch_cache');
          setLoadState('success');
          clearTimeouts();

          if (prefetchedResult.agency.id) {
            trackResultView(prefetchedResult.agency, prefetchedResult.listings);
          }
          setLiveDataSynced(true);
          setLoadingProgress((prev) => ({ ...prev, finalize: true }));
          return;
        }

        const fallbackAgencyId = prefetched?.agency_id;
        const result = await getAgencyListingsWithFallback(
          { agency_slug: agencySlug },
          fallbackAgencyId,
          (info) => {
            setDebugInfo(info);
            console.log('[YourAgencyPage] debug info:', info);
          }
        );

        if (cancelledRef.current) {
          console.log('[YourAgencyPage] cancelled during fetch');
          return;
        }

        if (!result) {
          console.log('[YourAgencyPage] no result from server');
          if (usedPrefetchedState && agency) {
            setLoadState('success');
            setLoadingMessage('Using cached data. Could not refresh.');
          } else {
            setLoadState('error');
          }
          clearTimeouts();
          return;
        }

        const mgmtStatus = result.agency.listing_management_status;
        if (mgmtStatus === 'removal_pending' || mgmtStatus === 'removed') {
          clearTimeouts();
          setLoadState('removed');
          return;
        }

        applyResultData(result, 'server_fetch');
        setLiveDataSynced(true);
        setLoadState('success');
        clearTimeouts();

        const duration = performance.now() - loadStartTime.current;
        console.log(`[YourAgencyPage] server fetch success duration=${duration.toFixed(0)}ms`);

        if (result.agency.id) {
          trackResultView(result.agency, result.listings);
        }

        setLoadingProgress((prev) => ({ ...prev, finalize: true }));

      } catch (err) {
        if (cancelledRef.current) return;
        console.error('[YourAgencyPage] load error:', err);

        if (usedPrefetchedState && agency) {
          setLoadState('success');
          setLoadingMessage('Using cached data. Live sync failed.');
        } else {
          setLoadState('error');
        }
        clearTimeouts();
      }
    }

    load();

    return () => {
      cancelledRef.current = true;
      clearTimeouts();
    };
  }, [agencySlug, loadState === 'loading' ? loadStartTime.current : 0]);

  const fireLedgerEvent = useCallback(
    (event: { event_name: string; step_number: number }, extra?: Record<string, unknown>) => {
      const urlParams = typeof window !== 'undefined'
        ? new URLSearchParams(window.location.search)
        : new URLSearchParams();
      const utmSource = urlParams.get('utm_source') ?? '';
      const utmMedium = urlParams.get('utm_medium') ?? '';
      const emailParam = urlParams.get('email') ?? '';
      const clickId = urlParams.get('click_id') ?? '';
      const tokenParam = urlParams.get('token') ?? urlParams.get('t') ?? '';
      const sourceParam = urlParams.get('source') ?? '';
      const resolvedSource: 'email' | 'direct' | 'smartlink' =
        utmSource === 'cold_email' || utmMedium === 'email' || !!emailParam || !!clickId
          ? 'email'
          : sourceParam === 'smartlink' || !!tokenParam
            ? 'smartlink'
            : 'direct';
      const funnelStep: 'profile' | 'ledger' = isLedgerView ? 'ledger' : 'profile';

      logFunnelEvent({
        ...event,
        agency_id: agency?.id || canonical.agencyId || undefined,
        agency_slug: agency?.slug ?? agencySlug,
        agency_name: agency?.name || canonical.agencyName || undefined,
        state_slug: canonical.stateSlug || undefined,
        metadata: {
          ...(extra || {}),
          state_name: canonical.stateSlug ? slugToStateName(canonical.stateSlug) : undefined,
          funnel_step: funnelStep,
          source: resolvedSource,
          token: tokenParam || undefined,
        },
      });
    },
    [agency, agencySlug, canonical.agencyId, canonical.agencyName, canonical.stateSlug, isLedgerView],
  );

  const handleViewRequestsClick = useCallback(() => {
    if (isFromManageListing) {
      fireLedgerEvent(FUNNEL_EVENTS.OWNER_LEDGER_ACTIVATION_CLICKED, {
        source: 'manage_listing',
        skipped_ledger: true,
        reason: 'already_saw_manage_listing_ledger',
      });
      const primary = listings[0];
      if (primary) {
        handleCtaClick(primary);
        navigate(buildOwnerUrl(primary));
      } else {
        console.warn('[YourAgency] source=manage_listing skip ledger failed: no primary listing');
      }
      return;
    }
    fireLedgerEvent(FUNNEL_EVENTS.OWNER_VIEW_REQUESTS_CLICKED);
    const params = new URLSearchParams(location.search);
    params.set('view', 'ledger');
    setTimeout(() => {
      navigate(`${location.pathname}?${params.toString()}`);
    }, 0);
  }, [fireLedgerEvent, isFromManageListing, listings, location.pathname, location.search, navigate]);

  const handleLedgerEngaged = useCallback(() => {
    if (ledgerEngagedRef.current) return;
    ledgerEngagedRef.current = true;
    fireLedgerEvent(FUNNEL_EVENTS.OWNER_LEDGER_ENGAGED);
  }, [fireLedgerEvent]);

  const handleLedgerActivationClick = useCallback(() => {
    if (import.meta.env.DEV) console.log('[your-agency CTA clicked]');

    const primary = listings[0];

    if (!primary) {
      return;
    }

    const targetUrl = buildOwnerUrl(primary);

    if (!targetUrl) {
      return;
    }

    if (ledgerCtaClickStartedRef.current) return;
    ledgerCtaClickStartedRef.current = true;

    try {
      fireLedgerEvent(FUNNEL_EVENTS.OWNER_LEDGER_ACTIVATION_CLICKED);
    } catch {}

    try {
      handleCtaClick(primary);
    } catch {}

    const before = `${window.location.pathname}${window.location.search}${window.location.hash}`;

    try {
      navigate(targetUrl);
    } catch {
      window.location.assign(targetUrl);
      return;
    }

    window.setTimeout(() => {
      const after = `${window.location.pathname}${window.location.search}${window.location.hash}`;
      if (after === before) {
        ledgerCtaClickStartedRef.current = false;
        window.location.assign(targetUrl);
      }
    }, 250);
  }, [fireLedgerEvent, listings, navigate]);

  const recordLedgerViewFiredRef = useRef(false);
  useEffect(() => {
    if (!isLedgerView || !canonical.agencyId || recordLedgerViewFiredRef.current) return;
    recordLedgerViewFiredRef.current = true;
    fetch(
      `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/record-ledger-view`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
          apikey: import.meta.env.VITE_SUPABASE_ANON_KEY as string,
        },
        body: JSON.stringify({
          agency_id: canonical.agencyId,
          state_slug: canonical.stateSlug || '',
          client_anchor_ms: anchorMsResolved > 0 ? anchorMsResolved : undefined,
        }),
      },
    ).catch(() => {});
  }, [isLedgerView, canonical.agencyId, canonical.stateSlug, anchorMsResolved]);

  useEffect(() => {
    if (!isLedgerView) {
      ledgerEngagedRef.current = false;
      ledgerViewOpenedFiredRef.current = false;
      return;
    }

    if (!ledgerViewOpenedFiredRef.current) {
      ledgerViewOpenedFiredRef.current = true;
      fireLedgerEvent(FUNNEL_EVENTS.OWNER_LEDGER_VIEW_OPENED, {
        missed_count: missedCountResolved,
        anchor_ms: anchorMsResolved,
      });
    }

    window.scrollTo({ top: 0 });

    const hasContent = ledgerEntries.length > 0 && !canonicalLoading;
    if (!hasContent || ledgerEngagedRef.current) {
      return;
    }
    const listEl = ledgerListRef.current;
    const firstRow = listEl?.querySelector('[data-ledger-row]') as HTMLElement | null;
    if (!firstRow) {
      return;
    }
    if (typeof IntersectionObserver === 'undefined') {
      handleLedgerEngaged();
      return;
    }
    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting && entry.intersectionRatio >= 0.5) {
            handleLedgerEngaged();
            observer.disconnect();
            break;
          }
        }
      },
      { threshold: [0.5] },
    );
    observer.observe(firstRow);
    return () => {
      observer.disconnect();
    };
  }, [
    isLedgerView,
    fireLedgerEvent,
    handleLedgerEngaged,
    missedCountResolved,
    anchorMsResolved,
    ledgerEntries.length,
    canonicalLoading,
  ]);

  const handleCtaClick = (listing: AgencyListing) => {
    if (!agency) return;
    trackYourAgencyEvent({
      event_name: 'your_agency_view_listing_click',
      agency_id: agency.id,
      agency_slug: agency.slug,
      state_slug: listing.state_slug,
      section: listing.section,
    });
    logFunnelEvent({
      ...FUNNEL_EVENTS.OWNER_PREVIEW_ENTRY_CLICKED,
      agency_id: agency.id,
      agency_slug: agency.slug ?? agencySlug,
      agency_name: agency.name,
      state_slug: listing.state_slug,
    });
  };

  useEffect(() => {
    pageEnteredAt.current = Date.now();
    maxScrollDepth.current = 0;
    engagementFlushed.current = false;

    const handleScroll = () => {
      const scrollTop = window.scrollY || document.documentElement.scrollTop;
      const docHeight = Math.max(
        document.body.scrollHeight,
        document.documentElement.scrollHeight
      );
      const winHeight = window.innerHeight;
      const scrollable = docHeight - winHeight;
      if (scrollable <= 0) return;
      const pct = Math.round((scrollTop / scrollable) * 100);
      if (pct > maxScrollDepth.current) maxScrollDepth.current = pct;
    };

    const flushEngagement = () => {
      if (engagementFlushed.current) return;
      engagementFlushed.current = true;
      const seconds = Math.round((Date.now() - pageEnteredAt.current) / 1000);
      if (seconds < 2) return;
      logEngagement({
        agency_id: agency?.id,
        agency_slug: agency?.slug ?? agencySlug,
        time_on_page_seconds: seconds,
        scroll_depth_percent: maxScrollDepth.current,
      });
    };

    const handleVisChange = () => {
      if (document.visibilityState === 'hidden') flushEngagement();
    };
    const handleBeforeUnload = () => flushEngagement();

    window.addEventListener('scroll', handleScroll, { passive: true });
    document.addEventListener('visibilitychange', handleVisChange);
    window.addEventListener('beforeunload', handleBeforeUnload);

    return () => {
      flushEngagement();
      window.removeEventListener('scroll', handleScroll);
      document.removeEventListener('visibilitychange', handleVisChange);
      window.removeEventListener('beforeunload', handleBeforeUnload);
    };
  }, [agency?.id, agency?.slug, agencySlug]);

  // Smart routing tracking: qualified view detection
  useEffect(() => {
    const searchParams = new URLSearchParams(location.search);
    const isRouting = isSmartRoutingContext(searchParams);

    if (!isRouting) {
      isSmartRouting.current = false;
      return;
    }

    isSmartRouting.current = true;
    const params = extractRoutingParams(searchParams);
    routingParams.current = params;

    console.log('[YourAgencyPage] Smart routing context detected', params);

    // Track qualified view when appropriate
    const checkAndTrackQualified = () => {
      if (!params.agencyId || !params.leadKey) return;

      const tracker = smartRoutingTracker.current;
      const metrics = tracker.getMetrics();

      if (metrics.hasTrackedQualifiedView) return;

      // Check if qualified
      const isQualified =
        metrics.timeOnPageSeconds >= 4 ||
        metrics.ctaVisible ||
        metrics.scrollDepthPercent > 25;

      if (isQualified) {
        console.log('[YourAgencyPage] Qualified view detected, tracking event', metrics);
        tracker.trackEvent({
          agencyId: params.agencyId,
          leadKey: params.leadKey,
          eventType: 'your_agency_qualified_view',
          metadata: {
            page_path: location.pathname,
            agency_slug: agencySlug,
          },
        });
      }
    };

    // Check periodically
    const intervalId = setInterval(checkAndTrackQualified, 2000);

    // Check on unmount
    return () => {
      clearInterval(intervalId);
      checkAndTrackQualified();
    };
  }, [location.search, agencySlug]);

  // Mark CTA visible for smart routing when CTA becomes enabled
  useEffect(() => {
    if (ctaEnabled && isSmartRouting.current) {
      console.log('[YourAgencyPage] CTA visible for smart routing');
      smartRoutingTracker.current.markCtaVisible();
    }
  }, [ctaEnabled]);

  const buildOwnerUrl = (listing: AgencyListing) => {
    const publicStateUrl = `/marketing-agencies-in-${listing.state_slug}-united-states/`;
    const agencyId = agency?.id;
    if (!agencyId) return publicStateUrl;
    const hash = `#owner=1&agency=${agencyId}&section=${listing.section}&rank=${listing.rank ?? ''}`;
    const fsid = getFsid(false);

    // Build query params starting with fsid
    const queryParams = new URLSearchParams();
    if (fsid) queryParams.set('fsid', fsid);

    // Preserve smart routing context
    const searchParams = new URLSearchParams(location.search);
    const smartContext = getSmartRoutingContext(searchParams);
    if (smartContext.aid) queryParams.set('aid', smartContext.aid);
    if (smartContext.lid) queryParams.set('lid', smartContext.lid);
    if (smartContext.ts) queryParams.set('ts', smartContext.ts);
    if (smartContext.sig) queryParams.set('sig', smartContext.sig);
    if (smartContext.cid) queryParams.set('cid', smartContext.cid);
    if (smartContext.cn) queryParams.set('cn', smartContext.cn);
    if (smartContext.sn) queryParams.set('sn', smartContext.sn);
    if (smartContext.es) queryParams.set('es', smartContext.es);

    const queryString = queryParams.toString();
    const fsidParam = queryString ? `?${queryString}` : '';
    return `${publicStateUrl}${fsidParam}${hash}`;
  };

  if (loadState === 'removed') {
    return (
      <div className="min-h-screen bg-slate-50 flex items-center justify-center px-4">
        <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-8 text-center max-w-md w-full">
          <div className="w-14 h-14 rounded-full bg-gray-100 flex items-center justify-center mx-auto mb-4">
            <AlertCircle className="w-7 h-7 text-gray-400" />
          </div>
          <h2 className="text-xl font-bold text-gray-900 mb-2">This listing is no longer available</h2>
          <p className="text-sm text-gray-500 mb-6 leading-relaxed">
            This agency has been removed from the Gappsy directory.
          </p>
          <a href="/" className="text-sm font-medium text-blue-600 hover:text-blue-700 transition-colors">
            Browse agencies &rarr;
          </a>
        </div>
      </div>
    );
  }

  // /your-agency/* child pages are always noindex,nofollow. They are
  // personalized per agency and must not accumulate or pass SEO authority.
  const noindexMeta = true;
  const pageTitle = agency ? `${agency.name} listing on Gappsy` : 'Agency listing | Gappsy';

  const showContent = agency && listings.length > 0;
  const showLoading = loadState === 'loading' && !showContent;
  const showSoftTimeout = loadState === 'soft_timeout' && !showContent;
  const showHardTimeout = loadState === 'hard_timeout';
  const showError = loadState === 'error' && !showContent;
  const showSyncIndicator = showContent && !liveDataSynced && usedPrefetchedState;

  return (
    <>
      <YourAgencySEO
        title={pageTitle}
        description={
          agency
            ? `See where ${agency.name} is listed on Gappsy across US state directories.`
            : ''
        }
        canonical={`https://www.gappsy.com/your-agency/${agencySlug}`}
        noindex={noindexMeta}
      />

      <div className="min-h-screen flex flex-col bg-white">
        <main className="flex-1">
          <section className={`relative overflow-hidden min-h-[100svh] flex flex-col ${isLedgerView ? 'pb-[calc(env(safe-area-inset-bottom)+8px)]' : 'pb-[calc(env(safe-area-inset-bottom)+16px)] sm:pb-10 md:pb-14'}`}>
            <div className="pointer-events-none absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-blue-950" />
            <div
              className="pointer-events-none absolute inset-0 opacity-40"
              style={{
                backgroundImage:
                  'radial-gradient(circle at 15% 60%, rgba(59,130,246,0.35) 0%, transparent 50%), radial-gradient(circle at 85% 15%, rgba(14,165,233,0.2) 0%, transparent 45%)',
              }}
            />
            <div
              className="pointer-events-none absolute inset-0 opacity-[0.04]"
              style={{
                backgroundImage:
                  'linear-gradient(rgba(255,255,255,.5) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,.5) 1px, transparent 1px)',
                backgroundSize: '48px 48px',
              }}
            />

            <div className={`relative mx-auto px-4 text-center flex flex-col w-full ${isLedgerView ? 'max-w-2xl md:max-w-3xl pt-3 sm:pt-4' : 'max-w-2xl pt-4 sm:pt-6 md:pt-8'}`}>
              <div className={`flex justify-center ${isLedgerView ? 'mb-2 sm:mb-3' : 'mb-3 sm:mb-6'}`}>
                <Link to="/">
                  <img
                    src="/logos/gappsy-logo-white.webp"
                    alt="Gappsy"
                    className={isLedgerView ? 'h-6 sm:h-7 w-auto' : 'h-8 sm:h-10 w-auto'}
                  />
                </Link>
              </div>

              {activeOffer && (
                <DiscountOfferBanner offer={activeOffer} />
              )}

              {showContent && stateReady && !isLedgerView && (
                <div className="mb-4 sm:mb-6 px-1">
                  <h1 className="text-lg sm:text-xl md:text-2xl font-bold text-white max-w-2xl mx-auto leading-snug text-center">
                    <span style={{ color: '#f87171', fontVariantNumeric: 'tabular-nums' }}>
                      {availabilityCount}
                    </span>
                    {' '}clients tried to contact {agency?.name || 'your agency'}
                  </h1>
                  <p className="mt-1.5 sm:mt-2 text-sm sm:text-base text-white/75 max-w-2xl mx-auto text-center leading-snug">
                    through your listing on the{' '}
                    <span className="text-white/95 font-semibold">
                      {listings[0]?.state_slug ? slugToStateName(listings[0].state_slug) : (listings.length > 1 ? 'state' : 'state')}
                    </span>
                    {' '}page
                  </p>
                  {hoursAgoLabel && (
                    <p
                      className="mt-2 sm:mt-2.5 text-center flex items-center justify-center gap-2"
                      style={{
                        fontSize: 'clamp(13px, 1.4vw, 15px)',
                        letterSpacing: '-0.005em',
                      }}
                    >
                      <span style={{ color: '#f87171', fontWeight: 700 }}>Most recent request:</span>
                      <span
                        className="live-badge"
                        style={{
                          display: 'inline-flex',
                          alignItems: 'center',
                          backgroundColor: '#ef4444',
                          color: '#ffffff',
                          borderRadius: '9999px',
                          padding: '4px 8px',
                          fontSize: '13px',
                          fontWeight: 800,
                          lineHeight: 1,
                        }}
                      >
                        {hoursAgoLabel}
                      </span>
                    </p>
                  )}
                </div>
              )}
              {showContent && stateReady && isLedgerView && (
                <div className="mb-1 sm:mb-2 px-1">
                  <h1
                    className="mx-auto text-center md:whitespace-nowrap"
                    style={{
                      fontSize: 'clamp(16px, 2.2vw, 22px)',
                      fontWeight: 700,
                      color: '#ffffff',
                      letterSpacing: '-0.025em',
                      lineHeight: 1.22,
                      margin: 0,
                    }}
                  >
                    <span style={{ color: '#f87171', fontVariantNumeric: 'tabular-nums' }}>
                      {availabilityCount}
                    </span>
                    {' '}clients tried to contact {agency?.name || 'your agency'}
                  </h1>
                  <p
                    className="mx-auto text-center"
                    style={{
                      fontSize: 'clamp(12px, 1.4vw, 14px)',
                      color: '#f87171',
                      fontWeight: 600,
                      letterSpacing: '-0.005em',
                      lineHeight: 1.3,
                      marginTop: 2,
                    }}
                  >
                    over the past 30 days — and more are coming in
                  </p>
                </div>
              )}
              {showContent && !stateReady && (
                <div className="mb-4 sm:mb-6 px-1">
                  <div className="max-w-2xl mx-auto space-y-2">
                    <SkeletonShimmer width="w-full" height="h-6" className="rounded-md" />
                    <SkeletonShimmer width="w-4/5" height="h-6" className="mx-auto rounded-md" />
                  </div>
                </div>
              )}

              <div className={`flex-1 flex flex-col items-center w-full ${isLedgerView ? '' : 'sm:justify-center'}`}>
                {(showLoading || showSoftTimeout) && (
                  <div className="w-full space-y-6">
                    <div className="flex items-center justify-center gap-2 text-slate-300/80">
                      <Loader2 className="w-4 h-4 animate-spin" />
                      <p className="text-xs">{loadingMessage}</p>
                    </div>

                    {showSoftTimeout && (
                      <p className="text-xs text-amber-300/70 text-center">
                        Taking longer than usual. Please stay on this page.
                      </p>
                    )}

                    <div className="mt-4">
                      <ListingLoadingProgress
                        done={loadingProgress}
                        isComplete={false}
                      />
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                      <div className="bg-slate-800/40 backdrop-blur-sm border border-slate-700/50 rounded-2xl p-5 text-center space-y-4">
                        <div className="flex justify-center mb-2">
                          <SkeletonShimmer width="w-8" height="h-8" className="rounded-lg" />
                        </div>
                        <SkeletonShimmer width="w-40" height="h-6" className="mx-auto rounded-md" />
                        <SkeletonShimmer width="w-32" height="h-3" className="mx-auto rounded-md" />
                        <div className="flex items-center justify-center gap-2 flex-wrap md:flex-nowrap">
                          <SkeletonShimmer width="w-36" height="h-5" className="rounded-full" />
                          <SkeletonShimmer width="w-28" height="h-5" className="rounded-full" />
                        </div>
                      </div>
                      <div className="bg-slate-800/40 backdrop-blur-sm border border-slate-700/50 rounded-2xl p-5 flex flex-col items-center justify-center text-center space-y-3">
                        <SkeletonShimmer width="w-4" height="h-4" className="rounded-md" />
                        <SkeletonShimmer width="w-32" height="h-3" className="rounded-md" />
                        <SkeletonShimmer width="w-28" height="h-3" className="rounded-md" />
                        <SkeletonShimmer width="w-20" height="h-12" className="rounded-md" />
                        <SkeletonShimmer width="w-48" height="h-6" className="rounded-md" />
                      </div>
                    </div>
                    <div className="space-y-2 w-full">
                      <SkeletonShimmer width="w-full" height="h-12" className="rounded-xl" />
                      <SkeletonShimmer width="w-56" height="h-3" className="mx-auto rounded-md" />
                    </div>
                  </div>
                )}

                {showHardTimeout && (
                  <div className="bg-amber-900/30 border border-amber-500/40 rounded-2xl p-6 text-center max-w-md">
                    <AlertCircle className="w-10 h-10 text-amber-400 mx-auto mb-4" />
                    <p className="font-semibold text-amber-100 text-lg mb-2">
                      Taking too long to load
                    </p>
                    <p className="text-sm text-amber-200/70 mb-5">
                      We're having trouble loading this profile right now. This is usually temporary.
                    </p>
                    <div className="flex flex-col sm:flex-row gap-3 justify-center">
                      <button
                        onClick={handleRetry}
                        className="inline-flex items-center justify-center gap-2 bg-amber-500 hover:bg-amber-400 text-slate-900 font-semibold py-2.5 px-5 rounded-xl transition-colors"
                      >
                        <RefreshCw className="w-4 h-4" />
                        Retry
                      </button>
                      <Link
                        to="/your-agency"
                        className="inline-flex items-center justify-center gap-2 bg-slate-700 hover:bg-slate-600 text-white font-semibold py-2.5 px-5 rounded-xl transition-colors"
                      >
                        <ArrowLeft className="w-4 h-4" />
                        Back to search
                      </Link>
                    </div>
                  </div>
                )}

                {showError && (
                  <div className="bg-red-900/20 border border-red-500/30 rounded-2xl p-6 text-center max-w-md">
                    <AlertCircle className="w-8 h-8 text-red-400 mx-auto mb-3" />
                    <p className="font-semibold text-red-100">Agency not found</p>
                    <p className="text-sm text-red-200/70 mt-2 mb-4">We couldn't find this agency in our index.</p>
                    <div className="flex flex-col sm:flex-row gap-3 justify-center">
                      <button
                        onClick={handleRetry}
                        className="inline-flex items-center justify-center gap-2 bg-slate-700 hover:bg-slate-600 text-white font-semibold py-2 px-4 rounded-xl transition-colors text-sm"
                      >
                        <RefreshCw className="w-4 h-4" />
                        Try again
                      </button>
                      <Link
                        to="/your-agency"
                        className="inline-flex items-center justify-center gap-2 text-blue-300 hover:text-blue-200 font-semibold text-sm"
                      >
                        <ArrowLeft className="w-4 h-4" />
                        Search again
                      </Link>
                    </div>
                  </div>
                )}

                {showContent && isLedgerView && (
                  <div
                    ref={ledgerListRef}
                    className="w-full space-y-2"
                    style={{ minHeight: 0, display: 'flex', flexDirection: 'column' }}
                  >
                    {canonicalLoading && ledgerEntries.length === 0 ? (
                      <div className="space-y-2 py-4 rounded-2xl border border-white/10 bg-slate-900/60 backdrop-blur-sm px-3 sm:px-4">
                        <SkeletonShimmer width="w-full" height="h-12" className="rounded-md" />
                        <SkeletonShimmer width="w-full" height="h-12" className="rounded-md" />
                        <SkeletonShimmer width="w-full" height="h-12" className="rounded-md" />
                      </div>
                    ) : ledgerEntries.length === 0 ? (
                      <div className="rounded-2xl border border-white/10 bg-slate-900/60 backdrop-blur-sm px-4 py-6 text-center">
                        <p className="text-sm text-slate-300/70">
                          No recent requests to display.
                        </p>
                      </div>
                    ) : (
                      <ClientRequestLedger
                        entries={ledgerEntries}
                        heightPx={ledgerHeight}
                      />
                    )}

                    <div style={{ position: 'relative', zIndex: 50, pointerEvents: 'auto' }}>
                      <button
                        type="button"
                        onClick={handleLedgerActivationClick}
                        style={{
                          touchAction: 'manipulation',
                          WebkitTapHighlightColor: 'transparent',
                          cursor: 'pointer',
                          position: 'relative',
                          zIndex: 50,
                          pointerEvents: 'auto',
                        }}
                        className="cta-pulse-blue inline-flex items-center justify-center gap-2 w-full bg-gradient-to-r from-blue-600 to-blue-500 hover:from-blue-500 hover:to-blue-400 text-white font-bold py-3 px-6 rounded-xl transition-colors text-sm sm:text-base leading-tight cursor-pointer"
                      >
                        See what happens when clients try to contact you
                        <ArrowRight className="w-4 h-4" />
                      </button>
                    </div>
                  </div>
                )}

                {showContent && !isLedgerView && (
                  <div className="space-y-3 sm:space-y-6 w-full">
                    {showSyncIndicator && (
                      <div className="flex items-center justify-center gap-2 text-xs text-blue-300/70">
                        <Loader2 className="w-3 h-3 animate-spin" />
                        <span>Syncing latest details...</span>
                      </div>
                    )}

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3 sm:gap-6">
                      <div className="relative bg-slate-800/40 backdrop-blur-sm border border-blue-500/30 ring-1 ring-blue-500/20 rounded-2xl p-3.5 sm:p-5 text-center">
                        <span className="absolute top-3 left-3 text-[10px] font-semibold text-blue-300/60 uppercase tracking-widest">
                          Your listing
                        </span>
                        <div className="mb-1.5 sm:mb-2 flex justify-center mt-4 sm:mt-3">
                          <div className="w-8 h-8 sm:w-9 sm:h-9 rounded-xl bg-gradient-to-br from-blue-400 to-blue-600 flex items-center justify-center shadow-lg shadow-blue-500/20">
                            <Building2 className="w-4 h-4 sm:w-5 sm:h-5 text-white" />
                          </div>
                        </div>
                        <h2 className={`${agencyNameClasses(agency!.name)} font-bold text-white mb-1 leading-tight break-words`} style={{ maxWidth: '22ch', margin: '0 auto' }}>{agency!.name}</h2>
                        {agency!.domain && (
                          <a
                            href={agency!.domain.includes('://') ? agency!.domain : `https://${agency!.domain}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            title={agency!.domain}
                            className="inline-flex items-center gap-1 text-xs text-blue-300 hover:text-blue-200 mb-2 sm:mb-3 min-w-0 transition-colors"
                          >
                            <Globe className="w-3 h-3 flex-shrink-0" />
                            <span className="truncate">
                              {extractDisplayUrl(agency!.domain)}
                            </span>
                          </a>
                        )}
                        <div className="flex items-center justify-center gap-2 flex-wrap md:flex-nowrap">
                          <span className="inline-flex items-center gap-1 text-xs font-semibold px-2.5 py-0.5 rounded-full bg-blue-500/20 text-blue-200 border border-blue-500/30">
                            <MapPin className="w-3 h-3" />
                            Listed in {new Set(listings.map((l) => l.state_slug)).size} state{new Set(listings.map((l) => l.state_slug)).size !== 1 ? 's' : ''}
                          </span>
                          {listings.some((l) => l.section === 'top25') && (
                            <span className="inline-flex items-center gap-1 text-xs font-semibold px-2.5 py-0.5 rounded-full bg-amber-500/20 text-amber-200 border border-amber-500/30">
                              <Star className="w-3 h-3 fill-amber-400 text-amber-400" />
                              Top 25 Listed
                            </span>
                          )}
                        </div>
                      </div>

                      <AvailabilityStatsCard
                        missedCount={canonical.missedCount}
                        loading={!stateReady}
                      />
                    </div>

                    <div className="space-y-1.5 sm:space-y-3">
                      {listings.length === 1 ? (
                        <>
                          {!ctaEnabled && (
                            <button
                              disabled
                              className="block w-full bg-blue-600/40 text-white/50 font-semibold py-2.5 sm:py-4 px-6 rounded-xl text-center cursor-not-allowed text-sm sm:text-lg transition-opacity"
                              aria-label="Loading availability data, please wait"
                            >
                              Loading your availability data...
                            </button>
                          )}

                          {ctaEnabled && (
                            <div className="space-y-2 sm:space-y-2.5 relative z-10 pointer-events-auto">
                              <button
                                type="button"
                                onClick={handleViewRequestsClick}
                                style={{ touchAction: 'manipulation', WebkitTapHighlightColor: 'transparent' }}
                                className="cta-pulse-blue block w-full bg-gradient-to-r from-blue-600 to-blue-500 hover:from-blue-500 hover:to-blue-400 text-white font-bold py-2.5 sm:py-4 px-6 rounded-xl transition-colors text-center text-sm sm:text-lg leading-tight cursor-pointer relative z-10 pointer-events-auto"
                              >
                                {isFromManageListing ? 'Activate your listing →' : 'See your recent client requests →'}
                              </button>
                              {isFromManageListing && (
                                <p className="text-xs text-slate-300/70 text-center leading-snug">
                                  Start receiving clients immediately (takes 30 seconds)
                                </p>
                              )}
                            </div>
                          )}
                        </>
                      ) : (
                        <>
                          {ctaEnabled && (
                            <>
                              <button
                                type="button"
                                onClick={handleViewRequestsClick}
                                style={{ touchAction: 'manipulation', WebkitTapHighlightColor: 'transparent' }}
                                className={`cta-pulse-blue block w-full bg-gradient-to-r from-blue-600 to-blue-500 hover:from-blue-500 hover:to-blue-400 text-white font-bold py-2.5 sm:py-4 px-6 rounded-xl transition-colors text-center text-sm sm:text-lg leading-tight cursor-pointer relative z-10 pointer-events-auto ${isFromManageListing ? 'mb-1' : 'mb-2 sm:mb-3'}`}
                              >
                                {isFromManageListing ? 'Activate your listing →' : 'See your recent client requests →'}
                              </button>
                              {isFromManageListing && (
                                <p className="text-xs text-slate-300/70 text-center leading-snug mb-2 sm:mb-3">
                                  Start receiving clients immediately (takes 30 seconds)
                                </p>
                              )}
                            </>
                          )}
                          <div className="space-y-2">
                            <p className="text-xs font-semibold text-slate-300 uppercase tracking-wider text-center">Your listings:</p>
                            {listings.map((listing) => (
                              ctaEnabled ? (
                                <Link
                                  key={`${listing.state_slug}-${listing.section}`}
                                  to={buildOwnerUrl(listing)}
                                  onClick={() => handleCtaClick(listing)}
                                  className="flex items-center justify-between gap-3 p-3 bg-slate-700/40 hover:bg-slate-700/60 border border-slate-600/50 rounded-lg transition-colors"
                                >
                                  <span className="text-sm font-medium text-white">View my {slugToStateName(listing.state_slug)} listing</span>
                                  <div className="flex items-center gap-2">
                                    <SectionBadge section={listing.section} rank={listing.rank} />
                                    <ChevronRight className="w-4 h-4 text-slate-400" />
                                  </div>
                                </Link>
                              ) : (
                                <div
                                  key={`${listing.state_slug}-${listing.section}`}
                                  className="flex items-center justify-between gap-3 p-3 bg-slate-700/20 border border-slate-600/30 rounded-lg opacity-50 cursor-not-allowed select-none"
                                  aria-disabled="true"
                                >
                                  <span className="text-sm font-medium text-white/60">View my {slugToStateName(listing.state_slug)} listing</span>
                                  <div className="flex items-center gap-2">
                                    <SectionBadge section={listing.section} rank={listing.rank} />
                                    <ChevronRight className="w-4 h-4 text-slate-400/50" />
                                  </div>
                                </div>
                              )
                            ))}
                          </div>
                          <p className="text-xs text-slate-400 text-center">
                            See exactly how a client finds your agency and what happens when they click 'Check availability'.
                          </p>
                        </>
                      )}
                    </div>
                  </div>
                )}

                {!showContent && !showLoading && !showSoftTimeout && !showHardTimeout && !showError && agency && listings.length === 0 && (
                  <div className="bg-amber-900/20 border border-amber-500/30 rounded-2xl p-6 text-center">
                    <AlertCircle className="w-8 h-8 text-amber-400 mx-auto mb-3" />
                    <p className="font-semibold text-amber-100">No listings found</p>
                    <p className="text-sm text-amber-200/70 mt-2">We didn't find {agency.name} in our listing index yet.</p>
                  </div>
                )}
              </div>
            </div>
          </section>

          <section className="max-w-3xl mx-auto px-4 py-10 md:py-14" />
        </main>

        <FooterWrapper />
      </div>
    </>
  );
}

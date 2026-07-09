import { useEffect, useState, useRef } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { Eye, Mail, Crown, Zap, CreditCard } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useCanonicalAgency } from '../hooks/useCanonicalAgency';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';
import ServicesBadges from '../components/ServicesBadges';
import { getRetainerAmountWithFallback, formatCurrency, DEFAULT_RETAINER_AMOUNT } from '../utils/retainerUtils';
import { getStateContextFromSearchParams } from '../utils/stateContext';
import { logFunnelEvent, FUNNEL_EVENTS } from '../utils/yourAgencyFunnel';
import { formatStateName } from '../utils/formatLocation';
import { buildActivationDirectLink } from '../utils/activationDirectLink';

interface Agency {
  id: string;
  slug?: string | null;
  name: string;
  state_name: string;
  location: string;
  intro: string;
  services: string[];
  created_at: string;
  average_retainer_range?: string | null;
  average_retainer_amount?: number | null;
  website_url?: string | null;
}

interface Metrics {
  view_count_last_30_days: number;
  availability_requests_last_30_days: number;
}

const MOCK_OTHER_AGENCIES: Agency[] = [
  {
    id: "0a13b250-b119-45fc-84ce-d3848dcff951",
    name: "Garden State Digital",
    state_name: "",
    location: "",
    intro: "Full-service digital marketing agency helping local businesses grow through data-driven campaigns and conversion-focused websites.",
    services: ["SEO", "PPC", "Web Design", "Content Marketing"],
    created_at: new Date().toISOString(),
    average_retainer_range: null
  },
  {
    id: "e748c792-3bc0-4c05-8eaa-33320f2d97e1",
    name: "Shoreline Marketing Co.",
    state_name: "",
    location: "",
    intro: "Specialized in performance marketing for startups and ecommerce brands, with a strong focus on ROI and lead generation.",
    services: ["Paid Social", "Email Marketing", "Conversion Optimization", "Analytics"],
    created_at: new Date().toISOString(),
    average_retainer_range: null
  },
  {
    id: "0076a8ed-86da-461a-a3f0-8b0041fac8c2",
    name: "Hudson River Creative",
    state_name: "",
    location: "",
    intro: "Branding and creative studio that builds modern digital experiences, from strategy and design to launch.",
    services: ["Branding", "Web Development", "UX/UI Design", "Content Creation"],
    created_at: new Date().toISOString(),
    average_retainer_range: null
  },
  {
    id: "431c15ac-0039-431b-b4e1-56aef27cd281",
    name: "Pinecone Performance Agency",
    state_name: "",
    location: "",
    intro: "Performance-driven agency helping B2B and local service companies generate high-quality leads online.",
    services: ["Lead Generation", "Local SEO", "Google Ads", "Marketing Strategy"],
    created_at: new Date().toISOString(),
    average_retainer_range: null
  }
];

export default function AvailabilityOwnerPreviewPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();

  // All params resolved synchronously from searchParams — no deferred state
  const agencyId = searchParams.get('agencyId');
  const isPlaceholder = searchParams.get('placeholder') === '1';
  const { stateSlug, stateName } = getStateContextFromSearchParams(searchParams);
  const hideVisitorCard = searchParams.get('fromDemo') === '1';
  const showStep5 = searchParams.get('step') === '5';
  const showStep6 = searchParams.get('step') === '6';
  const agencyLogoUrl = searchParams.get('agencyLogoUrl') || '';

  // All hooks declared unconditionally at top level
  const [agency, setAgency] = useState<Agency | null>(null);
  const [metrics, setMetrics] = useState<Metrics>({ view_count_last_30_days: 0, availability_requests_last_30_days: 0 });
  const [displayedRequests, setDisplayedRequests] = useState<number | null>(null);
  const [lastVisitCount, setLastVisitCount] = useState<number | null>(null);
  const [showGrowthIndicator, setShowGrowthIndicator] = useState(false);
  const [loading, setLoading] = useState(true);
  const [pageError, setPageError] = useState<string | null>(null);
  const [activating, setActivating] = useState(false);
  const [step6Countdown, setStep6Countdown] = useState(5);
  const [step6Cancelled, setStep6Cancelled] = useState(false);
  const [kpiTimeout, setKpiTimeout] = useState(false);

  const step5ModalRef = useRef<HTMLDivElement>(null);
  const autoRedirectFiredRef = useRef(false);
  const activateHandlerRef = useRef<(() => void) | null>(null);

  const { agency: canonical, loading: canonicalLoading } = useCanonicalAgency(agency?.slug || undefined);

  useEffect(() => {
    if (canonicalLoading) return;
    const total = normalizeDisplayedMissedCount(canonical.missedCount);
    setDisplayedRequests(total);
    if (agencyId) {
      const key = `last_visit_${agencyId}`;
      try {
        const stored = localStorage.getItem(key);
        if (stored) {
          const last = parseInt(stored, 10);
          if (!isNaN(last) && total > last) {
            setLastVisitCount(last);
            setShowGrowthIndicator(true);
          }
        }
        localStorage.setItem(key, total.toString());
      } catch { }
    }
  }, [canonicalLoading, canonical.missedCount, agencyId]);

  const displayStateName = formatStateName(isPlaceholder ? stateName : (agency?.state_name || stateName));

  // Escape key suppressor (step 5 only — harmless on other steps)
  useEffect(() => {
    if (!showStep5) return;
    const handler = (e: KeyboardEvent) => {
      if (e.key === 'Escape') e.preventDefault();
    };
    window.addEventListener('keydown', handler, true);
    return () => window.removeEventListener('keydown', handler, true);
  }, [showStep5]);

  const trackedUpsellView = useRef(false);

  useEffect(() => {
    document.title = 'Private Owner View | Gappsy';

    if (!trackedUpsellView.current && agencyId) {
      trackedUpsellView.current = true;
      logFunnelEvent({
        ...FUNNEL_EVENTS.MISSED_CLIENTS_CTA_CLICKED,
        agency_id: agencyId,
        state_slug: stateSlug ?? undefined,
      });
    }

    if (import.meta.env.DEV) {
      console.log('[OwnerPreview] Page loaded');
      console.log('[OwnerPreview] fromDemo flag:', hideVisitorCard ? 'YES (visitor card hidden)' : 'NO (visitor card shown)');
    }
  }, [hideVisitorCard, agencyId, stateSlug]);

  useEffect(() => {
    async function loadData() {
      try {
        if (!agencyId) {
          if (import.meta.env.DEV) {
            console.error('[OwnerPreview] Missing agencyId on page load');
          }
          setPageError('Missing required parameters. Please go back and try again.');
          setLoading(false);
          return;
        }

        if (import.meta.env.DEV) {
          console.log('[OwnerPreview] ═══════════════════════════════════════');
          console.log('[OwnerPreview] Loading agency data for ID:', agencyId);
          console.log('[OwnerPreview] State slug:', stateSlug);
        }

        const { data: agencyData, error: agencyError } = await supabase
          .from('other_agencies')
          .select('id, slug, name, state_name, location, intro, services, created_at, average_retainer_range, average_retainer_amount, website_url')
          .eq('id', agencyId)
          .maybeSingle();

        if (import.meta.env.DEV) {
          console.log('[OwnerPreview] Database query completed');
          console.log('[OwnerPreview] Error?', agencyError);
          console.log('[OwnerPreview] Data received?', !!agencyData);
        }

        if (agencyError) {
          if (import.meta.env.DEV) {
            console.error('[OwnerPreview] Database error:', agencyError);
          }
          throw agencyError;
        }

        if (!agencyData) {
          if (import.meta.env.DEV) {
            console.warn('[OwnerPreview] No agency found in database for id:', agencyId);
            console.log('[OwnerPreview] Using fallback mock agency for this ID');
          }
          const fallbackAgency = MOCK_OTHER_AGENCIES.find(a => a.id === agencyId) || MOCK_OTHER_AGENCIES[0];
          if (import.meta.env.DEV) {
            console.log('[OwnerPreview] Fallback agency:', fallbackAgency.name);
          }
          setAgency({ ...fallbackAgency, state_name: stateName, location: '' });
        } else {
          if (import.meta.env.DEV) {
            console.log('[OwnerPreview] Agency loaded from database:', agencyData.name);
          }
          const finalAgencyData = isPlaceholder
            ? { ...agencyData, state_name: stateName, location: '' }
            : agencyData;
          setAgency(finalAgencyData);
        }

        const { data: metricsData } = await supabase
          .from('agency_metrics')
          .select('view_count_last_30_days, availability_requests_last_30_days')
          .eq('agency_id', agencyId)
          .maybeSingle();

        if (metricsData) {
          setMetrics(metricsData);
        }
      } catch (error) {
        if (import.meta.env.DEV) {
          console.error('[OwnerPreview] Error loading data:', error);
          console.log('[OwnerPreview] Using fallback mock agency due to error');
        }
        const fallbackAgency = MOCK_OTHER_AGENCIES.find(a => a.id === agencyId) || MOCK_OTHER_AGENCIES[0];
        if (import.meta.env.DEV) {
          console.log('[OwnerPreview] Fallback agency:', fallbackAgency.name);
        }
        setAgency({ ...fallbackAgency, state_name: stateName, location: '' });
      } finally {
        setLoading(false);
      }
    }

    loadData();
  }, [agencyId, stateSlug, navigate]);

  const reqVal = displayedRequests ?? 0;
  const kpiLoaded = !canonicalLoading && displayedRequests !== null;

  useEffect(() => {
    if (kpiLoaded) return;
    const t = setTimeout(() => setKpiTimeout(true), 5000);
    return () => clearTimeout(t);
  }, [kpiLoaded]);

  const ctaReady = kpiLoaded || kpiTimeout;

  // Step 6 auto-redirect countdown
  useEffect(() => {
    if (!showStep6 || step6Cancelled || autoRedirectFiredRef.current) return;
    activateHandlerRef.current = handleActivateListingClick;
    const timer = setInterval(() => {
      setStep6Countdown(prev => {
        if (prev <= 1) {
          clearInterval(timer);
          if (!autoRedirectFiredRef.current) {
            autoRedirectFiredRef.current = true;
            activateHandlerRef.current?.();
          }
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
    return () => clearInterval(timer);
  }, [showStep6, step6Cancelled]);

  // --- Render guards ---

  // While loading: show a neutral skeleton that matches the step-5 layout to avoid flicker.
  // For step=5 we render a step-5-shaped skeleton so the correct branch is committed first.
  if (loading) {
    if (showStep5 || showStep6) {
      return (
        <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 py-8 px-3 md:px-4 flex items-start justify-center">
          <div className="w-full max-w-[680px] animate-pulse space-y-4">
            <div className="h-10 bg-slate-200 rounded-lg w-3/4" />
            <div className="h-32 bg-slate-200 rounded-lg" />
            <div className="h-24 bg-slate-200 rounded-lg" />
            <div className="h-40 bg-slate-200 rounded-lg" />
          </div>
        </div>
      );
    }
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="flex flex-col items-center gap-3">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-slate-400"></div>
        </div>
      </div>
    );
  }

  if (!agency) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100">
        <div className="text-center p-6">
          <p className="text-slate-600 mb-4">We couldn't load your agency details.</p>
          <button
            onClick={() => navigate(-1)}
            className="text-slate-600 hover:text-slate-700 font-medium"
          >
            Go back
          </button>
        </div>
      </div>
    );
  }

  // Calculate metrics (used by both branches)
  const retainerAmount = getRetainerAmountWithFallback(
    agency.average_retainer_amount,
    agency.average_retainer_range
  );
  const effectiveRetainer = retainerAmount ?? DEFAULT_RETAINER_AMOUNT;
  const estimatedMissedRevenue =
    displayedRequests !== null && displayedRequests > 0
      ? effectiveRetainer * displayedRequests
      : null;

  if (import.meta.env.DEV) {
    console.log('[OwnerPreview] ═══════════════════════════════════════');
    console.log('[OwnerPreview] Missed Revenue Calculation:');
    console.log('[OwnerPreview]   - Retainer amount ($):', agency.average_retainer_amount);
    console.log('[OwnerPreview]   - Legacy range:', agency.average_retainer_range);
    console.log('[OwnerPreview]   - Final amount used ($):', retainerAmount);
    console.log('[OwnerPreview]   - Availability requests:', displayedRequests);
    console.log('[OwnerPreview]   - Estimated missed revenue ($):', estimatedMissedRevenue);
    console.log('[OwnerPreview] ═══════════════════════════════════════');
  }

  const handleActivateListingClick = () => {
    if (activating) return;
    if (!agencyId) {
      if (import.meta.env.DEV) {
        console.error('[OwnerPreview] Cannot navigate to activation: missing agencyId');
      }
      return;
    }
    setActivating(true);
    const baseUrl = buildActivationDirectLink({
      agencyId: agencyId.trim(),
      stateSlug,
      agencyName: agency?.name || '',
      stateName: agency?.state_name || stateName || '',
      agencyDescription: agency?.intro || '',
    });
    if (!baseUrl) {
      setActivating(false);
      return;
    }
    const extras: string[] = [];
    if (isPlaceholder) extras.push('placeholder=1');
    if (agencyLogoUrl) extras.push(`agencyLogoUrl=${encodeURIComponent(agencyLogoUrl)}`);
    const finalUrl = extras.length ? `${baseUrl}&${extras.join('&')}` : baseUrl;
    console.log('ACTIVATION_DIRECT_LINK GENERATED:', finalUrl);
    navigate(finalUrl);
  };

  const handleGoToStep6 = () => {
    const base = Array.from(searchParams.entries()).filter(([k]) => k !== 'step');
    const p = new URLSearchParams(base);
    p.set('step', '6');
    navigate(`/availability/owner-preview?${p.toString()}`);
  };

  if (pageError) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100 px-4">
        <div className="max-w-md w-full bg-white rounded-lg shadow-lg p-6 text-center space-y-4">
          <h1 className="text-xl font-bold text-slate-900">Unable to load your listing</h1>
          <p className="text-sm text-slate-600">Your listing details could not be loaded. Please go back and try again.</p>
          <div className="flex gap-3 justify-center pt-2">
            <button
              onClick={() => navigate(-1)}
              className="px-4 py-2 bg-slate-200 text-slate-700 rounded-lg font-medium hover:bg-slate-300 transition-colors"
            >
              Go back
            </button>
            <button
              onClick={() => navigate('/')}
              className="px-4 py-2 bg-slate-700 text-white rounded-lg font-medium hover:bg-slate-800 transition-colors"
            >
              Go to homepage
            </button>
          </div>
        </div>
      </div>
    );
  }

  // ─── STEP 5: Full-page render (no modal overlay, no backdrop) ───────────────
  if (showStep5) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 py-4 md:py-8 px-3 md:px-4">
        <div
          ref={step5ModalRef}
          className="w-full max-w-[680px] mx-auto bg-white rounded-xl shadow-lg overflow-hidden"
        >
          <div className="p-3 md:p-6 space-y-2 md:space-y-5">
            {hideVisitorCard ? (
              <>
                <div className="bg-white text-center space-y-1.5 md:space-y-2 p-2 md:p-4">
                  <h2 className="text-lg md:text-2xl font-bold text-slate-900 leading-tight">
                    You&rsquo;re losing clients right now
                  </h2>
                  <p className="text-sm md:text-base text-slate-700 leading-snug">
                    {kpiLoaded ? reqVal : '\u2014'} client requests were sent to other agencies in the last 30 days
                  </p>
                  <p className="text-xs md:text-sm text-slate-500 leading-snug">
                    &asymp; {formatCurrency(estimatedMissedRevenue ?? effectiveRetainer * reqVal)} in missed revenue
                  </p>
                </div>

                {!ctaReady && (
                  <div className="bg-slate-800/50 rounded-lg h-20 md:h-24 animate-pulse" />
                )}
                {ctaReady && (
                  <div className="bg-gradient-to-br from-slate-800 to-slate-900 text-white rounded-lg p-2.5 md:p-4">
                    <button
                      onClick={handleActivateListingClick}
                      className="w-full bg-white text-slate-800 py-2 md:py-3 px-4 rounded-lg font-bold hover:bg-slate-100 transition-colors shadow-md hover:shadow-lg inline-flex items-center justify-center gap-2 text-sm md:text-base"
                    >
                      <Zap className="w-4 h-4 md:w-5 md:h-5 shrink-0" />
                      <span>Stop losing clients &mdash; activate your listing now</span>
                    </button>
                  </div>
                )}
              </>
            ) : (
            <>
            {/* Urgency header */}
            <div>
              <h2 className="hidden md:block text-xl font-bold text-slate-900 mb-3">You missed these clients</h2>

              {/* Mobile: Combined single card */}
              <div className="md:hidden bg-slate-50 rounded-lg p-2 grid grid-cols-2 gap-2 mb-2">
                <div className="space-y-0.5">
                  <div className="flex items-center gap-1">
                    <Mail className="w-3 h-3 text-slate-600 shrink-0" />
                    <h3 className="text-[10px] font-medium text-slate-600 leading-tight">Client requests missed (last 30 days)</h3>
                  </div>
                  <div className="text-lg font-bold text-slate-900 leading-tight">{kpiLoaded ? reqVal : '—'}</div>
                  {showGrowthIndicator && lastVisitCount !== null && kpiLoaded && (
                    <div className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 px-1.5 py-0.5 rounded text-[10px] font-bold">
                      +{reqVal - lastVisitCount}
                    </div>
                  )}
                </div>
                <div className="space-y-0.5">
                  <div className="flex items-center gap-1">
                    <CreditCard className="w-3 h-3 text-slate-700 shrink-0" />
                    <h3 className="text-[10px] font-medium text-slate-600 leading-tight">Revenue lost (last 30 days)</h3>
                  </div>
                  <div className="text-lg font-bold text-slate-900 leading-tight">
                    {estimatedMissedRevenue !== null ? formatCurrency(estimatedMissedRevenue) : '—'}
                  </div>
                  {estimatedMissedRevenue !== null && effectiveRetainer > 0 && (
                    <div className="text-[9px] text-slate-500 leading-tight">
                      Based on avg. retainer: {formatCurrency(effectiveRetainer)}/mo
                    </div>
                  )}
                </div>
              </div>

              {/* Desktop: Two cards */}
              <div className="hidden md:grid md:grid-cols-2 md:gap-3 mb-4">
                <div className="bg-slate-50 rounded-lg p-4 space-y-2">
                  <div className="flex items-center gap-2">
                    <Mail className="w-5 h-5 text-slate-600 shrink-0" />
                    <span className="text-3xl font-bold text-slate-900">{kpiLoaded ? reqVal : '—'}</span>
                  </div>
                  <h3 className="text-sm font-semibold text-slate-900">Client requests missed (last 30 days)</h3>
                  {showGrowthIndicator && lastVisitCount !== null && kpiLoaded && (
                    <div className="inline-flex items-center gap-1.5 bg-orange-100 text-orange-700 px-2 py-1 rounded text-xs font-bold">
                      +{reqVal - lastVisitCount} since last visit
                    </div>
                  )}
                </div>
                <div className="bg-slate-50 rounded-lg p-4 space-y-2">
                  <div className="flex items-center gap-2">
                    <CreditCard className="w-5 h-5 text-slate-700 shrink-0" />
                    <span className="text-3xl font-bold text-slate-900">{formatCurrency(estimatedMissedRevenue ?? effectiveRetainer * reqVal)}</span>
                  </div>
                  <h3 className="text-sm font-semibold text-slate-900">Revenue lost (last 30 days)</h3>
                  {effectiveRetainer > 0 && (
                    <p className="text-xs text-slate-500 leading-snug">
                      Based on avg. retainer: {formatCurrency(effectiveRetainer)}/mo
                    </p>
                  )}
                </div>
              </div>

            </div>

            {kpiLoaded && (
              <div className="bg-red-50 border border-red-200 rounded-lg p-2 md:p-3">
                <p className="text-[11px] md:text-sm font-semibold text-red-900 leading-snug">You're receiving 0 of these requests</p>
                <p className="text-[11px] md:text-xs text-red-700 mt-0.5 leading-snug">Clients are being redirected right now.</p>
              </div>
            )}

            {/* Continue CTA section — strict 3-state: loading / ready / unavailable */}

            {/* STATE 1: LOADING */}
            {!ctaReady && (
              <div className="bg-slate-800/50 rounded-lg h-28 md:h-36 animate-pulse" />
            )}

            {/* STATE 2: READY — show persuasive CTA */}
            {ctaReady && (
              <div className="bg-gradient-to-br from-slate-800 to-slate-900 text-white rounded-lg p-2.5 md:p-4 space-y-1.5 md:space-y-2.5">
                <div>
                  <h2 className="text-sm md:text-lg font-bold flex items-center gap-2">
                    <Crown className="w-4 h-4 md:w-5 md:h-5 text-white" />
                    One step left to fix this
                  </h2>
                  <p className="text-[11px] md:text-sm text-slate-300 leading-snug mt-0.5">
                    Start receiving client requests directly.
                  </p>
                </div>

                <div className="space-y-1.5">
                  <button
                    onClick={handleActivateListingClick}
                    className="w-full bg-white text-slate-800 py-2 md:py-3 px-4 rounded-lg font-bold hover:bg-slate-100 transition-colors shadow-md hover:shadow-lg inline-flex items-center justify-center gap-2 text-sm md:text-base"
                  >
                    <Zap className="w-4 h-4 md:w-5 md:h-5 shrink-0" />
                    <span>Stop losing clients — activate your listing now</span>
                  </button>
                  <p className="text-center text-[10px] md:text-xs text-red-400 font-medium leading-tight">Clients are being redirected right now.</p>
                </div>
              </div>
            )}
            </>
            )}

          </div>
        </div>
      </div>
    );
  }

  // ─── STEP 6: Activation screen ───────────────────────────────────────────────
  if (showStep6) {
    return (
      <div className="min-h-screen bg-slate-900 flex items-start justify-center py-8 px-4">
        <div className="w-full max-w-[520px] mx-auto space-y-5">

          {/* Auto-redirect countdown */}
          {!step6Cancelled && step6Countdown > 0 && (
            <div className="text-center space-y-2">
              <p className="text-slate-400 text-sm">
                Activating automatically in{' '}
                <span className="text-white font-bold tabular-nums">{step6Countdown}s</span>
                {' — '}
                <button
                  onClick={() => setStep6Cancelled(true)}
                  className="text-slate-500 hover:text-slate-300 underline text-sm transition-colors"
                >
                  Cancel
                </button>
              </p>
              <div className="h-1 bg-slate-700 rounded-full overflow-hidden max-w-[200px] mx-auto">
                <div
                  className="h-full bg-white/50 rounded-full transition-all duration-1000"
                  style={{ width: `${(step6Countdown / 5) * 100}%` }}
                />
              </div>
            </div>
          )}

          {/* Main activation card */}
          <div className="bg-slate-800 rounded-2xl overflow-hidden shadow-2xl">

            {/* Status pill header */}
            <div className="bg-slate-700/60 border-b border-slate-700 px-6 py-3 flex items-center justify-between">
              <div className="flex items-center gap-2">
                <span className="w-2 h-2 rounded-full bg-red-400 animate-pulse inline-block" />
                <span className="text-xs font-semibold text-red-300 uppercase tracking-widest">Clients being redirected now</span>
              </div>
              <span className="text-xs text-slate-400">{agency.state_name || displayStateName}</span>
            </div>

            <div className="p-6 md:p-8 space-y-6">

              {/* Heading */}
              <div className="text-center">
                <h1 className="text-2xl md:text-3xl font-extrabold text-white leading-tight">
                  One step left to fix this
                </h1>
              </div>

              {/* Stats reminder */}
              <div className="grid grid-cols-2 gap-3">
                <div className="bg-slate-700/50 rounded-xl p-4 text-center border border-slate-600/40">
                  <div className="text-3xl font-extrabold text-white tabular-nums">{kpiLoaded ? reqVal : '—'}</div>
                  <div className="text-xs text-slate-400 mt-1 leading-snug">client requests missed (last 30 days)</div>
                </div>
                {estimatedMissedRevenue !== null ? (
                  <div className="bg-slate-700/50 rounded-xl p-4 text-center border border-slate-600/40">
                    <div className="text-3xl font-extrabold text-white">{formatCurrency(estimatedMissedRevenue)}</div>
                    <div className="text-xs text-slate-400 mt-1 leading-snug">revenue lost (last 30 days)</div>
                    {effectiveRetainer > 0 && (
                      <div className="text-[10px] text-slate-500 mt-1.5 leading-snug">
                        Based on avg. retainer: {formatCurrency(effectiveRetainer)}/mo
                      </div>
                    )}
                  </div>
                ) : (
                  <div className="bg-slate-700/50 rounded-xl p-4 text-center border border-slate-600/40">
                    <div className="text-3xl font-extrabold text-slate-500">—</div>
                    <div className="text-xs text-slate-400 mt-1 leading-snug">revenue lost (last 30 days)</div>
                  </div>
                )}
              </div>

              {/* Big CTA */}
              <div className="space-y-3">
                <button
                  onClick={handleActivateListingClick}
                  disabled={activating}
                  className="step6-cta-pulse w-full bg-white text-slate-900 py-4 px-6 rounded-xl font-extrabold text-lg md:text-xl hover:bg-slate-100 transition-colors inline-flex items-center justify-center gap-3 disabled:opacity-70 disabled:cursor-not-allowed"
                >
                  {activating ? (
                    <div className="w-6 h-6 border-2 border-slate-400 border-t-slate-900 rounded-full animate-spin" />
                  ) : (
                    <Zap className="w-6 h-6 shrink-0" />
                  )}
                  <span>{activating ? 'Loading checkout…' : 'Stop losing clients \u2014 activate your listing now'}</span>
                </button>

                <div className="text-center space-y-1">
                  <p className="text-red-400 text-xs font-medium">Clients are being redirected right now.</p>
                  <p className="text-slate-500 text-xs">$97 every 6 months — cancel anytime</p>
                </div>
              </div>

            </div>
          </div>

        </div>
      </div>
    );
  }

  // ─── DEFAULT: Normal owner preview page (steps 1–4) ─────────────────────────
  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 py-3 md:py-4 px-3 md:px-4">
      <div className="max-w-3xl mx-auto space-y-3 md:space-y-4">
        {/* Compact Private Banner */}
        <div className="bg-slate-700 text-white rounded-lg px-3 py-2 md:px-4 md:py-2 flex items-center gap-2 shadow-sm">
          <Eye className="w-3.5 h-3.5 md:w-4 md:h-4 flex-shrink-0" />
          <span className="text-xs md:text-sm font-medium">Private owner view — only visible to you</span>
        </div>

        {/* What Visitors See - Hidden after demo since owner already saw it */}
        {!hideVisitorCard && (
          <div className="bg-white rounded-lg shadow-sm p-3 md:p-4 space-y-2">
            <h2 className="text-sm md:text-base font-semibold text-slate-900">What visitors currently see</h2>

            <div className="border border-slate-200 rounded-lg p-2.5 md:p-3 space-y-1.5 md:space-y-2">
              <div>
                <h3 className="font-semibold text-slate-900 text-sm md:text-base">{agency.name}</h3>
                <p className="text-xs text-slate-600">
                  {agency.location ? `${agency.location}, ${agency.state_name}` : agency.state_name}
                </p>
              </div>

              <p className="text-xs text-slate-600 leading-snug line-clamp-2">
                {agency.intro}
              </p>

              {agency.services && agency.services.length > 0 && (
                <ServicesBadges
                  services={agency.services}
                  badgeStyle={{
                    fontSize: '10px',
                    padding: '3px 6px',
                    backgroundColor: '#f1f5f9',
                    color: '#475569',
                    border: '1px solid #e2e8f0',
                    borderRadius: '4px'
                  }}
                />
              )}

              <button
                disabled
                className="w-full bg-slate-200 text-slate-400 py-1.5 rounded-lg font-medium text-xs cursor-not-allowed"
              >
                Check Availability
              </button>
            </div>

            <p className="text-xs text-slate-500 leading-snug">
              This is how your agency appears in "Other Agencies in {agency.state_name}". Contact details aren't shown yet.
            </p>
          </div>
        )}

        {/* Compact Stats Section */}
        <div className="bg-white rounded-lg shadow-sm p-2 md:p-4 space-y-1.5 md:space-y-3">
          <h2 className="text-sm md:text-base font-semibold text-slate-900">You are currently losing clients</h2>

          {/* Mobile: Combined single card with 2-column layout */}
          <div className="md:hidden bg-slate-50 rounded-lg p-2 grid grid-cols-2 gap-2">
            <div className="space-y-0.5">
              <div className="flex items-center gap-1">
                <Mail className="w-3 h-3 text-slate-600 flex-shrink-0" />
                <h3 className="text-[10px] font-medium text-slate-600 leading-tight">Client requests missed (30d)</h3>
              </div>
              <div className="text-lg font-bold text-slate-900 leading-tight">{kpiLoaded ? reqVal : '—'}</div>
              {showGrowthIndicator && lastVisitCount !== null && kpiLoaded && (
                <div className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 px-1.5 py-0.5 rounded text-[10px] font-bold">
                  +{reqVal - lastVisitCount}
                </div>
              )}
            </div>
            <div className="space-y-0.5">
              <div className="flex items-center gap-1">
                <CreditCard className="w-3 h-3 text-slate-700 flex-shrink-0" />
                <h3 className="text-[10px] font-medium text-slate-600 leading-tight">Revenue lost (30d)</h3>
              </div>
              <div className="text-lg font-bold text-slate-900 leading-tight">
                {estimatedMissedRevenue !== null ? formatCurrency(estimatedMissedRevenue) : '—'}
              </div>
              {estimatedMissedRevenue !== null && effectiveRetainer > 0 && (
                <div className="text-[9px] text-slate-500 leading-tight">
                  Based on avg. retainer: {formatCurrency(effectiveRetainer)}/mo
                </div>
              )}
            </div>
          </div>

          {/* Desktop: Two separate cards side by side */}
          <div className="hidden md:grid md:grid-cols-2 md:gap-3">
            <div className="bg-slate-50 rounded-lg p-4 space-y-2">
              <div className="flex items-center gap-2">
                <Mail className="w-5 h-5 text-slate-600 flex-shrink-0" />
                <span className="text-2xl font-bold text-slate-900">{kpiLoaded ? reqVal : '—'}</span>
              </div>
              <h3 className="text-sm font-semibold text-slate-900">Client requests missed (last 30 days)</h3>
              {showGrowthIndicator && lastVisitCount !== null && kpiLoaded && (
                <div className="inline-flex items-center gap-1.5 bg-orange-100 text-orange-700 px-2 py-1 rounded text-xs font-bold">
                  +{reqVal - lastVisitCount} since last visit
                </div>
              )}
            </div>

            <div className="bg-slate-50 rounded-lg p-4 space-y-2">
              <div className="flex items-center gap-2">
                <CreditCard className="w-5 h-5 text-slate-700 flex-shrink-0" />
                <span className="text-2xl font-bold text-slate-900">{formatCurrency(estimatedMissedRevenue ?? effectiveRetainer * reqVal)}</span>
              </div>
              <h3 className="text-sm font-semibold text-slate-900">Revenue lost (last 30 days)</h3>
              {effectiveRetainer > 0 && (
                <p className="text-xs text-slate-500 leading-snug">
                  Based on avg. retainer: {formatCurrency(effectiveRetainer)}/mo
                </p>
              )}
            </div>
          </div>

          {kpiLoaded && (
            <div className="bg-red-50 border border-red-200 rounded-lg p-2 md:p-3">
              <p className="text-[11px] md:text-sm font-semibold text-red-900 leading-snug">You're receiving 0 of these requests</p>
              <p className="text-[11px] md:text-xs text-red-700 mt-0.5 leading-snug">Clients are being redirected right now.</p>
            </div>
          )}
        </div>

        {/* Compact Activate Your Listing Section */}
        <div className="bg-gradient-to-br from-slate-800 to-slate-900 text-white rounded-lg shadow-lg p-2.5 md:p-4 space-y-1.5 md:space-y-2.5">
          <div>
            <h2 className="text-sm md:text-lg font-bold flex items-center gap-2">
              <Crown className="w-4 h-4 md:w-5 md:h-5 text-white" />
              One step left to fix this
            </h2>
            <p className="text-[11px] md:text-sm text-slate-300 leading-snug mt-0.5">
              Start receiving client requests directly.
            </p>
          </div>

          <div className="space-y-1.5">
            <button
              onClick={handleActivateListingClick}
              disabled={activating}
              className="w-full bg-white text-slate-800 py-2 md:py-3 px-4 rounded-lg font-bold hover:bg-slate-100 transition-colors shadow-md hover:shadow-lg inline-flex items-center justify-center gap-2 text-sm md:text-base disabled:opacity-70 disabled:cursor-not-allowed"
            >
              {activating ? (
                <div className="w-4 h-4 md:w-5 md:h-5 border-2 border-slate-400 border-t-slate-800 rounded-full animate-spin shrink-0" />
              ) : (
                <Zap className="w-4 h-4 md:w-5 md:h-5 flex-shrink-0" />
              )}
              <span>{activating ? 'Loading...' : 'Stop losing clients \u2014 activate your listing now'}</span>
            </button>
            {!activating && (
              <p className="text-center text-[10px] md:text-xs text-red-400 font-medium leading-tight">Clients are being redirected right now.</p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

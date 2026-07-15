import { useEffect, useLayoutEffect, useState, useRef } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { createPortal } from 'react-dom';
import { ChevronDown } from 'lucide-react';
import { supabase } from '../lib/supabase';
import ServicesBadges from '../components/ServicesBadges';
import AvailabilityModal from '../AvailabilityModal';
import { getStateContextFromSearchParams } from '../utils/stateContext';
import { formatStateName } from '../utils/formatLocation';
import { isSmartRoutingContext, extractRoutingParams } from '../utils/smartRoutingTracker';
import { getSmartRoutingContext, buildSmartRoutingQuery } from '../utils/smartRoutingContext';

interface Agency {
  id: string;
  name: string;
  state_name: string;
  state_slug: string;
  location: string;
  intro: string;
  services: string[];
  created_at: string;
  average_retainer_range?: string | null;
  average_retainer_amount?: number | null;
  website_url?: string | null;
  is_paid_listing?: boolean | null;
}

const MOCK_OTHER_AGENCIES: Agency[] = [
  {
    id: "0076a8ed-86da-461a-a3f0-8b0041fac8c2",
    name: "Hudson River Creative",
    state_name: "",
    state_slug: "",
    location: "",
    intro: "Branding and creative studio that builds modern digital experiences, from strategy and design to launch.",
    services: ["Branding", "Web Development", "UX/UI Design", "Content Creation"],
    created_at: new Date().toISOString(),
    average_retainer_amount: null
  }
];

const AUTO_START_MS = 10000;

const DEMO_HEADER_STYLES = `
  @keyframes demoBannerSlideDown {
    from { transform: translateY(-100%); opacity: 0; }
    to   { transform: translateY(0);     opacity: 1; }
  }
  .demo-owner-banner {
    animation: demoBannerSlideDown 0.4s ease-out;
  }
  @keyframes ownerBarGlow {
    0%   { box-shadow: 0 10px 30px rgba(0,0,0,0.18), 0 0 0 0 rgba(52,211,153,0), 0 0 0 0 rgba(52,211,153,0); }
    25%  { box-shadow: 0 10px 30px rgba(0,0,0,0.18), 0 0 18px 4px rgba(52,211,153,0.45), 0 0 0 3px rgba(52,211,153,0.25); }
    100% { box-shadow: 0 10px 30px rgba(0,0,0,0.18), 0 0 0 0 rgba(52,211,153,0), 0 0 0 0 rgba(52,211,153,0); }
  }
  @keyframes ownerBarFadeStep {
    from { opacity: 0; transform: translateY(4px); }
    to   { opacity: 1; transform: translateY(0); }
  }
  @keyframes ownerBarTitlePop {
    0%   { transform: scale(1); }
    40%  { transform: scale(1.03); }
    100% { transform: scale(1); }
  }
  @keyframes ownerBarPillPop {
    0%   { transform: scale(1); opacity: 1; }
    40%  { transform: scale(1.06); opacity: 0.9; }
    100% { transform: scale(1); opacity: 1; }
  }
  .demo-owner-banner.demo-step-change {
    animation: ownerBarGlow 0.8s ease-out forwards;
  }
  .demo-bar-step-content {
    animation: ownerBarFadeStep 0.25s ease-out;
  }
  .demo-bar-step-content h2.demo-title-pop {
    animation: ownerBarTitlePop 0.45s cubic-bezier(0.34,1.56,0.64,1) forwards;
  }
  .demo-bar-pill-pop {
    animation: ownerBarPillPop 0.45s cubic-bezier(0.34,1.56,0.64,1) forwards;
  }
  .owner-bar-text-wrap {
    max-width: 680px;
    overflow-wrap: break-word;
    word-break: normal;
    text-wrap: balance;
    line-height: 1.25;
  }
  .owner-bar-subtitle-wrap {
    max-width: 600px;
    overflow-wrap: break-word;
    word-break: normal;
    text-wrap: balance;
    line-height: 1.45;
  }
  @media (max-width: 1023px) {
    .owner-bar-text-wrap { max-width: 520px; }
    .owner-bar-subtitle-wrap { max-width: 460px; }
  }
  @media (max-width: 767px) {
    .owner-bar-text-wrap {
      max-width: 340px;
      line-height: 1.3;
    }
    .owner-bar-subtitle-wrap {
      max-width: 320px;
    }
  }
  @keyframes demoGreenPulse {
    0%, 100% { box-shadow: 0 0 0 0 rgba(52, 211, 153, 0.6), 0 0 0 10px rgba(52, 211, 153, 0.3); }
    50% { box-shadow: 0 0 0 12px rgba(52, 211, 153, 0.1), 0 0 0 22px rgba(52, 211, 153, 0); }
  }
  @keyframes demoCountdownPulse {
    0%, 100% { opacity: 0.6; transform: translateY(0); }
    50% { opacity: 1; transform: translateY(2px); }
  }
  .demo-button-pulse {
    animation: demoGreenPulse 2.5s cubic-bezier(0.4, 0, 0.6, 1) infinite;
  }
  .demo-countdown-arrow {
    animation: demoCountdownPulse 1.2s ease-in-out infinite;
  }
  @media (prefers-reduced-motion: reduce) {
    .demo-owner-banner { animation: none !important; }
    .demo-owner-banner.demo-step-change {
      box-shadow: 0 10px 30px rgba(0,0,0,0.18), 0 0 0 2px rgba(52,211,153,0.4);
      animation: none !important;
    }
    .demo-bar-step-content { animation: none; }
    .demo-bar-step-content h2.demo-title-pop { animation: none; }
    .demo-bar-pill-pop { animation: none; }
    .demo-button-pulse { animation: none !important; }
    .demo-countdown-arrow { animation: none !important; }
  }
`;

function DemoOwnerStickyHeader({
  countdown,
  started,
  isRoutingStep,
  step4Seconds,
  step4CtaVisible,
  onActivate,
  bannerRef,
  justChanged,
  stepKey,
}: {
  countdown: number;
  started: boolean;
  isRoutingStep: boolean;
  step4Seconds: number;
  step4CtaVisible: boolean;
  onActivate: () => void;
  bannerRef: React.RefObject<HTMLDivElement>;
  justChanged: boolean;
  stepKey: string;
}) {
  const pill = (
    <span className={`inline-flex items-center rounded-full bg-[#151f34] border border-[#151f34] px-3 py-1 text-xs font-medium text-white${justChanged ? ' demo-bar-pill-pop' : ''}`}>
      Agency Owner Preview
    </span>
  );

  const headline = isRoutingStep
    ? "Step 4/6 — Clients are being redirected right now"
    : "Complete this quick 30-second demo to see what happens when clients find you.";
  const subtitle = isRoutingStep
    ? "What you see below is the outcome a client experiences. Final step — continue to see what you're currently missing."
    : started
      ? "This is exactly how clients see your listing. Demo is starting\u2026"
      : `Auto-opening a sample client request in ${countdown} second${countdown !== 1 ? 's' : ''}…`;

  const ownerActionRow = isRoutingStep ? (
    <div className="mt-3 flex flex-col items-center gap-2">
      <button
        onClick={onActivate}
        className="bg-[#151f34] text-white px-6 py-2.5 rounded-xl font-semibold text-sm hover:bg-[#1e2d4a] transition-colors shadow-sm whitespace-nowrap"
      >
        Show my missed requests →
      </button>
    </div>
  ) : null;

  return createPortal(
    <>
      <style>{DEMO_HEADER_STYLES}</style>
      <div
        ref={bannerRef}
        className={`demo-owner-banner fixed top-0 left-0 right-0 w-screen bg-[#34d399] border-b border-black/10 shadow-[0_10px_30px_rgba(0,0,0,0.18)]${justChanged ? ' demo-step-change' : ''}`}
        style={{ zIndex: 99999 }}
      >
        {/* Desktop */}
        <div className="hidden md:flex items-center justify-center px-6 py-4">
          <div className="w-full max-w-5xl flex flex-col items-center text-center relative">
            <div className="mb-2">{pill}</div>
            <div key={stepKey} className="demo-bar-step-content flex flex-col items-center">
              <h2 className={`owner-bar-text-wrap text-base font-bold text-[#151f34] mb-1 text-center${justChanged ? ' demo-title-pop' : ''}`}>
                {headline}
              </h2>
              <p className="owner-bar-subtitle-wrap text-sm text-[#151f34]/80 mb-1 text-center">
                {subtitle}
              </p>
            </div>
            {ownerActionRow}
          </div>
        </div>

        {/* Mobile */}
        <div className="md:hidden flex flex-col px-4 py-2.5 relative">
          <div className="flex justify-center mb-1.5">{pill}</div>
          <div key={`m-${stepKey}`} className="demo-bar-step-content flex flex-col items-center">
            <h2 className={`owner-bar-text-wrap text-center text-sm font-bold text-[#151f34] mb-1.5${justChanged ? ' demo-title-pop' : ''}`}>
              {headline}
            </h2>
            <p className="owner-bar-subtitle-wrap text-center text-xs text-[#151f34]/75 leading-[1.3]">
              {subtitle}
            </p>
          </div>
          {ownerActionRow}
        </div>
      </div>
    </>,
    document.body
  );
}

export default function AvailabilityOwnerDemoPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const agencyId = searchParams.get('agencyId');
  const isPlaceholder = searchParams.get('placeholder') === '1';
  const agencyLogoUrl = searchParams.get('agencyLogoUrl') || '';
  const { stateSlug, stateName } = getStateContextFromSearchParams(searchParams);

  const [agency, setAgency] = useState<Agency | null>(null);
  const [loading, setLoading] = useState(true);
  const [showModal, setShowModal] = useState(false);
  const [hasStartedSimulation, setHasStartedSimulation] = useState(false);
  const [countdown, setCountdown] = useState(10);
  const [isRoutingStep, setIsRoutingStep] = useState(false);
  const [step4Seconds, setStep4Seconds] = useState(10);
  const [step4CtaVisible, setStep4CtaVisible] = useState(false);
  const [justChanged, setJustChanged] = useState(false);
  const [isPaidListing, setIsPaidListing] = useState(false);
  const activateCalledRef = useRef(false);
  const prevIsRoutingStepRef = useRef(false);
  const justChangedTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const step4TimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  const countdownRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const bannerRef = useRef<HTMLDivElement>(null);

  const displayStateName = formatStateName(isPlaceholder ? stateName : (agency?.state_name || stateName));

  const stepKey = `${isRoutingStep}`;

  useEffect(() => {
    if (prevIsRoutingStepRef.current !== isRoutingStep) {
      prevIsRoutingStepRef.current = isRoutingStep;
      setJustChanged(true);
      if (justChangedTimerRef.current) clearTimeout(justChangedTimerRef.current);
      justChangedTimerRef.current = setTimeout(() => {
        setJustChanged(false);
      }, 800);
    }
    return () => {
      if (justChangedTimerRef.current) clearTimeout(justChangedTimerRef.current);
    };
  }, [isRoutingStep]);

  useEffect(() => {
    return () => {
      if (step4TimerRef.current) clearTimeout(step4TimerRef.current);
    };
  }, []);

  // Synchronously update --owner-banner-h (and --demo-banner-h) on every render,
  // before the browser paints. This means the CSS-var-driven spacer below always
  // has the correct height, even on the very first frame after isRoutingStep changes.
  useLayoutEffect(() => {
    const el = bannerRef.current;
    if (!el) return;
    const h = el.getBoundingClientRect().height;
    if (h > 0) {
      document.documentElement.style.setProperty('--owner-banner-h', `${h}px`);
      document.documentElement.style.setProperty('--demo-banner-h', `${h}px`);
    }
  });

  // ResizeObserver + viewport events as a secondary safety net (handles any
  // browser-initiated reflows that don't trigger a React render).
  useLayoutEffect(() => {
    const syncVar = () => {
      const el = bannerRef.current;
      if (!el) return;
      const h = el.getBoundingClientRect().height;
      if (h > 0) {
        document.documentElement.style.setProperty('--owner-banner-h', `${h}px`);
        document.documentElement.style.setProperty('--demo-banner-h', `${h}px`);
      }
    };

    const ro = new ResizeObserver(syncVar);
    if (bannerRef.current) ro.observe(bannerRef.current);
    window.addEventListener('resize', syncVar, { passive: true });
    window.addEventListener('orientationchange', syncVar, { passive: true });

    return () => {
      ro.disconnect();
      window.removeEventListener('resize', syncVar);
      window.removeEventListener('orientationchange', syncVar);
      document.documentElement.style.removeProperty('--owner-banner-h');
      document.documentElement.style.removeProperty('--demo-banner-h');
    };
  }, []);

  useEffect(() => {
    document.title = 'Client Demo | Gappsy';
  }, []);

  // Smart routing tracking: owner loss step viewed
  useEffect(() => {
    const isRouting = isSmartRoutingContext(searchParams);
    if (!isRouting) return;

    const params = extractRoutingParams(searchParams);
    if (!params.agencyId || !params.leadKey) return;

    console.log('[OwnerDemo] Smart routing context detected, tracking loss step view', params);

    const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;

    fetch(`${SUPABASE_URL}/functions/v1/smart-routing-track-event`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        agency_id: params.agencyId,
        lead_key: params.leadKey,
        event_type: 'owner_loss_step_viewed',
        metadata: {
          page: 'availability_owner_demo',
          agency_id: agencyId,
          state_slug: stateSlug,
        },
      }),
    }).catch((err) => {
      console.warn('[OwnerDemo] Smart routing tracking failed:', err);
    });
  }, [searchParams, agencyId, stateSlug]);

  // Load agency data
  useEffect(() => {
    async function loadAgency() {
      if (!agencyId) {
        setLoading(false);
        return;
      }

      if (import.meta.env.DEV) {
        console.log('[OwnerDemo] Loading agency data for ID:', agencyId);
      }

      try {
        const { data: agencyData, error } = await supabase
          .from('other_agencies')
          .select('id, name, state_name, state_slug, location, intro, services, created_at, average_retainer_range, average_retainer_amount, website_url, is_paid_listing')
          .eq('id', agencyId)
          .maybeSingle();

        if (error) {
          if (import.meta.env.DEV) {
            console.error('[OwnerDemo] Database error:', error);
          }
          throw error;
        }

        if (!agencyData) {
          if (import.meta.env.DEV) {
            console.warn('[OwnerDemo] No agency found, using fallback');
          }
          const fallbackAgency = MOCK_OTHER_AGENCIES.find(a => a.id === agencyId) || MOCK_OTHER_AGENCIES[0];
          setAgency({ ...fallbackAgency, state_name: stateName, state_slug: stateSlug, location: '' });
        } else {
          if (import.meta.env.DEV) {
            console.log('[OwnerDemo] Agency loaded:', agencyData.name, 'is_paid_listing:', agencyData.is_paid_listing);
          }
          const finalAgencyData = isPlaceholder
            ? { ...agencyData, state_name: stateName, location: '' }
            : agencyData;
          setAgency(finalAgencyData);
          setIsPaidListing(!!agencyData.is_paid_listing);
        }
      } catch (error) {
        if (import.meta.env.DEV) {
          console.error('[OwnerDemo] Error loading agency:', error);
        }
        const fallbackAgency = MOCK_OTHER_AGENCIES.find(a => a.id === agencyId) || MOCK_OTHER_AGENCIES[0];
        setAgency({ ...fallbackAgency, state_name: stateName, state_slug: stateSlug, location: '' });
      } finally {
        setLoading(false);
      }
    }

    loadAgency();
  }, [agencyId]);

  // Countdown ticker + auto-start after AUTO_START_MS.
  // When autostart=1 is in the URL (set by AvailabilityOwnerEditListingPage after
  // the owner saves their listing) we skip the intro-card entirely and open the
  // availability form modal immediately — removing that intermediate visual step.
  useEffect(() => {
    if (!agency || hasStartedSimulation) return;

    if (searchParams.get('autostart') === '1') {
      handleStartSimulation();
      return;
    }

    const startedAt = Date.now();

    countdownRef.current = setInterval(() => {
      const elapsed = Date.now() - startedAt;
      const remaining = Math.max(0, Math.ceil((AUTO_START_MS - elapsed) / 1000));
      setCountdown(remaining);
    }, 250);

    const autoTimer = setTimeout(() => {
      if (import.meta.env.DEV) {
        console.log('[OwnerDemo] Auto-starting simulation after 10 seconds');
      }
      handleStartSimulation();
    }, AUTO_START_MS);

    return () => {
      clearInterval(countdownRef.current!);
      clearTimeout(autoTimer);
    };
  }, [agency, hasStartedSimulation]);

  const handleStartSimulation = () => {
    if (import.meta.env.DEV) {
      console.log('[OwnerDemo] Starting Check Availability simulation');
    }
    if (countdownRef.current) {
      clearInterval(countdownRef.current);
    }
    setHasStartedSimulation(true);
    setShowModal(true);
  };

  const handleModalClose = () => {
    if (import.meta.env.DEV) {
      console.log('[OwnerDemo] Modal closed, navigating to owner-preview pain page');
    }
    setShowModal(false);
    handleActivate();
  };

  const handleStep4StateChange = (seconds: number, ctaVisible: boolean) => {
    setStep4Seconds(seconds);
    setStep4CtaVisible(ctaVisible);
  };

  const handleActivate = () => {
    if (activateCalledRef.current) return;
    if (!agencyId) {
      if (import.meta.env.DEV) {
        console.error('[OwnerDemo] Cannot navigate: missing agencyId');
      }
      return;
    }
    activateCalledRef.current = true;
    if (step4TimerRef.current) {
      clearTimeout(step4TimerRef.current);
      step4TimerRef.current = null;
    }
    setShowModal(false);

    const params = new URLSearchParams();
    params.set('agencyId', agencyId.trim());
    params.set('state', (stateSlug ?? '').trim());
    if (stateName) params.set('stateName', stateName.trim());
    if (isPlaceholder) params.set('placeholder', '1');
    if (agencyLogoUrl) params.set('agencyLogoUrl', agencyLogoUrl);

    // Preserve smart routing context
    const smartContext = getSmartRoutingContext(searchParams);
    const smartQuery = buildSmartRoutingQuery(smartContext);
    if (smartQuery) {
      const smartParams = new URLSearchParams(smartQuery.slice(1));
      smartParams.forEach((v, k) => params.set(k, v));
    }

    if (isPaidListing) {
      if (import.meta.env.DEV) {
        console.log('[OwnerDemo] Paid listing — routing to owner-dashboard');
      }
      navigate(`/availability/owner-dashboard?${params.toString()}`);
    } else {
      if (import.meta.env.DEV) {
        console.log('[OwnerDemo] Non-paid listing — routing to owner-preview pain page (step=5)');
      }
      params.set('step', '5');
      params.set('fromDemo', '1');
      navigate(`/availability/owner-preview?${params.toString()}`);
    }
  };

  const handleOwnerStepChange = (step: number) => {
    if (import.meta.env.DEV) {
      console.log('[OwnerDemo] Step changed to:', step);
    }
    if (step === 4) {
      setIsRoutingStep(true);
      if (!activateCalledRef.current) {
        if (step4TimerRef.current) clearTimeout(step4TimerRef.current);
        step4TimerRef.current = setTimeout(() => {
          handleActivate();
        }, 1500);
      }
    }
    if (step === 5) {
      handleActivate();
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 flex items-center justify-center">
        <div className="text-slate-600">Loading...</div>
      </div>
    );
  }

  if (!agency) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 flex items-center justify-center">
        <div className="text-slate-600">Agency not found</div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100">
      <DemoOwnerStickyHeader
        countdown={countdown}
        started={hasStartedSimulation}
        isRoutingStep={isRoutingStep}
        step4Seconds={step4Seconds}
        step4CtaVisible={step4CtaVisible}
        onActivate={handleActivate}
        bannerRef={bannerRef}
        justChanged={justChanged}
        stepKey={stepKey}
      />

      {/* Spacer that always matches the fixed banner's rendered height.
          Uses a CSS custom property so it updates synchronously (no React
          re-render lag) whenever the banner grows or shrinks. */}
      <div aria-hidden="true" style={{ height: 'var(--owner-banner-h, 180px)' }} />

      <div>
        <div className="max-w-4xl mx-auto px-4 sm:px-6 py-6 sm:py-8 space-y-6">
          {/* Listing Card Section */}
          <div>
            <div className="bg-white rounded-xl shadow-sm p-4 sm:p-6">
              <div className="border border-slate-200 rounded-lg p-5 space-y-4">
                <div>
                  <h2 className="font-semibold text-slate-900 text-lg">{agency.name}</h2>
                  <p className="text-sm text-slate-600 mt-1">
                    {agency.location ? `${agency.location}, ${displayStateName}` : displayStateName}
                  </p>
                </div>

                <p className="text-sm text-slate-600 leading-relaxed line-clamp-3">
                  {agency.intro}
                </p>

                {agency.services && agency.services.length > 0 && (
                  <ServicesBadges
                    services={agency.services}
                    badgeStyle={{
                      fontSize: '11px',
                      padding: '4px 8px',
                      backgroundColor: '#f1f5f9',
                      color: '#475569',
                      border: '1px solid #e2e8f0',
                      borderRadius: '4px'
                    }}
                  />
                )}

                <div className="mt-6 space-y-2">
                  <div className="relative">
                    <button
                      onClick={handleStartSimulation}
                      className={`w-full bg-indigo-600 text-white py-2.5 rounded-lg font-medium text-sm hover:bg-indigo-700 transition-colors duration-200 shadow-sm${!hasStartedSimulation ? ' demo-button-pulse ring-4 ring-[#34d399] shadow-[0_0_0_10px_rgba(52,211,153,0.30)]' : ''}`}
                    >
                      Check Availability
                    </button>
                  </div>
                  {!hasStartedSimulation && countdown > 0 && (
                    <div className="mt-3 flex justify-center items-center gap-2 pointer-events-none">
                      <div className="demo-countdown-arrow">
                        <ChevronDown className="w-5 h-5 text-[#34d399]" style={{ filter: 'drop-shadow(0 1px 3px rgba(52, 211, 153, 0.4))' }} />
                      </div>
                      <span className="text-xs text-[#151f34]/60 font-medium">
                        Auto-clicking in {countdown}…
                      </span>
                    </div>
                  )}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Availability Modal in Owner Simulation Mode */}
      {showModal && agencyId && (
        <AvailabilityModal
          isOpen={showModal}
          onClose={handleModalClose}
          agencyId={agencyId}
          agencyName={agency.name}
          stateName={displayStateName}
          stateSlug={stateSlug}
          mode="owner-demo"
          demoMode={true}
          onOwnerStepChange={handleOwnerStepChange}
          onStep4StateChange={handleStep4StateChange}
        />
      )}
    </div>
  );
}

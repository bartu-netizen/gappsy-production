import { X, Briefcase, DollarSign, Clock, Mail, User, Search, Target, TrendingUp, CheckCircle, Eye, ChevronDown } from 'lucide-react';
import { useState, useEffect, useRef } from 'react';
import RecommendationCard from './components/RecommendationCard';
import AutoRedirect from './components/AutoRedirect';
import { recommendedAgency } from './config/recommendedAgency';
import { supabase } from './lib/supabase';
import { useScrollLock } from './hooks/useScrollLock';
import { logOwnerDemoEvent } from './utils/ownerDemoTracking';
import { trackFunnelEvent } from './utils/funnelTracking';
import { logFunnelEvent, FUNNEL_EVENTS, getFsid } from './utils/yourAgencyFunnel';
import { submitForm, getUtmParams } from './lib/forms/submit';
import { extractStateSlugFromPath } from './utils/seoHelper';
import { formatStateName } from './utils/formatLocation';

interface ReviewContext {
  pageType: 'review';
  reviewSlug: string;
  sentiment: 'positive' | 'negative';
  agencySlug: string;
  stateSlug: string;
  agencySource?: string;
}

interface AvailabilityModalProps {
  isOpen: boolean;
  onClose: () => void;
  agencyName: string;
  stateName: string;
  mode?: string;
  agencyId?: string;
  stateSlug?: string;
  agencySlug?: string;
  agencyWebsite?: string;
  reviewContext?: ReviewContext;
  demoMode?: boolean;
  onOwnerStepChange?: (step: number) => void;
  onStep4StateChange?: (seconds: number, ctaVisible: boolean) => void;
}

type AvailabilityStep = 'form' | 'animating' | 'result';
type MobileFormStep = 1 | 2;

interface AnimationStep {
  icon: JSX.Element;
  text: string;
  duration: number;
}

interface AgencyData {
  id: string;
  name: string;
  website_url: string;
  is_paid_listing: boolean;
  availability_redirect_enabled: boolean;
  availability_redirect_url: string | null;
  city: string;
  state: string;
  logo_url: string | null;
  intro: string;
}

// Client-side fallback outcome resolver (mirrors server logic)
function resolveOutcomeFallback(sentiment: string | null, agencyWebsite?: string, agencyName?: string): { provider: string; url: string | null; name: string | null } {
  if (sentiment === 'negative') {
    return { provider: 'vazagency', url: 'https://vazagency.com', name: 'Vazagency' };
  }
  if (agencyWebsite) {
    return { provider: 'agency', url: agencyWebsite, name: agencyName || null };
  }
  return { provider: 'get_matched', url: null, name: null };
}

const DEMO_FORM_DATA = {
  service: 'General Marketing',
  budget: '$1,000–$5,000',
  timeline: 'Within 30 days',
  email: 'demo@example.com',
  name: 'John Smith',
};

export default function AvailabilityModal({
  isOpen,
  onClose,
  agencyName,
  stateName: stateNameRaw,
  mode,
  agencyId,
  stateSlug,
  agencySlug,
  agencyWebsite,
  reviewContext,
  demoMode = false,
  onOwnerStepChange,
  onStep4StateChange,
}: AvailabilityModalProps) {
  const stateName = formatStateName(stateNameRaw);
  const [step, setStep] = useState<AvailabilityStep>('form');
  const [mobileStep, setMobileStep] = useState<MobileFormStep>(1);
  const [animationStep, setAnimationStep] = useState(0);
  const [cancelRedirect, setCancelRedirect] = useState(false);
  const [isMobile, setIsMobile] = useState(false);
  const contentRef = useRef<HTMLDivElement | null>(null);
  const [sourceAgency, setSourceAgency] = useState<AgencyData | null>(null);
  const [routedAgency, setRoutedAgency] = useState<any>(null);
  const [isPaidAvailability, setIsPaidAvailability] = useState(false);
  const [submitError, setSubmitError] = useState<string>('');
  const [hasAttemptedSubmit, setHasAttemptedSubmit] = useState(false);
  const [isResolvingIds, setIsResolvingIds] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [ctaVisible, setCtaVisible] = useState(false);
  const [autoTriggerCountdown, setAutoTriggerCountdown] = useState<number | null>(null);
  const [autoTriggered, setAutoTriggered] = useState(false);
  const [step4Seconds, setStep4Seconds] = useState(8);
  const [step4CtaVisible, setStep4CtaVisible] = useState(false);
  const ctaButtonRef = useRef<HTMLButtonElement | null>(null);
  const step4ButtonRef = useRef<HTMLButtonElement | null>(null);
  const countdownIntervalRef = useRef<NodeJS.Timeout | null>(null);
  const step4IntervalRef = useRef<number | null>(null);
  const observerRef = useRef<IntersectionObserver | null>(null);
  const step4TriggeredRef = useRef(false);
  const autoTriggerCountdownRef = useRef(false);

  const frozenAgencyIdRef = useRef<string | null>(null);
  const frozenStateSlugRef = useRef<string | null>(null);

  const demoSessionIdRef = useRef<string | null>(null);
  const demoOpenedGuardRef = useRef(false);
  const demoResultViewedGuardRef = useRef(false);
  const demoSubmittedGuardRef = useRef(false);

  const isOwnerSimulation = mode === 'owner-sim' || mode === 'owner-demo' || demoMode;
  const isDemo = demoMode || mode === 'owner-demo';

  useScrollLock(isOpen);

  useEffect(() => {
    if (!isOpen) {
      demoSessionIdRef.current = null;
      demoOpenedGuardRef.current = false;
      demoResultViewedGuardRef.current = false;
      demoSubmittedGuardRef.current = false;
    }
  }, [isOpen]);

  const sanitizeUrl = (url: string | null | undefined): string | null => {
    if (!url) return null;
    const trimmed = url.trim();
    if (!trimmed) return null;

    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return trimmed;
    }

    return `https://${trimmed}`;
  };

  const [formData, setFormData] = useState({
    service: '',
    budget: '',
    timeline: '',
    email: '',
    name: ''
  });

  const saveAvailabilityRequest = async () => {
    const finalAgencyId = frozenAgencyIdRef.current;
    const finalStateSlug = frozenStateSlugRef.current;

    // Use review context stateSlug as fallback, then extract from URL path
    const extracted = extractStateSlugFromPath(window.location.pathname);
    const effectiveStateSlug = finalStateSlug || reviewContext?.stateSlug || extracted || null;

    if (!effectiveStateSlug) {
      console.warn('[AvailabilityModal] Missing state slug — still calling submitForm with undefined state');
      // Apply fallback routing for review pages even without state slug
      if (reviewContext) {
        const fb = resolveOutcomeFallback(reviewContext.sentiment, agencyWebsite, agencyName);
        if (fb.url) {
          setRoutedAgency({
            id: agencyId || null,
            name: fb.name || agencyName,
            city: stateName,
            state: stateName,
            location: stateName,
            website: fb.url,
            logo: '',
            description: '',
          });
          setIsPaidAvailability(reviewContext.sentiment !== 'negative');
        }
      }
      // Continue to submitForm even without state slug
    }

    try {
      const body: Record<string, unknown> = {
        agencyId: finalAgencyId || null,
        stateSlug: effectiveStateSlug,
        clientName: formData.name || null,
        clientEmail: formData.email,
        service: formData.service,
        budget: formData.budget,
        timeline: formData.timeline,
        agencyName: agencyName || null,
        stateName: stateName || null,
        agencySlug: agencySlug || reviewContext?.agencySlug || null,
        isDemo: isOwnerSimulation ? true : undefined,
        demoSource: isOwnerSimulation
          ? (mode === 'owner-demo' || demoMode ? 'owner_preview_demo' : 'your_agency_demo')
          : undefined,
      };

      if (reviewContext) {
        body.pageType = reviewContext.pageType;
        body.reviewSlug = reviewContext.reviewSlug;
        body.sentiment = reviewContext.sentiment;
        body.agencySource = reviewContext.agencySource || 'unknown';
      }

      const isDebugMode = new URLSearchParams(window.location.search).get('debug') === '1';

      const { data, error } = await supabase.functions.invoke('availability-submit', { body });

      if (error) {
        console.warn('[AvailabilityModal] availability-submit network/invoke error (non-fatal):', error?.message);
        if (isDebugMode) {
          console.error('[Demo Debug] INSERT FAILED - invoke error:', error?.message, { body });
        }
      }

      const responseData = data as Record<string, unknown> | null;

      // Apply backend outcome if present, otherwise use client-side fallback
      const backendOutcome = responseData?.outcome as Record<string, unknown> | null;
      if (backendOutcome?.cta_url) {
        const url = String(backendOutcome.cta_url);
        const name = (backendOutcome.recommended_agency_name as string) || agencyName;
        setRoutedAgency({
          id: (backendOutcome.recommended_agency_id as string) || agencyId || null,
          name,
          city: stateName,
          state: stateName,
          location: stateName,
          website: url,
          logo: '',
          description: '',
        });
        setIsPaidAvailability(backendOutcome.recommended_provider !== 'vazagency');
      } else if (reviewContext) {
        // Client-side fallback for review pages
        const fb = resolveOutcomeFallback(reviewContext.sentiment, agencyWebsite, agencyName);
        if (fb.url) {
          setRoutedAgency({
            id: agencyId || null,
            name: fb.name || agencyName,
            city: stateName,
            state: stateName,
            location: stateName,
            website: fb.url,
            logo: '',
            description: '',
          });
          setIsPaidAvailability(fb.provider !== 'vazagency');
        }
      }

      const insertedId = (responseData?.id || responseData?.request_id) as string | undefined;

      if (isDebugMode && isOwnerSimulation) {
        console.log('[Demo Debug] availability-submit returned (outcome only, no DB insert):', { outcome: backendOutcome, stateSlug: effectiveStateSlug });
      }

      // ALWAYS call submitForm for DB insert + internal email (not gated by responseData.stored)
      submitForm({
        form_type: 'availability_check',
        state_slug: effectiveStateSlug || undefined,
        contact: { name: formData.name, email: formData.email },
        payload: {
          agency_id: finalAgencyId || undefined,
          agency_name: agencyName,
          contact_name: formData.name,
          contact_email: formData.email,
          service_interest: formData.service,
          budget: formData.budget,
          timeline: formData.timeline,
          state_name: stateName,
        },
        utm: getUtmParams(),
        meta: isOwnerSimulation
          ? { is_demo: true, source_flow: 'demo', funnel_session_id: getFsid() ?? '' }
          : { source_flow: 'live', funnel_session_id: getFsid() ?? '' },
      }).then((r) => {
        if (!r.ok) console.error('[availability_check] submit-and-notify failed:', r.error);
      }).catch((e) => console.error('[availability_check] submit-and-notify network error:', e));

      trackFunnelEvent({
        funnelType: 'availability',
        stateSlug: effectiveStateSlug || undefined,
        leadEmail: formData.email,
        leadName: formData.name || undefined,
        agencyName: agencyName || undefined,
        agencyId: finalAgencyId || undefined,
        eventName: 'form_submit',
        submissionType: 'agency_availability_requests',
        metadata: { service: formData.service, budget: formData.budget, timeline: formData.timeline },
      });
    } catch (err: unknown) {
      // Swallow all errors — never show to user, animation and result still play
      console.warn('[AvailabilityModal] saveAvailabilityRequest threw (non-fatal):', err instanceof Error ? err.message : String(err));

      // Apply client-side fallback routing for review pages
      if (reviewContext) {
        const fb = resolveOutcomeFallback(reviewContext.sentiment, agencyWebsite, agencyName);
        if (fb.url) {
          setRoutedAgency({
            id: agencyId || null,
            name: fb.name || agencyName,
            city: stateName,
            state: stateName,
            location: stateName,
            website: fb.url,
            logo: '',
            description: '',
          });
          setIsPaidAvailability(fb.provider !== 'vazagency');
        }
      }
    }
  };

  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 768);
    };
    checkMobile();
    window.addEventListener('resize', checkMobile);
    return () => window.removeEventListener('resize', checkMobile);
  }, []);

  useEffect(() => {
    if (isOpen) {
      const instanceId = crypto.randomUUID ? crypto.randomUUID() : `${Date.now()}-${Math.random().toString(36).slice(2)}`;
      demoSessionIdRef.current = instanceId;

      setStep('form');
      setMobileStep(isDemo ? 2 : 1);
      setAnimationStep(0);
      setCancelRedirect(false);
      setSubmitError('');
      setHasAttemptedSubmit(false);
      setIsResolvingIds(false);
      setIsSubmitting(false);
      setCtaVisible(false);
      setAutoTriggerCountdown(null);
      setAutoTriggered(false);
      setFormData(isDemo ? { ...DEMO_FORM_DATA } : { service: '', budget: '', timeline: '', email: '', name: '' });
      frozenAgencyIdRef.current = null;
      frozenStateSlugRef.current = null;

      const isAgencyReviewPage = window.location.pathname.includes('/agency-reviews/');
      if (isAgencyReviewPage && agencyWebsite) {
        setRoutedAgency({
          id: agencyId || null,
          name: agencyName,
          city: stateName,
          state: stateName,
          location: stateName,
          website: sanitizeUrl(agencyWebsite) || agencyWebsite,
          logo: '',
          description: `Marketing agency in ${stateName}`
        });
        setIsPaidAvailability(true);
      }

    }
  }, [isOpen, isOwnerSimulation, agencyId, stateSlug, agencyName, agencyWebsite, stateName]);

  useEffect(() => {
    if (!isOpen) return;
    if (!isOwnerSimulation) return;
    if (demoOpenedGuardRef.current) return;
    demoOpenedGuardRef.current = true;
    const instanceId = demoSessionIdRef.current ?? undefined;
    logOwnerDemoEvent('demo_opened', {
      agencyId: frozenAgencyIdRef.current ?? agencyId,
      stateSlug: frozenStateSlugRef.current ?? stateSlug,
      agencyName,
      mode: 'owner-sim',
      openInstanceId: instanceId,
    });
    logFunnelEvent({
      ...FUNNEL_EVENTS.DEMO_MODAL_OPENED,
      agency_id: frozenAgencyIdRef.current ?? agencyId,
      agency_name: agencyName,
      state_slug: frozenStateSlugRef.current ?? stateSlug,
      is_demo: true,
      open_instance_id: instanceId,
    });
  }, [isOpen, isOwnerSimulation]);

  useEffect(() => {
    const fetchAgencyData = async () => {
      const finalAgencyId = frozenAgencyIdRef.current;
      const finalStateSlug = frozenStateSlugRef.current;

      if (mode === 'owner-sim' || isDemo) return;

      if (!finalStateSlug) {
        console.error('[AvailabilityModal] Missing state slug');
        return;
      }

      try {
        let displayAgency: AgencyData | null = null;
        let isPaidFlag = false;
        let paidCheckReason = '';
        let paidSlotMatch: any = null;

        if (!finalAgencyId) {
          console.log('[AvailabilityModal] No agencyId provided - treating as placeholder (non-paid)');
          isPaidFlag = false;
          paidCheckReason = 'no-agency-id-placeholder';
          const isAgencyReviewPage = window.location.pathname.includes('/agency-reviews/');

          if (!isAgencyReviewPage) {
            setIsPaidAvailability(false);
          }
          setSourceAgency(null);

          const { data: routing } = await supabase
            .from('state_lead_routing')
            .select('default_availability_agency_id')
            .eq('state_slug', finalStateSlug)
            .maybeSingle();

          let fallbackAgencyId = routing?.default_availability_agency_id;

          if (fallbackAgencyId) {
            const { data: fallbackAgency } = await supabase
              .from('other_agencies')
              .select('id, name, website_url, city, state, logo_url, intro')
              .eq('id', fallbackAgencyId)
              .maybeSingle();

            if (fallbackAgency) {
              const fallbackUrl = sanitizeUrl(fallbackAgency.website_url) || '';
              setRoutedAgency({
                id: fallbackAgency.id,
                name: fallbackAgency.name,
                city: fallbackAgency.city,
                state: fallbackAgency.state,
                location: `${fallbackAgency.city}, ${fallbackAgency.state}`,
                website: fallbackUrl,
                logo: fallbackAgency.logo_url || '',
                description: fallbackAgency.intro || ''
              });
            } else if (!isAgencyReviewPage) {
              setRoutedAgency(recommendedAgency);
            }
          } else if (!isAgencyReviewPage) {
            setRoutedAgency(recommendedAgency);
          }

          console.log('[AvailabilityModal] paid check', {
            sourceAgencyId: null,
            sourceIsPaidFlag: null,
            paidSlotMatch: null,
            finalIsPaid: isPaidFlag,
            reason: paidCheckReason
          });

          return;
        }

        const { data: otherAgencyData } = await supabase
          .from('other_agencies')
          .select('id, name, website_url, is_paid_listing, availability_redirect_enabled, availability_redirect_url, city, state, logo_url, intro')
          .eq('id', finalAgencyId)
          .maybeSingle();

        let top25SlotData: { id: string; agency_id?: string; agency_name: string; website?: string; logo_url?: string; description?: string; is_paid?: boolean; slot_status?: string | null; manual_override?: boolean | null; state_slug?: string } | null = null;
        {
          const stateFilter = frozenStateSlugRef.current;
          let q = supabase
            .from('top25_slots')
            .select('id, agency_id, agency_name, website, logo_url, description, is_paid, slot_status, manual_override, state_slug')
            .eq('agency_id', finalAgencyId)
            .or('is_paid.eq.true,slot_status.eq.sold,manual_override.eq.true');
          if (stateFilter) q = q.eq('state_slug', stateFilter);
          const { data: byAgencyId } = await q.maybeSingle();
          if (byAgencyId) {
            top25SlotData = byAgencyId;
          } else {
            const { data: bySlotId } = await supabase
              .from('top25_slots')
              .select('id, agency_id, agency_name, website, logo_url, description, is_paid, slot_status, manual_override, state_slug')
              .eq('id', finalAgencyId)
              .or('is_paid.eq.true,slot_status.eq.sold,manual_override.eq.true')
              .maybeSingle();
            top25SlotData = bySlotId;
          }
        }

        const top25IsProtected = !!top25SlotData && (
          !!top25SlotData.is_paid ||
          top25SlotData.slot_status === 'sold' ||
          top25SlotData.manual_override === true
        );

        if (otherAgencyData) {
          displayAgency = otherAgencyData;
          isPaidFlag = !!otherAgencyData.is_paid_listing || top25IsProtected;
          paidCheckReason = isPaidFlag
            ? (otherAgencyData.is_paid_listing ? 'other-agencies-is-paid-listing-true' : 'top25-protected-overlay')
            : 'other-agencies-is-paid-listing-false';
        } else if (top25SlotData) {
          paidSlotMatch = {
            id: top25SlotData.id,
            is_paid: top25SlotData.is_paid
          };

          displayAgency = {
            id: top25SlotData.id,
            name: top25SlotData.agency_name,
            website_url: top25SlotData.website || '',
            is_paid_listing: top25IsProtected,
            availability_redirect_enabled: false,
            availability_redirect_url: null,
            city: stateName,
            state: stateName,
            logo_url: top25SlotData.logo_url,
            intro: top25SlotData.description || ''
          };
          isPaidFlag = top25IsProtected;
          paidCheckReason = isPaidFlag
            ? (top25SlotData.is_paid ? 'top25-slots-is-paid-true' : (top25SlotData.slot_status === 'sold' ? 'top25-slots-slot-status-sold' : 'top25-slots-manual-override'))
            : 'top25-slots-unprotected';
        } else {
          console.warn('[AvailabilityModal] Agency ID provided but not found in either table');
          isPaidFlag = false;
          paidCheckReason = 'agency-id-not-found-in-db';
        }

        console.log('[AvailabilityModal] paid check', {
          sourceAgencyId: finalAgencyId,
          sourceIsPaidFlag: displayAgency?.is_paid_listing ?? null,
          paidSlotMatch,
          finalIsPaid: isPaidFlag,
          reason: paidCheckReason
        });

        if (!displayAgency) {
          console.warn('[AvailabilityModal] Could not find agency data for provided ID');
          const isAgencyReviewPage = window.location.pathname.includes('/agency-reviews/');
          if (!isAgencyReviewPage) {
            setRoutedAgency(recommendedAgency);
            setIsPaidAvailability(false);
          }
          setSourceAgency(null);
          return;
        }

        setSourceAgency(displayAgency);
        setIsPaidAvailability(isPaidFlag);

        if (isPaidFlag) {
          let finalUrl: string | null = null;

          if (displayAgency.availability_redirect_enabled && displayAgency.availability_redirect_url) {
            finalUrl = sanitizeUrl(displayAgency.availability_redirect_url);
          }

          if (!finalUrl) {
            finalUrl = sanitizeUrl(displayAgency.website_url);
          }

          if (!finalUrl) {
            console.warn('[AvailabilityModal] Paid/protected agency has no valid website URL; recommending self without redirect');
            setRoutedAgency({
              id: displayAgency.id,
              name: displayAgency.name,
              city: displayAgency.city,
              state: displayAgency.state,
              location: `${displayAgency.city}, ${displayAgency.state}`,
              website: '',
              logo: displayAgency.logo_url || '',
              description: displayAgency.intro || ''
            });
            return;
          }

          setRoutedAgency({
            id: displayAgency.id,
            name: displayAgency.name,
            city: displayAgency.city,
            state: displayAgency.state,
            location: `${displayAgency.city}, ${displayAgency.state}`,
            website: finalUrl,
            logo: displayAgency.logo_url || '',
            description: displayAgency.intro || ''
          });
          return;
        }

        const { data: routing } = await supabase
          .from('state_lead_routing')
          .select('default_availability_agency_id')
          .eq('state_slug', finalStateSlug)
          .maybeSingle();

        let fallbackAgencyId = routing?.default_availability_agency_id;

        if (fallbackAgencyId) {
          const { data: fallbackAgency } = await supabase
            .from('other_agencies')
            .select('id, name, website_url, city, state, logo_url, intro')
            .eq('id', fallbackAgencyId)
            .maybeSingle();

          if (fallbackAgency) {
            const fallbackUrl = sanitizeUrl(fallbackAgency.website_url) || '';
            setRoutedAgency({
              id: fallbackAgency.id,
              name: fallbackAgency.name,
              city: fallbackAgency.city,
              state: fallbackAgency.state,
              location: `${fallbackAgency.city}, ${fallbackAgency.state}`,
              website: fallbackUrl,
              logo: fallbackAgency.logo_url || '',
              description: fallbackAgency.intro || ''
            });
          } else {
            const isAgencyReviewPage = window.location.pathname.includes('/agency-reviews/');
            if (!isAgencyReviewPage) {
              setRoutedAgency(recommendedAgency);
            }
          }
        } else {
          const isAgencyReviewPage = window.location.pathname.includes('/agency-reviews/');
          if (!isAgencyReviewPage) {
            setRoutedAgency(recommendedAgency);
          }
        }
      } catch (error) {
        console.error('Error fetching agency data:', error);
        const isAgencyReviewPage = window.location.pathname.includes('/agency-reviews/');
        if (!isAgencyReviewPage) {
          setRoutedAgency(recommendedAgency);
          setIsPaidAvailability(false);
        }
        setSourceAgency(null);
      }
    };

    if (isOpen && step === 'animating') {
      fetchAgencyData();
    }
  }, [isOpen, mode, step, agencyName, stateName]);

  const demoResultContextRef = useRef({ agencyName, formData, demoMode });
  demoResultContextRef.current = { agencyName, formData, demoMode };

  const onOwnerStepChangeRef = useRef(onOwnerStepChange);
  onOwnerStepChangeRef.current = onOwnerStepChange;

  useEffect(() => {
    if (step !== 'result') return;
    if (contentRef.current) {
      contentRef.current.scrollTop = 0;
    }
    if (!isOwnerSimulation) return;
    if (demoResultViewedGuardRef.current) return;
    demoResultViewedGuardRef.current = true;
    const ctx = demoResultContextRef.current;
    logOwnerDemoEvent('demo_completed', {
      agencyId: frozenAgencyIdRef.current,
      stateSlug: frozenStateSlugRef.current,
      agencyName: ctx.agencyName,
      service: ctx.formData.service,
      budget: ctx.formData.budget,
      timeline: ctx.formData.timeline,
      mode: 'owner-sim',
      openInstanceId: demoSessionIdRef.current ?? undefined,
    });
    logFunnelEvent({
      ...FUNNEL_EVENTS.DEMO_RESULT_VIEWED,
      agency_id: frozenAgencyIdRef.current ?? undefined,
      agency_name: ctx.agencyName,
      state_slug: frozenStateSlugRef.current ?? undefined,
      is_demo: true,
      open_instance_id: demoSessionIdRef.current ?? undefined,
    });
  }, [step, isOwnerSimulation]);

  useEffect(() => {
    if (step !== 'result') return;
    if (!isOwnerSimulation) return;
    const cb = onOwnerStepChangeRef.current;
    if (cb) cb(4);
  }, [step, isOwnerSimulation]);

  useEffect(() => {
    if (step === 'result') {
      saveAvailabilityRequest();
      if (demoMode) {
        step4TriggeredRef.current = false;
        setStep4Seconds(8);
      }
    }
  }, [step]);

  useEffect(() => {
    if (step === 'animating') {
      const firstName = (formData.name || '').trim();
      const selectedService = formData.service || 'your project';
      const budgetLabel = formData.budget || 'your';
      const timelineLabel = formData.timeline || 'your timeline';
      const safeAgencyName = agencyName || 'this agency';
      const safeStateName = stateName || 'your area';

      const steps: AnimationStep[] = [
        {
          icon: <Search className="w-6 h-6" />,
          text: firstName
            ? `Analyzing your ${selectedService} request, ${firstName}…`
            : `Analyzing your ${selectedService} request for ${safeAgencyName}…`,
          duration: 2500
        },
        {
          icon: <Target className="w-6 h-6" />,
          text: `Reviewing your ${budgetLabel} budget and ${timelineLabel} timeline…`,
          duration: 2500
        },
        {
          icon: <CheckCircle className="w-6 h-6" />,
          text: `If they're not available, we'll recommend the best alternative in ${safeStateName}…`,
          duration: 3000
        }
      ];

      let currentStep = 0;
      setAnimationStep(0);

      const advanceStep = () => {
        if (currentStep < steps.length - 1) {
          currentStep++;
          setAnimationStep(currentStep);
          setTimeout(advanceStep, steps[currentStep].duration);
        } else {
          setTimeout(() => setStep('result'), 500);
        }
      };

      setTimeout(advanceStep, steps[0].duration);
    }
  }, [step, agencyName, stateName, formData.name, formData.service, formData.budget, formData.timeline]);

  useEffect(() => {
    if (!isOpen) {
      setAutoTriggerCountdown(null);
      autoTriggerCountdownRef.current = false;
      if (countdownIntervalRef.current) {
        clearInterval(countdownIntervalRef.current);
      }
    }
  }, [isOpen]);

  useEffect(() => {
    if (!isDemo || step !== 'form' || autoTriggerCountdownRef.current) return;

    const button = ctaButtonRef.current;
    const container = contentRef.current;
    if (!button) return;

    let ioCheckedRef = false;
    let fallbackTimeoutRef: NodeJS.Timeout | null = null;
    let manualCheckTimeoutRef: NodeJS.Timeout | null = null;

    const startCountdown = () => {
      if (countdownIntervalRef.current) clearInterval(countdownIntervalRef.current);

      let currentSeconds = 10;
      setAutoTriggerCountdown(currentSeconds);

      countdownIntervalRef.current = window.setInterval(() => {
        currentSeconds -= 1;
        setAutoTriggerCountdown(currentSeconds);

        if (import.meta.env.DEV) {
          console.log('[Step3 Countdown]', currentSeconds);
        }
      }, 1000);
    };

    const handleIntersection = (entries: IntersectionObserverEntry[]) => {
      const entry = entries[0];
      const isNowVisible = entry.isIntersecting && entry.intersectionRatio >= 0.6;

      if (isNowVisible && !ctaVisible) {
        ioCheckedRef = true;
        setCtaVisible(true);
        startCountdown();
        if (fallbackTimeoutRef) clearTimeout(fallbackTimeoutRef);
      } else if (!isNowVisible && ctaVisible) {
        setCtaVisible(false);
        setAutoTriggerCountdown(null);
        if (countdownIntervalRef.current) {
          clearInterval(countdownIntervalRef.current);
        }
      }
    };

    const observerOptions: IntersectionObserverInit = {
      root: container,
      threshold: 0.6,
    };

    observerRef.current = new IntersectionObserver(handleIntersection, observerOptions);
    observerRef.current.observe(button);

    fallbackTimeoutRef = setTimeout(() => {
      if (!ioCheckedRef) {
        if (import.meta.env.DEV) {
          console.log('[Step3Fallback] IntersectionObserver did not fire, using fallback');
        }
        const rect = button.getBoundingClientRect();
        if (rect.top < window.innerHeight && rect.bottom > 0) {
          setCtaVisible(true);
          startCountdown();
        }
      }
    }, 500);

    manualCheckTimeoutRef = setTimeout(() => {
      if (!ioCheckedRef && !ctaVisible) {
        if (import.meta.env.DEV) {
          console.log('[Step3Manual] Forcing visibility check on mobile');
        }
        setCtaVisible(true);
        startCountdown();
      }
    }, 250);

    return () => {
      if (observerRef.current) {
        observerRef.current.disconnect();
      }
      if (countdownIntervalRef.current) {
        clearInterval(countdownIntervalRef.current);
      }
      if (fallbackTimeoutRef) {
        clearTimeout(fallbackTimeoutRef);
      }
      if (manualCheckTimeoutRef) {
        clearTimeout(manualCheckTimeoutRef);
      }
    };
  }, [isDemo, step, ctaVisible]);

  useEffect(() => {
    if (!isDemo || step !== 'form' || autoTriggerCountdown === null || autoTriggerCountdownRef.current) {
      return;
    }

    if (autoTriggerCountdown === 0) {
      if (import.meta.env.DEV) {
        console.log('[Step3 Countdown] Countdown reached 0, triggering auto-click');
      }
      setAutoTriggerCountdown(null);
      if (countdownIntervalRef.current) {
        clearInterval(countdownIntervalRef.current);
      }
      handleCheckAvailabilityPrimaryAction();
    }
  }, [autoTriggerCountdown, isDemo, step]);

  useEffect(() => {
    if (!demoMode || step !== 'result') return;
    console.log('[Step4 AutoContinue] Initializing - demoMode:', demoMode, 'step:', step);
    setStep4Seconds(8);
    setStep4CtaVisible(false);
    step4TriggeredRef.current = false;
    if (step4IntervalRef.current !== null) {
      window.clearInterval(step4IntervalRef.current);
      step4IntervalRef.current = null;
    }

    const readyDelay = setTimeout(() => {
      console.log('[Step4 AutoContinue] Timer fired, setting step4CtaVisible = true');
      setStep4CtaVisible(true);
    }, 400);

    return () => {
      clearTimeout(readyDelay);
      if (step4IntervalRef.current !== null) {
        window.clearInterval(step4IntervalRef.current);
        step4IntervalRef.current = null;
      }
    };
  }, [demoMode, step]);

  const shouldRunStep4 = demoMode && step === 'result' && step4CtaVisible && !step4TriggeredRef.current;

  useEffect(() => {
    console.log('[Step4 Countdown] shouldRunStep4:', shouldRunStep4, '| demoMode:', demoMode, '| step:', step, '| ctaVisible:', step4CtaVisible, '| triggered:', step4TriggeredRef.current);
    if (shouldRunStep4) {
      if (step4IntervalRef.current !== null) return;
      console.log('[Step4 Countdown] Starting 1s interval countdown');
      step4IntervalRef.current = window.setInterval(() => {
        setStep4Seconds(s => Math.max(0, s - 1));
      }, 1000);
    } else {
      if (step4IntervalRef.current !== null) {
        window.clearInterval(step4IntervalRef.current);
        step4IntervalRef.current = null;
      }
    }
    return () => {
      if (step4IntervalRef.current !== null) {
        window.clearInterval(step4IntervalRef.current);
        step4IntervalRef.current = null;
      }
    };
  }, [shouldRunStep4]);

  useEffect(() => {
    if (!shouldRunStep4) return;
    if (step4Seconds !== 0) return;
    if (step4TriggeredRef.current) return;
    console.log('[Step4 Countdown] Reached 0, triggering goToStep5FromStep4');
    if (step4IntervalRef.current !== null) {
      window.clearInterval(step4IntervalRef.current);
      step4IntervalRef.current = null;
    }
    goToStep5FromStep4();
  }, [step4Seconds, shouldRunStep4]);

  useEffect(() => {
    if (!demoMode) return;
    onStep4StateChange?.(step4Seconds, step4CtaVisible);
  }, [step4Seconds, step4CtaVisible, demoMode]);

  const handleCheckAvailabilityPrimaryAction = async () => {
    try {
      autoTriggerCountdownRef.current = true;
      setAutoTriggerCountdown(null);
      if (countdownIntervalRef.current) {
        clearInterval(countdownIntervalRef.current);
      }
      await resolveIdsAndSubmit();
    } catch (error) {
      if (import.meta.env.DEV) {
        console.error('[AutoClick] Failed to trigger check availability:', error);
      }
      setAutoTriggerCountdown(null);
    }
  };

  const handleCTAClick = () => {
    handleCheckAvailabilityPrimaryAction();
  };

  const goToStep5FromStep4 = () => {
    console.log('[Step4 -> Step5] goToStep5FromStep4 called, alreadyTriggered:', step4TriggeredRef.current);
    if (step4TriggeredRef.current) return;
    step4TriggeredRef.current = true;
    if (step4IntervalRef.current !== null) {
      window.clearInterval(step4IntervalRef.current);
      step4IntervalRef.current = null;
    }
    setStep4CtaVisible(false);
    onOwnerStepChange?.(5);
  };

  const validateStep1 = () => {
    return formData.service && formData.budget && formData.timeline;
  };

  const handleMobileNext = (e: React.FormEvent) => {
    e.preventDefault();
    if (validateStep1()) {
      setMobileStep(2);
    }
  };

  const handleMobileBack = () => {
    setMobileStep(1);
  };

  const resolveIdsAndSubmit = async () => {
    setHasAttemptedSubmit(true);
    setSubmitError('');

    if (!formData.service || !formData.budget || !formData.timeline || !formData.email) {
      return;
    }

    if (isDemo) {
      if (agencyId) frozenAgencyIdRef.current = agencyId;
      if (stateSlug) frozenStateSlugRef.current = stateSlug;
      if (agencyWebsite) {
        setRoutedAgency({
          id: agencyId || null,
          name: agencyName,
          city: stateName,
          state: stateName,
          location: stateName,
          website: agencyWebsite,
          logo: '',
          description: '',
        });
        setIsPaidAvailability(true);
      } else {
        setRoutedAgency({
          id: null,
          name: agencyName || 'Your Agency',
          city: stateName,
          state: stateName,
          location: stateName,
          website: 'https://example.com',
          logo: '',
          description: '',
        });
        setIsPaidAvailability(true);
      }

      if (!demoSubmittedGuardRef.current) {
        demoSubmittedGuardRef.current = true;
        logFunnelEvent({
          ...FUNNEL_EVENTS.DEMO_SUBMITTED,
          agency_id: agencyId ?? undefined,
          agency_name: agencyName,
          state_slug: stateSlug ?? undefined,
          is_demo: true,
          open_instance_id: demoSessionIdRef.current ?? undefined,
        });
      }

      // Owner preview flow: skip the loading/processing animation entirely.
      // Real users still see the full "Reviewing your budget…" animation;
      // preview users get an instant transition (~250ms) to the result step.
      setIsSubmitting(true);
      setTimeout(() => {
        setStep('result');
      }, 250);
      return;
    }

    const pathname = window.location.pathname;

    console.log('[AvailabilityModal] click', {
      agencyIdProp: agencyId,
      agencySlug,
      agencyName,
      stateSlugProp: stateSlug,
      pathname,
      frozenAgencyId: frozenAgencyIdRef.current,
      frozenStateSlug: frozenStateSlugRef.current
    });

    setIsResolvingIds(true);

    try {
      if (agencyId && !frozenAgencyIdRef.current) {
        frozenAgencyIdRef.current = agencyId;
      }

      if (!frozenStateSlugRef.current) {
        if (stateSlug) {
          frozenStateSlugRef.current = stateSlug;
        } else if (reviewContext?.stateSlug) {
          frozenStateSlugRef.current = reviewContext.stateSlug;
        } else {
          const match = pathname.match(/marketing-agencies-in-([^/]+)-united-states/);
          if (match) {
            frozenStateSlugRef.current = match[1];
          }
        }
      }

      if (!frozenAgencyIdRef.current && frozenStateSlugRef.current && agencyName) {
        if (agencySlug) {
          const { data, error } = await supabase
            .from('other_agencies')
            .select('id')
            .eq('slug', agencySlug)
            .eq('state_slug', frozenStateSlugRef.current)
            .maybeSingle();

          if (data && !error) {
            frozenAgencyIdRef.current = data.id;
            console.log('[AvailabilityModal] lookup result', { foundId: data.id, method: 'slug' });
          }
        }

        if (!frozenAgencyIdRef.current) {
          const { data, error } = await supabase
            .from('other_agencies')
            .select('id')
            .eq('name', agencyName)
            .eq('state_slug', frozenStateSlugRef.current)
            .maybeSingle();

          if (data && !error) {
            frozenAgencyIdRef.current = data.id;
            console.log('[AvailabilityModal] lookup result', { foundId: data.id, method: 'name' });
          } else {
            console.log('[AvailabilityModal] lookup result', { foundId: null });
          }
        }
      }

      const finalAgencyId = frozenAgencyIdRef.current;
      const finalStateSlug = frozenStateSlugRef.current || reviewContext?.stateSlug || null;

      if (!finalStateSlug && !reviewContext) {
        setSubmitError('We couldn\'t identify the state. Please refresh and try again.');
        setIsResolvingIds(false);
        return;
      }

      console.log('[AvailabilityModal] proceeding to submit', {
        hasAgencyId: !!finalAgencyId,
        hasStateSlug: !!finalStateSlug,
        isPlaceholderAgency: !finalAgencyId
      });

      if (isOwnerSimulation) {
        logOwnerDemoEvent('demo_submitted', {
          agencyId: finalAgencyId,
          stateSlug: finalStateSlug,
          agencyName,
          service: formData.service,
          budget: formData.budget,
          timeline: formData.timeline,
          mode: 'owner-sim',
          openInstanceId: demoSessionIdRef.current ?? undefined,
        });
      }

      setIsResolvingIds(false);
      setIsSubmitting(true);
      setStep('animating');

    } catch (error) {
      console.error('[AvailabilityModal] Error resolving IDs:', error);
      setSubmitError('An error occurred. Please try again.');
      setIsResolvingIds(false);
    }
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    resolveIdsAndSubmit();
  };

  const handleVisitWebsite = () => {
    setCancelRedirect(true);
    const targetWebsite = routedAgency?.website || recommendedAgency.website;
    const newWindow = window.open(targetWebsite, '_blank');
    if (!newWindow || newWindow.closed || typeof newWindow.closed === 'undefined') {
      // Popup blocked
    }
  };

  const handleCancelRedirect = () => {
    setCancelRedirect(true);
  };

  if (!isOpen) return null;

  const firstName = (formData.name || '').trim();
  const selectedService = formData.service || 'your project';
  const budgetLabel = formData.budget || 'your';
  const timelineLabel = formData.timeline || 'your timeline';
  const safeAgencyName = agencyName || 'this agency';
  const safeStateName = stateName || 'your area';

  const animationSteps: AnimationStep[] = [
    {
      icon: <Search className="w-6 h-6" />,
      text: firstName
        ? `Analyzing your ${selectedService} request, ${firstName}…`
        : `Analyzing your ${selectedService} request for ${safeAgencyName}…`,
      duration: 2500
    },
    {
      icon: <Target className="w-6 h-6" />,
      text: `Reviewing your ${budgetLabel} budget and ${timelineLabel} timeline…`,
      duration: 2500
    },
    {
      icon: <CheckCircle className="w-6 h-6" />,
      text: `If they're not available, we'll recommend the best alternative in ${safeStateName}…`,
      duration: 3000
    }
  ];

  const isProcessing = isResolvingIds || isSubmitting;

  const buttonLabel = isResolvingIds
    ? 'Preparing…'
    : isSubmitting
    ? 'Submitting…'
    : isDemo
    ? 'Check Availability'
    : 'Check Availability →';

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === e.currentTarget) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  return (
    <div
      className={isDemo
        ? "fixed inset-0 z-50 flex items-start justify-center overflow-y-auto px-3 sm:px-4"
        : "fixed inset-0 z-50 flex items-start sm:items-center justify-center bg-black/40 backdrop-blur-sm px-3 py-6 sm:px-4 sm:py-8"
      }
      style={isDemo ? { paddingTop: 'calc(var(--owner-banner-h, 180px) + 16px)', paddingBottom: '2rem', backgroundColor: 'rgb(248 250 252)' } : undefined}
      onClick={handleBackdropClick}
    >
      {isDemo && (
        <style>{`
          @keyframes demoGreenPulse {
            0%, 100% { box-shadow: 0 0 0 0 rgba(52, 211, 153, 0.6), 0 0 0 10px rgba(52, 211, 153, 0.3); }
            50% { box-shadow: 0 0 0 12px rgba(52, 211, 153, 0.1), 0 0 0 22px rgba(52, 211, 153, 0); }
          }
          @keyframes demoBounceArrow {
            0%, 100% { transform: translateY(0); opacity: 1; }
            50% { transform: translateY(-12px); }
          }
          @keyframes demoCountdownPulse {
            0%, 100% { opacity: 0.6; transform: translateY(0); }
            50% { opacity: 1; transform: translateY(2px); }
          }
          @media (prefers-reduced-motion: reduce) {
            .demo-button-pulse { animation: none; }
            .demo-arrow-bounce { animation: none; }
            .demo-countdown-arrow { animation: none; }
          }
          .demo-button-pulse {
            animation: demoGreenPulse 2.5s cubic-bezier(0.4, 0, 0.6, 1) infinite;
          }
          .demo-arrow-bounce {
            animation: demoBounceArrow 1.2s ease-in-out infinite;
          }
          .demo-countdown-arrow {
            animation: demoCountdownPulse 1.2s ease-in-out infinite;
          }
        `}</style>
      )}
      <div
        ref={contentRef}
        className={`relative w-full flex flex-col bg-white rounded-xl shadow-[0_8px_24px_rgba(0,0,0,0.06)]${isDemo ? '' : ' max-h-[90vh] overflow-y-auto'}`}
        style={{
          maxWidth: '760px'
        }}
      >
        {!isDemo && (
          <button
            onClick={onClose}
            className="absolute right-4 top-4 text-gray-400 hover:text-gray-600 transition-colors z-10"
            aria-label="Close"
          >
            <X className="w-5 h-5" />
          </button>
        )}

        {step === 'form' && (
          <div className={`flex-1 px-4 py-4 sm:px-8 sm:py-6${isDemo ? '' : ' overflow-y-auto'}`}>
            <div className="inline-block bg-gradient-to-r from-blue-50 to-blue-100 text-indigo-600 text-[10px] font-semibold px-3 py-1.5 rounded-full mb-3 uppercase tracking-wider">
              🔍 CHECK AGENCY AVAILABILITY
            </div>

            <h1 className="text-[22px] md:text-[26px] font-bold text-gray-900 mb-2 leading-tight">
              Is {agencyName} available for your project?
            </h1>

            {submitError && hasAttemptedSubmit && !reviewContext && (
              <div className="bg-red-50 border border-red-200 rounded-lg p-3 mb-4">
                <p className="text-sm font-medium text-red-900">{submitError}</p>
              </div>
            )}

            {(!isMobile || mobileStep === 1) && (
              <p className="text-gray-600 text-xs md:text-[15px] leading-normal md:leading-relaxed mb-5 sm:mb-6">
                Tell us briefly what you need and we'll check if this agency is available for your project.
              </p>
            )}

            {isMobile && (
              <div className="flex items-center justify-center gap-2 mb-5">
                <div className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-semibold ${mobileStep === 1 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}>
                  1
                </div>
                <div className="h-px w-8 bg-gray-300"></div>
                <div className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-semibold ${mobileStep === 2 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}>
                  2
                </div>
              </div>
            )}

            {!isMobile && (
              <form onSubmit={handleSubmit} className="space-y-4 sm:space-y-5">
                <div>
                  <label className="block text-[13px] md:text-sm font-medium text-gray-700 mb-1.5">
                    What do you need help with? <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <Briefcase className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <select
                      required
                      value={formData.service}
                      onChange={(e) => setFormData({ ...formData, service: e.target.value })}
                      className="w-full pl-10 pr-9 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 text-sm appearance-none"
                      style={{ backgroundImage: "url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e')", backgroundRepeat: 'no-repeat', backgroundPosition: 'right 0.75rem center', backgroundSize: '1rem' }}
                    >
                      <option value="">Select a service...</option>
                      <option value="SEO">SEO</option>
                      <option value="Web Design / Development">Web Design / Development</option>
                      <option value="PPC / Ads">PPC / Ads</option>
                      <option value="Social Media">Social Media</option>
                      <option value="Branding">Branding</option>
                      <option value="General Marketing">General Marketing</option>
                      <option value="Something else">Something else</option>
                    </select>
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 sm:gap-5">
                  <div>
                    <label className="block text-[13px] md:text-sm font-medium text-gray-700 mb-1.5">
                      Estimated budget <span className="text-red-500">*</span>
                    </label>
                    <div className="relative">
                      <DollarSign className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                      <select
                        required
                        value={formData.budget}
                        onChange={(e) => setFormData({ ...formData, budget: e.target.value })}
                        className="w-full pl-10 pr-9 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 text-sm appearance-none"
                        style={{ backgroundImage: "url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e')", backgroundRepeat: 'no-repeat', backgroundPosition: 'right 0.75rem center', backgroundSize: '1rem' }}
                      >
                        <option value="">Select budget...</option>
                        <option value="<$1,000">&lt;$1,000</option>
                        <option value="$1,000–$5,000">$1,000–$5,000</option>
                        <option value="$5,000–$10,000">$5,000–$10,000</option>
                        <option value="$10,000+">$10,000+</option>
                      </select>
                    </div>
                  </div>

                  <div>
                    <label className="block text-[13px] md:text-sm font-medium text-gray-700 mb-1.5">
                      Timeline <span className="text-red-500">*</span>
                    </label>
                    <div className="relative">
                      <Clock className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                      <select
                        required
                        value={formData.timeline}
                        onChange={(e) => setFormData({ ...formData, timeline: e.target.value })}
                        className="w-full pl-10 pr-9 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 text-sm appearance-none"
                        style={{ backgroundImage: "url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e')", backgroundRepeat: 'no-repeat', backgroundPosition: 'right 0.75rem center', backgroundSize: '1rem' }}
                      >
                        <option value="">Select timeline...</option>
                        <option value="ASAP">ASAP</option>
                        <option value="Within 30 days">Within 30 days</option>
                        <option value="30–90 days">30–90 days</option>
                        <option value="Not sure">Not sure</option>
                      </select>
                    </div>
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 sm:gap-5">
                  <div>
                    <label className="block text-[13px] md:text-sm font-medium text-gray-700 mb-1.5">
                      Email address <span className="text-red-500">*</span>
                    </label>
                    <div className="relative">
                      <Mail className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                      <input
                        type="email"
                        required
                        value={formData.email}
                        onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                        className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all text-sm"
                        placeholder="your@email.com"
                      />
                    </div>
                  </div>

                  <div>
                    <label className="block text-[13px] md:text-sm font-medium text-gray-700 mb-1.5">
                      Your name (optional)
                    </label>
                    <div className="relative">
                      <User className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                      <input
                        type="text"
                        value={formData.name}
                        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                        className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all text-sm"
                        placeholder="John Smith"
                      />
                    </div>
                  </div>
                </div>

                <div className="mt-6 space-y-2">
                  <div className="relative">
                    <button
                      ref={ctaButtonRef}
                      type="submit"
                      disabled={isProcessing}
                      onClick={handleCTAClick}
                      className={`w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors shadow-sm hover:shadow-md disabled:opacity-60 disabled:cursor-not-allowed ${
                        isDemo && ctaVisible ? 'demo-button-pulse ring-4 ring-[#34d399] shadow-[0_0_0_10px_rgba(52,211,153,0.30)]' : ''
                      }`}
                    >
                      {buttonLabel}
                    </button>
                  </div>
                </div>
              </form>
            )}

            {isMobile && mobileStep === 1 && (
              <form onSubmit={handleMobileNext} className="space-y-4">
                <div>
                  <label className="block text-[13px] font-medium text-gray-700 mb-1.5">
                    What do you need help with? <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <Briefcase className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <select
                      required
                      value={formData.service}
                      onChange={(e) => setFormData({ ...formData, service: e.target.value })}
                      className="w-full pl-10 pr-9 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 text-sm appearance-none"
                      style={{ backgroundImage: "url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e')", backgroundRepeat: 'no-repeat', backgroundPosition: 'right 0.75rem center', backgroundSize: '1rem' }}
                    >
                      <option value="">Select a service...</option>
                      <option value="SEO">SEO</option>
                      <option value="Web Design / Development">Web Design / Development</option>
                      <option value="PPC / Ads">PPC / Ads</option>
                      <option value="Social Media">Social Media</option>
                      <option value="Branding">Branding</option>
                      <option value="General Marketing">General Marketing</option>
                      <option value="Something else">Something else</option>
                    </select>
                  </div>
                </div>

                <div>
                  <label className="block text-[13px] font-medium text-gray-700 mb-1.5">
                    Estimated budget <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <DollarSign className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <select
                      required
                      value={formData.budget}
                      onChange={(e) => setFormData({ ...formData, budget: e.target.value })}
                      className="w-full pl-10 pr-9 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 text-sm appearance-none"
                      style={{ backgroundImage: "url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e')", backgroundRepeat: 'no-repeat', backgroundPosition: 'right 0.75rem center', backgroundSize: '1rem' }}
                    >
                      <option value="">Select budget...</option>
                      <option value="<$1,000">&lt;$1,000</option>
                      <option value="$1,000–$5,000">$1,000–$5,000</option>
                      <option value="$5,000–$10,000">$5,000–$10,000</option>
                      <option value="$10,000+">$10,000+</option>
                    </select>
                  </div>
                </div>

                <div>
                  <label className="block text-[13px] font-medium text-gray-700 mb-1.5">
                    Timeline <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <Clock className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <select
                      required
                      value={formData.timeline}
                      onChange={(e) => setFormData({ ...formData, timeline: e.target.value })}
                      className="w-full pl-10 pr-9 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 text-sm appearance-none"
                      style={{ backgroundImage: "url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e')", backgroundRepeat: 'no-repeat', backgroundPosition: 'right 0.75rem center', backgroundSize: '1rem' }}
                    >
                      <option value="">Select timeline...</option>
                      <option value="ASAP">ASAP</option>
                      <option value="Within 30 days">Within 30 days</option>
                      <option value="30–90 days">30–90 days</option>
                      <option value="Not sure">Not sure</option>
                    </select>
                  </div>
                </div>

                <div className="mt-4">
                  <button
                    type="submit"
                    className="w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-600 transition-colors shadow-sm hover:shadow-md"
                  >
                    Next →
                  </button>
                </div>
              </form>
            )}

            {isMobile && mobileStep === 2 && (
              <form onSubmit={handleSubmit} className="space-y-4">
                <div>
                  <label className="block text-[13px] font-medium text-gray-700 mb-1.5">
                    Email address <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <Mail className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <input
                      type="email"
                      required
                      value={formData.email}
                      onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all text-sm"
                      placeholder="your@email.com"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-[13px] font-medium text-gray-700 mb-1.5">
                    Your name (optional)
                  </label>
                  <div className="relative">
                    <User className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <input
                      type="text"
                      value={formData.name}
                      onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all text-sm"
                      placeholder="John Smith"
                    />
                  </div>
                </div>

                <div className="flex items-center gap-3 mb-2">
                  {!isDemo && (
                    <button
                      type="button"
                      onClick={handleMobileBack}
                      className="flex-1 bg-gray-100 text-gray-700 py-3 rounded-lg font-semibold hover:bg-gray-200 transition-colors"
                    >
                      Back
                    </button>
                  )}
                  <div className={`${isDemo ? 'w-full' : 'flex-[2]'}`}>
                    <button
                      ref={ctaButtonRef}
                      type="submit"
                      disabled={isProcessing}
                      onClick={handleCTAClick}
                      className={`w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors shadow-sm hover:shadow-md disabled:opacity-60 disabled:cursor-not-allowed ${
                        isDemo && ctaVisible ? 'demo-button-pulse ring-2 ring-[#34d399]' : ''
                      }`}
                    >
                      {buttonLabel}
                    </button>
                    {isDemo && ctaVisible && (
                      <div className="mt-3 flex flex-col items-center gap-2 pointer-events-none">
                        <div className="demo-arrow-bounce">
                          <ChevronDown className="w-6 h-6 text-emerald-500" style={{ filter: 'drop-shadow(0 2px 8px rgba(52, 211, 153, 0.4))' }} />
                        </div>
                      </div>
                    )}
                  </div>
                </div>
              </form>
            )}
          </div>
        )}

        {step === 'animating' && (
          <div className={`flex-1 px-4 py-4 sm:px-8 sm:py-8 min-h-[400px] flex flex-col items-center justify-center${isDemo ? '' : ' overflow-y-auto'}`}>
            <div className="w-16 h-16 mb-6 relative">
              <div className="absolute inset-0 border-4 border-blue-100 rounded-full"></div>
              <div className="absolute inset-0 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin"></div>
            </div>

            <div className="text-center transition-all duration-500 ease-in-out">
              <div className="flex items-center justify-center gap-2 mb-2 text-indigo-600">
                {animationSteps[animationStep].icon}
              </div>
              <p className="text-sm md:text-[15px] font-medium text-slate-700 text-center leading-snug max-w-sm mx-auto px-4">
                {animationSteps[animationStep].text}
              </p>
            </div>
          </div>
        )}

        {step === 'result' && (
          <div className="flex-1 px-4 py-4 sm:px-6 sm:py-6" style={{ overflow: 'visible' }}>
            {isOwnerSimulation && !demoMode && (
              <div className="mb-4 sm:mb-5 rounded-xl bg-indigo-600 px-4 py-3 sm:px-4 sm:py-3.5 text-white max-w-[90%] sm:max-w-[620px] mx-auto">
                <div className="flex items-start gap-2.5">
                  <span className="inline-flex h-6 w-6 items-center justify-center rounded-full bg-indigo-500/80 flex-shrink-0 mt-0.5">
                    <Eye className="h-3.5 w-3.5" />
                  </span>
                  <div className="flex flex-col flex-1">
                    <span className="font-semibold tracking-wide uppercase text-xs">
                      PRIVATE OWNER SIMULATION
                    </span>
                    <div className="mt-2 bg-red-50 border border-red-200 rounded-md px-3 py-2 text-xs sm:text-sm text-red-900">
                      <span className="font-semibold">
                        You're receiving 0 of these requests.
                      </span>{" "}
                      Clients are being redirected right now.
                    </div>
                  </div>
                </div>
              </div>
            )}

            {!demoMode && (
              <>
                <div className="text-center mb-3 max-w-full sm:max-w-[600px] mx-auto">
                  <p className="text-base md:text-lg font-semibold text-slate-900 leading-snug text-center">
                    {isPaidAvailability ? (
                      <>Good news — based on your project details, {routedAgency?.name || agencyName} is available and ready to connect.</>
                    ) : window.location.pathname.includes('/agency-reviews/') ? (
                      <>Good news — {agencyName} looks available.</>
                    ) : (
                      <>This {formatStateName(stateName)} Agency is a better fit for your project.</>
                    )}
                  </p>
                </div>

                <RecommendationCard
                  agency={routedAgency || recommendedAgency}
                  stateName={stateName}
                  onVisit={handleVisitWebsite}
                  mode={mode}
                  hideLogoPlaceholder={reviewContext?.sentiment === 'positive'}
                />

                <AutoRedirect
                  targetUrl={routedAgency?.website || recommendedAgency.website}
                  agencyName={routedAgency?.name || recommendedAgency.name}
                  onCancel={handleCancelRedirect}
                  cancelled={cancelRedirect}
                  mode={mode}
                  agencyId={agencyId}
                  stateSlug={stateSlug}
                />
              </>
            )}

            {demoMode && (
              <div className="max-w-[600px] mx-auto">
                <div className="text-center mb-4">
                  <p className="text-base md:text-lg font-semibold text-slate-900 leading-snug">
                    {stateName ? `This ${formatStateName(stateName)} Agency is a better fit for your project.` : 'This Agency is a better fit for your project.'}
                  </p>
                </div>

                <div className="w-full max-w-[680px] mx-auto">
                  <RecommendationCard
                    agency={{
                      name: 'Vazagency',
                      website: 'https://vazagency.com',
                      city: 'Remote',
                      state: 'US',
                      description: "Vazagency is a modern marketing partner focused on measurable growth."
                    }}
                    stateName={stateName}
                    onVisit={() => {}}
                    mode={mode}
                    showBadge={true}
                    hideVisitButton={true}
                    hideLogo={true}
                  />
                  <div className="bg-[#F8F9FD] border border-t-0 border-[rgba(0,0,0,0.05)] rounded-b-2xl px-4 pb-4 pt-2 text-center -mt-2">
                    <div
                      aria-disabled="true"
                      className="w-full md:w-auto md:px-7 px-5 py-2 rounded-lg font-medium text-sm text-white bg-blue-600 opacity-75 cursor-not-allowed select-none inline-block"
                      onClick={(e) => e.preventDefault()}
                    >
                      Visit: Vazagency
                    </div>
                    <p className="mt-1.5 text-[11px] text-gray-500">vazagency.com</p>
                  </div>
                </div>

                <button
                  ref={step4ButtonRef}
                  onClick={goToStep5FromStep4}
                  className="sr-only"
                  aria-hidden="true"
                  tabIndex={-1}
                />
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

import React, { useState, useEffect, useRef } from 'react';
import { X, Loader } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import { validateAndNormalizeUrl } from './utils/urlNormalizer';
import SubmitAgencyAnimation from './components/SubmitAgencyAnimation';
import SubmitAgencyOfferPage from './pages/SubmitAgencyOfferPage';
import AgencyMatchFoundAnimation from './components/AgencyMatchFoundAnimation';
import { checkExistingAgency } from './utils/agencyMatcher';
import { useScrollLock } from './hooks/useScrollLock';
import { trackFunnelEvent } from './utils/funnelTracking';
import { submitForm, getUtmParams } from './lib/forms/submit';
import { searchAgencies, type AgencyResult } from './lib/yourAgencyApi';
import CompactLogoUploadField from './components/CompactLogoUploadField';

interface SubmitAgencyModalProps {
  isOpen: boolean;
  onClose: () => void;
  stateName: string;
  stateSlug?: string;
  onExistingAgencySelected?: (agencyMatch: AgencyResult, formState?: any) => void;
  enableInlineExistingAgencySuggestions?: boolean;
}

interface FormData {
  agencyName: string;
  contactPerson: string;
  email: string;
  websiteUrl: string;
  description: string;
  services: string[];
  budgetRange?: string;
  state: string;
  stateSlug: string;
  logoUrl?: string;
}

const serviceOptions = [
  'SEO',
  'Web Design',
  'PPC',
  'Branding',
  'Social Media Marketing',
  'Content Marketing',
  'Email Marketing',
  'Performance Marketing',
  'CRO'
];

type ModalStep = 1 | 2 | 3 | 'checking' | 'match-found' | 'animating' | 'offer' | 'claimed';

export default function SubmitAgencyModal({
  isOpen,
  onClose,
  stateName,
  stateSlug = '',
  onExistingAgencySelected,
  enableInlineExistingAgencySuggestions = false
}: SubmitAgencyModalProps) {
  const navigate = useNavigate();
  const [step, setStep] = useState<ModalStep>(1);
  const [claimedSpot, setClaimedSpot] = useState<number | null>(null);
  const [isMobile, setIsMobile] = useState(false);

  const [inlineSuggestions, setInlineSuggestions] = useState<AgencyResult[]>([]);
  const [inlineSuggestionsLoading, setInlineSuggestionsLoading] = useState(false);
  const [inlineSuggestionsQuery, setInlineSuggestionsQuery] = useState('');
  const [showInlineSuggestions, setShowInlineSuggestions] = useState(false);
  const inlineSuggestionsTimeoutRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const [isHandingOff, setIsHandingOff] = useState(false);
  const [handoffLoadingMessage, setHandoffLoadingMessage] = useState('');

  useScrollLock(isOpen);

  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 768);
    };
    checkMobile();
    window.addEventListener('resize', checkMobile);
    return () => window.removeEventListener('resize', checkMobile);
  }, []);
  const [formData, setFormData] = useState<FormData>({
    agencyName: '',
    contactPerson: '',
    email: '',
    websiteUrl: '',
    description: '',
    services: [],
    state: stateName,
    stateSlug: stateSlug || ''
  });

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [successMessage, setSuccessMessage] = useState('');
  const [errorMessage, setErrorMessage] = useState('');
  const [hasCheckedMatch, setHasCheckedMatch] = useState(false);
  const [matchedAgency, setMatchedAgency] = useState<{
    agencyId: string;
    agencyName: string;
    stateName: string;
  } | null>(null);

  useEffect(() => {
    if (isOpen) {
      setStep(1);
      setClaimedSpot(null);
      setSuccessMessage('');
      setErrorMessage('');
      setHasCheckedMatch(false);
      setMatchedAgency(null);
      setInlineSuggestions([]);
      setInlineSuggestionsLoading(false);
      setInlineSuggestionsQuery('');
      setShowInlineSuggestions(false);
      setIsHandingOff(false);
      setHandoffLoadingMessage('');
      setFormData({
        agencyName: '',
        contactPerson: '',
        email: '',
        websiteUrl: '',
        description: '',
        services: [],
        budgetRange: '',
        state: stateName,
        stateSlug: stateSlug || ''
      });
    }
  }, [isOpen, stateName]);

  useEffect(() => {
    return () => {
      if (inlineSuggestionsTimeoutRef.current) {
        clearTimeout(inlineSuggestionsTimeoutRef.current);
      }
    };
  }, []);

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape' && showInlineSuggestions && enableInlineExistingAgencySuggestions) {
        e.preventDefault();
        handleDismissInlineSuggestions();
      }
    };

    if (isOpen && step === 1) {
      window.addEventListener('keydown', handleKeyDown);
      return () => window.removeEventListener('keydown', handleKeyDown);
    }
  }, [isOpen, step, showInlineSuggestions, enableInlineExistingAgencySuggestions, stateSlug]);

  useEffect(() => {
    async function checkForExistingAgency() {
      if (!isOpen || matchedAgency) {
        return;
      }

      const agencyName = formData.agencyName.trim();
      const websiteUrl = formData.websiteUrl.trim();

      console.log('🔍 REALTIME MATCH - Effect triggered', {
        isOpen,
        hasCheckedMatch,
        agencyName: agencyName ? '✓' : '✗',
        websiteUrl: websiteUrl ? '✓' : '✗',
        stateSlug
      });

      if (!agencyName || !websiteUrl) {
        console.log('🔍 REALTIME MATCH - Missing fields, skipping check');
        return;
      }

      if (hasCheckedMatch) {
        console.log('🔍 REALTIME MATCH - Already checked, skipping');
        return;
      }

      const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
      const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

      if (!supabaseUrl || !supabaseAnonKey) {
        console.error('🔍 REALTIME MATCH - Missing Supabase config');
        return;
      }

      console.log('🔍 REALTIME MATCH - Starting check with:', {
        stateSlug,
        agencyName,
        websiteUrl
      });

      setHasCheckedMatch(true);

      const matchResult = await checkExistingAgency(
        stateSlug,
        agencyName,
        websiteUrl,
        supabaseUrl,
        supabaseAnonKey
      );

      console.log('🔍 REALTIME MATCH - Match result:', matchResult);

      if (matchResult.exists && matchResult.agencyId) {
        console.log('✅ REALTIME MATCH - MATCH FOUND! Showing animation and redirecting...');
        setMatchedAgency({
          agencyId: matchResult.agencyId,
          agencyName: matchResult.agencyName || agencyName,
          stateName: matchResult.stateName || stateName
        });
        setStep('match-found');

        setTimeout(() => {
          console.log('🔍 REALTIME MATCH - Redirecting to existing listing page');
          onClose();
          navigate(
            `/existing-listing?agencyId=${matchResult.agencyId}&agencyName=${encodeURIComponent(matchResult.agencyName || agencyName)}&state=${encodeURIComponent(matchResult.stateName || stateName)}&stateSlug=${stateSlug}`
          );
        }, 1500);
      } else {
        console.log('❌ REALTIME MATCH - No match found, continuing with Top-25 flow');
      }
    }

    checkForExistingAgency();
  }, [
    isOpen,
    formData.agencyName,
    formData.websiteUrl,
    hasCheckedMatch,
    matchedAgency,
    stateSlug,
    stateName,
    navigate,
    onClose
  ]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));

    if (enableInlineExistingAgencySuggestions && name === 'agencyName') {
      handleAgencyNameForInlineSuggestions(value);
    }
  };

  const handleAgencyNameForInlineSuggestions = (query: string) => {
    setInlineSuggestionsQuery(query);

    if (inlineSuggestionsTimeoutRef.current) {
      clearTimeout(inlineSuggestionsTimeoutRef.current);
    }

    if (!query.trim() || query.trim().length < 2) {
      setInlineSuggestions([]);
      setInlineSuggestionsLoading(false);
      setShowInlineSuggestions(false);
      return;
    }

    setInlineSuggestionsLoading(true);
    setShowInlineSuggestions(true);
    inlineSuggestionsTimeoutRef.current = setTimeout(async () => {
      try {
        console.log('[SubmitAgencyModal][NJ] inline search input=' + query);
        const results = await searchAgencies(query, 5);
        console.log('[SubmitAgencyModal][NJ] suggestions count=' + results.length);
        setInlineSuggestions(results);
        if (results.length === 0) {
          setShowInlineSuggestions(false);
        }
      } catch (error) {
        console.error('[SubmitAgencyModal][NJ] inline search error', error);
        setInlineSuggestions([]);
        setShowInlineSuggestions(false);
      } finally {
        setInlineSuggestionsLoading(false);
      }
    }, 250);
  };

  const handleDismissInlineSuggestions = () => {
    setShowInlineSuggestions(false);
    console.log('[SubmitAgencyModal][NJ] suggestions dismissed');
  };

  const handleInlineSuggestionClick = async (agency: AgencyResult) => {
    const requestId = Math.random().toString(36).substring(7);
    console.log('[SubmitAgencyModal][NJ] suggestion clicked agencyId=' + agency.id + ' name=' + agency.agency_name);
    console.log('[SubmitAgencyModal][NJ] direct owner handoff start requestId=' + requestId);

    setIsHandingOff(true);
    setInlineSuggestions([]);

    try {
      if (onExistingAgencySelected) {
        const agencyListings = agency.listings ?? agency.states ?? [];
        const currentStateListing = agencyListings.find((l: { state_slug: string }) => l.state_slug === stateSlug);
        const loadingMsg = currentStateListing ? 'Opening your listing preview…' : 'Checking your listing…';
        setHandoffLoadingMessage(loadingMsg);

        await new Promise(resolve => setTimeout(resolve, 400));
        console.log('[SubmitAgencyModal][NJ] direct owner handoff success requestId=' + requestId);
        onExistingAgencySelected(agency, formData);
      }
    } catch (error) {
      console.error('[SubmitAgencyModal][NJ] direct handoff failed requestId=' + requestId + ' error=' + error);
      setIsHandingOff(false);
      setHandoffLoadingMessage('');
    }
  };

  const handleMultiSelectChange = (value: string) => {
    setFormData(prev => {
      const currentValues = prev.services;
      const newValues = currentValues.includes(value)
        ? currentValues.filter(v => v !== value)
        : [...currentValues, value];
      return { ...prev, services: newValues };
    });
  };

  const validateMobileStep1 = () => {
    setErrorMessage('');
    if (!formData.agencyName.trim()) {
      setErrorMessage('Agency Name is required.');
      return false;
    }
    if (!formData.contactPerson.trim()) {
      setErrorMessage('Contact Person is required.');
      return false;
    }
    return true;
  };

  const validateMobileStep2 = () => {
    setErrorMessage('');

    if (!formData.email.trim()) {
      setErrorMessage('Email Address is required.');
      return false;
    }
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(formData.email)) {
      setErrorMessage('Please enter a valid email address.');
      return false;
    }

    if (!formData.websiteUrl.trim()) {
      setErrorMessage('Website URL is required.');
      return false;
    }
    const urlValidation = validateAndNormalizeUrl(formData.websiteUrl);
    if (!urlValidation.valid) {
      setErrorMessage(urlValidation.error || 'Please enter a valid website address (e.g., gappsy.com)');
      return false;
    }
    setFormData(prev => ({ ...prev, websiteUrl: urlValidation.url || prev.websiteUrl }));

    if (!formData.description.trim()) {
      setErrorMessage('Short description is required.');
      return false;
    }
    return true;
  };

  const validateDesktopStep1 = () => {
    setErrorMessage('');
    if (!formData.agencyName.trim()) {
      setErrorMessage('Agency Name is required.');
      return false;
    }
    if (!formData.contactPerson.trim()) {
      setErrorMessage('Contact Person is required.');
      return false;
    }
    if (!formData.email.trim()) {
      setErrorMessage('Email Address is required.');
      return false;
    }
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(formData.email)) {
      setErrorMessage('Please enter a valid email address.');
      return false;
    }
    if (!formData.websiteUrl.trim()) {
      setErrorMessage('Website URL is required.');
      return false;
    }
    const urlValidation = validateAndNormalizeUrl(formData.websiteUrl);
    if (!urlValidation.valid) {
      setErrorMessage(urlValidation.error || 'Please enter a valid website address (e.g., gappsy.com)');
      return false;
    }
    setFormData(prev => ({ ...prev, websiteUrl: urlValidation.url || prev.websiteUrl }));
    return true;
  };

  const validateDesktopStep2 = () => {
    setErrorMessage('');
    if (!formData.description.trim()) {
      setErrorMessage('Short description is required.');
      return false;
    }
    return true;
  };

  const handleStepNext = (e: React.FormEvent) => {
    e.preventDefault();

    if (isMobile) {
      if (step === 1 && validateMobileStep1()) {
        setStep(2);
      } else if (step === 2 && validateMobileStep2()) {
        setStep(3);
      }
    } else {
      if (step === 1 && validateDesktopStep1()) {
        setStep(2);
      }
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    console.log('🔵 TOP25 SUBMIT - Starting submission');
    console.log('🔵 TOP25 SUBMIT - isMobile:', isMobile);
    console.log('🔵 TOP25 SUBMIT - step:', step);
    console.log('🔵 TOP25 SUBMIT - formData:', formData);
    console.log('🔵 TOP25 SUBMIT - matchedAgency:', matchedAgency);

    if (matchedAgency) {
      console.log('⚠️ TOP25 SUBMIT - User already matched to existing agency, should have been redirected');
      return;
    }

    if (!isMobile && !validateDesktopStep2()) {
      console.log('🔴 TOP25 SUBMIT - Desktop validation failed');
      return;
    }

    setErrorMessage('');
    setIsSubmitting(true);

    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
    const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

    if (!supabaseUrl || !supabaseAnonKey) {
      console.error('Missing Supabase configuration');
      setErrorMessage('Configuration error. Please contact support.');
      setIsSubmitting(false);
      return;
    }

    console.log('🔵 TOP25 SUBMIT - No match found earlier, proceeding with Top-25 flow');

    const apiUrl = `${supabaseUrl}/functions/v1/top25-listing`;
    console.log('🔵 TOP25 SUBMIT - Sending data to:', apiUrl);

    fetch(apiUrl, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${supabaseAnonKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(formData),
    })
      .then(response => {
        console.log('🔵 TOP25 SUBMIT - Response status:', response.status);
        return response.json();
      })
      .then(data => {
        console.log('✅ TOP25 SUBMIT - Backend response:', data);
        trackFunnelEvent({
          funnelType: 'top25',
          stateSlug: formData.stateSlug || undefined,
          leadEmail: formData.email,
          leadName: formData.contactPerson || undefined,
          agencyName: formData.agencyName || undefined,
          eventName: 'form_submit',
          submissionType: 'top25_applications',
          submissionId: data?.id ?? undefined,
          metadata: { services: formData.services },
        });
      })
      .catch(error => {
        console.warn('⚠️ TOP25 SUBMIT - Backend call failed (non-blocking):', error);
      });

    submitForm({
      form_type: 'top25_submission',
      state_slug: formData.stateSlug || undefined,
      contact: { name: formData.contactPerson, email: formData.email },
      payload: {
        agency_name: formData.agencyName,
        contact_name: formData.contactPerson,
        email: formData.email,
        website: formData.websiteUrl,
        state_name: formData.state,
        services: Array.isArray(formData.services) ? formData.services.join(', ') : formData.services,
      },
      utm: getUtmParams(),
    }).then((r) => {
      if (!r.ok) console.error('[top25_submission] submit-and-notify failed:', r.error);
    }).catch((e) => console.error('[top25_submission] submit-and-notify network error:', e));

    trackFunnelEvent({
      funnelType: 'top25',
      stateSlug: formData.stateSlug || undefined,
      leadEmail: formData.email,
      leadName: formData.contactPerson || undefined,
      agencyName: formData.agencyName || undefined,
      eventName: 'form_submit',
      eventStage: 'offer',
      metadata: { services: formData.services },
    });

    console.log('✅ TOP25 SUBMIT - Proceeding to animation');
    setStep('animating');
    setIsSubmitting(false);
  };

  const handleAnimationComplete = () => {
    setStep('offer');
  };

  const handleClaimSpot = async (spotNumber: number) => {
    setIsSubmitting(true);

    try {
      const apiUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/top25-claim-intent`;
      const response = await fetch(apiUrl, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          ...formData,
          spotNumber,
          stateSlug,
          timestamp: new Date().toISOString()
        }),
      });

      if (!response.ok) {
        throw new Error('Failed to submit claim intent');
      }

      setClaimedSpot(spotNumber);
      setStep('claimed');
    } catch (error) {
      console.error('Error claiming spot:', error);
      setErrorMessage('Something went wrong. Please try again.');
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleBackToListing = () => {
    onClose();
  };

  if (!isOpen) return null;

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === e.currentTarget) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  if (step === 'offer') {
    return (
      <div
        className="fixed inset-0 z-50 bg-white overflow-y-auto"
        role="dialog"
        aria-modal="true"
        aria-labelledby="offer-page-title"
      >
        <button
          onClick={onClose}
          className="fixed right-6 top-6 text-gray-400 hover:text-gray-600 transition-colors z-10 bg-white rounded-full p-2 shadow-md"
          aria-label="Close"
        >
          <X className="w-5 h-5" />
        </button>
        <SubmitAgencyOfferPage
          submittedAgency={formData}
          stateSlug={stateSlug}
          onClaimSpot={handleClaimSpot}
        />
      </div>
    );
  }

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm overflow-y-auto"
      style={{
        paddingTop: isMobile ? '8px' : 'max(120px, 12vh)',
        paddingBottom: isMobile ? '8px' : 'max(96px, 10vh)'
      }}
      role="dialog"
      aria-modal="true"
      aria-labelledby="top25-modal-title"
      onClick={handleBackdropClick}
    >
      <div
        className={`relative w-full max-w-[640px] mx-4 bg-white rounded-2xl shadow-[0_8px_24px_rgba(0,0,0,0.06)] my-auto ${isMobile ? '' : ''}`}
      >
        {isHandingOff && handoffLoadingMessage && (
          <div className="absolute inset-0 bg-white/95 rounded-2xl flex items-center justify-center z-50 backdrop-blur-sm">
            <div className="text-center">
              <div className="flex justify-center mb-4">
                <Loader size={32} className="text-indigo-600 animate-spin" />
              </div>
              <p className="text-lg font-semibold text-gray-900">{handoffLoadingMessage}</p>
              <p className="text-sm text-gray-600 mt-2">Please wait a moment while we open your listing.</p>
            </div>
          </div>
        )}

        <button
          onClick={onClose}
          className="absolute right-4 top-4 text-gray-400 hover:text-gray-600 transition-colors z-10"
          aria-label="Close modal"
        >
          <X className="w-5 h-5" />
        </button>

        {step === 'checking' || step === 'match-found' ? (
          <div className="p-8 min-h-[350px]">
            <AgencyMatchFoundAnimation stateName={stateName} />
          </div>
        ) : step === 'animating' ? (
          <SubmitAgencyAnimation
            submittedAgency={formData}
            onComplete={handleAnimationComplete}
          />
        ) : step === 'claimed' ? (
          <div className="p-8" role="status" aria-live="polite">
            <div className="flex flex-col items-center justify-center min-h-[300px] text-center">
              <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-6">
                <svg className="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
              </div>
              <h2 className="text-xl font-bold text-gray-900 mb-4">
                Thanks, {formData.contactPerson.split(' ')[0] || 'there'} — we've received your request to claim spot #{claimedSpot}.
              </h2>
              <p className="text-gray-700 max-w-md leading-relaxed mb-6">
                Our team will review your submission and follow up with next steps, including pricing and timeline to activate your Top 25 placement.
              </p>
              <button
                onClick={handleBackToListing}
                className="px-8 py-3 bg-indigo-600 text-white font-semibold rounded-lg hover:bg-indigo-700 transition-colors"
              >
                Back to {stateName} Top 25
              </button>
            </div>
          </div>
        ) : (
          <div className={isMobile ? "p-3 pb-3" : "p-8 md:pb-8"}>
            <div className={isMobile ? "flex items-center mb-1.5 pr-10" : "flex items-center justify-between mb-3"}>
              <div className={`inline-block bg-gradient-to-r from-blue-50 to-blue-100 text-indigo-600 text-[10px] font-semibold px-3 py-1.5 rounded-full uppercase tracking-wider ${isMobile ? 'text-[9px] px-2.5 py-1' : ''}`}>
                Top 25 Submission
              </div>

              <nav className="flex md:hidden items-center gap-1 ml-auto" aria-label="Mobile form progress">
                <div
                  className={`flex items-center justify-center w-5 h-5 rounded-full text-[10px] font-semibold ${step === 1 ? 'bg-indigo-600 text-white' : step > 1 ? 'bg-gray-400 text-white' : 'bg-gray-200 text-gray-600'}`}
                  aria-label={`Step 1${step === 1 ? ' - Current step' : ' - Completed'}`}
                  aria-current={step === 1 ? 'step' : undefined}
                >
                  1
                </div>
                <div className="h-px w-3 bg-gray-300" aria-hidden="true"></div>
                <div
                  className={`flex items-center justify-center w-5 h-5 rounded-full text-[10px] font-semibold ${step === 2 ? 'bg-indigo-600 text-white' : step > 2 ? 'bg-gray-400 text-white' : 'bg-gray-200 text-gray-600'}`}
                  aria-label={`Step 2${step === 2 ? ' - Current step' : ''}`}
                  aria-current={step === 2 ? 'step' : undefined}
                >
                  2
                </div>
                <div className="h-px w-3 bg-gray-300" aria-hidden="true"></div>
                <div
                  className={`flex items-center justify-center w-5 h-5 rounded-full text-[10px] font-semibold ${step === 3 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}
                  aria-label={`Step 3${step === 3 ? ' - Current step' : ''}`}
                  aria-current={step === 3 ? 'step' : undefined}
                >
                  3
                </div>
              </nav>
            </div>

            <h1 id="top25-modal-title" className={`font-bold text-gray-900 leading-tight ${isMobile ? 'text-base mb-1' : 'text-lg md:text-2xl mb-2 md:leading-normal'}`}>
              Get Listed in the Top 25 of {stateName}
            </h1>

            {(!isMobile || step === 1) && (
              <p className={`text-gray-600 max-w-[520px] ${isMobile ? 'text-xs leading-snug mb-3' : 'text-sm leading-relaxed mb-6'}`}>
                This is a paid listing for agencies that want to be included in the Top 25 for {stateName}. After you submit your details, we'll review your application and share the next steps.
              </p>
            )}

            {enableInlineExistingAgencySuggestions && step === 1 && !isHandingOff && (
              <div className={isMobile ? "mb-4 text-center" : "mb-5 text-center"}>
                <button
                  type="button"
                  onClick={() => {
                    if (onExistingAgencySelected) {
                      setIsHandingOff(true);
                      setTimeout(() => {
                        console.log('[SubmitAgencyModal] manual owner link clicked');
                        onExistingAgencySelected(null as any, formData);
                      }, 100);
                    }
                  }}
                  className="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-gray-700 bg-gray-100 hover:bg-gray-200 transition-colors rounded-lg border border-gray-300 hover:border-gray-400"
                >
                  Already listed? Find your agency →
                </button>
              </div>
            )}

            {errorMessage && (
              <div className={`p-4 bg-red-50 border border-red-200 rounded-lg ${isMobile ? 'mb-3' : 'mb-6'}`} role="alert">
                <p className={`text-red-800 ${isMobile ? 'text-xs' : 'text-sm'}`}>{errorMessage}</p>
              </div>
            )}

            <nav className={`hidden md:flex items-center justify-center gap-2.5 ${isMobile ? 'mb-0.5' : 'mb-1'}`} aria-label="Form progress" style={{marginTop: isMobile ? '-6px' : '-14px'}}>
              <div
                className={`flex items-center justify-center w-6 h-6 rounded-full text-xs font-semibold ${step === 1 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}
                aria-label={`Step 1${step === 1 ? ' - Current step' : ' - Completed'}`}
                aria-current={step === 1 ? 'step' : undefined}
              >
                1
              </div>
              <div className="h-px w-12 bg-gray-300" aria-hidden="true"></div>
              <div
                className={`flex items-center justify-center w-6 h-6 rounded-full text-xs font-semibold ${step === 2 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}
                aria-label={`Step 2${step === 2 ? ' - Current step' : ''}`}
                aria-current={step === 2 ? 'step' : undefined}
              >
                2
              </div>
            </nav>

            {step === 1 && (
              <>
              <form id="step1-form" onSubmit={handleStepNext} className={isMobile ? "space-y-3.5" : "space-y-6"} style={{marginTop: isMobile ? '8px' : '16px'}}>
                <fieldset className={`grid grid-cols-1 md:grid-cols-2 ${isMobile ? 'gap-3' : 'gap-6'}`}>
                  <legend className="sr-only">Basic agency information</legend>

                  <div>
                    <label htmlFor="agencyName" className={`block font-medium text-gray-700 ${isMobile ? 'text-xs mb-1.5' : 'text-sm mb-2'}`}>
                      Agency Name <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <div className="relative">
                      <input
                        type="text"
                        id="agencyName"
                        name="agencyName"
                        value={formData.agencyName}
                        onChange={handleInputChange}
                        required
                        aria-required="true"
                        className={`w-full px-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all ${isMobile ? 'py-2 text-sm' : 'py-2.5'}`}
                      />

                      {enableInlineExistingAgencySuggestions && showInlineSuggestions && (inlineSuggestions.length > 0 || inlineSuggestionsLoading) && (
                        <div className="absolute z-50 top-full left-0 right-0 mt-1 bg-white border border-slate-200 rounded-lg shadow-md overflow-hidden" style={{minWidth: '320px'}}>
                          {inlineSuggestionsLoading && (
                            <div className="p-4 flex items-center gap-2 text-sm text-slate-500">
                              <Loader size={14} className="animate-spin" />
                              Searching agencies...
                            </div>
                          )}

                          {!inlineSuggestionsLoading && inlineSuggestions.length > 0 && (
                            <>
                              <div className="px-4 py-3 bg-slate-50 border-b border-slate-200">
                                <div className="text-xs font-medium text-slate-700 leading-snug">
                                  Is this your agency? We already have you listed.
                                </div>
                              </div>

                              <ul className="divide-y divide-slate-200 max-h-[240px] overflow-y-auto">
                                {inlineSuggestions.map((agency) => (
                                  <li key={agency.id}>
                                    <button
                                      type="button"
                                      onClick={() => handleInlineSuggestionClick(agency)}
                                      disabled={isHandingOff}
                                      className="w-full text-left px-4 py-3.5 hover:bg-indigo-50 active:bg-indigo-100 transition-colors disabled:opacity-50 disabled:cursor-not-allowed focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-inset"
                                    >
                                      <div className="flex flex-col">
                                        <div className="min-w-0">
                                          <div className="truncate font-semibold text-slate-900" title={agency.agency_name}>{agency.agency_name}</div>
                                          {agency.agency_domain && (
                                            <div className="truncate text-sm text-slate-500 mt-1" title={agency.agency_domain}>{agency.agency_domain}</div>
                                          )}
                                          {(() => {
                                            const agencyL = agency.listings ?? agency.states ?? [];
                                            if (!agencyL.length) return null;
                                            return (
                                              <div className="truncate text-xs text-slate-500 mt-1">
                                                {agencyL.length === 1
                                                  ? `Listed on ${agencyL[0].state_slug === stateSlug ? 'this page' : 'another state page'}`
                                                  : `Listed on ${agencyL.length} state pages`}
                                              </div>
                                            );
                                          })()}
                                        </div>
                                        <div className="mt-3">
                                          <button
                                            type="button"
                                            onClick={(e) => {
                                              e.preventDefault();
                                              e.stopPropagation();
                                              handleInlineSuggestionClick(agency);
                                            }}
                                            className="text-xs sm:text-sm font-semibold text-white bg-indigo-600 hover:bg-indigo-700 active:bg-indigo-800 px-2.5 sm:px-3 py-1.5 sm:py-2 rounded transition-colors whitespace-nowrap"
                                            title="Click to view your agency listing"
                                          >
                                            Click to view
                                          </button>
                                        </div>
                                      </div>
                                    </button>
                                  </li>
                                ))}
                              </ul>

                              <div className="border-t border-slate-200 px-4 py-3 bg-white">
                                <div className="flex items-center justify-between gap-3 mb-3">
                                  <button
                                    type="button"
                                    onClick={handleDismissInlineSuggestions}
                                    className="text-xs font-medium text-slate-500 hover:text-slate-700 transition-colors"
                                    title="Dismiss suggestions"
                                  >
                                    This is not my agency
                                  </button>
                                </div>
                                <button
                                  type="button"
                                  onClick={handleDismissInlineSuggestions}
                                  className="w-full text-sm text-slate-600 hover:text-slate-900 hover:bg-slate-50 font-medium transition-colors py-2 px-2 rounded border border-slate-200"
                                >
                                  Continue with a new agency submission
                                </button>
                              </div>
                            </>
                          )}
                        </div>
                      )}
                    </div>
                  </div>

                  <div>
                    <label htmlFor="contactPerson" className={`block font-medium text-gray-700 ${isMobile ? 'text-xs mb-1.5' : 'text-sm mb-2'}`}>
                      Contact Person <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <input
                      type="text"
                      id="contactPerson"
                      name="contactPerson"
                      value={formData.contactPerson}
                      onChange={handleInputChange}
                      required
                      aria-required="true"
                      className={`w-full px-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all ${isMobile ? 'py-2 text-sm' : 'py-2.5'}`}
                    />
                  </div>

                  <div className="hidden md:block">
                    <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-2">
                      Email Address <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <input
                      type="email"
                      id="email"
                      name="email"
                      value={formData.email}
                      onChange={handleInputChange}
                      required={!isMobile}
                      aria-required="true"
                      className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                    />
                  </div>

                  <div className="hidden md:block">
                    <label htmlFor="websiteUrl" className="block text-sm font-medium text-gray-700 mb-2">
                      Website URL <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <input
                      type="text"
                      id="websiteUrl"
                      name="websiteUrl"
                      value={formData.websiteUrl}
                      onChange={handleInputChange}
                      placeholder="e.g., gappsy.com"
                      required={!isMobile}
                      aria-required="true"
                      className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                    />
                  </div>
                </fieldset>

                <div className={isMobile ? "mt-2.5" : "md:mt-2 mt-4"}>
                  <button
                    type="submit"
                    className={`w-full bg-indigo-600 text-white rounded-lg font-semibold hover:bg-indigo-700 active:bg-indigo-700 transition-colors shadow-sm hover:shadow-md ${isMobile ? 'py-2.5 text-sm' : 'py-3'}`}
                    aria-label="Continue to step 2"
                  >
                    Next step →
                  </button>
                </div>
              </form>
              </>
            )}

            {step === 2 && (
              <form id="step2-form" onSubmit={isMobile ? handleStepNext : handleSubmit} className={isMobile ? "space-y-2" : "space-y-6"} style={isMobile ? {marginTop: '6px'} : {marginTop: '16px'}}>
                <fieldset>
                  <legend className="sr-only">Agency details and services</legend>

                  {isMobile && (
                    <>
                      <div className="mb-1.5">
                        <label htmlFor="email-mobile" className="block text-xs font-medium text-gray-700 mb-0.5">
                          Email Address <span className="text-red-500" aria-label="required">*</span>
                        </label>
                        <input
                          type="email"
                          id="email-mobile"
                          name="email"
                          value={formData.email}
                          onChange={handleInputChange}
                          required
                          aria-required="true"
                          className="w-full px-3 py-1.5 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                        />
                      </div>

                      <div className="mb-1.5">
                        <label htmlFor="websiteUrl-mobile" className="block text-xs font-medium text-gray-700 mb-0.5">
                          Website URL <span className="text-red-500" aria-label="required">*</span>
                        </label>
                        <input
                          type="text"
                          id="websiteUrl-mobile"
                          name="websiteUrl"
                          value={formData.websiteUrl}
                          onChange={handleInputChange}
                          placeholder="e.g., gappsy.com"
                          required
                          aria-required="true"
                          className="w-full px-3 py-1.5 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                        />
                      </div>
                    </>
                  )}

                  <div className={isMobile ? "mb-2" : "mb-6"}>
                    <label htmlFor="description" className={`block font-medium text-gray-700 ${isMobile ? 'text-xs mb-0.5' : 'text-sm mb-2'}`}>
                      Short description <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <textarea
                      id="description"
                      name="description"
                      value={formData.description}
                      onChange={handleInputChange}
                      rows={isMobile ? 2 : 4}
                      maxLength={500}
                      required
                      aria-required="true"
                      placeholder={isMobile ? "Describe your agency and services…" : "This text will appear on your Top 25 agency card. Clearly describe your services and what makes you different. Do not include URLs."}
                      className={`w-full border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all resize-none placeholder:text-gray-400 ${isMobile ? 'px-3 py-1.5 text-sm placeholder:text-sm' : 'px-4 py-2.5 placeholder:text-sm'}`}
                    />
                    {!isMobile && (
                      <p className="text-xs text-gray-500 mt-1.5 text-right">
                        {formData.description.length}/500
                      </p>
                    )}
                  </div>

                  {!isMobile && (
                    <>
                      <CompactLogoUploadField
                        stateSlug={stateSlug}
                        onUpload={(url) => setFormData(prev => ({ ...prev, logoUrl: url }))}
                        className="mb-5"
                      />
                      <div>
                        <span className="block text-sm font-medium text-gray-700 mb-3" id="services-label">
                          Main services offered
                        </span>
                      <div className="grid grid-cols-2 md:grid-cols-3 gap-3" role="group" aria-labelledby="services-label">
                        {serviceOptions.map(service => (
                          <label key={service} className="flex items-center space-x-2 cursor-pointer">
                            <input
                              type="checkbox"
                              checked={formData.services.includes(service)}
                              onChange={() => handleMultiSelectChange(service)}
                              aria-label={service}
                              className="w-4 h-4 text-indigo-600 border-gray-300 rounded focus:ring-2 focus:ring-indigo-600"
                            />
                            <span className="text-sm text-gray-700">{service}</span>
                          </label>
                        ))}
                      </div>
                    </div>
                    </>
                  )}
                </fieldset>

                {isMobile && (
                  <CompactLogoUploadField
                    stateSlug={stateSlug}
                    onUpload={(url) => setFormData(prev => ({ ...prev, logoUrl: url }))}
                    helperText="Helps your listing look more complete."
                  />
                )}

                <div className={isMobile ? "mt-2" : "md:mt-2 mt-4"}>
                  <button
                    type="submit"
                    disabled={isSubmitting}
                    className={`w-full bg-indigo-600 text-white rounded-lg font-semibold hover:bg-indigo-700 active:bg-indigo-700 transition-colors shadow-sm hover:shadow-md disabled:opacity-50 disabled:cursor-not-allowed ${isMobile ? 'py-2.5 text-sm' : 'py-3'}`}
                    aria-label={isSubmitting ? 'Submitting your agency' : 'Submit your agency listing'}
                  >
                    {isSubmitting ? 'Submitting...' : (isMobile && step === 2 ? 'Next step →' : 'Submit Agency')}
                  </button>
                </div>
              </form>
            )}

            {step === 3 && isMobile && (
              <form onSubmit={handleSubmit} className="space-y-2.5" style={{marginTop: '6px'}}>
                <fieldset>
                  <legend className="sr-only">Services offered</legend>

                  <div>
                    <span className="block text-xs font-medium text-gray-700 mb-2" id="services-label">
                      Services offered
                    </span>
                    <div className="grid grid-cols-2 gap-x-3 gap-y-1.5" role="group" aria-labelledby="services-label">
                      {serviceOptions.map((service) => (
                        <label
                          key={service}
                          className="flex items-center gap-2 cursor-pointer"
                        >
                          <input
                            type="checkbox"
                            value={service}
                            checked={formData.services.includes(service)}
                            onChange={() => handleMultiSelectChange(service)}
                            className="w-4 h-4 text-indigo-600 border-gray-300 rounded focus:ring-2 focus:ring-indigo-600 flex-shrink-0"
                          />
                          <span className="text-xs text-gray-700">{service}</span>
                        </label>
                      ))}
                    </div>
                  </div>
                </fieldset>

                <div className="pt-1">
                  <button
                    type="submit"
                    disabled={isSubmitting}
                    className="w-full bg-indigo-600 text-white py-2.5 text-sm rounded-lg font-semibold hover:bg-indigo-700 active:bg-indigo-700 transition-colors shadow-sm hover:shadow-md disabled:opacity-50 disabled:cursor-not-allowed"
                    aria-label={isSubmitting ? 'Submitting your agency' : 'Submit your agency'}
                  >
                    {isSubmitting ? 'Submitting...' : 'Submit Agency'}
                  </button>
                </div>
              </form>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

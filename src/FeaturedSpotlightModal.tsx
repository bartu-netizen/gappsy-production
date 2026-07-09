import React, { useState, useEffect } from 'react';
import { X } from 'lucide-react';
import { validateAndNormalizeUrl } from './utils/urlNormalizer';
import SpotlightAnimation from './components/SpotlightAnimation';
import SpotlightOfferPage from './pages/SpotlightOfferPage';
import { useScrollLock } from './hooks/useScrollLock';
import { trackFunnelEvent } from './utils/funnelTracking';
import { submitForm, getUtmParams } from './lib/forms/submit';
import CompactLogoUploadField from './components/CompactLogoUploadField';

interface FeaturedSpotlightModalProps {
  isOpen: boolean;
  onClose: () => void;
  stateName: string;
  stateSlug?: string;
}

interface FormData {
  agencyName: string;
  contactPerson: string;
  email: string;
  websiteUrl: string;
  description: string;
  budgetRange: string;
  services: string[];
  state: string;
  stateSlug: string;
  logoUrl?: string;
}

const budgetOptions = [
  'Under $2,500',
  '$2,500–$5,000',
  '$5,000–$10,000',
  '$10,000–$25,000',
  '$25,000–$50,000',
  '$50,000+'
];

const serviceOptions = [
  'SEO',
  'Branding',
  'Email Marketing',
  'Web Design',
  'Social Media Marketing',
  'Performance Marketing',
  'PPC',
  'Content Marketing',
  'CRO'
];

type Step = 1 | 2;
type MobileStep = 1 | 2 | 3;
type ModalStep = 1 | 2 | 'animating' | 'offer' | 'success';

export default function FeaturedSpotlightModal({ isOpen, onClose, stateName, stateSlug = '' }: FeaturedSpotlightModalProps) {
  const [step, setStep] = useState<Step>(1);
  const [mobileStep, setMobileStep] = useState<MobileStep>(1);
  const [modalStep, setModalStep] = useState<ModalStep>(1);
  const [isMobile, setIsMobile] = useState(false);

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
    budgetRange: '',
    services: [],
    state: stateName,
    stateSlug: stateSlug || ''
  });

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [successMessage, setSuccessMessage] = useState('');
  const [errorMessage, setErrorMessage] = useState('');

  useEffect(() => {
    if (isOpen) {
      setStep(1);
      setMobileStep(1);
      setModalStep(1);
      setSuccessMessage('');
      setErrorMessage('');
      setFormData({
        agencyName: '',
        contactPerson: '',
        email: '',
        websiteUrl: '',
        description: '',
        budgetRange: '',
        services: [],
        state: stateName,
        stateSlug: stateSlug || ''
      });
    }
  }, [isOpen, stateName, stateSlug]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
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

  const validateStep1 = () => {
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

  const handleStepNext = (e: React.FormEvent) => {
    e.preventDefault();

    if (validateStep1()) {
      setStep(2);
    }
  };

  const handleMobileStep1Next = (e: React.FormEvent) => {
    e.preventDefault();
    setErrorMessage('');

    if (!formData.agencyName.trim()) {
      setErrorMessage('Agency Name is required.');
      return;
    }
    if (!formData.contactPerson.trim()) {
      setErrorMessage('Contact Person is required.');
      return;
    }
    if (!formData.websiteUrl.trim()) {
      setErrorMessage('Website URL is required.');
      return;
    }

    const urlValidation = validateAndNormalizeUrl(formData.websiteUrl);
    if (!urlValidation.valid) {
      setErrorMessage(urlValidation.error || 'Please enter a valid website address (e.g., gappsy.com)');
      return;
    }

    setFormData(prev => ({ ...prev, websiteUrl: urlValidation.url || prev.websiteUrl }));
    setMobileStep(2);
  };

  const handleMobileStep2Next = (e: React.FormEvent) => {
    e.preventDefault();
    setErrorMessage('');

    if (!formData.email.trim()) {
      setErrorMessage('Email Address is required.');
      return;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(formData.email)) {
      setErrorMessage('Please enter a valid email address.');
      return;
    }

    if (!formData.description.trim()) {
      setErrorMessage('Agency description is required.');
      return;
    }

    if (!formData.budgetRange) {
      setErrorMessage('Please select a typical project budget range.');
      return;
    }

    setMobileStep(3);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setErrorMessage('');

    if (!formData.description.trim()) {
      setErrorMessage('Agency description is required.');
      return;
    }

    if (!formData.budgetRange) {
      setErrorMessage('Please select a typical project budget range.');
      return;
    }

    if (formData.services.length === 0) {
      setErrorMessage('Please select at least one service.');
      return;
    }

    setIsSubmitting(true);

    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
    const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

    if (supabaseUrl && supabaseKey) {
      const apiUrl = `${supabaseUrl}/functions/v1/featured-spotlight`;

      console.log('Submitting spotlight application to:', apiUrl);
      console.log('Form data:', {
        ...formData,
        servicesCount: formData.services.length
      });

      fetch(apiUrl, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${supabaseKey}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      })
        .then(response => {
          console.log('Spotlight response status:', response.status);
          return response.json();
        })
        .then(result => {
          console.log('✅ Spotlight submission success:', result);
          trackFunnelEvent({
            funnelType: 'spotlight',
            stateSlug: formData.stateSlug || undefined,
            leadEmail: formData.email,
            leadName: formData.contactPerson || undefined,
            agencyName: formData.agencyName || undefined,
            eventName: 'form_submit',
            submissionType: 'spotlight_applications',
            submissionId: result?.id ?? undefined,
            metadata: { budgetRange: formData.budgetRange, services: formData.services },
          });
        })
        .catch(error => {
          console.warn('⚠️ Spotlight backend call failed (non-blocking):', error);
        });
    } else {
      console.warn('⚠️ Supabase config missing, skipping backend call');
    }

    submitForm({
      form_type: 'sponsored_spotlight',
      state_slug: formData.stateSlug || undefined,
      contact: { name: formData.contactPerson, email: formData.email },
      payload: {
        agency_name: formData.agencyName,
        contact_name: formData.contactPerson,
        email: formData.email,
        website: formData.websiteUrl,
        state_name: formData.state,
        budget_range: formData.budgetRange,
        services: formData.services.join(', '),
        description: formData.description,
      },
      utm: getUtmParams(),
    }).then((r) => {
      if (!r.ok) console.error('[sponsored_spotlight] submit-and-notify failed:', r.error);
    }).catch((e) => console.error('[sponsored_spotlight] submit-and-notify network error:', e));

    trackFunnelEvent({
      funnelType: 'spotlight',
      stateSlug: formData.stateSlug || undefined,
      leadEmail: formData.email,
      leadName: formData.contactPerson || undefined,
      agencyName: formData.agencyName || undefined,
      eventName: 'form_submit',
      eventStage: 'offer',
      metadata: { budgetRange: formData.budgetRange, services: formData.services },
    });

    console.log('✅ Spotlight - Proceeding to animation');
    setModalStep('animating');
    setIsSubmitting(false);
  };

  const handleAnimationComplete = () => {
    setModalStep('offer');
  };

  const handleProceedToPayment = () => {
    setSuccessMessage('Thank you! We\'ll get back to you shortly with spotlight availability and pricing details.');
    setModalStep('success');

    setTimeout(() => {
      onClose();
      setSuccessMessage('');
    }, 4000);
  };

  if (!isOpen) return null;

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === e.currentTarget) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  if (modalStep === 'offer') {
    return (
      <div
        className="fixed inset-0 z-50 bg-white overflow-y-auto"
        role="dialog"
        aria-modal="true"
        aria-labelledby="offer-page-title"
      >
        <button
          onClick={onClose}
          className="fixed right-4 md:right-6 top-4 md:top-6 text-gray-400 hover:text-gray-600 transition-colors z-10 bg-white rounded-full p-2 shadow-md"
          style={{
            position: isMobile ? 'absolute' : 'fixed'
          }}
          aria-label="Close"
        >
          <X className="w-5 h-5" />
        </button>
        <div style={{ paddingTop: isMobile ? '48px' : '0' }}>
          <SpotlightOfferPage
            formData={formData}
            onProceed={handleProceedToPayment}
          />
        </div>
      </div>
    );
  }

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm overflow-y-auto"
      style={{ paddingTop: 'max(120px, 12vh)', paddingBottom: 'max(96px, 10vh)' }}
      role="dialog"
      aria-modal="true"
      aria-labelledby="spotlight-modal-title"
      onClick={handleBackdropClick}
    >
      <div
        className="relative w-full max-w-[640px] mx-4 bg-white rounded-2xl shadow-[0_8px_24px_rgba(0,0,0,0.06)] my-auto"
      >
        <button
          onClick={onClose}
          className="absolute right-4 top-4 text-gray-400 hover:text-gray-600 transition-colors z-10"
          aria-label="Close modal"
        >
          <X className="w-5 h-5" />
        </button>

        {modalStep === 'animating' ? (
          <SpotlightAnimation
            formData={formData}
            onComplete={handleAnimationComplete}
          />
        ) : successMessage ? (
          <div className="p-8" role="status" aria-live="polite">
            <div className="flex flex-col items-center justify-center min-h-[300px] text-center">
              <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-6" aria-hidden="true">
                <svg className="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
              </div>
              <h2 className="text-xl font-bold text-gray-900 mb-3">
                Application Received!
              </h2>
              <p className="text-gray-700 max-w-md leading-relaxed">
                {successMessage}
              </p>
            </div>
          </div>
        ) : (
          <div className="p-3 md:p-8">
            {/* Mobile: Badge + Step Indicator in one row */}
            <div className="md:hidden flex items-center mb-1.5 pr-10">
              <div className="inline-block bg-gradient-to-r from-blue-50 to-blue-100 text-indigo-600 text-[9px] font-semibold px-2 py-1 rounded-full uppercase tracking-wider flex-shrink-0">
                ⭐ Spotlight
              </div>

              <nav className="flex items-center gap-1 ml-auto" aria-label="Form progress">
                <div
                  className={`flex items-center justify-center w-5 h-5 rounded-full text-[10px] font-semibold ${mobileStep === 1 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}
                  aria-label={`Step 1${mobileStep === 1 ? ' - Current step' : ' - Completed'}`}
                >
                  1
                </div>
                <div className="h-px w-3 bg-gray-300" aria-hidden="true"></div>
                <div
                  className={`flex items-center justify-center w-5 h-5 rounded-full text-[10px] font-semibold ${mobileStep === 2 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}
                  aria-label={`Step 2${mobileStep === 2 ? ' - Current step' : ' - Completed'}`}
                >
                  2
                </div>
                <div className="h-px w-3 bg-gray-300" aria-hidden="true"></div>
                <div
                  className={`flex items-center justify-center w-5 h-5 rounded-full text-[10px] font-semibold ${mobileStep === 3 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}
                  aria-label={`Step 3${mobileStep === 3 ? ' - Current step' : ''}`}
                >
                  3
                </div>
              </nav>
            </div>

            {/* Desktop: Badge only */}
            <div className="hidden md:inline-block bg-gradient-to-r from-blue-50 to-blue-100 text-indigo-600 text-[10px] font-semibold px-3 py-1.5 rounded-full mb-3 uppercase tracking-wider">
              ⭐ Sponsored Spotlight
            </div>

            <h1 id="spotlight-modal-title" className="text-base md:text-2xl font-bold text-gray-900 mb-1 md:mb-2 leading-tight md:leading-normal">
              Apply for a Sponsored Spotlight Placement
            </h1>

            {/* Desktop: Show subtext on Step 1 */}
            {step === 1 && (
              <p className="hidden md:block text-gray-600 text-sm leading-relaxed mb-6 max-w-[520px]">
                This is a premium paid placement at the top of the page. Submit your details and we'll send pricing and next steps.
              </p>
            )}

            {/* Mobile: Show subtext on Step 1 only — shortened */}
            {mobileStep === 1 && (
              <p className="md:hidden text-gray-500 text-xs leading-snug mb-2 max-w-[520px]">
                Premium placement at the top of the page. Submit your details and we'll send pricing.
              </p>
            )}

            {errorMessage && (
              <div className="mb-3 md:mb-6 p-3 md:p-4 bg-red-50 border border-red-200 rounded-lg" role="alert">
                <p className="text-sm text-red-800">{errorMessage}</p>
              </div>
            )}

            {/* Desktop stepper: 2 steps */}
            <nav className="hidden md:flex mb-1 items-center justify-center gap-2.5" aria-label="Form progress" style={{marginTop: '-14px'}}>
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

            {/* Desktop Step 1 */}
            {step === 1 && (
              <form id="step1-form" onSubmit={handleStepNext} className="hidden md:block space-y-6" style={{marginTop: '16px'}}>
                <fieldset className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <legend className="sr-only">Contact information</legend>

                  <div>
                    <label htmlFor="agencyName" className="block text-sm font-medium text-gray-700 mb-2">
                      Agency Name <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <input
                      type="text"
                      id="agencyName"
                      name="agencyName"
                      value={formData.agencyName}
                      onChange={handleInputChange}
                      placeholder="Enter your agency name…"
                      required
                      aria-required="true"
                      className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                    />
                  </div>

                  <div>
                    <label htmlFor="contactPerson" className="block text-sm font-medium text-gray-700 mb-2">
                      Contact Person <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <input
                      type="text"
                      id="contactPerson"
                      name="contactPerson"
                      value={formData.contactPerson}
                      onChange={handleInputChange}
                      placeholder="John Smith"
                      required
                      aria-required="true"
                      className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                    />
                  </div>

                  <div>
                    <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-2">
                      Email Address <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <input
                      type="email"
                      id="email"
                      name="email"
                      value={formData.email}
                      onChange={handleInputChange}
                      placeholder="your@email.com"
                      required
                      aria-required="true"
                      className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                    />
                  </div>

                  <div>
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
                      required
                      aria-required="true"
                      className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                    />
                  </div>
                </fieldset>

                <div className="mt-2">
                  <button
                    type="submit"
                    className="w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-600 active:bg-indigo-600 transition-colors shadow-sm hover:shadow-md"
                    aria-label="Continue to step 2"
                  >
                    Next Step →
                  </button>
                </div>
              </form>
            )}

            {/* Desktop Step 2 */}
            {step === 2 && (
              <form id="step2-form" onSubmit={handleSubmit} className="hidden md:block space-y-4" style={{marginTop: '16px'}}>
                <fieldset>
                  <legend className="sr-only">Agency details and services</legend>

                  <div className="mb-4">
                    <label htmlFor="description" className="block text-sm font-medium text-gray-700 mb-2">
                      Short description of your agency <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <textarea
                      id="description"
                      name="description"
                      value={formData.description}
                      onChange={handleInputChange}
                      rows={4}
                      maxLength={500}
                      required
                      aria-required="true"
                      placeholder="This text will appear on your agency card. Clearly describe your services and what makes you different. Do not include URLs."
                      className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all resize-none placeholder:text-sm placeholder:text-gray-400"
                    />
                    <p className="text-xs text-gray-500 mt-1.5 text-right">
                      {formData.description.length}/500
                    </p>
                  </div>

                  <CompactLogoUploadField
                    stateSlug={formData.stateSlug}
                    onUpload={(url) => setFormData(prev => ({ ...prev, logoUrl: url }))}
                    className="mb-4"
                  />

                  <div className="mb-4">
                    <label htmlFor="budgetRange" className="block text-sm font-medium text-gray-700 mb-2">
                      Typical project budget range <span className="text-red-500" aria-label="required">*</span>
                    </label>
                    <select
                      id="budgetRange"
                      name="budgetRange"
                      value={formData.budgetRange}
                      onChange={handleInputChange}
                      required
                      aria-required="true"
                      className="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900"
                    >
                      <option value="">Select a range…</option>
                      {budgetOptions.map(option => (
                        <option key={option} value={option}>{option}</option>
                      ))}
                    </select>
                  </div>

                  <div>
                    <span className="block text-sm font-medium text-gray-700 mb-3" id="services-label">
                      Main services offered <span className="text-red-500" aria-label="required">*</span>
                    </span>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3" role="group" aria-labelledby="services-label">
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
                </fieldset>

                <div className="mt-2">
                  <button
                    type="submit"
                    disabled={isSubmitting}
                    className="w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-600 active:bg-indigo-600 transition-colors shadow-sm hover:shadow-md disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    {isSubmitting ? 'Submitting...' : 'Apply for Spotlight'}
                  </button>
                </div>
              </form>
            )}

            {/* Mobile Step 1: Contact basics */}
            {mobileStep === 1 && (
              <form onSubmit={handleMobileStep1Next} className="md:hidden space-y-2.5" style={{marginTop: '6px'}}>
                <div>
                  <label htmlFor="agencyName-mobile" className="block text-xs font-medium text-gray-700 mb-0.5">
                    Agency Name <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    id="agencyName-mobile"
                    name="agencyName"
                    value={formData.agencyName}
                    onChange={handleInputChange}
                    placeholder="Enter your agency name…"
                    required
                    className="w-full px-3 py-1.5 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                  />
                </div>

                <div>
                  <label htmlFor="contactPerson-mobile" className="block text-xs font-medium text-gray-700 mb-0.5">
                    Contact Person <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    id="contactPerson-mobile"
                    name="contactPerson"
                    value={formData.contactPerson}
                    onChange={handleInputChange}
                    placeholder="Full name…"
                    required
                    className="w-full px-3 py-1.5 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                  />
                </div>

                <div>
                  <label htmlFor="websiteUrl-mobile" className="block text-xs font-medium text-gray-700 mb-0.5">
                    Website URL <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    id="websiteUrl-mobile"
                    name="websiteUrl"
                    value={formData.websiteUrl}
                    onChange={handleInputChange}
                    placeholder="gappsy.com"
                    required
                    className="w-full px-3 py-1.5 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                  />
                </div>

                <div className="mt-2">
                  <button
                    type="submit"
                    className="w-full bg-indigo-600 text-white py-2.5 text-sm rounded-lg font-semibold hover:bg-indigo-700 transition-colors shadow-sm hover:shadow-md"
                  >
                    Next Step →
                  </button>
                </div>
              </form>
            )}

            {/* Mobile Step 2: Details & pricing */}
            {mobileStep === 2 && (
              <form onSubmit={handleMobileStep2Next} className="md:hidden space-y-2" style={{marginTop: '6px'}}>
                <div>
                  <label htmlFor="email-mobile" className="block text-xs font-medium text-gray-700 mb-0.5">
                    Email Address <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="email"
                    id="email-mobile"
                    name="email"
                    value={formData.email}
                    onChange={handleInputChange}
                    placeholder="you@agency.com"
                    required
                    className="w-full px-3 py-1.5 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                  />
                </div>

                <div>
                  <label htmlFor="description-mobile" className="block text-xs font-medium text-gray-700 mb-0.5">
                    Short description <span className="text-red-500">*</span>
                  </label>
                  <textarea
                    id="description-mobile"
                    name="description"
                    value={formData.description}
                    onChange={handleInputChange}
                    rows={2}
                    maxLength={500}
                    required
                    placeholder="Describe your agency and services…"
                    className="w-full px-3 py-1.5 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all resize-none placeholder:text-sm placeholder:text-gray-400"
                  />
                </div>

                <CompactLogoUploadField
                  stateSlug={formData.stateSlug}
                  onUpload={(url) => setFormData(prev => ({ ...prev, logoUrl: url }))}
                  helperText="Helps your listing look more complete."
                />

                <div>
                  <label htmlFor="budgetRange-mobile" className="block text-xs font-medium text-gray-700 mb-0.5">
                    Budget range <span className="text-red-500">*</span>
                  </label>
                  <select
                    id="budgetRange-mobile"
                    name="budgetRange"
                    value={formData.budgetRange}
                    onChange={handleInputChange}
                    required
                    className="w-full px-3 py-1.5 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900"
                  >
                    <option value="">Select a range…</option>
                    {budgetOptions.map(option => (
                      <option key={option} value={option}>{option}</option>
                    ))}
                  </select>
                </div>

                <div className="mt-2">
                  <button
                    type="submit"
                    className="w-full bg-indigo-600 text-white py-2.5 text-sm rounded-lg font-semibold hover:bg-indigo-700 transition-colors shadow-sm hover:shadow-md"
                  >
                    Next Step →
                  </button>
                </div>
              </form>
            )}

            {/* Mobile Step 3: Services */}
            {mobileStep === 3 && (
              <form onSubmit={handleSubmit} className="md:hidden space-y-3" style={{marginTop: '6px'}}>
                <div>
                  <span className="block text-xs font-medium text-gray-700 mb-2">Services offered</span>
                  <div className="grid grid-cols-2 gap-x-3 gap-y-1.5">
                    {serviceOptions.map(service => (
                      <label key={service} className="flex items-center gap-2 cursor-pointer">
                        <input
                          type="checkbox"
                          checked={formData.services.includes(service)}
                          onChange={() => handleMultiSelectChange(service)}
                          className="w-4 h-4 text-indigo-600 border-gray-300 rounded focus:ring-2 focus:ring-indigo-600 flex-shrink-0"
                        />
                        <span className="text-xs text-gray-700">{service}</span>
                      </label>
                    ))}
                  </div>
                </div>

                <div className="pt-1">
                  <button
                    type="submit"
                    disabled={isSubmitting}
                    className="w-full bg-indigo-600 text-white py-2.5 text-sm rounded-lg font-semibold hover:bg-indigo-700 active:bg-indigo-700 transition-colors shadow-sm hover:shadow-md disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    {isSubmitting ? 'Submitting...' : 'Apply for Spotlight'}
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

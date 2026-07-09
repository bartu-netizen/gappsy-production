import { X, Briefcase, DollarSign, Clock, Mail, User, Search, Target, TrendingUp, Users, Award, CheckCircle } from 'lucide-react';
import { useState, useEffect } from 'react';
import RecommendationCard from './components/RecommendationCard';
import AutoRedirect from './components/AutoRedirect';
import { recommendedAgency } from './config/recommendedAgency';
import { useScrollLock } from './hooks/useScrollLock';
import { trackFunnelEvent } from './utils/funnelTracking';
import { submitForm, getUtmParams } from './lib/forms/submit';

interface GetMatchedModalProps {
  isOpen: boolean;
  onClose: () => void;
  stateName: string;
  stateSlug?: string;
  isNJ?: boolean;
  onOwnerSwitchClick?: () => void;
}

type MatchStep = 'form' | 'animating' | 'result';

interface AnimationStep {
  icon: JSX.Element;
  text: string;
  duration: number;
}

export default function GetMatchedModal({ isOpen, onClose, stateName, stateSlug = '', isNJ = true, onOwnerSwitchClick }: GetMatchedModalProps) {
  const [step, setStep] = useState<MatchStep>('form');
  const [animationStep, setAnimationStep] = useState(0);
  const [animationSteps, setAnimationSteps] = useState<AnimationStep[]>([]);
  const [cancelRedirect, setCancelRedirect] = useState(false);
  const [mobileFormStep, setMobileFormStep] = useState(1);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const [formData, setFormData] = useState({
    service: '',
    budget: '',
    timeline: '',
    email: '',
    name: ''
  });

  useScrollLock(isOpen);

  useEffect(() => {
    if (isOpen) {
      setStep('form');
      setAnimationStep(0);
      setCancelRedirect(false);
      setMobileFormStep(1);
      setIsSubmitting(false);
      setFormData({ service: '', budget: '', timeline: '', email: '', name: '' });
    }
  }, [isOpen]);

  useEffect(() => {
    if (step === 'result') {
      const modalElement = document.querySelector('.fixed.inset-0');
      if (modalElement) {
        modalElement.scrollTop = 0;
      }
    }
  }, [step]);

  useEffect(() => {
    if (step === 'animating') {
      const serviceLabel = formData.service || 'your project';
      const budgetLabel = formData.budget || 'your budget';
      const timelineLabel = formData.timeline || 'your timeline';

      const firstMessage = formData.name
        ? `Reviewing your request, ${formData.name}...`
        : formData.service && stateName
          ? `Reviewing agencies in ${stateName} for ${serviceLabel}...`
          : `Reviewing top agencies in ${stateName}...`;

      const steps: AnimationStep[] = [
        {
          icon: <Search className="w-6 h-6" />,
          text: firstMessage,
          duration: 1700
        },
        {
          icon: <DollarSign className="w-6 h-6" />,
          text: formData.budget
            ? `Filtering agencies that fit your budget of ${budgetLabel}...`
            : `Filtering agencies based on your budget...`,
          duration: 1700
        },
        {
          icon: <Clock className="w-6 h-6" />,
          text: formData.timeline
            ? `Checking availability for your ${timelineLabel} timeline...`
            : `Checking availability for your timeline...`,
          duration: 1700
        },
        {
          icon: <Users className="w-6 h-6" />,
          text: `Evaluating experience and client reviews...`,
          duration: 1700
        },
        {
          icon: <Award className="w-6 h-6" />,
          text: `Comparing top candidates...`,
          duration: 1700
        },
        {
          icon: <CheckCircle className="w-6 h-6" />,
          text: formData.name
            ? `Almost done, ${formData.name} — finding your best match...`
            : `Almost done — finding your best-fit ${stateName} agency...`,
          duration: 1500
        }
      ];

      setAnimationSteps(steps);
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
  }, [step, formData.service, formData.budget, formData.timeline, formData.name, stateName]);

  const handleMobileStep1Submit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.service || !formData.budget || !formData.timeline) {
      return;
    }
    setMobileFormStep(2);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.service || !formData.budget || !formData.timeline || !formData.email) {
      return;
    }

    if (isSubmitting) {
      return;
    }

    setIsSubmitting(true);

    try {
      const result = await submitForm({
        form_type: 'get_matched',
        state_slug: stateSlug || undefined,
        contact: { name: formData.name, email: formData.email },
        payload: {
          first_name: formData.name,
          email: formData.email,
          service: formData.service,
          budget: formData.budget,
          timeline: formData.timeline,
          state_name: stateName,
        },
        utm: getUtmParams(),
      });

      if (result.ok) {
        console.log('Lead captured via submit-and-notify:', result.row_id);
        trackFunnelEvent({
          funnelType: 'matched',
          stateSlug: stateSlug || undefined,
          leadEmail: formData.email,
          leadName: formData.name || undefined,
          eventName: 'form_submit',
          submissionType: 'matched_leads',
          submissionId: result.row_id ?? undefined,
          metadata: { service: formData.service, budget: formData.budget, timeline: formData.timeline },
        });
      } else {
        console.error('[get_matched] submit-and-notify failed:', result.error);
        trackFunnelEvent({
          funnelType: 'matched',
          stateSlug: stateSlug || undefined,
          leadEmail: formData.email,
          leadName: formData.name || undefined,
          eventName: 'form_submit',
          eventStage: 'offer',
          metadata: { service: formData.service, budget: formData.budget, timeline: formData.timeline, error: 'submit_failed' },
        });
      }
    } catch (err) {
      console.error('[get_matched] submit-and-notify network error:', err);
      trackFunnelEvent({
        funnelType: 'matched',
        stateSlug: stateSlug || undefined,
        leadEmail: formData.email,
        leadName: formData.name || undefined,
        eventName: 'form_submit',
        eventStage: 'offer',
        metadata: { service: formData.service, budget: formData.budget, timeline: formData.timeline, error: 'network_error' },
      });
    }

    setStep('animating');
  };

  const handleVisitWebsite = () => {
    setCancelRedirect(true);
    const newWindow = window.open(recommendedAgency.website, '_blank');
    if (!newWindow || newWindow.closed || typeof newWindow.closed === 'undefined') {
      // Popup was blocked, AutoRedirect component will handle the message
    }
  };

  const handleCancelRedirect = () => {
    setCancelRedirect(true);
  };

  const handleOwnerSwitch = () => {
    if (onOwnerSwitchClick) {
      onClose();
      setTimeout(() => {
        onOwnerSwitchClick();
      }, 180);
    }
  };

  if (!isOpen) return null;

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === e.currentTarget) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-start md:items-start justify-center bg-black/40 backdrop-blur-sm overflow-y-auto py-4 md:py-16" style={{ paddingTop: step === 'result' ? '60px' : undefined, paddingBottom: step === 'result' ? '60px' : undefined }} onClick={handleBackdropClick}>
      <div className="relative w-full max-w-[640px] mx-4 bg-white rounded-2xl shadow-[0_8px_24px_rgba(0,0,0,0.06)] my-auto" style={{ maxHeight: step === 'result' ? 'calc(100vh - 120px)' : undefined }}>
        <button
          onClick={onClose}
          className="absolute right-4 top-4 text-gray-400 hover:text-gray-600 transition-colors z-10"
          aria-label="Close"
        >
          <X className="w-5 h-5" />
        </button>

        {step === 'form' && (
          <div className="p-6 md:p-8">
            <div className="inline-block bg-gradient-to-r from-blue-50 to-blue-100 text-indigo-600 font-semibold px-3 py-1.5 rounded-full mb-2 md:mb-3 uppercase tracking-wider md:text-[10px] text-[9px]">
              <span className="md:inline hidden">🤝 Match with a Top {stateName} Marketing Agency</span>
              <span className="md:hidden">🤝 Get Matched</span>
            </div>

            {isNJ && onOwnerSwitchClick && (
              <div className="mb-3 md:mb-4">
                <button
                  type="button"
                  onClick={handleOwnerSwitch}
                  className="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-gray-700 bg-gray-100 hover:bg-gray-200 transition-colors rounded-lg border border-gray-300 hover:border-gray-400"
                >
                  Agency owner? Find your listing →
                </button>
              </div>
            )}

            <h2 className="text-2xl font-bold text-gray-900 mb-1 md:mb-2">
              Tell Us About Your Project
            </h2>
            <p className="text-gray-600 text-sm leading-relaxed mb-4 md:mb-8 max-w-[520px]">
              We'll match you with the best {stateName} agency for your project.
            </p>

            {/* Mobile stepper */}
            <nav className="md:hidden mb-4 flex items-center justify-center gap-2" aria-label="Form progress">
              <div
                className={`flex items-center justify-center w-7 h-7 rounded-full text-xs font-semibold ${mobileFormStep === 1 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}
                aria-label={`Step 1${mobileFormStep === 1 ? ' - Current step' : ' - Completed'}`}
              >
                1
              </div>
              <div className="w-8 h-0.5 bg-gray-200"></div>
              <div
                className={`flex items-center justify-center w-7 h-7 rounded-full text-xs font-semibold ${mobileFormStep === 2 ? 'bg-indigo-600 text-white' : 'bg-gray-200 text-gray-600'}`}
                aria-label={`Step 2${mobileFormStep === 2 ? ' - Current step' : ''}`}
              >
                2
              </div>
            </nav>

            {/* Desktop: Single form */}
            <form onSubmit={handleSubmit} className="hidden md:block space-y-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  What do you need help with? <span className="text-red-500">*</span>
                </label>
                <div className="relative">
                  <span className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                    <Briefcase className="w-4 h-4" />
                  </span>
                  <select
                    required
                    value={formData.service}
                    onChange={(e) => setFormData({ ...formData, service: e.target.value })}
                    className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 appearance-none [-webkit-appearance:none]"
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

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Estimated budget <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <span className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                      <DollarSign className="w-4 h-4" />
                    </span>
                    <select
                      required
                      value={formData.budget}
                      onChange={(e) => setFormData({ ...formData, budget: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 appearance-none [-webkit-appearance:none]"
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
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Timeline <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <span className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                      <Clock className="w-4 h-4" />
                    </span>
                    <select
                      required
                      value={formData.timeline}
                      onChange={(e) => setFormData({ ...formData, timeline: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 appearance-none [-webkit-appearance:none]"
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

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Email address <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <Mail className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <input
                      type="email"
                      required
                      value={formData.email}
                      onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                      placeholder="your@email.com"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Your name (optional)
                  </label>
                  <div className="relative">
                    <User className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <input
                      type="text"
                      value={formData.name}
                      onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                      placeholder="John Smith"
                    />
                  </div>
                </div>
              </div>

              <div className="mt-4">
                <button
                  type="submit"
                  disabled={isSubmitting}
                  className="w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors shadow-sm hover:shadow-md disabled:opacity-60 disabled:cursor-not-allowed"
                >
                  {isSubmitting ? 'Submitting...' : 'Get My Match →'}
                </button>
              </div>
            </form>

            {/* Mobile: Step 1 */}
            {mobileFormStep === 1 && (
              <form onSubmit={handleMobileStep1Submit} className="md:hidden space-y-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5 md:mb-2">
                    What do you need help with? <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <span className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                      <Briefcase className="w-4 h-4" />
                    </span>
                    <select
                      required
                      value={formData.service}
                      onChange={(e) => setFormData({ ...formData, service: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 appearance-none [-webkit-appearance:none]"
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
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Estimated budget <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <span className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                      <DollarSign className="w-4 h-4" />
                    </span>
                    <select
                      required
                      value={formData.budget}
                      onChange={(e) => setFormData({ ...formData, budget: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 appearance-none [-webkit-appearance:none]"
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
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Timeline <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <span className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                      <Clock className="w-4 h-4" />
                    </span>
                    <select
                      required
                      value={formData.timeline}
                      onChange={(e) => setFormData({ ...formData, timeline: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all bg-white text-gray-900 appearance-none [-webkit-appearance:none]"
                    >
                      <option value="">Select timeline...</option>
                      <option value="ASAP">ASAP</option>
                      <option value="Within 30 days">Within 30 days</option>
                      <option value="30–90 days">30–90 days</option>
                      <option value="Not sure">Not sure</option>
                    </select>
                  </div>
                </div>

                <div className="mt-3">
                  <button
                    type="submit"
                    className="w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors shadow-sm hover:shadow-md"
                  >
                    Next Step →
                  </button>
                </div>
              </form>
            )}

            {/* Mobile: Step 2 */}
            {mobileFormStep === 2 && (
              <form onSubmit={handleSubmit} className="md:hidden space-y-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5 md:mb-2">
                    Email address <span className="text-red-500">*</span>
                  </label>
                  <div className="relative">
                    <Mail className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <input
                      type="email"
                      required
                      value={formData.email}
                      onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                      placeholder="your@email.com"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Your name (optional)
                  </label>
                  <div className="relative">
                    <User className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <input
                      type="text"
                      value={formData.name}
                      onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                      className="w-full pl-10 pr-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent transition-all"
                      placeholder="John Smith"
                    />
                  </div>
                </div>

                <div className="mt-3">
                  <button
                    type="submit"
                    disabled={isSubmitting}
                    className="w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors shadow-sm hover:shadow-md disabled:opacity-60 disabled:cursor-not-allowed"
                  >
                    {isSubmitting ? 'Submitting...' : 'Get Matched'}
                  </button>
                </div>
              </form>
            )}
          </div>
        )}

        {step === 'animating' && (
          <div className="p-8 min-h-[450px] flex flex-col items-center justify-center">
            <div className="w-20 h-20 mb-8 relative">
              <div className="absolute inset-0 border-4 border-blue-100 rounded-full"></div>
              <div className="absolute inset-0 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin"></div>
            </div>

            {animationSteps.length > 0 && animationSteps[animationStep] && (
              <div className="text-center transition-all duration-500 ease-in-out">
                <div className="flex items-center justify-center gap-3 mb-3 text-indigo-600">
                  {animationSteps[animationStep].icon}
                </div>
                <p className="text-gray-800 text-lg font-medium max-w-md leading-relaxed">
                  {animationSteps[animationStep].text}
                </p>
              </div>
            )}
          </div>
        )}

        {step === 'result' && (
          <div className="p-6 md:p-8">
            <div className="text-center mb-3 max-w-full sm:max-w-[600px] mx-auto">
              <h2 className="text-base md:text-xl font-semibold text-slate-900 leading-relaxed">
                This {stateName} Agency is the best match for your project.
              </h2>
            </div>

            <RecommendationCard
              agency={recommendedAgency}
              stateName={stateName}
              onVisit={handleVisitWebsite}
              showBadge={false}
            />

            <AutoRedirect
              targetUrl={recommendedAgency.website}
              agencyName={recommendedAgency.name}
              onCancel={handleCancelRedirect}
              cancelled={cancelRedirect}
            />
          </div>
        )}
      </div>
    </div>
  );
}

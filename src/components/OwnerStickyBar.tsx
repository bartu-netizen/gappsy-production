import { createPortal } from 'react-dom';
import { useEffect, useLayoutEffect, useRef, useState } from 'react';
import { useOwnerBanner } from '../contexts/OwnerBannerContext';
import { formatStateName } from '../utils/formatLocation';

export type OwnerPreviewStep = 1 | 2 | 3 | 4 | 5 | 6;

interface OwnerStickyBarProps {
  agencyName: string;
  stateName: string;
  agencyId?: string | null;
  rank?: number;
  section: 'top25' | 'other';
  onExit: () => void;
  onScrollToListing?: () => void;
  onStepChange?: (step: OwnerPreviewStep) => void;
  step: OwnerPreviewStep;
  notFound?: boolean;
  loading?: boolean;
  wrongState?: boolean;
  correctStateSlug?: string;
  debug?: boolean;
  countdownSeconds?: number | null;
  step4Seconds?: number;
  step4CtaVisible?: boolean;
  onStep4Activate?: () => void;
}

export const OWNER_BAR_HEIGHT_MOBILE = '120px';
export const OWNER_BAR_HEIGHT_DESKTOP = '96px';

// Progress UI removed for owner preview flow.

export default function OwnerStickyBar({
  agencyName,
  section,
  onExit,
  onScrollToListing,
  onStepChange,
  step,
  notFound,
  loading,
  wrongState,
  correctStateSlug,
  debug,
  countdownSeconds,
  step4Seconds,
  step4CtaVisible,
  onStep4Activate,
}: OwnerStickyBarProps) {
  const bannerRef = useRef<HTMLDivElement | null>(null);
  const [justChanged, setJustChanged] = useState(false);
  const prevStepRef = useRef<OwnerPreviewStep>(step);
  const justChangedTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const { registerBanner, remeasure } = useOwnerBanner();

  useLayoutEffect(() => {
    const el = bannerRef.current;
    registerBanner(el);
    return () => registerBanner(null);
  }, [registerBanner]);

  useLayoutEffect(() => {
    remeasure();
  });

  useEffect(() => {
    if (prevStepRef.current !== step) {
      prevStepRef.current = step;
      setJustChanged(true);
      if (justChangedTimerRef.current) clearTimeout(justChangedTimerRef.current);
      justChangedTimerRef.current = setTimeout(() => {
        setJustChanged(false);
      }, 800);
    }
    return () => {
      if (justChangedTimerRef.current) clearTimeout(justChangedTimerRef.current);
    };
  }, [step]);

  const handleExit = () => {
    document.documentElement.style.scrollPaddingTop = '0';
    onExit();
  };

  const handleGoToState = () => {
    if (correctStateSlug) {
      const hash = window.location.hash;
      window.location.href = `/marketing-agencies-in-${correctStateSlug}-united-states/${hash}`;
    }
  };

  const handleScrollToListing = () => {
    onScrollToListing?.();
    // Step advancement to 2 is deferred to the parent after scroll completes.
    // Do NOT call onStepChange(2) here — parent controls when card is confirmed visible.
  };

  const displayName = agencyName || 'your agency';

  type StepContent = {
    title: string;
    subtitle: string;
    button: React.ReactNode;
  };

  const getStepContent = (): StepContent => {
    // Error states need specific messaging
    if (loading) {
      return {
        title: 'Finding your listing…',
        subtitle: 'Just a moment while we locate your agency on this page.',
        button: null,
      };
    }
    if (wrongState) {
      return {
        title: 'Your listing is in a different state.',
        subtitle: correctStateSlug ? `Your agency is listed in ${formatStateName(correctStateSlug)}.` : '',
        button: (
          <button
            onClick={handleGoToState}
            className="bg-[#151f34] text-white hover:opacity-90 active:scale-[0.99] rounded-full px-5 py-2 text-sm font-semibold transition-all duration-200 focus:outline-none"
          >
            Go to my state page
          </button>
        ),
      };
    }
    if (notFound) {
      return {
        title: "We couldn't find your listing on this page.",
        subtitle: 'If you believe this is an error, please contact support.',
        button: null,
      };
    }

    // STATIC HEADLINE across all funnel steps
    const staticTitle = "This is how clients interact with your listing";

    // Step 1: Show scroll button
    if (step === 1) {
      return {
        title: staticTitle,
        subtitle: "",
        button: (
          <button
            onClick={handleScrollToListing}
            className="bg-[#151f34] text-white hover:opacity-90 active:scale-[0.99] rounded-full px-5 py-2 text-sm font-semibold transition-all duration-200 shadow-md focus:outline-none"
          >
            Scroll to my listing
          </button>
        ),
      };
    }

    // Step 2: Story-driven header, auto-advance handled by parent (no instruction or countdown UI)
    if (step === 2) {
      return {
        title: "Clients are trying to check your availability",
        subtitle: "Here's what happens when they do",
        button: null,
      };
    }

    // Step 3: Form preview
    if (step === 3) {
      return {
        title: "Clients fill in this form to contact your agency",
        subtitle: "After they submit it, they\u2019re taken to the next page",
        button: null,
      };
    }

    // Step 4: Loss-driven header with CTA button
    if (step === 4) {
      let ctaText = "Stop losing clients \u2014 activate your listing \u2192";

      const ownerActionStack = (
        <div className="flex flex-col items-center gap-1">
          <button
            onClick={onStep4Activate}
            className="bg-[#151f34] text-white px-4 py-2 sm:px-6 sm:py-2.5 rounded-full font-semibold hover:bg-[#1e2d4a] transition-colors shadow-sm text-center whitespace-nowrap overflow-hidden"
            style={{
              fontSize: 'clamp(0.8rem, 3vw, 0.875rem)',
              lineHeight: 1,
              touchAction: 'manipulation',
              WebkitTapHighlightColor: 'transparent',
              cursor: 'pointer',
              position: 'relative',
              zIndex: 50,
              pointerEvents: 'auto',
            }}
          >
            {ctaText}
          </button>
          <Step4AutoContinue onTrigger={onStep4Activate} />
        </div>
      );
      return {
        title: "All client requests are being sent to other agencies",
        subtitle: "Because your listing isn\u2019t active yet",
        button: ownerActionStack,
      };
    }

    // Step 5: Missed clients stats — loss-focused headline
    if (step === 5) {
      return {
        title: "You missed these clients",
        subtitle: "",
        button: null,
      };
    }

    // Step 6: Activation
    if (step === 6) {
      return {
        title: staticTitle,
        subtitle: "",
        button: null,
      };
    }

    // Fallback
    return {
      title: staticTitle,
      subtitle: "",
      button: null,
    };
  };

  const content = getStepContent();

  const pill = (
    <span className={`inline-flex items-center rounded-full bg-[#151f34] border border-[#151f34] px-3 py-1 text-xs font-medium text-white owner-bar-pill${justChanged ? ' owner-bar-pill-pop' : ''}`}>
      Agency Owner Preview
    </span>
  );

  const stepKey = `${step}-${loading}-${wrongState}-${notFound}`;

  return createPortal(
    <>
      <style>{`
        @keyframes ownerBarSlideDown {
          from { transform: translateY(-100%); opacity: 0; }
          to   { transform: translateY(0);     opacity: 1; }
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
        @keyframes ownerBarGlow {
          0%   { box-shadow: 0 10px 30px rgba(0,0,0,0.18), 0 0 0 0 rgba(52,211,153,0), 0 0 0 0 rgba(52,211,153,0); }
          25%  { box-shadow: 0 10px 30px rgba(0,0,0,0.18), 0 0 18px 4px rgba(52,211,153,0.45), 0 0 0 3px rgba(52,211,153,0.25); }
          100% { box-shadow: 0 10px 30px rgba(0,0,0,0.18), 0 0 0 0 rgba(52,211,153,0), 0 0 0 0 rgba(52,211,153,0); }
        }
        @keyframes ownerBarFillGrow {
          from { transform: scaleX(0); }
          to   { transform: scaleX(1); }
        }

        .owner-sticky-bar-portal {
          animation: ownerBarSlideDown 0.4s ease-out;
        }
        .owner-sticky-bar-portal.owner-step-change {
          animation: ownerBarGlow 0.8s ease-out forwards;
        }
        .owner-bar-step-content {
          animation: ownerBarFadeStep 0.25s ease-out;
        }
        .owner-bar-step-content h2.owner-title-pop {
          animation: ownerBarTitlePop 0.45s cubic-bezier(0.34,1.56,0.64,1) forwards;
        }
        .owner-bar-pill-pop {
          animation: ownerBarPillPop 0.45s cubic-bezier(0.34,1.56,0.64,1) forwards;
        }
        .owner-bar-fill {
          transform-origin: left center;
          animation: ownerBarFillGrow 0.6s cubic-bezier(0.34,1.1,0.64,1) forwards;
        }

        .owner-sticky-title {
          font-size: 24px;
          line-height: 1.2;
          font-weight: 700;
          margin: 0 0 6px 0;
        }
        .owner-sticky-subtitle {
          font-size: 18px;
          line-height: 1.35;
          font-weight: 500;
          margin: 0;
        }
        .owner-sticky-cta-gap {
          margin-top: 12px;
        }
        @media (max-width: 767px) {
          .owner-sticky-title {
            font-size: 20px;
            line-height: 1.2;
            margin: 0 0 4px 0;
          }
          .owner-sticky-subtitle {
            font-size: 16px;
            line-height: 1.35;
          }
          .owner-sticky-cta-gap {
            margin-top: 10px;
          }
        }

        .owner-bar-text-wrap {
          max-width: 680px;
          overflow-wrap: break-word;
          word-break: normal;
          text-wrap: balance;
        }
        .owner-bar-subtitle-wrap {
          max-width: 600px;
          overflow-wrap: break-word;
          word-break: normal;
          text-wrap: balance;
        }
        @media (max-width: 1023px) {
          .owner-bar-text-wrap {
            max-width: 520px;
          }
          .owner-bar-subtitle-wrap {
            max-width: 460px;
          }
        }
        @media (max-width: 767px) {
          .owner-bar-text-wrap {
            max-width: 340px;
          }
          .owner-bar-subtitle-wrap {
            max-width: 320px;
          }
        }

        @keyframes ownerCountdownPulse {
          0%, 100% { opacity: 0.65; transform: translateY(0); }
          50% { opacity: 1; transform: translateY(2px); }
        }
        .owner-countdown-arrow {
          animation: ownerCountdownPulse 1.2s ease-in-out infinite;
        }

        @media (prefers-reduced-motion: reduce) {
          .owner-sticky-bar-portal { animation: none !important; }
          .owner-sticky-bar-portal.owner-step-change {
            box-shadow: 0 10px 30px rgba(0,0,0,0.18), 0 0 0 2px rgba(52,211,153,0.4);
            animation: none !important;
          }
          .owner-bar-step-content { animation: none; }
          .owner-bar-step-content h2.owner-title-pop { animation: none; }
          .owner-bar-pill-pop { animation: none; }
          .owner-bar-fill { animation: none; }
          .owner-countdown-arrow { animation: none; }
        }
      `}</style>

      <div
        id="owner-preview-banner"
        ref={bannerRef}
        className={`owner-sticky-bar-portal fixed top-0 left-0 right-0 w-screen bg-[#34d399] border-b border-black/10 shadow-[0_10px_30px_rgba(0,0,0,0.18)]${justChanged ? ' owner-step-change' : ''}`}
        style={{ zIndex: 99999 } as React.CSSProperties}
      >
        {/* Desktop */}
        <div className={`hidden md:flex items-center justify-center px-6 ${step === 5 ? 'py-2' : 'py-3'}`}>
          <div className="w-full max-w-5xl flex flex-col items-center text-center relative">
            <div className="mb-2">{pill}</div>
            <div key={stepKey} className="owner-bar-step-content flex flex-col items-center w-full">
              <h2
                className={`owner-sticky-title owner-bar-text-wrap text-[#151f34] text-center${justChanged ? ' owner-title-pop' : ''}`}
              >
                {content.title}
              </h2>
              {content.subtitle && (
                <p className="owner-sticky-subtitle owner-bar-subtitle-wrap text-[#151f34]/85 text-center">{content.subtitle}</p>
              )}
              {content.button && <div className="owner-sticky-cta-gap">{content.button}</div>}
            </div>
            {debug && (
              <div className="absolute bottom-1 left-0 text-xs text-[#151f34]/40 font-mono">
                step={step} section={section}
              </div>
            )}
          </div>
        </div>

        {/* Mobile */}
        <div className={`md:hidden flex flex-col px-4 relative${step === 5 ? ' py-2' : ' py-2.5'}`}>
          <div className="flex justify-center mb-1.5">{pill}</div>
          <div key={`m-${stepKey}`} className="owner-bar-step-content flex flex-col items-center w-full">
            <h2
              className={`owner-sticky-title owner-bar-text-wrap text-center text-[#151f34]${justChanged ? ' owner-title-pop' : ''}`}
            >
              {content.title}
            </h2>
            {content.subtitle && (
              <p className="owner-sticky-subtitle owner-bar-subtitle-wrap text-center text-[#151f34]/85">{content.subtitle}</p>
            )}
            {content.button && (
              <div className="flex justify-center owner-sticky-cta-gap">{content.button}</div>
            )}
          </div>
        </div>
      </div>
    </>,
    document.body
  );
}

function Step4AutoContinue({ onTrigger }: { onTrigger?: () => void }) {
  const [seconds, setSeconds] = useState(10);
  const firedRef = useRef(false);
  const onTriggerRef = useRef(onTrigger);

  useEffect(() => {
    onTriggerRef.current = onTrigger;
  }, [onTrigger]);

  useEffect(() => {
    const interval = setInterval(() => {
      setSeconds((prev) => {
        if (prev <= 1) {
          clearInterval(interval);
          if (!firedRef.current) {
            firedRef.current = true;
            onTriggerRef.current?.();
          }
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
    return () => clearInterval(interval);
  }, []);

  return (
    <div
      className="text-center text-[#151f34]"
      style={{ opacity: 0.65, marginTop: 6, lineHeight: 1.25, fontSize: 12, fontWeight: 500, fontVariantNumeric: 'tabular-nums' }}
    >
      Continuing in {seconds} second{seconds === 1 ? '' : 's'}…
    </div>
  );
}

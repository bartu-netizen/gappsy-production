import { Link } from 'react-router-dom';
import { X, ShieldCheck } from 'lucide-react';

interface OnboardingShellProps {
  step: number; // 1-5, or 0 to hide the progress dots (success/cancelled/error states)
  onBack?: () => void;
  children: React.ReactNode;
}

const TOTAL_STEPS = 5;

// The "focused checkout shell" — deliberately NOT SoftwareHeader/FooterWrapper.
// Fixed 100dvh, no document-level scroll: header/footer are shrink-0, only
// the middle content region scrolls internally if a step's content doesn't
// fit a short viewport (see the sticky-CTA note in the page component).
export default function OnboardingShell({ step, onBack, children }: OnboardingShellProps) {
  return (
    <div className="h-[100dvh] w-full flex flex-col overflow-hidden bg-white">
      <header className="shrink-0 flex items-center justify-between px-5 sm:px-8 h-16 border-b border-[#f1f3f5]">
        <div className="flex items-center gap-3 min-w-0">
          {onBack ? (
            <button
              type="button"
              onClick={onBack}
              aria-label="Back"
              className="w-8 h-8 shrink-0 rounded-full border border-slate-200 flex items-center justify-center text-slate-500 hover:bg-slate-50 transition-colors"
            >
              <svg viewBox="0 0 24 24" className="w-4 h-4" fill="none" stroke="currentColor" strokeWidth={2}><path d="M15 18l-6-6 6-6" strokeLinecap="round" strokeLinejoin="round" /></svg>
            </button>
          ) : (
            <Link to="/" aria-label="Gappsy home" className="shrink-0 flex items-center">
              <img src="/logos/Gappsy-Logo-4A5DFF-transparent-background.png" alt="Gappsy" className="h-6 w-auto" />
            </Link>
          )}
          {step > 0 && (
            <div className="hidden sm:flex items-center gap-1.5" aria-label={`Step ${step} of ${TOTAL_STEPS}`}>
              {Array.from({ length: TOTAL_STEPS }, (_, i) => i + 1).map((dot) => (
                <span
                  key={dot}
                  className={`h-1.5 rounded-full transition-all ${dot === step ? 'w-5 bg-[#7C3AED]' : dot < step ? 'w-1.5 bg-[#7C3AED]/40' : 'w-1.5 bg-slate-200'}`}
                />
              ))}
            </div>
          )}
        </div>

        <div className="flex items-center gap-3 shrink-0">
          <span className="hidden sm:inline-flex items-center gap-1 text-xs font-medium text-slate-400">
            <ShieldCheck className="w-3.5 h-3.5" aria-hidden="true" />
            Secure checkout
          </span>
          <Link
            to="/feature-my-product"
            aria-label="Close"
            className="w-8 h-8 rounded-full border border-slate-200 flex items-center justify-center text-slate-500 hover:bg-slate-50 transition-colors"
          >
            <X className="w-4 h-4" />
          </Link>
        </div>
      </header>

      <main className="flex-1 min-h-0 overflow-y-auto overscroll-contain flex flex-col">
        {children}
      </main>
    </div>
  );
}

import { useEffect, useRef, useState } from 'react';
import { ArrowRight, Sparkles } from 'lucide-react';
import { logFunnelEvent, FUNNEL_EVENTS } from '../utils/yourAgencyFunnel';

interface OwnerPreviewIntroProps {
  agencyId: string | null;
  agencyName: string;
  agencySlug?: string | null;
  stateSlug?: string | null;
  onReveal: () => void;
}

export default function OwnerPreviewIntro({
  agencyId,
  agencyName,
  agencySlug,
  stateSlug,
  onReveal,
}: OwnerPreviewIntroProps) {
  const viewedRef = useRef(false);
  const startedRef = useRef(false);
  const [fadingOut, setFadingOut] = useState(false);
  const [pressed, setPressed] = useState(false);

  useEffect(() => {
    if (viewedRef.current) return;
    viewedRef.current = true;
    logFunnelEvent({
      ...FUNNEL_EVENTS.OWNER_PREVIEW_INTRO_VIEWED,
      agency_id: agencyId ?? undefined,
      agency_name: agencyName || undefined,
      agency_slug: agencySlug ?? undefined,
      state_slug: stateSlug ?? undefined,
    });
  }, [agencyId, agencyName, agencySlug, stateSlug]);

  useEffect(() => {
    const prevOverflow = document.body.style.overflow;
    document.body.style.overflow = 'hidden';
    return () => {
      document.body.style.overflow = prevOverflow;
    };
  }, []);

  const handleStart = () => {
    if (startedRef.current) return;
    startedRef.current = true;

    logFunnelEvent({
      ...FUNNEL_EVENTS.OWNER_PREVIEW_STARTED,
      agency_id: agencyId ?? undefined,
      agency_name: agencyName || undefined,
      agency_slug: agencySlug ?? undefined,
      state_slug: stateSlug ?? undefined,
    });

    setPressed(true);
    window.setTimeout(() => {
      setPressed(false);
      setFadingOut(true);
    }, 180);
    window.setTimeout(() => {
      onReveal();
    }, 600);
  };

  return (
    <div
      role="dialog"
      aria-label="Agency Owner Preview"
      className={`fixed inset-0 z-[9999] flex items-center justify-center px-6 py-16 sm:py-20 bg-[#34d399] transition-opacity duration-[420ms] ease-out ${
        fadingOut ? 'opacity-0 pointer-events-none' : 'opacity-100'
      }`}
    >
      <div className="relative w-full max-w-3xl text-center text-[#0a3d2e]">
        <div className="inline-flex items-center gap-2 rounded-full bg-[#151f34] px-4 py-1.5 text-[11px] sm:text-xs font-semibold tracking-[0.08em] uppercase text-white mb-14 sm:mb-16">
          <Sparkles className="w-3.5 h-3.5" aria-hidden="true" />
          Agency Owner Preview
        </div>

        <h1 className="text-[26px] sm:text-[32px] md:text-[44px] lg:text-[52px] font-bold leading-[1.1] tracking-tight mb-16 sm:mb-20 max-w-2xl mx-auto">
          See where your listing appears — and what happens when clients contact you
        </h1>

        <button
          type="button"
          onClick={handleStart}
          className={`inline-flex items-center justify-center gap-3 ${pressed ? 'bg-[#0d172a] scale-[0.97]' : 'bg-[#151f34] hover:bg-[#1e2d4a]'} text-white font-bold text-lg sm:text-xl px-12 py-5 rounded-xl transition-all duration-150 ease-out`}
        >
          Show me my listing
          <ArrowRight className="w-5 h-5 sm:w-6 sm:h-6" />
        </button>

        <p className="mt-[18px] text-[15px] sm:text-[16px] font-medium leading-[1.4] text-center text-[#0a3d2e]/85">
          It takes 30 seconds to start receiving these requests
        </p>
      </div>
    </div>
  );
}

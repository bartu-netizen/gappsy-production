import { useEffect, useRef, useState } from 'react';
import { Link } from 'react-router-dom';
import { Sparkles, ArrowLeft, ChevronRight, X } from 'lucide-react';
import type { FeaturedTool } from './FeaturedToolPromo';

interface StickyDesktopToolBarProps {
  promos: FeaturedTool[];
}

// Reveals the rest of a short_description that's too long to fit its slot,
// instead of permanently truncating it with an ellipsis — only animates
// when the text actually overflows (short descriptions just sit still, no
// pointless motion), pauses on hover so it can actually be read, and
// respects prefers-reduced-motion. Mirrors the duplicate-content marquee
// technique already used by MobileAdRails.tsx (home page ad rail).
function OverflowMarqueeText({ text, className }: { text: string; className: string }) {
  const containerRef = useRef<HTMLSpanElement>(null);
  const measureRef = useRef<HTMLSpanElement>(null);
  const [overflowing, setOverflowing] = useState(false);
  const [paused, setPaused] = useState(false);

  useEffect(() => {
    function measure() {
      if (containerRef.current && measureRef.current) {
        setOverflowing(measureRef.current.scrollWidth > containerRef.current.clientWidth + 1);
      }
    }
    measure();
    window.addEventListener('resize', measure);
    return () => window.removeEventListener('resize', measure);
  }, [text]);

  return (
    <span
      ref={containerRef}
      className={`relative block overflow-hidden ${className}`}
      onMouseEnter={() => setPaused(true)}
      onMouseLeave={() => setPaused(false)}
    >
      {/* Hidden single copy purely to measure natural width — never shown. */}
      <span ref={measureRef} className="invisible absolute whitespace-nowrap" aria-hidden="true">
        {text}
      </span>
      {overflowing ? (
        <span
          className={`flex whitespace-nowrap animate-marquee-left motion-reduce:animate-none ${paused ? 'paused' : ''}`}
          style={{ width: 'max-content', animationDuration: '42s' }}
        >
          <span className="pr-10">{text}</span>
          <span className="pr-10" aria-hidden="true">{text}</span>
        </span>
      ) : (
        <span className="block truncate">{text}</span>
      )}
    </span>
  );
}

// Desktop counterpart to StickyMobileToolBar. The sidebar's own featured-ad
// card is lg:sticky and stays in view for the whole read, so this bar isn't
// filling a visibility gap — it's additional exposure, shown on every tool
// page including a featured tool's own: `tools.featured` today is purely an
// editorial flag (no tool has an actual paid feature subscription yet —
// see vendor_feature_subscriptions), so there's no real paying listing
// whose page this should be an ad-free zone for. Dismissible because a
// second permanent bar on top of an already-persistent sidebar would be
// one nag too many if the reader can't close it.
//
// Each promo renders as its own bordered "chip" (not plain inline text next
// to a divider) with a persistent trailing chevron — both are there so the
// row unambiguously reads as clickable at a glance, not just on hover.
export default function StickyDesktopToolBar({ promos }: StickyDesktopToolBarProps) {
  const [dismissed, setDismissed] = useState(false);
  if (dismissed) return null;

  if (promos.length === 0) return null;

  return (
    <div className="hidden lg:block fixed bottom-0 inset-x-0 z-30 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5]">
      <div className="max-w-6xl mx-auto flex items-center gap-3 px-6 py-2.5">
        <span className="inline-flex items-center gap-1 text-[10px] font-semibold uppercase tracking-[0.06em] text-[#2952CC] shrink-0 pr-3 border-r border-slate-200">
          <Sparkles className="w-3 h-3" aria-hidden="true" />
          Featured
        </span>

        <div className="flex items-center flex-1 min-w-0 gap-2">
          {promos.map((promo) => (
            <Link
              key={promo.slug}
              to={`/tools/${promo.slug}`}
              className="group flex items-center gap-2.5 min-w-0 flex-1 rounded-xl border border-slate-100 bg-slate-50/70 px-3 py-1.5 hover:bg-[#EEF1F7] hover:border-[#DEE3EF] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#0A1735]"
            >
              {promo.logo ? (
                <img src={promo.logo} alt="" className="w-8 h-8 rounded-lg object-contain border border-slate-100 shrink-0 bg-white" />
              ) : (
                <div className="w-8 h-8 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-xs shrink-0">{promo.name.charAt(0)}</div>
              )}
              <span className="min-w-0 flex-1">
                <span className="block text-[13px] font-semibold text-[#0B1221] leading-tight truncate group-hover:text-[#0A1735] transition-colors">{promo.name}</span>
                {promo.short_description && (
                  <OverflowMarqueeText text={promo.short_description} className="text-[11.5px] text-slate-500 w-full" />
                )}
              </span>
              <ChevronRight className="w-3.5 h-3.5 text-slate-400 group-hover:text-[#0A1735] transition-colors shrink-0" aria-hidden="true" />
            </Link>
          ))}
        </div>

        <Link
          to="/feature-my-product"
          className="inline-flex items-center gap-1 text-xs font-semibold text-[#2952CC] hover:text-[#1F3FA3] transition-colors shrink-0 mr-2 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#0A1735] rounded-sm"
        >
          <ArrowLeft className="w-3.5 h-3.5" aria-hidden="true" />
          Get featured here?
        </Link>

        <button
          type="button"
          onClick={() => setDismissed(true)}
          aria-label="Dismiss"
          className="w-7 h-7 rounded-full flex items-center justify-center text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors shrink-0 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#0A1735]"
        >
          <X className="w-4 h-4" aria-hidden="true" />
        </button>
      </div>
    </div>
  );
}

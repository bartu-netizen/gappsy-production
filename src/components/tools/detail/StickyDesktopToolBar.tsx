import { useState } from 'react';
import { Link } from 'react-router-dom';
import { ExternalLink, Sparkles, ArrowRight, X } from 'lucide-react';
import type { FeaturedTool } from './FeaturedToolPromo';

interface StickyDesktopToolBarProps {
  toolName: string;
  featured: boolean;
  cta: string | null;
  promos: FeaturedTool[];
}

// Desktop counterpart to StickyMobileToolBar — but a different rationale.
// On desktop the sidebar (and its featured-ad card) is lg:sticky and stays
// in view for the whole read, so this bar isn't filling a visibility gap
// the way the mobile one does; it's purely additional exposure. That's why,
// unlike mobile, it shows on every tool page (including a featured tool's
// own — same "Visit {name}" CTA repeated at the bottom) and why it's
// dismissible: a second permanent bar on top of an already-persistent
// sidebar would be one nag too many if the reader can't close it.
export default function StickyDesktopToolBar({ toolName, featured, cta, promos }: StickyDesktopToolBarProps) {
  const [dismissed, setDismissed] = useState(false);
  if (dismissed) return null;

  if (featured && cta) {
    return (
      <div className="hidden lg:block fixed bottom-0 inset-x-0 z-30 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5]">
        <div className="max-w-6xl mx-auto relative flex items-center justify-center px-6 py-3">
          <a
            href={cta}
            target="_blank"
            rel="noopener noreferrer nofollow"
            className="inline-flex items-center gap-1.5 px-6 py-2.5 rounded-full text-sm font-semibold text-white bg-[#4F46E5] hover:bg-[#4338CA] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 focus-visible:ring-offset-2"
          >
            Visit {toolName}
            <ExternalLink className="w-3.5 h-3.5" aria-hidden="true" />
          </a>
          <button
            type="button"
            onClick={() => setDismissed(true)}
            aria-label="Dismiss"
            className="absolute right-6 top-1/2 -translate-y-1/2 w-7 h-7 rounded-full flex items-center justify-center text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500"
          >
            <X className="w-4 h-4" aria-hidden="true" />
          </button>
        </div>
      </div>
    );
  }

  if (promos.length === 0) return null;

  return (
    <div className="hidden lg:block fixed bottom-0 inset-x-0 z-30 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5]">
      <div className="max-w-6xl mx-auto flex items-center gap-6 px-6 py-2.5">
        <span className="inline-flex items-center gap-1 text-[10px] font-semibold uppercase tracking-[0.06em] text-[#4F46E5] shrink-0">
          <Sparkles className="w-3 h-3" aria-hidden="true" />
          Featured
        </span>

        <div className="flex items-center gap-6 flex-1 min-w-0">
          {promos.map((promo) => (
            <Link
              key={promo.slug}
              to={`/tools/${promo.slug}`}
              className="group flex items-center gap-2.5 min-w-0 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 rounded-lg"
            >
              {promo.logo ? (
                <img src={promo.logo} alt="" className="w-8 h-8 rounded-lg object-contain border border-slate-100 shrink-0 bg-white" />
              ) : (
                <div className="w-8 h-8 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-xs shrink-0">{promo.name.charAt(0)}</div>
              )}
              <span className="min-w-0">
                <span className="block text-[13px] font-semibold text-[#0B1221] leading-tight group-hover:text-indigo-600 transition-colors truncate">{promo.name}</span>
                {promo.short_description && (
                  <span className="block text-[11.5px] text-slate-500 truncate max-w-[220px]">{promo.short_description}</span>
                )}
              </span>
            </Link>
          ))}
        </div>

        <Link
          to="/feature-my-product"
          className="inline-flex items-center gap-1 text-xs font-semibold text-[#4F46E5] hover:text-[#4338CA] transition-colors shrink-0 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 rounded-sm"
        >
          Get featured here?
          <ArrowRight className="w-3.5 h-3.5" aria-hidden="true" />
        </Link>

        <button
          type="button"
          onClick={() => setDismissed(true)}
          aria-label="Dismiss"
          className="w-7 h-7 rounded-full flex items-center justify-center text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors shrink-0 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500"
        >
          <X className="w-4 h-4" aria-hidden="true" />
        </button>
      </div>
    </div>
  );
}

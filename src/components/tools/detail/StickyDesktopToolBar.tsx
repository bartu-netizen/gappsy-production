import { useState } from 'react';
import { Link } from 'react-router-dom';
import { Sparkles, ArrowLeft, X } from 'lucide-react';
import type { FeaturedTool } from './FeaturedToolPromo';

interface StickyDesktopToolBarProps {
  promos: FeaturedTool[];
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
export default function StickyDesktopToolBar({ promos }: StickyDesktopToolBarProps) {
  const [dismissed, setDismissed] = useState(false);
  if (dismissed) return null;

  if (promos.length === 0) return null;

  return (
    <div className="hidden lg:block fixed bottom-0 inset-x-0 z-30 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5]">
      <div className="max-w-6xl mx-auto flex items-center gap-5 px-6 py-2.5">
        <span className="inline-flex items-center gap-1 text-[10px] font-semibold uppercase tracking-[0.06em] text-[#4F46E5] shrink-0 pr-5 border-r border-slate-200">
          <Sparkles className="w-3 h-3" aria-hidden="true" />
          Featured
        </span>

        <div className="flex items-center flex-1 min-w-0 divide-x divide-slate-200">
          {promos.map((promo, i) => (
            <Link
              key={promo.slug}
              to={`/tools/${promo.slug}`}
              className={`group flex items-center gap-2.5 min-w-0 flex-1 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 rounded-lg ${i > 0 ? 'pl-5' : ''} ${i < promos.length - 1 ? 'pr-5' : ''}`}
            >
              {promo.logo ? (
                <img src={promo.logo} alt="" className="w-8 h-8 rounded-lg object-contain border border-slate-100 shrink-0 bg-white" />
              ) : (
                <div className="w-8 h-8 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-xs shrink-0">{promo.name.charAt(0)}</div>
              )}
              <span className="min-w-0">
                <span className="block text-[13px] font-semibold text-[#0B1221] leading-tight group-hover:text-indigo-600 transition-colors truncate">{promo.name}</span>
                {promo.short_description && (
                  <span className="block text-[11.5px] text-slate-500 truncate max-w-[160px] lg:max-w-[220px]">{promo.short_description}</span>
                )}
              </span>
            </Link>
          ))}
        </div>

        <Link
          to="/feature-my-product"
          className="inline-flex items-center gap-1 text-xs font-semibold text-[#4F46E5] hover:text-[#4338CA] transition-colors shrink-0 mr-2 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 rounded-sm"
        >
          <ArrowLeft className="w-3.5 h-3.5" aria-hidden="true" />
          Get featured here?
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

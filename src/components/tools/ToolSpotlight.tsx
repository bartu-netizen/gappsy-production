import { Link } from 'react-router-dom';
import { ShieldCheck, Star, ArrowRight } from 'lucide-react';
import type { ToolCardData } from '../ToolCard';

// The single largest visual moment on a tools page — one hand-picked tool told at
// editorial scale, not another card in a row. Links internally to the tool's own detail
// page (where the affiliate/website CTA and its URL-safety check already live), so this
// component never needs to re-validate an external URL itself.
export default function ToolSpotlight({ tool, eyebrow = 'Spotlight' }: { tool: ToolCardData; eyebrow?: string }) {
  return (
    <Link
      to={`/tools/${tool.slug}`}
      className="group block bg-white border border-[#eef0f3] rounded-[28px] p-7 sm:p-10 transition-all duration-200 hover:shadow-[0_20px_44px_rgba(15,23,42,0.10)]"
    >
      <div className="flex flex-col sm:flex-row sm:items-center gap-7 sm:gap-10">
        <div className="shrink-0">
          {tool.logo ? (
            <img
              src={tool.logo}
              alt={tool.name}
              className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl object-contain border border-slate-100 bg-white"
            />
          ) : (
            <div className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl bg-[#EEF0FE] flex items-center justify-center text-[#8B90D9] font-bold text-2xl">
              {tool.name.charAt(0)}
            </div>
          )}
        </div>

        <div className="flex-1 min-w-0">
          <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-[#4F47E6] mb-2">{eyebrow}</p>

          <div className="flex items-center gap-2 mb-2">
            <h3 className="text-2xl sm:text-[28px] font-bold text-[#0B1221] leading-tight">{tool.name}</h3>
            {tool.verified && <ShieldCheck className="w-5 h-5 text-[#4F47E6] shrink-0" />}
          </div>

          {tool.short_description && (
            <p className="text-slate-600 text-[15px] sm:text-base leading-relaxed max-w-xl mb-4">
              {tool.short_description}
            </p>
          )}

          <div className="flex items-center gap-4 flex-wrap">
            {tool.rating > 0 && (
              <span className="inline-flex items-center gap-1 text-sm text-slate-500">
                <Star className="w-3.5 h-3.5 text-amber-500 fill-amber-500" />
                {tool.rating.toFixed(1)} <span className="text-slate-400">({tool.review_count} reviews)</span>
              </span>
            )}
            {tool.starting_price && (
              <span className="text-sm font-medium text-slate-500">From {tool.starting_price}</span>
            )}
            <span className="inline-flex items-center gap-1 text-sm font-semibold text-[#4F47E6] group-hover:gap-2 transition-all ml-auto sm:ml-0">
              Explore {tool.name}
              <ArrowRight className="w-3.5 h-3.5" />
            </span>
          </div>
        </div>
      </div>
    </Link>
  );
}

import { Link } from 'react-router-dom';
import { ShieldCheck, Star, ArrowUpRight } from 'lucide-react';

export interface ToolCardData {
  slug: string;
  name: string;
  logo: string | null;
  short_description: string | null;
  pricing_model: string | null;
  starting_price: string | null;
  rating: number;
  review_count: number;
  verified: boolean;
  featured: boolean;
  is_open_source?: boolean;
}

export default function ToolCard({ tool }: { tool: ToolCardData }) {
  return (
    <Link
      to={`/tools/${tool.slug}`}
      className="group relative flex flex-col h-full bg-white border border-[#eef0f3] rounded-2xl p-5 transition-all duration-200 hover:-translate-y-1 hover:shadow-[0_12px_28px_rgba(15,23,42,0.10)] hover:border-slate-200"
    >
      <span className="absolute top-3.5 right-3.5 w-6 h-6 rounded-full bg-slate-50 group-hover:bg-indigo-50 flex items-center justify-center transition-colors" aria-hidden="true">
        <ArrowUpRight className="w-3.5 h-3.5 text-slate-400 group-hover:text-indigo-600 transition-colors" />
      </span>
      <div className="flex items-start gap-3 mb-3.5 pr-7">
        {tool.logo ? (
          <img src={tool.logo} alt={tool.name} className="w-11 h-11 rounded-xl object-contain border border-slate-100 bg-white shrink-0" />
        ) : (
          <div className="w-11 h-11 rounded-xl bg-slate-100 flex items-center justify-center text-slate-400 font-semibold shrink-0">
            {tool.name.charAt(0)}
          </div>
        )}
        <div className="flex-1 min-w-0 pt-0.5">
          <div className="flex items-center gap-1.5">
            <h3 className="font-semibold text-[#0B1221] text-[15px] truncate group-hover:text-indigo-600 transition-colors">
              {tool.name}
            </h3>
            {tool.verified && <ShieldCheck className="w-3.5 h-3.5 text-indigo-500 shrink-0" />}
          </div>
          {tool.rating > 0 ? (
            <div className="flex items-center gap-1 text-xs text-slate-500 mt-0.5">
              <Star className="w-3 h-3 text-amber-500 fill-amber-500" />
              {tool.rating.toFixed(1)}
              <span className="text-slate-400">({tool.review_count})</span>
            </div>
          ) : (
            tool.featured && (
              <p className="text-[11px] font-medium text-amber-600 mt-0.5">Featured pick</p>
            )
          )}
        </div>
      </div>

      {tool.short_description && (
        <p className="text-[13.5px] text-slate-500 leading-relaxed line-clamp-2 mb-3.5">{tool.short_description}</p>
      )}

      {(tool.pricing_model || tool.starting_price) && (
        <p className="text-xs text-slate-400 mt-auto pt-3 border-t border-slate-100">
          {tool.pricing_model}
          {tool.pricing_model && tool.starting_price ? ' · ' : ''}
          {tool.starting_price && <span className="text-slate-500 font-medium">From {tool.starting_price}</span>}
        </p>
      )}
    </Link>
  );
}

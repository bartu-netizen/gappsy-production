import { Link } from 'react-router-dom';
import { ShieldCheck, Star } from 'lucide-react';

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
}

export default function ToolCard({ tool }: { tool: ToolCardData }) {
  return (
    <Link
      to={`/tools/${tool.slug}`}
      className="flex flex-col bg-white border border-slate-200 rounded-xl p-5 hover:shadow-md hover:border-slate-300 transition-all"
    >
      <div className="flex items-start gap-3 mb-3">
        {tool.logo ? (
          <img src={tool.logo} alt={tool.name} className="w-10 h-10 rounded-lg object-contain border border-slate-100 bg-white" />
        ) : (
          <div className="w-10 h-10 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold">
            {tool.name.charAt(0)}
          </div>
        )}
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-1.5">
            <h3 className="font-semibold text-slate-900 text-sm truncate">{tool.name}</h3>
            {tool.verified && <ShieldCheck className="w-3.5 h-3.5 text-blue-500 shrink-0" />}
          </div>
          {tool.rating > 0 && (
            <div className="flex items-center gap-1 text-xs text-slate-500 mt-0.5">
              <Star className="w-3 h-3 text-amber-500 fill-amber-500" />
              {tool.rating.toFixed(1)} ({tool.review_count})
            </div>
          )}
        </div>
        {tool.featured && (
          <span className="text-xs font-medium bg-amber-100 text-amber-700 px-1.5 py-0.5 rounded shrink-0">Featured</span>
        )}
      </div>

      {tool.short_description && (
        <p className="text-sm text-slate-600 line-clamp-2 mb-3">{tool.short_description}</p>
      )}

      {(tool.pricing_model || tool.starting_price) && (
        <p className="text-xs text-slate-400 mt-auto">
          {tool.pricing_model}
          {tool.pricing_model && tool.starting_price ? ' · ' : ''}
          {tool.starting_price}
        </p>
      )}
    </Link>
  );
}

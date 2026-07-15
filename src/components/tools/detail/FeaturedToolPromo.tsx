import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Sparkles, ArrowRight } from 'lucide-react';
import { supabase } from '../../../lib/supabase';
import Card from './Card';

interface FeaturedTool {
  slug: string;
  name: string;
  logo: string | null;
  short_description: string | null;
  pricing_model: string | null;
  starting_price: string | null;
}

// The actual fulfillment surface for Feature My Product's "your software
// appears on other tool pages" placement promise. Reads tools.featured —
// today that's a couple of editorially-marked tools (Canva, Figma); as real
// paid subscriptions land (see vendor_feature_subscriptions), those tools
// get featured=true too and start rotating through here automatically, no
// code change needed. Renders nothing if there's no eligible candidate
// (excludes the tool whose own page this is) — same "no placeholder
// clutter" convention as ToolCardRow.
export function useFeaturedToolPromo(excludeSlug: string) {
  const [tool, setTool] = useState<FeaturedTool | null | undefined>(undefined);

  useEffect(() => {
    let cancelled = false;
    supabase
      .from('tools')
      .select('slug, name, logo, short_description, pricing_model, starting_price')
      .eq('featured', true)
      .eq('status', 'published')
      .neq('slug', excludeSlug)
      .limit(5)
      .then(({ data }) => {
        if (cancelled) return;
        if (!data || data.length === 0) { setTool(null); return; }
        setTool(data[Math.floor(Math.random() * data.length)]);
      });
    return () => { cancelled = true; };
  }, [excludeSlug]);

  return tool;
}

function FeaturedBadge() {
  return (
    <span className="inline-flex items-center gap-1 text-[10px] font-semibold uppercase tracking-[0.06em] text-[#4F46E5] bg-indigo-50 px-2 py-0.5 rounded-full">
      <Sparkles className="w-3 h-3" aria-hidden="true" />
      Featured
    </span>
  );
}

export function FeaturedToolSidebarCard({ tool }: { tool: FeaturedTool }) {
  return (
    <Card className="p-5">
      <div className="flex items-center justify-between mb-3">
        <FeaturedBadge />
      </div>
      <Link to={`/tools/${tool.slug}`} className="group flex items-start gap-3">
        {tool.logo ? (
          <img src={tool.logo} alt="" className="w-10 h-10 rounded-xl object-contain border border-slate-100 shrink-0" />
        ) : (
          <div className="w-10 h-10 rounded-xl bg-slate-100 flex items-center justify-center text-slate-400 font-semibold shrink-0">{tool.name.charAt(0)}</div>
        )}
        <div className="min-w-0">
          <p className="font-semibold text-[#0B1221] text-sm group-hover:text-indigo-600 transition-colors">{tool.name}</p>
          {tool.short_description && <p className="text-xs text-slate-500 leading-relaxed line-clamp-2 mt-0.5">{tool.short_description}</p>}
        </div>
      </Link>
      <Link
        to="/feature-my-product"
        className="flex items-center gap-1 text-[11px] font-medium text-slate-400 hover:text-indigo-600 transition-colors mt-3 pt-3 border-t border-slate-100"
      >
        Want your product here?
        <ArrowRight className="w-3 h-3" aria-hidden="true" />
      </Link>
    </Card>
  );
}

export function FeaturedToolInlineCard({ tool }: { tool: FeaturedTool }) {
  return (
    <div className="not-prose rounded-2xl border border-indigo-100 bg-indigo-50/30 p-5 flex flex-col sm:flex-row sm:items-center gap-4">
      <div className="flex items-center gap-3 flex-1 min-w-0">
        {tool.logo ? (
          <img src={tool.logo} alt="" className="w-11 h-11 rounded-xl object-contain border border-slate-100 bg-white shrink-0" />
        ) : (
          <div className="w-11 h-11 rounded-xl bg-white flex items-center justify-center text-slate-400 font-semibold shrink-0 border border-slate-100">{tool.name.charAt(0)}</div>
        )}
        <div className="min-w-0">
          <div className="flex items-center gap-2 mb-0.5">
            <FeaturedBadge />
          </div>
          <p className="font-semibold text-[#0B1221] text-[15px]">{tool.name}</p>
          {tool.short_description && <p className="text-[13px] text-slate-500 leading-relaxed line-clamp-1">{tool.short_description}</p>}
        </div>
      </div>
      <Link
        to={`/tools/${tool.slug}`}
        className="inline-flex items-center justify-center gap-1.5 px-4 py-2 rounded-full text-sm font-semibold text-white bg-[#4F46E5] hover:bg-[#4338CA] transition-colors shrink-0 whitespace-nowrap"
      >
        View listing
        <ArrowRight className="w-3.5 h-3.5" aria-hidden="true" />
      </Link>
    </div>
  );
}

import { Link } from 'react-router-dom';
import { ShieldCheck, Star, ExternalLink } from 'lucide-react';
import type { CompareToolFacts } from '../compare/types';
import { buildOutboundUrl } from '../../utils/outboundLink';
import { trackToolOutboundClick } from '../../lib/trackToolEvent';

function GroupCompareToolCard({ tool, bestFor }: { tool: CompareToolFacts; bestFor?: string }) {
  const cta = tool.affiliateUrl || tool.websiteUrl;
  const isAffiliateCta = Boolean(cta && cta === tool.affiliateUrl);
  const outboundCta = cta ? buildOutboundUrl(cta) : null;

  return (
    <div className="flex-1 min-w-[200px] flex flex-col items-center text-center bg-white border border-[#eef0f3] rounded-2xl p-5">
      <div className="relative mb-3">
        <div
          className="absolute -inset-3 -z-10 rounded-full opacity-60 blur-xl"
          style={{ background: 'radial-gradient(circle, rgba(41,82,204,0.12), transparent 70%)' }}
          aria-hidden="true"
        />
        {tool.logo ? (
          <img src={tool.logo} alt={tool.name} width={64} height={64} className="w-14 h-14 rounded-2xl object-contain border border-slate-100 bg-white shadow-sm" />
        ) : (
          <div className="w-14 h-14 rounded-2xl bg-[#EEF0FE] flex items-center justify-center text-[#8B90D9] font-bold text-xl">{tool.name.charAt(0)}</div>
        )}
      </div>

      <div className="flex items-center gap-1.5 mb-1">
        <Link to={`/tools/${tool.slug}`} className="font-bold text-[#0B1221] hover:text-[#4F47E6] transition-colors">
          {tool.name}
        </Link>
        {tool.verified && <ShieldCheck className="w-3.5 h-3.5 text-[#4F47E6] shrink-0" aria-label="Verified" />}
      </div>

      {tool.rating > 0 && (
        <span className="inline-flex items-center gap-0.5 bg-amber-50 text-amber-700 font-bold text-[11px] px-2 py-0.5 rounded-md tabular-nums mb-2">
          <Star className="w-3 h-3 fill-amber-500 text-amber-500" />
          {tool.rating.toFixed(1)}
        </span>
      )}

      {(tool.pricingModel || tool.startingPrice) && (
        <p className="text-[12px] text-slate-500 mb-3">
          {tool.pricingModel}
          {tool.pricingModel && tool.startingPrice ? ' · ' : ''}
          {tool.startingPrice && <span className="font-medium text-slate-700">From {tool.startingPrice}</span>}
        </p>
      )}

      {bestFor && (
        <p className="text-[11.5px] text-slate-500 leading-relaxed mb-3">
          <span className="font-semibold text-slate-600">Best for: </span>
          {bestFor}
        </p>
      )}

      {/* Fills any leftover height so the CTA lands on the same baseline
          across all cards, regardless of how much text (rating, pricing,
          bestFor length) precedes it in a given card. */}
      <div className="flex-1" />

      {outboundCta && (
        <a
          href={outboundCta}
          target="_blank"
          rel="noopener noreferrer nofollow"
          onClick={() => trackToolOutboundClick(tool.slug, isAffiliateCta ? 'affiliate' : 'visit_website', outboundCta)}
          className="inline-flex items-center justify-center gap-1.5 bg-[#4F47E6] hover:bg-[#4338CA] active:scale-[0.98] text-white px-4 py-2 rounded-xl font-semibold transition-all text-xs w-full shadow-[0_8px_20px_rgba(10,23,53,0.2)]"
        >
          Visit {tool.name}
          <ExternalLink className="w-3 h-3" />
        </a>
      )}
    </div>
  );
}

export default function GroupCompareHero({ title, tools, bestFor }: { title: string; tools: CompareToolFacts[]; bestFor: Record<string, string> }) {
  return (
    <section className="max-w-5xl mx-auto px-4 sm:px-6 pt-4 pb-8 relative overflow-hidden">
      <div
        className="absolute inset-x-0 top-0 h-64 -z-10 opacity-60"
        style={{ background: 'radial-gradient(60% 100% at 50% 0%, rgba(41,82,204,0.08), transparent)' }}
        aria-hidden="true"
      />

      <h1 className="text-2xl sm:text-4xl font-bold text-[#0B1221] tracking-tight text-center mb-8">{title}</h1>

      <div className="flex flex-wrap items-stretch justify-center gap-4">
        {tools.map((tool) => (
          <GroupCompareToolCard key={tool.slug} tool={tool} bestFor={bestFor[tool.slug]} />
        ))}
      </div>
    </section>
  );
}

import { useState } from 'react';
import { Link } from 'react-router-dom';
import { ShieldCheck, Star, ExternalLink, RefreshCw } from 'lucide-react';
import ToolSelectCombobox, { type ToolOption } from './ToolSelectCombobox';
import type { CompareToolFacts } from './types';

function ToolIdentity({
  tool,
  otherSlug,
  bestFor,
  onSwitch,
}: {
  tool: CompareToolFacts;
  otherSlug: string;
  bestFor?: string;
  onSwitch: (next: ToolOption) => void;
}) {
  const [switching, setSwitching] = useState(false);
  const cta = tool.affiliateUrl || tool.websiteUrl;
  const isAffiliateCta = Boolean(cta && cta === tool.affiliateUrl);

  return (
    <div className="flex-1 min-w-0 flex flex-col items-center text-center">
      <div className="relative mb-3">
        <div
          className="absolute -inset-3 -z-10 rounded-full opacity-60 blur-xl"
          style={{ background: 'radial-gradient(circle, rgba(79,70,229,0.16), transparent 70%)' }}
          aria-hidden="true"
        />
        {tool.logo ? (
          <img
            src={tool.logo}
            alt={tool.name}
            width={80}
            height={80}
            className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl object-contain border border-slate-100 bg-white shadow-sm"
          />
        ) : (
          <div className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl bg-indigo-50 flex items-center justify-center text-indigo-400 font-bold text-2xl">
            {tool.name.charAt(0)}
          </div>
        )}
      </div>

      <div className="flex items-center gap-1.5 mb-1">
        <Link to={`/tools/${tool.slug}`} className="font-bold text-[#0B1221] text-lg hover:text-indigo-600 transition-colors">
          {tool.name}
        </Link>
        {tool.verified && <ShieldCheck className="w-4 h-4 text-indigo-500 shrink-0" aria-label="Verified" />}
      </div>

      <div className="flex items-center justify-center gap-2 flex-wrap mb-2.5">
        {tool.primaryCategory && (
          <Link
            to={`/tool-categories/${tool.primaryCategory.slug}`}
            className="inline-flex items-center text-[11px] font-medium bg-indigo-50 text-indigo-700 px-2.5 py-1 rounded-full hover:bg-indigo-100 transition-colors"
          >
            {tool.primaryCategory.name}
          </Link>
        )}
        {tool.rating > 0 && (
          <span className="inline-flex items-center gap-0.5 bg-amber-50 text-amber-700 font-bold text-[12px] px-2 py-0.5 rounded-md tabular-nums">
            <Star className="w-3 h-3 fill-amber-500 text-amber-500" />
            {tool.rating.toFixed(1)}
          </span>
        )}
      </div>

      {(tool.pricingModel || tool.startingPrice) && (
        <p className="text-[13px] text-slate-500 mb-4">
          {tool.pricingModel}
          {tool.pricingModel && tool.startingPrice ? ' · ' : ''}
          {tool.startingPrice && <span className="font-medium text-slate-700">From {tool.startingPrice}</span>}
        </p>
      )}

      {bestFor && (
        <p className="text-[12.5px] text-slate-500 leading-relaxed max-w-[26ch] mb-4">
          <span className="font-semibold text-slate-600">Best for: </span>
          {bestFor}
        </p>
      )}

      <div className="flex flex-col items-center gap-2 w-full sm:w-auto">
        {cta && (
          <a
            href={cta}
            target="_blank"
            rel="noopener noreferrer nofollow"
            className="inline-flex items-center justify-center gap-1.5 bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] hover:from-[#4338CA] hover:to-[#6D28D9] active:scale-[0.98] text-white px-5 py-2.5 rounded-xl font-semibold transition-all text-sm w-full sm:w-auto shadow-[0_8px_20px_rgba(79,70,229,0.25)]"
          >
            Visit {tool.name}
            <ExternalLink className="w-3.5 h-3.5" />
          </a>
        )}
        {isAffiliateCta && <p className="text-[10px] text-slate-400">Affiliate link — we may earn a commission</p>}

        {switching ? (
          <div className="w-full max-w-[240px] mt-1">
            <ToolSelectCombobox
              label={`Compare a different tool instead of ${tool.name}`}
              value={null}
              onChange={(next) => {
                if (next) onSwitch(next);
                setSwitching(false);
              }}
              excludeSlug={[tool.slug, otherSlug]}
              compact
            />
          </div>
        ) : (
          <button
            type="button"
            onClick={() => setSwitching(true)}
            className="inline-flex items-center gap-1.5 text-xs font-medium text-slate-400 hover:text-indigo-600 transition-colors mt-1"
          >
            <RefreshCw className="w-3 h-3" />
            Compare a different tool
          </button>
        )}
      </div>
    </div>
  );
}

export default function CompareHero({
  toolA,
  toolB,
  bestForA,
  bestForB,
  onSwitchToolA,
  onSwitchToolB,
}: {
  toolA: CompareToolFacts;
  toolB: CompareToolFacts;
  bestForA?: string;
  bestForB?: string;
  onSwitchToolA: (next: ToolOption) => void;
  onSwitchToolB: (next: ToolOption) => void;
}) {
  return (
    <section className="max-w-5xl mx-auto px-4 sm:px-6 pt-4 pb-8 relative overflow-hidden">
      <div
        className="absolute inset-x-0 top-0 h-64 -z-10 opacity-60"
        style={{ background: 'radial-gradient(60% 100% at 50% 0%, rgba(79,70,229,0.08), transparent)' }}
        aria-hidden="true"
      />

      <h1 className="text-2xl sm:text-4xl font-bold text-[#0B1221] tracking-tight text-center mb-8">
        {toolA.name} vs {toolB.name}
      </h1>

      <div className="grid grid-cols-1 sm:grid-cols-[1fr_auto_1fr] gap-6 sm:gap-4 items-start">
        <ToolIdentity tool={toolA} otherSlug={toolB.slug} bestFor={bestForA} onSwitch={onSwitchToolA} />
        <div className="hidden sm:flex items-center justify-center h-20 text-slate-300 font-bold text-xs">VS</div>
        <ToolIdentity tool={toolB} otherSlug={toolA.slug} bestFor={bestForB} onSwitch={onSwitchToolB} />
      </div>
    </section>
  );
}

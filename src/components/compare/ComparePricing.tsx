import { Info, ExternalLink } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import Card from '../tools/detail/Card';
import type { PricingPlanItem } from '../tools/detail/types';
import type { CompareToolFacts } from './types';

function PricingColumn({ tool, plans }: { tool: CompareToolFacts; plans: PricingPlanItem[] }) {
  const cta = tool.affiliateUrl || tool.websiteUrl;
  const sorted = [...plans].sort((a, b) => a.sort_order - b.sort_order);

  return (
    <div>
      <div className="flex items-center justify-between mb-3">
        <h3 className="font-semibold text-[#0B1221] text-sm">{tool.name}</h3>
        {(tool.pricingModel || tool.startingPrice) && (
          <p className="text-[12px] text-slate-500">
            {tool.pricingModel}
            {tool.pricingModel && tool.startingPrice ? ' · ' : ''}
            {tool.startingPrice && <span className="font-medium text-slate-700">from {tool.startingPrice}</span>}
          </p>
        )}
      </div>

      {sorted.length > 0 ? (
        <div className="space-y-2.5">
          {sorted.map((plan) => (
            <Card key={plan.id} className="p-4">
              <div className="flex items-baseline justify-between gap-2 mb-1">
                <span className="font-semibold text-[#0B1221] text-[13.5px]">{plan.plan_name || 'Plan'}</span>
                <span className="text-[13.5px] font-bold text-[#0B1221] tabular-nums shrink-0">{plan.price || 'Custom'}</span>
              </div>
              {plan.billing_cycle && <p className="text-[11px] text-slate-400 mb-1.5">{plan.billing_cycle}</p>}
              {plan.description && <p className="text-[12.5px] text-slate-500 leading-relaxed">{plan.description}</p>}
            </Card>
          ))}
        </div>
      ) : (
        <Card className="p-4">
          <p className="text-[12.5px] text-slate-400">No individual plan breakdown documented yet — see the pricing model and starting price above.</p>
        </Card>
      )}

      {cta && (
        <a
          href={cta}
          target="_blank"
          rel="noopener noreferrer nofollow"
          className="mt-3 inline-flex items-center justify-center gap-1.5 w-full px-4 py-2.5 rounded-xl bg-slate-50 hover:bg-slate-100 text-[#0B1221] font-semibold text-[13px] transition-colors"
        >
          See {tool.name} pricing
          <ExternalLink className="w-3.5 h-3.5" />
        </a>
      )}
    </div>
  );
}

export default function ComparePricing({
  toolA,
  toolB,
  plansA,
  plansB,
}: {
  toolA: CompareToolFacts;
  toolB: CompareToolFacts;
  plansA: PricingPlanItem[];
  plansB: PricingPlanItem[];
}) {
  return (
    <section id="pricing" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Pricing" title="Pricing Compared" />
      <p className="flex items-start gap-2 text-[13px] text-slate-500 leading-relaxed mb-5 max-w-2xl">
        <Info className="w-3.5 h-3.5 text-slate-400 shrink-0 mt-0.5" />
        Starting price reflects the lowest paid tier, not the full cost for every team size or usage level — check each tool's own pricing page for exact totals.
      </p>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
        <PricingColumn tool={toolA} plans={plansA} />
        <PricingColumn tool={toolB} plans={plansB} />
      </div>
    </section>
  );
}

import { ExternalLink, Info } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import Card from '../tools/detail/Card';
import type { PricingPlanItem } from '../tools/detail/types';
import type { CompareToolFacts } from '../compare/types';
import { buildOutboundUrl } from '../../utils/outboundLink';
import { trackToolOutboundClick } from '../../lib/trackToolEvent';

// N-tool sibling of ComparePricing.tsx — same per-tool plan-card pattern,
// just grid-cols-3 on desktop instead of 2. Stacks to a single column on
// mobile automatically (grid-cols-1 by default), so no separate mobile
// layout is needed.
function PricingColumn({ tool, plans }: { tool: CompareToolFacts; plans: PricingPlanItem[] }) {
  const cta = tool.affiliateUrl || tool.websiteUrl;
  const outboundCta = cta ? buildOutboundUrl(cta) : null;
  const sorted = [...plans].sort((a, b) => a.sort_order - b.sort_order);

  return (
    <div className="min-w-0">
      <div className="flex flex-wrap items-center justify-between gap-x-2 gap-y-0.5 mb-3">
        <h3 className="font-semibold text-[#0B1221] text-sm min-w-0 break-words">{tool.name}</h3>
        {(tool.pricingModel || tool.startingPrice) && (
          <p className="text-[12px] text-slate-500 min-w-0 break-words">
            {tool.pricingModel}
            {tool.pricingModel && tool.startingPrice ? ' · ' : ''}
            {tool.startingPrice && <span className="font-medium text-slate-700">from {tool.startingPrice}</span>}
          </p>
        )}
      </div>

      {sorted.length > 0 ? (
        <div className="space-y-2.5">
          {sorted.map((plan) => (
            <Card key={plan.id} className="p-4 min-w-0">
              <div className="flex flex-wrap items-baseline justify-between gap-x-2 gap-y-0.5 mb-1">
                <span className="font-semibold text-[#0B1221] text-[13.5px] min-w-0 break-words">{plan.plan_name || 'Plan'}</span>
                <span className="text-[13.5px] font-bold text-[#0B1221] tabular-nums min-w-0 break-words">{plan.price || 'Custom'}</span>
              </div>
              {plan.billing_cycle && <p className="text-[11px] text-slate-400 mb-1.5 break-words">{plan.billing_cycle}</p>}
              {plan.description && <p className="text-[12.5px] text-slate-500 leading-relaxed break-words">{plan.description}</p>}
            </Card>
          ))}
        </div>
      ) : (
        <Card className="p-4">
          <p className="text-[12.5px] text-slate-400">No individual plan breakdown documented yet — see the pricing model and starting price above.</p>
        </Card>
      )}

      {outboundCta && (
        <a
          href={outboundCta}
          target="_blank"
          rel="noopener noreferrer nofollow"
          onClick={() => trackToolOutboundClick(tool.slug, tool.affiliateUrl ? 'affiliate' : 'visit_website', outboundCta)}
          className="mt-3 inline-flex items-center justify-center gap-1.5 w-full px-4 py-2.5 rounded-xl bg-slate-50 hover:bg-slate-100 text-[#0B1221] font-semibold text-[13px] transition-colors"
        >
          See {tool.name} pricing
          <ExternalLink className="w-3.5 h-3.5" />
        </a>
      )}
    </div>
  );
}

export default function GroupComparePricing({ tools, plansByTool }: { tools: CompareToolFacts[]; plansByTool: Record<string, PricingPlanItem[]> }) {
  return (
    <section id="pricing" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Pricing" title="Pricing Compared" />
      <p className="flex items-start gap-2 text-[13px] text-slate-500 leading-relaxed mb-5 max-w-2xl">
        <Info className="w-3.5 h-3.5 text-slate-400 shrink-0 mt-0.5" />
        Starting price reflects the lowest paid tier, not the full cost for every team size or usage level — check each tool's own pricing page for exact totals.
      </p>
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        {tools.map((tool) => (
          <PricingColumn key={tool.slug} tool={tool} plans={plansByTool[tool.slug] || []} />
        ))}
      </div>
    </section>
  );
}

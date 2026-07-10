import { Check, ArrowRight } from 'lucide-react';
import type { PricingPlanItem } from './types';
import ToolsSectionHeader from '../ToolsSectionHeader';
import Card from './Card';

interface PricingSectionProps {
  toolName: string;
  plans: PricingPlanItem[];
  websiteUrl?: string | null;
  affiliateUrl?: string | null;
}

export default function PricingSection({ toolName, plans, websiteUrl, affiliateUrl }: PricingSectionProps) {
  if (plans.length === 0) return null;

  const sorted = [...plans].sort((a, b) => a.sort_order - b.sort_order);
  const recommendedIndex = sorted.length > 1 ? 1 : -1;
  const cta = affiliateUrl || websiteUrl;
  const cheapest = sorted[0]?.price;
  const priciest = sorted[sorted.length - 1]?.price;
  const summary =
    sorted.length > 1 && cheapest && priciest && cheapest !== priciest
      ? `${toolName} offers ${sorted.length} pricing tiers, ranging from ${cheapest} to ${priciest}.`
      : `${toolName} offers ${sorted.length === 1 ? 'a single pricing tier' : `${sorted.length} pricing tiers`}.`;

  return (
    <section id="pricing" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Pricing" title={`${toolName} pricing`} subtitle={summary} />
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 lg:items-start">
        {sorted.map((plan, index) => {
          const isRecommended = index === recommendedIndex;
          return (
            <Card
              key={plan.id}
              highlight={isRecommended}
              hoverLift={!isRecommended}
              className={`p-5 flex flex-col ${isRecommended ? 'lg:scale-105 z-10' : ''}`}
            >
              {isRecommended && (
                <span className="absolute -top-3 left-1/2 -translate-x-1/2 bg-[#4F46E5] text-white text-[10px] font-semibold uppercase tracking-wide px-3 py-1 rounded-full">
                  Most Popular
                </span>
              )}
              <h3 className="font-semibold text-[#0B1221] text-base mb-1">{plan.plan_name || 'Plan'}</h3>
              <div className="mb-1">
                <span className="text-2xl font-bold text-[#0B1221] tabular-nums">{plan.price || 'Custom'}</span>
                {plan.billing_cycle && <span className="text-slate-400 text-sm ml-1">{plan.billing_cycle}</span>}
              </div>
              {plan.description && <p className="text-[13px] text-slate-500 leading-relaxed mb-4">{plan.description}</p>}
              {plan.features.length > 0 && (
                <ul className="space-y-2 pt-3 border-t border-slate-100 mb-4">
                  {plan.features.map((feature) => (
                    <li key={feature} className="flex items-start gap-2 text-[13px] text-slate-600">
                      <Check className="w-3.5 h-3.5 text-indigo-500 shrink-0 mt-0.5" />
                      {feature}
                    </li>
                  ))}
                </ul>
              )}
              {cta && (
                <a
                  href={cta}
                  target="_blank"
                  rel="noopener noreferrer nofollow"
                  className={`mt-auto inline-flex items-center justify-center gap-1.5 px-4 py-2 rounded-full text-[13px] font-semibold transition-all active:scale-[0.98] ${
                    isRecommended
                      ? 'bg-[#4F46E5] hover:bg-[#4338CA] text-white'
                      : 'bg-slate-50 hover:bg-slate-100 text-[#0B1221]'
                  }`}
                >
                  Get started
                  <ArrowRight className="w-3.5 h-3.5" />
                </a>
              )}
            </Card>
          );
        })}
      </div>
    </section>
  );
}

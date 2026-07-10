import { Check } from 'lucide-react';
import type { PricingPlanItem } from './types';
import ToolsSectionHeader from '../ToolsSectionHeader';

export default function PricingSection({ toolName, plans }: { toolName: string; plans: PricingPlanItem[] }) {
  if (plans.length === 0) return null;

  const sorted = [...plans].sort((a, b) => a.sort_order - b.sort_order);
  const recommendedIndex = sorted.length > 1 ? 1 : -1;

  return (
    <section id="pricing" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Pricing" title={`${toolName} pricing`} subtitle="What's included at each tier." />
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {sorted.map((plan, index) => {
          const isRecommended = index === recommendedIndex;
          return (
            <div
              key={plan.id}
              className={`relative bg-white rounded-2xl p-5 flex flex-col transition-all duration-200 ${
                isRecommended ? 'border-2 border-indigo-500 shadow-[0_16px_32px_rgba(79,70,229,0.12)]' : 'border border-[#eef0f3]'
              }`}
            >
              {isRecommended && (
                <span className="absolute -top-3 left-1/2 -translate-x-1/2 bg-[#4F46E5] text-white text-[10px] font-semibold uppercase tracking-wide px-3 py-1 rounded-full">
                  Most Popular
                </span>
              )}
              <h3 className="font-semibold text-[#0B1221] text-base mb-1">{plan.plan_name || 'Plan'}</h3>
              <div className="mb-1">
                <span className="text-2xl font-bold text-[#0B1221]">{plan.price || 'Custom'}</span>
                {plan.billing_cycle && <span className="text-slate-400 text-sm ml-1">{plan.billing_cycle}</span>}
              </div>
              {plan.description && <p className="text-[13px] text-slate-500 leading-relaxed mb-4">{plan.description}</p>}
              {plan.features.length > 0 && (
                <ul className="space-y-2 mt-auto pt-3 border-t border-slate-100">
                  {plan.features.map((feature) => (
                    <li key={feature} className="flex items-start gap-2 text-[13px] text-slate-600">
                      <Check className="w-3.5 h-3.5 text-indigo-500 shrink-0 mt-0.5" />
                      {feature}
                    </li>
                  ))}
                </ul>
              )}
            </div>
          );
        })}
      </div>
    </section>
  );
}

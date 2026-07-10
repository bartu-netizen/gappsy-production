import { CheckCircle2, LayoutGrid } from 'lucide-react';
import type { ToolFeature } from '../../../data/toolContent/types';
import { resolveLucideIcon } from '../../../utils/lucideIconMap';
import ToolsSectionHeader from '../ToolsSectionHeader';

export default function FeatureGrid({ toolName, features }: { toolName: string; features: ToolFeature[] }) {
  if (features.length === 0) return null;

  return (
    <section id="features" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Features" title={`Everything ${toolName} can do`} subtitle={`${features.length} capabilities, organized so you can scan for what matters to you.`} />
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {features.map((feature) => {
          const Icon = resolveLucideIcon(feature.icon) || LayoutGrid;
          return (
            <div
              key={feature.title}
              className="bg-white border border-[#eef0f3] rounded-2xl p-5 transition-all duration-200 hover:shadow-[0_12px_28px_rgba(15,23,42,0.08)] hover:-translate-y-0.5"
            >
              <div className="w-9 h-9 rounded-xl bg-indigo-50 flex items-center justify-center mb-3.5">
                <Icon className="w-[18px] h-[18px] text-indigo-600" />
              </div>
              <h3 className="font-semibold text-[#0B1221] text-[15px] mb-1.5">{feature.title}</h3>
              <p className="text-[13.5px] text-slate-500 leading-relaxed mb-3">{feature.description}</p>
              {feature.benefits.length > 0 && (
                <ul className="space-y-1.5">
                  {feature.benefits.map((benefit) => (
                    <li key={benefit} className="flex items-start gap-1.5 text-[12.5px] text-slate-500">
                      <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 shrink-0 mt-0.5" />
                      {benefit}
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

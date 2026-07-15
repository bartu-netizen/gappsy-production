import { CheckCircle2, LayoutGrid, Sparkles } from 'lucide-react';
import type { ToolFeature } from '../../../data/toolContent/types';
import { resolveLucideIcon } from '../../../utils/lucideIconMap';
import ToolsSectionHeader from '../ToolsSectionHeader';
import Card from './Card';

const ICON_TILE_COLORS = ['bg-blue-50 text-blue-600', 'bg-violet-50 text-violet-600', 'bg-emerald-50 text-emerald-600', 'bg-amber-50 text-amber-700'];

export default function FeatureGrid({ toolName, features }: { toolName: string; features: ToolFeature[] }) {
  if (features.length === 0) return null;

  return (
    <section id="features" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Features" title={`Everything ${toolName} can do`} subtitle={`${features.length} capabilities, organized so you can scan for what matters to you.`} />
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {features.map((feature, index) => {
          const Icon = resolveLucideIcon(feature.icon) || LayoutGrid;
          // The first feature is the same one surfaced as "Standout feature"
          // in the quick-facts strip up top — giving it identical visual
          // weight to "Template library" here undersells it. A wider,
          // tinted card with its own badge makes it read as the headline
          // capability instead of one of N equal tiles.
          if (index === 0) {
            return (
              <Card key={feature.title} className="p-5 sm:col-span-2 lg:col-span-2 bg-gradient-to-br from-blue-50 to-purple-50 border-blue-100">
                <div className="flex items-center gap-2 mb-3.5">
                  <div className="w-9 h-9 rounded-xl flex items-center justify-center bg-white shadow-sm text-blue-600">
                    <Icon className="w-[18px] h-[18px]" />
                  </div>
                  <span className="inline-flex items-center gap-1 text-[10px] font-bold uppercase tracking-[0.06em] text-white bg-gradient-to-br from-[#2952CC] to-[#0A1735] rounded-full px-2.5 py-1">
                    <Sparkles className="w-3 h-3" aria-hidden="true" />
                    Standout
                  </span>
                </div>
                <h3 className="font-semibold text-[#0B1221] text-[16px] mb-1.5">{feature.title}</h3>
                <p className="text-[14px] text-slate-600 leading-relaxed mb-3 max-w-2xl">{feature.description}</p>
                {feature.benefits.length > 0 && (
                  <ul className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-1.5">
                    {feature.benefits.map((benefit) => (
                      <li key={benefit} className="flex items-start gap-1.5 text-[13px] text-slate-600">
                        <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 shrink-0 mt-0.5" />
                        {benefit}
                      </li>
                    ))}
                  </ul>
                )}
              </Card>
            );
          }
          return (
            <Card key={feature.title} hoverLift className="p-5">
              <div className={`w-9 h-9 rounded-xl flex items-center justify-center mb-3.5 ${ICON_TILE_COLORS[index % ICON_TILE_COLORS.length]}`}>
                <Icon className="w-[18px] h-[18px]" />
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
            </Card>
          );
        })}
      </div>
    </section>
  );
}

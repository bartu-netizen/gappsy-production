import { Lightbulb } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import Card from '../tools/detail/Card';
import type { GroupComparisonHighlight } from '../../data/groupComparisonContent/types';

export default function GroupCompareHighlights({ toolNames, highlights }: { toolNames: Record<string, string>; highlights: GroupComparisonHighlight[] }) {
  if (highlights.length === 0) return null;

  return (
    <section id="highlights" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Highlights" title="Standout Differences" subtitle="Where these tools genuinely diverge — never a single universal winner." />
      <div className="space-y-4">
        {highlights.map((h) => (
          <Card key={h.title} hoverLift className="p-5 sm:p-6">
            <div className="flex items-start gap-2.5 mb-2">
              <Lightbulb className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" />
              <h3 className="font-semibold text-[#0B1221] text-[15px]">{h.title}</h3>
            </div>
            <p className="text-[13.5px] text-slate-600 leading-relaxed mb-3">{h.description}</p>
            <div className="flex flex-wrap gap-1.5">
              {h.toolSlugs.map((slug) => (
                <span key={slug} className="text-[11px] font-medium bg-[#EEF0FE] text-[#4338CA] px-2 py-0.5 rounded-full">
                  {toolNames[slug] || slug}
                </span>
              ))}
            </div>
          </Card>
        ))}
      </div>
    </section>
  );
}

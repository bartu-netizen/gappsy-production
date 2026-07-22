import { Lightbulb, Users } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import Card from '../tools/detail/Card';
import type { ComparisonDifference } from '../../data/comparisonContent/types';

export default function CompareKeyDifferences({
  toolAName,
  toolBName,
  differences,
}: {
  toolAName: string;
  toolBName: string;
  differences: ComparisonDifference[];
}) {
  if (differences.length === 0) return null;

  return (
    <section id="differences" className="scroll-mt-24">
      <ToolsSectionHeader
        eyebrow="Differences"
        title="Key Differences"
        subtitle={`Where ${toolAName} and ${toolBName} genuinely diverge — never a single universal winner.`}
      />
      <div className="space-y-4">
        {differences.map((diff) => (
          <Card key={diff.title} hoverLift className="p-5 sm:p-6">
            <h3 className="font-semibold text-[#0B1221] text-[15px] mb-3">{diff.title}</h3>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
              <div className="border-l-2 border-[#C7CCF7] pl-3">
                <p className="text-[11px] font-semibold uppercase tracking-wide text-[#4F47E6] mb-1">{toolAName}</p>
                <p className="text-[13.5px] text-slate-600 leading-relaxed">{diff.toolA}</p>
              </div>
              <div className="border-l-2 border-violet-200 pl-3">
                <p className="text-[11px] font-semibold uppercase tracking-wide text-violet-500 mb-1">{toolBName}</p>
                <p className="text-[13.5px] text-slate-600 leading-relaxed">{diff.toolB}</p>
              </div>
            </div>
            <div className="pt-3 border-t border-slate-100 space-y-1.5">
              <p className="flex items-start gap-2 text-[13px] text-slate-500 leading-relaxed">
                <Lightbulb className="w-3.5 h-3.5 text-amber-500 shrink-0 mt-0.5" />
                {diff.whyItMatters}
              </p>
              <p className="flex items-start gap-2 text-[13px] text-slate-500 leading-relaxed">
                <Users className="w-3.5 h-3.5 text-slate-400 shrink-0 mt-0.5" />
                {diff.benefitsWho}
              </p>
            </div>
          </Card>
        ))}
      </div>
    </section>
  );
}

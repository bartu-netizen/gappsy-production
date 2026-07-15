import { Users } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import Card from '../tools/detail/Card';
import type { ToolUseCase } from '../../data/toolContent/types';

interface ToolUseCases {
  name: string;
  useCases: ToolUseCase[];
}

const MAX_USE_CASES = 4;

function UseCaseColumn({ tool }: { tool: ToolUseCases }) {
  if (tool.useCases.length === 0) return null;
  return (
    <div>
      <h3 className="font-semibold text-[#0B1221] text-sm mb-3">{tool.name}</h3>
      <div className="space-y-3">
        {tool.useCases.slice(0, MAX_USE_CASES).map((useCase) => (
          <Card key={useCase.title} hoverLift className="p-4">
            <p className="font-medium text-[#0B1221] text-[13.5px] mb-1">{useCase.title}</p>
            <p className="text-[12.5px] text-slate-500 leading-relaxed mb-2">{useCase.description}</p>
            <span className="inline-flex items-center text-[10.5px] font-medium bg-slate-100 text-slate-600 px-2 py-0.5 rounded-full">
              {useCase.audience}
            </span>
          </Card>
        ))}
      </div>
    </div>
  );
}

export default function CompareUseCases({
  toolA,
  toolB,
  whoShouldChooseA,
  whoShouldChooseB,
  whoNeedsBoth,
}: {
  toolA: ToolUseCases;
  toolB: ToolUseCases;
  whoShouldChooseA?: string;
  whoShouldChooseB?: string;
  whoNeedsBoth?: string;
}) {
  const hasUseCases = toolA.useCases.length > 0 || toolB.useCases.length > 0;
  const hasWhoShould = Boolean(whoShouldChooseA || whoShouldChooseB || whoNeedsBoth);
  if (!hasUseCases && !hasWhoShould) return null;

  return (
    <section id="use-cases" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Fit" title="Use Cases" />

      {hasWhoShould && (
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 mb-6">
          {whoShouldChooseA && (
            <Card className="p-4">
              <p className="text-[11px] font-semibold uppercase tracking-wide text-[#0A1735] mb-1.5">Choose {toolA.name}</p>
              <p className="text-[13px] text-slate-600 leading-relaxed">{whoShouldChooseA}</p>
            </Card>
          )}
          {whoShouldChooseB && (
            <Card className="p-4">
              <p className="text-[11px] font-semibold uppercase tracking-wide text-violet-500 mb-1.5">Choose {toolB.name}</p>
              <p className="text-[13px] text-slate-600 leading-relaxed">{whoShouldChooseB}</p>
            </Card>
          )}
          {whoNeedsBoth && (
            <Card className="p-4">
              <p className="flex items-center gap-1.5 text-[11px] font-semibold uppercase tracking-wide text-slate-500 mb-1.5">
                <Users className="w-3.5 h-3.5" />
                Need both
              </p>
              <p className="text-[13px] text-slate-600 leading-relaxed">{whoNeedsBoth}</p>
            </Card>
          )}
        </div>
      )}

      {hasUseCases && (
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
          <UseCaseColumn tool={toolA} />
          <UseCaseColumn tool={toolB} />
        </div>
      )}
    </section>
  );
}

import type { ToolUseCase } from '../../../data/toolContent/types';
import ToolsSectionHeader from '../ToolsSectionHeader';

export default function UseCasesSection({ toolName, useCases }: { toolName: string; useCases: ToolUseCase[] }) {
  if (useCases.length === 0) return null;

  return (
    <section id="use-cases" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Use Cases" title={`Real ways people use ${toolName}`} />
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        {useCases.map((useCase) => (
          <div key={useCase.title} className="bg-white border border-[#eef0f3] rounded-2xl p-5">
            <h3 className="font-semibold text-[#0B1221] text-[15px] mb-1.5">{useCase.title}</h3>
            <p className="text-[13.5px] text-slate-500 leading-relaxed mb-3">{useCase.description}</p>
            <span className="inline-flex items-center text-[11px] font-medium bg-slate-100 text-slate-600 px-2.5 py-1 rounded-full">
              {useCase.audience}
            </span>
          </div>
        ))}
      </div>
    </section>
  );
}

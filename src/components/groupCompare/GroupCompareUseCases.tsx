import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import Card from '../tools/detail/Card';
import type { ToolUseCase } from '../../data/toolContent/types';

interface ToolUseCases {
  slug: string;
  name: string;
  useCases: ToolUseCase[];
}

const MAX_USE_CASES = 4;
const CHOOSE_COLORS = ['text-[#4F47E6]', 'text-violet-500', 'text-emerald-600'];

function UseCaseColumn({ tool }: { tool: ToolUseCases }) {
  if (tool.useCases.length === 0) return null;
  return (
    <div className="min-w-0">
      <h3 className="font-semibold text-[#0B1221] text-sm mb-3 break-words">{tool.name}</h3>
      <div className="space-y-3">
        {tool.useCases.slice(0, MAX_USE_CASES).map((useCase) => (
          <Card key={useCase.title} hoverLift className="p-4 min-w-0">
            <p className="font-medium text-[#0B1221] text-[13.5px] mb-1 break-words">{useCase.title}</p>
            <p className="text-[12.5px] text-slate-500 leading-relaxed mb-2 break-words">{useCase.description}</p>
            <span className="inline-flex items-center text-[10.5px] font-medium bg-slate-100 text-slate-600 px-2 py-0.5 rounded-full break-words">
              {useCase.audience}
            </span>
          </Card>
        ))}
      </div>
    </div>
  );
}

// N-tool sibling of CompareUseCases.tsx. The 2-tool version also has a
// "need both" card for visitors who should just use both tools — that
// framing doesn't scale cleanly to 3, so this only renders one "Choose X"
// card per tool (from the hand-authored bestFor text already used in the
// hero), not an all-three-at-once variant.
export default function GroupCompareUseCases({ tools, bestFor }: { tools: ToolUseCases[]; bestFor: Record<string, string> }) {
  const hasUseCases = tools.some((t) => t.useCases.length > 0);
  const hasBestFor = tools.some((t) => bestFor[t.slug]);
  if (!hasUseCases && !hasBestFor) return null;

  return (
    <section id="use-cases" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Fit" title="Use Cases" />

      {hasBestFor && (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 mb-6">
          {tools.map((tool, i) =>
            bestFor[tool.slug] ? (
              <Card key={tool.slug} className="p-4 min-w-0">
                <p className={`text-[11px] font-semibold uppercase tracking-wide mb-1.5 ${CHOOSE_COLORS[i % CHOOSE_COLORS.length]}`}>Choose {tool.name}</p>
                <p className="text-[13px] text-slate-600 leading-relaxed break-words">{bestFor[tool.slug]}</p>
              </Card>
            ) : null
          )}
        </div>
      )}

      {hasUseCases && (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {tools.map((tool) => (
            <UseCaseColumn key={tool.slug} tool={tool} />
          ))}
        </div>
      )}
    </section>
  );
}

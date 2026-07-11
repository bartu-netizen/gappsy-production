import { Link } from 'react-router-dom';
import { ArrowRight } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import Card from '../tools/detail/Card';
import type { ToolAlternative } from '../../data/toolContent/types';

interface ToolAlternatives {
  name: string;
  alternatives: ToolAlternative[];
}

const MAX_ALTERNATIVES = 3;

function AlternativesColumn({ tool }: { tool: ToolAlternatives }) {
  if (tool.alternatives.length === 0) return null;
  return (
    <div>
      <h3 className="font-semibold text-[#0B1221] text-sm mb-3">Alternatives to {tool.name}</h3>
      <div className="space-y-2.5">
        {tool.alternatives.slice(0, MAX_ALTERNATIVES).map((alt) => (
          <Link key={alt.name} to={alt.href} className="block">
            <Card hoverLift className="p-4">
              <div className="flex items-center justify-between gap-2 mb-1">
                <span className="font-medium text-[#0B1221] text-[13.5px]">{alt.name}</span>
                <ArrowRight className="w-3.5 h-3.5 text-slate-300 shrink-0" />
              </div>
              <p className="text-[12.5px] text-slate-500 leading-relaxed">{alt.description}</p>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  );
}

export default function CompareAlternatives({ toolA, toolB }: { toolA: ToolAlternatives; toolB: ToolAlternatives }) {
  if (toolA.alternatives.length === 0 && toolB.alternatives.length === 0) return null;

  return (
    <section id="alternatives" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Discover" title="Alternatives" />
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
        <AlternativesColumn tool={toolA} />
        <AlternativesColumn tool={toolB} />
      </div>
    </section>
  );
}

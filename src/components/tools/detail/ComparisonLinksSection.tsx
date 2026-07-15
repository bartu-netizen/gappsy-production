import { Link } from 'react-router-dom';
import { GitCompareArrows, ArrowRight } from 'lucide-react';
import type { ToolComparison } from '../../../data/toolContent/types';
import ToolsSectionHeader from '../ToolsSectionHeader';

export default function ComparisonLinksSection({ toolName, comparisons }: { toolName: string; comparisons: ToolComparison[] }) {
  if (comparisons.length === 0) return null;

  return (
    <section>
      <ToolsSectionHeader eyebrow="Comparisons" title={`Compare ${toolName} to other tools`} />
      <div className="flex flex-wrap gap-2.5">
        {comparisons.map((comparison) => (
          <Link
            key={comparison.label}
            to={comparison.href}
            className="inline-flex items-center gap-2 bg-white border border-[#eef0f3] rounded-full px-4 py-2 text-sm font-medium text-slate-600 hover:border-[#C7CCF7] hover:text-[#4F47E6] transition-colors"
          >
            <GitCompareArrows className="w-3.5 h-3.5 text-slate-400" />
            {comparison.label}
            <ArrowRight className="w-3 h-3" />
          </Link>
        ))}
      </div>
    </section>
  );
}

import ToolsSectionHeader from '../ToolsSectionHeader';
import ComparisonCard from '../../compare/ComparisonCard';

interface ComparisonCardTool {
  slug: string;
  name: string;
  logo: string | null;
}

interface ComparisonCardRow {
  slug: string;
  tool_a: ComparisonCardTool;
  tool_b: ComparisonCardTool;
}

// Reuses the exact ComparisonCard used by /compare's "Related Comparisons"
// section, so a tool comparison looks identical whether it's discovered
// from the compare hub or from one of the two tools' own pages.
export default function ComparisonCardsSection({ toolName, comparisons }: { toolName: string; comparisons: ComparisonCardRow[] }) {
  if (comparisons.length === 0) return null;

  return (
    <section>
      <ToolsSectionHeader eyebrow="Comparisons" title={`Compare ${toolName} to other tools`} />
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        {comparisons.map((c) => (
          <ComparisonCard key={c.slug} slug={c.slug} toolA={c.tool_a} toolB={c.tool_b} />
        ))}
      </div>
    </section>
  );
}

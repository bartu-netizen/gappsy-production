import ToolsSectionHeader from '../ToolsSectionHeader';
import GroupCompareCard from '../../groupCompare/GroupCompareCard';

interface GroupComparisonLinkTool {
  slug: string;
  name: string;
  logo: string | null;
}

interface GroupComparisonLinkRow {
  slug: string;
  title: string;
  tools: GroupComparisonLinkTool[];
}

// Reuses the exact GroupCompareCard used on /compare/roundup, so a group
// comparison a tool belongs to looks identical whether discovered from the
// hub or from one of its member tools' own pages.
export default function GroupComparisonLinksSection({ toolName, groupComparisons }: { toolName: string; groupComparisons: GroupComparisonLinkRow[] }) {
  if (groupComparisons.length === 0) return null;

  return (
    <section>
      <ToolsSectionHeader eyebrow="Comparisons" title={`See ${toolName} compared in multi-tool comparisons`} />
      <div className="grid grid-cols-1 gap-3">
        {groupComparisons.map((r) => (
          <GroupCompareCard key={r.slug} slug={r.slug} title={r.title} tools={r.tools} />
        ))}
      </div>
    </section>
  );
}

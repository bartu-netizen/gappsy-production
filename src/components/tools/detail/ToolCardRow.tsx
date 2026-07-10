import ToolCard, { type ToolCardData } from '../../ToolCard';
import ToolsSectionHeader from '../ToolsSectionHeader';

// Generic horizontal row of ToolCard, used for both "Related Tools" and
// "Recently Viewed" — same visual treatment, different data source. Renders
// nothing if there's nothing worth showing yet (no placeholder/empty state
// clutter on a page that otherwise has real content).
export default function ToolCardRow({
  eyebrow,
  title,
  subtitle,
  tools,
  minToShow = 1,
}: {
  eyebrow: string;
  title: string;
  subtitle?: string;
  tools: ToolCardData[];
  minToShow?: number;
}) {
  if (tools.length < minToShow) return null;

  return (
    <section>
      <ToolsSectionHeader eyebrow={eyebrow} title={title} subtitle={subtitle} />
      <div className="flex gap-4 overflow-x-auto pb-2 -mx-1 px-1 snap-x snap-mandatory scrollbar-thin">
        {tools.map((tool) => (
          <div key={tool.slug} className="min-w-[260px] sm:min-w-[280px] snap-start shrink-0">
            <ToolCard tool={tool} />
          </div>
        ))}
      </div>
    </section>
  );
}

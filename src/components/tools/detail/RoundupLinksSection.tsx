import ToolsSectionHeader from '../ToolsSectionHeader';
import RoundupCard from '../../roundup/RoundupCard';

interface RoundupLinkTool {
  slug: string;
  name: string;
  logo: string | null;
}

interface RoundupLinkRow {
  slug: string;
  title: string;
  tools: RoundupLinkTool[];
}

// Reuses the exact RoundupCard used on /roundup, so a roundup a tool
// belongs to looks identical whether discovered from the roundup hub or
// from one of its member tools' own pages.
export default function RoundupLinksSection({ toolName, roundups }: { toolName: string; roundups: RoundupLinkRow[] }) {
  if (roundups.length === 0) return null;

  return (
    <section>
      <ToolsSectionHeader eyebrow="Roundups" title={`See ${toolName} compared in multi-tool roundups`} />
      <div className="grid grid-cols-1 gap-3">
        {roundups.map((r) => (
          <RoundupCard key={r.slug} slug={r.slug} title={r.title} tools={r.tools} />
        ))}
      </div>
    </section>
  );
}

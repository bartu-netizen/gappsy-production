import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import ScreenshotGallery from '../tools/detail/ScreenshotGallery';
import type { ScreenshotItem } from '../tools/detail/types';

interface ToolScreenshots {
  slug: string;
  name: string;
  screenshots: ScreenshotItem[];
  websiteUrl: string | null;
}

// N-tool sibling of CompareScreenshots.tsx — one ScreenshotGallery instance
// per tool that actually has screenshot assets, each with its own section
// id so they don't collide. Renders nothing when none of the tools have
// real screenshots.
export default function GroupCompareScreenshots({ tools }: { tools: ToolScreenshots[] }) {
  if (tools.every((t) => t.screenshots.length === 0)) return null;

  return (
    <div id="screenshots" className="scroll-mt-24 space-y-10">
      <ToolsSectionHeader eyebrow="Gallery" title="Screenshots" />
      {tools.map((tool) => (
        <ScreenshotGallery
          key={tool.slug}
          toolName={tool.name}
          screenshots={tool.screenshots}
          websiteUrl={tool.websiteUrl}
          sectionId={`screenshots-${tool.slug}`}
          eyebrow={tool.name}
        />
      ))}
    </div>
  );
}

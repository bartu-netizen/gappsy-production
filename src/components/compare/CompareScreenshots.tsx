import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import ScreenshotGallery from '../tools/detail/ScreenshotGallery';
import type { ScreenshotItem } from '../tools/detail/types';

interface ToolScreenshots {
  name: string;
  slug: string;
  screenshots: ScreenshotItem[];
  websiteUrl: string | null;
}

// Reuses the exact premium browser-frame/lightbox system from the tool
// detail template (ScreenshotGallery + BrowserFrame) — one instance per
// tool, each with its own section id so two can render on the same page
// without colliding. Hides cleanly (renders nothing) when neither tool has
// real screenshot assets, which is the common case for a freshly-approved
// comparison.
export default function CompareScreenshots({ toolA, toolB }: { toolA: ToolScreenshots; toolB: ToolScreenshots }) {
  if (toolA.screenshots.length === 0 && toolB.screenshots.length === 0) return null;

  return (
    <div id="screenshots" className="scroll-mt-24 space-y-10">
      <ToolsSectionHeader eyebrow="Gallery" title="Screenshots" />
      <ScreenshotGallery
        toolName={toolA.name}
        screenshots={toolA.screenshots}
        websiteUrl={toolA.websiteUrl}
        sectionId={`screenshots-${toolA.slug}`}
        eyebrow={toolA.name}
      />
      <ScreenshotGallery
        toolName={toolB.name}
        screenshots={toolB.screenshots}
        websiteUrl={toolB.websiteUrl}
        sectionId={`screenshots-${toolB.slug}`}
        eyebrow={toolB.name}
      />
    </div>
  );
}

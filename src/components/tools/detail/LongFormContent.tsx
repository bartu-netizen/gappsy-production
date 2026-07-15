import { Award } from 'lucide-react';
import type { ToolContentBlock } from '../../../data/toolContent/types';

// ids that get a distinct editorial-verdict callout treatment instead of a
// plain paragraph — a soft convention, not a required contract: any future
// tool's extendedContent that doesn't use these ids just renders as normal
// prose, unaffected.
const EDITORIAL_VERDICT_IDS = new Set(['final-verdict', 'expert-opinion']);

// Renders structured long-form content as real semantic headings, feeding
// the ids the TableOfContents scroll-spy watches. `scroll-mt-24` offsets the
// anchor target so a sticky header never covers the heading after a jump.
export default function LongFormContent({ blocks }: { blocks: ToolContentBlock[] }) {
  return (
    <div className="space-y-10 prose-slate max-w-none">
      {blocks.map((block) => {
        const HeadingTag = block.level === 2 ? 'h2' : 'h3';
        const isVerdict = EDITORIAL_VERDICT_IDS.has(block.id);
        return (
          <div
            key={block.id}
            id={block.id}
            className={isVerdict ? 'scroll-mt-24 bg-blue-50/50 border border-blue-100 rounded-2xl p-5 sm:p-6' : 'scroll-mt-24'}
          >
            {isVerdict && (
              <p className="flex items-center gap-1.5 text-[11px] font-semibold uppercase tracking-[0.08em] text-blue-500 mb-2">
                <Award className="w-3.5 h-3.5" />
                Editor's Verdict
              </p>
            )}
            <HeadingTag
              className={
                block.level === 2
                  ? 'text-xl sm:text-2xl font-bold text-[#0B1221] mb-3.5 tracking-tight'
                  : 'text-lg sm:text-xl font-semibold text-[#0B1221] mb-2.5 tracking-tight'
              }
            >
              {block.heading}
            </HeadingTag>
            <div className="space-y-4 max-w-[70ch]">
              {block.paragraphs.map((paragraph, index) => (
                <p key={index} className="text-[15.5px] sm:text-base text-slate-600 leading-[1.75]">
                  {paragraph}
                </p>
              ))}
            </div>
          </div>
        );
      })}
    </div>
  );
}

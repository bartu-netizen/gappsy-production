import type { ToolContentBlock } from '../../../data/toolContent/types';

// Renders structured long-form content as real semantic headings, feeding
// the ids the TableOfContents scroll-spy watches. `scroll-mt-24` offsets the
// anchor target so a sticky header never covers the heading after a jump.
export default function LongFormContent({ blocks }: { blocks: ToolContentBlock[] }) {
  return (
    <div className="space-y-8 prose-slate max-w-none">
      {blocks.map((block) => {
        const HeadingTag = block.level === 2 ? 'h2' : 'h3';
        return (
          <div key={block.id} id={block.id} className="scroll-mt-24">
            <HeadingTag
              className={
                block.level === 2
                  ? 'text-xl sm:text-2xl font-bold text-[#0B1221] mb-3 tracking-tight'
                  : 'text-lg sm:text-xl font-semibold text-[#0B1221] mb-2.5 tracking-tight'
              }
            >
              {block.heading}
            </HeadingTag>
            <div className="space-y-3.5">
              {block.paragraphs.map((paragraph, index) => (
                <p key={index} className="text-[15.5px] sm:text-base text-slate-600 leading-relaxed">
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

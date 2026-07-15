import { useEffect, useRef, useState } from 'react';
import { ChevronLeft, ChevronRight } from 'lucide-react';
import ToolCard, { type ToolCardData } from '../../ToolCard';
import ToolsSectionHeader from '../ToolsSectionHeader';

// Generic horizontal row of ToolCard, used for "Same Category", "Editor
// Picks", "Recently Updated", and "Recently Viewed" — same visual
// treatment, different data source. Renders nothing if there's nothing
// worth showing yet (no placeholder/empty state clutter on a page that
// otherwise has real content).
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
  const scrollerRef = useRef<HTMLDivElement>(null);
  const [canScrollLeft, setCanScrollLeft] = useState(false);
  const [canScrollRight, setCanScrollRight] = useState(false);

  function updateScrollState() {
    const el = scrollerRef.current;
    if (!el) return;
    setCanScrollLeft(el.scrollLeft > 4);
    setCanScrollRight(el.scrollLeft + el.clientWidth < el.scrollWidth - 4);
  }

  useEffect(() => {
    updateScrollState();
    const el = scrollerRef.current;
    if (!el) return;
    const observer = new ResizeObserver(updateScrollState);
    observer.observe(el);
    return () => observer.disconnect();
  }, [tools.length]);

  function scrollByCards(direction: 1 | -1) {
    const el = scrollerRef.current;
    if (!el) return;
    const card = el.querySelector<HTMLElement>('[data-card]');
    const step = card ? card.getBoundingClientRect().width + 16 : el.clientWidth * 0.8;
    el.scrollBy({ left: direction * step * 2, behavior: 'smooth' });
  }

  if (tools.length < minToShow) return null;

  return (
    <section>
      <ToolsSectionHeader eyebrow={eyebrow} title={title} subtitle={subtitle} />

      <div className="relative -mx-1 px-1">
        <div
          ref={scrollerRef}
          onScroll={updateScrollState}
          className="flex gap-4 overflow-x-auto pb-2 snap-x snap-mandatory scrollbar-thin"
        >
          {tools.map((tool) => (
            <div key={tool.slug} data-card className="w-[260px] sm:w-[280px] shrink-0 snap-start">
              <ToolCard tool={tool} />
            </div>
          ))}
        </div>

        {/* Netflix-row affordance: fade + arrow buttons directly on the track
            edges. overflow-x-auto's native scrollbar alone is too easy to
            miss (invisible by default on most trackpads/desktop browsers). */}
        {canScrollLeft && (
          <>
            <div className="hidden sm:block absolute left-0 top-0 bottom-2 w-16 bg-gradient-to-r from-white to-transparent pointer-events-none" aria-hidden="true" />
            <button
              type="button"
              onClick={() => scrollByCards(-1)}
              aria-label="Scroll left"
              className="absolute left-2 top-[calc(50%-8px)] -translate-y-1/2 w-9 h-9 rounded-full bg-white border border-slate-200 shadow-[0_4px_12px_rgba(15,23,42,0.12)] flex items-center justify-center text-slate-600 hover:bg-slate-50 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 focus-visible:ring-offset-2"
            >
              <ChevronLeft className="w-4 h-4" />
            </button>
          </>
        )}

        {canScrollRight && (
          <>
            <div className="hidden sm:block absolute right-0 top-0 bottom-2 w-16 bg-gradient-to-l from-white to-transparent pointer-events-none" aria-hidden="true" />
            <button
              type="button"
              onClick={() => scrollByCards(1)}
              aria-label="Scroll right"
              className="absolute right-2 top-[calc(50%-8px)] -translate-y-1/2 w-9 h-9 rounded-full bg-white border border-slate-200 shadow-[0_4px_12px_rgba(15,23,42,0.12)] flex items-center justify-center text-slate-600 hover:bg-slate-50 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 focus-visible:ring-offset-2"
            >
              <ChevronRight className="w-4 h-4" />
            </button>
          </>
        )}
      </div>
    </section>
  );
}

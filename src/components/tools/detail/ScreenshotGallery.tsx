import { useEffect, useRef, useState } from 'react';
import { ChevronLeft, ChevronRight, X } from 'lucide-react';
import type { ScreenshotItem } from './types';
import ToolsSectionHeader from '../ToolsSectionHeader';

export default function ScreenshotGallery({ toolName, screenshots }: { toolName: string; screenshots: ScreenshotItem[] }) {
  const [activeIndex, setActiveIndex] = useState<number | null>(null);
  const dialogRef = useRef<HTMLDialogElement>(null);

  useEffect(() => {
    const dialog = dialogRef.current;
    if (!dialog) return;
    if (activeIndex !== null && !dialog.open) dialog.showModal();
    if (activeIndex === null && dialog.open) dialog.close();
  }, [activeIndex]);

  if (screenshots.length === 0) return null;

  function showPrev() {
    setActiveIndex((i) => (i === null ? null : (i - 1 + screenshots.length) % screenshots.length));
  }
  function showNext() {
    setActiveIndex((i) => (i === null ? null : (i + 1) % screenshots.length));
  }
  function handleKeyDown(e: React.KeyboardEvent) {
    if (e.key === 'ArrowLeft') showPrev();
    if (e.key === 'ArrowRight') showNext();
  }

  const active = activeIndex !== null ? screenshots[activeIndex] : null;

  return (
    <section id="screenshots" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Gallery" title={`${toolName} screenshots`} />
      <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
        {screenshots.map((shot, index) => (
          <button
            key={shot.id}
            type="button"
            onClick={() => setActiveIndex(index)}
            className="group relative aspect-[4/3] rounded-xl overflow-hidden border border-[#eef0f3] focus:outline-none focus:ring-2 focus:ring-indigo-500"
          >
            <img
              src={shot.image_url}
              alt={shot.caption || `${toolName} screenshot ${index + 1}`}
              loading="lazy"
              decoding="async"
              className="w-full h-full object-cover transition-transform duration-200 group-hover:scale-105"
            />
          </button>
        ))}
      </div>

      <dialog
        ref={dialogRef}
        onClose={() => setActiveIndex(null)}
        onKeyDown={handleKeyDown}
        aria-label={`${toolName} screenshot viewer`}
        className="backdrop:bg-black/70 rounded-2xl p-0 max-w-4xl w-[92vw] bg-transparent"
      >
        {active && (
          <div className="relative bg-black rounded-2xl overflow-hidden">
            <button
              type="button"
              onClick={() => setActiveIndex(null)}
              aria-label="Close"
              className="absolute top-3 right-3 z-10 p-2 rounded-full bg-black/50 text-white hover:bg-black/70 transition-colors"
            >
              <X className="w-5 h-5" />
            </button>
            {screenshots.length > 1 && (
              <>
                <button
                  type="button"
                  onClick={showPrev}
                  aria-label="Previous screenshot"
                  className="absolute left-3 top-1/2 -translate-y-1/2 z-10 p-2 rounded-full bg-black/50 text-white hover:bg-black/70 transition-colors"
                >
                  <ChevronLeft className="w-5 h-5" />
                </button>
                <button
                  type="button"
                  onClick={showNext}
                  aria-label="Next screenshot"
                  className="absolute right-3 top-1/2 -translate-y-1/2 z-10 p-2 rounded-full bg-black/50 text-white hover:bg-black/70 transition-colors"
                >
                  <ChevronRight className="w-5 h-5" />
                </button>
              </>
            )}
            <img src={active.image_url} alt={active.caption || toolName} className="w-full max-h-[80vh] object-contain" />
            {active.caption && <p className="text-center text-white/80 text-sm py-3 px-4">{active.caption}</p>}
          </div>
        )}
      </dialog>
    </section>
  );
}

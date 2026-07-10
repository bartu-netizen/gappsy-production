import { useEffect, useRef, useState } from 'react';
import { ChevronLeft, ChevronRight, X } from 'lucide-react';
import type { ScreenshotItem } from './types';
import ToolsSectionHeader from '../ToolsSectionHeader';
import BrowserFrame from './BrowserFrame';

function hostnameOf(url: string | null | undefined): string | null {
  if (!url) return null;
  try {
    return new URL(url).hostname.replace(/^www\./, '');
  } catch {
    return null;
  }
}

const SWIPE_THRESHOLD_PX = 40;

export default function ScreenshotGallery({
  toolName,
  screenshots,
  websiteUrl,
}: {
  toolName: string;
  screenshots: ScreenshotItem[];
  websiteUrl?: string | null;
}) {
  const [activeIndex, setActiveIndex] = useState<number | null>(null);
  const [entered, setEntered] = useState(false);
  const [imgVisible, setImgVisible] = useState(false);
  const [loadedThumbs, setLoadedThumbs] = useState<Set<number>>(new Set());
  const dialogRef = useRef<HTMLDialogElement>(null);
  const touchStartX = useRef<number | null>(null);
  const hostname = hostnameOf(websiteUrl);

  useEffect(() => {
    const dialog = dialogRef.current;
    if (!dialog) return;
    if (activeIndex !== null && !dialog.open) {
      dialog.showModal();
      requestAnimationFrame(() => setEntered(true));
    }
    if (activeIndex === null && dialog.open) {
      setEntered(false);
      dialog.close();
    }
  }, [activeIndex]);

  useEffect(() => {
    setImgVisible(false);
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
  function handleTouchStart(e: React.TouchEvent) {
    touchStartX.current = e.touches[0].clientX;
  }
  function handleTouchEnd(e: React.TouchEvent) {
    if (touchStartX.current === null) return;
    const delta = e.changedTouches[0].clientX - touchStartX.current;
    if (delta > SWIPE_THRESHOLD_PX) showPrev();
    else if (delta < -SWIPE_THRESHOLD_PX) showNext();
    touchStartX.current = null;
  }
  function markThumbLoaded(index: number) {
    setLoadedThumbs((prev) => {
      const next = new Set(prev);
      next.add(index);
      return next;
    });
  }

  const active = activeIndex !== null ? screenshots[activeIndex] : null;
  const [featured, ...rest] = screenshots;

  function renderThumb(shot: ScreenshotItem, index: number) {
    return (
      <button
        key={shot.id}
        type="button"
        onClick={() => setActiveIndex(index)}
        className="group w-full text-left focus:outline-none focus:ring-2 focus:ring-indigo-500 rounded-xl transition-transform duration-200 hover:-translate-y-0.5"
      >
        <BrowserFrame hostname={hostname} className="shadow-sm group-hover:shadow-[0_16px_32px_rgba(15,23,42,0.12)] transition-shadow duration-200">
          <div className="relative aspect-video overflow-hidden">
            {!loadedThumbs.has(index) && <div className="absolute inset-0 bg-slate-100 animate-pulse" aria-hidden="true" />}
            <img
              src={shot.image_url}
              alt={shot.caption || `${toolName} screenshot ${index + 1}`}
              loading="lazy"
              decoding="async"
              onLoad={() => markThumbLoaded(index)}
              className={`w-full h-full object-cover transition-all duration-300 group-hover:scale-[1.03] ${
                loadedThumbs.has(index) ? 'opacity-100' : 'opacity-0'
              }`}
            />
          </div>
        </BrowserFrame>
      </button>
    );
  }

  return (
    <section id="screenshots" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Gallery" title={`${toolName} screenshots`} />

      <div className="relative mb-4">
        <div
          className="absolute -inset-6 -z-10 rounded-[32px] opacity-60 blur-2xl"
          style={{ background: 'radial-gradient(60% 70% at 50% 30%, rgba(79,70,229,0.10), transparent)' }}
          aria-hidden="true"
        />
        {renderThumb(featured, 0)}
      </div>

      {rest.length > 0 && (
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-4">
          {rest.map((shot, i) => renderThumb(shot, i + 1))}
        </div>
      )}

      <dialog
        ref={dialogRef}
        onClose={() => setActiveIndex(null)}
        onKeyDown={handleKeyDown}
        aria-label={`${toolName} screenshot viewer`}
        className="backdrop:bg-black/70 rounded-2xl p-0 max-w-4xl w-[92vw] bg-transparent"
      >
        {active && (
          <div
            className={`relative bg-black rounded-2xl overflow-hidden transition-all duration-300 ${
              entered ? 'opacity-100 scale-100' : 'opacity-0 scale-95'
            }`}
          >
            <button
              type="button"
              onClick={() => setActiveIndex(null)}
              aria-label="Close"
              className="absolute top-3 right-3 z-10 p-2 rounded-full bg-black/50 text-white hover:bg-black/70 active:scale-95 transition-all"
            >
              <X className="w-5 h-5" />
            </button>
            {screenshots.length > 1 && (
              <>
                <button
                  type="button"
                  onClick={showPrev}
                  aria-label="Previous screenshot"
                  className="absolute left-3 top-1/2 -translate-y-1/2 z-10 p-2 rounded-full bg-black/50 text-white hover:bg-black/70 active:scale-95 transition-all"
                >
                  <ChevronLeft className="w-5 h-5" />
                </button>
                <button
                  type="button"
                  onClick={showNext}
                  aria-label="Next screenshot"
                  className="absolute right-3 top-1/2 -translate-y-1/2 z-10 p-2 rounded-full bg-black/50 text-white hover:bg-black/70 active:scale-95 transition-all"
                >
                  <ChevronRight className="w-5 h-5" />
                </button>
              </>
            )}
            <div onTouchStart={handleTouchStart} onTouchEnd={handleTouchEnd}>
              <img
                key={active.id}
                src={active.image_url}
                alt={active.caption || toolName}
                onLoad={() => setImgVisible(true)}
                className={`w-full max-h-[80vh] object-contain transition-opacity duration-300 ${imgVisible ? 'opacity-100' : 'opacity-0'}`}
              />
            </div>
            {active.caption && <p className="text-center text-white/80 text-sm py-3 px-4">{active.caption}</p>}
            {screenshots.length > 1 && (
              <div className="flex items-center justify-center gap-2 pb-4 px-4 overflow-x-auto">
                {screenshots.map((shot, index) => (
                  <button
                    key={shot.id}
                    type="button"
                    onClick={() => setActiveIndex(index)}
                    aria-label={`Show screenshot ${index + 1}`}
                    aria-current={index === activeIndex}
                    className={`w-12 h-9 rounded-md overflow-hidden shrink-0 border-2 transition-colors ${
                      index === activeIndex ? 'border-white' : 'border-transparent opacity-60 hover:opacity-90'
                    }`}
                  >
                    <img src={shot.image_url} alt="" className="w-full h-full object-cover" loading="lazy" />
                  </button>
                ))}
              </div>
            )}
          </div>
        )}
      </dialog>
    </section>
  );
}

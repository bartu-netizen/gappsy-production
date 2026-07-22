import { useEffect, useRef, useState } from 'react';

// Reveals the rest of a text string that's too long to fit its slot, instead
// of permanently truncating it with an ellipsis/line-clamp — only animates
// when the text actually overflows (short text just sits still, no
// pointless motion), pauses on hover so it can actually be read, and
// respects prefers-reduced-motion. Shared by every featured-ad placement
// (sticky desktop bar, sidebar cards, inline cards) so a long
// short_description reads the same way everywhere on the page. Mirrors the
// duplicate-content marquee technique already used by MobileAdRails.tsx
// (home page ad rail), just measured per-instance rather than infinite.
export default function OverflowMarqueeText({ text, className }: { text: string; className: string }) {
  const containerRef = useRef<HTMLSpanElement>(null);
  const measureRef = useRef<HTMLSpanElement>(null);
  const [overflowing, setOverflowing] = useState(false);
  const [paused, setPaused] = useState(false);

  useEffect(() => {
    function measure() {
      if (containerRef.current && measureRef.current) {
        setOverflowing(measureRef.current.scrollWidth > containerRef.current.clientWidth + 1);
      }
    }
    measure();
    window.addEventListener('resize', measure);
    return () => window.removeEventListener('resize', measure);
  }, [text]);

  return (
    <span
      ref={containerRef}
      className={`relative block overflow-hidden ${className}`}
      onMouseEnter={() => setPaused(true)}
      onMouseLeave={() => setPaused(false)}
    >
      {/* Hidden single copy purely to measure natural width — never shown. */}
      <span ref={measureRef} className="invisible absolute whitespace-nowrap" aria-hidden="true">
        {text}
      </span>
      {overflowing ? (
        <span
          className={`flex whitespace-nowrap animate-marquee-left motion-reduce:animate-none ${paused ? 'paused' : ''}`}
          style={{ width: 'max-content', animationDuration: '42s' }}
        >
          <span className="pr-10">{text}</span>
          <span className="pr-10" aria-hidden="true">{text}</span>
        </span>
      ) : (
        <span className="block truncate">{text}</span>
      )}
    </span>
  );
}

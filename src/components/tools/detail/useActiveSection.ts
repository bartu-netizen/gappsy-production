import { useEffect, useRef, useState } from 'react';
import type { TocSection } from './TableOfContents';

// Shared scroll-spy logic behind both the desktop sidebar TableOfContents and
// the mobile MobileTableOfContents — same active-section tracking and
// scroll-to behavior, just rendered differently per breakpoint.
export function useActiveSection(sections: TocSection[]) {
  const [activeId, setActiveId] = useState<string | null>(sections[0]?.id ?? null);
  const observerRef = useRef<IntersectionObserver | null>(null);

  useEffect(() => {
    if (sections.length === 0) return;

    observerRef.current = new IntersectionObserver(
      (entries) => {
        const visible = entries.filter((e) => e.isIntersecting);
        if (visible.length > 0) {
          const topMost = visible.reduce((a, b) => (a.boundingClientRect.top < b.boundingClientRect.top ? a : b));
          setActiveId(topMost.target.id);
        }
      },
      { rootMargin: '-96px 0px -70% 0px', threshold: 0 }
    );

    const observed = new Set<string>();
    function observeAnyNewSections() {
      sections.forEach((section) => {
        if (observed.has(section.id)) return;
        const el = document.getElementById(section.id);
        if (el) {
          observed.add(section.id);
          observerRef.current?.observe(el);
        }
      });
    }

    observeAnyNewSections();

    // Several sections below the fold (screenshots, integrations, reviews,
    // alternatives, ...) render via LazyLoad and don't exist in the DOM yet
    // at mount time — they mount later, once scrolled near, as an
    // independent state update inside LazyLoad that never bubbles up to
    // re-render this list. Without this, those sections are silently never
    // observed and the active highlight gets stuck on whatever was last
    // tracked. Watch the document for them appearing instead of assuming a
    // single pass at mount finds everything.
    const mutationObserver = new MutationObserver(observeAnyNewSections);
    mutationObserver.observe(document.body, { childList: true, subtree: true });

    return () => {
      observerRef.current?.disconnect();
      mutationObserver.disconnect();
    };
  }, [sections]);

  function goToSection(id: string) {
    const el = document.getElementById(id);
    if (!el) return;
    setActiveId(id);
    el.scrollIntoView({ behavior: 'smooth', block: 'start' });

    // Sections above the target may still be LazyLoad placeholders (zero
    // height until scrolled near — see LazyLoad.tsx) at the instant this
    // click fires. The scroll above computes its distance from their
    // current (collapsed) layout, so as they mount their real content
    // mid-animation the page grows underneath an already-in-progress
    // scroll and the target drifts — e.g. clicking "Comparisons" can land
    // on "Reviews" once everything above finishes expanding. Track the
    // target's *own* viewport position (not overall document height,
    // which also reacts to unrelated content loading elsewhere on the
    // page) and keep re-snapping to it while it's still moving, then stop
    // once several consecutive frames show it holding still.
    let lastTop = el.getBoundingClientRect().top;
    let stableFrames = 0;
    const deadline = performance.now() + 3000;

    const settle = () => {
      const target = document.getElementById(id);
      if (!target) return;
      const top = target.getBoundingClientRect().top;
      if (Math.abs(top - lastTop) > 2) {
        target.scrollIntoView({ behavior: 'auto', block: 'start' });
        lastTop = target.getBoundingClientRect().top;
        stableFrames = 0;
      } else {
        lastTop = top;
        stableFrames++;
      }
      if (stableFrames < 6 && performance.now() < deadline) {
        requestAnimationFrame(settle);
      }
    };
    requestAnimationFrame(settle);
  }

  return { activeId, goToSection };
}

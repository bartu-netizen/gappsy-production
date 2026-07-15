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
    if (el) {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      setActiveId(id);
    }
  }

  return { activeId, goToSection };
}

import { useEffect, useRef, useState } from 'react';

export interface TocSection {
  id: string;
  label: string;
}

// Sticky, scroll-spy table of contents. Generic against any `{id, label}[]`
// list, so it works for the long-form sections here and for any future
// section list a different tool page composes.
export default function TableOfContents({ sections }: { sections: TocSection[] }) {
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

    sections.forEach((section) => {
      const el = document.getElementById(section.id);
      if (el) observerRef.current?.observe(el);
    });

    return () => observerRef.current?.disconnect();
  }, [sections]);

  function handleClick(e: React.MouseEvent, id: string) {
    e.preventDefault();
    const el = document.getElementById(id);
    if (el) {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      setActiveId(id);
    }
  }

  if (sections.length === 0) return null;

  return (
    <nav aria-label="Table of contents" className="lg:sticky lg:top-[88px]">
      <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-3">On this page</p>
      <ul className="space-y-1.5 max-h-[70vh] overflow-y-auto pr-2 scrollbar-thin">
        {sections.map((section) => (
          <li key={section.id}>
            <a
              href={`#${section.id}`}
              onClick={(e) => handleClick(e, section.id)}
              aria-current={activeId === section.id ? 'true' : undefined}
              className={`block text-sm py-1 border-l-2 pl-3 transition-colors ${
                activeId === section.id
                  ? 'border-indigo-500 text-indigo-600 font-medium'
                  : 'border-transparent text-slate-500 hover:text-slate-700 hover:border-slate-200'
              }`}
            >
              {section.label}
            </a>
          </li>
        ))}
      </ul>
    </nav>
  );
}

import { useActiveSection } from './useActiveSection';

export interface TocSection {
  id: string;
  label: string;
}

// Sticky, scroll-spy table of contents (desktop sidebar). Generic against any
// `{id, label}[]` list, so it works for the long-form sections here and for
// any future section list a different tool page composes. See
// MobileTableOfContents for the < lg breakpoint equivalent — both share the
// same active-section logic via useActiveSection.
export default function TableOfContents({ sections }: { sections: TocSection[] }) {
  const { activeId, goToSection } = useActiveSection(sections);

  function handleClick(e: React.MouseEvent, id: string) {
    e.preventDefault();
    goToSection(id);
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

import { useEffect, useState } from 'react';
import { ChevronDown } from 'lucide-react';
import { useActiveSection } from './useActiveSection';
import type { TocSection } from './TableOfContents';

// The < lg equivalent of TableOfContents — that sidebar is `hidden lg:block`,
// so without this, mobile/tablet visitors have no way to jump to a section
// on long tool pages at all. A collapsed sticky bar (shows the section
// currently in view) expands into the same section list on tap.
export default function MobileTableOfContents({ sections }: { sections: TocSection[] }) {
  const { activeId, goToSection } = useActiveSection(sections);
  const [open, setOpen] = useState(false);

  useEffect(() => {
    if (!open) return;
    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === 'Escape') setOpen(false);
    }
    document.addEventListener('keydown', handleKeyDown);
    return () => document.removeEventListener('keydown', handleKeyDown);
  }, [open]);

  if (sections.length === 0) return null;
  const activeLabel = sections.find((s) => s.id === activeId)?.label ?? sections[0].label;

  function handleSelect(id: string) {
    goToSection(id);
    setOpen(false);
  }

  return (
    <div className="lg:hidden sticky top-16 z-30 -mx-4 sm:-mx-6 px-4 sm:px-6 bg-white/95 backdrop-blur-sm border-b border-[#f1f3f5]">
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        aria-expanded={open}
        className="flex items-center justify-between w-full py-3 text-left focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-inset rounded-sm"
      >
        <span className="min-w-0">
          <span className="text-[10px] font-semibold uppercase tracking-[0.08em] text-slate-400 block">On this page</span>
          <span className="text-[14px] font-medium text-[#0B1221] truncate block">{activeLabel}</span>
        </span>
        <ChevronDown className={`w-4 h-4 text-slate-400 shrink-0 ml-3 transition-transform duration-200 ${open ? 'rotate-180' : ''}`} aria-hidden="true" />
      </button>

      {open && (
        <div className="absolute left-0 right-0 top-full mx-4 sm:mx-6 mb-3 rounded-2xl bg-white border border-[#eef0f3] shadow-[0_16px_32px_rgba(15,23,42,0.12)] max-h-[60vh] overflow-y-auto">
          <ul className="py-2">
            {sections.map((section) => (
              <li key={section.id}>
                <button
                  type="button"
                  onClick={() => handleSelect(section.id)}
                  aria-current={activeId === section.id ? 'true' : undefined}
                  className={`block w-full text-left px-4 py-2.5 text-sm transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-inset focus-visible:ring-[#4F47E6] ${
                    activeId === section.id ? 'text-[#4F47E6] font-medium bg-[#EEF0FE]/60' : 'text-slate-600 hover:bg-slate-50'
                  }`}
                >
                  {section.label}
                </button>
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}

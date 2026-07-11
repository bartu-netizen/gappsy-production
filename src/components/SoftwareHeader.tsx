import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Search, Menu, X } from 'lucide-react';
import GlobalSearch from './search/GlobalSearch';

interface NavItem {
  label: string;
  href?: string;
}

const NAV_ITEMS: NavItem[] = [
  { label: 'Categories', href: '/tool-categories' },
  { label: 'Compare' },
  { label: 'Resources' },
  { label: 'For Vendors' },
];

// Premium application header for the software-directory templates (/tools/*,
// and eventually /categories/*, /compare/*). Deliberately separate from
// MiniHeader — the floating pill nav used everywhere else on the site — so
// that component and its callers stay completely untouched. Nav items with
// no `href` point to pages that don't exist yet; they render as disabled
// "Soon" entries instead of dead links.
export default function SoftwareHeader() {
  const [menuOpen, setMenuOpen] = useState(false);
  const [searchOpen, setSearchOpen] = useState(false);

  useEffect(() => {
    function handleKeyDown(e: KeyboardEvent) {
      const isCmdK = (e.metaKey || e.ctrlKey) && e.key.toLowerCase() === 'k';
      if (isCmdK) {
        e.preventDefault();
        setSearchOpen(true);
        return;
      }
      if (e.key !== '/') return;
      const target = e.target as HTMLElement | null;
      const isTyping = target && (target.tagName === 'INPUT' || target.tagName === 'TEXTAREA' || target.isContentEditable);
      if (isTyping) return;
      e.preventDefault();
      setSearchOpen(true);
    }
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, []);

  function openSearch() {
    setMenuOpen(false);
    setSearchOpen(true);
  }

  return (
    <header className="sticky top-0 z-40 bg-white/85 backdrop-blur-md backdrop-saturate-150 border-b border-slate-100">
      <div className="max-w-7xl mx-auto px-4 sm:px-6">
        {/* Desktop */}
        <div className="hidden md:flex items-center gap-6 h-16">
          <Link to="/" aria-label="Gappsy home" className="shrink-0 flex items-center">
            <img src="/logos/Gappsy-Logo-4A5DFF-transparent-background.png" alt="Gappsy" className="h-7 w-auto" />
          </Link>

          <div className="flex-1 max-w-xl mx-auto">
            <button
              type="button"
              onClick={openSearch}
              aria-label="Search software"
              className="flex items-center w-full h-11 rounded-full bg-slate-50 border border-slate-200/80 pl-4 pr-2 gap-2 transition-all duration-200 hover:border-slate-300 hover:bg-white text-left"
            >
              <Search className="w-4 h-4 text-slate-400 shrink-0" aria-hidden="true" />
              <span className="flex-1 min-w-0 text-sm text-slate-400">Search software...</span>
              <kbd className="hidden lg:inline-flex items-center justify-center h-5 px-1.5 rounded-md bg-white border border-slate-200 text-[10px] font-medium text-slate-400 shrink-0">
                ⌘K
              </kbd>
            </button>
          </div>

          <nav aria-label="Software directory" className="flex items-center gap-1 shrink-0">
            {NAV_ITEMS.map((item) =>
              item.href ? (
                <Link
                  key={item.label}
                  to={item.href}
                  className="px-3 py-2 rounded-full text-sm font-medium text-slate-600 hover:text-[#0B1221] hover:bg-slate-50 transition-colors"
                >
                  {item.label}
                </Link>
              ) : (
                <span
                  key={item.label}
                  aria-disabled="true"
                  className="inline-flex items-center gap-1.5 px-3 py-2 rounded-full text-sm font-medium text-slate-300 cursor-default select-none"
                >
                  {item.label}
                  <span className="text-[9px] font-semibold uppercase tracking-wide text-slate-300 bg-slate-50 rounded-full px-1.5 py-0.5">
                    Soon
                  </span>
                </span>
              )
            )}
          </nav>

          <div className="w-px h-5 bg-slate-200 shrink-0" aria-hidden="true" />

          <div className="flex items-center gap-2 shrink-0">
            <Link
              to="/login"
              className="px-4 py-2 rounded-full text-sm font-medium text-slate-600 hover:text-[#0B1221] hover:bg-slate-50 transition-colors"
            >
              Sign In
            </Link>
            <button
              type="button"
              disabled
              aria-disabled="true"
              title="Coming soon"
              className="inline-flex items-center gap-1.5 px-4 py-2 rounded-full text-sm font-semibold text-white/70 bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] opacity-50 cursor-not-allowed"
            >
              Submit Software
            </button>
          </div>
        </div>

        {/* Mobile */}
        <div className="md:hidden">
          <div className="flex items-center justify-between h-14 gap-3">
            <Link to="/" aria-label="Gappsy home" className="shrink-0 flex items-center">
              <img src="/logos/Gappsy-Logo-4A5DFF-transparent-background.png" alt="Gappsy" className="h-6 w-auto" />
            </Link>
            <button
              type="button"
              onClick={() => setMenuOpen((v) => !v)}
              aria-expanded={menuOpen}
              aria-label={menuOpen ? 'Close menu' : 'Open menu'}
              className="w-9 h-9 rounded-full border border-slate-200 flex items-center justify-center text-slate-500 shrink-0"
            >
              {menuOpen ? <X className="w-4 h-4" /> : <Menu className="w-4 h-4" />}
            </button>
          </div>

          <div className="pb-3">
            <button
              type="button"
              onClick={openSearch}
              aria-label="Search software"
              className="flex items-center w-full h-11 rounded-full bg-slate-50 border border-slate-200/80 px-4 gap-2 text-left"
            >
              <Search className="w-4 h-4 text-slate-400 shrink-0" aria-hidden="true" />
              <span className="flex-1 min-w-0 text-sm text-slate-400">Search software...</span>
            </button>
          </div>

          {menuOpen && (
            <div className="pb-4 border-t border-slate-100 pt-3 space-y-1 animate-slideDown">
              {NAV_ITEMS.map((item) =>
                item.href ? (
                  <Link
                    key={item.label}
                    to={item.href}
                    onClick={() => setMenuOpen(false)}
                    className="flex items-center justify-between px-3 py-2.5 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-[#0B1221] transition-colors"
                  >
                    {item.label}
                  </Link>
                ) : (
                  <span
                    key={item.label}
                    aria-disabled="true"
                    className="flex items-center justify-between px-3 py-2.5 rounded-xl text-sm font-medium text-slate-300"
                  >
                    {item.label}
                    <span className="text-[9px] font-semibold uppercase tracking-wide text-slate-300 bg-slate-50 rounded-full px-1.5 py-0.5">
                      Soon
                    </span>
                  </span>
                )
              )}
              <div className="pt-2 mt-2 border-t border-slate-100 flex flex-col gap-2">
                <Link
                  to="/login"
                  onClick={() => setMenuOpen(false)}
                  className="w-full text-center px-4 py-2.5 rounded-full text-sm font-medium text-slate-600 border border-slate-200 hover:bg-slate-50 transition-colors"
                >
                  Sign In
                </Link>
                <button
                  type="button"
                  disabled
                  aria-disabled="true"
                  className="w-full text-center px-4 py-2.5 rounded-full text-sm font-semibold text-white/70 bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] opacity-50 cursor-not-allowed"
                >
                  Submit Software
                </button>
              </div>
            </div>
          )}
        </div>
      </div>

      <GlobalSearch open={searchOpen} onClose={() => setSearchOpen(false)} />
    </header>
  );
}

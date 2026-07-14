import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Search, Menu, X } from 'lucide-react';
import GlobalSearch from './search/GlobalSearch';

interface NavItem {
  label: string;
  href?: string;
}

const LEGACY_NAV_ITEMS: NavItem[] = [
  { label: 'Categories', href: '/tool-categories' },
  { label: 'Compare', href: '/compare' },
  { label: 'Resources' },
  { label: 'For Vendors' },
];

const PREMIUM_NAV_ITEMS: { label: string; href: string }[] = [
  { label: 'Categories', href: '/tool-categories' },
];

interface SoftwareHeaderProps {
  /**
   * 'legacy' (default) renders the original nav untouched — used by
   * templates not yet migrated to the premium redesign (category and
   * compare pages). 'premium' is the Stripe/Linear-style header for the
   * /tools/* detail template: Categories-only nav plus an enabled
   * "Feature My Product" CTA instead of the disabled "Submit Software"
   * placeholder.
   */
  variant?: 'legacy' | 'premium';
}

export default function SoftwareHeader({ variant = 'legacy' }: SoftwareHeaderProps = {}) {
  const [menuOpen, setMenuOpen] = useState(false);
  const [searchOpen, setSearchOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const isPremium = variant === 'premium';

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

  useEffect(() => {
    if (!isPremium) return;
    function handleScroll() {
      setScrolled(window.scrollY > 4);
    }
    handleScroll();
    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, [isPremium]);

  function openSearch() {
    setMenuOpen(false);
    setSearchOpen(true);
  }

  if (isPremium) {
    return (
      <header
        className={`sticky top-0 z-40 bg-white border-b border-[#F1F3F5] transition-shadow duration-200 ${
          scrolled ? 'shadow-[0_1px_3px_rgba(15,23,42,0.06)]' : ''
        }`}
      >
        <div className="max-w-7xl mx-auto px-6 sm:px-8">
          {/* Desktop */}
          <div className="hidden md:flex items-center gap-8 h-[70px]">
            <Link to="/" aria-label="Gappsy home" className="shrink-0 flex items-center">
              <img src="/logos/Gappsy-Logo-4A5DFF-transparent-background.png" alt="Gappsy" className="h-7 w-auto" />
            </Link>

            <div className="flex-1 min-w-0 max-w-2xl">
              <button
                type="button"
                onClick={openSearch}
                aria-label="Search software"
                className="flex items-center w-full h-11 rounded-full bg-white border border-slate-200 pl-4 pr-2 gap-2 transition-all duration-150 hover:border-slate-300 hover:bg-slate-50/60 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#7C3AED]/20 text-left"
              >
                <Search className="w-4 h-4 text-slate-400 shrink-0" aria-hidden="true" />
                <span className="flex-1 min-w-0 text-sm text-slate-400">Search software...</span>
                <kbd className="hidden lg:inline-flex items-center justify-center h-5 px-1.5 rounded-md bg-slate-50 border border-slate-200 text-[10px] font-medium text-slate-400 shrink-0">
                  ⌘K
                </kbd>
              </button>
            </div>

            <nav aria-label="Software directory" className="flex items-center gap-1 shrink-0">
              {PREMIUM_NAV_ITEMS.map((item) => (
                <Link
                  key={item.label}
                  to={item.href}
                  className="px-4 py-2.5 rounded-full text-[15px] font-medium text-slate-700 hover:text-[#0B1221] hover:bg-slate-50 transition-colors"
                >
                  {item.label}
                </Link>
              ))}
            </nav>

            <div className="flex items-center gap-3 shrink-0">
              <Link
                to="/login"
                className="px-4 py-2 rounded-full text-[15px] font-medium text-slate-600 hover:text-[#0B1221] hover:bg-slate-50 transition-colors"
              >
                Sign In
              </Link>
              <Link
                to="/feature-my-product"
                className="inline-flex items-center gap-1.5 px-5 py-2.5 rounded-xl text-[15px] font-medium text-white bg-[#7C3AED] hover:bg-[#6D28D9] transition-colors"
              >
                Feature My Product
              </Link>
            </div>
          </div>

          {/* Mobile */}
          <div className="md:hidden">
            <div className="flex items-center justify-between h-16 gap-2">
              <div className="flex items-center gap-2 min-w-0">
                <button
                  type="button"
                  onClick={() => setMenuOpen((v) => !v)}
                  aria-expanded={menuOpen}
                  aria-label={menuOpen ? 'Close menu' : 'Open menu'}
                  className="w-9 h-9 shrink-0 rounded-full border border-slate-200 flex items-center justify-center text-slate-500"
                >
                  {menuOpen ? <X className="w-4 h-4" /> : <Menu className="w-4 h-4" />}
                </button>
                <Link to="/" aria-label="Gappsy home" className="shrink-0 flex items-center min-w-0">
                  <img src="/logos/Gappsy-Logo-4A5DFF-transparent-background.png" alt="Gappsy" className="h-6 w-auto" />
                </Link>
              </div>

              <div className="flex items-center gap-2 shrink-0">
                <button
                  type="button"
                  onClick={openSearch}
                  aria-label="Search software"
                  className="w-9 h-9 rounded-full border border-slate-200 flex items-center justify-center text-slate-500 hover:border-slate-300 transition-colors"
                >
                  <Search className="w-4 h-4" aria-hidden="true" />
                </button>
                <Link
                  to="/feature-my-product"
                  className="inline-flex items-center px-3 py-2 rounded-xl text-xs font-medium text-white bg-[#7C3AED] whitespace-nowrap"
                >
                  Feature
                </Link>
              </div>
            </div>

            {menuOpen && (
              <div className="pb-4 border-t border-slate-100 pt-3 space-y-1 animate-slideDown">
                {PREMIUM_NAV_ITEMS.map((item) => (
                  <Link
                    key={item.label}
                    to={item.href}
                    onClick={() => setMenuOpen(false)}
                    className="flex items-center px-3 py-2.5 rounded-xl text-sm font-medium text-slate-700 hover:bg-slate-50 hover:text-[#0B1221] transition-colors"
                  >
                    {item.label}
                  </Link>
                ))}
                <div className="pt-2 mt-2 border-t border-slate-100 flex flex-col gap-2">
                  <Link
                    to="/login"
                    onClick={() => setMenuOpen(false)}
                    className="w-full text-center px-4 py-2.5 rounded-full text-sm font-medium text-slate-600 border border-slate-200 hover:bg-slate-50 transition-colors"
                  >
                    Sign In
                  </Link>
                  <Link
                    to="/feature-my-product"
                    onClick={() => setMenuOpen(false)}
                    className="w-full text-center px-4 py-2.5 rounded-xl text-sm font-medium text-white bg-[#7C3AED] hover:bg-[#6D28D9] transition-colors"
                  >
                    Feature My Product
                  </Link>
                </div>
              </div>
            )}
          </div>
        </div>

        <GlobalSearch open={searchOpen} onClose={() => setSearchOpen(false)} />
      </header>
    );
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
            {LEGACY_NAV_ITEMS.map((item) =>
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
              {LEGACY_NAV_ITEMS.map((item) =>
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

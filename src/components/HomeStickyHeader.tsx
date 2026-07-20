import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Menu, X } from 'lucide-react';

// The homepage's own sticky header — visually mirrors SoftwareHeader's
// "premium" tool-page header (floating #0A1735 card, sticky, scroll shadow),
// kept deliberately minimal (logo + Sign In + Get Listed only, no nav links)
// and width-capped to match FooterWrapper's homepage card (900px) so header
// and footer read as the same width instead of the header floating narrower.
//
// "Get Listed" scrolls to the existing state-search box (#find-agency-search)
// rather than opening a submission flow directly: listing an agency is
// inherently state-scoped (SubmitAgencyModal needs a real stateName for its
// copy), and that flow already lives, fully built, on the state page each
// search result leads to — the homepage's job is just routing a visitor to
// their state first.
interface HomeStickyHeaderProps {
  /**
   * HomePage renders separate desktop and mobile JSX subtrees at the same
   * time (toggled via responsive classes, not conditionally mounted), each
   * with its own copy of the state-search box — so each needs its own
   * anchor id to scroll to, or two elements would share one id.
   */
  searchAnchorId?: string;
}

export default function HomeStickyHeader({ searchAnchorId = 'find-agency-search' }: HomeStickyHeaderProps) {
  const [menuOpen, setMenuOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const searchHref = `#${searchAnchorId}`;

  useEffect(() => {
    function handleScroll() {
      setScrolled(window.scrollY > 4);
    }
    handleScroll();
    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  function closeMenu() {
    setMenuOpen(false);
  }

  return (
    // Sticky from md: up only — below md, the existing TopAdRail is already
    // sticky at top-0 with a higher z-index, and stacking both would overlap.
    // Deliberately NOT wrapped in a snug margin-only div at the call site —
    // a sticky element can only "travel" within its parent's box, so it
    // needs a parent that spans the full scrollable content, not one sized
    // to fit just the header. mb-6 here (instead of on a wrapper) keeps the
    // visual gap before the hero without reintroducing that wrapper.
    <header className="static md:sticky md:top-3 z-40 mb-6">
      {/* Edge-to-edge on mobile (no inset, no rounding), matching
          Top25Header's mobile bar — the floating inset/rounded card is a
          md:+ (desktop) treatment only. */}
      <div className="max-w-full md:max-w-[900px] mx-auto px-0 md:px-6">
        <div className={`rounded-none md:rounded-2xl bg-[#0A1735] shadow-lg overflow-hidden transition-shadow duration-200 ${scrolled ? 'shadow-xl' : ''}`}>
          <div className="px-4 md:px-6">
            {/* Desktop */}
            <div className="hidden md:flex items-center justify-between h-14 gap-4">
              <Link to="/" aria-label="Gappsy home" className="shrink-0 flex items-center">
                <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-9 w-auto" />
              </Link>

              <div className="flex items-center gap-2 shrink-0">
                <Link
                  to="/login/apps"
                  className="px-3.5 py-2 rounded-xl text-sm font-medium text-white border border-white/30 hover:bg-white/10 transition-colors"
                >
                  Sign In
                </Link>
                <a
                  href={searchHref}
                  className="inline-flex items-center px-4 py-2 rounded-xl text-sm font-medium text-[#0A1735] bg-white hover:bg-slate-100 transition-colors whitespace-nowrap"
                >
                  Get Listed
                </a>
              </div>
            </div>

            {/* Mobile */}
            <div className="md:hidden">
              <div className="flex items-center justify-between h-14 gap-2">
                <div className="flex items-center gap-2 min-w-0">
                  <button
                    type="button"
                    onClick={() => setMenuOpen((v) => !v)}
                    aria-expanded={menuOpen}
                    aria-label={menuOpen ? 'Close menu' : 'Open menu'}
                    className="w-9 h-9 shrink-0 rounded-full border border-white/20 flex items-center justify-center text-white"
                  >
                    {menuOpen ? <X className="w-4 h-4" /> : <Menu className="w-4 h-4" />}
                  </button>
                  <Link to="/" aria-label="Gappsy home" className="shrink-0 flex items-center min-w-0">
                    <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-7 w-auto" />
                  </Link>
                </div>

                <a
                  href={searchHref}
                  className="inline-flex items-center px-3 py-2 rounded-xl text-xs font-medium text-[#0A1735] bg-white whitespace-nowrap shrink-0"
                >
                  Get Listed
                </a>
              </div>

              {menuOpen && (
                <div className="pb-4 border-t border-white/10 pt-3 space-y-1 animate-slideDown">
                  <div>
                    <p className="px-3 pt-2 pb-1 text-[11px] font-semibold uppercase tracking-wide text-white/40">Gappsy Software</p>
                    <Link to="/appbuilder" onClick={closeMenu} className="flex items-center px-3 py-2.5 rounded-xl text-sm font-medium text-white/80 hover:bg-white/10 hover:text-white transition-colors">
                      Gappsy Appbuilder
                    </Link>
                    <Link to="/proof" onClick={closeMenu} className="flex items-center px-3 py-2.5 rounded-xl text-sm font-medium text-white/80 hover:bg-white/10 hover:text-white transition-colors">
                      Gappsy Proof
                    </Link>
                    <Link to="/analytics" onClick={closeMenu} className="flex items-center px-3 py-2.5 rounded-xl text-sm font-medium text-white/80 hover:bg-white/10 hover:text-white transition-colors">
                      Gappsy Analytics
                    </Link>
                  </div>
                  <div className="pt-2 mt-2 border-t border-white/10">
                    <Link
                      to="/login/apps"
                      onClick={closeMenu}
                      className="w-full inline-flex items-center justify-center text-center px-4 py-2.5 rounded-xl text-sm font-medium text-white border border-white/20 hover:bg-white/10 transition-colors"
                    >
                      Sign In
                    </Link>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}

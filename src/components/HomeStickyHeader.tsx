import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

// The homepage's own sticky header — visually mirrors SoftwareHeader's
// "premium" tool-page header (floating #0A1735 card, sticky, scroll shadow),
// kept deliberately minimal (logo + Sign In + Get Listed only, no nav links,
// no hamburger menu). Same compact, fit-to-content pill on every breakpoint
// — it deliberately does NOT go edge-to-edge on mobile/tablet the way many
// mobile headers do; it's the same floating card at every width.
//
// "Get Listed" goes to /get-listed, a short branching page: listing a
// software tool vs. a marketing agency are two entirely different flows
// (the agency one is state-scoped — SubmitAgencyModal needs a real
// stateName/stateSlug — while software goes straight to
// /feature-my-product), so the homepage button just hands off the choice
// instead of assuming one.
export default function HomeStickyHeader() {
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    function handleScroll() {
      setScrolled(window.scrollY > 4);
    }
    handleScroll();
    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    // Sticky from md: up only — below md, the existing TopAdRail is already
    // sticky at top-0 with a higher z-index, and stacking both would overlap.
    // Deliberately NOT wrapped in a snug margin-only div at the call site —
    // a sticky element can only "travel" within its parent's box, so it
    // needs a parent that spans the full scrollable content, not one sized
    // to fit just the header. mb-6 here (instead of on a wrapper) keeps the
    // visual gap before the hero without reintroducing that wrapper.
    <header className="static md:sticky md:top-3 z-40 mb-6">
      <div className="max-w-fit mx-auto px-0">
        <div className={`rounded-2xl bg-[#0A1735] shadow-lg overflow-hidden transition-shadow duration-200 ${scrolled ? 'shadow-xl' : ''}`}>
          <div className="flex items-center gap-4 sm:gap-8 md:gap-10 h-12 px-4 sm:px-5">
            <Link to="/" aria-label="Gappsy home" className="shrink-0 flex items-center">
              <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-7 sm:h-8 w-auto" />
            </Link>

            <div className="flex items-center gap-1.5 sm:gap-2 shrink-0">
              <Link
                to="/login"
                className="px-2.5 sm:px-3.5 py-1.5 rounded-xl text-[13px] sm:text-sm font-medium text-white border border-white/30 hover:bg-white/10 transition-colors whitespace-nowrap"
              >
                Sign In
              </Link>
              <Link
                to="/get-listed"
                className="inline-flex items-center px-3 sm:px-4 py-1.5 rounded-xl text-[13px] sm:text-sm font-medium text-[#0A1735] bg-white hover:bg-slate-100 transition-colors whitespace-nowrap"
              >
                Get Listed
              </Link>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}

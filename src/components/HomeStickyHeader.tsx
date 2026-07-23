import { Link } from 'react-router-dom';

// The homepage's own header — visually mirrors SoftwareHeader's "premium"
// tool-page header (floating #0A1735 card) but sits in normal document flow
// rather than sticking to the viewport on scroll, kept deliberately minimal
// (logo + Sign In + Get Listed only, no nav links, no hamburger menu). Same
// compact, fit-to-content pill on every breakpoint — it deliberately does
// NOT go edge-to-edge on mobile/tablet the way many mobile headers do; it's
// the same floating card at every width.
//
// "Get Listed" goes to /get-listed, a short branching page: listing a
// software tool vs. a marketing agency are two entirely different flows
// (the agency one is state-scoped — SubmitAgencyModal needs a real
// stateName/stateSlug — while software goes straight to
// /list-your-product), so the homepage button just hands off the choice
// instead of assuming one.
export default function HomeStickyHeader() {
  return (
    <header className="static z-40 mb-6">
      <div className="max-w-fit mx-auto px-0">
        <div className="rounded-2xl bg-[#0A1735] shadow-lg overflow-hidden">
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

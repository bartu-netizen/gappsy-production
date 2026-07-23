import { useMemo, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Package, Building2, ArrowRight, ArrowLeft, Search, MapPin } from 'lucide-react';
import { useNoindex } from '../components/NoindexMeta';
import { US_STATES } from '../lib/usStates';

// A short branching step between the homepage's "Get Listed" CTA and the
// two, very different listing flows that already exist: a software tool
// goes straight to /list-your-product, while a marketing agency listing
// is inherently state-scoped (the Top 25 submission form lives on each
// state's own page — see StatePageTemplate.tsx's SubmitAgencyModal). This
// page's only job is asking "which one" and, for agencies, "which state,"
// then handing off — it owns no submission logic itself.
//
// Full-viewport, no-scroll split screen by design (explicit ask): software
// on the left, agencies on the right, each panel filling exactly half the
// screen on desktop and half the height on mobile — everything visible at
// once, nothing to scroll past.
type AgencyStep = 'pick' | 'state';

export default function GetListedPage() {
  useNoindex();
  const navigate = useNavigate();
  const [agencyStep, setAgencyStep] = useState<AgencyStep>('pick');
  const [query, setQuery] = useState('');

  const filteredStates = useMemo(() => {
    const normalized = query.trim().toLowerCase();
    if (!normalized) return US_STATES;
    return US_STATES.filter(
      (s) => s.name.toLowerCase().includes(normalized) || s.abbr.toLowerCase() === normalized
    );
  }, [query]);

  function goToState(slug: string) {
    navigate(`/marketing-agencies-in-${slug}-united-states/?submit=1`);
  }

  return (
    <div className="h-[100dvh] w-full overflow-hidden bg-[#05070F] flex flex-col">
      <header className="shrink-0 h-12 sm:h-14 flex items-center justify-center relative z-10">
        <Link to="/" aria-label="Gappsy home" className="inline-flex items-center">
          <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-6 sm:h-7 w-auto opacity-90" />
        </Link>
      </header>

      <main className="flex-1 min-h-0 flex flex-col lg:flex-row relative">
        {/* Software Tool — left / top half */}
        <Link
          to="/list-your-product"
          className="group relative flex-1 min-h-0 flex items-center justify-center overflow-hidden border-b lg:border-b-0 lg:border-r border-white/10 transition-colors"
          style={{ background: 'radial-gradient(120% 100% at 30% 20%, #1B2A5E 0%, #0A1735 55%, #060B1F 100%)' }}
        >
          <div
            className="pointer-events-none absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
            style={{ background: 'radial-gradient(60% 60% at 30% 30%, rgba(124,110,255,0.25), transparent)' }}
            aria-hidden="true"
          />
          <div className="relative z-10 flex flex-col items-center text-center px-6 sm:px-10 max-w-sm">
            <div className="w-14 h-14 sm:w-16 sm:h-16 rounded-2xl bg-white/10 backdrop-blur-sm flex items-center justify-center mb-4 sm:mb-5 group-hover:scale-105 group-hover:bg-white/15 transition-all duration-300">
              <Package className="w-7 h-7 sm:w-8 sm:h-8 text-white" aria-hidden="true" />
            </div>
            <h2 className="text-xl sm:text-2xl lg:text-3xl font-bold text-white tracking-tight">Software Tool</h2>
            <p className="text-[13px] sm:text-sm text-white/50 mt-2 leading-relaxed">
              Feature your SaaS or software product to buyers already comparing tools like yours.
            </p>
            <span className="mt-5 sm:mt-6 inline-flex items-center gap-1.5 text-[13px] sm:text-sm font-semibold text-white bg-white/10 group-hover:bg-white/20 rounded-full px-4 py-2 transition-colors">
              Get started
              <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-0.5 transition-transform" aria-hidden="true" />
            </span>
          </div>
        </Link>

        {/* Marketing Agency — right / bottom half */}
        <div
          className="relative flex-1 min-h-0 flex items-center justify-center overflow-hidden"
          style={{ background: 'radial-gradient(120% 100% at 70% 20%, #3A2A6E 0%, #241547 55%, #0F0A1F 100%)' }}
        >
          {agencyStep === 'pick' ? (
            <button
              type="button"
              onClick={() => setAgencyStep('state')}
              className="group relative w-full h-full flex items-center justify-center"
            >
              <div
                className="pointer-events-none absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
                style={{ background: 'radial-gradient(60% 60% at 70% 30%, rgba(200,110,255,0.22), transparent)' }}
                aria-hidden="true"
              />
              <div className="relative z-10 flex flex-col items-center text-center px-6 sm:px-10 max-w-sm">
                <div className="w-14 h-14 sm:w-16 sm:h-16 rounded-2xl bg-white/10 backdrop-blur-sm flex items-center justify-center mb-4 sm:mb-5 group-hover:scale-105 group-hover:bg-white/15 transition-all duration-300">
                  <Building2 className="w-7 h-7 sm:w-8 sm:h-8 text-white" aria-hidden="true" />
                </div>
                <h2 className="text-xl sm:text-2xl lg:text-3xl font-bold text-white tracking-tight">Marketing Agency</h2>
                <p className="text-[13px] sm:text-sm text-white/50 mt-2 leading-relaxed">
                  Get featured in your state's Top 25 agencies, seen by local businesses ready to hire.
                </p>
                <span className="mt-5 sm:mt-6 inline-flex items-center gap-1.5 text-[13px] sm:text-sm font-semibold text-white bg-white/10 group-hover:bg-white/20 rounded-full px-4 py-2 transition-colors">
                  Choose your state
                  <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-0.5 transition-transform" aria-hidden="true" />
                </span>
              </div>
            </button>
          ) : (
            <div className="relative z-10 w-full h-full flex flex-col px-5 sm:px-8 py-4 sm:py-6">
              <button
                type="button"
                onClick={() => setAgencyStep('pick')}
                className="shrink-0 inline-flex items-center gap-1 text-[12px] font-medium text-white/50 hover:text-white/80 transition-colors mb-2 sm:mb-3 self-start"
              >
                <ArrowLeft className="w-3.5 h-3.5" aria-hidden="true" />
                Back
              </button>

              <div className="flex-1 min-h-0 flex flex-col items-center pt-3 sm:pt-6">
                <h2 className="shrink-0 text-base sm:text-lg font-bold text-white tracking-tight text-center mb-3">Which state?</h2>

                <div className="shrink-0 relative max-w-xs w-full">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-white/40 z-10" aria-hidden="true" />
                  <input
                    type="text"
                    value={query}
                    onChange={(e) => setQuery(e.target.value)}
                    placeholder="Type your state…"
                    autoFocus
                    className="relative w-full h-10 rounded-lg bg-white/10 border border-white/15 pl-9 pr-3 text-sm text-white placeholder-white/40 focus:outline-none focus:ring-2 focus:ring-white/20 focus:border-white/30 transition-shadow"
                  />

                  {/* Results float as a self-contained overlay (its own bounded
                      scroll, like a native <select>) — never grows the page,
                      never pushes layout, so the split screen itself never scrolls. */}
                  {query.trim() && (
                    <div className="absolute left-0 right-0 top-full mt-1.5 max-h-36 sm:max-h-52 overflow-y-auto rounded-lg bg-[#1a1030] border border-white/15 shadow-2xl z-20">
                      {filteredStates.length === 0 ? (
                        <p className="text-center text-[12.5px] text-white/40 py-4">No states match "{query}"</p>
                      ) : (
                        filteredStates.map((state) => (
                          <button
                            key={state.slug}
                            type="button"
                            onClick={() => goToState(state.slug)}
                            className="group/state w-full flex items-center gap-2 px-3 py-2 text-left hover:bg-white/10 transition-colors"
                          >
                            <MapPin className="w-3 h-3 shrink-0 text-white/30" aria-hidden="true" />
                            <span className="flex-1 min-w-0 text-[12.5px] font-medium text-white/85 truncate">{state.name}</span>
                            <ArrowRight className="w-3 h-3 shrink-0 text-white/0 group-hover/state:text-white/50 group-hover/state:translate-x-0.5 transition-all" aria-hidden="true" />
                          </button>
                        ))
                      )}
                    </div>
                  )}
                </div>

                <p className="shrink-0 text-[11.5px] text-white/30 mt-3">Start typing to find your state</p>
              </div>
            </div>
          )}
        </div>

        {/* Center divider badge — desktop only, straddles the seam between panels */}
        <div className="hidden lg:flex absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-20 w-11 h-11 rounded-full bg-[#05070F] border border-white/15 items-center justify-center pointer-events-none">
          <span className="text-[11px] font-bold text-white/40 uppercase tracking-wide">or</span>
        </div>
      </main>
    </div>
  );
}

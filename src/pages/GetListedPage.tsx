import { Link } from 'react-router-dom';
import { Package, Building2, ArrowRight } from 'lucide-react';
import { useNoindex } from '../components/NoindexMeta';

// A short branching step between the homepage's "Get Listed" CTA and the
// two, very different listing flows that already exist: a software tool
// goes straight to /list-your-product, while a marketing agency listing
// is inherently state-scoped — picking a state happens on /marketing-agencies/usa
// (USAHub.tsx), the same real page + StatePickerModal Top25Header's own
// "list your agency" button already uses, just triggered here via
// ?submit=1 instead of a same-page event. This page's only job is asking
// "which one," then handing off — it owns no submission logic itself.
//
// Full-viewport, no-scroll split screen by design (explicit ask): software
// on the left, agencies on the right, each panel filling exactly half the
// screen on desktop and half the height on mobile — everything visible at
// once, nothing to scroll past.
export default function GetListedPage() {
  useNoindex();

  return (
    <div className="h-[100dvh] w-full overflow-hidden bg-[#05070F] flex flex-col">
      <header className="shrink-0 w-full h-14 sm:h-16 bg-[#0A1735] shadow-lg flex items-center justify-center relative z-10">
        <Link to="/" aria-label="Gappsy home" className="inline-flex items-center">
          <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-6 sm:h-7 w-auto" />
        </Link>
      </header>

      <main className="flex-1 min-h-0 flex flex-col lg:flex-row relative">
        {/* Software Tool — left / top half */}
        <Link
          to="/list-your-product"
          className="group relative flex-1 min-h-0 flex items-center justify-center overflow-hidden border-b lg:border-b-0 lg:border-r border-white/10 transition-colors"
          style={{ background: 'radial-gradient(120% 100% at 30% 20%, #12836E 0%, #0A3B32 55%, #04140F 100%)' }}
        >
          <div
            className="pointer-events-none absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
            style={{ background: 'radial-gradient(60% 60% at 30% 30%, rgba(45,212,175,0.28), transparent)' }}
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
        <Link
          to="/marketing-agencies/usa?submit=1"
          className="group relative flex-1 min-h-0 flex items-center justify-center overflow-hidden transition-colors"
          style={{ background: 'radial-gradient(120% 100% at 70% 20%, #9A5A1E 0%, #4A2A12 55%, #170D06 100%)' }}
        >
          <div
            className="pointer-events-none absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
            style={{ background: 'radial-gradient(60% 60% at 70% 30%, rgba(255,170,90,0.28), transparent)' }}
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
              Get started
              <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-0.5 transition-transform" aria-hidden="true" />
            </span>
          </div>
        </Link>

        {/* Center divider badge — desktop only, straddles the seam between panels */}
        <div className="hidden lg:flex absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-20 w-11 h-11 rounded-full bg-[#05070F] border border-white/15 items-center justify-center pointer-events-none">
          <span className="text-[11px] font-bold text-white/40 uppercase tracking-wide">or</span>
        </div>
      </main>
    </div>
  );
}

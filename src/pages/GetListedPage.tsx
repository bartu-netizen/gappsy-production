import { useMemo, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Package, Building2, ArrowRight, ArrowLeft, Search, MapPin } from 'lucide-react';
import { useNoindex } from '../components/NoindexMeta';
import { US_STATES } from '../lib/usStates';

// A short branching step between the homepage's "Get Listed" CTA and the
// two, very different listing flows that already exist: a software tool
// goes straight to /feature-my-product, while a marketing agency listing
// is inherently state-scoped (the Top 25 submission form lives on each
// state's own page — see StatePageTemplate.tsx's SubmitAgencyModal). This
// page's only job is asking "which one" and, for agencies, "which state,"
// then handing off — it owns no submission logic itself.
type Step = 'choose' | 'state';

export default function GetListedPage() {
  useNoindex();
  const navigate = useNavigate();
  const [step, setStep] = useState<Step>('choose');
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
    <div className="min-h-screen bg-[#0A1735] flex flex-col relative overflow-hidden">
      <div
        className="pointer-events-none absolute inset-0 opacity-60"
        style={{ background: 'radial-gradient(60% 50% at 50% 0%, rgba(79,71,230,0.2), transparent)' }}
        aria-hidden="true"
      />

      <header className="flex items-center justify-center pt-6 lg:pt-8 pb-2 relative">
        <Link to="/" aria-label="Gappsy home" className="inline-flex items-center">
          <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-9 lg:h-10 w-auto" />
        </Link>
      </header>

      <main className="flex-1 flex items-start justify-center px-4 pt-4 lg:pt-6 pb-10 relative">
        <div className="w-full max-w-md">
          {step === 'choose' ? (
            <div className="bg-white rounded-3xl p-7 shadow-[0_24px_48px_rgba(0,0,0,0.25)]">
              <h1 className="text-xl font-bold text-[#0B1221] tracking-tight text-center">What would you like to list?</h1>
              <p className="text-[13px] text-slate-500 mt-1.5 mb-6 text-center leading-relaxed">
                We'll take you straight to the right place.
              </p>

              <div className="space-y-3">
                <Link
                  to="/feature-my-product"
                  className="group flex items-center gap-3.5 w-full rounded-2xl border border-slate-200 hover:border-[#0A1735] p-4 text-left transition-colors"
                >
                  <div className="w-11 h-11 shrink-0 rounded-xl bg-[#EEF0FE] flex items-center justify-center">
                    <Package className="w-5 h-5 text-[#0A1735]" aria-hidden="true" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-bold text-[#0B1221]">Software Tool</p>
                    <p className="text-[12.5px] text-slate-500 leading-snug">Feature your SaaS or software product</p>
                  </div>
                  <ArrowRight className="w-4 h-4 text-slate-300 group-hover:text-[#0A1735] group-hover:translate-x-0.5 transition-all shrink-0" aria-hidden="true" />
                </Link>

                <button
                  type="button"
                  onClick={() => setStep('state')}
                  className="group flex items-center gap-3.5 w-full rounded-2xl border border-slate-200 hover:border-[#0A1735] p-4 text-left transition-colors"
                >
                  <div className="w-11 h-11 shrink-0 rounded-xl bg-[#EEF0FE] flex items-center justify-center">
                    <Building2 className="w-5 h-5 text-[#0A1735]" aria-hidden="true" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-bold text-[#0B1221]">Marketing Agency</p>
                    <p className="text-[12.5px] text-slate-500 leading-snug">Get featured in your state's Top 25</p>
                  </div>
                  <ArrowRight className="w-4 h-4 text-slate-300 group-hover:text-[#0A1735] group-hover:translate-x-0.5 transition-all shrink-0" aria-hidden="true" />
                </button>
              </div>
            </div>
          ) : (
            <div className="bg-white rounded-3xl p-7 shadow-[0_24px_48px_rgba(0,0,0,0.25)] animate-slideDown">
              <button
                type="button"
                onClick={() => setStep('choose')}
                className="inline-flex items-center gap-1 text-[12.5px] font-medium text-slate-400 hover:text-slate-600 transition-colors mb-3"
              >
                <ArrowLeft className="w-3.5 h-3.5" aria-hidden="true" />
                Back
              </button>

              <h1 className="text-xl font-bold text-[#0B1221] tracking-tight text-center">Which state?</h1>
              <p className="text-[13px] text-slate-500 mt-1.5 mb-5 text-center leading-relaxed">
                We'll open the Top 25 submission form for that state.
              </p>

              <div className="relative mb-3">
                <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" aria-hidden="true" />
                <input
                  type="text"
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                  placeholder="Search states…"
                  autoFocus
                  className="w-full h-11 rounded-xl border border-slate-200 pl-10 pr-3 text-sm text-[#0B1221] placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/15 focus:border-[#0A1735]/40 transition-shadow"
                />
              </div>

              <div className="max-h-[320px] overflow-y-auto -mx-1 px-1 space-y-1">
                {filteredStates.length === 0 ? (
                  <p className="text-center text-[13px] text-slate-400 py-6">No states match "{query}"</p>
                ) : (
                  filteredStates.map((state) => (
                    <button
                      key={state.slug}
                      type="button"
                      onClick={() => goToState(state.slug)}
                      className="group flex items-center gap-3 w-full rounded-xl px-3 py-2.5 text-left hover:bg-slate-50 transition-colors"
                    >
                      <div className="w-8 h-8 shrink-0 rounded-lg bg-slate-100 flex items-center justify-center">
                        <MapPin className="w-3.5 h-3.5 text-slate-400" aria-hidden="true" />
                      </div>
                      <span className="flex-1 text-sm font-medium text-[#0B1221]">{state.name}</span>
                      <ArrowRight className="w-3.5 h-3.5 text-slate-300 group-hover:text-[#0A1735] group-hover:translate-x-0.5 transition-all shrink-0" aria-hidden="true" />
                    </button>
                  ))
                )}
              </div>
            </div>
          )}

          <p className="text-center mt-6">
            <Link to="/" className="text-[13px] text-white/50 hover:text-white/80 transition-colors">← Back to Gappsy</Link>
          </p>
        </div>
      </main>
    </div>
  );
}

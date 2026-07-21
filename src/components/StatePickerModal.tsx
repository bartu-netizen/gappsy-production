import { useMemo, useState } from 'react';
import { ArrowRight, MapPin, Search, X } from 'lucide-react';
import { US_STATES } from '../lib/usStates';

interface StatePickerModalProps {
  open: boolean;
  onClose: () => void;
  title: string;
  subtitle: string;
  onSelectState: (slug: string) => void;
}

// Same "which state?" search-and-pick UI as GetListedPage's agency step,
// but as a modal so it can be triggered from anywhere a stateSlug isn't
// already known — e.g. USAHub.tsx's Find/List Agency header buttons, which
// have no single state to hand a per-state modal (GetMatchedModal /
// SubmitAgencyModal) the way StatePageTemplate.tsx does.
export default function StatePickerModal({ open, onClose, title, subtitle, onSelectState }: StatePickerModalProps) {
  const [query, setQuery] = useState('');

  const filteredStates = useMemo(() => {
    const normalized = query.trim().toLowerCase();
    if (!normalized) return US_STATES;
    return US_STATES.filter(
      (s) => s.name.toLowerCase().includes(normalized) || s.abbr.toLowerCase() === normalized
    );
  }, [query]);

  if (!open) return null;

  return (
    <div className="fixed inset-0 z-[60] flex items-start sm:items-center justify-center p-4 pt-16 sm:pt-4">
      <div className="absolute inset-0 bg-[#0A1735]/60 backdrop-blur-sm" onClick={onClose} aria-hidden="true" />
      <div className="relative w-full max-w-md bg-white rounded-3xl p-7 shadow-[0_24px_48px_rgba(0,0,0,0.25)] animate-slideDown">
        <button
          type="button"
          onClick={onClose}
          aria-label="Close"
          className="absolute top-4 right-4 w-8 h-8 rounded-full flex items-center justify-center text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors"
        >
          <X className="w-4 h-4" aria-hidden="true" />
        </button>

        <h2 className="text-xl font-bold text-[#0B1221] tracking-tight text-center">{title}</h2>
        <p className="text-[13px] text-slate-500 mt-1.5 mb-5 text-center leading-relaxed px-4">{subtitle}</p>

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
                onClick={() => onSelectState(state.slug)}
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
    </div>
  );
}

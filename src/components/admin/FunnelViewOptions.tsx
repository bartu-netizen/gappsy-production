import { useState, useRef, useEffect } from 'react';
import { Settings2, Check } from 'lucide-react';

export interface ViewPrefs {
  cards: {
    agencies: boolean;
    sessions: boolean;
    uniqueVisitors: boolean;
    demos: boolean;
    purchases: boolean;
    revenue: boolean;
  };
  panels: {
    entryPath: boolean;
    conversionRate: boolean;
    perAgency: boolean;
    salesInsights: boolean;
    recentActivity: boolean;
  };
  columns: {
    time: boolean;
    scroll: boolean;
    demo: boolean;
    checkout: boolean;
    paid: boolean;
    revenue: boolean;
    dropOff: boolean;
  };
}

const STORAGE_KEY = 'gappsy-funnel-view-prefs';

export const DEFAULT_PREFS: ViewPrefs = {
  cards: {
    agencies: true,
    sessions: true,
    uniqueVisitors: true,
    demos: true,
    purchases: true,
    revenue: true,
  },
  panels: {
    entryPath: true,
    conversionRate: true,
    perAgency: true,
    salesInsights: true,
    recentActivity: true,
  },
  columns: {
    time: true,
    scroll: true,
    demo: true,
    checkout: true,
    paid: true,
    revenue: true,
    dropOff: true,
  },
};

export function loadViewPrefs(): ViewPrefs {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return DEFAULT_PREFS;
    const parsed = JSON.parse(raw);
    return {
      cards: { ...DEFAULT_PREFS.cards, ...parsed.cards },
      panels: { ...DEFAULT_PREFS.panels, ...parsed.panels },
      columns: { ...DEFAULT_PREFS.columns, ...parsed.columns },
    };
  } catch {
    return DEFAULT_PREFS;
  }
}

export function saveViewPrefs(prefs: ViewPrefs): void {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(prefs));
}

const CARD_LABELS: Record<keyof ViewPrefs['cards'], string> = {
  agencies: 'Agencies card',
  sessions: 'Sessions card',
  uniqueVisitors: 'Unique visitors card',
  demos: 'Demos card',
  purchases: 'Purchases card',
  revenue: 'Revenue card',
};

const PANEL_LABELS: Record<keyof ViewPrefs['panels'], string> = {
  entryPath: 'Entry path split',
  conversionRate: 'Conversion rate',
  perAgency: 'Per-agency breakdown',
  salesInsights: 'Sales insights',
  recentActivity: 'Recent activity',
};

const COLUMN_LABELS: Record<keyof ViewPrefs['columns'], string> = {
  time: 'Time column',
  scroll: 'Scroll column',
  demo: 'Demo column',
  checkout: 'Checkout column',
  paid: 'Paid column',
  revenue: 'Revenue column',
  dropOff: 'Drop-off column',
};

function ToggleRow({
  label,
  checked,
  onChange,
}: {
  label: string;
  checked: boolean;
  onChange: (v: boolean) => void;
}) {
  return (
    <button
      onClick={() => onChange(!checked)}
      className="flex items-center gap-2 w-full px-3 py-1.5 text-left hover:bg-slate-50 transition-colors rounded"
    >
      <span
        className={`flex items-center justify-center w-4 h-4 rounded border transition-colors flex-shrink-0 ${
          checked
            ? 'bg-slate-900 border-slate-900'
            : 'bg-white border-slate-300'
        }`}
      >
        {checked && <Check className="w-3 h-3 text-white" strokeWidth={3} />}
      </span>
      <span className="text-xs text-slate-700">{label}</span>
    </button>
  );
}

export function ViewOptionsDropdown({
  prefs,
  onChange,
}: {
  prefs: ViewPrefs;
  onChange: (prefs: ViewPrefs) => void;
}) {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!open) return;
    function handleClick(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) {
        setOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClick);
    return () => document.removeEventListener('mousedown', handleClick);
  }, [open]);

  function toggleCard(key: keyof ViewPrefs['cards']) {
    const next = { ...prefs, cards: { ...prefs.cards, [key]: !prefs.cards[key] } };
    onChange(next);
  }
  function togglePanel(key: keyof ViewPrefs['panels']) {
    const next = { ...prefs, panels: { ...prefs.panels, [key]: !prefs.panels[key] } };
    onChange(next);
  }
  function toggleColumn(key: keyof ViewPrefs['columns']) {
    const next = { ...prefs, columns: { ...prefs.columns, [key]: !prefs.columns[key] } };
    onChange(next);
  }

  return (
    <div className="relative" ref={ref}>
      <button
        onClick={() => setOpen(!open)}
        className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-medium transition-colors border ${
          open
            ? 'bg-slate-900 text-white border-slate-900'
            : 'bg-white text-slate-600 border-slate-200 hover:bg-slate-50'
        }`}
      >
        <Settings2 className="w-3.5 h-3.5" />
        View Options
      </button>

      {open && (
        <div className="absolute right-0 top-full mt-1.5 w-64 bg-white rounded-xl border border-slate-200 shadow-xl z-50 py-2 max-h-[70vh] overflow-y-auto">
          <div className="px-3 py-1.5">
            <span className="text-[10px] font-semibold uppercase tracking-wider text-slate-400">
              Metric Cards
            </span>
          </div>
          {(Object.keys(CARD_LABELS) as Array<keyof ViewPrefs['cards']>).map((key) => (
            <ToggleRow
              key={key}
              label={CARD_LABELS[key]}
              checked={prefs.cards[key]}
              onChange={() => toggleCard(key)}
            />
          ))}

          <div className="border-t border-slate-100 mt-1.5 pt-1.5 px-3 py-1.5">
            <span className="text-[10px] font-semibold uppercase tracking-wider text-slate-400">
              Panels
            </span>
          </div>
          {(Object.keys(PANEL_LABELS) as Array<keyof ViewPrefs['panels']>).map((key) => (
            <ToggleRow
              key={key}
              label={PANEL_LABELS[key]}
              checked={prefs.panels[key]}
              onChange={() => togglePanel(key)}
            />
          ))}

          <div className="border-t border-slate-100 mt-1.5 pt-1.5 px-3 py-1.5">
            <span className="text-[10px] font-semibold uppercase tracking-wider text-slate-400">
              Table Columns
            </span>
          </div>
          {(Object.keys(COLUMN_LABELS) as Array<keyof ViewPrefs['columns']>).map((key) => (
            <ToggleRow
              key={key}
              label={COLUMN_LABELS[key]}
              checked={prefs.columns[key]}
              onChange={() => toggleColumn(key)}
            />
          ))}
        </div>
      )}
    </div>
  );
}

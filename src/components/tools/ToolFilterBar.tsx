import { ChevronDown } from 'lucide-react';

export type ToolSortOption = 'recommended' | 'rating' | 'reviews' | 'newest';

export interface ToolFilterState {
  freePlan: boolean;
  freeTrial: boolean;
  api: boolean;
  platform: string | null;
  pricing: string | null;
}

const SORT_LABELS: Record<ToolSortOption, string> = {
  recommended: 'Recommended',
  rating: 'Highest rated',
  reviews: 'Most reviewed',
  newest: 'Newest',
};

interface ToolFilterBarProps {
  sort: ToolSortOption;
  onSortChange: (sort: ToolSortOption) => void;
  filters: ToolFilterState;
  onToggleFilter: (key: 'freePlan' | 'freeTrial' | 'api') => void;
  platforms: { slug: string; label: string }[];
  onPlatformChange: (platform: string | null) => void;
  pricingOptions: string[];
  onPricingChange: (pricing: string | null) => void;
  resultCount: number;
  isFiltered: boolean;
  onReset: () => void;
}

// Reusable sort/filter control for any tool list backed by real DB values —
// used by the category detail page today, designed to be dropped onto tag
// pages or a future Discover surface without changes. Every option here maps
// to a real, queryable signal (rating, review_count, created_at, tag slugs,
// pricing_model) — nothing here is a fabricated "trending" style label.
export default function ToolFilterBar({
  sort,
  onSortChange,
  filters,
  onToggleFilter,
  platforms,
  onPlatformChange,
  pricingOptions,
  onPricingChange,
  resultCount,
  isFiltered,
  onReset,
}: ToolFilterBarProps) {
  return (
    <div className="flex flex-col sm:flex-row sm:items-center gap-3 sm:gap-4 mb-6">
      <div className="flex items-center gap-2 flex-wrap flex-1 min-w-0">
        <FilterPill active={filters.freePlan} onClick={() => onToggleFilter('freePlan')}>
          Free plan
        </FilterPill>
        <FilterPill active={filters.freeTrial} onClick={() => onToggleFilter('freeTrial')}>
          Free trial
        </FilterPill>
        <FilterPill active={filters.api} onClick={() => onToggleFilter('api')}>
          API available
        </FilterPill>

        {platforms.length > 0 && (
          <SelectPill
            value={filters.platform || ''}
            onChange={(v) => onPlatformChange(v || null)}
            placeholder="Platform"
            options={platforms.map((p) => ({ value: p.slug, label: p.label }))}
          />
        )}

        {pricingOptions.length > 0 && (
          <SelectPill
            value={filters.pricing || ''}
            onChange={(v) => onPricingChange(v || null)}
            placeholder="Pricing"
            options={pricingOptions.map((p) => ({ value: p, label: p }))}
          />
        )}

        {isFiltered && (
          <button type="button" onClick={onReset} className="text-xs font-medium text-slate-400 hover:text-slate-600 px-2 py-1.5">
            Reset
          </button>
        )}
      </div>

      <div className="flex items-center gap-2 shrink-0">
        <span className="text-xs text-slate-400 hidden sm:inline">{resultCount} result{resultCount === 1 ? '' : 's'}</span>
        <div className="relative">
          <select
            value={sort}
            onChange={(e) => onSortChange(e.target.value as ToolSortOption)}
            aria-label="Sort tools"
            className="appearance-none pl-3 pr-8 py-2 rounded-full border border-slate-200 bg-white text-xs font-medium text-slate-600 hover:border-slate-300 focus:outline-none focus:ring-2 focus:ring-blue-500/20 cursor-pointer"
          >
            {(Object.keys(SORT_LABELS) as ToolSortOption[]).map((key) => (
              <option key={key} value={key}>
                Sort: {SORT_LABELS[key]}
              </option>
            ))}
          </select>
          <ChevronDown className="w-3.5 h-3.5 text-slate-400 absolute right-2.5 top-1/2 -translate-y-1/2 pointer-events-none" />
        </div>
      </div>
    </div>
  );
}

function FilterPill({ active, onClick, children }: { active: boolean; onClick: () => void; children: React.ReactNode }) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-pressed={active}
      className={`px-3 py-1.5 rounded-full text-xs font-medium border transition-colors ${
        active ? 'bg-blue-50 border-blue-200 text-blue-700' : 'border-slate-200 text-slate-500 hover:text-slate-700 hover:border-slate-300'
      }`}
    >
      {children}
    </button>
  );
}

function SelectPill({
  value,
  onChange,
  placeholder,
  options,
}: {
  value: string;
  onChange: (value: string) => void;
  placeholder: string;
  options: { value: string; label: string }[];
}) {
  return (
    <div className="relative">
      <select
        value={value}
        onChange={(e) => onChange(e.target.value)}
        aria-label={placeholder}
        className={`appearance-none pl-3 pr-7 py-1.5 rounded-full border text-xs font-medium cursor-pointer focus:outline-none focus:ring-2 focus:ring-blue-500/20 ${
          value ? 'bg-blue-50 border-blue-200 text-blue-700' : 'border-slate-200 text-slate-500 hover:border-slate-300 bg-white'
        }`}
      >
        <option value="">{placeholder}</option>
        {options.map((o) => (
          <option key={o.value} value={o.value}>
            {o.label}
          </option>
        ))}
      </select>
      <ChevronDown className="w-3 h-3 text-slate-400 absolute right-2 top-1/2 -translate-y-1/2 pointer-events-none" />
    </div>
  );
}

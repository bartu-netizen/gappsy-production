import type { ReactNode } from 'react';
import { Star, Check, HelpCircle } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import type { CompareToolFacts } from '../compare/types';

interface FactRow {
  label: string;
  values: ReactNode[];
}

function RatingValue({ rating, count }: { rating: number; count: number }) {
  if (rating <= 0) return <NotDocumented />;
  return (
    <span className="inline-flex items-center gap-1">
      <Star className="w-3.5 h-3.5 text-amber-500 fill-amber-500 shrink-0" />
      {rating.toFixed(1)}
      {count > 0 && <span className="text-slate-400">({count.toLocaleString()})</span>}
    </span>
  );
}

function NotDocumented() {
  return (
    <span className="inline-flex items-center gap-1 text-slate-400">
      <HelpCircle className="w-3.5 h-3.5 shrink-0" />
      Not documented
    </span>
  );
}

// Every boolean-flag fact here (free plan, free trial, API, etc.) is derived
// from a *positive* tag on the tool — absence of the tag means "not
// documented," never a confirmed "No." We never fabricate a negative.
function YesOrUnknown({ value }: { value: boolean }) {
  return value ? (
    <span className="inline-flex items-center gap-1 text-emerald-600 font-medium">
      <Check className="w-3.5 h-3.5 shrink-0" /> Yes
    </span>
  ) : (
    <NotDocumented />
  );
}

function buildRows(tools: CompareToolFacts[], bestFor: Record<string, string>): FactRow[] {
  const rows: FactRow[] = [];
  if (tools.some((t) => bestFor[t.slug])) {
    rows.push({ label: 'Best for', values: tools.map((t) => bestFor[t.slug] || <NotDocumented />) });
  }
  rows.push({ label: 'Primary category', values: tools.map((t) => t.primaryCategory?.name || <NotDocumented />) });
  rows.push({ label: 'Rating', values: tools.map((t) => <RatingValue rating={t.rating} count={t.reviewCount} />) });
  rows.push({ label: 'Pricing model', values: tools.map((t) => t.pricingModel || <NotDocumented />) });
  rows.push({ label: 'Starting price', values: tools.map((t) => t.startingPrice || <NotDocumented />) });
  rows.push({ label: 'Free plan', values: tools.map((t) => <YesOrUnknown value={t.hasFreePlan} />) });
  rows.push({ label: 'Free trial', values: tools.map((t) => <YesOrUnknown value={t.hasFreeTrial} />) });
  rows.push({ label: 'Platforms', values: tools.map((t) => (t.platforms.length > 0 ? t.platforms.join(', ') : <NotDocumented />)) });
  rows.push({ label: 'Team collaboration', values: tools.map((t) => <YesOrUnknown value={t.hasTeamCollaboration} />) });
  rows.push({ label: 'AI features', values: tools.map((t) => <YesOrUnknown value={t.hasAI} />) });
  rows.push({ label: 'Public API', values: tools.map((t) => <YesOrUnknown value={t.hasApi} />) });
  rows.push({ label: 'Integrations listed', values: tools.map((t) => (t.integrationCount > 0 ? `${t.integrationCount}` : <NotDocumented />)) });
  rows.push({ label: 'Verified listing', values: tools.map((t) => <YesOrUnknown value={t.verified} />) });
  return rows;
}

// N-tool sibling of CompareFactsTable.tsx — same dual desktop-table /
// mobile-stacked-card layout, generalized to a variable tool count instead
// of hardcoded A/B columns.
export default function GroupCompareFactsTable({ tools, bestFor }: { tools: CompareToolFacts[]; bestFor: Record<string, string> }) {
  const rows = buildRows(tools, bestFor);

  return (
    <section id="at-a-glance" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Overview" title="At a Glance" subtitle="Real, stored facts only — never inferred." />

      {/* Desktop / tablet: semantic table */}
      <div className="hidden sm:block bg-white border border-[#eef0f3] rounded-2xl overflow-x-auto">
        <table className="w-full text-sm">
          <caption className="sr-only">Feature and pricing comparison between {tools.map((t) => t.name).join(', ')}</caption>
          <thead>
            <tr className="bg-slate-50 border-b border-slate-100">
              <th scope="col" className="text-left px-4 py-3 font-semibold text-slate-500 w-1/4">&nbsp;</th>
              {tools.map((t) => (
                <th key={t.slug} scope="col" className="text-left px-4 py-3 font-semibold text-[#0B1221] whitespace-nowrap">
                  {t.name}
                </th>
              ))}
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {rows.map((row) => (
              <tr key={row.label} className="hover:bg-slate-50/60 transition-colors">
                <th scope="row" className="text-left px-4 py-3 font-medium text-slate-500 align-top">{row.label}</th>
                {row.values.map((value, i) => (
                  <td key={tools[i].slug} className="px-4 py-3 text-slate-700 align-top">{value}</td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Mobile: stacked cards, no horizontal scroll */}
      <div className="sm:hidden space-y-2.5">
        {rows.map((row) => (
          <div key={row.label} className="bg-white border border-[#eef0f3] rounded-xl p-3.5">
            <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-2">{row.label}</p>
            <div className="grid grid-cols-1 gap-2.5 text-[13px]">
              {row.values.map((value, i) => (
                <div key={tools[i].slug} className="flex items-baseline justify-between gap-3">
                  <p className="text-[10px] font-medium text-slate-400 shrink-0">{tools[i].name}</p>
                  <div className="text-slate-700 text-right min-w-0 break-words">{value}</div>
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}

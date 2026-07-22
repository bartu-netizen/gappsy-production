import type { ReactNode } from 'react';
import { Star, Check, HelpCircle } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import type { CompareToolFacts } from './types';
import type { ToolComparisonContent } from '../../data/comparisonContent/types';

interface FactRow {
  label: string;
  a: ReactNode;
  b: ReactNode;
}

function RatingValue({ rating, count }: { rating: number; count: number }) {
  if (rating <= 0) return <NotDocumented />;
  return (
    <span className="inline-flex items-center gap-1">
      <Star className="w-3.5 h-3.5 text-amber-500 fill-amber-500" />
      {rating.toFixed(1)}
      {count > 0 && <span className="text-slate-400">({count.toLocaleString()})</span>}
    </span>
  );
}

function NotDocumented() {
  return (
    <span className="inline-flex items-center gap-1 text-slate-400">
      <HelpCircle className="w-3.5 h-3.5" />
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
      <Check className="w-3.5 h-3.5" /> Yes
    </span>
  ) : (
    <NotDocumented />
  );
}

function buildRows(a: CompareToolFacts, b: CompareToolFacts, content?: ToolComparisonContent): FactRow[] {
  const rows: FactRow[] = [];

  if (content) {
    rows.push({ label: 'Best for', a: content.bestForToolA, b: content.bestForToolB });
  }
  rows.push({ label: 'Primary category', a: a.primaryCategory?.name || <NotDocumented />, b: b.primaryCategory?.name || <NotDocumented /> });
  rows.push({ label: 'Rating', a: <RatingValue rating={a.rating} count={a.reviewCount} />, b: <RatingValue rating={b.rating} count={b.reviewCount} /> });
  rows.push({ label: 'Pricing model', a: a.pricingModel || <NotDocumented />, b: b.pricingModel || <NotDocumented /> });
  rows.push({ label: 'Starting price', a: a.startingPrice || <NotDocumented />, b: b.startingPrice || <NotDocumented /> });
  rows.push({ label: 'Free plan', a: <YesOrUnknown value={a.hasFreePlan} />, b: <YesOrUnknown value={b.hasFreePlan} /> });
  rows.push({ label: 'Free trial', a: <YesOrUnknown value={a.hasFreeTrial} />, b: <YesOrUnknown value={b.hasFreeTrial} /> });
  rows.push({ label: 'Platforms', a: a.platforms.length > 0 ? a.platforms.join(', ') : <NotDocumented />, b: b.platforms.length > 0 ? b.platforms.join(', ') : <NotDocumented /> });
  rows.push({ label: 'Team collaboration', a: <YesOrUnknown value={a.hasTeamCollaboration} />, b: <YesOrUnknown value={b.hasTeamCollaboration} /> });
  rows.push({ label: 'AI features', a: <YesOrUnknown value={a.hasAI} />, b: <YesOrUnknown value={b.hasAI} /> });
  rows.push({ label: 'Public API', a: <YesOrUnknown value={a.hasApi} />, b: <YesOrUnknown value={b.hasApi} /> });
  rows.push({
    label: 'Integrations listed',
    a: a.integrationCount > 0 ? `${a.integrationCount}` : <NotDocumented />,
    b: b.integrationCount > 0 ? `${b.integrationCount}` : <NotDocumented />,
  });
  rows.push({ label: 'Verified listing', a: <YesOrUnknown value={a.verified} />, b: <YesOrUnknown value={b.verified} /> });

  return rows;
}

export default function CompareFactsTable({
  toolA,
  toolB,
  content,
}: {
  toolA: CompareToolFacts;
  toolB: CompareToolFacts;
  content?: ToolComparisonContent;
}) {
  const rows = buildRows(toolA, toolB, content);

  return (
    <section id="at-a-glance" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Overview" title="At a Glance" subtitle="Real, stored facts only — never inferred." />

      {/* Desktop / tablet: semantic table */}
      <div className="hidden sm:block bg-white border border-[#eef0f3] rounded-2xl overflow-hidden">
        <table className="w-full text-sm">
          <caption className="sr-only">Feature and pricing comparison between {toolA.name} and {toolB.name}</caption>
          <thead>
            <tr className="bg-slate-50 border-b border-slate-100">
              <th scope="col" className="text-left px-4 py-3 font-semibold text-slate-500 w-1/3">&nbsp;</th>
              <th scope="col" className="text-left px-4 py-3 font-semibold text-[#0B1221]">{toolA.name}</th>
              <th scope="col" className="text-left px-4 py-3 font-semibold text-[#0B1221]">{toolB.name}</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {rows.map((row) => (
              <tr key={row.label} className="hover:bg-slate-50/60 transition-colors">
                <th scope="row" className="text-left px-4 py-3 font-medium text-slate-500 align-top">{row.label}</th>
                <td className="px-4 py-3 text-slate-700 align-top">{row.a}</td>
                <td className="px-4 py-3 text-slate-700 align-top">{row.b}</td>
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
            <div className="grid grid-cols-2 gap-3 text-[13px]">
              <div>
                <p className="text-[10px] font-medium text-slate-400 mb-0.5">{toolA.name}</p>
                <div className="text-slate-700">{row.a}</div>
              </div>
              <div>
                <p className="text-[10px] font-medium text-slate-400 mb-0.5">{toolB.name}</p>
                <div className="text-slate-700">{row.b}</div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}

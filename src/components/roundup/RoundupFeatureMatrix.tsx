import { Check, Minus, X, HelpCircle } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import Card from '../tools/detail/Card';
import type { FeatureStatus, RoundupFeatureMatrixGroup } from '../../data/roundupContent/types';

const STATUS_STYLE: Record<FeatureStatus, { label: string; className: string; icon: typeof Check }> = {
  available: { label: 'Available', className: 'bg-emerald-50 text-emerald-700', icon: Check },
  limited: { label: 'Limited', className: 'bg-amber-50 text-amber-700', icon: Minus },
  unavailable: { label: 'Unavailable', className: 'bg-rose-50 text-rose-600', icon: X },
  'not-documented': { label: 'Not documented', className: 'bg-slate-100 text-slate-500', icon: HelpCircle },
};

function StatusPill({ status }: { status: FeatureStatus }) {
  const { label, className, icon: Icon } = STATUS_STYLE[status];
  return (
    <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[11px] font-medium whitespace-nowrap ${className}`}>
      <Icon className="w-3 h-3" />
      {label}
    </span>
  );
}

export default function RoundupFeatureMatrix({ toolNames, groups }: { toolNames: Record<string, string>; groups: RoundupFeatureMatrixGroup[] }) {
  if (groups.length === 0) return null;
  const slugs = Object.keys(toolNames);

  return (
    <section id="features" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Features" title="Feature-by-Feature" subtitle="Only documented capabilities are marked available or limited — everything else is shown as not documented, never guessed." />

      <div className="flex items-center gap-4 mb-4 text-[11px] text-slate-400 flex-wrap">
        {(Object.keys(STATUS_STYLE) as FeatureStatus[]).map((key) => (
          <span key={key} className="inline-flex items-center gap-1.5">
            <StatusPill status={key} />
          </span>
        ))}
      </div>

      <div className="space-y-4">
        {groups.map((group) => (
          <Card key={group.group} className="overflow-hidden">
            <div className="px-5 py-3 bg-slate-50 border-b border-slate-100">
              <h3 className="font-semibold text-[#0B1221] text-sm">{group.group}</h3>
            </div>
            <div className="overflow-x-auto">
              <table className="w-full text-left">
                <thead>
                  <tr className="border-b border-slate-100">
                    <th className="px-5 py-2 text-[11px] font-semibold uppercase tracking-wide text-slate-400">Feature</th>
                    {slugs.map((slug) => (
                      <th key={slug} className="px-3 py-2 text-[11px] font-semibold uppercase tracking-wide text-slate-400 whitespace-nowrap">
                        {toolNames[slug]}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100">
                  {group.rows.map((row) => (
                    <tr key={row.feature}>
                      <td className="px-5 py-3.5 align-top">
                        <p className="text-[13.5px] font-medium text-slate-700">{row.feature}</p>
                        {row.note && <p className="text-[12px] text-slate-400 mt-0.5">{row.note}</p>}
                      </td>
                      {slugs.map((slug) => (
                        <td key={slug} className="px-3 py-3.5 align-top">
                          <StatusPill status={row.statuses[slug] || 'not-documented'} />
                        </td>
                      ))}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </Card>
        ))}
      </div>
    </section>
  );
}

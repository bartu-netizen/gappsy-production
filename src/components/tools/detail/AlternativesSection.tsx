import { Link } from 'react-router-dom';
import { CheckCircle2, XCircle } from 'lucide-react';
import type { ToolAlternative } from '../../../data/toolContent/types';
import ToolsSectionHeader from '../ToolsSectionHeader';
import Card from './Card';

export default function AlternativesSection({ toolName, alternatives }: { toolName: string; alternatives: ToolAlternative[] }) {
  if (alternatives.length === 0) return null;

  return (
    <section>
      <ToolsSectionHeader
        eyebrow="Alternatives"
        title={`${toolName} alternatives`}
        subtitle={`${alternatives.length} tool${alternatives.length === 1 ? '' : 's'} worth comparing before you decide.`}
      />

      <div className="overflow-x-auto mb-6 rounded-2xl border border-[#eef0f3]">
        <table className="w-full text-left text-[13px]">
          <caption className="sr-only">Comparison of {toolName} alternatives by strength and pricing</caption>
          <thead>
            <tr className="bg-slate-50 text-[11px] uppercase tracking-[0.06em] text-slate-400">
              <th scope="col" className="px-4 py-2.5 font-semibold">Tool</th>
              <th scope="col" className="px-4 py-2.5 font-semibold">Best known for</th>
              <th scope="col" className="px-4 py-2.5 font-semibold">Pricing</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {alternatives.map((alt) => (
              <tr key={alt.name}>
                <td className="px-4 py-2.5 font-medium text-[#0B1221] whitespace-nowrap">{alt.name}</td>
                <td className="px-4 py-2.5 text-slate-600">{alt.pros[0] || alt.description}</td>
                <td className="px-4 py-2.5 text-slate-500 whitespace-nowrap">{alt.pricingSummary}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {alternatives.map((alt) => (
          <Card key={alt.name} hoverLift className="p-5 flex flex-col">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-10 h-10 rounded-xl bg-slate-100 flex items-center justify-center text-slate-500 font-bold shrink-0">
                {alt.name.charAt(0)}
              </div>
              <h3 className="font-semibold text-[#0B1221] text-[15px]">{alt.name}</h3>
            </div>
            <p className="text-[13.5px] text-slate-500 leading-relaxed mb-3">{alt.description}</p>

            <div className="space-y-1.5 mb-3">
              {alt.pros.slice(0, 2).map((pro) => (
                <div key={pro} className="flex items-start gap-1.5 text-[12.5px] text-slate-600">
                  <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 shrink-0 mt-0.5" />
                  {pro}
                </div>
              ))}
              {alt.cons.slice(0, 1).map((con) => (
                <div key={con} className="flex items-start gap-1.5 text-[12.5px] text-slate-600">
                  <XCircle className="w-3.5 h-3.5 text-rose-400 shrink-0 mt-0.5" />
                  {con}
                </div>
              ))}
            </div>

            <p className="text-[12.5px] text-slate-400 mt-auto pt-3 border-t border-slate-100 mb-3">{alt.pricingSummary}</p>

            <Link to={alt.href} className="inline-flex items-center text-xs font-semibold text-[#0A1735] hover:text-[#132952]">
              Browse similar tools &rarr;
            </Link>
          </Card>
        ))}
      </div>
    </section>
  );
}

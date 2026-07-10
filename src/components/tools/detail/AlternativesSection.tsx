import { Link } from 'react-router-dom';
import { CheckCircle2, XCircle } from 'lucide-react';
import type { ToolAlternative } from '../../../data/toolContent/types';
import ToolsSectionHeader from '../ToolsSectionHeader';

export default function AlternativesSection({ toolName, alternatives }: { toolName: string; alternatives: ToolAlternative[] }) {
  if (alternatives.length === 0) return null;

  return (
    <section id="alternatives" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Alternatives" title={`${toolName} alternatives`} />
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        {alternatives.map((alt) => (
          <div key={alt.name} className="bg-white border border-[#eef0f3] rounded-2xl p-5 flex flex-col">
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

            <Link to={alt.href} className="inline-flex items-center text-xs font-semibold text-indigo-600 hover:text-indigo-700">
              Browse similar tools &rarr;
            </Link>
          </div>
        ))}
      </div>
    </section>
  );
}

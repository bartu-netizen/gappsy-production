import { CheckCircle2, XCircle } from 'lucide-react';
import ToolsSectionHeader from '../ToolsSectionHeader';

export default function ProsConsSection({ toolName, pros, cons }: { toolName: string; pros: string[]; cons: string[] }) {
  if (pros.length === 0 && cons.length === 0) return null;

  return (
    <section id="pros-and-cons" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Pros & Cons" title={`Is ${toolName} worth it?`} />
      <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
        {pros.length > 0 && (
          <div className="bg-white border border-[#eef0f3] rounded-2xl p-5 sm:p-6">
            <h3 className="font-semibold text-emerald-700 text-sm uppercase tracking-wide mb-4">Pros</h3>
            <ul className="space-y-3">
              {pros.map((pro) => (
                <li key={pro} className="flex items-start gap-2.5 text-[14.5px] text-slate-600 leading-relaxed">
                  <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0 mt-0.5" />
                  {pro}
                </li>
              ))}
            </ul>
          </div>
        )}
        {cons.length > 0 && (
          <div className="bg-white border border-[#eef0f3] rounded-2xl p-5 sm:p-6">
            <h3 className="font-semibold text-rose-600 text-sm uppercase tracking-wide mb-4">Cons</h3>
            <ul className="space-y-3">
              {cons.map((con) => (
                <li key={con} className="flex items-start gap-2.5 text-[14.5px] text-slate-600 leading-relaxed">
                  <XCircle className="w-4 h-4 text-rose-400 shrink-0 mt-0.5" />
                  {con}
                </li>
              ))}
            </ul>
          </div>
        )}
      </div>
    </section>
  );
}

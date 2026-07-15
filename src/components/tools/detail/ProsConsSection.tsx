import { CheckCircle2, XCircle, Scale } from 'lucide-react';
import ToolsSectionHeader from '../ToolsSectionHeader';
import Card from './Card';

export default function ProsConsSection({ toolName, pros, cons }: { toolName: string; pros: string[]; cons: string[] }) {
  if (pros.length === 0 && cons.length === 0) return null;

  const verdict =
    pros.length > 0 && cons.length > 0
      ? `${toolName} leads with ${pros.length} standout strength${pros.length === 1 ? '' : 's'}, balanced against ${cons.length} trade-off${cons.length === 1 ? '' : 's'} worth knowing up front.`
      : pros.length > 0
        ? `${toolName} has no notable drawbacks reported here — its strengths speak for themselves.`
        : `${toolName}'s trade-offs are worth weighing carefully before committing.`;

  return (
    <section id="pros-and-cons" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Pros & Cons" title={`Is ${toolName} worth it?`} />
      <p className="flex items-start gap-2 text-[14px] text-slate-600 leading-relaxed mb-5 max-w-2xl">
        <Scale className="w-4 h-4 text-blue-500 shrink-0 mt-0.5" />
        {verdict}
      </p>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-5 items-start">
        {pros.length > 0 && (
          <Card className="p-5 sm:p-6">
            <h3 className="font-semibold text-emerald-700 text-sm uppercase tracking-wide mb-4">Pros</h3>
            <ul className={`space-y-3 ${pros.length >= 8 ? 'sm:columns-2 sm:gap-x-6 sm:space-y-0 [&>li]:mb-3' : ''}`}>
              {pros.map((pro) => (
                <li key={pro} className="flex items-start gap-2.5 text-[14.5px] text-slate-600 leading-relaxed break-inside-avoid">
                  <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0 mt-0.5" />
                  {pro}
                </li>
              ))}
            </ul>
          </Card>
        )}
        {cons.length > 0 && (
          <Card className="p-5 sm:p-6">
            <h3 className="font-semibold text-rose-600 text-sm uppercase tracking-wide mb-4">Cons</h3>
            <ul className={`space-y-3 ${cons.length >= 8 ? 'sm:columns-2 sm:gap-x-6 sm:space-y-0 [&>li]:mb-3' : ''}`}>
              {cons.map((con) => (
                <li key={con} className="flex items-start gap-2.5 text-[14.5px] text-slate-600 leading-relaxed break-inside-avoid">
                  <XCircle className="w-4 h-4 text-rose-400 shrink-0 mt-0.5" />
                  {con}
                </li>
              ))}
            </ul>
          </Card>
        )}
      </div>
    </section>
  );
}

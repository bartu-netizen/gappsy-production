import { CheckCircle2, XCircle } from 'lucide-react';
import ToolsSectionHeader from '../tools/ToolsSectionHeader';
import Card from '../tools/detail/Card';

interface ToolProsCons {
  slug: string;
  name: string;
  pros: string[];
  cons: string[];
}

const MAX_ITEMS = 6;

function ToolProsConsCard({ tool }: { tool: ToolProsCons }) {
  if (tool.pros.length === 0 && tool.cons.length === 0) return null;

  return (
    <Card className="p-5 sm:p-6 min-w-0">
      <h3 className="font-semibold text-[#0B1221] text-sm mb-4 break-words">{tool.name}</h3>
      {tool.pros.length > 0 && (
        <div className="mb-4">
          <p className="font-semibold text-emerald-700 text-[11px] uppercase tracking-wide mb-2.5">Pros</p>
          <ul className="space-y-2">
            {tool.pros.slice(0, MAX_ITEMS).map((pro) => (
              <li key={pro} className="flex items-start gap-2 text-[13.5px] text-slate-600 leading-relaxed">
                <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 shrink-0 mt-0.5" />
                <span className="min-w-0 break-words">{pro}</span>
              </li>
            ))}
          </ul>
        </div>
      )}
      {tool.cons.length > 0 && (
        <div>
          <p className="font-semibold text-rose-600 text-[11px] uppercase tracking-wide mb-2.5">Cons</p>
          <ul className="space-y-2">
            {tool.cons.slice(0, MAX_ITEMS).map((con) => (
              <li key={con} className="flex items-start gap-2 text-[13.5px] text-slate-600 leading-relaxed">
                <XCircle className="w-3.5 h-3.5 text-rose-400 shrink-0 mt-0.5" />
                <span className="min-w-0 break-words">{con}</span>
              </li>
            ))}
          </ul>
        </div>
      )}
    </Card>
  );
}

export default function GroupCompareProsCons({ tools }: { tools: ToolProsCons[] }) {
  if (tools.every((t) => t.pros.length === 0 && t.cons.length === 0)) return null;

  return (
    <section id="pros-and-cons" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Trade-offs" title="Pros & Cons" />
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
        {tools.map((tool) => (
          <ToolProsConsCard key={tool.slug} tool={tool} />
        ))}
      </div>
    </section>
  );
}

import { Link } from 'react-router-dom';
import { ArrowRight } from 'lucide-react';

interface ComparisonCardTool {
  slug: string;
  name: string;
  logo: string | null;
}

function ToolAvatar({ tool }: { tool: ComparisonCardTool }) {
  return tool.logo ? (
    <img src={tool.logo} alt={tool.name} className="w-10 h-10 rounded-xl object-contain border border-slate-100 bg-white shrink-0" />
  ) : (
    <div className="w-10 h-10 rounded-xl bg-slate-100 flex items-center justify-center text-slate-400 font-semibold shrink-0">
      {tool.name.charAt(0)}
    </div>
  );
}

export default function ComparisonCard({ slug, toolA, toolB }: { slug: string; toolA: ComparisonCardTool; toolB: ComparisonCardTool }) {
  return (
    <Link
      to={`/compare/${slug}`}
      className="group flex items-center gap-4 bg-white border border-[#eef0f3] rounded-2xl p-5 transition-all duration-200 hover:-translate-y-1 hover:shadow-[0_12px_28px_rgba(15,23,42,0.10)] hover:border-slate-200"
    >
      <div className="flex items-center -space-x-2 shrink-0">
        <ToolAvatar tool={toolA} />
        <div className="w-7 h-7 rounded-full bg-white border border-slate-200 flex items-center justify-center text-[10px] font-bold text-slate-400 z-10">
          vs
        </div>
        <ToolAvatar tool={toolB} />
      </div>
      <div className="flex-1 min-w-0">
        <h3 className="font-semibold text-[#0B1221] text-[15px] truncate group-hover:text-blue-600 transition-colors">
          {toolA.name} vs {toolB.name}
        </h3>
        <p className="text-xs text-slate-400 mt-0.5">Full comparison</p>
      </div>
      <ArrowRight className="w-4 h-4 text-slate-300 group-hover:text-blue-500 transition-colors shrink-0" />
    </Link>
  );
}

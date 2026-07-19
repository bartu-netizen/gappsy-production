import { Link } from 'react-router-dom';
import { ArrowRight } from 'lucide-react';

interface GroupCompareCardTool {
  slug: string;
  name: string;
  logo: string | null;
}

function ToolAvatar({ tool, index }: { tool: GroupCompareCardTool; index: number }) {
  return tool.logo ? (
    <img
      src={tool.logo}
      alt={tool.name}
      className="w-10 h-10 rounded-xl object-contain border-2 border-white bg-white shrink-0"
      style={{ zIndex: 10 - index }}
    />
  ) : (
    <div
      className="w-10 h-10 rounded-xl bg-slate-100 border-2 border-white flex items-center justify-center text-slate-400 font-semibold shrink-0"
      style={{ zIndex: 10 - index }}
    >
      {tool.name.charAt(0)}
    </div>
  );
}

export default function GroupCompareCard({ slug, title, tools }: { slug: string; title: string; tools: GroupCompareCardTool[] }) {
  return (
    <Link
      to={`/compare/roundup/${slug}`}
      className="group flex items-center gap-4 bg-white border border-[#eef0f3] rounded-2xl p-5 transition-all duration-200 hover:-translate-y-1 hover:shadow-[0_12px_28px_rgba(15,23,42,0.10)] hover:border-slate-200"
    >
      <div className="flex items-center -space-x-2 shrink-0">
        {tools.slice(0, 3).map((tool, i) => (
          <ToolAvatar key={tool.slug} tool={tool} index={i} />
        ))}
      </div>
      <div className="flex-1 min-w-0">
        <h3 className="font-semibold text-[#0B1221] text-[15px] truncate group-hover:text-[#4F47E6] transition-colors">{title}</h3>
        <p className="text-xs text-slate-400 mt-0.5">{tools.length}-tool comparison</p>
      </div>
      <ArrowRight className="w-4 h-4 text-slate-300 group-hover:text-[#4F47E6] transition-colors shrink-0" />
    </Link>
  );
}

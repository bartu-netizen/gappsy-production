import { Link } from 'react-router-dom';
import { FolderTree, ArrowRight } from 'lucide-react';

export interface CategoryTileData {
  slug: string;
  name: string;
  description: string | null;
  toolCount: number;
}

interface CategoryTileProps {
  category: CategoryTileData;
  size?: 'large' | 'compact';
}

// Shared between ToolsIndexPage (a curated 2–3 tile spread) and
// ToolCategoriesIndexPage (large tiles for the categories with the most tools, compact
// rows for the rest) — one component, two visual weights, so category browsing never
// collapses into one uniform N-up grid.
export default function CategoryTile({ category, size = 'large' }: CategoryTileProps) {
  if (size === 'compact') {
    return (
      <Link
        to={`/tool-categories/${category.slug}`}
        className="group flex items-center gap-3 bg-white border border-[#eef0f3] rounded-xl px-4 py-3.5 transition-colors hover:border-indigo-200 hover:bg-indigo-50/30"
      >
        <div className="w-8 h-8 rounded-lg bg-slate-100 flex items-center justify-center shrink-0">
          <FolderTree className="w-4 h-4 text-slate-400" />
        </div>
        <span className="flex-1 min-w-0 text-sm font-medium text-[#0B1221] truncate group-hover:text-indigo-600 transition-colors">
          {category.name}
        </span>
        <span className="text-xs text-slate-400 shrink-0">{category.toolCount}</span>
      </Link>
    );
  }

  return (
    <Link
      to={`/tool-categories/${category.slug}`}
      className="group flex flex-col bg-[#F9FAFB] border border-[#eef0f3] rounded-[24px] p-7 sm:p-8 transition-all duration-200 hover:-translate-y-1 hover:shadow-[0_16px_36px_rgba(15,23,42,0.08)]"
    >
      <div className="w-10 h-10 rounded-xl bg-white border border-slate-100 shadow-sm flex items-center justify-center mb-5">
        <FolderTree className="w-4.5 h-4.5 text-indigo-500" />
      </div>
      <h3 className="text-lg sm:text-xl font-bold text-[#0D172A] mb-2 leading-snug">{category.name}</h3>
      {category.description && (
        <p className="text-sm text-slate-500 leading-relaxed line-clamp-2 mb-5">{category.description}</p>
      )}
      <div className="mt-auto flex items-center justify-between pt-1">
        <span className="text-xs font-medium text-slate-400">
          {category.toolCount} tool{category.toolCount === 1 ? '' : 's'}
        </span>
        <ArrowRight className="w-4 h-4 text-slate-300 group-hover:text-indigo-500 group-hover:translate-x-0.5 transition-all" />
      </div>
    </Link>
  );
}

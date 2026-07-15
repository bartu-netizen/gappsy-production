import { Link } from 'react-router-dom';
import { ArrowRight, type LucideIcon } from 'lucide-react';

export interface ToolsEmptyStateLink {
  label: string;
  href: string;
}

interface ToolsEmptyStateProps {
  icon: LucideIcon;
  eyebrow?: string;
  title: string;
  description: string;
  actionLabel?: string;
  actionHref?: string;
  exploreLinks?: ToolsEmptyStateLink[];
  exploreLabel?: string;
}

// A designed moment, not a "no results" line — used whenever a page has zero data to
// show. Always gives the visitor somewhere better to go via `exploreLinks`, so an empty
// category/tag/tools table still reads as an intentional, finished page.
export default function ToolsEmptyState({
  icon: Icon,
  eyebrow,
  title,
  description,
  actionLabel,
  actionHref,
  exploreLinks,
  exploreLabel = 'Explore instead',
}: ToolsEmptyStateProps) {
  return (
    <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-[#EEF0FE] via-white to-white border border-[#eef0f3] px-6 sm:px-12 py-14 sm:py-16 text-center">
      <div className="mx-auto w-14 h-14 rounded-2xl bg-white border border-[#E0E3FC] shadow-sm flex items-center justify-center mb-6">
        <Icon className="w-6 h-6 text-[#4F47E6]" strokeWidth={1.75} />
      </div>

      {eyebrow && (
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-[#4F47E6] mb-2">
          {eyebrow}
        </p>
      )}

      <h3 className="text-xl sm:text-2xl font-bold text-[#0B1221] mb-3 max-w-lg mx-auto leading-snug">
        {title}
      </h3>
      <p className="text-slate-500 text-[15px] leading-relaxed max-w-md mx-auto mb-7">
        {description}
      </p>

      {actionLabel && actionHref && (
        <Link
          to={actionHref}
          className="inline-flex items-center gap-1.5 bg-[#4F47E6] hover:bg-[#4338CA] text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-colors"
        >
          {actionLabel}
          <ArrowRight className="w-3.5 h-3.5" />
        </Link>
      )}

      {exploreLinks && exploreLinks.length > 0 && (
        <div className="mt-9 pt-7 border-t border-[#eef0f3] max-w-md mx-auto">
          <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-3">
            {exploreLabel}
          </p>
          <div className="flex flex-wrap items-center justify-center gap-2">
            {exploreLinks.map((link) => (
              <Link
                key={link.href}
                to={link.href}
                className="text-sm font-medium bg-white border border-[#eef0f3] text-slate-600 hover:text-[#4F47E6] hover:border-[#C7CCF7] px-3.5 py-1.5 rounded-full transition-colors"
              >
                {link.label}
              </Link>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}

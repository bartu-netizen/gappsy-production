import { Link } from 'react-router-dom';
import { ArrowRight } from 'lucide-react';

interface ToolsSectionHeaderProps {
  eyebrow?: string;
  title: string;
  subtitle?: string;
  viewAllHref?: string;
  viewAllLabel?: string;
  align?: 'left' | 'center';
}

export default function ToolsSectionHeader({
  eyebrow,
  title,
  subtitle,
  viewAllHref,
  viewAllLabel = 'View all',
  align = 'left',
}: ToolsSectionHeaderProps) {
  const isCenter = align === 'center';

  return (
    <div className={`flex items-start justify-between gap-4 mb-6 ${isCenter ? 'flex-col items-center text-center' : 'flex-wrap'}`}>
      <div className={isCenter ? 'max-w-xl' : ''}>
        {eyebrow && (
          <p className={`flex items-center gap-2 text-[11px] font-semibold uppercase tracking-[0.08em] text-[#0A1735] mb-1.5 ${isCenter ? 'justify-center' : ''}`}>
            <span className="inline-block w-3 h-[3px] rounded-full bg-[#0A1735]" aria-hidden="true" />
            {eyebrow}
          </p>
        )}
        <h2 className="text-xl sm:text-2xl font-bold text-[#0B1221] leading-snug tracking-tight">
          {title}
        </h2>
        {subtitle && <p className="text-[14px] text-slate-500 mt-1.5 leading-relaxed">{subtitle}</p>}
      </div>

      {viewAllHref && !isCenter && (
        <Link
          to={viewAllHref}
          className="inline-flex items-center gap-1 text-xs font-medium text-[#94A3B8] hover:text-[#64748B] transition-colors shrink-0 mt-1"
        >
          {viewAllLabel}
          <ArrowRight className="w-3 h-3" />
        </Link>
      )}
    </div>
  );
}

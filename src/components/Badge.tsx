interface BadgeProps {
  children: React.ReactNode;
  className?: string;
  /** Smaller padding/font-size below the sm: breakpoint only — for tight
   * mobile layouts (e.g. a badge row that must fit on one line). Sizing is
   * baked into the component rather than left to the caller's className,
   * since a same-specificity utility (e.g. text-xs) passed in via
   * className can't reliably beat this component's own text-sm — Tailwind
   * orders same-category utilities by scale internally, not by source
   * position, so the "later" one in that scale wins regardless of which
   * appears last in the class string. */
  compact?: boolean;
}

export function Badge({ children, className = "", compact = false }: BadgeProps) {
  return (
    <span
      className={`
        inline-flex items-center justify-center
        rounded-full
        bg-[#EEF2FF]
        ${compact ? 'px-2 py-0.5 text-[10px] sm:px-3 sm:py-1 sm:text-sm' : 'px-3 py-1 text-sm'}
        font-semibold
        tracking-wide uppercase
        text-[#3B5BFF]
        whitespace-nowrap
        ${className}
      `}
    >
      {children}
    </span>
  );
}

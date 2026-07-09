export function Badge({ children, className = "" }: { children: React.ReactNode; className?: string }) {
  return (
    <span
      className={`
        inline-flex items-center justify-center
        rounded-full
        bg-[#EEF2FF]
        px-3 py-1
        text-sm font-semibold
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

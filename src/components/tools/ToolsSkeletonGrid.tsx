// Light-mode skeleton block. Reuses the `.skeleton-shimmer` keyframe already defined in
// src/index.css (currently only used at `bg-white/8` for dark surfaces) on a light gray
// base instead, so no new global CSS is introduced.
function Block({ className = '' }: { className?: string }) {
  return <div className={`skeleton-shimmer bg-slate-200/70 rounded-md ${className}`} />;
}

function SkeletonCard() {
  return (
    <div className="bg-white border border-[#eef0f3] rounded-2xl p-5">
      <div className="flex items-start gap-3 mb-4">
        <Block className="w-11 h-11 rounded-xl shrink-0" />
        <div className="flex-1 space-y-2 pt-0.5">
          <Block className="h-3.5 w-2/3" />
          <Block className="h-2.5 w-1/3" />
        </div>
      </div>
      <Block className="h-3 w-full mb-2" />
      <Block className="h-3 w-4/5" />
    </div>
  );
}

export default function ToolsSkeletonGrid({ count = 6 }: { count?: number }) {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4" aria-hidden="true">
      {Array.from({ length: count }, (_, i) => (
        <SkeletonCard key={i} />
      ))}
    </div>
  );
}

export default function ToolDetailSkeleton() {
  return (
    <div className="animate-pulse">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 pt-6 sm:pt-10 pb-8">
        <div className="flex flex-col sm:flex-row gap-6">
          <div className="w-20 h-20 sm:w-24 sm:h-24 rounded-2xl bg-slate-100 shrink-0" />
          <div className="flex-1 space-y-3">
            <div className="h-9 w-64 bg-slate-100 rounded-lg" />
            <div className="h-4 w-full max-w-md bg-slate-100 rounded" />
            <div className="h-4 w-40 bg-slate-100 rounded" />
          </div>
        </div>
      </div>
      <div className="max-w-6xl mx-auto px-4 sm:px-6 pb-20">
        <div className="grid grid-cols-1 lg:grid-cols-[200px_1fr_300px] gap-8">
          <div className="hidden lg:block space-y-2">
            {Array.from({ length: 6 }).map((_, i) => (
              <div key={i} className="h-4 bg-slate-100 rounded w-32" />
            ))}
          </div>
          <div className="space-y-4">
            {Array.from({ length: 4 }).map((_, i) => (
              <div key={i} className="h-4 bg-slate-100 rounded w-full" />
            ))}
            <div className="h-64 bg-slate-100 rounded-2xl" />
          </div>
          <div className="h-72 bg-slate-100 rounded-2xl" />
        </div>
      </div>
    </div>
  );
}

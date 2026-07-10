import type { ReactNode } from 'react';

interface BrowserFrameProps {
  hostname?: string | null;
  children: ReactNode;
  className?: string;
}

// Reusable browser-chrome mockup — traffic-light dots + a hostname pill above
// whatever product surface is passed in. Used by ScreenshotGallery today;
// generic enough for any future module that shows a live product screen
// (embeds, demos) across the 50,000+ tool pages this template powers.
export default function BrowserFrame({ hostname, children, className = '' }: BrowserFrameProps) {
  return (
    <div className={`rounded-xl overflow-hidden border border-[#eef0f3] bg-white ${className}`}>
      <div className="flex items-center gap-2 px-3 py-2 bg-slate-50 border-b border-[#eef0f3]">
        <div className="flex items-center gap-1.5" aria-hidden="true">
          <span className="w-2.5 h-2.5 rounded-full bg-rose-300" />
          <span className="w-2.5 h-2.5 rounded-full bg-amber-300" />
          <span className="w-2.5 h-2.5 rounded-full bg-emerald-300" />
        </div>
        {hostname && (
          <span className="flex-1 text-center text-[11px] text-slate-400 font-medium truncate px-8 sm:px-16">
            {hostname}
          </span>
        )}
      </div>
      {children}
    </div>
  );
}

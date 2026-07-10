import { ExternalLink, PlayCircle } from 'lucide-react';

interface ToolConversionBandProps {
  toolName: string;
  websiteUrl: string | null;
  affiliateUrl: string | null;
  hasVideo: boolean;
}

// Final conversion moment before the footer. Only renders real, working
// actions — no newsletter capture here since there is no email-capture
// backend wired up for the Tools module yet (see Recommended Database
// Improvements); adding a fake "Subscribed!" form would be worse than
// omitting it.
export default function ToolConversionBand({ toolName, websiteUrl, affiliateUrl, hasVideo }: ToolConversionBandProps) {
  const cta = affiliateUrl || websiteUrl;
  if (!cta) return null;

  return (
    <section className="bg-gradient-to-br from-[#0B1221] to-[#1E1B4B] rounded-[28px] px-6 sm:px-12 py-12 sm:py-16 text-center">
      <h2 className="text-2xl sm:text-3xl font-bold text-white mb-3 tracking-tight">Ready to try {toolName}?</h2>
      <p className="text-slate-300 max-w-lg mx-auto mb-7 text-[15px] leading-relaxed">
        Head to the official site to create a free account and start designing in minutes.
      </p>
      <div className="flex items-center justify-center gap-3 flex-wrap">
        <a
          href={cta}
          target="_blank"
          rel="noopener noreferrer nofollow"
          className="inline-flex items-center gap-1.5 bg-white text-[#0B1221] px-6 py-3 rounded-full font-semibold text-sm hover:bg-slate-100 transition-colors"
        >
          Try {toolName} Free
          <ExternalLink className="w-3.5 h-3.5" />
        </a>
        {hasVideo && (
          <a
            href="#video"
            className="inline-flex items-center gap-1.5 border border-white/20 text-white px-6 py-3 rounded-full font-semibold text-sm hover:bg-white/10 transition-colors"
          >
            <PlayCircle className="w-4 h-4" />
            Watch Demo
          </a>
        )}
      </div>
    </section>
  );
}

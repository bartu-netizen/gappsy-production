import { useState } from 'react';
import { Play } from 'lucide-react';
import type { ToolTranscriptCue } from '../../../data/toolContent/types';
import ToolsSectionHeader from '../ToolsSectionHeader';

function extractYouTubeId(url: string): string | null {
  try {
    const parsed = new URL(url);
    if (parsed.hostname.includes('youtu.be')) return parsed.pathname.slice(1) || null;
    if (parsed.hostname.includes('youtube.com')) {
      if (parsed.pathname === '/watch') return parsed.searchParams.get('v');
      if (parsed.pathname.startsWith('/embed/')) return parsed.pathname.split('/embed/')[1] || null;
    }
    return null;
  } catch {
    return null;
  }
}

function formatSeconds(seconds: number): string {
  const m = Math.floor(seconds / 60);
  const s = Math.floor(seconds % 60);
  return `${m}:${s.toString().padStart(2, '0')}`;
}

export default function VideoSection({
  toolName,
  youtubeUrl,
  transcript = [],
}: {
  toolName: string;
  youtubeUrl: string | null | undefined;
  transcript?: ToolTranscriptCue[];
}) {
  const [startSeconds, setStartSeconds] = useState(0);

  if (!youtubeUrl) return null;
  const videoId = extractYouTubeId(youtubeUrl);
  if (!videoId) return null;

  return (
    <section id="video" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Video" title={`See ${toolName} in action`} />
      <div className="grid grid-cols-1 lg:grid-cols-[1fr_260px] gap-5">
        <div className="aspect-video rounded-2xl overflow-hidden border border-[#eef0f3] bg-black">
          <iframe
            key={startSeconds}
            src={`https://www.youtube.com/embed/${videoId}?start=${startSeconds}`}
            title={`${toolName} overview video`}
            className="w-full h-full"
            loading="lazy"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowFullScreen
          />
        </div>

        {transcript.length > 0 && (
          <div className="bg-white border border-[#eef0f3] rounded-2xl p-4 max-h-80 overflow-y-auto space-y-1">
            <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-2 px-1">Transcript</p>
            {transcript.map((cue) => (
              <button
                key={cue.seconds}
                type="button"
                onClick={() => setStartSeconds(cue.seconds)}
                className={`w-full text-left flex items-start gap-2 px-2 py-1.5 rounded-lg text-[13px] transition-colors ${
                  startSeconds === cue.seconds ? 'bg-indigo-50 text-indigo-700' : 'text-slate-600 hover:bg-slate-50'
                }`}
              >
                <span className="inline-flex items-center gap-1 text-indigo-500 font-mono text-[11px] shrink-0 mt-0.5">
                  <Play className="w-2.5 h-2.5" />
                  {formatSeconds(cue.seconds)}
                </span>
                {cue.text}
              </button>
            ))}
          </div>
        )}
      </div>
    </section>
  );
}

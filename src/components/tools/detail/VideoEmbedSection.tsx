import { useEffect, useRef, useState } from 'react';
import { Play } from 'lucide-react';
import { supabase } from '../../../lib/supabase';
import ToolsSectionHeader from '../ToolsSectionHeader';

interface VideoEmbed {
  id: string;
  youtube_video_id: string;
  is_short: boolean;
  title: string;
}

declare global {
  interface Window {
    YT?: {
      Player: new (
        el: HTMLElement | string,
        opts: {
          videoId: string;
          width?: string | number;
          height?: string | number;
          playerVars?: Record<string, number>;
          events?: { onStateChange?: (e: { data: number; target: { getCurrentTime: () => number } }) => void };
        }
      ) => unknown;
      PlayerState: { PLAYING: number; PAUSED: number; ENDED: number };
    };
    onYouTubeIframeAPIReady?: () => void;
  }
}

const YT_API_SRC = 'https://www.youtube.com/iframe_api';
let ytApiLoadPromise: Promise<void> | null = null;

// Loads the YouTube IFrame API script exactly once per page session, no
// matter how many times a tool page (and this component) mounts while
// navigating the SPA — YouTube's own callback global only supports one
// listener, so this wraps it in a promise every caller can await safely.
function loadYouTubeIframeApi(): Promise<void> {
  if (window.YT?.Player) return Promise.resolve();
  if (ytApiLoadPromise) return ytApiLoadPromise;
  ytApiLoadPromise = new Promise((resolve) => {
    const previous = window.onYouTubeIframeAPIReady;
    window.onYouTubeIframeAPIReady = () => {
      previous?.();
      resolve();
    };
    if (!document.querySelector(`script[src="${YT_API_SRC}"]`)) {
      const script = document.createElement('script');
      script.src = YT_API_SRC;
      document.body.appendChild(script);
    }
  });
  return ytApiLoadPromise;
}

// Fires an RPC once per (embed, event type) per browser session — impression
// and click are both "did this happen at least once while browsing" signals,
// not a raw hit counter, so a repeat page visit or re-mount doesn't inflate
// them. Views already used this same convention before this component
// existed in its current form; this generalizes it.
function countOncePerSession(embedId: string, kind: 'impression' | 'click', rpcName: string) {
  const key = `video_${kind}_counted_${embedId}`;
  if (sessionStorage.getItem(key)) return;
  sessionStorage.setItem(key, '1');
  supabase.rpc(rpcName, { p_id: embedId });
}

const WATCH_TIME_PING_MS = 5000;

// Admin-managed video embed (see /wp-admin/video-embeds) shown right above
// "At a Glance" — one video can be shown on several pages at once (a
// comparison video also embedded on each tool's own page, for example),
// keyed by path via page_video_embed_targets rather than tied to this
// specific component or a single tool/comparison id.
//
// Renders a static thumbnail first (an "impression" the moment it's shown)
// and only loads the real YouTube iframe + API on click (a "click", tracked
// separately from "view" — the first confirmed PLAYING state once the
// player actually starts) — this also means the YouTube iframe/cookies
// never load for a visitor who never presses play. While playing, cumulative
// watch time is pinged to the server every few seconds.
// Renders nothing if no active embed exists for this path (no placeholder
// clutter, same convention as every other optional section on this page).
export default function VideoEmbedSection({ pagePath }: { pagePath: string }) {
  const [embed, setEmbed] = useState<VideoEmbed | null | undefined>(undefined);
  const [playing, setPlaying] = useState(false);
  const playerContainerRef = useRef<HTMLDivElement>(null);
  const viewCountedRef = useRef(false);
  const watchIntervalRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const lastTimeRef = useRef(0);

  useEffect(() => {
    let cancelled = false;
    // page_video_embeds/page_video_embed_targets share the same trigger-
    // enforced normalization (lowercase + exactly one trailing slash) —
    // matched here so the lookup finds the row regardless of how the admin
    // typed the path in.
    const normalizedPath = `${pagePath.trim().toLowerCase().replace(/\/+$/, '')}/`;
    supabase
      .from('page_video_embed_targets')
      .select('page_video_embeds!inner(id, youtube_video_id, is_short, title, is_active)')
      .eq('page_path', normalizedPath)
      .eq('page_video_embeds.is_active', true)
      .maybeSingle()
      .then(({ data }) => {
        if (cancelled) return;
        const row = data?.page_video_embeds as unknown as VideoEmbed | undefined;
        setEmbed(row || null);
      });
    return () => {
      cancelled = true;
    };
  }, [pagePath]);

  useEffect(() => {
    if (embed) countOncePerSession(embed.id, 'impression', 'increment_video_embed_impression');
  }, [embed]);

  function stopWatchTimePolling() {
    if (watchIntervalRef.current) {
      clearInterval(watchIntervalRef.current);
      watchIntervalRef.current = null;
    }
  }

  function handlePlay() {
    if (!embed || !playerContainerRef.current) return;
    countOncePerSession(embed.id, 'click', 'increment_video_embed_click');
    setPlaying(true);
    viewCountedRef.current = false;
    lastTimeRef.current = 0;
    const embedId = embed.id;

    loadYouTubeIframeApi().then(() => {
      if (!playerContainerRef.current || !window.YT) return;
      new window.YT.Player(playerContainerRef.current, {
        videoId: embed.youtube_video_id,
        width: '100%',
        height: '100%',
        playerVars: { autoplay: 1 },
        events: {
          onStateChange: (e) => {
            if (!window.YT) return;
            if (e.data === window.YT.PlayerState.PLAYING) {
              if (!viewCountedRef.current) {
                viewCountedRef.current = true;
                const key = `video_view_counted_${embedId}`;
                if (!sessionStorage.getItem(key)) {
                  sessionStorage.setItem(key, '1');
                  supabase.rpc('increment_video_embed_view', { p_id: embedId });
                }
              }
              stopWatchTimePolling();
              lastTimeRef.current = e.target.getCurrentTime();
              watchIntervalRef.current = setInterval(() => {
                const current = e.target.getCurrentTime();
                const delta = current - lastTimeRef.current;
                lastTimeRef.current = current;
                if (delta > 0) supabase.rpc('add_video_embed_watch_seconds', { p_id: embedId, p_seconds: delta });
              }, WATCH_TIME_PING_MS);
            } else if (e.data === window.YT.PlayerState.PAUSED || e.data === window.YT.PlayerState.ENDED) {
              stopWatchTimePolling();
            }
          },
        },
      });
    });
  }

  useEffect(() => stopWatchTimePolling, []);

  if (!embed) return null;

  const thumbnailUrl = `https://i.ytimg.com/vi/${embed.youtube_video_id}/hqdefault.jpg`;

  return (
    <section aria-label={embed.title} className="not-prose">
      <ToolsSectionHeader eyebrow="Video" title={embed.title} />
      <div
        className={`relative rounded-2xl overflow-hidden border border-[#eef0f3] bg-black [&_iframe]:absolute [&_iframe]:inset-0 [&_iframe]:w-full [&_iframe]:h-full ${
          embed.is_short ? 'mx-auto max-w-[360px] aspect-[9/16]' : 'aspect-video'
        }`}
      >
        {playing ? (
          <div ref={playerContainerRef} className="absolute inset-0" />
        ) : (
          <button
            type="button"
            onClick={handlePlay}
            aria-label={`Play video: ${embed.title}`}
            className="absolute inset-0 w-full h-full group cursor-pointer"
          >
            <img src={thumbnailUrl} alt="" className="absolute inset-0 w-full h-full object-cover" loading="lazy" />
            <span className="absolute inset-0 bg-black/20 group-hover:bg-black/30 transition-colors flex items-center justify-center">
              <span className="w-16 h-16 rounded-full bg-white/90 group-hover:bg-white flex items-center justify-center transition-colors shadow-lg">
                <Play className="w-7 h-7 text-[#0B1221] fill-current translate-x-0.5" />
              </span>
            </span>
          </button>
        )}
      </div>
    </section>
  );
}

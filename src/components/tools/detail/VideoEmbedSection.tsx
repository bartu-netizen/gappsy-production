import { useEffect, useRef, useState } from 'react';
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
        opts: { videoId: string; width?: string | number; height?: string | number; events?: { onStateChange?: (e: { data: number }) => void } }
      ) => unknown;
      PlayerState: { PLAYING: number };
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

// Admin-managed video embed (see /wp-admin/video-embeds) shown right above
// "At a Glance" — one YouTube or YouTube Shorts video per page, keyed by
// path rather than tied to this specific component, so the same system
// could place a video on other page types later without a schema change.
// Renders nothing if no active embed exists for this path (no placeholder
// clutter, same convention as every other optional section on this page).
export default function VideoEmbedSection({ pagePath }: { pagePath: string }) {
  const [embed, setEmbed] = useState<VideoEmbed | null | undefined>(undefined);
  const playerContainerRef = useRef<HTMLDivElement>(null);
  const countedRef = useRef(false);

  useEffect(() => {
    let cancelled = false;
    // page_video_embeds has a DB trigger that lowercases page_path and
    // enforces exactly one trailing slash on write — matched here so the
    // lookup finds the row regardless of how the admin typed it in.
    const normalizedPath = `${pagePath.trim().toLowerCase().replace(/\/+$/, '')}/`;
    supabase
      .from('page_video_embeds')
      .select('id, youtube_video_id, is_short, title')
      .eq('page_path', normalizedPath)
      .eq('is_active', true)
      .maybeSingle()
      .then(({ data }) => {
        if (!cancelled) setEmbed(data);
      });
    return () => {
      cancelled = true;
    };
  }, [pagePath]);

  useEffect(() => {
    if (!embed || !playerContainerRef.current) return;
    countedRef.current = false;
    const sessionKey = `video_view_counted_${embed.id}`;
    let disposed = false;

    loadYouTubeIframeApi().then(() => {
      if (disposed || !playerContainerRef.current || !window.YT) return;
      new window.YT.Player(playerContainerRef.current, {
        videoId: embed.youtube_video_id,
        width: '100%',
        height: '100%',
        events: {
          onStateChange: (e) => {
            if (
              !countedRef.current &&
              window.YT &&
              e.data === window.YT.PlayerState.PLAYING &&
              !sessionStorage.getItem(sessionKey)
            ) {
              countedRef.current = true;
              sessionStorage.setItem(sessionKey, '1');
              supabase.rpc('increment_video_embed_view', { p_id: embed.id });
            }
          },
        },
      });
    });

    return () => {
      disposed = true;
    };
  }, [embed]);

  if (!embed) return null;

  return (
    <section aria-label={embed.title} className="not-prose">
      <ToolsSectionHeader eyebrow="Video" title={embed.title} />
      <div
        className={`relative rounded-2xl overflow-hidden border border-[#eef0f3] bg-black [&_iframe]:absolute [&_iframe]:inset-0 [&_iframe]:w-full [&_iframe]:h-full ${
          embed.is_short ? 'mx-auto max-w-[360px] aspect-[9/16]' : 'aspect-video'
        }`}
      >
        <div ref={playerContainerRef} />
      </div>
    </section>
  );
}

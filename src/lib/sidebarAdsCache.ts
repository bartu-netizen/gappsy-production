export interface SidebarAd {
  id: string;
  position: string;
  display_order: number;
  logo_url: string;
  title: string;
  subtitle: string;
  target_url: string;
  bg_color: string;
  is_active: boolean;
}

// ThreeColumnLayout (desktop) and TopAdRail/BottomAdRail (mobile) are all
// mounted simultaneously on the homepage — HomePage.tsx renders both the
// desktop and mobile trees at once and just CSS-hides whichever doesn't
// match the viewport (`hidden xl:block` / `xl:hidden`), rather than
// conditionally mounting one or the other. Each of those three previously
// called sidebar-ads-fetch independently, firing the identical request 3x
// on every homepage load. Memoizing the in-flight/resolved promise at
// module scope means the first caller triggers the real network request
// and the other two just await the same result.
let cachedPromise: Promise<SidebarAd[]> | null = null;

export function fetchSidebarAds(): Promise<SidebarAd[]> {
  if (!cachedPromise) {
    cachedPromise = fetch(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/sidebar-ads-fetch`)
      .then((res) => res.json())
      .then((data) => (Array.isArray(data.ads) ? data.ads : []))
      .catch((err) => {
        console.error('Failed to load sidebar ads:', err);
        cachedPromise = null; // allow a retry on next call rather than caching a failure forever
        return [];
      });
  }
  return cachedPromise;
}

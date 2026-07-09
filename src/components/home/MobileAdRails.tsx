import { useState, useEffect } from 'react';

const defaultBgColors = [
  '#E0F2FE',
  '#DBEAFE',
  '#E0E7FF',
  '#F3E8FF',
  '#FCE7F3'
];

interface SidebarAd {
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

interface MobileAdChipProps {
  ad: SidebarAd;
  index: number;
}

function MobileAdChip({ ad, index }: MobileAdChipProps) {
  const bgColor = ad.bg_color || defaultBgColors[index % defaultBgColors.length];
  const AdWrapper = ad.target_url ? 'a' : 'div';
  const wrapperProps = ad.target_url
    ? {
        href: ad.target_url,
        target: ad.target_url.startsWith('http') ? '_blank' : undefined,
        rel: ad.target_url.startsWith('http') ? 'noopener noreferrer' : undefined,
      }
    : {};

  return (
    <AdWrapper
      {...wrapperProps}
      className={`flex-shrink-0 h-9 min-w-[120px] max-w-[150px] px-3 py-1.5 rounded-lg border border-[#E5E7EB] shadow-sm flex items-center gap-2 ${
        ad.target_url ? 'cursor-pointer active:scale-[0.98]' : ''
      } transition-transform`}
      style={{ backgroundColor: bgColor }}
    >
      {ad.logo_url && (
        <div className="flex-shrink-0 w-5 h-5 rounded-md overflow-hidden flex items-center justify-center bg-white/40">
          <img
            src={ad.logo_url}
            alt={ad.title || 'Ad'}
            className="w-full h-full object-contain"
          />
        </div>
      )}

      <div className="flex-1 min-w-0">
        <div className="text-[12px] font-medium text-gray-800 truncate">
          {ad.title}
        </div>
      </div>
    </AdWrapper>
  );
}

interface MarqueeRailProps {
  ads: SidebarAd[];
  direction?: 'left' | 'right';
}

function MarqueeRail({ ads, direction = 'left' }: MarqueeRailProps) {
  const [isPaused, setIsPaused] = useState(false);

  if (ads.length === 0) return null;

  const duplicatedAds = [...ads, ...ads];

  const animationClass = direction === 'left' ? 'animate-marquee-left' : 'animate-marquee-right';

  const handleTouchStart = () => {
    setIsPaused(true);
  };

  const handleTouchEnd = () => {
    setTimeout(() => {
      setIsPaused(false);
    }, 2000);
  };

  return (
    <div
      className="relative overflow-hidden w-full"
      onTouchStart={handleTouchStart}
      onTouchEnd={handleTouchEnd}
      onPointerDown={handleTouchStart}
      onPointerUp={handleTouchEnd}
    >
      <div
        className={`flex gap-3 ${animationClass} ${isPaused ? 'paused' : ''}`}
        style={{
          width: 'max-content',
        }}
      >
        {duplicatedAds.map((ad, index) => (
          <MobileAdChip key={`${ad.id}-${index}`} ad={ad} index={index % 5} />
        ))}
      </div>
    </div>
  );
}

export function TopAdRail() {
  const [ads, setAds] = useState<SidebarAd[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadAds();
  }, []);

  const loadAds = async () => {
    try {
      const apiUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/sidebar-ads-fetch`;
      const response = await fetch(apiUrl);
      const data = await response.json();

      if (data.ads) {
        const activeAds = data.ads.filter((ad: SidebarAd) => ad.is_active);
        setAds(activeAds.slice(0, 3));
      }
    } catch (err) {
      console.error('Failed to load top rail ads:', err);
    } finally {
      setLoading(false);
    }
  };

  if (loading || ads.length === 0) return null;

  return (
    <div className="w-full px-3 py-[5px]">
      <MarqueeRail ads={ads} direction="left" />
    </div>
  );
}

export function BottomAdRail() {
  const [ads, setAds] = useState<SidebarAd[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadAds();
  }, []);

  const loadAds = async () => {
    try {
      const apiUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/sidebar-ads-fetch`;
      const response = await fetch(apiUrl);
      const data = await response.json();

      if (data.ads) {
        const activeAds = data.ads.filter((ad: SidebarAd) => ad.is_active);
        setAds(activeAds.slice(3, 8));
      }
    } catch (err) {
      console.error('Failed to load bottom rail ads:', err);
    } finally {
      setLoading(false);
    }
  };

  if (loading || ads.length === 0) return null;

  return (
    <div
      className="fixed left-0 right-0 bottom-0 z-[60] pointer-events-none"
      style={{
        paddingBottom: 'max(8px, env(safe-area-inset-bottom))'
      }}
    >
      <div className="absolute inset-x-0 bottom-0 h-14 bg-gradient-to-t from-white/95 via-white/80 to-transparent pointer-events-none" />

      <div className="relative px-3 py-[5px] pointer-events-auto">
        <MarqueeRail ads={ads} direction="left" />
      </div>
    </div>
  );
}

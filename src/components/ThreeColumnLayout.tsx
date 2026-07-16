import { ReactNode, useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';

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

const defaultBgColors = [
  '#E0F2FE',
  '#DBEAFE',
  '#E0E7FF',
  '#F3E8FF',
  '#FCE7F3'
];

const RAIL_INSET = 24;

interface ThreeColumnLayoutProps {
  children: ReactNode;
  className?: string;
}

export default function ThreeColumnLayout({ children, className }: ThreeColumnLayoutProps) {
  const { pathname } = useLocation();
  const showAds = pathname === '/';
  const [ads, setAds] = useState<SidebarAd[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Only load ads on homepage
    if (showAds) {
      loadAds();
    } else {
      setLoading(false);
    }
  }, [showAds]);

  // Must match the condition below that actually renders the fixed ad
  // rails + internal scrollable column (not just "are we on the homepage").
  // The bug this was causing: showAds alone goes true the instant the
  // route matches "/", before the ad fetch resolves — so body/html got
  // overflow:hidden the moment you landed on the homepage, while the JSX
  // was still rendering the plain fallback branch below (no internal
  // scrollable div to compensate). Scrolling did nothing for that entire
  // window on every homepage visit, and permanently if the ad fetch ever
  // failed or returned zero ads — exactly the "page freezes, big blank
  // area, scrolling stops working" reports.
  const showAdRails = showAds && !loading && ads.length > 0;

  useEffect(() => {
    // Only apply overflow styles when the ad-rail layout (with its own
    // internal scrollable column) is actually rendered.
    if (!showAdRails) return;

    const mq = window.matchMedia('(min-width: 1280px)');
    const apply = () => {
      if (mq.matches) {
        document.documentElement.style.overflow = 'hidden';
        document.body.style.overflow = 'hidden';
        document.documentElement.style.height = '100%';
        document.body.style.height = '100%';
      } else {
        document.documentElement.style.overflow = '';
        document.body.style.overflow = '';
        document.documentElement.style.height = '';
        document.body.style.height = '';
      }
    };

    apply();
    mq.addEventListener('change', apply);

    return () => {
      mq.removeEventListener('change', apply);
      document.documentElement.style.overflow = '';
      document.body.style.overflow = '';
      document.documentElement.style.height = '';
      document.body.style.height = '';
    };
  }, [showAdRails]);

  const loadAds = async () => {
    try {
      const apiUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/sidebar-ads-fetch`;
      const response = await fetch(apiUrl);
      const data = await response.json();

      if (data.ads) {
        setAds(data.ads);
      }
    } catch (err) {
      console.error('Failed to load sidebar ads:', err);
    } finally {
      setLoading(false);
    }
  };

  const leftAds = ads.filter(ad => ad.position === 'left').slice(0, 5);
  const rightAds = ads.filter(ad => ad.position === 'right').slice(0, 5);

  const renderAdCard = (ad: SidebarAd, index: number) => {
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
        key={ad.id}
        {...wrapperProps}
        data-sidebar-ad-card="true"
        className={`w-[192px] h-[112px] rounded-lg flex flex-col items-center justify-start pt-[12px] pb-[14px] px-[12px] mx-auto transition-transform relative border border-[#E5E7EB] overflow-visible ${ad.target_url ? 'hover:scale-105 cursor-pointer' : ''}`}
        style={{ backgroundColor: bgColor }}
      >
        {ad.target_url && (
          <span className="absolute top-3 right-3 text-gray-400 text-lg leading-none">→</span>
        )}
        {ad.logo_url && (
          <div
            className="w-full flex items-center justify-center mb-1"
            style={{ height: 'var(--sidebarAdLogoMaxH)' }}
          >
            <img
              src={ad.logo_url}
              alt={ad.title || 'Ad'}
              data-sidebar-ad-logo="true"
              className="object-contain"
            />
          </div>
        )}
        {ad.title && (
          <div className="text-center text-xs font-bold text-gray-800 leading-snug mb-1 whitespace-nowrap overflow-hidden text-ellipsis w-full">
            {ad.title}
          </div>
        )}
        {ad.subtitle && (
          <div className="sidebar-ad-subtitle text-center text-[11px] text-gray-600 leading-snug w-full">
            {ad.subtitle}
          </div>
        )}
      </AdWrapper>
    );
  };

  // If not on homepage, or no ads to show, render simple layout
  if (!showAdRails) {
    return <div className={`w-full ${className || ''}`}>{children}</div>;
  }

  return (
    <>
      <div className="hidden xl:block">
        <aside
          className="fixed"
          style={{
            left: '12px',
            top: '24px',
            bottom: '24px',
            width: '212px',
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'center',
            gap: 'clamp(10px, 1.2vh, 16px)',
            zIndex: 20,
            pointerEvents: 'auto'
          }}
        >
          {leftAds.map((ad, index) => renderAdCard(ad, index))}
        </aside>

        <aside
          className="fixed"
          style={{
            right: `${RAIL_INSET}px`,
            top: '24px',
            bottom: '24px',
            width: '212px',
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'center',
            gap: 'clamp(10px, 1.2vh, 16px)',
            zIndex: 20,
            pointerEvents: 'auto'
          }}
        >
          {rightAds.map((ad, index) => renderAdCard(ad, index))}
        </aside>

        <div
          className={`h-screen overflow-y-auto overflow-x-hidden ${className || ''}`}
          style={{
            paddingLeft: '224px',
            paddingRight: `${212 + RAIL_INSET}px`,
            paddingTop: '24px'
          }}
        >
          <div className="w-full max-w-[1366px] mx-auto px-6">
            <div className="mx-auto w-full max-w-[860px]">
              {children}
            </div>
          </div>
        </div>
      </div>

      <div className={`xl:hidden w-full ${className || ''}`}>
        {children}
      </div>
    </>
  );
}

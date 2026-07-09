import { useState } from 'react';

interface AgencyLogoProps {
  logoUrl?: string | null;
  agencyName: string;
  className?: string;
  imgClassName?: string;
  size?: 'sm' | 'md' | 'lg';
  variant?: 'card' | 'modal' | 'inline';
  priority?: boolean;
}

const PLACEHOLDER_SVG = '/images/agencies/default-agency-logo.svg';

const sizeMap = {
  sm: { wrapper: 'w-10 h-7', img: 'max-h-7 max-w-[80px]', placeholder: 'w-10 h-7', w: 80, h: 28 },
  md: { wrapper: 'w-14 h-10', img: 'max-h-10 max-w-[110px]', placeholder: 'w-14 h-10', w: 110, h: 40 },
  lg: { wrapper: 'w-16 h-14', img: 'max-h-14 max-w-[140px]', placeholder: 'w-16 h-14', w: 140, h: 56 },
};

export default function AgencyLogo({
  logoUrl,
  agencyName,
  className = '',
  imgClassName = '',
  size = 'md',
  variant = 'card',
  priority = false,
}: AgencyLogoProps) {
  const [failed, setFailed] = useState(false);

  const hasRealLogo = !!logoUrl && logoUrl.trim() !== '' && !failed;
  const src = hasRealLogo ? logoUrl! : PLACEHOLDER_SVG;
  const sizes = sizeMap[size];
  const alt = hasRealLogo ? `${agencyName} logo` : 'Agency placeholder';
  const loadingAttr = priority ? undefined : ('lazy' as const);
  const fetchPriorityAttr = priority ? ('high' as const) : undefined;

  if (variant === 'modal') {
    return (
      <div className={`flex items-center justify-center ${className}`}>
        <div className="flex items-center justify-center h-16 w-32 rounded-xl bg-slate-50 border border-slate-100 overflow-hidden p-2">
          <img
            src={src}
            alt={alt}
            width={128}
            height={64}
            className={`h-full w-full object-contain ${imgClassName}`}
            loading={loadingAttr}
            decoding="async"
            onError={() => setFailed(true)}
          />
        </div>
      </div>
    );
  }

  if (variant === 'inline') {
    return (
      <div className={`flex items-center justify-center rounded-lg bg-slate-50 border border-slate-100 overflow-hidden p-1.5 ${sizes.placeholder} ${className}`}>
        <img
          src={src}
          alt={alt}
          width={sizes.w}
          height={sizes.h}
          className={`object-contain ${sizes.img} ${imgClassName}`}
          loading={loadingAttr}
          decoding="async"
          onError={() => setFailed(true)}
        />
      </div>
    );
  }

  return (
    <div className={`agency-logo-wrapper ${className}`} style={{ aspectRatio: `${sizes.w}/${sizes.h}` }}>
      <img
        src={src}
        alt={alt}
        width={sizes.w}
        height={sizes.h}
        className={`agency-logo ${!hasRealLogo ? 'agency-logo-placeholder' : ''} ${imgClassName}`}
        loading={loadingAttr}
        decoding="async"
        // @ts-ignore fetchpriority not in React types yet
        fetchpriority={fetchPriorityAttr}
        onError={() => setFailed(true)}
      />
    </div>
  );
}

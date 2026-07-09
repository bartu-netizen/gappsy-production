import { MapPin, Globe, Zap, Star } from 'lucide-react';
import AgencyLogo from './AgencyLogo';

export type FinalizationListingType = 'top25_rank' | 'top25' | 'spotlight' | 'other_listing';

interface ListingPreviewCardProps {
  type: FinalizationListingType;
  name: string;
  logoUrl?: string | null;
  intro?: string;
  services?: string[];
  stateName: string;
  rankNumber?: number | null;
  hasCardVisualUpgrade?: boolean;
  websiteUrl?: string;
}

export default function ListingPreviewCard({
  type,
  name,
  logoUrl,
  intro,
  services = [],
  stateName,
  rankNumber,
  hasCardVisualUpgrade = false,
  websiteUrl,
}: ListingPreviewCardProps) {
  const displayName = name || 'Your Agency Name';
  const isTop25 = type === 'top25_rank' || type === 'top25';
  const isSpotlight = type === 'spotlight';

  if (isSpotlight) {
    return (
      <div
        className="rounded-xl shadow-xl overflow-hidden"
        style={{ background: 'linear-gradient(135deg, #1e3a5f 0%, #0f2942 100%)', minHeight: '260px' }}
      >
        <div className="p-6 text-white">
          <div className="inline-block mb-4 px-3 py-1 rounded-full text-xs font-semibold uppercase tracking-wide" style={{ background: 'rgba(255,255,255,0.15)' }}>
            Featured Spotlight
          </div>

          {logoUrl ? (
            <div className="mb-4 h-12 flex items-center">
              <img
                src={logoUrl}
                alt={`${displayName} logo`}
                className="h-10 w-auto object-contain"
                style={{ filter: 'brightness(0) invert(1)' }}
              />
            </div>
          ) : (
            <div className="mb-4 h-12 flex items-center">
              <div className="h-10 w-24 rounded-lg" style={{ background: 'rgba(255,255,255,0.1)' }} />
            </div>
          )}

          <h3 className="text-xl font-bold mb-2">{displayName}</h3>

          {intro ? (
            <p className="text-sm mb-4 line-clamp-3" style={{ color: 'rgba(255,255,255,0.8)' }}>{intro}</p>
          ) : (
            <p className="text-sm italic mb-4" style={{ color: 'rgba(255,255,255,0.4)' }}>Add a description to see it here...</p>
          )}

          {services.length > 0 && (
            <div className="flex flex-wrap gap-2 mb-4">
              {services.slice(0, 4).map(s => (
                <span key={s} className="px-2 py-1 rounded-full text-xs" style={{ background: 'rgba(255,255,255,0.15)' }}>{s}</span>
              ))}
            </div>
          )}

          {websiteUrl && (
            <div className="inline-flex items-center gap-1.5 px-4 py-2 bg-white text-gray-900 font-semibold rounded-lg text-sm">
              <Globe className="w-3.5 h-3.5" />
              {websiteUrl.replace(/^https?:\/\//, '').replace(/\/$/, '')}
            </div>
          )}
        </div>
      </div>
    );
  }

  if (isTop25) {
    return (
      <div className="bg-white rounded-xl overflow-hidden" style={{ border: '2px solid #bfdbfe', boxShadow: '0 4px 20px rgba(59,130,246,0.12)' }}>
        <div className="px-4 py-2.5 flex items-center gap-2" style={{ background: 'linear-gradient(90deg, #2563eb 0%, #1d4ed8 100%)' }}>
          <Star className="w-4 h-4 fill-yellow-300 text-yellow-300" />
          <span className="text-white text-sm font-bold">
            Top 25 {rankNumber ? `#${rankNumber}` : ''} · {stateName}
          </span>
          {hasCardVisualUpgrade && (
            <div className="ml-auto flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-bold" style={{ background: '#fbbf24', color: '#78350f' }}>
              <Zap className="w-3 h-3" style={{ fill: '#78350f' }} />
              Featured
            </div>
          )}
        </div>

        <div className="p-5">
          <div className="flex items-start gap-4">
            <div className="flex-shrink-0">
              <AgencyLogo logoUrl={logoUrl || null} agencyName={displayName} size="md" variant="inline" />
            </div>
            <div className="flex-1 min-w-0">
              <h3 className="font-bold text-gray-900 text-lg leading-tight mb-1 truncate">{displayName}</h3>
              <div className="flex items-center gap-1 text-gray-500 text-xs mb-2 flex-wrap">
                <MapPin className="w-3 h-3 flex-shrink-0" />
                <span>{stateName}</span>
                {websiteUrl && (
                  <>
                    <span className="mx-0.5">·</span>
                    <Globe className="w-3 h-3 flex-shrink-0" />
                    <span className="truncate max-w-[140px]">{websiteUrl.replace(/^https?:\/\//, '').replace(/\/$/, '')}</span>
                  </>
                )}
              </div>
              {intro ? (
                <p className="text-gray-600 text-sm line-clamp-3">{intro}</p>
              ) : (
                <p className="text-gray-400 text-sm italic">Add a description to see it here...</p>
              )}
            </div>
          </div>

          {services.length > 0 && (
            <div className="mt-3 flex flex-wrap gap-1.5">
              {services.slice(0, 5).map(s => (
                <span key={s} className="px-2 py-0.5 rounded-full text-xs font-medium" style={{ background: '#eff6ff', color: '#1d4ed8', border: '1px solid #bfdbfe' }}>
                  {s}
                </span>
              ))}
              {services.length > 5 && (
                <span className="px-2 py-0.5 rounded-full text-xs text-gray-500" style={{ background: '#f1f5f9' }}>
                  +{services.length - 5} more
                </span>
              )}
            </div>
          )}
        </div>
      </div>
    );
  }

  return (
    <div className="bg-white rounded-xl overflow-hidden" style={{ border: '1px solid #e2e8f0', boxShadow: '0 2px 8px rgba(0,0,0,0.06)' }}>
      <div className="p-5">
        <div className="flex items-start gap-3">
          <div className="flex-shrink-0">
            <AgencyLogo logoUrl={logoUrl || null} agencyName={displayName} size="sm" variant="inline" />
          </div>
          <div className="flex-1 min-w-0">
            <h3 className="font-bold text-gray-900 leading-tight mb-1 truncate">{displayName}</h3>
            <div className="flex items-center gap-1 text-gray-500 text-xs mb-2">
              <MapPin className="w-3 h-3" />
              <span>{stateName}</span>
            </div>
            {intro ? (
              <p className="text-gray-600 text-sm line-clamp-3">{intro}</p>
            ) : (
              <p className="text-gray-400 text-sm italic">Add a description to see it here...</p>
            )}
          </div>
        </div>

        {services.length > 0 && (
          <div className="mt-3 flex flex-wrap gap-1.5">
            {services.slice(0, 5).map(s => (
              <span key={s} className="px-2 py-0.5 rounded-full text-xs" style={{ background: '#f1f5f9', color: '#475569' }}>
                {s}
              </span>
            ))}
          </div>
        )}

        {hasCardVisualUpgrade && (
          <div className="mt-3 flex items-center gap-1.5 px-2.5 py-1 rounded-md text-xs font-medium w-fit" style={{ background: '#fefce8', color: '#a16207', border: '1px solid #fde68a' }}>
            <Zap className="w-3 h-3" style={{ fill: '#a16207' }} />
            Card Visual Upgrade Active
          </div>
        )}
      </div>

      <div className="px-5 pb-4">
        <button
          disabled
          className="w-full py-2.5 rounded-lg text-sm font-semibold cursor-default"
          style={{ background: '#f1f5f9', color: '#64748b' }}
        >
          Listing Active
        </button>
      </div>
    </div>
  );
}

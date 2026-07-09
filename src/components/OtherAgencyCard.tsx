import { MapPin } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import ServicesBadges from './ServicesBadges';
import ListingDescription from './ListingDescription';
import type { OwnerPreviewStep } from './OwnerStickyBar';
import { isStatepageAvailabilityEnabled } from '../config/availabilityHostFlag';

interface OtherAgencyCardProps {
  agencyId: string;
  name: string;
  location: string;
  stateName: string;
  stateSlug: string;
  intro: string;
  services: string[];
  hasCardVisualUpgrade?: boolean;
  isPlaceholder?: boolean;
  highlighted?: boolean;
  ownerMode?: boolean;
  ownerPreviewStep?: OwnerPreviewStep;
  isOwnerCard?: boolean;
  onOwnerCheckAvailability?: () => void;
  onOpenStatepageAvailability?: (agencyId: string, directClient?: boolean) => void;
  disableCheckAvailability?: boolean;
  isPaidListing?: boolean;
  hideIntro?: boolean;
}

function OtherAgencyCard({
  agencyId,
  name,
  location,
  stateName,
  stateSlug,
  intro,
  services,
  hasCardVisualUpgrade,
  isPlaceholder,
  highlighted = false,
  ownerMode = false,
  ownerPreviewStep = 1,
  isOwnerCard = false,
  onOwnerCheckAvailability,
  onOpenStatepageAvailability,
  disableCheckAvailability = false,
  isPaidListing = false,
  hideIntro = true,
}: OtherAgencyCardProps) {
  const navigate = useNavigate();

  const showStep2 = isOwnerCard && ownerMode && ownerPreviewStep === 2;

  const handleCheckAvailability = (e?: React.MouseEvent) => {
    if (disableCheckAvailability) {
      return;
    }

    if (showStep2) {
      onOwnerCheckAvailability?.();
      return;
    }

    if (ownerMode && !isOwnerCard) {
      e?.preventDefault();
      e?.stopPropagation();
      return;
    }

    if (onOpenStatepageAvailability && isStatepageAvailabilityEnabled(stateSlug)) {
      onOpenStatepageAvailability(agencyId, isPaidListing);
      return;
    }

    if (isPaidListing) {
      navigate(`/availability/client?agencyId=${agencyId}&source=other&state=${stateSlug}`);
      return;
    }

    navigate(`/availability/start?agencyId=${agencyId}&source=other&state=${stateSlug}`);
  };

  const isOwnerHighlighted = isOwnerCard && highlighted;

  return (
    <div
      id={`agency-${agencyId}`}
      data-agency-id={agencyId}
      data-owner-agency-id={agencyId}
      className={`other-agency-card relative flex flex-col transition-all duration-700 ${
        isOwnerHighlighted
          ? 'owner-highlight'
          : highlighted
          ? 'ring-2 ring-blue-400 ring-offset-2 bg-blue-50/60 shadow-lg shadow-blue-200/50'
          : ''
      } ${showStep2 ? 'owner-card-step2' : ''}`}
    >
      <div className="other-agency-card-top flex-1 flex flex-col">
        <div className="flex flex-col justify-start gap-1 mb-3">
          <h3 className="other-agency-name line-clamp-2" title={name}>{name}</h3>

          <div className="other-agency-location line-clamp-1">
            <MapPin className="location-pin-icon" size={14} strokeWidth={1.5} />
            <span>{stateName}</span>
          </div>
        </div>

        {!hideIntro && (
          <div className="mb-3 min-h-[80px]">
            <ListingDescription
              fullText={intro}
              limit={160}
              forceCollapsed={true}
              isPreviewPage={false}
            />
          </div>
        )}

        <ServicesBadges
          services={services}
          badgeClassName="service-tag"
          containerClassName="other-agency-services mt-auto"
        />
      </div>

      <div className="other-agency-card-bottom">
        <div className="relative">
          {showStep2 && (
            <div className="owner-cta-arrow-wrap" aria-hidden="true">
              <svg
                width="64"
                height="64"
                viewBox="0 0 64 64"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
                className="md:w-20 md:h-20"
              >
                <path
                  d="M32 8 L32 48 M32 48 L16 32 M32 48 L48 32"
                  stroke="#34d399"
                  strokeWidth="6"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            </div>
          )}
          <button
            type="button"
            onClick={(e) => handleCheckAvailability(e)}
            disabled={disableCheckAvailability}
            aria-disabled={disableCheckAvailability}
            className={`other-agency-cta ${showStep2 ? 'owner-cta-btn-pulse' : ''} ${
              disableCheckAvailability ? 'cursor-default opacity-75' : ''
            }`}
          >
            {disableCheckAvailability ? 'Listing Active' : 'Check Availability'}
          </button>
        </div>
      </div>
    </div>
  );
}

export default OtherAgencyCard;

import { RecommendedAgency } from '../config/recommendedAgency';
import ListingDescription from './ListingDescription';
import AgencyLogo from './AgencyLogo';
import { formatStateName } from '../utils/formatLocation';

interface RecommendationCardProps {
  agency: RecommendedAgency;
  stateName: string;
  onVisit: () => void;
  mode?: string;
  showBadge?: boolean;
  hideLogoPlaceholder?: boolean;
  hideVisitButton?: boolean;
  hideLogo?: boolean;
}

export default function RecommendationCard({ agency, stateName, onVisit, mode, showBadge = true, hideLogoPlaceholder = false, hideVisitButton = false, hideLogo = false }: RecommendationCardProps) {
  const isOwnerSimulation = mode === 'owner-sim';
  const logoUrl = agency.logo || agency.logo_url || null;
  const showLogoArea = !hideLogo && (!hideLogoPlaceholder || !!logoUrl);

  return (
    <div className="w-full max-w-[680px] mx-auto bg-[#F8F9FD] border border-[rgba(0,0,0,0.05)] rounded-2xl p-4 shadow-sm">
      <div className="text-center">
        {showBadge && (
          <div className={`inline-flex items-center gap-1.5 text-[9px] font-semibold px-3 py-1 rounded-full mb-2.5 uppercase tracking-wider ${
            hideLogo
              ? 'bg-gradient-to-r from-orange-50 to-amber-100 text-amber-800 border border-amber-200/70'
              : 'bg-gradient-to-r from-blue-50 to-blue-100 text-[#0A1735]'
          }`}>
            {hideLogo && <span className="inline-block w-1.5 h-1.5 rounded-full bg-amber-500 flex-shrink-0" />}
            {hideLogo ? 'Matched with another agency' : 'Best match for your project'}
          </div>
        )}

        {showLogoArea && (
          <div className="flex justify-center mb-3">
            <AgencyLogo
              logoUrl={logoUrl}
              agencyName={agency.name}
              size="lg"
              variant="modal"
            />
          </div>
        )}

        <h3 className={`mb-0.5 ${hideLogo ? 'text-xl md:text-2xl font-extrabold text-gray-900' : 'text-lg md:text-xl font-bold text-gray-900'}`}>
          {agency.name}
        </h3>

        <p className="text-[11px] md:text-xs text-gray-500 mb-2">
          {formatStateName(stateName)}
        </p>

        <div className="mb-3 max-w-[540px] mx-auto">
          <ListingDescription
            fullText={agency.description}
            limit={160}
            forceCollapsed={true}
            isPreviewPage={false}
          />
        </div>

        {!hideVisitButton && (
          <>
            <button
              onClick={isOwnerSimulation ? undefined : onVisit}
              disabled={isOwnerSimulation}
              className={`w-full md:w-auto md:px-8 py-2.5 px-6 rounded-lg font-semibold transition-colors shadow-sm ${
                isOwnerSimulation
                  ? 'bg-slate-300 text-slate-500 cursor-not-allowed'
                  : 'bg-blue-600 text-white hover:bg-blue-700 hover:shadow-md'
              }`}
            >
              Visit Website →
            </button>

            <p className="text-[11px] text-gray-500 mt-2">
              Opens {(() => { try { return new URL(agency.website).hostname; } catch { return agency.website; } })()} in a new tab.
            </p>
          </>
        )}
      </div>
    </div>
  );
}

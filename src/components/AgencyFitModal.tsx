import { X, Rocket, Store, ShoppingCart, Building } from 'lucide-react';
import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useScrollLock } from '../hooks/useScrollLock';
import { getStateListingUrl } from '../utils/stateListingUrl';

interface AgencyFitModalProps {
  isOpen: boolean;
  onClose: () => void;
  agencyName: string;
  stateName: string;
  stateSlug: string;
  lastUpdatedDate: string;
}

type PersonaType = 'startup' | 'local-business' | 'ecommerce' | 'growing-company';

export default function AgencyFitModal({
  isOpen,
  onClose,
  agencyName,
  stateName,
  stateSlug,
  lastUpdatedDate
}: AgencyFitModalProps) {
  const [selectedPersona, setSelectedPersona] = useState<PersonaType | null>(null);

  useScrollLock(isOpen);

  useEffect(() => {
    if (!isOpen) return;

    const handleEsc = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        handleClose();
      }
    };

    window.addEventListener('keydown', handleEsc);
    return () => window.removeEventListener('keydown', handleEsc);
  }, [isOpen]);

  const handleClose = () => {
    setSelectedPersona(null);
    onClose();
  };

  const handleOverlayClick = (e: React.MouseEvent) => {
    if (e.target === e.currentTarget) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  if (!isOpen) return null;

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm px-2 py-3 sm:px-4 sm:py-8"
      onClick={handleOverlayClick}
    >
      <div
        className="relative w-full flex flex-col bg-white rounded-xl shadow-[0_8px_24px_rgba(0,0,0,0.06)] max-h-[94vh] overflow-hidden"
        style={{ maxWidth: '900px' }}
      >
        {!selectedPersona ? (
          <div className="sticky top-0 z-10 flex items-center justify-between px-3 py-3 sm:px-6 sm:py-5 bg-white border-b border-gray-200 rounded-t-xl">
            <div className="flex-1 pr-3 sm:pr-4">
              <h2 className="text-base sm:text-lg md:text-xl font-bold text-gray-900 leading-tight">
                Is {agencyName} a good fit for your business?
              </h2>
              <p className="text-xs sm:text-sm text-gray-600 mt-1">Answer one quick question to see our recommendation.</p>
            </div>
            <button
              onClick={handleClose}
              className="p-1.5 sm:p-2 hover:bg-gray-100 rounded-lg transition-colors flex-shrink-0"
              aria-label="Close modal"
            >
              <X className="w-4 h-4 sm:w-5 sm:h-5 text-gray-500" />
            </button>
          </div>
        ) : (
          <div className="sticky top-0 z-10 flex items-center justify-end px-3 py-2 sm:px-6 sm:py-4 bg-white border-b border-gray-200 rounded-t-xl">
            <button
              onClick={handleClose}
              className="p-1.5 sm:p-2 hover:bg-gray-100 rounded-lg transition-colors flex-shrink-0"
              aria-label="Close modal"
            >
              <X className="w-4 h-4 sm:w-5 sm:h-5 text-gray-500" />
            </button>
          </div>
        )}

        <div className="flex-1 overflow-y-auto px-3 py-3 sm:px-6 sm:py-6">
          {!selectedPersona ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5 sm:gap-4">
              <button
                onClick={() => setSelectedPersona('startup')}
                className="p-3 sm:p-6 rounded-xl border-2 border-gray-200 bg-white hover:border-indigo-300 hover:shadow-sm transition-all text-left min-h-[100px] sm:min-h-[120px]"
              >
                <div className="w-9 h-9 sm:w-12 sm:h-12 rounded-lg bg-indigo-100 flex items-center justify-center mb-2 sm:mb-3">
                  <Rocket className="w-4 h-4 sm:w-6 sm:h-6 text-indigo-600" />
                </div>
                <h3 className="font-semibold text-gray-900 mb-0.5 sm:mb-1 text-sm sm:text-base">Early-Stage Startup</h3>
                <p className="text-xs sm:text-sm text-gray-600">Building first product</p>
              </button>

              <button
                onClick={() => setSelectedPersona('local-business')}
                className="p-3 sm:p-6 rounded-xl border-2 border-gray-200 bg-white hover:border-indigo-300 hover:shadow-sm transition-all text-left min-h-[100px] sm:min-h-[120px]"
              >
                <div className="w-9 h-9 sm:w-12 sm:h-12 rounded-lg bg-indigo-100 flex items-center justify-center mb-2 sm:mb-3">
                  <Store className="w-4 h-4 sm:w-6 sm:h-6 text-indigo-600" />
                </div>
                <h3 className="font-semibold text-gray-900 mb-0.5 sm:mb-1 text-sm sm:text-base">Local Small Business</h3>
                <p className="text-xs sm:text-sm text-gray-600">Serving local community</p>
              </button>

              <button
                onClick={() => setSelectedPersona('ecommerce')}
                className="p-3 sm:p-6 rounded-xl border-2 border-gray-200 bg-white hover:border-indigo-300 hover:shadow-sm transition-all text-left min-h-[100px] sm:min-h-[120px]"
              >
                <div className="w-9 h-9 sm:w-12 sm:h-12 rounded-lg bg-indigo-100 flex items-center justify-center mb-2 sm:mb-3">
                  <ShoppingCart className="w-4 h-4 sm:w-6 sm:h-6 text-indigo-600" />
                </div>
                <h3 className="font-semibold text-gray-900 mb-0.5 sm:mb-1 text-sm sm:text-base">Ecommerce Brand</h3>
                <p className="text-xs sm:text-sm text-gray-600">Selling online</p>
              </button>

              <button
                onClick={() => setSelectedPersona('growing-company')}
                className="p-3 sm:p-6 rounded-xl border-2 border-gray-200 bg-white hover:border-indigo-300 hover:shadow-sm transition-all text-left min-h-[100px] sm:min-h-[120px]"
              >
                <div className="w-9 h-9 sm:w-12 sm:h-12 rounded-lg bg-indigo-100 flex items-center justify-center mb-2 sm:mb-3">
                  <Building className="w-4 h-4 sm:w-6 sm:h-6 text-indigo-600" />
                </div>
                <h3 className="font-semibold text-gray-900 mb-0.5 sm:mb-1 text-sm sm:text-base">Growing Company</h3>
                <p className="text-xs sm:text-sm text-gray-600">10–100 employees</p>
              </button>
            </div>
          ) : (
            <div className="space-y-3 sm:space-y-5 max-w-3xl mx-auto">
              <button
                onClick={() => setSelectedPersona(null)}
                className="text-xs sm:text-sm text-gray-600 hover:text-gray-900 font-medium flex items-center gap-1 -ml-1 px-1 py-1 hover:bg-gray-50 rounded transition-colors"
              >
                ← Change selection
              </button>

              {selectedPersona === 'startup' && (
                <div className="space-y-3 sm:space-y-4">
                  <h3 className="text-base sm:text-lg md:text-xl font-bold text-gray-900 leading-tight">
                    Considerations for early-stage startups
                  </h3>
                  <p className="text-gray-700 text-xs sm:text-sm md:text-base leading-relaxed">
                    Early-stage startups often prioritize agencies with clearly documented case studies, transparent pricing,
                    and fast iteration cycles. As of {lastUpdatedDate}, these signals are limited or not publicly verifiable
                    for {agencyName}, which may increase decision risk for early teams.
                  </p>
                  <Link
                    to={getStateListingUrl(stateSlug)}
                    onClick={handleClose}
                    className="inline-flex items-center justify-center gap-2 w-full sm:w-auto px-4 sm:px-6 py-2.5 sm:py-3 bg-indigo-600 text-white rounded-lg font-semibold hover:bg-indigo-700 transition shadow-sm text-xs sm:text-sm md:text-base whitespace-nowrap"
                  >
                    <span className="hidden sm:inline">View startup-friendly agencies in {stateName}</span>
                    <span className="inline sm:hidden">View {stateName} Agencies</span>
                    <svg className="w-3 h-3 sm:w-4 sm:h-4 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                    </svg>
                  </Link>
                </div>
              )}

              {selectedPersona === 'local-business' && (
                <div className="space-y-3 sm:space-y-4">
                  <h3 className="text-base sm:text-lg md:text-xl font-bold text-gray-900 leading-tight">
                    Considerations for local small businesses
                  </h3>
                  <p className="text-gray-700 text-xs sm:text-sm md:text-base leading-relaxed">
                    Local businesses often look for agencies with proven local results, clearly defined service scopes,
                    and visible client outcomes. Public documentation for these areas remains limited for {agencyName} as
                    of {lastUpdatedDate}.
                  </p>
                  <Link
                    to={getStateListingUrl(stateSlug)}
                    onClick={handleClose}
                    className="inline-flex items-center justify-center gap-2 w-full sm:w-auto px-4 sm:px-6 py-2.5 sm:py-3 bg-indigo-600 text-white rounded-lg font-semibold hover:bg-indigo-700 transition shadow-sm text-xs sm:text-sm md:text-base whitespace-nowrap"
                  >
                    <span className="hidden sm:inline">Browse established local agencies in {stateName}</span>
                    <span className="inline sm:hidden">View {stateName} Agencies</span>
                    <svg className="w-3 h-3 sm:w-4 sm:h-4 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                    </svg>
                  </Link>
                </div>
              )}

              {selectedPersona === 'ecommerce' && (
                <div className="space-y-3 sm:space-y-4">
                  <h3 className="text-base sm:text-lg md:text-xl font-bold text-gray-900 leading-tight">
                    Considerations for ecommerce brands
                  </h3>
                  <p className="text-gray-700 text-xs sm:text-sm md:text-base leading-relaxed">
                    Ecommerce brands typically require platform-specific experience, performance benchmarks, and scalable processes.
                    Based on publicly available information, these indicators are not clearly demonstrated for {agencyName} as
                    of {lastUpdatedDate}.
                  </p>
                  <Link
                    to={getStateListingUrl(stateSlug)}
                    onClick={handleClose}
                    className="inline-flex items-center justify-center gap-2 w-full sm:w-auto px-4 sm:px-6 py-2.5 sm:py-3 bg-indigo-600 text-white rounded-lg font-semibold hover:bg-indigo-700 transition shadow-sm text-xs sm:text-sm md:text-base whitespace-nowrap"
                  >
                    <span className="hidden sm:inline">Compare ecommerce-focused agencies in {stateName}</span>
                    <span className="inline sm:hidden">View {stateName} Agencies</span>
                    <svg className="w-3 h-3 sm:w-4 sm:h-4 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                    </svg>
                  </Link>
                </div>
              )}

              {selectedPersona === 'growing-company' && (
                <div className="space-y-3 sm:space-y-4">
                  <h3 className="text-base sm:text-lg md:text-xl font-bold text-gray-900 leading-tight">
                    Considerations for growing companies
                  </h3>
                  <p className="text-gray-700 text-xs sm:text-sm md:text-base leading-relaxed">
                    As companies scale, agency selection often depends on team depth, documented processes, and long-term
                    performance history. These factors are currently not fully visible for {agencyName} based on public
                    data reviewed as of {lastUpdatedDate}.
                  </p>
                  <Link
                    to={getStateListingUrl(stateSlug)}
                    onClick={handleClose}
                    className="inline-flex items-center justify-center gap-2 w-full sm:w-auto px-4 sm:px-6 py-2.5 sm:py-3 bg-indigo-600 text-white rounded-lg font-semibold hover:bg-indigo-700 transition shadow-sm text-xs sm:text-sm md:text-base whitespace-nowrap"
                  >
                    <span className="hidden sm:inline">See top-rated agencies for growing companies in {stateName}</span>
                    <span className="inline sm:hidden">View {stateName} Agencies</span>
                    <svg className="w-3 h-3 sm:w-4 sm:h-4 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                    </svg>
                  </Link>
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

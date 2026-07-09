import { X, ArrowRight } from 'lucide-react';
import type { MouseEvent } from 'react';

interface OwnerHowItWorksModalProps {
  isOpen: boolean;
  onClose: () => void;
  agencyName: string;
  stateName: string;
}

export default function OwnerHowItWorksModal({
  isOpen,
  onClose,
  agencyName,
  stateName,
}: OwnerHowItWorksModalProps) {
  if (!isOpen) return null;

  const handleBackdropClick = (e: MouseEvent<HTMLDivElement>) => {
    e.preventDefault();
    e.stopPropagation();
  };

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm overflow-y-auto py-4 md:py-16"
      role="dialog"
      aria-modal="true"
      onClick={handleBackdropClick}
    >
      <div
        className="absolute inset-0 bg-black/40 backdrop-blur-sm"
        onClick={handleBackdropClick}
        aria-hidden="true"
      />

      <div
        className="relative w-full max-w-md mx-4 bg-white rounded-2xl shadow-[0_8px_24px_rgba(0,0,0,0.06)] overflow-hidden flex flex-col max-h-[90dvh]"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between px-4 sm:px-6 py-4 sm:py-4 border-b border-slate-100 bg-white">
            <h2 className="text-lg font-bold text-slate-900">How clients hire you</h2>
            <button
              onClick={onClose}
              className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-lg transition-colors"
              aria-label="Close modal"
            >
              <X className="w-5 h-5" />
            </button>
          </div>

          <div className="flex-1 overflow-y-auto px-4 py-4 sm:px-6 sm:py-6">
            <div className="space-y-6">
              <div>
                <div className="flex items-start gap-4 mb-4">
                  <div className="flex-shrink-0 w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-sm font-bold text-blue-600">
                    1
                  </div>
                  <div>
                    <h3 className="font-semibold text-slate-900 mb-1">
                      Clients browse your state page
                    </h3>
                    <p className="text-sm text-slate-600">
                      Businesses in {stateName} search for marketing agencies on this page to find partners who can help grow their business.
                    </p>
                  </div>
                </div>
              </div>

              <div>
                <div className="flex items-start gap-4 mb-4">
                  <div className="flex-shrink-0 w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-sm font-bold text-blue-600">
                    2
                  </div>
                  <div>
                    <h3 className="font-semibold text-slate-900 mb-1">
                      They find your listing
                    </h3>
                    <p className="text-sm text-slate-600">
                      Your agency profile shows key details like services, experience, and company info. Clients learn what makes you unique.
                    </p>
                  </div>
                </div>
              </div>

              <div>
                <div className="flex items-start gap-4 mb-4">
                  <div className="flex-shrink-0 w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-sm font-bold text-blue-600">
                    3
                  </div>
                  <div>
                    <h3 className="font-semibold text-slate-900 mb-1">
                      They click "Check Availability"
                    </h3>
                    <p className="text-sm text-slate-600">
                      Clients submit a quick availability request to get in touch. This is how you generate leads from this page.
                    </p>
                  </div>
                </div>
              </div>

              <div>
                <div className="flex items-start gap-4 mb-4">
                  <div className="flex-shrink-0 w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-sm font-bold text-blue-600">
                    4
                  </div>
                  <div>
                    <h3 className="font-semibold text-slate-900 mb-1">
                      You follow up & close the deal
                    </h3>
                    <p className="text-sm text-slate-600">
                      Use the lead information to reach out and discuss how you can help their business. The rest is up to you!
                    </p>
                  </div>
                </div>
              </div>

              <div className="pt-2 border-t border-slate-200">
                <p className="text-xs text-slate-600 mb-4">
                  Paid listings receive higher visibility and may generate more client requests.
                </p>
              </div>
            </div>
          </div>

          <div className="px-4 py-4 sm:px-6 sm:py-4 border-t border-slate-100 bg-slate-50 flex gap-3">
            <button
              onClick={onClose}
              className="flex-1 px-4 py-2 text-sm font-semibold text-slate-700 bg-white border border-slate-300 rounded-lg hover:bg-slate-100 transition-colors"
            >
              Got it
            </button>
            <button
              onClick={() => {
                window.open('/pricing', '_blank');
              }}
              className="flex-1 flex items-center justify-center gap-2 px-4 py-2 text-sm font-semibold text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors"
            >
              Upgrade
              <ArrowRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>
  );
}

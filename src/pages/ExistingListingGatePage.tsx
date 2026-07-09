import { useEffect } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { CheckCircle2, Eye } from 'lucide-react';

export default function ExistingListingGatePage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();

  const agencyId = searchParams.get('agencyId');
  const agencyName = searchParams.get('agencyName');
  const stateName = searchParams.get('state');
  const stateSlug = searchParams.get('stateSlug');

  useEffect(() => {
    document.title = 'Your Agency is Already Listed | Gappsy';

    if (!agencyId || !stateName || !stateSlug) {
      console.error('Missing required parameters');
      navigate('/');
    }
  }, [agencyId, stateName, stateSlug, navigate]);

  const handleActivateClick = () => {
    navigate(`/availability/owner/edit-listing?agencyId=${agencyId}&state=${stateSlug}&mode=activate`);
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 via-white to-slate-50 px-4 py-8">
      <div className="w-full max-w-xl md:max-w-2xl">
        <div className="bg-white rounded-2xl shadow-xl border border-gray-100 p-6 md:p-12">
          {/* Private Owner Notice Banner */}
          <div className="bg-indigo-600 text-white rounded-xl p-3 md:p-4 flex items-center gap-3 shadow-lg mb-6 md:mb-8">
            <div className="flex-shrink-0 w-8 h-8 md:w-10 md:h-10 rounded-lg bg-indigo-500 flex items-center justify-center">
              <Eye className="w-4 h-4 md:w-5 md:h-5" />
            </div>
            <div className="font-semibold text-sm md:text-base">
              PRIVATE OWNER NOTICE — Only visible to you.
            </div>
          </div>

          {/* Icon */}
          <div className="flex justify-center mb-6 md:mb-8">
            <div className="w-16 h-16 md:w-20 md:h-20 bg-indigo-50 rounded-full flex items-center justify-center">
              <CheckCircle2 className="w-8 h-8 md:w-10 md:h-10 text-indigo-600" />
            </div>
          </div>

          {/* Headline */}
          <h1 className="text-xl md:text-3xl font-bold text-gray-900 text-center mb-4 md:mb-6 leading-tight px-2">
            We noticed that {agencyName || 'your agency'} is already listed in the {stateName} directory, but the listing is not active yet.
          </h1>

          {/* Body - Single Paragraph */}
          <p className="text-base md:text-lg text-gray-700 text-center leading-relaxed mb-6 md:mb-8 px-2">
            It's visible in the "Other agencies in {stateName}" section, but it won't receive any clicks or client requests until activation. Activate your listing to start receiving availability requests — and unlock the option to upgrade to a Top-25 {stateName} spot.
          </p>

          {/* Primary Button */}
          <div className="flex justify-center">
            <button
              onClick={handleActivateClick}
              className="w-full md:w-auto px-8 py-4 bg-indigo-600 text-white text-base md:text-lg font-semibold rounded-lg hover:bg-indigo-700 transition-colors shadow-md hover:shadow-lg"
            >
              Activate your listing
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

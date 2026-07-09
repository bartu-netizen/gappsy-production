import { useState, useEffect } from 'react';
import { X, Crown, CheckCircle2, Sparkles } from 'lucide-react';
import { getAvailableTop25SlotsForState, Top25Slot } from '../lib/top25Slots';
import { getListingProductByRank, getAgencyActivationProduct } from '../config/stripe';
import { useScrollLock } from '../hooks/useScrollLock';
import { getOfferTokenIfFlow } from '../utils/discountOffer';
import { useFastCheckout } from '../hooks/useFastCheckout';

interface UpsellTop25SpotModalProps {
  isOpen: boolean;
  onClose: () => void;
  stateSlug: string;
  stateName: string;
  agencyName: string;
}

interface SpotCardData {
  slot: Top25Slot;
  price: number;
  extra: number;
}

export default function UpsellTop25SpotModal({
  isOpen,
  onClose,
  stateSlug,
  stateName,
  agencyName,
}: UpsellTop25SpotModalProps) {
  const [spots, setSpots] = useState<SpotCardData[]>([]);
  const [loading, setLoading] = useState(true);
  const { isProcessing: checkoutLoading, launch: launchCheckout } = useFastCheckout();
  const activationPrice = getAgencyActivationProduct()?.amount || 97;

  useScrollLock(isOpen);

  useEffect(() => {
    if (isOpen) {
      loadAvailableSpots();
    }
  }, [isOpen, stateSlug]);

  const loadAvailableSpots = async () => {
    setLoading(true);
    try {
      const result = await getAvailableTop25SlotsForState(stateSlug);

      if (result.fetchFailed || result.slots.length === 0) {
        setSpots([]);
        setLoading(false);
        return;
      }

      const sortedSlots = result.slots.sort((a, b) => a.rank - b.rank);
      const topTwoSlots = sortedSlots.slice(0, 2);

      const spotsWithPricing: SpotCardData[] = topTwoSlots
        .map((slot) => {
          const product = getListingProductByRank(slot.rank);
          const price = product?.amount || 0;
          const extra = price - activationPrice;

          return {
            slot,
            price,
            extra,
          };
        });

      setSpots(spotsWithPricing);
    } catch (error) {
      console.error('Error loading available spots:', error);
      setSpots([]);
    } finally {
      setLoading(false);
    }
  };

  const handleUpgradeClick = (spotData: SpotCardData) => {
    const product = getListingProductByRank(spotData.slot.rank);
    if (!product) {
      console.error('Product not found for rank:', spotData.slot.rank);
      alert('Product configuration error. Please contact support.');
      return;
    }

    launchCheckout(
      () => ({
        listingType:       'top25',
        stateSlug,
        stateName,
        rank:              spotData.slot.rank,
        agencyName,
        agencyWebsite:     '',
        agencyDescription: '',
        agencyServices:    [],
        listingTier:       product.tier,
        lineItems:         [{ price: product.priceId, quantity: 1 }],
        upsells:           { cardVisual: false, getMatched: false, spotlight: false },
        offer_token:       getOfferTokenIfFlow(['offer_redirect', 'top25_landing']) || undefined,
        checkoutSource:    'upsell_modal',
      }),
      {
        trackingPayload: {
          funnel_name:  'top25',
          event_name:   'checkout_page_viewed',
          step_number:  150,
          state_slug:   stateSlug,
          agency_name:  agencyName,
          is_demo:      false,
          metadata: {
            rank:         spotData.slot.rank,
            listing_tier: product.tier,
            source:       'upsell_modal',
          },
        },
      }
    );
  };

  if (!isOpen) return null;

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === e.currentTarget) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm overflow-y-auto p-4"
      onClick={handleBackdropClick}
    >
      <div
        className="relative w-full max-w-5xl bg-white rounded-2xl shadow-2xl"
      >
        <button
          onClick={onClose}
          className="absolute right-4 top-4 text-gray-400 hover:text-gray-600 transition-colors z-10"
          aria-label="Close modal"
        >
          <X className="w-5 h-5" />
        </button>

        <div className="p-6 md:p-10">
          <div className="inline-block bg-gradient-to-r from-amber-50 to-amber-100 text-amber-700 text-[10px] font-semibold px-3 py-1.5 rounded-full mb-4 uppercase tracking-wider">
            LIMITED UPGRADE OPPORTUNITY
          </div>

          <h1 className="text-2xl md:text-3xl font-bold text-gray-900 mb-3 leading-tight">
            Upgrade Your Listing to a Top-25 Spot in {stateName}
          </h1>

          <p className="text-gray-600 text-base leading-relaxed mb-8 max-w-3xl">
            You're about to activate your standard listing for $97. For a limited time, you can upgrade to a Top-25 placement and get much more visibility, clicks, and clients — for just a small additional amount.
          </p>

          {loading || checkoutLoading ? (
            <div className="flex items-center justify-center py-20">
              <div className="flex flex-col items-center gap-3">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600"></div>
                {checkoutLoading && (
                  <p className="text-gray-600 text-sm">Redirecting to secure checkout...</p>
                )}
              </div>
            </div>
          ) : spots.length === 0 ? (
            <div className="text-center py-12">
              <p className="text-gray-500 text-lg">
                No Top-25 spots currently available. Please check back later.
              </p>
            </div>
          ) : (
            <>
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                {spots.map((spotData, index) => (
                  <SpotCard
                    key={spotData.slot.id}
                    spotData={spotData}
                    agencyName={agencyName}
                    stateName={stateName}
                    onUpgrade={() => handleUpgradeClick(spotData)}
                    isLeft={index === 0}
                  />
                ))}
              </div>

              <div className="bg-[#F4F6FB] border border-[#E8ECFA] rounded-xl p-5 text-center">
                <p className="text-sm text-gray-700 leading-relaxed">
                  <Sparkles className="w-4 h-4 inline-block mr-1 text-indigo-600" />
                  <strong>Why upgrade?</strong> Top-25 placements get significantly more visibility and clicks than standard listings. The higher your rank, the more leads you'll receive.
                </p>
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}

interface SpotCardProps {
  spotData: SpotCardData;
  agencyName: string;
  stateName: string;
  onUpgrade: () => void;
  isLeft: boolean;
}

function SpotCard({ spotData, agencyName, stateName, onUpgrade, isLeft }: SpotCardProps) {
  const { slot, price, extra } = spotData;
  const [isHovered, setIsHovered] = useState(false);

  const tierColor = slot.rank <= 8 ? 'amber' : slot.rank <= 16 ? 'blue' : 'slate';

  const colorClasses = {
    amber: {
      badge: 'bg-gradient-to-r from-amber-500 to-orange-500 text-white',
      border: 'border-amber-200',
      bg: 'bg-gradient-to-br from-amber-50 to-orange-50',
      button: 'bg-gradient-to-r from-amber-500 to-orange-500 hover:from-amber-600 hover:to-orange-600',
      shadow: 'shadow-amber-100',
    },
    blue: {
      badge: 'bg-gradient-to-r from-blue-500 to-blue-600 text-white',
      border: 'border-[#E8ECFA]',
      bg: 'bg-gradient-to-br from-blue-50 to-blue-100',
      button: 'bg-gradient-to-r from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-700',
      shadow: 'shadow-blue-100',
    },
    slate: {
      badge: 'bg-gradient-to-r from-slate-600 to-slate-700 text-white',
      border: 'border-slate-200',
      bg: 'bg-gradient-to-br from-slate-50 to-slate-100',
      button: 'bg-gradient-to-r from-slate-600 to-slate-700 hover:from-slate-700 hover:to-slate-800',
      shadow: 'shadow-slate-100',
    },
  };

  const colors = colorClasses[tierColor];

  return (
    <div
      className={`relative border-2 ${colors.border} ${colors.bg} rounded-2xl p-6 transition-all duration-300 ${
        isHovered ? `shadow-2xl ${colors.shadow} transform -translate-y-1` : 'shadow-lg'
      }`}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
    >
      <div className="flex items-start justify-between mb-4">
        <div className={`${colors.badge} px-4 py-2 rounded-lg font-bold text-lg flex items-center gap-2 shadow-md`}>
          <Crown className="w-5 h-5" />
          Rank #{slot.rank}
        </div>
        {isLeft && slot.rank <= 8 && (
          <div className="bg-white text-amber-600 px-3 py-1 rounded-full text-xs font-semibold border border-amber-200">
            BEST VALUE
          </div>
        )}
      </div>

      <div className="mb-5">
        <h3 className="text-xl font-bold text-gray-900 mb-2">{agencyName}</h3>
        <p className="text-sm text-gray-600">
          Top-25 {stateName} Marketing Agency
        </p>
      </div>

      <div className="space-y-3 mb-6">
        <div className="flex items-start gap-2">
          <CheckCircle2 className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
          <span className="text-sm text-gray-700">Premium Top-25 placement</span>
        </div>
        <div className="flex items-start gap-2">
          <CheckCircle2 className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
          <span className="text-sm text-gray-700">Significantly more visibility</span>
        </div>
        <div className="flex items-start gap-2">
          <CheckCircle2 className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
          <span className="text-sm text-gray-700">Higher click-through rates</span>
        </div>
        <div className="flex items-start gap-2">
          <CheckCircle2 className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
          <span className="text-sm text-gray-700">6-month listing included</span>
        </div>
      </div>

      <div className="border-t-2 border-dashed border-gray-300 pt-4 mb-4">
        <div className="text-center mb-2">
          <div className="text-3xl font-bold text-gray-900">${price}</div>
          <div className="text-sm text-gray-500">for 6 months</div>
        </div>
      </div>

      <button
        onClick={onUpgrade}
        className={`w-full ${colors.button} text-white py-4 rounded-xl font-semibold text-base transition-all duration-300 shadow-md hover:shadow-xl`}
      >
        Upgrade for ${extra} extra
      </button>

      <p className="text-xs text-gray-500 text-center mt-3 leading-relaxed">
        Total investment: <strong className="text-gray-700">${price}</strong> for 6 months<br />
        (upgrade from your $97 activation)
      </p>
    </div>
  );
}

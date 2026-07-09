import { Tag } from 'lucide-react';
import type { DiscountOffer } from '../utils/discountOffer';
import { formatDiscount } from '../utils/discountOffer';

interface DiscountOfferBannerProps {
  offer: DiscountOffer;
}

export default function DiscountOfferBanner({ offer }: DiscountOfferBannerProps) {
  const discountLabel = formatDiscount(offer);

  const productLabels: Record<string, string> = {
    all: 'all products',
    top25: 'Top 25 listing',
    spotlight: 'Spotlight',
    activation: 'activation',
  };

  const productText = offer.allowed_products.includes('all')
    ? ''
    : ` on ${offer.allowed_products.map(p => productLabels[p] ?? p).join(', ')}`;

  return (
    <div className="relative overflow-hidden rounded-2xl bg-gradient-to-r from-emerald-900/60 to-teal-900/60 border border-emerald-500/30 backdrop-blur-sm px-5 py-4 mb-4 sm:mb-6">
      <div
        className="pointer-events-none absolute inset-0 opacity-[0.06]"
        style={{
          backgroundImage:
            'linear-gradient(135deg, rgba(255,255,255,.4) 25%, transparent 25%), linear-gradient(225deg, rgba(255,255,255,.4) 25%, transparent 25%), linear-gradient(45deg, rgba(255,255,255,.4) 25%, transparent 25%), linear-gradient(315deg, rgba(255,255,255,.4) 25%, transparent 25%)',
          backgroundSize: '8px 8px',
        }}
      />
      <div className="relative flex items-center gap-3">
        <div className="w-9 h-9 rounded-xl bg-emerald-500/20 border border-emerald-400/30 flex items-center justify-center shrink-0">
          <Tag className="w-4.5 h-4.5 text-emerald-300" />
        </div>
        <div className="min-w-0">
          <p className="text-sm font-bold text-emerald-200 leading-tight">
            Special offer applied — {discountLabel}{productText}
          </p>
          <p className="text-xs text-emerald-300/70 mt-0.5 leading-snug">
            Your discount will be applied automatically at checkout.
            {offer.expires_at && (
              <span className="ml-1">
                Expires {new Date(offer.expires_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}.
              </span>
            )}
          </p>
        </div>
      </div>
    </div>
  );
}

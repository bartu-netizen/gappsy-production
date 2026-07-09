import { Sparkles } from 'lucide-react';
import { formatDiscount, type DiscountOffer } from '../utils/discountOffer';

interface Props {
  offer: DiscountOffer;
  basePrice?: number;
}

export default function CompactDiscountBanner({ offer, basePrice = 97 }: Props) {
  const label = formatDiscount(offer);

  const savings = offer.discount_type === 'percentage'
    ? Math.round(basePrice * (offer.discount_value / 100) * 100) / 100
    : Math.min(offer.discount_value, basePrice);

  return (
    <div
      style={{
        background: 'linear-gradient(135deg, #065f46 0%, #047857 50%, #059669 100%)',
        border: '1px solid rgba(52, 211, 153, 0.3)',
        borderRadius: '10px',
        padding: '12px 18px',
        display: 'flex',
        alignItems: 'center',
        gap: '10px',
        maxWidth: '520px',
        margin: '0 auto 16px',
      }}
    >
      <div
        style={{
          width: 32,
          height: 32,
          borderRadius: '50%',
          background: 'rgba(52, 211, 153, 0.2)',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          flexShrink: 0,
        }}
      >
        <Sparkles size={16} style={{ color: '#6ee7b7' }} />
      </div>
      <div style={{ flex: 1, minWidth: 0 }}>
        <p
          style={{
            margin: 0,
            fontSize: '14px',
            fontWeight: 700,
            color: '#ecfdf5',
            lineHeight: 1.35,
          }}
        >
          You&rsquo;ve unlocked a {label} activation discount
        </p>
      </div>
    </div>
  );
}

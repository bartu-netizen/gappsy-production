export const CARD_PRICES = {
  standard: 97,
  position4: 297,
  position12: 247,
} as const;

export interface DiscountedPrices {
  standard: number;
  position4: number;
  position12: number;
}

export function getDiscountedPrice(normalPrice: number, discountPercent: number): number {
  return Math.round(normalPrice * (1 - discountPercent / 100) * 100) / 100;
}

export function getAllDiscountedPrices(discountPercent: number): DiscountedPrices {
  return {
    standard: getDiscountedPrice(CARD_PRICES.standard, discountPercent),
    position4: getDiscountedPrice(CARD_PRICES.position4, discountPercent),
    position12: getDiscountedPrice(CARD_PRICES.position12, discountPercent),
  };
}

export function getDiscountedFullCardPrice(fullPrice: number, discountPercent: number): number {
  return Math.round(fullPrice * (1 - discountPercent / 100) * 100) / 100;
}

export function formatPrice(price: number): string {
  return price.toFixed(2);
}

export function formatDiscountBadge(discountPercent: number): string {
  return `${discountPercent}% off`;
}

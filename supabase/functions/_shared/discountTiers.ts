export const DEFAULT_DISCOUNT_PERCENTAGE = 20;

export function getDiscountPercentage(intentScore: number | null | undefined): number {
  const score = intentScore ?? 0;
  if (score >= 80) return 25;
  if (score >= 60) return 20;
  if (score >= 40) return 15;
  return 10;
}

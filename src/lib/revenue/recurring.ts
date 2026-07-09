export type BillingInterval = 'day' | 'week' | 'month' | 'year';

export interface SubItemRow {
  unit_amount_cents: number;
  currency: string;
  interval: BillingInterval | null;
  interval_count: number;
  quantity: number;
}

export interface RecurringMetrics {
  currency: string;
  mrr_cents: number;
  yrr_cents: number;
  active_subscriptions: number;
  computed_at: string;
}

/**
 * Normalizes a subscription item's amount to a monthly equivalent in cents.
 *
 * Formula by interval:
 *   month  → amount / interval_count
 *   year   → amount / (12 * interval_count)
 *   week   → amount * (52 / 12) / interval_count
 *   day    → amount * (365 / 12) / interval_count
 *
 * Returns 0 for null/unknown intervals (one-time prices).
 */
export function normalizeToMonthlyCents(
  amountCents: number,
  interval: BillingInterval | null,
  intervalCount: number,
): number {
  if (!interval) return 0;
  const ic = Math.max(1, intervalCount);

  switch (interval) {
    case 'month':
      return Math.round(amountCents / ic);
    case 'year':
      return Math.round(amountCents / (12 * ic));
    case 'week':
      return Math.round((amountCents * 52) / (12 * ic));
    case 'day':
      return Math.round((amountCents * 365) / (12 * ic));
    default:
      return 0;
  }
}

/**
 * Computes MRR in cents from a list of subscription item rows.
 * Each row represents one item across all active subscriptions.
 */
export function computeMRRCents(items: SubItemRow[]): number {
  return items.reduce((sum, item) => {
    const monthly = normalizeToMonthlyCents(
      item.unit_amount_cents * Math.max(1, item.quantity),
      item.interval,
      item.interval_count,
    );
    return sum + monthly;
  }, 0);
}

/**
 * Formats a cents value as a currency string (e.g. "$1,234").
 */
export function formatCentsAsCurrency(cents: number, currency = 'usd'): string {
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: currency.toUpperCase(),
    minimumFractionDigits: 0,
    maximumFractionDigits: 0,
  }).format(cents / 100);
}

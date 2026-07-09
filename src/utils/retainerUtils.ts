// Default retainer to use when no agency-specific value is available
export const DEFAULT_RETAINER_AMOUNT = 1000;

// Legacy type for backward compatibility
export type RetainerTier =
  | "500-1000"
  | "1000-2500"
  | "2500-5000"
  | "5000-10000"
  | "10000-plus";

// Fixed retainer amount options (in dollars per month)
export const RETAINER_OPTIONS = [
  500, 1000, 1500, 2000, 2500, 3000, 4000, 5000, 7500, 10000,
];

// Primary function: get the exact retainer amount
export function getRetainerAmount(amount?: number | null): number | null {
  if (!amount || amount <= 0) return null;
  return amount;
}

// Legacy function: convert old range strings to numeric midpoint
// Used for backward compatibility with existing data
export function getRetainerMidpoint(range?: string | null): number | null {
  switch (range) {
    case '500-1000':
      return 750;
    case '1000-2500':
      return 1750;
    case '2500-5000':
      return 3750;
    case '5000-10000':
      return 7500;
    case '10000-plus':
      return 10000;
    default:
      return null;
  }
}

// Get retainer amount with fallback to legacy range
export function getRetainerAmountWithFallback(
  amount?: number | null,
  legacyRange?: string | null
): number | null {
  // Prefer the numeric amount if available
  if (amount && amount > 0) {
    return amount;
  }

  // Fall back to converting the legacy range
  return getRetainerMidpoint(legacyRange);
}

// Format a retainer amount as currency label for dropdown
export function formatRetainerLabel(amount: number): string {
  const formatted = formatCurrency(amount);
  return `${formatted} / month`;
}

// Alias for clarity in different contexts
export const getAverageRetainerForTier = getRetainerMidpoint;

// Format number as currency
export function formatCurrency(amount: number): string {
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  }).format(amount);
}

/*
 * ============================================================================
 * CANONICAL STRIPE PRODUCTS CONFIGURATION
 * ============================================================================
 *
 * RUNTIME ERROR THAT CAUSED WHITE SCREEN:
 * ----------------------------------------
 * When "Update my products" was clicked in Bolt, it synced Stripe products to
 * stripe-config.ts. However, the Top 25 funnel used config/stripeProducts.ts
 * which had getters marked as `as const`. These getters returned objects
 * dynamically, but TypeScript treated them as literal types, causing:
 *
 * 1. Type mismatches at runtime
 * 2. Accessing properties on objects that didn't match the expected shape
 * 3. React couldn't render → white screen
 *
 * Additionally:
 * - Products.tsx imported from stripe-config.ts
 * - Funnel pages imported from config/stripeProducts.ts
 * - No single source of truth
 * - No defensive null checks in many places
 *
 * SOLUTION:
 * ---------
 * This file is now the ONLY source for all Stripe product configuration.
 * - All price IDs are explicitly defined
 * - All getters return proper types (never `as const` on dynamic values)
 * - All getters handle null cases gracefully
 * - No assumptions about product existence
 *
 * FUTURE-PROOFING:
 * ----------------
 * When you click "Update my products" in Bolt:
 * 1. Copy price IDs from the Bolt Stripe modal
 * 2. Update the PRICE_IDS object below
 * 3. That's it - the app will continue working
 *
 * If a product is missing, the app shows a graceful fallback instead of crashing.
 */

// ============================================================================
// STRIPE PRICE IDs (Update these when syncing products in Bolt)
// ============================================================================

export const PRICE_IDS = {
  // Agency Activation (6-month subscription)
  agencyActivation: 'price_1SaplSIoPJm5BB2XIP4XKqGS',

  // Top 25 Listing Tiers (6-month subscriptions)
  listingStandard: 'price_1SZGKxIoPJm5BB2X1My3vHBJ',
  listingPriority: 'price_1SZKW7IoPJm5BB2Xom28TCYo',
  listingPremium: 'price_1SZKecIoPJm5BB2Xf1ZNcRmt',

  // Spotlight Placement (6-month subscription)
  spotlightPlacement: 'price_1SZQ3qIoPJm5BB2XVzBy9qRD',

  // Add-on Products (6-month subscriptions)
  addonCardVisual: 'price_1SZPw3IoPJm5BB2Xh8ji6xPt',
  addonGetMatched: 'price_1SZPzfIoPJm5BB2XKJYYwTlM',
  addonSpotlight: 'price_1SZQ3qIoPJm5BB2XVzBy9qRD',
} as const;

// ============================================================================
// TYPE DEFINITIONS
// ============================================================================

export type ListingTier = 'standard' | 'priority' | 'premium' | 'spotlight' | 'activation';
export type AddonType = 'cardVisual' | 'getMatched' | 'spotlight';

export interface StripeProductConfig {
  priceId: string;
  name: string;
  description: string;
  amount: number; // in dollars (not cents)
  type: 'listing' | 'addon';
  tier?: ListingTier;
  addonType?: AddonType;
  duration: '6-month';
}

// ============================================================================
// PRODUCT CONFIGURATIONS
// ============================================================================

const PRODUCT_CONFIGS: Record<string, StripeProductConfig> = {
  // Agency Activation
  [PRICE_IDS.agencyActivation]: {
    priceId: PRICE_IDS.agencyActivation,
    name: 'Activate Agency Listing (6 months)',
    description: 'Activate your agency listing to receive availability requests and improve your visibility. Renews every 6 months • Cancel anytime.',
    amount: 97,
    type: 'listing',
    duration: '6-month',
  },

  // Top 25 Listing Tiers
  [PRICE_IDS.listingStandard]: {
    priceId: PRICE_IDS.listingStandard,
    name: 'Top 25 Standard Listing (6 months)',
    description: 'Your agency will be featured in one of the available standard ranking positions on our Top 25 list. Renews every 6 months • Cancel anytime.',
    amount: 197,
    type: 'listing',
    tier: 'standard',
    duration: '6-month',
  },
  [PRICE_IDS.listingPriority]: {
    priceId: PRICE_IDS.listingPriority,
    name: 'Top 25 Priority Listing (6 months)',
    description: 'Your agency will be featured in one of the higher available ranking positions on our Top 25 list. Renews every 6 months • Cancel anytime.',
    amount: 247,
    type: 'listing',
    tier: 'priority',
    duration: '6-month',
  },
  [PRICE_IDS.listingPremium]: {
    priceId: PRICE_IDS.listingPremium,
    name: 'Top 25 Premium Placement — Highest Rank (6 months)',
    description: 'Your agency will be featured in one of the highest remaining ranking positions on our Top 25 list. Renews every 6 months • Cancel anytime.',
    amount: 297,
    type: 'listing',
    tier: 'premium',
    duration: '6-month',
  },

  // Add-on Products
  [PRICE_IDS.addonCardVisual]: {
    priceId: PRICE_IDS.addonCardVisual,
    name: 'Card Visual Upgrade (6-Month Add-On)',
    description: 'Adds a premium highlight badge to your Listing card for increased visibility. 6-month recurring add-on.',
    amount: 37,
    type: 'addon',
    addonType: 'cardVisual',
    duration: '6-month',
  },
  [PRICE_IDS.addonGetMatched]: {
    priceId: PRICE_IDS.addonGetMatched,
    name: 'Get Matched Upgrade (6-Month Add-On)',
    description: 'Adds your agency to our "Get Matched" system for 6 months, giving you priority inclusion when businesses request help selecting an agency.',
    amount: 97,
    type: 'addon',
    addonType: 'getMatched',
    duration: '6-month',
  },
  [PRICE_IDS.addonSpotlight]: {
    priceId: PRICE_IDS.addonSpotlight,
    name: 'Spotlight Placement (6-Month Listing)',
    description: 'Premium top-of-page placement for your agency for 6 months. Your agency will appear in the spotlight section for maximum visibility and lead potential.',
    amount: 997,
    type: 'addon',
    addonType: 'spotlight',
    duration: '6-month',
  },

};

// ============================================================================
// SAFE GETTER FUNCTIONS (Never throw, always return null on missing data)
// ============================================================================

/**
 * Get a listing product by tier
 * @returns Product config or null if not found
 */
export function getListingProductByTier(tier: ListingTier): StripeProductConfig | null {
  const priceIdMap: Record<ListingTier, string> = {
    standard: PRICE_IDS.listingStandard,
    priority: PRICE_IDS.listingPriority,
    premium: PRICE_IDS.listingPremium,
    spotlight: PRICE_IDS.spotlightPlacement,
    activation: PRICE_IDS.agencyActivation,
  };

  const priceId = priceIdMap[tier];
  if (!priceId) {
    if (import.meta.env.DEV) {
      console.warn(`[Stripe Config] No price ID mapped for tier: ${tier}`);
    }
    return null;
  }

  const config = PRODUCT_CONFIGS[priceId];
  if (!config) {
    if (import.meta.env.DEV) {
      console.warn(`[Stripe Config] No product config found for price ID: ${priceId} (tier: ${tier})`);
    }
    return null;
  }

  return config;
}

/**
 * Get an addon product by type
 * @returns Product config or null if not found
 */
export function getAddonProduct(addonType: AddonType): StripeProductConfig | null {
  const priceIdMap = {
    cardVisual: PRICE_IDS.addonCardVisual,
    getMatched: PRICE_IDS.addonGetMatched,
    spotlight: PRICE_IDS.addonSpotlight,
  };

  const priceId = priceIdMap[addonType];
  if (!priceId) {
    if (import.meta.env.DEV) {
      console.warn(`[Stripe Config] No price ID mapped for addon type: ${addonType}`);
    }
    return null;
  }

  const config = PRODUCT_CONFIGS[priceId];
  if (!config) {
    if (import.meta.env.DEV) {
      console.warn(`[Stripe Config] No product config found for price ID: ${priceId} (addon: ${addonType})`);
    }
    return null;
  }

  return config;
}

/**
 * Get spotlight placement product
 * @returns Product config or null if not found
 */
export function getSpotlightPlacementProduct(): StripeProductConfig | null {
  const priceId = PRICE_IDS.spotlightPlacement;
  if (!priceId) {
    if (import.meta.env.DEV) {
      console.warn('[Stripe Config] No price ID for spotlight placement');
    }
    return null;
  }

  const config = PRODUCT_CONFIGS[priceId];
  if (!config) {
    if (import.meta.env.DEV) {
      console.warn(`[Stripe Config] No product config found for spotlight placement: ${priceId}`);
    }
    return null;
  }

  return config;
}

/**
 * Get product by Stripe price ID
 * Used by Products page and webhook handlers
 */
export function getProductByPriceId(priceId: string): StripeProductConfig | null {
  const config = PRODUCT_CONFIGS[priceId];
  if (!config) {
    if (import.meta.env.DEV) {
      console.warn(`[Stripe Config] No product config found for price ID: ${priceId}`);
    }
    return null;
  }
  return config;
}

/**
 * Get all listing products (for Products page)
 */
export function getAllListingProducts(): StripeProductConfig[] {
  const tiers: ListingTier[] = ['standard', 'priority', 'premium'];
  return tiers
    .map(tier => getListingProductByTier(tier))
    .filter((p): p is StripeProductConfig => p !== null);
}

/**
 * Get all addon products
 */
export function getAllAddonProducts(): StripeProductConfig[] {
  const addonTypes: AddonType[] = ['cardVisual', 'getMatched', 'spotlight'];
  return addonTypes
    .map(type => getAddonProduct(type))
    .filter((p): p is StripeProductConfig => p !== null);
}

/**
 * Get all products (listings + addons) for Products page
 */
export function getAllProducts(): StripeProductConfig[] {
  return [...getAllListingProducts(), ...getAllAddonProducts()];
}

/**
 * Get agency activation product
 * @returns Product config or null if not found
 */
export function getAgencyActivationProduct(): StripeProductConfig | null {
  const priceId = PRICE_IDS.agencyActivation;
  if (!priceId) {
    if (import.meta.env.DEV) {
      console.warn('[Stripe Config] No price ID for agency activation');
    }
    return null;
  }

  const config = PRODUCT_CONFIGS[priceId];
  if (!config) {
    if (import.meta.env.DEV) {
      console.warn(`[Stripe Config] No product config found for agency activation: ${priceId}`);
    }
    return null;
  }

  return config;
}

// ============================================================================
// RANK TO TIER MAPPING
// ============================================================================

/**
 * Maps rank numbers to their corresponding tier
 * Ranks 1-8 = premium, 9-16 = priority, 17-25 = standard
 */
export function getRankTier(rank: number): ListingTier {
  if (rank >= 1 && rank <= 8) return 'premium';
  if (rank >= 9 && rank <= 16) return 'priority';
  return 'standard';
}

/**
 * Get listing product by rank number
 * @returns Product config or null if rank is invalid or product not found
 */
export function getListingProductByRank(rank: number): StripeProductConfig | null {
  if (rank < 1 || rank > 25) {
    if (import.meta.env.DEV) {
      console.warn(`[Stripe Config] Invalid rank: ${rank} (must be 1-25)`);
    }
    return null;
  }

  const tier = getRankTier(rank);
  return getListingProductByTier(tier);
}

// ============================================================================
// LEGACY COMPATIBILITY LAYER
// ============================================================================

/**
 * @deprecated Use getListingProductByTier() directly
 * Kept for backward compatibility only
 */
export function getListingProductByKey(tier: ListingTier): { id: string; label: string; amount: number } | null {
  const product = getListingProductByTier(tier);
  if (!product) return null;

  return {
    id: product.priceId,
    label: product.name,
    amount: product.amount,
  };
}

// ============================================================================
// EXPORTS FOR STRIPE WEBHOOKS & API
// ============================================================================

/**
 * Export for backward compatibility with stripe-config.ts format
 */
export interface StripeProduct {
  priceId: string;
  name: string;
  description: string;
  price: number;
  currency: string;
  mode: 'payment' | 'subscription';
}

/**
 * Get all products in stripe-config.ts format
 * Used by Products.tsx and other legacy code
 */
export const stripeProducts: StripeProduct[] = getAllProducts().map(config => ({
  priceId: config.priceId,
  name: config.name,
  description: config.description,
  price: config.amount,
  currency: 'USD',
  mode: 'subscription' as const,
}));

/*
 * STRIPE PRODUCTS CONFIGURATION
 * ==============================
 *
 * ROOT CAUSE OF PREVIOUS WHITE SCREEN CRASHES:
 * ---------------------------------------------
 * This file previously had placeholder price IDs like '<FILL_ME_STANDARD_PRICE_ID>'.
 * When Stripe products were synced via "Update my products" in Bolt, the actual
 * price IDs were stored in stripe-config.ts instead. This caused a mismatch:
 *
 * - Top 25 funnel pages used THIS file (with placeholders) → crash when calling Stripe
 * - Products page used stripe-config.ts (with real IDs) → worked fine
 *
 * The crash happened because:
 * 1. Components tried to pass '<FILL_ME_...>' as a price ID to Stripe checkout
 * 2. Stripe rejected invalid price IDs
 * 3. No fallback handling existed, causing a white screen
 *
 * SOLUTION:
 * ---------
 * This file now:
 * 1. Contains REAL Stripe price IDs (synced from stripe-config.ts)
 * 2. Maps each product to its type (listing/addon) and tier/addonType
 * 3. Provides safe getter functions with fallback behavior
 * 4. Never crashes if a product is missing - logs warning and returns null instead
 *
 * FUTURE-PROOFING:
 * ----------------
 * When you click "Update my products" in Bolt:
 * - Copy the price IDs from stripe-config.ts to the PRICE_IDS constant below
 * - The app will continue working even if products are added/removed/reordered
 * - Missing products will be gracefully hidden instead of crashing the app
 */

// ============================================================================
// ACTUAL STRIPE PRICE IDs (from stripe-config.ts - keep these in sync!)
// ============================================================================

const PRICE_IDS = {
  // Top 25 Listing Tiers (6-month subscriptions)
  standard: 'price_1SZGKxIoPJm5BB2X1My3vHBJ',
  priority: 'price_1SZKW7IoPJm5BB2Xom28TCYo',
  premium: 'price_1SZKecIoPJm5BB2Xf1ZNcRmt',

  // Upsell Add-ons (6-month subscriptions)
  visualUpgrade: 'price_1SZPw3IoPJm5BB2Xh8ji6xPt',
  getMatchedUpgrade: 'price_1SZPzfIoPJm5BB2XKJYYwTlM',

  // Spotlight (6-month subscription)
  spotlight: 'price_1SZQ3qIoPJm5BB2XVzBy9qRD',
} as const;

// ============================================================================
// PRODUCT METADATA & CONFIGURATION
// ============================================================================

export interface StripeProductConfig {
  priceId: string;
  name: string;
  description: string;
  price: number;
  type: 'listing' | 'addon' | 'spotlight';
  tier?: 'standard' | 'priority' | 'premium';
  addonType?: 'visual' | 'getMatched';
  duration: '6-month';
}

// Centralized product configuration
const PRODUCT_CONFIGS: Record<string, StripeProductConfig> = {
  // Top 25 Listings
  [PRICE_IDS.standard]: {
    priceId: PRICE_IDS.standard,
    name: 'Top 25 Standard Listing (6 months)',
    description: 'Your agency will be featured in one of the available standard ranking positions on our Top 25 list. This subscription renews every 6 months unless cancelled.',
    price: 197,
    type: 'listing',
    tier: 'standard',
    duration: '6-month',
  },
  [PRICE_IDS.priority]: {
    priceId: PRICE_IDS.priority,
    name: 'Top 25 Priority Listing (6 months)',
    description: 'Your agency will be featured in one of the higher available ranking positions on our Top 25 list. This subscription renews every 6 months unless cancelled.',
    price: 247,
    type: 'listing',
    tier: 'priority',
    duration: '6-month',
  },
  [PRICE_IDS.premium]: {
    priceId: PRICE_IDS.premium,
    name: 'Top 25 Premium Placement — Highest Rank (6 months)',
    description: 'Your agency will be featured in one of the highest remaining ranking positions on our Top 25 list. This subscription renews every 6 months unless cancelled.',
    price: 297,
    type: 'listing',
    tier: 'premium',
    duration: '6-month',
  },

  // Upsell Add-ons
  [PRICE_IDS.visualUpgrade]: {
    priceId: PRICE_IDS.visualUpgrade,
    name: 'Card Visual Upgrade (6-Month Add-On)',
    description: 'Adds a premium highlight badge to your Listing card for increased visibility. 6-month recurring add-on.',
    price: 37,
    type: 'addon',
    addonType: 'visual',
    duration: '6-month',
  },
  [PRICE_IDS.getMatchedUpgrade]: {
    priceId: PRICE_IDS.getMatchedUpgrade,
    name: 'Get Matched Upgrade (6-Month Add-On)',
    description: 'Adds your agency to our "Get Matched" system for 6 months, giving you priority inclusion when businesses request help selecting an agency.',
    price: 97,
    type: 'addon',
    addonType: 'getMatched',
    duration: '6-month',
  },

  // Spotlight
  [PRICE_IDS.spotlight]: {
    priceId: PRICE_IDS.spotlight,
    name: 'Spotlight Placement (6-Month Listing)',
    description: 'Premium top-of-page placement for your agency for 6 months. Your agency will appear in the spotlight section for maximum visibility and lead potential.',
    price: 997,
    type: 'spotlight',
    duration: '6-month',
  },
};

// ============================================================================
// TYPE DEFINITIONS
// ============================================================================

export type ListingTierKey = 'standard' | 'priority' | 'premium';
export type AddonTypeKey = 'visual' | 'getMatched';
export type UpsellKey = 'visualUpgrade' | 'getMatchedUpgrade';

export interface ListingProduct {
  id: string;
  label: string;
  amount: number;
}

export interface UpsellProduct {
  id: string;
  label: string;
  amount: number;
}

// ============================================================================
// SAFE GETTER FUNCTIONS (with fallback behavior)
// ============================================================================

/**
 * Get a listing product by tier (standard, priority, premium)
 * Returns null if the tier doesn't exist - caller should handle gracefully
 */
export function getListingProductByKey(tier: ListingTierKey): ListingProduct | null {
  const priceIdKey = tier as keyof typeof PRICE_IDS;
  const priceId = PRICE_IDS[priceIdKey];

  if (!priceId) {
    console.warn(`[Stripe Config] Missing price ID for tier: ${tier}`);
    return null;
  }

  const config = PRODUCT_CONFIGS[priceId];

  if (!config) {
    console.warn(`[Stripe Config] Missing product config for price ID: ${priceId} (tier: ${tier})`);
    return null;
  }

  return {
    id: config.priceId,
    label: config.name,
    amount: config.price,
  };
}

/**
 * Get an addon product by type (visual, getMatched)
 * Returns null if the addon doesn't exist - caller should handle gracefully
 */
export function getAddonProduct(addonType: AddonTypeKey): UpsellProduct | null {
  // Map addon type to price ID key
  const priceIdKeyMap: Record<AddonTypeKey, keyof typeof PRICE_IDS> = {
    visual: 'visualUpgrade',
    getMatched: 'getMatchedUpgrade',
  };

  const priceIdKey = priceIdKeyMap[addonType];
  const priceId = PRICE_IDS[priceIdKey];

  if (!priceId) {
    console.warn(`[Stripe Config] Missing price ID for addon type: ${addonType}`);
    return null;
  }

  const config = PRODUCT_CONFIGS[priceId];

  if (!config) {
    console.warn(`[Stripe Config] Missing product config for price ID: ${priceId} (addon: ${addonType})`);
    return null;
  }

  return {
    id: config.priceId,
    label: config.name,
    amount: config.price,
  };
}

/**
 * Get the spotlight product
 * Returns null if not configured
 */
export function getSpotlightProduct(): ListingProduct | null {
  const priceId = PRICE_IDS.spotlight;

  if (!priceId) {
    console.warn('[Stripe Config] Missing spotlight price ID');
    return null;
  }

  const config = PRODUCT_CONFIGS[priceId];

  if (!config) {
    console.warn(`[Stripe Config] Missing product config for spotlight price ID: ${priceId}`);
    return null;
  }

  return {
    id: config.priceId,
    label: config.name,
    amount: config.price,
  };
}

/**
 * Get all available listing products (for Products page)
 * Filters out any that are misconfigured
 */
export function getAllListingProducts(): ListingProduct[] {
  const tiers: ListingTierKey[] = ['standard', 'priority', 'premium'];
  return tiers
    .map(tier => getListingProductByKey(tier))
    .filter((product): product is ListingProduct => product !== null);
}

/**
 * Get all available addon products
 * Filters out any that are misconfigured
 */
export function getAllAddonProducts(): UpsellProduct[] {
  const addonTypes: AddonTypeKey[] = ['visual', 'getMatched'];
  return addonTypes
    .map(type => getAddonProduct(type))
    .filter((product): product is UpsellProduct => product !== null);
}

// ============================================================================
// LEGACY EXPORTS (for backward compatibility)
// ============================================================================

/**
 * @deprecated Use getListingProductByKey() instead
 * This export exists for backward compatibility only
 */
export const LISTING_PRODUCTS = {
  get standard() {
    const product = getListingProductByKey('standard');
    return product || { id: '', label: 'Standard (unavailable)', amount: 0 };
  },
  get priority() {
    const product = getListingProductByKey('priority');
    return product || { id: '', label: 'Priority (unavailable)', amount: 0 };
  },
  get premium() {
    const product = getListingProductByKey('premium');
    return product || { id: '', label: 'Premium (unavailable)', amount: 0 };
  },
} as const;

/**
 * @deprecated Use getAddonProduct() instead
 * This export exists for backward compatibility only
 */
export const UPSELL_PRODUCTS = {
  get visualUpgrade() {
    const product = getAddonProduct('visual');
    return product || { id: '', label: 'Visual Upgrade (unavailable)', amount: 0 };
  },
  get getMatchedUpgrade() {
    const product = getAddonProduct('getMatched');
    return product || { id: '', label: 'Get Matched (unavailable)', amount: 0 };
  },
} as const;

// ============================================================================
// RANK TO TIER MAPPING
// ============================================================================

/**
 * Maps rank numbers to their corresponding tier
 * Ranks 1-8 = premium, 9-16 = priority, 17-25 = standard
 */
export function getRankTier(rank: number): ListingTierKey {
  if (rank >= 1 && rank <= 8) return 'premium';
  if (rank >= 9 && rank <= 16) return 'priority';
  return 'standard';
}

/**
 * Get a listing product by rank number (safe version)
 * Returns null if rank is invalid or product is misconfigured
 *
 * IMPORTANT: Rank #1 is permanently SOLD and cannot be purchased.
 * This function always returns null for rank 1.
 */
export function getListingProductByRank(rank: number): ListingProduct | null {
  if (rank === 1) {
    console.warn('[Stripe Config] Rank #1 is permanently sold and cannot be purchased');
    return null;
  }

  if (rank < 1 || rank > 25) {
    console.warn(`[Stripe Config] Invalid rank: ${rank} (must be 1-25)`);
    return null;
  }

  const tier = getRankTier(rank);
  return getListingProductByKey(tier);
}

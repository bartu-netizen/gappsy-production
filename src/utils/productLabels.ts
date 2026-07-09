import type { ProductType, ListingType } from '../config/thankYouPageVariants';

/**
 * Product Label Resolver
 * Provides consistent, product-aware display names for thank-you page and related flows
 */

interface ProductLabelConfig {
  displayName: string;
  shortName: string;
  thankYouHeadline: string;
  confirmationMessage: string;
  customizationMessage: string;
  listingState: string;
}

const PRODUCT_LABELS: Record<ProductType, ProductLabelConfig> = {
  top25: {
    displayName: 'Top 25 Listing',
    shortName: 'Top 25',
    thankYouHeadline: 'Thank you — your Top 25 listing is now active.',
    confirmationMessage: 'Your payment has been confirmed and processed. You now appear in our Top 25 marketing agencies listing.',
    customizationMessage: 'Make sure the information below accurately represents your agency. You can update these details below:',
    listingState: 'active in Top 25'
  },
  spotlight: {
    displayName: 'Spotlight Listing',
    shortName: 'Spotlight',
    thankYouHeadline: 'Thank you — your Spotlight placement is now active.',
    confirmationMessage: 'Your payment has been confirmed and processed. Your agency has been featured in our Spotlight section.',
    customizationMessage: 'Make sure the information below accurately represents your agency. You can update these details below:',
    listingState: 'featured in Spotlight'
  },
  other_listing: {
    displayName: 'Standard Listing',
    shortName: 'Listing',
    thankYouHeadline: 'Thank you — your listing has been created.',
    confirmationMessage: 'Your agency has been added to our directory.',
    customizationMessage: 'Make sure the information below accurately represents your agency.',
    listingState: 'added to directory'
  },
  activation: {
    displayName: 'Listing Activation',
    shortName: 'Activation',
    thankYouHeadline: 'Thank you — your listing has been activated.',
    confirmationMessage: 'Your listing is now active and visible to potential clients.',
    customizationMessage: 'You can review and update your listing details below:',
    listingState: 'activated'
  }
};

/**
 * Get product display name (e.g., "Top 25 Listing", "Spotlight Listing")
 */
export function getProductDisplayName(productType: ProductType): string {
  return PRODUCT_LABELS[productType]?.displayName || 'Your Listing';
}

/**
 * Get short product name (e.g., "Top 25", "Spotlight")
 */
export function getProductShortName(productType: ProductType): string {
  return PRODUCT_LABELS[productType]?.shortName || 'Listing';
}

/**
 * Get thank-you page headline
 * Example: "Thank you — your Top 25 listing is now active."
 */
export function getThankYouHeadline(productType: ProductType): string {
  return PRODUCT_LABELS[productType]?.thankYouHeadline || 'Thank you!';
}

/**
 * Get confirmation message shown after payment
 * Example: "Your payment has been confirmed and processed. You now appear in our Top 25 marketing agencies listing."
 */
export function getConfirmationMessage(productType: ProductType): string {
  return PRODUCT_LABELS[productType]?.confirmationMessage || 'Your payment has been confirmed and processed.';
}

/**
 * Get customization/editing message
 * Example: "Make sure the information below accurately represents your agency. You can update these details below:"
 */
export function getCustomizationMessage(productType: ProductType): string {
  return PRODUCT_LABELS[productType]?.customizationMessage || 'Please review your listing details:';
}

/**
 * Get listing state description for badges/status
 * Example: "active in Top 25", "featured in Spotlight", "added to directory"
 */
export function getListingState(productType: ProductType): string {
  return PRODUCT_LABELS[productType]?.listingState || 'active';
}

/**
 * Get full product label config
 */
export function getProductLabelConfig(productType: ProductType): ProductLabelConfig {
  return PRODUCT_LABELS[productType] || PRODUCT_LABELS.other_listing;
}

/**
 * Determine if product type requires edit form (paid products)
 */
export function requiresEditForm(productType: ProductType): boolean {
  return productType === 'top25' || productType === 'spotlight' || productType === 'activation';
}

/**
 * Determine if product type shows custom confirmation (paid products)
 */
export function showsCustomConfirmation(productType: ProductType): boolean {
  return productType === 'top25' || productType === 'spotlight' || productType === 'activation';
}

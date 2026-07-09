export type ProductType = 'top25' | 'spotlight' | 'other_listing' | 'activation';
export type ListingType = 'top25_rank' | 'spotlight' | 'other_listing' | 'existing_activation';
export type ThankYouVariant = 'default' | 'v2' | 'top25-focused' | 'spotlight-focused';

export interface VariantConfig {
  id: ThankYouVariant;
  name: string;
  description: string;
  isActive: boolean;
}

export interface VariantMapping {
  productType: ProductType;
  listingType: ListingType;
  defaultVariant: ThankYouVariant;
  abtestEligible: boolean;
}

export interface ABTestConfig {
  experimentKey?: string;
  variantOverride?: ThankYouVariant;
  bucket?: 'control' | 'treatment' | 'test';
}

export const THANK_YOU_VARIANTS: Record<ThankYouVariant, VariantConfig> = {
  default: {
    id: 'default',
    name: 'Default',
    description: 'Standard thank-you page with post-payment editor',
    isActive: true
  },
  v2: {
    id: 'v2',
    name: 'V2 (Enhanced)',
    description: 'Enhanced thank-you page with improved onboarding',
    isActive: false
  },
  'top25-focused': {
    id: 'top25-focused',
    name: 'Top 25 Focused',
    description: 'Optimized for Top 25 listings',
    isActive: false
  },
  'spotlight-focused': {
    id: 'spotlight-focused',
    name: 'Spotlight Focused',
    description: 'Optimized for Spotlight placements',
    isActive: false
  }
};

export const VARIANT_MAPPINGS: VariantMapping[] = [
  {
    productType: 'top25',
    listingType: 'top25_rank',
    defaultVariant: 'default',
    abtestEligible: true
  },
  {
    productType: 'spotlight',
    listingType: 'spotlight',
    defaultVariant: 'default',
    abtestEligible: true
  },
  {
    productType: 'other_listing',
    listingType: 'other_listing',
    defaultVariant: 'default',
    abtestEligible: false
  },
  {
    productType: 'activation',
    listingType: 'existing_activation',
    defaultVariant: 'default',
    abtestEligible: false
  }
];

export function getVariantForProduct(
  productType: ProductType,
  listingType: ListingType,
  abConfig?: ABTestConfig
): ThankYouVariant {
  if (abConfig?.variantOverride) {
    return abConfig.variantOverride;
  }

  const mapping = VARIANT_MAPPINGS.find(
    (m) => m.productType === productType && m.listingType === listingType
  );

  return mapping?.defaultVariant || 'default';
}

export function getActiveVariants(): VariantConfig[] {
  return Object.values(THANK_YOU_VARIANTS).filter((v) => v.isActive);
}

export function getAllVariants(): VariantConfig[] {
  return Object.values(THANK_YOU_VARIANTS);
}

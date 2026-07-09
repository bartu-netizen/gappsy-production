import type { ProductType, ListingType } from '../config/thankYouPageVariants';

export type PaymentState = 'confirmed' | 'pending' | 'failed';

export interface ThankYouTestData {
  paymentState: PaymentState;
  productType: ProductType;
  listingType: ListingType;
  agencyName: string;
  state: string;
  stateSlug: string;
  websiteUrl: string;
  intro: string;
  services: string[];
  rankNumber?: number;
  hasCardVisualUpgrade: boolean;
  sessionId: string;
  agencyId: string;
  location?: string;
  logoUrl?: string;
}

export interface TestPreset {
  name: string;
  description: string;
  data: Partial<ThankYouTestData>;
}

const SERVICES = [
  'SEO',
  'Web Design',
  'PPC',
  'Social Media Marketing',
  'Branding',
  'Content Marketing',
  'CRO',
  'Email Marketing',
  'Performance Marketing'
];

const US_STATES = [
  'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado',
  'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho',
  'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
  'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
  'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada',
  'New Hampshire', 'New Jersey', 'New Mexico', 'New York',
  'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon',
  'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota',
  'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington',
  'West Virginia', 'Wisconsin', 'Wyoming'
];

const US_STATE_SLUGS: Record<string, string> = {
  'New Jersey': 'new-jersey',
  'New York': 'new-york',
  'California': 'california',
  'Texas': 'texas',
  'Florida': 'florida'
};

export function generateTestSessionId(): string {
  return `qa_test_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
}

export function generateTestAgencyId(): string {
  return `test_agency_${Math.random().toString(36).substr(2, 12)}`;
}

export function getStateSlug(stateName: string): string {
  return US_STATE_SLUGS[stateName] || stateName.toLowerCase().replace(/\s+/g, '-');
}

export function createDefaultTestData(): ThankYouTestData {
  const stateName = 'New Jersey';
  return {
    paymentState: 'confirmed',
    productType: 'top25',
    listingType: 'top25_rank',
    agencyName: 'Test Agency',
    state: stateName,
    stateSlug: getStateSlug(stateName),
    websiteUrl: 'https://example.com',
    intro: 'We help businesses grow through strategic digital marketing. Our team specializes in SEO, content creation, and performance optimization.',
    services: ['SEO', 'Web Design', 'Content Marketing'],
    rankNumber: 5,
    hasCardVisualUpgrade: false,
    sessionId: generateTestSessionId(),
    agencyId: generateTestAgencyId(),
    location: 'Red Bank, NJ'
  };
}

export const TEST_PRESETS: Record<string, TestPreset> = {
  valid_top25: {
    name: 'Valid Top 25 (Paid)',
    description: 'Confirmed payment with valid Top 25 listing',
    data: {
      paymentState: 'confirmed',
      productType: 'top25',
      listingType: 'top25_rank',
      agencyName: 'Growth Marketing Co.',
      state: 'New Jersey',
      websiteUrl: 'https://growthmarketingco.com',
      intro: 'We specialize in performance marketing and brand growth strategies. Our proven methods have helped 100+ businesses scale their revenue.',
      services: ['SEO', 'PPC', 'Web Design', 'Content Marketing'],
      rankNumber: 3,
      hasCardVisualUpgrade: true
    }
  },
  valid_spotlight: {
    name: 'Valid Spotlight (Paid)',
    description: 'Confirmed payment with valid Spotlight placement',
    data: {
      paymentState: 'confirmed',
      productType: 'spotlight',
      listingType: 'spotlight',
      agencyName: 'Digital Strategy Partners',
      state: 'California',
      websiteUrl: 'https://dsp.io',
      intro: 'Award-winning digital strategy and creative services. We transform businesses through data-driven campaigns and innovative design.',
      services: ['Branding', 'Social Media Marketing', 'Content Marketing', 'Email Marketing'],
      hasCardVisualUpgrade: false
    }
  },
  intro_with_url_blocked: {
    name: 'Intro with URL (Blocked)',
    description: 'Test intro validation - URL in text should fail',
    data: {
      paymentState: 'confirmed',
      productType: 'top25',
      listingType: 'top25_rank',
      agencyName: 'URL Test Agency',
      state: 'New York',
      intro: 'Visit our website at https://example.com for more information about our services.',
      websiteUrl: ''
    }
  },
  intro_with_gok_blocked: {
    name: 'Intro with Gambling (Blocked)',
    description: 'Test intro validation - gambling keyword should fail',
    data: {
      paymentState: 'confirmed',
      productType: 'top25',
      listingType: 'top25_rank',
      agencyName: 'Gambling Agency',
      state: 'Texas',
      intro: 'We specialize in gok marketing and automated solutions for your business needs.',
      websiteUrl: ''
    }
  },
  intro_with_porn_blocked: {
    name: 'Intro with Porn (Blocked)',
    description: 'Test intro validation - adult content keyword should fail',
    data: {
      paymentState: 'confirmed',
      productType: 'top25',
      listingType: 'top25_rank',
      agencyName: 'Adult Content Agency',
      state: 'Florida',
      intro: 'We create porn content and adult entertainment marketing strategies.',
      websiteUrl: ''
    }
  },
  invalid_website_url: {
    name: 'Invalid Website URL',
    description: 'Test website URL validation',
    data: {
      paymentState: 'confirmed',
      productType: 'top25',
      listingType: 'top25_rank',
      agencyName: 'Bad URL Agency',
      state: 'New Jersey',
      websiteUrl: 'not-a-valid-url-at-all!!!',
      intro: 'Valid intro text for the agency business marketing.'
    }
  },
  payment_pending: {
    name: 'Payment Pending',
    description: 'Test pending payment state',
    data: {
      paymentState: 'pending',
      productType: 'top25',
      listingType: 'top25_rank',
      agencyName: 'Pending Agency',
      state: 'New Jersey',
      intro: 'We are still processing your payment. Please wait...',
      websiteUrl: ''
    }
  },
  payment_failed: {
    name: 'Payment Failed',
    description: 'Test failed payment state',
    data: {
      paymentState: 'failed',
      productType: 'top25',
      listingType: 'top25_rank',
      agencyName: 'Failed Agency',
      state: 'New Jersey',
      intro: 'Your payment could not be processed.',
      websiteUrl: ''
    }
  },
  other_listing: {
    name: 'Other Listing (Free)',
    description: 'Test "Other Agency" listing type',
    data: {
      paymentState: 'confirmed',
      productType: 'other_listing',
      listingType: 'other_listing',
      agencyName: 'Other Agencies Inc.',
      state: 'Illinois',
      intro: 'We provide comprehensive marketing solutions for SMBs and enterprises.',
      websiteUrl: 'https://other-agencies.com'
    }
  },
  existing_activation: {
    name: 'Existing Listing Activation',
    description: 'Test activation of existing listing',
    data: {
      paymentState: 'confirmed',
      productType: 'activation',
      listingType: 'existing_activation',
      agencyName: 'Activated Agency',
      state: 'Colorado',
      intro: 'Your listing is now activated and visible to potential clients.',
      websiteUrl: 'https://activated-agency.com'
    }
  }
};

export function applyPreset(presetKey: string): ThankYouTestData {
  const defaultData = createDefaultTestData();
  const preset = TEST_PRESETS[presetKey];

  if (!preset) {
    return defaultData;
  }

  const merged = {
    ...defaultData,
    ...preset.data
  };

  if (preset.data.state && !preset.data.stateSlug) {
    merged.stateSlug = getStateSlug(preset.data.state);
  }

  if (!merged.sessionId) {
    merged.sessionId = generateTestSessionId();
  }

  if (!merged.agencyId) {
    merged.agencyId = generateTestAgencyId();
  }

  return merged as ThankYouTestData;
}

export function getAvailableServices(): string[] {
  return SERVICES;
}

export function getAvailableStates(): string[] {
  return US_STATES;
}

export function getPresetsList(): Array<{ key: string; preset: TestPreset }> {
  return Object.entries(TEST_PRESETS).map(([key, preset]) => ({ key, preset }));
}

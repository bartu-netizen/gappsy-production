// Single source of truth for what's included with Gappsy Growth. Shared by
// the marketing page (FeatureGrowthPage), the vendor onboarding wizard
// (FeatureMyProductOnboardingPage), and the vendor dashboard's locked-tab
// upsell teasers (VendorDashboardPage) — keeps the feature list from
// drifting between the several places that all promise the same thing.
export const FEATURED_MONTHLY_FEATURES: string[] = [
  'Featured placement across category, comparison, and search',
  'Priority ranking ahead of unfeatured listings',
  'Listing analytics — views and click-throughs, right in your dashboard',
  'See what visitors ask in the chat on your listing, anonymized',
  'Priority placement in AI/LLM answer engines (ChatGPT, Perplexity, Claude)',
  'Remove or hide reviews from your listing, not just reply to them',
];

export const FEATURED_YEARLY_ONLY_FEATURES: string[] = [
  'A produced video review, posted on our socials',
  'A featured spot in the Gappsy newsletter',
  'No competitor ads shown on your own listing',
  'Faster editorial review of listing updates',
  'Priority support',
  'Early access to new placement types',
];

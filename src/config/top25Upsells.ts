import React from 'react';
import type { AddonType } from './stripe';
import type { ReactNode } from 'react';

export type Top25UpsellKey = 'cardVisual' | 'getMatched' | 'spotlight';

export interface Top25UpsellConfig {
  key: Top25UpsellKey;
  title: (agencyName: string) => string;
  description: string | ((stateName: string) => string | ReactNode);
  addonType: AddonType;
  color: 'orange' | 'blue' | 'purple';
  icon: 'badge' | 'target' | 'spotlight';
  showRecommendedBadge?: boolean;
}

export const TOP25_UPSELLS: Top25UpsellConfig[] = [
  {
    key: 'cardVisual',
    title: () => '⚡ Get more clicks on your listing — $37',
    description: (stateName) =>
      `Add a highlighted badge to your listing to stand out from other agencies in ${stateName}. Listings with this badge can get up to 60% more clicks from potential clients.`,
    addonType: 'cardVisual',
    color: 'orange',
    icon: 'badge',
  },
  {
    key: 'getMatched',
    title: () => `🔥 Get client requests from across our platform — $97`,
    description: () =>
      `Some clients never see your listing. They submit requests elsewhere on our platform. Enable this to start receiving those client requests.`,
    addonType: 'getMatched',
    color: 'blue',
    icon: 'target',
    showRecommendedBadge: true,
  },
  // Future upsell (commented out until ready to launch):
  // {
  //   key: 'spotlight',
  //   title: () => 'Add Spotlight Placement',
  //   description:
  //     'Premium top-of-page placement above the Top 25 list for 6 months. Maximum visibility for your agency.',
  //   addonType: 'spotlight',
  //   color: 'purple',
  //   icon: 'spotlight',
  // },
];

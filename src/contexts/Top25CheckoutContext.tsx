import { createContext, useContext, useState, ReactNode } from 'react';
import type { ListingTier } from '../config/stripe';
import type { Top25UpsellKey } from '../config/top25Upsells';

export type ListingType = 'top25' | 'spotlight' | 'activation' | 'other_listing' | 'top25_claim_bundle' | 'top25_standard_only_release' | 'top25_upgrade';

export interface Top25CheckoutData {
  stateSlug: string;
  stateName: string;
  selectedRank: number | null;
  listingTier: ListingTier;
  listingType: ListingType;
  agencyName: string;
  agencyWebsite: string;
  agencyDescription: string;
  agencyServices: string[];
  agencyId?: string;
  top25SlotId?: string | null;
  logoUrl?: string;
  creditCents?: number;
  extraDiscountCents?: number;
  upgradeOfferId?: string;
  replacedStandard?: boolean;
  skippedUpgrade?: boolean;
  completedStandardUpsells?: boolean; // Flag that user completed the 2 standard upsells on /spotlight/confirm
  completedFinalUpgradeOffer?: boolean; // Flag that user reached /standard/upgrade-offer
  upgradeDiscountPercent?: number;
}

export interface Top25UpsellState {
  cardVisual: boolean;
  getMatched: boolean;
  spotlight: boolean;
}

interface Top25CheckoutContextType {
  checkoutData: Top25CheckoutData | null;
  setCheckoutData: (data: Top25CheckoutData | null) => void;
  upsells: Top25UpsellState;
  setUpsell: (key: Top25UpsellKey, value: boolean) => void;
  resetUpsells: () => void;
  setListingType: (listingType: ListingType) => void;
  setLogoUrl: (logoUrl: string) => void;
}

const Top25CheckoutContext = createContext<Top25CheckoutContextType | undefined>(undefined);

const initialUpsellState: Top25UpsellState = {
  cardVisual: false,
  getMatched: false,
  spotlight: false,
};

export function Top25CheckoutProvider({ children }: { children: ReactNode }) {
  const [checkoutData, setCheckoutData] = useState<Top25CheckoutData | null>(null);
  const [upsells, setUpsells] = useState<Top25UpsellState>(initialUpsellState);

  const setUpsell = (key: Top25UpsellKey, value: boolean) => {
    setUpsells(prev => ({ ...prev, [key]: value }));
  };

  const resetUpsells = () => {
    setUpsells(initialUpsellState);
  };

  const setListingType = (listingType: ListingType) => {
    if (checkoutData) {
      setCheckoutData({ ...checkoutData, listingType });
    }
  };

  const setLogoUrl = (logoUrl: string) => {
    if (checkoutData) {
      setCheckoutData({ ...checkoutData, logoUrl });
    }
  };

  return (
    <Top25CheckoutContext.Provider
      value={{
        checkoutData,
        setCheckoutData,
        upsells,
        setUpsell,
        resetUpsells,
        setListingType,
        setLogoUrl,
      }}
    >
      {children}
    </Top25CheckoutContext.Provider>
  );
}

export function useTop25Checkout() {
  const context = useContext(Top25CheckoutContext);
  if (context === undefined) {
    throw new Error('useTop25Checkout must be used within a Top25CheckoutProvider');
  }
  return context;
}

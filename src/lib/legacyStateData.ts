interface LegacyAgency {
  rank: number;
  name: string;
  website: string;
  logoUrl?: string;
  description?: string;
  shortDescription?: string;
  fullDescription?: string;
  services?: string[];
  isPaid?: boolean;
  city?: string;
  state?: string;
}

interface LegacyStateData {
  state: string;
  stateName: string;
  state_intro_short?: string;
  state_intro_full?: string;
  agencies: LegacyAgency[];
  faqs?: Array<{ question: string; answer: string }>;
  seo?: {
    title?: string;
    meta_description?: string;
    canonical_url?: string;
    og_title?: string;
    og_description?: string;
    og_image?: string;
  };
}

export async function getLegacyStateData(stateSlug: string): Promise<LegacyStateData | null> {
  if (stateSlug !== 'new-jersey') {
    return null;
  }

  try {
    const response = await fetch(`/data/${stateSlug}.json`);
    if (!response.ok) {
      return null;
    }
    const data = await response.json();

    // CRITICAL: Validate that agencies array exists and is valid
    // This prevents .filter() crash when JSON is malformed or incomplete
    if (!data || !Array.isArray(data.agencies) || data.agencies.length === 0) {
      console.warn(`⚠️ Invalid legacy data for ${stateSlug}: missing or empty agencies array`);
      return null; // Fall back to database
    }

    return data;
  } catch (error) {
    console.error(`Failed to load legacy data for ${stateSlug}:`, error);
    return null;
  }
}

export function isPlaceholderSlot(slot: any): boolean {
  if (!slot) return true;

  const hasNoName = !slot.agency_name || slot.agency_name.trim() === '';
  const hasPlaceholderName = slot.agency_name?.startsWith('Top 25 Slot');
  const hasNoWebsite = !slot.website || slot.website.trim() === '';
  const isUnpaid = !slot.is_paid;

  return isUnpaid && (hasNoName || hasPlaceholderName || hasNoWebsite);
}

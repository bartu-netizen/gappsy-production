import { supabase } from '../lib/supabase';
import { US_STATES } from './stateUtils';

export interface StateJsonAgency {
  rank: number;
  name: string;
  city: string;
  state: string;
  pricing: string;
  websiteUrl: string;
  logo?: {
    localPath?: string;
    altText?: string;
    width?: number;
    height?: number;
    boltUrl?: string | null;
  };
  shortDescription?: string;
  fullDescription?: string;
  services?: string[];
}

export interface StateJsonFAQ {
  question: string;
  answer: string;
}

export interface StateJsonData {
  state_name: string;
  state_slug: string;
  source_url?: string;
  seo?: {
    title?: string;
    meta_description?: string;
    focus_keyword?: string;
    canonical_url?: string;
    og_title?: string;
    og_description?: string;
    og_image?: string;
    og_url?: string;
  };
  state_intro_short?: string;
  state_intro_full?: string;
  agencies: StateJsonAgency[];
  faqs?: StateJsonFAQ[];
}

export interface ValidationResult {
  isValid: boolean;
  errors: string[];
  warnings: string[];
}

export interface ImportState {
  fileName: string;
  stateName: string;
  stateSlug: string;
  status: 'pending' | 'validating' | 'importing' | 'success' | 'error';
  error?: string;
  agencyCount: number;
  faqCount: number;
  top25Count: number;
  otherCount: number;
  jsonData?: StateJsonData;
  dbErrorDetails?: DbErrorDetails;
  dbStats?: {
    top25Created: number;
    top25Errors: number;
    otherCreated: number;
    otherErrors: number;
  };
}

export interface DbErrorDetails {
  code?: string;
  message?: string;
  details?: string;
  hint?: string;
  record?: {
    state_slug: string;
    rank: number;
    agency_name: string;
  };
}

export interface ImportResults {
  top25Created: number;
  top25Errors: number;
  otherCreated: number;
  otherErrors: number;
  // REMOVED: jsonSaved, jsonError - Filesystem writes disabled permanently
  firstDbError?: DbErrorDetails;
  firstFailedRank?: number;
}

export function validateStateJson(data: any): ValidationResult {
  const errors: string[] = [];
  const warnings: string[] = [];

  if (!data.state_name) {
    errors.push('Missing state_name');
  }

  if (!data.state_slug) {
    errors.push('Missing state_slug');
  } else {
    const validState = US_STATES.find(s => s.slug === data.state_slug);
    if (!validState) {
      errors.push(`Invalid state_slug: ${data.state_slug} (not a valid US state)`);
    }
  }

  if (!data.agencies || !Array.isArray(data.agencies)) {
    errors.push('Missing or invalid agencies array');
  } else {
    if (data.agencies.length === 0) {
      errors.push('Agencies array is empty');
    }

    const rankedAgencies = data.agencies.filter((a: any) => a.rank >= 1 && a.rank <= 25);

    if (rankedAgencies.length === 0) {
      warnings.push('No agencies in Top 25 range (ranks 1-25)');
    } else if (rankedAgencies.length < 25) {
      warnings.push(`Only ${rankedAgencies.length} agencies in Top 25 (expected 25)`);
    } else if (rankedAgencies.length > 25) {
      warnings.push(`${rankedAgencies.length} agencies in Top 25 (expected 25, extras will be moved to "Other Agencies")`);
    }

    const duplicateRanks = rankedAgencies
      .map((a: any) => a.rank)
      .filter((rank: number, index: number, arr: number[]) => arr.indexOf(rank) !== index);

    if (duplicateRanks.length > 0) {
      errors.push(`Duplicate ranks found: ${[...new Set(duplicateRanks)].join(', ')}`);
    }

    for (let i = 0; i < Math.min(5, data.agencies.length); i++) {
      const agency = data.agencies[i];
      if (!agency.name) {
        errors.push(`Agency at index ${i} missing name`);
      }
      if (!agency.websiteUrl) {
        warnings.push(`Agency "${agency.name || 'Unknown'}" missing websiteUrl`);
      }
    }
  }

  if (!data.faqs) {
    warnings.push('No FAQs provided');
  }

  if (!data.state_intro_short && !data.state_intro_full) {
    warnings.push('No state introduction text provided');
  }

  if (!data.seo || !data.seo.title || !data.seo.meta_description) {
    warnings.push('Missing SEO metadata');
  }

  return {
    isValid: errors.length === 0,
    errors,
    warnings
  };
}

export async function importStateToDatabase(
  stateData: StateJsonData,
  stateSlug: string,
  options: {
    markAsPlaceholders: boolean;
    overrideExisting: boolean;
  },
  adminSecret: string
): Promise<ImportResults> {
  const results: ImportResults = {
    top25Created: 0,
    top25Errors: 0,
    otherCreated: 0,
    otherErrors: 0,
    // REMOVED: jsonSaved - Database-only mode enforced
    firstDbError: undefined,
    firstFailedRank: undefined
  };

  const top25Agencies = stateData.agencies
    .filter(a => a.rank >= 1 && a.rank <= 25)
    .sort((a, b) => a.rank - b.rank);

  const otherAgencies = stateData.agencies.filter(a => !a.rank || a.rank > 25);

  try {
    if (!adminSecret) {
      results.top25Errors = top25Agencies.length;
      results.otherErrors = otherAgencies.length;
      results.firstDbError = {
        code: 'CONFIG_ERROR',
        message: 'Admin secret not provided',
        details: 'Enter your admin secret in the authentication field above',
        hint: 'The admin secret is required for all imports',
        record: { state_slug: stateSlug, rank: 0, agency_name: '' }
      };
      return results;
    }

    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
    const apiUrl = `${supabaseUrl}/functions/v1/state-json-import`;

    // Extract canonical URLs from JSON - CRITICAL for SEO routing
    // The canonical_url from JSON is the ONLY source of truth
    // ALWAYS enforce trailing slash for SEO consistency with old site
    let canonicalUrl = '';
    let fullCanonicalUrl = stateData.seo?.canonical_url || '';

    if (fullCanonicalUrl) {
      // Extract path from full URL (e.g., https://gappsy.com/path/ -> /path/)
      try {
        const urlObj = new URL(fullCanonicalUrl);
        canonicalUrl = urlObj.pathname;
        // Ensure trailing slash for SEO consistency
        if (!canonicalUrl.endsWith('/')) {
          canonicalUrl += '/';
        }
      } catch {
        // If it's already a path, use it directly
        canonicalUrl = fullCanonicalUrl;
        // Ensure trailing slash for SEO consistency
        if (!canonicalUrl.endsWith('/')) {
          canonicalUrl += '/';
        }
      }
    } else {
      // Fallback: generate from state_slug (but log warning)
      canonicalUrl = `/marketing-agencies-in-${stateSlug}-united-states/`;
      fullCanonicalUrl = `https://gappsy.com${canonicalUrl}`;
      console.warn(`[import] No canonical_url in JSON for ${stateSlug}. Using generated: ${canonicalUrl}`);
    }

    const adminToken = localStorage.getItem('gappsy_admin_token') ?? '';
    const response = await fetch(apiUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-admin-token': adminToken,
        'x-admin-secret': adminSecret.trim(),
        'Authorization': `Bearer ${adminSecret.trim()}`
      },
      body: JSON.stringify({
        stateSlug,
        stateName: stateData.state_name,
        agencies: top25Agencies,
        otherAgencies,
        options,
        canonicalUrl,
        fullCanonicalUrl,
        stateContent: {
          hero_intro: stateData.hero_intro || stateData.state_intro_full || '',
          hero_intro_short: stateData.hero_intro_short || stateData.state_intro_short || null,
          state_intro_short: stateData.state_intro_short || null,
          state_intro_full: stateData.state_intro_full || null,
          lastUpdated: stateData.lastUpdated || null
        },
        faqs: stateData.faqs || []
      })
    });

    if (!response.ok) {
      const error = await response.json();
      results.top25Errors = top25Agencies.length;
      results.otherErrors = otherAgencies.length;

      if (response.status === 401) {
        // New unified error format matching logo-upload
        const authDetails = error.hasXAdminSecret !== undefined
          ? `\nAuth diagnostics: x-admin-secret=${error.hasXAdminSecret}, authorization=${error.hasAuthorization}, receivedLen=${error.receivedLength}, expectedLen=${error.expectedLength}`
          : '';

        results.firstDbError = {
          code: '401',
          message: error.error || 'Missing authorization header',
          details: `The admin secret you entered is incorrect.${authDetails}`,
          hint: 'Paste the ADMIN_IMPORT_SECRET from Admin Settings page',
          record: { state_slug: stateSlug, rank: 0, agency_name: '' }
        };
      } else if (response.status === 500 && error.error === 'ADMIN_IMPORT_SECRET_NOT_CONFIGURED') {
        results.firstDbError = {
          code: '500',
          message: 'ADMIN_IMPORT_SECRET not configured',
          details: 'The ADMIN_IMPORT_SECRET environment variable is not set in Bolt backend.',
          hint: 'Contact your system administrator to configure the secret in Bolt Secret Keys.',
          record: { state_slug: stateSlug, rank: 0, agency_name: '' }
        };
      } else {
        results.firstDbError = {
          code: error.code || String(response.status),
          message: error.message || error.error || 'Edge function failed',
          details: error.details || '',
          hint: error.hint || '',
          record: { state_slug: stateSlug, rank: 0, agency_name: '' }
        };
      }
      return results;
    }

    const edgeResult = await response.json();

    results.top25Created = edgeResult.top25Created || 0;
    results.top25Errors = edgeResult.top25Errors || 0;
    results.otherCreated = edgeResult.otherAgenciesCreated || 0;
    results.otherErrors = edgeResult.otherAgenciesErrors || 0;

    if (edgeResult.firstDbError) {
      results.firstDbError = edgeResult.firstDbError;
      results.firstFailedRank = edgeResult.firstFailedRank;
    }

  } catch (err: any) {
    console.error('Exception calling Edge Function:', err);
    results.top25Errors = top25Agencies.length;
    results.otherErrors = otherAgencies.length;
    results.firstDbError = {
      code: 'FETCH_ERROR',
      message: err?.message || String(err),
      details: 'Network error or server unavailable',
      hint: 'Check your network connection and try again',
      record: { state_slug: stateSlug, rank: 0, agency_name: '' }
    };
  }

  return results;
}

// REMOVED: saveStateJsonFile() - Filesystem writes are permanently disabled
// All state content is stored in database only (state_content, state_faqs, top25_slots)
// Reason: Edge functions cannot reliably write to /public/data/ (No such file or directory errors)

export function createDownloadLink(stateData: StateJsonData, stateSlug: string): void {
  const blob = new Blob([JSON.stringify(stateData, null, 2)], {
    type: 'application/json'
  });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `${stateSlug}.json`;
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  URL.revokeObjectURL(url);
}

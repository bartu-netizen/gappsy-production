// Convert text to URL-safe slug
function slugify(text: string): string {
  return text
    .toLowerCase()
    .trim()
    .replace(/[^\w\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-+|-+$/g, '');
}

// All 52 US states and territories
export const ALL_STATES = [
  { slug: 'alabama', name: 'Alabama' },
  { slug: 'alaska', name: 'Alaska' },
  { slug: 'arizona', name: 'Arizona' },
  { slug: 'arkansas', name: 'Arkansas' },
  { slug: 'california', name: 'California' },
  { slug: 'colorado', name: 'Colorado' },
  { slug: 'connecticut', name: 'Connecticut' },
  { slug: 'delaware', name: 'Delaware' },
  { slug: 'district-of-columbia', name: 'District of Columbia' },
  { slug: 'florida', name: 'Florida' },
  { slug: 'georgia', name: 'Georgia' },
  { slug: 'hawaii', name: 'Hawaii' },
  { slug: 'idaho', name: 'Idaho' },
  { slug: 'illinois', name: 'Illinois' },
  { slug: 'indiana', name: 'Indiana' },
  { slug: 'iowa', name: 'Iowa' },
  { slug: 'kansas', name: 'Kansas' },
  { slug: 'kentucky', name: 'Kentucky' },
  { slug: 'louisiana', name: 'Louisiana' },
  { slug: 'maine', name: 'Maine' },
  { slug: 'maryland', name: 'Maryland' },
  { slug: 'massachusetts', name: 'Massachusetts' },
  { slug: 'michigan', name: 'Michigan' },
  { slug: 'minnesota', name: 'Minnesota' },
  { slug: 'mississippi', name: 'Mississippi' },
  { slug: 'missouri', name: 'Missouri' },
  { slug: 'montana', name: 'Montana' },
  { slug: 'nebraska', name: 'Nebraska' },
  { slug: 'nevada', name: 'Nevada' },
  { slug: 'new-hampshire', name: 'New Hampshire' },
  { slug: 'new-jersey', name: 'New Jersey' },
  { slug: 'new-mexico', name: 'New Mexico' },
  { slug: 'new-york', name: 'New York' },
  { slug: 'north-carolina', name: 'North Carolina' },
  { slug: 'north-dakota', name: 'North Dakota' },
  { slug: 'ohio', name: 'Ohio' },
  { slug: 'oklahoma', name: 'Oklahoma' },
  { slug: 'oregon', name: 'Oregon' },
  { slug: 'pennsylvania', name: 'Pennsylvania' },
  { slug: 'puerto-rico', name: 'Puerto Rico' },
  { slug: 'rhode-island', name: 'Rhode Island' },
  { slug: 'south-carolina', name: 'South Carolina' },
  { slug: 'south-dakota', name: 'South Dakota' },
  { slug: 'tennessee', name: 'Tennessee' },
  { slug: 'texas', name: 'Texas' },
  { slug: 'utah', name: 'Utah' },
  { slug: 'vermont', name: 'Vermont' },
  { slug: 'virginia', name: 'Virginia' },
  { slug: 'washington', name: 'Washington' },
  { slug: 'west-virginia', name: 'West Virginia' },
  { slug: 'wisconsin', name: 'Wisconsin' },
  { slug: 'wyoming', name: 'Wyoming' },
];

export const STATE_SLUG_TO_NAME: Record<string, string> = Object.fromEntries(
  ALL_STATES.map(s => [s.slug, s.name])
);

export interface AgencyReviewImportRow {
  agency_name: string;
  agency_slug: string;
  state_slug: string;
  state_name: string;
  city?: string;
  review_type: 'positive' | 'negative';
  is_top_25_ranked: boolean;
  website_url?: string;
  services_offered: string[];
  target_clients?: string[];
  geographic_reach?: string[];
  team_size_range?: string;
  evaluation_status?: string;
  about_description: string;
  strengths: string[];
  concerns: string[];
  risk_factors?: string[];
  fit_for: string[];
  case_studies_status?: string;
  pricing_transparency?: string;
  team_information?: string;
  independent_recognition?: string;
  local_presence?: string;
  entity_signals?: string[];
}

export interface ValidationError {
  row: number;
  field: string;
  message: string;
}

export interface ParsedImportRow extends AgencyReviewImportRow {
  errors: ValidationError[];
  uniqueness_score: number;
}

// Parse pipe-separated string to array
export function parseArray(value: unknown): string[] {
  if (!value) return [];
  if (Array.isArray(value)) return value.filter(v => typeof v === 'string' && v.trim()).map(v => v.trim());
  if (typeof value !== 'string') return [];
  return value
    .split('|')
    .map(s => s.trim())
    .filter(s => s.length > 0);
}

// Parse boolean from various formats
export function parseBoolean(value: unknown): boolean | null {
  if (typeof value === 'boolean') return value;
  if (typeof value === 'number') return value !== 0;
  if (typeof value !== 'string') return null;
  const normalized = value.toLowerCase().trim();
  if (normalized === 'true' || normalized === '1' || normalized === 'yes') return true;
  if (normalized === 'false' || normalized === '0' || normalized === 'no') return false;
  return null;
}

// Validate and normalize a single row
export function normalizeAndValidateRow(
  rawRow: Record<string, unknown>,
  rowNumber: number,
  usedSlugs: Set<string>
): ParsedImportRow | null {
  const errors: ValidationError[] = [];

  // Extract and normalize fields
  const agency_name = String(rawRow.agency_name || '').trim();
  let agency_slug = String(rawRow.agency_slug || '').trim().toLowerCase();
  const state_slug = String(rawRow.state_slug || '').trim().toLowerCase();
  let state_name = String(rawRow.state_name || '').trim();
  const city = String(rawRow.city || '').trim() || undefined;
  const website_url = String(rawRow.website_url || '').trim() || undefined;
  const services_offered = parseArray(rawRow.services_offered);
  const target_clients = parseArray(rawRow.target_clients);
  const geographic_reach = parseArray(rawRow.geographic_reach);
  const team_size_range = String(rawRow.team_size_range || '').trim() || undefined;
  const evaluation_status = String(rawRow.evaluation_status || '').trim() || undefined;
  const about_description = String(rawRow.about_description || '').trim();
  const strengths = parseArray(rawRow.strengths);
  const concerns = parseArray(rawRow.concerns);
  const risk_factors = parseArray(rawRow.risk_factors);
  const fit_for = parseArray(rawRow.fit_for);
  const case_studies_status = String(rawRow.case_studies_status || '').trim() || undefined;
  const pricing_transparency = String(rawRow.pricing_transparency || '').trim() || undefined;
  const team_information = String(rawRow.team_information || '').trim() || undefined;
  const independent_recognition = String(rawRow.independent_recognition || '').trim() || undefined;
  const local_presence = String(rawRow.local_presence || '').trim() || undefined;
  const entity_signals = parseArray(rawRow.entity_signals);

  // Validate agency_name (required)
  if (!agency_name) {
    errors.push({
      row: rowNumber,
      field: 'agency_name',
      message: 'Agency name is required',
    });
  }

  // Validate state_slug (required and must be valid)
  if (!state_slug) {
    errors.push({
      row: rowNumber,
      field: 'state_slug',
      message: 'State slug is required',
    });
  } else if (!STATE_SLUG_TO_NAME[state_slug]) {
    errors.push({
      row: rowNumber,
      field: 'state_slug',
      message: `Invalid state slug "${state_slug}". Must be one of: ${Object.keys(STATE_SLUG_TO_NAME).join(', ')}`,
    });
  }

  // Generate agency_slug if missing
  if (!agency_slug && agency_name && state_slug) {
    agency_slug = `${slugify(agency_name)}-${state_slug}`;
  }

  // Validate agency_slug
  if (!agency_slug) {
    errors.push({
      row: rowNumber,
      field: 'agency_slug',
      message: 'Agency slug could not be generated (provide agency_slug or agency_name)',
    });
  } else {
    // Check for duplicates in file
    if (usedSlugs.has(agency_slug)) {
      errors.push({
        row: rowNumber,
        field: 'agency_slug',
        message: `Duplicate agency_slug "${agency_slug}" in this import file`,
      });
    }
  }

  // Derive state_name from slug if missing
  if (!state_name && state_slug && STATE_SLUG_TO_NAME[state_slug]) {
    state_name = STATE_SLUG_TO_NAME[state_slug];
  }

  // Parse review_type, with inference
  let review_type: 'positive' | 'negative' = 'negative';
  const review_type_raw = String(rawRow.review_type || '').trim().toLowerCase();
  if (review_type_raw === 'positive') {
    review_type = 'positive';
  } else if (review_type_raw === 'negative') {
    review_type = 'negative';
  } else if (!review_type_raw) {
    // Infer from is_top_25_ranked
    const is_ranked = parseBoolean(rawRow.is_top_25_ranked);
    review_type = is_ranked ? 'positive' : 'negative';
  }

  // Parse is_top_25_ranked
  let is_top_25_ranked = parseBoolean(rawRow.is_top_25_ranked) ?? false;

  // Consistency rule: if negative review, force is_top_25_ranked to false
  if (review_type === 'negative') {
    is_top_25_ranked = false;
  }

  // Validate about_description (required)
  if (!about_description) {
    errors.push({
      row: rowNumber,
      field: 'about_description',
      message: 'About description is required',
    });
  }

  // Add slug to used set if valid
  if (agency_slug && !errors.some(e => e.field === 'agency_slug')) {
    usedSlugs.add(agency_slug);
  }

  // If there are critical errors, return null
  if (errors.some(e => ['agency_name', 'state_slug', 'agency_slug', 'about_description'].includes(e.field))) {
    const normalized: ParsedImportRow = {
      agency_name,
      agency_slug: agency_slug || '',
      state_slug,
      state_name,
      city,
      review_type,
      is_top_25_ranked,
      website_url,
      services_offered,
      target_clients,
      geographic_reach,
      team_size_range,
      evaluation_status,
      about_description,
      strengths,
      concerns,
      risk_factors,
      fit_for,
      case_studies_status,
      pricing_transparency,
      team_information,
      independent_recognition,
      local_presence,
      entity_signals,
      errors,
      uniqueness_score: 0,
    };
    return normalized;
  }

  const normalized: ParsedImportRow = {
    agency_name,
    agency_slug,
    state_slug,
    state_name,
    city,
    review_type,
    is_top_25_ranked,
    website_url,
    services_offered,
    target_clients,
    geographic_reach,
    team_size_range,
    evaluation_status,
    about_description,
    strengths,
    concerns,
    risk_factors,
    fit_for,
    case_studies_status,
    pricing_transparency,
    team_information,
    independent_recognition,
    local_presence,
    entity_signals,
    errors,
    uniqueness_score: computeUniquenessScore(
      about_description,
      services_offered,
      review_type,
      strengths,
      concerns,
      fit_for,
      case_studies_status,
      pricing_transparency,
      team_information,
      independent_recognition,
      local_presence,
      entity_signals,
      city,
      target_clients
    ),
  };

  return normalized;
}

// Compute uniqueness score (0-100)
export function computeUniquenessScore(
  about_description: string,
  services_offered: string[],
  review_type: 'positive' | 'negative',
  strengths: string[],
  concerns: string[],
  fit_for: string[],
  case_studies_status?: string,
  pricing_transparency?: string,
  team_information?: string,
  independent_recognition?: string,
  local_presence?: string,
  entity_signals?: string[],
  city?: string,
  target_clients?: string[]
): number {
  let score = 0;

  // A) about_description length (max 25 points)
  const descLen = about_description?.length || 0;
  if (descLen >= 800) score += 25;
  else if (descLen >= 400) score += 18;
  else if (descLen >= 200) score += 10;

  // B) Services richness (max 15 points)
  const serviceCount = services_offered?.length || 0;
  if (serviceCount >= 6) score += 15;
  else if (serviceCount >= 4) score += 12;
  else if (serviceCount >= 2) score += 8;

  // C) Strengths/Concerns richness (max 20 points)
  const contentCount = review_type === 'positive' ? (strengths?.length || 0) : (concerns?.length || 0);
  if (contentCount >= 6) score += 20;
  else if (contentCount >= 4) score += 16;
  else if (contentCount >= 2) score += 10;

  // D) Fit-for richness (max 10 points)
  const fitCount = fit_for?.length || 0;
  if (fitCount >= 4) score += 10;
  else if (fitCount >= 3) score += 8;
  else if (fitCount >= 2) score += 6;

  // E) Public signals completeness (max 15 points)
  const signalCount = [case_studies_status, pricing_transparency, team_information, independent_recognition, local_presence]
    .filter(s => s && s.length > 0).length;
  if (signalCount >= 5) score += 15;
  else if (signalCount >= 4) score += 13;
  else if (signalCount >= 3) score += 10;
  else if (signalCount >= 1) score += 6;

  // F) Extra uniqueness signals (max 15 points)
  if (city && city.length > 0) score += 5;
  if (target_clients && target_clients.length > 0) score += 5;
  if (entity_signals && entity_signals.length >= 2) score += 5;

  return Math.min(score, 100);
}

// Get uniqueness label
export function getUniquenessLabel(score: number): string {
  if (score >= 80) return 'Strong (Low risk)';
  if (score >= 60) return 'OK';
  if (score >= 40) return 'Thin (Risky)';
  return 'Very Thin (High risk)';
}

// Check if row meets minimum publishing requirements
export function meetsPublishingRequirements(row: ParsedImportRow): boolean {
  const minDescLength = 400;
  const minServices = 4;
  const minStrengthsConcerns = 4;
  const minFitFor = 3;

  if ((row.about_description?.length || 0) < minDescLength) return false;
  if ((row.services_offered?.length || 0) < minServices) return false;

  const contentArray = row.review_type === 'positive' ? row.strengths : row.concerns;
  if ((contentArray?.length || 0) < minStrengthsConcerns) return false;

  if ((row.fit_for?.length || 0) < minFitFor) return false;

  return true;
}

// Get publish eligibility badge
export function getPublishEligibility(row: ParsedImportRow): { eligible: boolean; reason: string } {
  if (row.errors.length > 0) {
    return { eligible: false, reason: 'Has validation errors' };
  }

  if (row.uniqueness_score < 60) {
    return { eligible: false, reason: `Uniqueness score ${row.uniqueness_score}/100 too low` };
  }

  if (!meetsPublishingRequirements(row)) {
    return { eligible: false, reason: 'Missing required content' };
  }

  return { eligible: true, reason: 'Ready to publish' };
}

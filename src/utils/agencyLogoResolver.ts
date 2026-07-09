interface Agency {
  logo?: string;
  logo_url?: string;
  slug?: string;
  name?: string;
}

export function getAgencyLogoCandidates(agency: Agency | null | undefined): string[] {
  if (!agency) {
    return ['/images/agencies/default-agency-logo.svg'];
  }

  const candidates: string[] = [];

  const isVazagency =
    agency.slug?.toLowerCase() === 'vazagency' ||
    agency.name?.toLowerCase().includes('vazagency');

  if (isVazagency) {
    candidates.push('/images/agencies/vazagency.webp');
  }

  const logoUrl = agency.logo || agency.logo_url;

  if (logoUrl && isValidHttpUrl(logoUrl) && !isVazagency) {
    candidates.push(logoUrl);
  }

  if (agency.slug && !isVazagency) {
    const slug = normalizeSlug(agency.slug);
    const extensions = ['webp', 'png', 'jpg', 'svg'];

    for (const ext of extensions) {
      candidates.push(`/images/agencies/${slug}.${ext}`);
    }
  }

  candidates.push('/images/agencies/default-agency-logo.svg');

  return candidates;
}

export function getAgencyLogoSrc(agency: Agency | null | undefined): string {
  const candidates = getAgencyLogoCandidates(agency);
  return candidates[0] || '/images/agencies/default-agency-logo.svg';
}

export function getAgencyLogoFallback(): string {
  return '/images/agencies/default-agency-logo.svg';
}

function isValidHttpUrl(urlString: string): boolean {
  if (!urlString || typeof urlString !== 'string') {
    return false;
  }

  try {
    const url = new URL(urlString);
    return url.protocol === 'http:' || url.protocol === 'https:';
  } catch {
    return false;
  }
}

function normalizeSlug(slug: string): string {
  return slug
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9-]/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '');
}

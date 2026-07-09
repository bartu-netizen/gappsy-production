const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey'
};

interface ValidationResult {
  valid: boolean;
  error?: string;
}

const FORBIDDEN_WORDS = [
  'gok',
  'gokautomaat',
  'gambling',
  'porn',
  'pornography',
  'sex',
];

const URL_PATTERNS = [
  /https?:\/\/[^\s]+/gi,
  /www\.[^\s]+/gi,
  /[a-z0-9.-]+\.[a-z]{2,}(?:\/[^\s]*)?\b/gi,
];

function validateIntroText(text: string): ValidationResult {
  if (!text || !text.trim()) {
    return { valid: false, error: 'Intro text is required.' };
  }

  const trimmed = text.trim().toLowerCase();

  for (const word of FORBIDDEN_WORDS) {
    if (trimmed.includes(word.toLowerCase())) {
      return {
        valid: false,
        error: `Your intro contains restricted words. Please update the text and try again.`,
      };
    }
  }

  for (const pattern of URL_PATTERNS) {
    if (pattern.test(text)) {
      return {
        valid: false,
        error: `Please remove website links from the intro text.`,
      };
    }
  }

  return { valid: true };
}

function validateWebsiteUrl(url: string): ValidationResult {
  if (!url || !url.trim()) {
    return { valid: true };
  }

  const trimmed = url.trim();

  const urlPattern = /^(https?:\/\/)?(www\.)?[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z]{2,})+([\/\w\-._~:?#[\]@!$&'()*+,;=]*)?$/i;

  if (!urlPattern.test(trimmed)) {
    return {
      valid: false,
      error: 'Please enter a valid website URL (e.g., example.com or https://example.com).',
    };
  }

  return { valid: true };
}

interface DryRunRequest {
  intro: string;
  websiteUrl?: string;
  services?: string[];
}

interface DryRunResponse {
  valid: boolean;
  errors?: Record<string, string>;
  warnings?: string[];
}

async function validateListingData(req: DryRunRequest): Promise<DryRunResponse> {
  const errors: Record<string, string> = {};
  const warnings: string[] = [];

  if (!req.intro || req.intro.trim().length === 0) {
    errors.intro = 'Intro text is required.';
  } else {
    const introValidation = validateIntroText(req.intro);
    if (!introValidation.valid && introValidation.error) {
      errors.intro = introValidation.error;
    }
  }

  if (req.websiteUrl && req.websiteUrl.trim().length > 0) {
    const urlValidation = validateWebsiteUrl(req.websiteUrl);
    if (!urlValidation.valid && urlValidation.error) {
      errors.websiteUrl = urlValidation.error;
    }
  }

  if (!req.services || req.services.length === 0) {
    warnings.push('At least one service should be selected for better visibility.');
  } else if (req.services.length > 9) {
    warnings.push('Selecting too many services may dilute your agency profile.');
  }

  const validServiceNames = [
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

  if (req.services) {
    const invalidServices = req.services.filter((s) => !validServiceNames.includes(s));
    if (invalidServices.length > 0) {
      errors.services = `Invalid services: ${invalidServices.join(', ')}`;
    }
  }

  return {
    valid: Object.keys(errors).length === 0,
    errors: Object.keys(errors).length > 0 ? errors : undefined,
    warnings: warnings.length > 0 ? warnings : undefined
  };
}

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, {
      status: 200,
      headers: corsHeaders
    });
  }

  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: {
        ...corsHeaders,
        'Content-Type': 'application/json'
      }
    });
  }

  try {
    const body = await req.json() as DryRunRequest;

    const result = await validateListingData(body);

    return new Response(JSON.stringify(result), {
      status: 200,
      headers: {
        ...corsHeaders,
        'Content-Type': 'application/json'
      }
    });
  } catch (error) {
    console.error('Dry-run validation error:', error);

    return new Response(
      JSON.stringify({
        valid: false,
        errors: { server: 'Internal validation error' }
      }),
      {
        status: 500,
        headers: {
          ...corsHeaders,
          'Content-Type': 'application/json'
        }
      }
    );
  }
});

/**
 * Bot and Crawler Detection
 *
 * Identifies bot traffic to prevent false engagement signals
 * and avoid escalating lead state based on automated crawls.
 */

const BOT_USER_AGENTS = [
  'bot',
  'crawler',
  'spider',
  'scraper',
  'prerender',
  'phantom',
  'headless',
  'googlebot',
  'bingbot',
  'slurp',
  'duckduckbot',
  'baiduspider',
  'yandexbot',
  'facebookexternalhit',
  'twitterbot',
  'linkedinbot',
  'whatsapp',
  'telegrambot',
  'slackbot',
  'discordbot',
  'applebot',
  'semrush',
  'ahrefsbot',
  'mj12bot',
  'dotbot',
  'petalbot',
  'mail.ru',
  'rogerbot',
  'screaming frog',
  'sitebulb',
  'serpstat',
  'dataforseo',
];

/**
 * Check if user agent string appears to be a bot/crawler
 */
export function isBotUserAgent(userAgent: string | null): boolean {
  if (!userAgent) return false;

  const ua = userAgent.toLowerCase();
  return BOT_USER_AGENTS.some(pattern => ua.includes(pattern));
}

/**
 * Check if request appears to be a security scanner
 * Email security systems often pre-fetch links to scan for threats
 */
export function isSecurityScanner(userAgent: string | null, ip: string | null): boolean {
  if (!userAgent) return false;

  const ua = userAgent.toLowerCase();

  // Common email security scanners
  const scannerPatterns = [
    'proofpoint',
    'mimecast',
    'barracuda',
    'ironport',
    'forcepoint',
    'mcafee web gateway',
    'symantec',
    'trend micro',
    'sophos',
    'checkpoint',
  ];

  if (scannerPatterns.some(pattern => ua.includes(pattern))) {
    return true;
  }

  // Cloud provider IPs often indicate automated scanning
  // This is a simplified check - production could use IP range detection
  if (ip) {
    const cloudPatterns = [
      '54.', '52.', '34.', '35.', // AWS/GCP common ranges
      '13.', '20.', '40.', // Azure common ranges
    ];
    if (cloudPatterns.some(pattern => ip.startsWith(pattern))) {
      return true;
    }
  }

  return false;
}

/**
 * Check if this appears to be a duplicate click within a short time window
 * Helps detect rapid automated clicks vs. real user engagement
 */
export async function isDuplicateClick(
  supabase: any,
  agencyId: string,
  leadKey: string,
  windowMinutes: number = 5
): Promise<boolean> {
  const cutoff = new Date(Date.now() - windowMinutes * 60 * 1000).toISOString();

  const { data, error } = await supabase
    .from('smartlead_link_events')
    .select('id')
    .eq('agency_id', agencyId)
    .eq('lead_key', leadKey)
    .eq('event_type', 'smart_link_opened')
    .gte('created_at', cutoff)
    .limit(1)
    .maybeSingle();

  if (error) {
    console.error('[botDetection] Error checking duplicate:', error);
    return false;
  }

  return !!data;
}

/**
 * Comprehensive bot check combining multiple signals
 */
export function isBotRequest(request: {
  userAgent: string | null;
  ip: string | null;
  referrer?: string | null;
}): {
  isBot: boolean;
  reason: string | null;
} {
  // Check user agent
  if (isBotUserAgent(request.userAgent)) {
    return { isBot: true, reason: 'bot_user_agent' };
  }

  // Check security scanner
  if (isSecurityScanner(request.userAgent, request.ip)) {
    return { isBot: true, reason: 'security_scanner' };
  }

  // Check for missing user agent (common in bots)
  if (!request.userAgent || request.userAgent.trim().length < 10) {
    return { isBot: true, reason: 'missing_user_agent' };
  }

  return { isBot: false, reason: null };
}

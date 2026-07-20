import { createClient } from '@supabase/supabase-js';

const DOMAIN = 'https://gappsy.com';
const CURRENT_YEAR = new Date().getFullYear();

function truncateDescription(text, maxLength = 155) {
  if (!text || text.length <= maxLength) return text;

  const truncated = text.substring(0, maxLength);
  const lastSpace = truncated.lastIndexOf(' ');

  if (lastSpace > maxLength - 20) {
    return truncated.substring(0, lastSpace) + '...';
  }

  return truncated + '...';
}

function generateFallbackDescription(stateName) {
  return `Top digital marketing companies in ${stateName}. Compare SEO, PPC, web design & social media agencies, reviews and locations. Updated for ${CURRENT_YEAR}.`;
}

function generateUniqueDescription(stateName, stateData) {
  const customIntro = stateData?.state_intro_short;
  if (customIntro && customIntro.trim().length > 50) {
    return truncateDescription(customIntro.trim(), 155);
  }
  return generateFallbackDescription(stateName);
}

export function generateSEOData(stateSlug, stateName, stateData = {}) {
  const title = `Top 25 Marketing Agencies in ${stateName} (${CURRENT_YEAR}) | Gappsy`;

  const metaDescription = generateUniqueDescription(stateName, stateData);

  // Canonical URL with trailing slash (WordPress standard)
  const canonicalUrl = `${DOMAIN}/marketing-agencies-in-${stateSlug}-united-states/`;

  // OG Image - use PNG for better platform compatibility (SVG also available)
  const ogImage = `${DOMAIN}/og/marketing-agencies-in-${stateSlug}-united-states.png`;
  const ogImageFallback = `${DOMAIN}/og/default-1200x630.jpg`;

  // All titles/descriptions match the main title/description
  return {
    title,
    metaDescription,
    canonicalUrl,
    ogTitle: title,
    ogDescription: metaDescription,
    ogImage,
    ogImageWidth: '1200',
    ogImageHeight: '630',
    ogImageType: 'image/png', // PNG for better platform compatibility
    ogImageFallback,
    twitterTitle: title,
    twitterDescription: metaDescription,
    twitterImage: ogImage
  };
}

export async function getAllStatesFromDatabase() {
  const supabaseUrl = process.env.VITE_SUPABASE_URL;
  const supabaseAnonKey = process.env.VITE_SUPABASE_ANON_KEY;

  if (!supabaseUrl || !supabaseAnonKey) {
    console.warn('⚠️  Supabase credentials not found in environment');
    return [];
  }

  const supabase = createClient(supabaseUrl, supabaseAnonKey);

  try {
    const { data: statePages, error: pagesError } = await supabase
      .from('state_pages')
      .select('state_slug, state_name, is_active, canonical_url')
      .eq('is_active', true)
      .order('state_name');

    if (pagesError) {
      console.error('❌ Error fetching state_pages:', pagesError);
      return [];
    }

    const { data: stateContent, error: contentError } = await supabase
      .from('state_content')
      .select('state_slug, hero_intro_short, state_intro_short, state_intro_full, state_description_full');

    if (contentError) {
      console.warn('⚠️  Error fetching state_content:', contentError);
    }

    const contentMap = new Map();
    if (stateContent) {
      stateContent.forEach(content => {
        contentMap.set(content.state_slug, content);
      });
    }

    return statePages.map(page => ({
      state_slug: page.state_slug,
      state_name: page.state_name,
      canonical_url: page.canonical_url,
      content: contentMap.get(page.state_slug) || {}
    }));

  } catch (error) {
    console.error('❌ Database query error:', error);
    return [];
  }
}

export function escapeHtml(text) {
  if (!text) return '';
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

export function generateSEOTags(seoData, stateName, stateSlug) {
  const currentYear = new Date().getFullYear();
  const proofTag = `state:${stateSlug}:${currentYear}`;

  return `    <!-- SEO Meta Tags - Pre-rendered for ${stateName} -->
    <meta name="robots" content="index,follow" />
    <meta name="seo-proof" content="${proofTag}" />
    <link rel="canonical" href="${escapeHtml(seoData.canonicalUrl)}" />

    <!-- Open Graph Meta Tags -->
    <meta property="og:title" content="${escapeHtml(seoData.ogTitle)}" />
    <meta property="og:description" content="${escapeHtml(seoData.ogDescription)}" />
    <meta property="og:url" content="${escapeHtml(seoData.canonicalUrl)}" />
    <meta property="og:image" content="${escapeHtml(seoData.ogImage)}" />
    <meta property="og:image:width" content="${seoData.ogImageWidth}" />
    <meta property="og:image:height" content="${seoData.ogImageHeight}" />
    <meta property="og:image:type" content="${seoData.ogImageType || 'image/png'}" />

    <!-- Twitter Card Meta Tags -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:site" content="@Gappsy" />
    <meta name="twitter:title" content="${escapeHtml(seoData.twitterTitle)}" />
    <meta name="twitter:description" content="${escapeHtml(seoData.twitterDescription)}" />
    <meta name="twitter:image" content="${escapeHtml(seoData.twitterImage)}" />`;
}

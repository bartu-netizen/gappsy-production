import { readFileSync, writeFileSync, mkdirSync, readdirSync, existsSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import { createClient } from '@supabase/supabase-js';
import {
  getAllStatesFromDatabase,
  generateSEOData,
  generateSEOTags,
  escapeHtml
} from './seo-generator.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const projectRoot = join(__dirname, '..');

// Supabase client for fetching data during build
let supabaseClient = null;
const stateDataCache = new Map();

function initSupabase() {
  if (supabaseClient) return supabaseClient;

  const supabaseUrl = process.env.VITE_SUPABASE_URL;
  const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;

  if (!supabaseUrl || !supabaseKey) {
    console.warn('⚠️  Supabase credentials not found in environment');
    return null;
  }

  supabaseClient = createClient(supabaseUrl, supabaseKey);
  console.log('✅ Supabase client initialized for prerender');
  return supabaseClient;
}

async function fetchStateDataFromSupabase(stateSlug) {
  // Check cache first
  if (stateDataCache.has(stateSlug)) {
    console.log(`   ♻️  Using cached data for ${stateSlug}`);
    return stateDataCache.get(stateSlug);
  }

  const supabase = initSupabase();
  if (!supabase) {
    console.warn(`   ⚠️  Supabase not available for ${stateSlug}, will try JSON fallback`);
    return null;
  }

  try {
    // Fetch state content (intro, description)
    const { data: stateContent, error: contentError } = await supabase
      .from('state_content')
      .select('*')
      .eq('state_slug', stateSlug)
      .maybeSingle();

    if (contentError) {
      console.warn(`   ⚠️  Error fetching state_content for ${stateSlug}:`, contentError.message);
    }

    // Fetch top25 slots
    const { data: top25Slots, error: slotsError } = await supabase
      .from('top25_slots')
      .select('*')
      .eq('state_slug', stateSlug)
      .order('rank', { ascending: true });

    if (slotsError) {
      console.warn(`   ⚠️  Error fetching top25_slots for ${stateSlug}:`, slotsError.message);
    }

    // Fetch FAQs
    const { data: faqs, error: faqsError } = await supabase
      .from('state_faqs')
      .select('*')
      .eq('state_slug', stateSlug)
      .order('position', { ascending: true });

    if (faqsError) {
      console.warn(`   ⚠️  Error fetching state_faqs for ${stateSlug}:`, faqsError.message);
    }

    // Fetch curated other agencies — paid/featured first, capped at 5
    // This subset is prerendered so Googlebot can see meaningful additional content.
    const { data: otherAgenciesRaw } = await supabase
      .from('other_agencies')
      .select('name, city, state_name, short_description, description, website_url, is_paid_listing, paid_override_active, paid_override_value')
      .eq('state_slug', stateSlug)
      .eq('is_active', true)
      .order('is_paid_listing', { ascending: false })
      .limit(5);

    const data = {
      content: stateContent,
      agencies: top25Slots || [],
      faqs: faqs || [],
      otherAgencies: otherAgenciesRaw || []
    };

    // Cache the result
    stateDataCache.set(stateSlug, data);

    return data;
  } catch (error) {
    console.error(`   ❌ Supabase fetch failed for ${stateSlug}:`, error.message);
    return null;
  }
}

async function fetchFullStateData(stateSlug, dataDir) {
  // Primary source: Supabase
  const supabaseData = await fetchStateDataFromSupabase(stateSlug);

  if (supabaseData && (supabaseData.content || supabaseData.agencies?.length > 0)) {
    // Successfully loaded from Supabase (may have partial data if content query failed)
    const content = supabaseData.content ? {
      state_intro_full: supabaseData.content.state_intro_full || supabaseData.content.hero_intro,
      state_intro_short: supabaseData.content.state_intro_short || supabaseData.content.hero_intro_short,
      state_description_full: supabaseData.content.state_description_full
    } : null;

    const agencies = (supabaseData.agencies || [])
      .filter(slot => slot.rank >= 1 && slot.rank <= 25)
      .map(slot => ({
        rank: slot.rank,
        agency_name: slot.agency_name || `Agency #${slot.rank}`,
        website: slot.website || '',
        city: slot.city || '',
        description: slot.description || '',
        short_description: slot.short_description || slot.description || ''
      }))
      .sort((a, b) => a.rank - b.rank);

    const faqs = (supabaseData.faqs || [])
      .filter(faq => faq.question && faq.answer)
      .map(faq => ({
        question: faq.question,
        answer: faq.answer,
        display_order: faq.position || 0
      }));

    const otherAgencies = (supabaseData.otherAgencies || [])
      .filter(a => a.name && a.name.trim().length > 1)
      .map(a => ({
        name: a.name,
        city: a.city || '',
        short_description: (a.short_description || a.description || '').substring(0, 200),
        website_url: a.website_url && !a.website_url.includes('example.com') ? a.website_url : null
      }));

    // If we have agencies but no content, try to supplement from JSON
    if (!content && agencies.length > 0) {
      console.warn(`   ⚠️  state_content unavailable for ${stateSlug}, trying JSON for intro text`);
      const jsonData = loadStateFromJSON(stateSlug, dataDir);
      const jsonContent = jsonData ? {
        state_intro_full: jsonData.state_intro_full || jsonData.hero_intro || jsonData.state_description_full,
        state_intro_short: jsonData.state_intro_short || jsonData.hero_intro_short,
        state_description_full: jsonData.state_description_full
      } : null;
      return { content: jsonContent, top25: agencies, faqs, otherAgencies, source: 'supabase+json' };
    }

    return { content, top25: agencies, faqs, otherAgencies, source: 'supabase' };
  }

  // Fallback: Try JSON file
  console.warn(`   ⚠️  Falling back to JSON for ${stateSlug}`);
  const jsonData = loadStateFromJSON(stateSlug, dataDir);

  if (!jsonData) {
    return { content: null, top25: [], faqs: [], otherAgencies: [], source: 'none' };
  }

  // Extract content from JSON
  const content = {
    state_intro_full: jsonData.state_intro_full || jsonData.hero_intro || jsonData.state_description_full,
    state_intro_short: jsonData.state_intro_short || jsonData.hero_intro_short,
    state_description_full: jsonData.state_description_full
  };

  // Extract agencies from JSON
  const agencies = (jsonData.agencies || []).map(agency => ({
    rank: agency.rank,
    agency_name: agency.name,
    website: agency.websiteUrl || agency.website,
    city: agency.city,
    description: agency.fullDescription || agency.description,
    short_description: agency.shortDescription || agency.short_description
  }));

  // Extract FAQs from JSON
  const faqs = (jsonData.faqs || []).map((faq, index) => ({
    question: faq.question,
    answer: faq.answer,
    display_order: index + 1
  }));

  return {
    content,
    top25: agencies,
    faqs,
    otherAgencies: [],
    source: 'json'
  };
}

function validateFullContent(stateSlug, stateName, fullData) {
  const errors = [];

  // Check intro length
  const intro = fullData.content?.state_intro_full || fullData.content?.state_description_full || '';
  if (intro.length < 200) {
    errors.push(`Intro too short (${intro.length} chars, need 200+)`);
  }

  // Check agencies count
  if (fullData.top25.length < 25) {
    errors.push(`Only ${fullData.top25.length} agencies (need 25)`);
  }

  // FAQs are optional - no validation error if missing
  // (FAQPage schema will simply not be generated if no FAQs)

  // Check for placeholder content
  if (intro.includes('Lorem ipsum') || intro.includes('placeholder')) {
    errors.push('Intro contains placeholder text');
  }

  return errors;
}

// Helper: Normalize and validate URL
function normalizeOptionalUrl(input) {
  if (!input || typeof input !== 'string') return null;

  const trimmed = input.trim();
  if (!trimmed) return null;

  // Skip placeholder URLs
  if (trimmed.includes('example.com') || trimmed.includes('placeholder')) return null;

  try {
    // Add https:// if no protocol
    const urlString = trimmed.match(/^https?:\/\//i) ? trimmed : `https://${trimmed}`;
    const url = new URL(urlString);

    // Basic validation: must have valid hostname
    if (!url.hostname || url.hostname === 'localhost') return null;

    return url.href;
  } catch {
    return null;
  }
}

// Helper: Deduplicate FAQs based on normalized question
function dedupeFaqs(faqs) {
  if (!faqs || faqs.length === 0) return [];

  const seen = new Set();
  const unique = [];

  for (const faq of faqs) {
    // Normalize question: trim, lowercase, collapse multiple spaces
    const normalized = faq.question
      .trim()
      .toLowerCase()
      .replace(/\s+/g, ' ');

    if (!seen.has(normalized)) {
      seen.add(normalized);
      unique.push(faq);
    }
  }

  return unique;
}

// UNIFIED SCHEMA GENERATION - Single @graph with ALL schemas
// This prevents duplication and ensures clean, consolidated structured data
function generateUnifiedSchema(agencies, faqs, stateName, stateSlug, seoData) {
  const DOMAIN = 'https://gappsy.com';
  const canonicalUrl = `${DOMAIN}/marketing-agencies-in-${stateSlug}-united-states/`;
  const currentYear = new Date().getFullYear();

  const graphItems = [];

  // 1. Organization schema (sitewide)
  graphItems.push({
    "@type": "Organization",
    "@id": `${DOMAIN}/#organization`,
    "name": "Gappsy",
    "url": DOMAIN,
    "logo": {
      "@type": "ImageObject",
      "url": `${DOMAIN}/Gappsy-logo-.webp`
    },
    "description": "Top marketing agency directory featuring curated rankings and comprehensive listings across the United States.",
    "sameAs": [
      "https://twitter.com/Gappsy"
    ]
  });

  // 2. WebSite schema
  graphItems.push({
    "@type": "WebSite",
    "@id": `${DOMAIN}/#website`,
    "url": DOMAIN,
    "name": "Gappsy",
    "publisher": {
      "@id": `${DOMAIN}/#organization`
    }
  });

  // 3. WebPage schema
  graphItems.push({
    "@type": "WebPage",
    "@id": `${canonicalUrl}#webpage`,
    "url": canonicalUrl,
    "name": seoData.title || `Top 25 Marketing Agencies in ${stateName} (${currentYear}) | Gappsy`,
    "description": seoData.metaDescription || `Top digital marketing companies in ${stateName}.`,
    "isPartOf": {
      "@id": `${DOMAIN}/#website`
    },
    "about": {
      "@id": `${DOMAIN}/#organization`
    },
    "dateModified": new Date().toISOString()
  });

  // 4. BreadcrumbList schema
  graphItems.push({
    "@type": "BreadcrumbList",
    "@id": `${canonicalUrl}#breadcrumb`,
    "itemListElement": [
      {
        "@type": "ListItem",
        "position": 1,
        "name": "Home",
        "item": `${DOMAIN}/`
      },
      {
        "@type": "ListItem",
        "position": 2,
        "name": "Marketing Agencies",
        "item": `${DOMAIN}/marketing-agencies/`
      },
      {
        "@type": "ListItem",
        "position": 3,
        "name": "United States",
        "item": `${DOMAIN}/marketing-agencies/usa/`
      },
      {
        "@type": "ListItem",
        "position": 4,
        "name": stateName,
        "item": canonicalUrl
      }
    ]
  });

  // 5. ItemList schema - Include ALL agencies (Top 25) to match UI
  if (agencies && agencies.length > 0) {
    // Sort by rank to maintain correct order (stable sort)
    const schemaAgencies = [...agencies].sort((a, b) => {
      const rankA = a.rank || 999;
      const rankB = b.rank || 999;
      return rankA - rankB;
    });

    // Build ItemList with ALL agencies, matching UI count
    const itemListElement = schemaAgencies.map((agency, index) => {
      const position = agency.rank || (index + 1);
      const normalizedUrl = normalizeOptionalUrl(agency.website);

      // Build Organization item
      const item = {
        "@type": "Organization",
        "name": agency.agency_name
      };

      // Only add url if valid (no placeholder/example.com)
      if (normalizedUrl) {
        item.url = normalizedUrl;
      }

      return {
        "@type": "ListItem",
        "position": position,
        "item": item
      };
    });

    graphItems.push({
      "@type": "ItemList",
      "@id": `${canonicalUrl}#itemlist`,
      "itemListOrder": "https://schema.org/ItemListOrderAscending",
      "name": `Top 25 Marketing Agencies in ${stateName}`,
      "description": `Top ${schemaAgencies.length} marketing agencies in ${stateName}`,
      "numberOfItems": schemaAgencies.length,
      "itemListElement": itemListElement
    });
  }

  // 6. FAQPage schema - only if FAQs exist (deduplicate first)
  if (faqs && faqs.length > 0) {
    const uniqueFaqs = dedupeFaqs(faqs);

    if (uniqueFaqs.length > 0) {
      graphItems.push({
        "@type": "FAQPage",
        "@id": `${canonicalUrl}#faqpage`,
        "mainEntity": uniqueFaqs.map(faq => ({
          "@type": "Question",
          "name": faq.question,
          "acceptedAnswer": {
            "@type": "Answer",
            "text": faq.answer
          }
        }))
      });
    }
  }

  const unifiedSchema = {
    "@context": "https://schema.org",
    "@graph": graphItems
  };

  return `    <script type="application/ld+json" id="unified-jsonld-schema">
${JSON.stringify(unifiedSchema, null, 2).split('\n').map(line => '    ' + line).join('\n')}
    </script>`;
}

const ALL_STATES_FOR_LINKS = [
  { name: 'Alabama', slug: 'alabama' },
  { name: 'Alaska', slug: 'alaska' },
  { name: 'Arizona', slug: 'arizona' },
  { name: 'Arkansas', slug: 'arkansas' },
  { name: 'California', slug: 'california' },
  { name: 'Colorado', slug: 'colorado' },
  { name: 'Connecticut', slug: 'connecticut' },
  { name: 'Delaware', slug: 'delaware' },
  { name: 'District of Columbia', slug: 'district-of-columbia' },
  { name: 'Florida', slug: 'florida' },
  { name: 'Georgia', slug: 'georgia' },
  { name: 'Hawaii', slug: 'hawaii' },
  { name: 'Idaho', slug: 'idaho' },
  { name: 'Illinois', slug: 'illinois' },
  { name: 'Indiana', slug: 'indiana' },
  { name: 'Iowa', slug: 'iowa' },
  { name: 'Kansas', slug: 'kansas' },
  { name: 'Kentucky', slug: 'kentucky' },
  { name: 'Louisiana', slug: 'louisiana' },
  { name: 'Maine', slug: 'maine' },
  { name: 'Maryland', slug: 'maryland' },
  { name: 'Massachusetts', slug: 'massachusetts' },
  { name: 'Michigan', slug: 'michigan' },
  { name: 'Minnesota', slug: 'minnesota' },
  { name: 'Mississippi', slug: 'mississippi' },
  { name: 'Missouri', slug: 'missouri' },
  { name: 'Montana', slug: 'montana' },
  { name: 'Nebraska', slug: 'nebraska' },
  { name: 'Nevada', slug: 'nevada' },
  { name: 'New Hampshire', slug: 'new-hampshire' },
  { name: 'New Jersey', slug: 'new-jersey' },
  { name: 'New Mexico', slug: 'new-mexico' },
  { name: 'New York', slug: 'new-york' },
  { name: 'North Carolina', slug: 'north-carolina' },
  { name: 'North Dakota', slug: 'north-dakota' },
  { name: 'Ohio', slug: 'ohio' },
  { name: 'Oklahoma', slug: 'oklahoma' },
  { name: 'Oregon', slug: 'oregon' },
  { name: 'Pennsylvania', slug: 'pennsylvania' },
  { name: 'Puerto Rico', slug: 'puerto-rico' },
  { name: 'Rhode Island', slug: 'rhode-island' },
  { name: 'South Carolina', slug: 'south-carolina' },
  { name: 'South Dakota', slug: 'south-dakota' },
  { name: 'Tennessee', slug: 'tennessee' },
  { name: 'Texas', slug: 'texas' },
  { name: 'Utah', slug: 'utah' },
  { name: 'Vermont', slug: 'vermont' },
  { name: 'Virginia', slug: 'virginia' },
  { name: 'Washington', slug: 'washington' },
  { name: 'West Virginia', slug: 'west-virginia' },
  { name: 'Wisconsin', slug: 'wisconsin' },
  { name: 'Wyoming', slug: 'wyoming' },
];

function generateInternalLinksHTML(currentStateSlug) {
  const otherStates = ALL_STATES_FOR_LINKS.filter(s => s.slug !== currentStateSlug);
  const linkItems = otherStates.map(s =>
    `<a href="/marketing-agencies-in-${s.slug}-united-states/" style="display:inline-block;padding:0.35rem 0.75rem;margin:0.25rem;background:#F3F4F6;border-radius:9999px;font-size:0.875rem;color:#111827;text-decoration:none;border:1px solid #E5E7EB;">${escapeHtml(s.name)}</a>`
  ).join('\n        ');

  return `
      <div style="margin-top:3rem;padding-top:2rem;border-top:1px solid #E5E7EB;">
        <h2 style="font-size:1.5rem;font-weight:700;margin-bottom:0.75rem;color:#111827;">Explore Marketing Agencies in Other States</h2>
        <p style="font-size:0.95rem;color:#6B7280;margin-bottom:1.25rem;">Browse our curated Top 25 rankings for every U.S. state to find the perfect marketing partner.</p>
        <div style="display:flex;flex-wrap:wrap;gap:0;">
          ${linkItems}
        </div>
      </div>`;
}

function generateStaticBodyHTML(stateName, stateSlug, fullData) {
  const { content, top25, faqs, otherAgencies = [] } = fullData;
  const h1Text = `Top 25 Marketing Agencies in ${stateName} (${new Date().getFullYear()})`;

  // Full intro text - must be multi-paragraph
  const introText = content?.state_intro_full || content?.state_description_full ||
    `Discover the best marketing agencies in ${stateName}. Compare top-rated digital marketing, SEO, PPC, and web design companies.`;

  // Generate agencies list
  let agenciesHTML = '';
  if (top25.length > 0) {
    agenciesHTML = `
      <h2 style="font-size: 2rem; font-weight: bold; margin-top: 3rem; margin-bottom: 1.5rem;">Top 25 Marketing Agencies</h2>
      <ol style="list-style: decimal; padding-left: 2rem; margin-bottom: 3rem;">
        ${top25.map(agency => {
          const agencyDesc = agency.short_description || agency.description || '';
          const cityText = agency.city ? ` - ${agency.city}` : '';
          // Only include valid website URLs (no example.com or empty)
          const hasValidWebsite = agency.website &&
                                  agency.website.trim() !== '' &&
                                  !agency.website.includes('example.com');
          return `<li style="margin-bottom: 1.5rem;">
          <h3 style="font-size: 1.25rem; font-weight: 600; margin-bottom: 0.5rem;">
            ${escapeHtml(agency.agency_name)}${escapeHtml(cityText)}
          </h3>
          ${agencyDesc ? `<p style="color: #4B5563; margin-bottom: 0.5rem;">${escapeHtml(agencyDesc)}</p>` : ''}
          ${hasValidWebsite ? `<a href="${escapeHtml(agency.website)}" target="_blank" rel="noopener noreferrer" style="color: #2563EB; text-decoration: underline;">Visit Website</a>` : ''}
        </li>`;
        }).join('\n        ')}
      </ol>`;
  }

  // Generate FAQs section (deduplicate first)
  let faqsHTML = '';
  if (faqs.length > 0) {
    const uniqueFaqs = dedupeFaqs(faqs);

    faqsHTML = `
      <h2 style="font-size: 2rem; font-weight: bold; margin-top: 3rem; margin-bottom: 1.5rem;">Frequently Asked Questions</h2>
      <div style="margin-bottom: 3rem;">
        ${uniqueFaqs.map(faq => `<details style="margin-bottom: 1rem; border: 1px solid #E5E7EB; border-radius: 0.5rem; padding: 1rem;">
          <summary style="font-weight: 600; cursor: pointer; font-size: 1.125rem;">${escapeHtml(faq.question)}</summary>
          <div style="margin-top: 0.75rem; color: #4B5563; line-height: 1.6;">
            ${escapeHtml(faq.answer)}
          </div>
        </details>`).join('\n        ')}
      </div>`;
  }

  // Other Agencies section — curated subset (paid/featured first, max 5)
  // Intentional architecture: full list loads client-side; only a curated
  // subset is prerendered so Googlebot sees real content without bulk noise.
  let otherAgenciesHTML = '';
  const validOtherAgencies = otherAgencies.filter(a => a.name && a.name.trim().length > 1);
  if (validOtherAgencies.length > 0) {
    otherAgenciesHTML = `
      <h2 style="font-size: 1.75rem; font-weight: bold; margin-top: 3rem; margin-bottom: 1rem;">More Marketing Agencies in ${escapeHtml(stateName)}</h2>
      <ul style="list-style: disc; padding-left: 2rem; margin-bottom: 2rem;">
        ${validOtherAgencies.map(a => {
          const cityText = a.city ? ` — ${a.city}` : '';
          const desc = a.short_description ? a.short_description.trim() : '';
          const hasUrl = a.website_url && a.website_url.startsWith('http');
          return `<li style="margin-bottom: 1rem;">
          <strong>${escapeHtml(a.name)}${escapeHtml(cityText)}</strong>
          ${desc ? `<br><span style="color:#4B5563;">${escapeHtml(desc)}</span>` : ''}
          ${hasUrl ? `<br><a href="${escapeHtml(a.website_url)}" rel="noopener noreferrer" style="color:#2563EB;">Visit Website</a>` : ''}
        </li>`;
        }).join('\n        ')}
      </ul>`;
  }

  const internalLinksHTML = generateInternalLinksHTML(stateSlug);

  return `
    <!-- PRERENDER_OK: Static HTML for crawlers -->
    <div style="max-width: 1280px; margin: 0 auto; padding: 20px; font-family: system-ui, -apple-system, sans-serif;">
      <h1 style="font-size: 2.5rem; font-weight: bold; margin-bottom: 1.5rem; color: #111827;">${escapeHtml(h1Text)}</h1>
      <div style="font-size: 1.125rem; color: #4B5563; margin-bottom: 2rem; line-height: 1.7;">
        ${escapeHtml(introText).split('\n').map(para => para.trim() ? `<p style="margin-bottom: 1rem;">${para}</p>` : '').join('\n        ')}
      </div>
      ${agenciesHTML}
      ${faqsHTML}
      ${otherAgenciesHTML}
      ${internalLinksHTML}
      <div data-nosnippet>
        <noscript>
          <p style="background: #FEF3C7; border: 1px solid #F59E0B; padding: 1rem; border-radius: 0.5rem; margin-top: 2rem;">
            JavaScript is required for the full interactive experience. Please enable JavaScript to see enhanced features like filters and interactive maps.
          </p>
        </noscript>
      </div>
    </div>
  `;
}

function injectSEOTags(baseHtml, seoData, stateName, stateSlug, fullData) {
  let modifiedHtml = baseHtml;

  // Remove ALL existing robots meta tags from base HTML
  modifiedHtml = modifiedHtml.replace(/<meta name="robots"[^>]*>/g, '');

  // Replace title
  const titleRegex = /<title>.*?<\/title>/;
  if (titleRegex.test(modifiedHtml)) {
    modifiedHtml = modifiedHtml.replace(titleRegex, `<title>${escapeHtml(seoData.title)}</title>`);
  }

  // Replace FIRST meta description (without 'g' flag = only replaces first occurrence)
  const metaDescRegex = /<meta name="description"[^>]*>/;
  const newMetaDesc = `<meta name="description" content="${escapeHtml(seoData.metaDescription)}" />`;

  if (metaDescRegex.test(modifiedHtml)) {
    // Replace the first occurrence
    modifiedHtml = modifiedHtml.replace(metaDescRegex, newMetaDesc);
  } else {
    // If no existing meta description, add one after viewport meta tag
    const viewportRegex = /(<meta name="viewport"[^>]*>)/;
    if (viewportRegex.test(modifiedHtml)) {
      modifiedHtml = modifiedHtml.replace(viewportRegex, `$1\n    ${newMetaDesc}`);
    } else {
      // Fallback: add before </head>
      const headCloseTag = '</head>';
      if (modifiedHtml.includes(headCloseTag)) {
        modifiedHtml = modifiedHtml.replace(headCloseTag, `    ${newMetaDesc}\n  ${headCloseTag}`);
      }
    }
  }

  // Remove ALL existing JSON-LD schema scripts to prevent duplicates
  // This includes old individual schemas and the new unified schema
  modifiedHtml = modifiedHtml.replace(
    /<script[^>]*type=["']application\/ld\+json["'][^>]*>[\s\S]*?<\/script>\s*/gi,
    ''
  );

  // Add charset meta tag if not present (CRITICAL for SEO)
  if (!/<meta[^>]*charset=/i.test(modifiedHtml)) {
    const headOpenTag = '<head>';
    if (modifiedHtml.includes(headOpenTag)) {
      modifiedHtml = modifiedHtml.replace(headOpenTag, `${headOpenTag}\n    <meta charset="utf-8">`);
    }
  }

  const seoTagsBlock = generateSEOTags(seoData, stateName, stateSlug);
  const unifiedSchema = generateUnifiedSchema(fullData.top25, fullData.faqs, stateName, stateSlug, seoData);

  const headCloseTag = '</head>';
  if (modifiedHtml.includes(headCloseTag)) {
    // Inject SEO tags and unified schema before </head>
    const allHeadTags = seoTagsBlock + '\n\n' + unifiedSchema;
    modifiedHtml = modifiedHtml.replace(headCloseTag, `${allHeadTags}\n  ${headCloseTag}`);
  } else {
    console.warn('⚠️  Could not find </head> tag in base HTML');
  }

  // Final safety check: Remove any remaining duplicate meta descriptions (with 'g' flag = all occurrences)
  const finalMetaDescMatches = modifiedHtml.match(/<meta name="description"[^>]*>/g);
  if (finalMetaDescMatches && finalMetaDescMatches.length > 1) {
    console.warn(`⚠️  Found ${finalMetaDescMatches.length} meta descriptions for ${stateName}, keeping first and removing ${finalMetaDescMatches.length - 1} duplicate(s)...`);
    // Keep first, remove rest
    let firstFound = false;
    modifiedHtml = modifiedHtml.replace(/<meta name="description"[^>]*>/g, (match) => {
      if (!firstFound) {
        firstFound = true;
        return match;
      }
      return ''; // Remove duplicate
    });
  }

  // Inject static body content for crawlers
  const staticBodyHTML = generateStaticBodyHTML(stateName, stateSlug, fullData);
  const rootDivRegex = /(<div id="root"><\/div>)/;
  if (rootDivRegex.test(modifiedHtml)) {
    // Use a replacer function, not a string: a string replacement interprets
    // $1/$2/... as backreferences, which silently corrupts any staticBodyHTML
    // content containing a literal "$1"-style sequence (e.g. "$10.99" pricing).
    modifiedHtml = modifiedHtml.replace(rootDivRegex, () => `<div id="root">${staticBodyHTML}</div>`);
  } else {
    console.warn('⚠️  Could not find <div id="root"></div> in base HTML');
  }

  return modifiedHtml;
}

function loadStateFromJSON(stateSlug, dataDir) {
  try {
    const filePath = join(dataDir, `${stateSlug}.json`);
    if (!existsSync(filePath)) {
      return null;
    }

    const fileContent = readFileSync(filePath, 'utf-8');
    return JSON.parse(fileContent);
  } catch (error) {
    console.warn(`⚠️  Could not load JSON for ${stateSlug}:`, error.message);
    return null;
  }
}

export async function prerender(options = {}) {
  const { distDir: customDistDir, failOnError = true } = options;

  console.log('\n🚀 Starting pre-render for state pages...\n');

  const distDir = customDistDir || join(projectRoot, 'dist');
  const baseHtmlPath = join(distDir, 'index.html');
  const dataDir = join(projectRoot, 'public', 'data');

  if (!existsSync(baseHtmlPath)) {
    const error = '❌ Error: dist/index.html not found. Run Vite build first.';
    console.error(error);
    if (failOnError) {
      throw new Error(error);
    }
    process.exit(1);
  }

  const baseHtml = readFileSync(baseHtmlPath, 'utf-8');
  console.log('✅ Loaded base HTML from dist/index.html\n');

  console.log('📡 Fetching all active states from database...\n');

  // Get list of states (use database if available, otherwise JSON files)
  let statesToRender = await getAllStatesFromDatabase();

  if (statesToRender.length === 0) {
    console.log('⚠️  No states found in database, falling back to JSON files...\n');

    try {
      const jsonFiles = readdirSync(dataDir)
        .filter(f => f.endsWith('.json') && !f.includes('backup') && !f.includes('copy'));

      statesToRender = jsonFiles.map(file => {
        const stateSlug = file.replace('.json', '');
        const jsonData = loadStateFromJSON(stateSlug, dataDir);
        return {
          state_slug: stateSlug,
          state_name: jsonData?.stateName || jsonData?.state_name || stateSlug,
          content: jsonData || {}
        };
      });
    } catch (error) {
      console.error('❌ Error reading JSON fallback:', error.message);
      if (failOnError) {
        throw error;
      }
      process.exit(1);
    }
  }

  console.log(`📁 Rendering ${statesToRender.length} state pages\n`);

  // Build timestamp for "Last updated" date
  const buildTimestamp = new Date().toISOString();

  let successCount = 0;
  let errorCount = 0;
  const failedStates = [];
  const statesSummary = [];

  for (const state of statesToRender) {
    const stateSlug = state.state_slug;
    const stateName = state.state_name;

    try {
      // Fetch FULL content from Supabase (or JSON fallback)
      const fullData = await fetchFullStateData(stateSlug, dataDir);

      // Validate full content requirements
      const validationErrors = validateFullContent(stateSlug, stateName, fullData);

      if (validationErrors.length > 0) {
        console.error(`❌ ${stateName.padEnd(20)} → VALIDATION FAILED:`);
        validationErrors.forEach(err => console.error(`   ✗ ${err}`));
        errorCount++;
        failedStates.push({
          stateSlug,
          stateName,
          errors: validationErrors,
          source: fullData.source
        });

        if (failOnError) {
          throw new Error(`State ${stateName} failed validation: ${validationErrors.join(', ')}`);
        }
        continue;
      }

      const seoData = generateSEOData(stateSlug, stateName, fullData.content || {});

      // Generate canonical version (for directory) with all schemas
      const canonicalHtml = injectSEOTags(baseHtml, seoData, stateName, stateSlug, fullData);

      const outputDir = join(distDir, `marketing-agencies-in-${stateSlug}-united-states`);
      mkdirSync(outputDir, { recursive: true });
      const dirOutputPath = join(outputDir, 'index.html');
      writeFileSync(dirOutputPath, canonicalHtml, 'utf-8');

      // Generate flat file version (same content, no noindex - too risky if canonical routes to .html)
      const flatHtml = injectSEOTags(baseHtml, seoData, stateName, stateSlug, fullData);
      const flatOutputPath = join(distDir, `marketing-agencies-in-${stateSlug}-united-states.html`);
      writeFileSync(flatOutputPath, flatHtml, 'utf-8');

      // Enhanced logging
      const agencyCount = fullData.top25.length;
      const faqCount = fullData.faqs.length;
      const introLength = (fullData.content?.state_intro_full || '').length;
      const sourceLabel = fullData.source === 'supabase' ? '🔵 DB' : fullData.source === 'json' ? '📄 JSON' : '⚠️  NONE';

      console.log(`✅ ${stateName.padEnd(20)} → ${agencyCount} agencies, ${faqCount} FAQs, ${introLength} chars intro (${sourceLabel})`);

      successCount++;
      statesSummary.push({
        stateSlug,
        stateName,
        agencies: agencyCount,
        faqs: faqCount,
        introLength,
        source: fullData.source
      });

    } catch (error) {
      console.error(`❌ ${stateName.padEnd(20)} → Error: ${error.message}`);
      errorCount++;
      failedStates.push({
        stateSlug,
        stateName,
        errors: [error.message],
        source: 'error'
      });

      if (failOnError) {
        throw error;
      }
    }
  }

  console.log(`\n📊 Pre-render complete:`);
  console.log(`   ✅ Success: ${successCount} state pages`);
  if (errorCount > 0) {
    console.log(`   ❌ Failed: ${errorCount} state pages`);
    console.log(`\n❌ Failed states:`);
    failedStates.forEach(state => {
      console.log(`   • ${state.stateName} (${state.stateSlug}):`);
      state.errors.forEach(err => console.log(`     - ${err}`));
    });
  }

  // Write deployment marker with detailed summary
  const markerContent = `PRERENDER_COMPLETE
Timestamp: ${buildTimestamp}
States Total: ${statesToRender.length}
States Success: ${successCount}
States Failed: ${errorCount}

Sample States (CA, TX, FL, NJ):
${['california', 'texas', 'florida', 'new-jersey'].map(slug => {
  const summary = statesSummary.find(s => s.stateSlug === slug);
  if (summary) {
    return `- ${summary.stateName}: ${summary.agencies} agencies, ${summary.faqs} FAQs, ${summary.introLength} chars (${summary.source})`;
  }
  return `- ${slug}: NOT FOUND`;
}).join('\n')}

All States:
${statesSummary.map(s => `- ${s.stateName} (${s.stateSlug}): ${s.agencies} agencies, ${s.faqs} FAQs, ${s.introLength} chars intro`).join('\n')}
`;

  const markerPath = join(distDir, '__prerendered.txt');
  writeFileSync(markerPath, markerContent, 'utf-8');

  console.log(`\n✅ Deploy marker written to dist/__prerendered.txt`);
  console.log(`   Timestamp: ${buildTimestamp}`);
  console.log(`   Verify at: https://gappsy.com/__prerendered.txt`);

  if (errorCount > 0 && failOnError) {
    throw new Error(`Prerender failed for ${errorCount} states. Build cannot continue.`);
  }

  console.log('\n✅ Prerender completed successfully\n');
  return {
    success: errorCount === 0,
    successCount,
    errorCount,
    failedStates,
    statesSummary
  };
}

// Allow direct execution
if (import.meta.url === `file://${process.argv[1]}`) {
  prerender().catch(error => {
    console.error('\n❌ Prerender failed:', error.message);
    process.exit(1);
  });
}

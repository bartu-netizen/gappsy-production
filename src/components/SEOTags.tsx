import { useLayoutEffect } from 'react';

interface Agency {
  rank: number;
  name: string;
  website?: string;
  phone?: string;
  city: string;
  state: string;
}

interface FAQ {
  question: string;
  answer: string;
}

// Helper: Normalize and validate URL
function normalizeOptionalUrl(input: string | null | undefined): string | null {
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
function dedupeFaqs(faqs: FAQ[]): FAQ[] {
  if (!faqs || faqs.length === 0) return [];

  const seen = new Set<string>();
  const unique: FAQ[] = [];

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

interface SEOTagsProps {
  title: string;
  description: string;
  canonicalUrl: string;
  stateSlug?: string;
  stateName?: string;
  proofTag?: string;
  keywords?: string[];
  dateModified?: string;
  ogType?: string;
  ogTitle?: string;
  ogDescription?: string;
  ogImage?: string;
  ogImageWidth?: number;
  ogImageHeight?: number;
  ogImageType?: string;
  ogUrl?: string;
  twitterCard?: string;
  twitterTitle?: string;
  twitterDescription?: string;
  twitterImage?: string;
  twitterSite?: string;
  agencies?: Agency[];
  faqs?: FAQ[];
}

function SEOTags({
  title,
  description,
  canonicalUrl,
  stateSlug,
  stateName,
  proofTag,
  keywords = [],
  dateModified,
  ogType = 'website',
  ogTitle,
  ogDescription,
  ogImage,
  ogImageWidth = 1200,
  ogImageHeight = 630,
  ogImageType = 'image/jpeg',
  ogUrl,
  twitterCard = 'summary_large_image',
  twitterTitle,
  twitterDescription,
  twitterImage,
  twitterSite = '@Gappsy',
  agencies = [],
  faqs = []
}: SEOTagsProps) {
  // Use useLayoutEffect for synchronous DOM updates BEFORE paint
  // This ensures SEO Boost prerenderer captures tags immediately
  useLayoutEffect(() => {
    const currentYear = new Date().getFullYear();

    const normalizeYear = (text?: string): string => {
      if (!text) return '';
      return text.replace(/\b20\d{2}\b/g, String(currentYear));
    };

    // Ensure canonical URL has trailing slash (WordPress standard)
    const ensureTrailingSlash = (url: string): string => {
      // Don't modify if it's just the domain or already has trailing slash
      if (url.endsWith('/')) return url;
      // Don't add trailing slash to URLs with file extensions or query params
      const urlObj = new URL(url);
      if (urlObj.pathname.includes('.') || urlObj.search) return url;
      // Add trailing slash to path
      return url + '/';
    };

    const normalizedTitle = normalizeYear(title);
    const normalizedOgTitle = normalizeYear(ogTitle);
    const normalizedTwitterTitle = normalizeYear(twitterTitle);

    document.title = normalizedTitle;

    const isWordPressImage = (url?: string): boolean => {
      if (!url) return false;
      return url.includes('wp-content/uploads') || url.includes('/wp-content/');
    };

    let finalOgImage = ogImage;
    let finalOgImageType = ogImageType;
    if (stateSlug && (!ogImage || isWordPressImage(ogImage))) {
      finalOgImage = `${window.location.origin}/og/marketing-agencies-in-${stateSlug}-united-states.png`;
      finalOgImageType = 'image/png';
    }

    const finalOgTitle = normalizedOgTitle || normalizedTitle;
    const finalOgDescription = ogDescription || description;
    const finalOgUrl = ogUrl || canonicalUrl;
    const finalTwitterTitle = normalizedTwitterTitle || normalizedOgTitle || normalizedTitle;
    const finalTwitterDescription = twitterDescription || ogDescription || description;
    const finalTwitterImage = twitterImage || finalOgImage;

    // Build meta tags array
    const metaTags = [
      { name: 'description', content: description },
      { name: 'robots', content: 'index,follow' },
      { property: 'og:site_name', content: 'Gappsy' },
      { property: 'og:type', content: ogType },
      { property: 'og:title', content: finalOgTitle },
      { property: 'og:description', content: finalOgDescription },
      { property: 'og:url', content: ensureTrailingSlash(finalOgUrl) },
      { name: 'twitter:card', content: twitterCard },
      { name: 'twitter:site', content: twitterSite },
      { name: 'twitter:title', content: finalTwitterTitle },
      { name: 'twitter:description', content: finalTwitterDescription }
    ];

    // Add proof tag for verification (SEO Boost capture proof)
    if (proofTag) {
      metaTags.push({ name: 'seo-proof', content: proofTag });
    }

    // Add conditional tags
    if (finalOgImage) {
      metaTags.push({ property: 'og:image', content: finalOgImage });
      metaTags.push({ property: 'og:image:width', content: String(ogImageWidth) });
      metaTags.push({ property: 'og:image:height', content: String(ogImageHeight) });
      metaTags.push({ property: 'og:image:type', content: finalOgImageType });
    }

    if (finalTwitterImage) {
      metaTags.push({ name: 'twitter:image', content: finalTwitterImage });
    }

    if (keywords && keywords.length > 0) {
      metaTags.push({ name: 'keywords', content: keywords.join(', ') });
    }

    // Update or create meta tags
    metaTags.forEach(({ name, property, content }) => {
      const attribute = property ? 'property' : 'name';
      const value = property || name;
      let element = document.querySelector(`meta[${attribute}="${value}"]`) as HTMLMetaElement;

      if (!element) {
        element = document.createElement('meta');
        element.setAttribute(attribute, value);
        document.head.appendChild(element);
      }

      element.setAttribute('content', content);
    });

    // DEDUPE SAFETY: Remove duplicate meta descriptions (keep first, remove rest)
    const descriptionMetas = Array.from(document.querySelectorAll('meta[name="description"]'));
    if (descriptionMetas.length > 1) {
      // Keep first, remove rest
      descriptionMetas.slice(1).forEach(meta => meta.remove());
    }

    // Update or create canonical link with trailing slash
    let canonicalLink = document.querySelector('link[rel="canonical"]') as HTMLLinkElement;
    if (!canonicalLink) {
      canonicalLink = document.createElement('link');
      canonicalLink.rel = 'canonical';
      document.head.appendChild(canonicalLink);
    }
    canonicalLink.href = ensureTrailingSlash(canonicalUrl);

    // UNIFIED JSON-LD STRUCTURED DATA - Single @graph with ALL schemas
    // This prevents duplication and ensures clean, consolidated structured data
    const graphItems: any[] = [];

    // 1. Organization schema (sitewide)
    graphItems.push({
      "@type": "Organization",
      "@id": "https://www.gappsy.com/#organization",
      "name": "Gappsy",
      "url": "https://www.gappsy.com",
      "logo": {
        "@type": "ImageObject",
        "url": "https://www.gappsy.com/Gappsy-logo-.webp"
      },
      "description": "Top marketing agency directory featuring curated rankings and comprehensive listings across the United States.",
      "sameAs": [
        "https://twitter.com/Gappsy"
      ]
    });

    // 2. WebSite schema
    graphItems.push({
      "@type": "WebSite",
      "@id": "https://www.gappsy.com/#website",
      "url": "https://www.gappsy.com",
      "name": "Gappsy",
      "publisher": {
        "@id": "https://www.gappsy.com/#organization"
      }
    });

    // 3. WebPage schema
    graphItems.push({
      "@type": "WebPage",
      "@id": ensureTrailingSlash(canonicalUrl) + "#webpage",
      "url": ensureTrailingSlash(canonicalUrl),
      "name": normalizedTitle,
      "description": description,
      "isPartOf": {
        "@id": "https://www.gappsy.com/#website"
      },
      "about": {
        "@id": "https://www.gappsy.com/#organization"
      },
      "dateModified": dateModified || new Date().toISOString()
    });

    // 4. BreadcrumbList schema for state pages
    if (stateSlug) {
      const displayStateName = stateName || stateSlug
        .split('-')
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(' ');

      graphItems.push({
        "@type": "BreadcrumbList",
        "@id": ensureTrailingSlash(canonicalUrl) + "#breadcrumb",
        "itemListElement": [
          {
            "@type": "ListItem",
            "position": 1,
            "name": "Home",
            "item": "https://www.gappsy.com/"
          },
          {
            "@type": "ListItem",
            "position": 2,
            "name": "Marketing Agencies",
            "item": "https://www.gappsy.com/marketing-agencies/"
          },
          {
            "@type": "ListItem",
            "position": 3,
            "name": "United States",
            "item": "https://www.gappsy.com/marketing-agencies/usa/"
          },
          {
            "@type": "ListItem",
            "position": 4,
            "name": displayStateName,
            "item": ensureTrailingSlash(canonicalUrl)
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
          const item: any = {
            "@type": "Organization",
            "name": agency.name
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
          "@id": ensureTrailingSlash(canonicalUrl) + "#itemlist",
          "itemListOrder": "https://schema.org/ItemListOrderAscending",
          "name": normalizedTitle,
          "description": `Top ${schemaAgencies.length} marketing agencies in ${displayStateName}`,
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
            "@id": ensureTrailingSlash(canonicalUrl) + "#faqpage",
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
    }

    // Create single unified @graph schema
    const unifiedSchema = {
      "@context": "https://schema.org",
      "@graph": graphItems
    };

    // Remove ALL existing JSON-LD scripts to prevent duplicates
    const existingScripts = Array.from(document.querySelectorAll('script[type="application/ld+json"]'));
    existingScripts.forEach(script => {
      // Keep only our unified schema script (if it exists)
      if (script.id !== 'unified-jsonld-schema') {
        script.remove();
      }
    });

    // Insert or update the single unified JSON-LD script
    let unifiedScript = document.getElementById('unified-jsonld-schema') as HTMLScriptElement;
    if (!unifiedScript) {
      unifiedScript = document.createElement('script');
      unifiedScript.id = 'unified-jsonld-schema';
      unifiedScript.type = 'application/ld+json';
      document.head.appendChild(unifiedScript);
    }
    unifiedScript.textContent = JSON.stringify(unifiedSchema, null, 0);

    // Add charset meta tag to <head> if not present (CRITICAL for SEO)
    if (!document.querySelector('meta[charset]')) {
      const charsetMeta = document.createElement('meta');
      charsetMeta.setAttribute('charset', 'utf-8');
      // Insert as first element in <head>
      document.head.insertBefore(charsetMeta, document.head.firstChild);
    }

    // Cleanup function: Remove tags on unmount or before re-render
    return () => {
      // Don't remove tags on cleanup - just let them be updated on next render
      // This prevents flashing of missing tags during navigation
    };
  }, [
    title,
    description,
    canonicalUrl,
    stateSlug,
    stateName,
    proofTag,
    keywords,
    dateModified,
    ogType,
    ogTitle,
    ogDescription,
    ogImage,
    ogUrl,
    twitterCard,
    twitterTitle,
    twitterDescription,
    twitterImage,
    twitterSite,
    agencies,
    faqs
  ]);

  return null;
}

export default SEOTags;

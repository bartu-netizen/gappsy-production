import { useEffect } from 'react';

interface Agency {
  rank: number;
  name: string;
  website: string;
  phone?: string;
  city: string;
  state: string;
}

interface SEOSchemasProps {
  stateName: string;
  stateSlug: string;
  stateAbbreviation: string;
  agencies: Agency[];
  dateModified: string;
  seoTitle?: string;
  seoDescription?: string;
}

function SEOSchemas({
  stateName,
  stateSlug,
  stateAbbreviation,
  agencies,
  dateModified,
  seoTitle,
  seoDescription
}: SEOSchemasProps) {
  useEffect(() => {
    const baseUrl = 'https://gappsy.com';
    const pageUrl = `${baseUrl}/marketing-agencies-in-${stateSlug}-united-states/`;
    const currentYear = new Date().getFullYear();

    // Use NEW templates matching seo-generator.js for consistency
    const schemaTitle = seoTitle || `Top 25 Marketing Agencies in ${stateName} (${currentYear}) | Gappsy`;
    const schemaDescription = seoDescription || `Top digital marketing companies in ${stateName}. Compare SEO, PPC, web design & social media agencies, reviews and locations. Updated for ${currentYear}.`;

    const webPageSchema = {
      "@context": "https://schema.org",
      "@type": "WebPage",
      "name": schemaTitle,
      "description": schemaDescription,
      "url": pageUrl,
      "dateModified": dateModified
    };

    const itemListSchema = {
      "@context": "https://schema.org",
      "@type": "ItemList",
      "itemListOrder": "Descending",
      "name": schemaTitle,
      "itemListElement": agencies.map((agency, index) => ({
        "@type": "ListItem",
        "position": index + 1,
        "name": agency.name,
        "url": agency.website || pageUrl
      }))
    };

    const localBusinessSchemas = agencies
      .filter(agency => agency.website)
      .map(agency => ({
        "@context": "https://schema.org",
        "@type": "LocalBusiness",
        "name": agency.name,
        "url": agency.website,
        ...(agency.phone && { "telephone": agency.phone }),
        "address": {
          "@type": "PostalAddress",
          "addressRegion": stateAbbreviation,
          "addressLocality": agency.city,
          "addressCountry": "US"
        }
      }));

    const allSchemas = [webPageSchema, itemListSchema, ...localBusinessSchemas];

    const scriptElements: HTMLScriptElement[] = [];

    allSchemas.forEach((schema, index) => {
      const script = document.createElement('script');
      script.type = 'application/ld+json';
      script.text = JSON.stringify(schema);
      script.id = `seo-schema-${index}`;
      script.setAttribute('data-schema-type', 'seo-markup');
      document.head.appendChild(script);
      scriptElements.push(script);
    });

    return () => {
      scriptElements.forEach(script => {
        if (script.parentNode) {
          document.head.removeChild(script);
        }
      });
    };
  }, [stateName, stateSlug, stateAbbreviation, agencies, dateModified, seoTitle, seoDescription]);

  return null;
}

export default SEOSchemas;

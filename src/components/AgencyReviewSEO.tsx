import { useEffect } from 'react';
import { formatLastUpdated, formatSchemaDate } from '../utils/formatLastUpdated';

interface AgencyReview {
  agency_name: string;
  agency_slug: string;
  state_name: string;
  state_slug: string;
  headquarters: string | null;
  city: string | null;
  is_top_25_ranked: boolean;
  last_updated: string;
}

interface AgencyReviewSEOProps {
  agency: AgencyReview;
}

export default function AgencyReviewSEO({ agency }: AgencyReviewSEOProps) {
  const title = `${agency.agency_name} Reviews & Analysis — Should You Hire Them?`;
  const description = `Independent review of ${agency.agency_name}, a marketing agency in ${agency.city || agency.state_name}. We analyze transparency, credibility signals, and public information to help you make an informed hiring decision.`;

  // CANONICAL: always /agency-reviews/{agency_slug} — no trailing slash, no state_slug appended
  const canonicalUrl = `https://www.gappsy.com/agency-reviews/${agency.agency_slug}`;

  const lastUpdatedDate = formatLastUpdated(agency.last_updated);
  const schemaDate = formatSchemaDate(agency.last_updated);

  useEffect(() => {
    document.title = title;

    const setMeta = (name: string, content: string) => {
      let el = document.querySelector(`meta[name="${name}"]`) as HTMLMetaElement;
      if (!el) {
        el = document.createElement('meta');
        el.setAttribute('name', name);
        document.head.appendChild(el);
      }
      el.setAttribute('content', content);
    };

    const setOg = (property: string, content: string) => {
      let el = document.querySelector(`meta[property="${property}"]`) as HTMLMetaElement;
      if (!el) {
        el = document.createElement('meta');
        el.setAttribute('property', property);
        document.head.appendChild(el);
      }
      el.setAttribute('content', content);
    };

    setMeta('description', description);

    let canonical = document.querySelector('link[rel="canonical"]') as HTMLLinkElement;
    if (!canonical) {
      canonical = document.createElement('link');
      canonical.rel = 'canonical';
      document.head.appendChild(canonical);
    }
    canonical.href = canonicalUrl;

    setOg('og:type', 'article');
    setOg('og:title', title);
    setOg('og:description', description);
    setOg('og:url', canonicalUrl);

    setMeta('twitter:card', 'summary');
    setMeta('twitter:title', title);
    setMeta('twitter:description', description);

    // Review Schema
    if (schemaDate) {
      const reviewSchema = {
        "@context": "https://schema.org",
        "@type": "Review",
        "itemReviewed": {
          "@type": "Organization",
          "name": agency.agency_name,
          "address": {
            "@type": "PostalAddress",
            "addressLocality": agency.city || agency.state_name,
            "addressRegion": agency.state_name
          }
        },
        "author": {
          "@type": "Organization",
          "name": "Gappsy"
        },
        "reviewBody": `Independent review of ${agency.agency_name}, analyzing transparency, credibility signals, and public information.`,
        "datePublished": schemaDate,
        "dateModified": schemaDate
      };

      let reviewScript = document.getElementById('review-schema');
      if (!reviewScript) {
        reviewScript = document.createElement('script');
        reviewScript.id = 'review-schema';
        reviewScript.type = 'application/ld+json';
        document.head.appendChild(reviewScript);
      }
      reviewScript.textContent = JSON.stringify(reviewSchema);
    }

    // FAQPage Schema
    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": `Is ${agency.agency_name} legit?`,
          "acceptedAnswer": {
            "@type": "Answer",
            "text": `Based on our review of publicly available information as of ${lastUpdatedDate}, ${agency.is_top_25_ranked
              ? `${agency.agency_name} demonstrates strong credibility signals including verified case studies, transparent pricing, and independent recognition. They rank among our Top 25 agencies in ${agency.state_name}.`
              : `we found limited public credibility signals for ${agency.agency_name}. We recommend requesting detailed references and comparing them with agencies from our Top 25 list before making a decision.`}`
          }
        },
        {
          "@type": "Question",
          "name": `How much does ${agency.agency_name} cost?`,
          "acceptedAnswer": {
            "@type": "Answer",
            "text": `${agency.agency_name} pricing information should be requested directly from the agency. We recommend getting proposals from multiple agencies to compare value and services.`
          }
        },
        {
          "@type": "Question",
          "name": `What are the best alternatives to ${agency.agency_name}?`,
          "acceptedAnswer": {
            "@type": "Answer",
            "text": `We've identified 25 top-performing marketing agencies in ${agency.state_name} with verified credentials and proven track records. View the full list at https://www.gappsy.com/marketing-agencies-in-${agency.state_slug}-united-states/`
          }
        },
        {
          "@type": "Question",
          "name": `Is ${agency.agency_name} ranked in the Top 25?`,
          "acceptedAnswer": {
            "@type": "Answer",
            "text": `${agency.is_top_25_ranked
              ? `Yes, ${agency.agency_name} is ranked among the Top 25 marketing agencies in ${agency.state_name} based on our evaluation of transparency, proven results, and credibility signals.`
              : `No, ${agency.agency_name} is not currently ranked in our Top 25 marketing agencies in ${agency.state_name}. Our rankings are based on publicly verifiable information including case studies, pricing transparency, team credentials, and independent recognition.`}`
          }
        }
      ]
    };

    let faqScript = document.getElementById('faq-schema');
    if (!faqScript) {
      faqScript = document.createElement('script');
      faqScript.id = 'faq-schema';
      faqScript.type = 'application/ld+json';
      document.head.appendChild(faqScript);
    }
    faqScript.textContent = JSON.stringify(faqSchema);

    return () => {
      document.getElementById('faq-schema')?.remove();
      document.getElementById('review-schema')?.remove();
    };
  }, [title, description, canonicalUrl, agency, lastUpdatedDate, schemaDate]);

  return null;
}

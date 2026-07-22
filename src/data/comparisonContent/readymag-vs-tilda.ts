import type { ToolComparisonContent } from './types';

const readymagVsTildaContent: ToolComparisonContent = {
  "verdict": "Readymag and Tilda are both no-code design tools, but they're built for different workflows. Readymag centers on a freeform, print-style canvas with strong typographic controls, letting designers build websites, portfolios, presentations, and publications with overlapping, rotatable elements — though its official pricing wasn't accessible for verification and it has no documented AI features. Tilda is built around a library of 550+ pre-designed blocks plus an AI assistant that generates page copy and imagery from prompts, and it adds a built-in CRM, e-commerce, and SEO tools, with clearly published pricing starting at $10/month. The choice depends on whether freeform creative layout control or block-based speed with AI assistance and built-in business tools matters more.",
  "bestForToolA": "Designers with a print or editorial background who want freeform, overlapping layouts and strong typographic control across multiple project types like portfolios and presentations.",
  "bestForToolB": "Small businesses or solo sellers who want AI-generated page content, a built-in CRM and e-commerce, published pricing, and the option to export source code on the Business plan.",
  "whoNeedsBoth": "A design studio might use Readymag for portfolio and presentation work for clients, while running its own or a client's online store and CRM-driven marketing site on Tilda.",
  "keyDifferences": [
    {
      "title": "Design paradigm",
      "toolA": "Uses a freeform canvas that lets elements overlap and rotate, similar to a print layout tool.",
      "toolB": "Built around a library of 550+ pre-designed blocks, with an optional Zero Block editor for more granular custom layouts.",
      "whyItMatters": "A freeform canvas suits creative, non-grid layouts, while a block library favors speed and consistency.",
      "benefitsWho": "Designers wanting full creative control versus users wanting fast, structured page assembly."
    },
    {
      "title": "AI-assisted content generation",
      "toolA": "No AI features are documented for the product.",
      "toolB": "Includes 'AI on Tilda,' which generates page copy, imagery, and interactive blocks from text prompts.",
      "whyItMatters": "Teams wanting AI-generated starting content have a documented option only with Tilda.",
      "benefitsWho": "Small business owners who want a fast, AI-assisted starting point."
    },
    {
      "title": "Built-in CRM and e-commerce",
      "toolA": "Not documented as a feature.",
      "toolB": "Includes a built-in CRM for managing leads and customers, plus e-commerce with card, PayPal, and Stripe support.",
      "whyItMatters": "Businesses selling products or managing leads directly on the site benefit from Tilda's built-in tools rather than needing separate software.",
      "benefitsWho": "Small online sellers and service businesses managing leads and sales."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Official pricing details were not accessible for direct verification at the time of writing.",
      "toolB": "Publishes exact tier pricing: Free, Personal from $10/month (annual), and Business from $20/month (annual).",
      "whyItMatters": "Buyers who want to compare costs upfront have clearer, published information with Tilda.",
      "benefitsWho": "Budget-conscious buyers evaluating cost before signing up."
    },
    {
      "title": "Company track record",
      "toolA": "Founded in 2012, headquartered in New York City, USA.",
      "toolB": "Founding year and headquarters are not documented.",
      "whyItMatters": "Buyers weighing platform longevity have more documented history for Readymag.",
      "benefitsWho": "Businesses prioritizing platform stability and track record."
    }
  ],
  "featureMatrix": [
    {
      "group": "Design & Editing",
      "rows": [
        {
          "feature": "Freeform / print-style canvas",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Pre-designed block library",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tilda documents 550+ blocks."
        },
        {
          "feature": "Advanced typographic controls",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-assisted content/page generation",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Readymag's facts explicitly state no AI features are documented."
        },
        {
          "feature": "Multiple project types (portfolio/presentation/publication)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Business Features",
      "rows": [
        {
          "feature": "Built-in CRM",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "E-commerce",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SEO tools (meta tags, sitemaps, robots.txt)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Source code export",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on Tilda's Business plan."
        }
      ]
    },
    {
      "group": "Pricing & Company",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published tier pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Readymag's official pricing was not accessible for verification."
        },
        {
          "feature": "Founded year / headquarters documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Readymag: founded 2012, New York City, USA."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the main design difference between Readymag and Tilda?",
      "answer": "Readymag uses a freeform canvas where elements can overlap and rotate like a print layout; Tilda is built around a library of 550+ pre-designed blocks, with an optional Zero Block editor for more granular custom layouts."
    },
    {
      "question": "Does either tool use AI?",
      "answer": "Tilda includes 'AI on Tilda,' which generates page copy, imagery, and interactive blocks from prompts; Readymag has no AI features documented."
    },
    {
      "question": "Is pricing published for both?",
      "answer": "Tilda publishes exact tier pricing (Free, Personal from $10/month, Business from $20/month). Readymag's official pricing details were not accessible for verification at the time of writing."
    },
    {
      "question": "Does either include a CRM or online store?",
      "answer": "Tilda has a built-in CRM and e-commerce with card, PayPal, and Stripe support; these aren't documented as Readymag features."
    },
    {
      "question": "Which tool has a longer documented history?",
      "answer": "Readymag was founded in 2012 and is headquartered in New York City; Tilda's founding year and headquarters aren't documented."
    },
    {
      "question": "Can I build things other than a website?",
      "answer": "Readymag explicitly supports building websites, portfolios, presentations, and publications from one tool; Tilda's documented features focus on websites, stores, and CRM."
    }
  ]
};

export default readymagVsTildaContent;

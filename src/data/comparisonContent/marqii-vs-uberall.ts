import type { ToolComparisonContent } from './types';

const marqiiVsUberallContent: ToolComparisonContent = {
  "verdict": "Marqii is purpose-built for restaurants, syncing menus from POS systems and generating SEO/GEO location pages across 70+ platforms for a base of 15,000+ restaurant locations, while Uberall is a general-purpose multi-location marketing platform serving any brand with physical locations, publishing to 150+ directories with an agentic AI product (UB-I) for continuous performance monitoring. A restaurant chain would likely lean toward Marqii for its POS-menu integration; a multi-vertical retail or service brand without menu-sync needs would look to Uberall.",
  "bestForToolA": "Marqii fits restaurant and food-service brands that need automatic menu updates tied to their POS system plus AI-generated review responses, as used by chains like Tacodeli and Insomnia Cookies.",
  "bestForToolB": "Uberall fits multi-location brands across any vertical that need listings synced to 150+ directories (including voice search) plus AI-generated social content (Local Social) and integrations with Salesforce, Zendesk, and Google BigQuery.",
  "whoNeedsBoth": "There's no clear scenario for using both together — they overlap almost entirely on listings and review management, so a restaurant brand would pick Marqii for its menu-specific tooling while a non-restaurant multi-location brand would pick Uberall instead.",
  "keyDifferences": [
    {
      "title": "Vertical Focus",
      "toolA": "Purpose-built for restaurants with POS-integrated menu management.",
      "toolB": "Horizontal platform serving any multi-location business.",
      "whyItMatters": "Restaurant-specific features like menu sync don't exist as a general product feature outside Marqii.",
      "benefitsWho": "Benefits restaurant and food-service operators specifically."
    },
    {
      "title": "Directory Reach",
      "toolA": "Automates updates across 70+ platforms including Google, Yelp, Apple Maps, and Facebook.",
      "toolB": "Publishes across 150+ directories including voice search platforms.",
      "whyItMatters": "Brands prioritizing maximum directory coverage need to compare raw reach.",
      "benefitsWho": "Benefits brands wanting the broadest possible listing distribution."
    },
    {
      "title": "AI Capabilities",
      "toolA": "AI-generated review responses and AI-optimized FAQ widgets built for AI search discovery.",
      "toolB": "Geo Studio (AI optimization tool), Local Social (AI-generated social content), and UB-I, an agentic AI product for continuous location performance orchestration.",
      "whyItMatters": "The scope of AI differs — Marqii's AI centers on reviews and FAQ content, Uberall's spans social content and autonomous performance monitoring.",
      "benefitsWho": "Benefits marketing teams wanting AI-driven social content and ongoing optimization, not just review replies."
    },
    {
      "title": "Company Track Record",
      "toolA": "Founding year and headquarters not disclosed; scale evidenced by 15,000+ restaurant locations served.",
      "toolB": "Founded 2013, headquartered in Berlin, Germany, with a documented operating history.",
      "whyItMatters": "Buyers doing vendor due diligence may weigh disclosed company history and founding date.",
      "benefitsWho": "Benefits enterprise procurement teams that require vendor background checks."
    },
    {
      "title": "Enterprise Integrations",
      "toolA": "Integrates with POS systems for menu sync; a broader integration catalog isn't documented.",
      "toolB": "Integrates with Shopify, Salesforce, Zendesk, Tableau, Google BigQuery, Google Ads, and Semrush.",
      "whyItMatters": "Brands with existing CRM/analytics stacks need documented integration compatibility.",
      "benefitsWho": "Benefits larger enterprise marketing teams with established tool stacks."
    }
  ],
  "featureMatrix": [
    {
      "group": "Listings & Reviews",
      "rows": [
        {
          "feature": "Listings management",
          "toolA": "available",
          "toolB": "available",
          "note": "Marqii: 70+ platforms; Uberall: 150+ directories"
        },
        {
          "feature": "Review management",
          "toolA": "available",
          "toolB": "available",
          "note": "Marqii uses AI-generated responses"
        },
        {
          "feature": "Voice search optimization",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Content & Local SEO",
      "rows": [
        {
          "feature": "SEO/GEO location pages",
          "toolA": "available",
          "toolB": "available",
          "note": "Marqii's Host includes schema markup"
        },
        {
          "feature": "Menu management (POS sync)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Social media publishing",
          "toolA": "available",
          "toolB": "available",
          "note": "Uberall's Local Social is AI-generated"
        },
        {
          "feature": "FAQ widgets for AI search",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Enterprise",
      "rows": [
        {
          "feature": "Agentic AI performance monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Uberall's UB-I"
        },
        {
          "feature": "Free AI visibility scan before purchase",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "CRM/analytics integrations (Salesforce, BigQuery, etc.)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require a demo/quote"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is either tool restaurant-specific?",
      "answer": "Marqii is built specifically for restaurants and serves 15,000+ restaurant locations; Uberall serves any multi-location vertical, not just restaurants."
    },
    {
      "question": "How many directories does each cover?",
      "answer": "Marqii automates updates across 70+ platforms; Uberall publishes across 150+ directories."
    },
    {
      "question": "Does either publish pricing?",
      "answer": "No, both require a demo or custom quote; Marqii additionally offers a free AI Visibility Scan before purchase."
    },
    {
      "question": "Which has agentic AI?",
      "answer": "Uberall's UB-I is described as an agentic AI product that continuously monitors and orchestrates location performance improvements; this isn't documented for Marqii."
    },
    {
      "question": "Which integrates with POS systems?",
      "answer": "Marqii's Menu Management integrates with POS systems to keep menus current across listings; this isn't documented for Uberall."
    },
    {
      "question": "When was each company founded?",
      "answer": "Uberall was founded in 2013 and is headquartered in Berlin, Germany; Marqii's founding year is not disclosed."
    }
  ]
};

export default marqiiVsUberallContent;

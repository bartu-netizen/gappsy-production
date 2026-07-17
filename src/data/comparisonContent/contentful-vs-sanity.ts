import type { ToolComparisonContent } from './types';

const contentfulVsSanityContent: ToolComparisonContent = {
  "verdict": "Contentful and Sanity solve different problems even though both are freemium headless CMSs. Contentful bundles a CMS with personalization, AI Actions automation, and the newer Palmata AI-search product, but its paid tiers (Lite/Enterprise) aren't self-serve — you contact sales for pricing. Sanity keeps its scope tighter around structured JSON content, GROQ querying, and real-time editing, and publishes its Growth tier at $15/seat/month up to 50 seats. The right choice depends on whether you need Contentful's broader platform surface or Sanity's transparent, developer-oriented pricing.",
  "bestForToolA": "Teams that want a broader composable digital experience platform — personalization, AI-driven workflow automation (AI Actions), and Palmata's AI-search visibility tooling — bundled with the CMS, and who are prepared to contact sales for paid-tier pricing.",
  "bestForToolB": "Teams that want a developer-first, structured-content backend with GROQ querying, real-time multiplayer editing, and a Content Agent for automating transformations, with published per-seat pricing on the Growth tier.",
  "whoNeedsBoth": "Agencies or platform teams supporting multiple clients may end up running both: a client already standardized on Contentful's personalization and AI Actions workflows keeps that stack, while a separate project needing Sanity's GROQ-based structured content model and real-time editing runs on Sanity — rather than forcing one CMS across every engagement.",
  "keyDifferences": [
    {
      "title": "Paid-tier pricing transparency",
      "toolA": "Only the Free plan has published, self-serve limits (100K API calls/month, 50GB bandwidth/month, no overages); Lite and Enterprise pricing requires contacting sales.",
      "toolB": "Publishes Growth at $15/seat/month for up to 50 seats, with only Enterprise left as a custom quote.",
      "whyItMatters": "Teams that need to budget or compare costs before a sales conversation can do so with Sanity but not with Contentful's paid tiers.",
      "benefitsWho": "Small-to-mid teams and procurement-sensitive buyers evaluating cost upfront."
    },
    {
      "title": "Platform breadth beyond content management",
      "toolA": "Bundles Personalization, AI Actions (workflow automation), Studio (visual experience assembly), Palmata (AI discovery/search visibility), and a Marketplace of apps/integrations.",
      "toolB": "Focuses on structured content: Sanity Studio, GROQ query language, real-time/listening APIs, Content Releases (scheduling), and the Content Agent for transforming/auditing content.",
      "whyItMatters": "Contentful adds marketing and AI-discovery tooling on top of the CMS layer; Sanity concentrates on the content backend and developer querying experience.",
      "benefitsWho": "Marketing/growth teams needing personalization and AI-search tooling (Contentful) versus developer-heavy teams building custom frontends (Sanity)."
    },
    {
      "title": "Free plan limits and dataset privacy",
      "toolA": "Free plan quota is 100K API calls/month and 50GB asset bandwidth/month, with no overages allowed.",
      "toolB": "Free plan includes 20 seats and 10k documents, but datasets are public only — private datasets require the paid Growth plan.",
      "whyItMatters": "Each free tier caps a different resource first: Contentful limits API/bandwidth usage, while Sanity limits dataset privacy rather than seats or documents.",
      "benefitsWho": "High-traffic sites need to watch Contentful's hard API/bandwidth caps; teams with any non-public content need to budget for Sanity's Growth plan sooner."
    },
    {
      "title": "Documented compliance certifications",
      "toolA": "No compliance certifications (SOC 2, GDPR, CCPA) are documented in the available facts.",
      "toolB": "States SOC 2, GDPR, and CCPA compliance explicitly.",
      "whyItMatters": "Buyers with compliance checklists may need to request documentation separately from Contentful, while Sanity states this upfront.",
      "benefitsWho": "Regulated or enterprise buyers running vendor security reviews."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Content Features",
      "rows": [
        {
          "feature": "Structured/composable content modeling",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Visual editing/assembly interface",
          "toolA": "available",
          "toolB": "available",
          "note": "Contentful's Studio assembles experiences visually; Sanity Studio is a customizable multiplayer editor."
        },
        {
          "feature": "Real-time / multiplayer editing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom query language (e.g. GROQ)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published self-serve pricing above Free",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Contentful's Lite/Enterprise tiers require contacting sales; Sanity publishes Growth at $15/seat/month."
        },
        {
          "feature": "Private datasets on free plan",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Sanity's free datasets are public only; private requires Growth."
        }
      ]
    },
    {
      "group": "AI & Compliance",
      "rows": [
        {
          "feature": "AI-driven workflow automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Contentful's AI Actions vs. Sanity's Content Agent."
        },
        {
          "feature": "AI-search / GEO visibility tooling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Contentful's Palmata is aimed at AI discovery/search visibility."
        },
        {
          "feature": "SOC 2 / GDPR / CCPA compliance stated",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Contentful have a free plan?",
      "answer": "Yes, a Free plan is available with a Starter Space and published usage limits, including 100K API calls/month and 50GB asset bandwidth/month with no overages."
    },
    {
      "question": "Is Contentful's paid-tier pricing public?",
      "answer": "No, only the Free plan has published self-serve limits; Lite and Enterprise plans require contacting sales."
    },
    {
      "question": "Does Sanity have a free plan?",
      "answer": "Yes, the Free plan includes 20 seats, 2 public datasets, 10k documents, and 100GB of assets and bandwidth."
    },
    {
      "question": "How is Sanity's paid pricing structured?",
      "answer": "Free, then Growth at $15/seat/month for up to 50 seats, or custom Enterprise pricing."
    },
    {
      "question": "What is Palmata?",
      "answer": "Contentful's newer product focused on understanding and improving how an organization is represented in AI discovery and search."
    },
    {
      "question": "What is GROQ?",
      "answer": "Sanity's custom query language for retrieving structured content from the platform."
    }
  ]
};

export default contentfulVsSanityContent;

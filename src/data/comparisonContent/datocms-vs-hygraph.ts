import type { ToolComparisonContent } from './types';

const datocmsVsHygraphContent: ToolComparisonContent = {
  "verdict": "DatoCMS and Hygraph are both GraphQL-oriented headless CMSs, but they're built for different jobs. DatoCMS emphasizes a free-forever entry point, a large plugin ecosystem (200+), and a Structured Text editor for complex content, with no documented compliance certifications in the facts. Hygraph is built around content federation — combining multiple data sources into one GraphQL layer — and documents SOC 2, ISO 27001, and GDPR compliance plus an MCP Server API for AI assistants, but its paid Growth tier jumps straight to $199/month from a capped free Hobby plan with no mid-tier shown.",
  "bestForToolA": "Teams wanting a free-forever entry point with granular usage limits, a large plugin ecosystem (200+ plugins) and active developer community, and a Structured Text editor for complex multi-format content.",
  "bestForToolB": "Teams that need to federate multiple content or data sources into a single GraphQL API, require SOC 2/ISO 27001/GDPR compliance out of the box, or want AI assistants connecting through a dedicated MCP Server API.",
  "whoNeedsBoth": "Organizations running a multi-brand or multi-source content architecture might use Hygraph as a federation layer aggregating several backends, while individual content teams keep authoring in DatoCMS for its plugin ecosystem and Structured Text editor.",
  "keyDifferences": [
    {
      "title": "Content federation across sources",
      "toolA": "No content federation feature is documented; its GraphQL Content Delivery API serves its own content, alongside a REST Content Management API.",
      "toolB": "Content federation is a named feature — a GraphQL-native architecture that combines multiple data sources without duplication.",
      "whyItMatters": "Hygraph is built to aggregate several content/data sources into one API layer; DatoCMS's GraphQL API is scoped to its own managed content.",
      "benefitsWho": "Teams with content spread across multiple systems needing a unified GraphQL layer (Hygraph)."
    },
    {
      "title": "Entry paid-tier jump",
      "toolA": "Free plan (300 records, 10GB traffic/month, 100k API calls/month) steps up to a €149/month ($199/month equivalent-priced, billed annually) Professional plan.",
      "toolB": "Free Hobby plan (1,000 entries, 500,000 API calls/month) jumps straight to a $199/month Growth plan, with cons explicitly noting no mid-tier option is shown.",
      "whyItMatters": "Both have a documented gap between free and paid, but Hygraph's cons explicitly flag the jump as a gap, while DatoCMS's Professional tier includes more granular usage add-ons.",
      "benefitsWho": "Growing teams trying to size which plan fits before committing to a higher-cost tier."
    },
    {
      "title": "Documented compliance certifications",
      "toolA": "No SOC 2, ISO 27001, or GDPR statements are documented in the facts.",
      "toolB": "States SOC 2 Type 2 (since 2022), ISO 27001, GDPR, and German data-protection (BDSG/TMG) compliance.",
      "whyItMatters": "Buyers with compliance checklists have documented answers from Hygraph but would need to request them separately from DatoCMS.",
      "benefitsWho": "Regulated industries and enterprise security reviewers."
    },
    {
      "title": "Plugin ecosystem and community",
      "toolA": "Has a marketplace of 200+ plugins and an active Slack developer community of 3,000+ members.",
      "toolB": "No plugin marketplace or community size is documented.",
      "whyItMatters": "DatoCMS offers a larger documented pool of ready-made extensions and community support channels.",
      "benefitsWho": "Teams wanting to extend the CMS without custom development, or needing peer support."
    },
    {
      "title": "AI assistant connectivity",
      "toolA": "No MCP or AI assistant integration is documented.",
      "toolB": "Includes an MCP Server API specifically for connecting AI assistants to Hygraph content.",
      "whyItMatters": "Hygraph documents a direct path for AI agents to read/act on content; DatoCMS does not document an equivalent.",
      "benefitsWho": "Teams building AI-agent workflows on top of their CMS content."
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture & Content",
      "rows": [
        {
          "feature": "GraphQL-native API",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Content federation across multiple sources",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Structured/rich text editor",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "DatoCMS's Structured Text editor."
        },
        {
          "feature": "Built-in localization",
          "toolA": "available",
          "toolB": "available",
          "note": "DatoCMS: 5 locales on Free and Professional. Hygraph: 2 locales Hobby, up to 80 Enterprise."
        },
        {
          "feature": "Plugin/extension marketplace",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "DatoCMS lists 200+ plugins."
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
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "€149/month (DatoCMS Professional) vs $199/month (Hygraph Growth)."
        },
        {
          "feature": "Mid-tier option between free and enterprise",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Neither documents a plan between its entry paid tier and custom Enterprise pricing."
        }
      ]
    },
    {
      "group": "Security, Compliance & AI",
      "rows": [
        {
          "feature": "SOC 2 certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Hygraph: Type 2, since 2022."
        },
        {
          "feature": "ISO 27001 certification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO / granular RBAC",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Hygraph offers OIDC/LDAP/SAML SSO on Growth/Enterprise."
        },
        {
          "feature": "MCP Server API for AI assistants",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is DatoCMS free?",
      "answer": "Yes, there is a free-forever plan with 2 editors, 300 records, and 100k API calls/month, with no credit card required."
    },
    {
      "question": "How much is DatoCMS's paid plan?",
      "answer": "The Professional plan starts at €149/month billed annually, or €199/month billed monthly."
    },
    {
      "question": "Does DatoCMS support multiple languages?",
      "answer": "Yes, localization is built in, with 5 locales included on both the Free and Professional plans."
    },
    {
      "question": "Is Hygraph free?",
      "answer": "Yes, the Hobby plan is free forever, with 3 seats and unlimited asset storage up to certain usage limits."
    },
    {
      "question": "Does Hygraph support content federation?",
      "answer": "Yes, its GraphQL-native architecture can combine multiple data sources without duplicating data."
    },
    {
      "question": "Can AI assistants connect to Hygraph?",
      "answer": "Yes, via the MCP Server API designed for AI assistant integration."
    }
  ]
};

export default datocmsVsHygraphContent;

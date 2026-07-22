import type { ToolComparisonContent } from './types';

const castopodVsOptimizelyContent: ToolComparisonContent = {
  "verdict": "Castopod is a free, open-source podcast hosting platform built around Podcasting 2.0 open standards, requiring self-hosting; Optimizely is an enterprise digital experience platform bundling an Agentic CMS, built-in A/B testing, and AI-powered personalization, sold through a custom sales consultation. These tools serve fundamentally different jobs -- one hosts podcast media, the other manages and experiments on web and commerce experiences -- so this is less a head-to-head and more a category mismatch.",
  "bestForToolA": "Castopod fits podcasters and organizations that want to self-host podcast media on open, auditable, Podcasting 2.0-compliant infrastructure without recurring SaaS hosting fees.",
  "bestForToolB": "Optimizely fits enterprise marketing teams that need a combined CMS, experimentation engine, and AI-driven personalization or commerce platform, and are prepared to go through a sales consultation for custom pricing.",
  "whoNeedsBoth": "A media company could run its podcast on self-hosted Castopod while using Optimizely's CMS and experimentation tools to manage and A/B test the website and article pages that promote those podcast episodes.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Castopod is a dedicated podcast hosting and publishing platform built on Podcasting 2.0 open standards.",
      "toolB": "Optimizely is a digital experience platform combining an \"Agentic CMS,\" built-in A/B testing experimentation, and personalization/commerce tools.",
      "whyItMatters": "Buyers need to know upfront whether they are shopping for podcast infrastructure or a full digital experience platform, since the two aren't interchangeable.",
      "benefitsWho": "Buyers who might have been pointed at both tools by a generic \"publishing platform\" search."
    },
    {
      "title": "Hosting Model",
      "toolA": "Castopod has no official managed hosting from its team -- self-hosting is required, a documented con of the product.",
      "toolB": "Optimizely is sold as a managed enterprise product with no self-host option documented.",
      "whyItMatters": "This determines whether the buyer needs their own server and ops capacity or can rely on a vendor-managed service.",
      "benefitsWho": "Technical teams comfortable running their own infrastructure versus marketing teams wanting a fully managed enterprise service."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Castopod is free and open source with no cost at all.",
      "toolB": "Optimizely publishes no pricing tiers; every plan requires a sales consultation to be individually packaged.",
      "whyItMatters": "Budget-conscious buyers can rule Castopod in or out instantly, while Optimizely always requires a sales cycle.",
      "benefitsWho": "Small independent podcasters versus enterprise buyers with formal procurement processes."
    },
    {
      "title": "Experimentation & Personalization",
      "toolA": "Not documented -- no A/B testing or personalization features are listed for Castopod.",
      "toolB": "Optimizely includes built-in A/B testing with AI-assisted analysis and personalization/commerce features driven by unified customer data.",
      "whyItMatters": "Teams that need to run experiments on content or commerce experiences need this capability, which Castopod's documented feature set doesn't offer.",
      "benefitsWho": "Enterprise marketing and growth teams optimizing conversion on their website or storefront."
    },
    {
      "title": "Open Source vs Proprietary",
      "toolA": "Castopod's full source is openly licensed and publicly browsable.",
      "toolB": "No open-source option is documented for Optimizely.",
      "whyItMatters": "Auditability and vendor lock-in concerns differ sharply between a publicly browsable codebase and a closed proprietary platform.",
      "benefitsWho": "Developers and organizations that want code transparency and full control over their podcast infrastructure."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & Publishing",
      "rows": [
        {
          "feature": "Podcasting 2.0 support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "CMS / content management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Optimizely's Agentic CMS"
        },
        {
          "feature": "Paid subscriptions/memberships",
          "toolA": "not-documented",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Required for Castopod; no official managed hosting"
        },
        {
          "feature": "Managed/hosted service",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Open source code",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Experimentation & Personalization",
      "rows": [
        {
          "feature": "A/B testing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "AI-assisted analysis"
        },
        {
          "feature": "AI-assisted features",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Personalization/commerce",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Castopod and Optimizely be compared directly on price?",
      "answer": "Not really -- Castopod is free and open source, while Optimizely has no published pricing and requires a sales consultation to build a custom package."
    },
    {
      "question": "Does Castopod include experimentation or personalization tools like Optimizely?",
      "answer": "No, Castopod's documented features focus on Podcasting 2.0 hosting and open-source publishing; A/B testing and personalization are not part of its feature set."
    },
    {
      "question": "Do I need my own server to run Castopod?",
      "answer": "Yes, self-hosting is required since there is no official managed hosting option from the Castopod team."
    },
    {
      "question": "Is Optimizely open source?",
      "answer": "No, Optimizely is a proprietary paid digital experience platform with no open-source option documented, unlike Castopod's publicly browsable source code."
    },
    {
      "question": "Who is Optimizely built for?",
      "answer": "Enterprise marketing teams that need a combined CMS, experimentation, and AI-personalization platform, sold through a custom sales consultation."
    }
  ]
};

export default castopodVsOptimizelyContent;

import type { ToolComparisonContent } from './types';

const apolloIoVsZoominfoContent: ToolComparisonContent = {
  "verdict": "Apollo.io and ZoomInfo both provide B2B contact/company data with free entry tiers, but they emphasize different parts of the sales workflow: Apollo.io bundles data enrichment with built-in multichannel outreach automation and deal execution tools in one platform, while ZoomInfo centers on a large, publicly-traded data provider's core database with optional add-on modules (Chorus for conversation intelligence, Copilot for AI prospecting) layered on top. Both keep detailed paid pricing behind a sales quote, so the practical difference is workflow breadth versus data-provider scale and track record.",
  "bestForToolA": "Best for sales teams that want prospecting, multichannel outbound sequencing, inbound lead routing, and deal execution (call summaries, pipeline boards) natively in one platform, with a free-forever Starter plan after the trial.",
  "bestForToolB": "Best for teams that primarily need a large, established, publicly verified B2B contact/company database with optional add-on modules for conversation intelligence (Chorus) or AI prospecting (Copilot), from a company with a disclosed 2007 founding and public-market status.",
  "whoNeedsBoth": "Revenue teams sometimes run ZoomInfo as the system of record for verified contact/company data while using Apollo.io's built-in sequencing and deal-execution workflow tools for day-to-day outbound execution, since the two facts sets emphasize different strengths (data provenance vs. workflow automation).",
  "keyDifferences": [
    {
      "title": "Contact database size",
      "toolA": "Apollo.io states access to 230M+ contacts and 30M+ company profiles with verified contact information.",
      "toolB": "ZoomInfo's facts describe a comprehensive contact & company database with real-time data verification and advanced filtering, without a specific contact/company count disclosed.",
      "whyItMatters": "A documented contact count gives buyers a concrete sense of database breadth before committing.",
      "benefitsWho": "Teams comparing raw data scale across vendors benefit from Apollo.io's disclosed contact/company figures."
    },
    {
      "title": "Built-in outbound and deal execution",
      "toolA": "Apollo.io includes AI-powered multichannel outbound campaigns, workflow automation, and deal execution tools (AI call summaries, pipeline boards, conversation intelligence) natively.",
      "toolB": "ZoomInfo's Chorus (conversation intelligence) and Copilot (AI prospecting) are described as separate add-on modules rather than native core features.",
      "whyItMatters": "Native workflow tools versus paid add-ons affects both cost and how tightly integrated the outbound/deal-execution experience feels.",
      "benefitsWho": "Sales teams wanting an all-in-one outbound and deal workflow without purchasing separate add-on modules."
    },
    {
      "title": "Company transparency and history",
      "toolA": "Apollo.io's founding year and headquarters are not disclosed in the facts provided.",
      "toolB": "ZoomInfo discloses a 2007 founding year (originally as DiscoverOrg, rebranded after acquiring Zoom Information, Inc. in 2019), headquarters in Vancouver, Washington, and public-market status on Nasdaq under ticker GTM.",
      "whyItMatters": "Disclosed company history and public-market status give buyers independently verifiable information about vendor stability.",
      "benefitsWho": "Procurement teams doing vendor due diligence that weighs disclosed corporate history and public financial reporting."
    },
    {
      "title": "Free tier structure",
      "toolA": "Apollo.io offers a free-forever Starter plan available after the trial.",
      "toolB": "ZoomInfo Lite is a permanent free tier limited to 10 monthly credits (25 with Community Edition), with no credit card required.",
      "whyItMatters": "A credit-limited free tier (ZoomInfo Lite) suits light, occasional lookups, while a free-forever plan without a stated credit cap (Apollo.io Starter) may support more regular light usage.",
      "benefitsWho": "Individual users or very small teams evaluating which free tier better matches their expected usage volume."
    },
    {
      "title": "Compliance certifications documented",
      "toolA": "Apollo.io lists SOC 2, GDPR, ISO/IEC 27001, and CCPA certifications.",
      "toolB": "ZoomInfo states it is GDPR and CCPA compliant, without listing SOC 2 or ISO/IEC 27001 in the facts provided.",
      "whyItMatters": "The specific certifications disclosed can matter for security questionnaires during vendor onboarding.",
      "benefitsWho": "Security and compliance reviewers comparing documented certifications during procurement."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data & Enrichment",
      "rows": [
        {
          "feature": "Contact/company database",
          "toolA": "available",
          "toolB": "available",
          "note": "Apollo.io: 230M+ contacts, 30M+ companies (disclosed). ZoomInfo: scale not numerically disclosed in facts."
        },
        {
          "feature": "Buying-intent signals",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Anonymous website visitor identification",
          "toolA": "available",
          "toolB": "available",
          "note": "Apollo.io: inbound lead management. ZoomInfo: WebSights."
        },
        {
          "feature": "Real-time form enrichment",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Outreach & Deal Execution",
      "rows": [
        {
          "feature": "Multichannel outbound automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Conversation intelligence (call analysis)",
          "toolA": "available",
          "toolB": "available",
          "note": "Apollo.io: native deal execution feature. ZoomInfo: Chorus, a separate add-on."
        },
        {
          "feature": "AI prospecting assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ZoomInfo Copilot, an add-on module."
        },
        {
          "feature": "CRM sync (Salesforce, HubSpot)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Company & Access",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Apollo.io: free-forever Starter plan. ZoomInfo: Lite tier, 10 monthly credits (25 with Community Edition)."
        },
        {
          "feature": "Published paid pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Founding year / headquarters disclosed",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "ZoomInfo: founded 2007, Vancouver, Washington."
        },
        {
          "feature": "Publicly traded",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ZoomInfo: Nasdaq ticker GTM."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How big is each platform's contact database?",
      "answer": "Apollo.io states access to 230M+ contacts and 30M+ company profiles. ZoomInfo describes a comprehensive, real-time-verified database without disclosing a specific contact count in the facts available."
    },
    {
      "question": "Does either tool have a free plan?",
      "answer": "Yes, both. Apollo.io offers a free-forever Starter plan after the trial. ZoomInfo Lite is a permanent free tier limited to 10 monthly credits (25 with Community Edition), with no credit card required."
    },
    {
      "question": "Are Chorus and Copilot included in ZoomInfo's core plan?",
      "answer": "No — Chorus (conversation intelligence) and Copilot (AI prospecting assistant) are described as separate add-on modules rather than native core features."
    },
    {
      "question": "When was ZoomInfo founded and is it publicly traded?",
      "answer": "ZoomInfo was founded in 2007 (originally as DiscoverOrg, rebranded after acquiring Zoom Information, Inc. in 2019) and trades publicly on Nasdaq under ticker GTM."
    },
    {
      "question": "What compliance certifications does each platform have?",
      "answer": "Apollo.io lists SOC 2, GDPR, ISO/IEC 27001, and CCPA. ZoomInfo states GDPR and CCPA compliance; SOC 2 and ISO/IEC 27001 aren't listed in the facts available for ZoomInfo."
    },
    {
      "question": "Does Apollo.io include outbound sequencing tools natively?",
      "answer": "Yes — Apollo.io includes AI-powered multichannel outbound campaigns and workflow automation as native features, rather than as separate add-ons."
    }
  ]
};

export default apolloIoVsZoominfoContent;

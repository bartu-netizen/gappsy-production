import type { ToolComparisonContent } from './types';

const hunterVsSnovIoContent: ToolComparisonContent = {
  "verdict": "Hunter and Snov.io are both freemium email-finding and verification platforms with a persistent free tier, but Hunter is the more disclosed company — founded in 2015 by named founders — focused tightly on domain search, email finding/verification, and sequences, with an AI writer above the free tier. Snov.io packages a wider feature set, including LinkedIn integration, a built-in Sales CRM, and 8 interface languages, with broader stated integration reach (1,000+ tools), but doesn't disclose its founding year.",
  "bestForToolA": "Teams that want a company with a disclosed founding history (2015) and a focused toolset — Domain Search, Email Finder, Email Verifier, and Sequences — plus an AI Writing Assistant once they move past the free tier.",
  "bestForToolB": "Teams that want LinkedIn-integrated multichannel outreach plus a built-in CRM and multi-language interface (8 languages) in the same platform, or that need documented integration breadth (1,000+ tools via API).",
  "whoNeedsBoth": "A lean team could use Hunter's Domain Search and Email Verifier for initial contact discovery and verification, then run multichannel email-plus-LinkedIn sequences and pipeline tracking inside Snov.io's built-in CRM, since Hunter doesn't document a CRM or LinkedIn integration of its own.",
  "keyDifferences": [
    {
      "title": "Founding year disclosure",
      "toolA": "Founded in 2015 by Antoine Finkelstein and François Grante, explicitly stated.",
      "toolB": "Not disclosed in the facts.",
      "whyItMatters": "A disclosed founding history and named founders can build buyer confidence in company stability.",
      "benefitsWho": "Buyers doing vendor-risk diligence on a long-term data provider."
    },
    {
      "title": "Built-in CRM",
      "toolA": "Not documented; features focus on finding, verifying, and sequencing, without a stated pipeline/deal-tracking tool.",
      "toolB": "Includes a Sales CRM with built-in deal tracking and pipeline management.",
      "whyItMatters": "A built-in CRM can reduce the need for a separate pipeline tool for smaller teams.",
      "benefitsWho": "Small teams that don't already run a separate CRM."
    },
    {
      "title": "LinkedIn integration",
      "toolA": "Not documented among Hunter's listed features.",
      "toolB": "LinkedIn Integration with a browser extension and LinkedIn search for prospect identification.",
      "whyItMatters": "Native LinkedIn search extends prospecting beyond domain- and name-based email lookups.",
      "benefitsWho": "Teams that source prospects primarily through LinkedIn."
    },
    {
      "title": "Interface language support",
      "toolA": "Not documented in the facts.",
      "toolB": "Supports 8 interface languages, including English, Spanish, German, French, and Chinese.",
      "whyItMatters": "A localized interface matters for non-English-speaking teams adopting the tool.",
      "benefitsWho": "International teams operating outside English-speaking markets."
    },
    {
      "title": "AI Writing Assistant on the free tier",
      "toolA": "Included from the Starter plan upward; explicitly not available on the Free plan.",
      "toolB": "Not documented as a distinct AI writing feature in the facts.",
      "whyItMatters": "Knowing whether AI drafting requires a paid upgrade affects what free-tier users can actually do.",
      "benefitsWho": "Free-tier users deciding whether to upgrade for AI-assisted email writing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Plan & Core Tools",
      "rows": [
        {
          "feature": "Free plan credits",
          "toolA": "available",
          "toolB": "available",
          "note": "Hunter: 50 credits/mo, 1 connected email account; Snov.io: 50 credits, 100 recipients, renewable"
        },
        {
          "feature": "Email finder & verifier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Email sequences / outreach automation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI writing assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hunter: Starter plan and up, not on Free"
        },
        {
          "feature": "Built-in CRM / pipeline tracking",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Channels & Integrations",
      "rows": [
        {
          "feature": "LinkedIn integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Named third-party integrations at scale",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Snov.io: 1,000+ tools via API, plus HubSpot/Pipedrive/Salesforce/Zapier/Make"
        },
        {
          "feature": "Multi-language interface",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Snov.io: 8 languages"
        }
      ]
    },
    {
      "group": "Pricing & Company Info",
      "rows": [
        {
          "feature": "Founding year disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hunter: 2015"
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "not-documented",
          "toolB": "not-documented",
          "note": "Hunter describes itself as a distributed team"
        },
        {
          "feature": "Top disclosed paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "Hunter €299/mo (Scale) before custom Enterprise; Snov.io $738/mo (Ultra) before custom pricing"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "When was Hunter founded?",
      "answer": "Hunter was created by Antoine Finkelstein and François Grante in 2015."
    },
    {
      "question": "Does Hunter have a free plan?",
      "answer": "Yes, the Free plan includes 50 credits/month and 1 connected email account."
    },
    {
      "question": "Does Snov.io have a free plan?",
      "answer": "Yes, a renewable Trial plan offers 50 credits and 100 recipients per month."
    },
    {
      "question": "What languages does Snov.io support?",
      "answer": "English, Portuguese, Chinese (Simplified & Traditional), Ukrainian, Spanish, German, Polish, and French."
    },
    {
      "question": "Does Snov.io include a CRM?",
      "answer": "Yes, a built-in Sales CRM for deal tracking and pipeline management."
    },
    {
      "question": "Does Hunter offer an AI writing tool?",
      "answer": "Yes, an AI Writing Assistant is included from the Starter plan upward, though not on the Free plan."
    }
  ]
};

export default hunterVsSnovIoContent;

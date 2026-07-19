import type { GroupComparisonContent } from './types';

const bill4timeVsMycaseVsRocketMatterContent: GroupComparisonContent = {
  "verdict": "All three are cloud legal practice management platforms with trust accounting, time tracking, and billing at their core, making them close, direct competitors for small-to-midsize law firms. Bill4Time is the most affordable entry point and also serves non-legal professional-services firms, MyCase bundles the deepest AI-assisted document and case tools into its Pro tier, and Rocket Matter offers the most tiers and the most built-out top-end business accounting features, plus an optional CRM add-on. The right choice depends on whether a firm needs legal-specific trust accounting from day one versus a broader all-in-one AI-assisted suite.",
  "bestFor": {
    "bill4time": "Firms and other professional-services businesses, not just law firms, that want lower-cost matter-based time tracking and can add trust accounting only if needed via the Legal Pro tier.",
    "mycase": "Small and mid-sized law firms wanting an all-in-one suite with strong AI-assisted document and case tools plus 70+ integrations bundled into the Pro tier.",
    "rocket-matter": "Firms that want the most granular tier ladder, from basic billing up to Elite-tier full business accounting with bank feeds, plus an optional add-on CRM."
  },
  "highlights": [
    {
      "title": "Bill4Time is the only one built for non-legal professional-services firms too",
      "description": "Bill4Time markets itself to consultants and accountants as well as law firms, unlike MyCase and Rocket Matter which are legal-specific.",
      "toolSlugs": [
        "bill4time"
      ]
    },
    {
      "title": "MyCase bundles the most AI tooling",
      "description": "MyCase's Pro and Advanced tiers include an 8am IQ AI writing and case assistant plus OCR-based discovery review, more AI depth than the other two disclose.",
      "toolSlugs": [
        "mycase"
      ]
    },
    {
      "title": "Rocket Matter has the deepest tier ladder and an optional CRM",
      "description": "Rocket Matter spans four tiers up to Elite, which adds automatic bank feeds and financial compliance reporting, and offers a separate paid CRM add-on.",
      "toolSlugs": [
        "rocket-matter"
      ]
    },
    {
      "title": "Trust accounting is not universal at the entry tier",
      "description": "Bill4Time gates trust accounting behind its Legal Pro tier, MyCase includes it starting on Basic, and Rocket Matter reserves full business accounting and bank feeds for its top Elite tier.",
      "toolSlugs": [
        "bill4time",
        "mycase",
        "rocket-matter"
      ]
    },
    {
      "title": "All three offer a client-facing portal",
      "description": "Each provides a client portal for case or matter visibility, though MyCase's online payments are LawPay-powered given its shared ownership with LawPay under AffiniPay's 8am brand.",
      "toolSlugs": [
        "bill4time",
        "mycase",
        "rocket-matter"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Trust Accounting and Compliance",
      "rows": [
        {
          "feature": "Trust (IOLTA) accounting included at entry tier",
          "statuses": {
            "bill4time": "unavailable",
            "mycase": "available",
            "rocket-matter": "unavailable"
          },
          "note": "Bill4Time requires the Legal Pro tier and Rocket Matter requires the top Elite tier; MyCase includes it starting on Basic."
        },
        {
          "feature": "LEDES e-billing export",
          "statuses": {
            "bill4time": "available",
            "mycase": "not-documented",
            "rocket-matter": "not-documented"
          }
        },
        {
          "feature": "Conflict checker",
          "statuses": {
            "bill4time": "available",
            "mycase": "available",
            "rocket-matter": "not-documented"
          },
          "note": "Bill4Time offers it on Legal Pro/Enterprise; MyCase offers conflict-check tracking on its Advanced tier."
        }
      ]
    },
    {
      "group": "Billing and Client Communication",
      "rows": [
        {
          "feature": "Client portal",
          "statuses": {
            "bill4time": "available",
            "mycase": "available",
            "rocket-matter": "available"
          }
        },
        {
          "feature": "Embedded online payment collection",
          "statuses": {
            "bill4time": "available",
            "mycase": "available",
            "rocket-matter": "not-documented"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted writing or case tools",
          "statuses": {
            "bill4time": "not-documented",
            "mycase": "available",
            "rocket-matter": "not-documented"
          },
          "note": "MyCase's 8am IQ spans a writing assistant on Pro and a case assistant plus OCR discovery review on Advanced."
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Open API access",
          "statuses": {
            "bill4time": "not-documented",
            "mycase": "available",
            "rocket-matter": "not-documented"
          },
          "note": "MyCase includes open API access on its Advanced tier."
        },
        {
          "feature": "Native or add-on CRM functionality",
          "statuses": {
            "bill4time": "not-documented",
            "mycase": "not-documented",
            "rocket-matter": "limited"
          },
          "note": "Rocket Matter offers CRM only as a separate paid add-on with its own onboarding fee."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three includes trust accounting on its cheapest plan?",
      "answer": "MyCase includes IOLTA trust accounting starting on its entry-level Basic plan. Bill4Time reserves trust accounting for its Legal Pro tier, and Rocket Matter reserves full trust and business accounting for its top Elite tier."
    },
    {
      "question": "Can any of these tools be used outside of a law firm?",
      "answer": "Bill4Time is explicitly positioned for other professional-services businesses, such as consultants and accountants, in addition to law firms. MyCase and Rocket Matter are built specifically for legal practices."
    },
    {
      "question": "Which one has the most AI-assisted features?",
      "answer": "MyCase's Pro and Advanced tiers include an AI writing assistant and AI case assistant, branded 8am IQ, plus OCR-based discovery review, more disclosed AI functionality than Bill4Time or Rocket Matter."
    },
    {
      "question": "Do any of these charge extra for a CRM?",
      "answer": "Rocket Matter offers an optional CRM module as a paid add-on, Core at $39/user/month or Enterprise at $147/month for up to three users, each with a separate $399 onboarding fee. Bill4Time and MyCase do not document a separate CRM add-on."
    },
    {
      "question": "Which tool is cheapest to start with?",
      "answer": "Bill4Time's Time and Billing plan starts at $39/user/month billed annually, the lowest published entry price among the three, though it does not include legal-specific trust accounting at that tier."
    },
    {
      "question": "Do these tools offer a free trial?",
      "answer": "Bill4Time offers a free trial and demo requiring no credit card. MyCase and Rocket Matter are also positioned with free-trial access, though specific trial terms for those two are not detailed beyond that."
    }
  ]
};

export default bill4timeVsMycaseVsRocketMatterContent;

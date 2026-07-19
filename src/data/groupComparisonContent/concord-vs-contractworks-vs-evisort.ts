import type { GroupComparisonContent } from './types';

const concordVsContractworksVsEvisortContent: GroupComparisonContent = {
  "verdict": "Concord, ContractWorks, and Evisort each take a different approach to contract management pricing and depth. ContractWorks, an Onit product, uses flat-rate, unlimited-user pricing from 600 dollars a month, which suits larger teams that want to avoid per-seat costs, while Concord charges per-tier from 499 dollars a month for a broader drafting and collaboration feature set. Evisort, now Workday Contract Intelligence after its 2024 acquisition, is the most AI-intelligence-focused of the three but offers no public self-serve pricing and is increasingly aimed at existing Workday customers rather than standalone CLM buyers.",
  "bestFor": {
    "concord": "SMB and mid-market legal teams that want an all-in-one drafting, real-time collaboration, and e-signature platform with unlimited free external guests.",
    "contractworks": "Larger teams that want flat-rate, unlimited-user pricing so contract management costs don't scale with headcount, plus built-in e-signatures and AI auto-tagging.",
    "evisort": "Large enterprises, especially existing or prospective Workday customers, that need deep AI-driven contract data extraction and analytics across legal, procurement, and finance."
  },
  "highlights": [
    {
      "title": "Flat-rate vs. tiered pricing",
      "description": "ContractWorks charges one flat rate for unlimited users starting at 600 dollars a month, while Concord uses tiered per-plan pricing from 499 dollars a month and Evisort offers custom enterprise quotes only.",
      "toolSlugs": [
        "contractworks",
        "concord",
        "evisort"
      ]
    },
    {
      "title": "Acquisition history",
      "description": "Both ContractWorks, now part of Onit, and Evisort, now part of Workday, have been folded into larger parent platforms, while Concord remains an independently operated CLM vendor.",
      "toolSlugs": [
        "contractworks",
        "evisort",
        "concord"
      ]
    },
    {
      "title": "AI depth and specialization",
      "description": "Evisort's AI extraction models, trained on a large proprietary contract dataset and backed by Workday's engineering scale, offer deeper document intelligence than the AI auto-tagging in ContractWorks or the AI copilot in Concord.",
      "toolSlugs": [
        "evisort",
        "contractworks",
        "concord"
      ]
    },
    {
      "title": "Mobile access",
      "description": "ContractWorks has no dedicated native mobile apps and is web-only, a limitation neither Concord's nor Evisort's documented feature sets share.",
      "toolSlugs": [
        "contractworks"
      ]
    },
    {
      "title": "Free counterparty access",
      "description": "Concord's unlimited free external viewers and guests mean counterparties never need a paid account, a specific advantage over ContractWorks' and Evisort's more enterprise-oriented access models.",
      "toolSlugs": [
        "concord"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CLM Workflow",
      "rows": [
        {
          "feature": "Contract drafting",
          "statuses": {
            "concord": "available",
            "contractworks": "not-documented",
            "evisort": "not-documented"
          }
        },
        {
          "feature": "E-signature",
          "statuses": {
            "concord": "available",
            "contractworks": "available",
            "evisort": "available"
          }
        },
        {
          "feature": "AI-assisted data extraction or auto-tagging",
          "statuses": {
            "concord": "available",
            "contractworks": "available",
            "evisort": "available"
          }
        },
        {
          "feature": "Approval workflow automation",
          "statuses": {
            "concord": "available",
            "contractworks": "not-documented",
            "evisort": "available"
          }
        }
      ]
    },
    {
      "group": "Access and Reporting",
      "rows": [
        {
          "feature": "Renewal and obligation tracking",
          "statuses": {
            "concord": "available",
            "contractworks": "available",
            "evisort": "available"
          }
        },
        {
          "feature": "Native mobile apps",
          "statuses": {
            "concord": "not-documented",
            "contractworks": "unavailable",
            "evisort": "not-documented"
          }
        },
        {
          "feature": "Customizable reporting dashboards",
          "statuses": {
            "concord": "not-documented",
            "contractworks": "available",
            "evisort": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Flat-rate unlimited-user pricing",
          "statuses": {
            "concord": "unavailable",
            "contractworks": "available",
            "evisort": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the main difference between Concord, ContractWorks, and Evisort?",
      "answer": "Concord is a full drafting-and-collaboration CLM suite, ContractWorks focuses on flat-rate, unlimited-user contract storage and e-signature with AI auto-tagging, and Evisort is more focused on deep AI-driven contract data extraction and is now part of Workday."
    },
    {
      "question": "Which of these three has the simplest pricing for a large team?",
      "answer": "ContractWorks, since its flat-rate pricing starting at 600 dollars a month covers unlimited users, so cost doesn't increase as a team grows, unlike Concord's per-tier pricing."
    },
    {
      "question": "Is Evisort still sold as an independent product?",
      "answer": "Evisort now operates as Workday Contract Intelligence following Workday's 2024 acquisition, with pricing and roadmap increasingly bundled with Workday licensing rather than sold as a standalone CLM product."
    },
    {
      "question": "Does ContractWorks have a mobile app?",
      "answer": "No, ContractWorks does not offer dedicated native mobile apps and is accessed through the web only."
    },
    {
      "question": "Which tool is best for counterparties who don't want to pay for an account?",
      "answer": "Concord, which offers unlimited free external viewer and guest access so signers and counterparties never need a paid license."
    }
  ]
};

export default concordVsContractworksVsEvisortContent;

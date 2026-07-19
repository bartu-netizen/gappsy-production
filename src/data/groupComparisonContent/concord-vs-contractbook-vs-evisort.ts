import type { GroupComparisonContent } from './types';

const concordVsContractbookVsEvisortContent: GroupComparisonContent = {
  "verdict": "Concord, Contractbook, and Evisort are all contract lifecycle management platforms that combine drafting, e-signature, and AI-assisted contract intelligence, but they sit at different points on the price and specialization spectrum. Concord and Contractbook are mid-market CLM suites covering the full draft-to-renewal workflow, with Concord publishing flat tiered pricing from 499 dollars a month while Contractbook requires a sales conversation for its named tiers. Evisort is a deeper AI document-intelligence engine now folded into Workday's enterprise ecosystem following its 2024 acquisition, with no public self-serve pricing and a focus increasingly narrowing toward Workday customers.",
  "bestFor": {
    "concord": "SMB and mid-market legal teams that want an all-in-one drafting, collaboration, and e-signature platform with unlimited free external guest access and flat per-tier pricing.",
    "contractbook": "European and Nordic-based teams that want template-driven contract automation backed by Scrive's e-signature and digital identity infrastructure.",
    "evisort": "Large enterprises, especially existing or prospective Workday customers, that need deep AI-driven contract data extraction and analytics across legal, procurement, and finance."
  },
  "highlights": [
    {
      "title": "Pricing transparency",
      "description": "Concord publishes clear flat-tier pricing starting at 499 dollars a month, while Contractbook requires contacting sales for its named tiers and Evisort offers only custom enterprise quotes.",
      "toolSlugs": [
        "concord",
        "contractbook",
        "evisort"
      ]
    },
    {
      "title": "Acquisition and platform consolidation",
      "description": "Both Contractbook, acquired by Scrive, and Evisort, acquired by Workday, are now integrated into larger parent platforms, while Concord remains an independent standalone CLM vendor.",
      "toolSlugs": [
        "concord",
        "contractbook",
        "evisort"
      ]
    },
    {
      "title": "AI depth and specialization",
      "description": "Evisort's AI extraction models are trained on an unusually large proprietary contract dataset and now benefit from Workday's engineering scale, giving it deeper document intelligence than the AI copilot features in Concord or Contractbook.",
      "toolSlugs": [
        "evisort",
        "concord",
        "contractbook"
      ]
    },
    {
      "title": "Free counterparty access",
      "description": "Concord offers unlimited free external viewers and guests so counterparties never need a paid account, a specific advantage over platforms that gate signer access.",
      "toolSlugs": [
        "concord"
      ]
    },
    {
      "title": "European e-signature and digital ID strength",
      "description": "Contractbook stands out for Nordic and European digital identity and e-signature support inherited from Scrive, a narrower regional strength compared to Concord's or Evisort's broader positioning.",
      "toolSlugs": [
        "contractbook"
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
            "contractbook": "available",
            "evisort": "not-documented"
          }
        },
        {
          "feature": "E-signature",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "evisort": "available"
          }
        },
        {
          "feature": "AI-assisted contract data extraction",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "evisort": "available"
          }
        },
        {
          "feature": "Approval workflow automation",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "evisort": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration and Tracking",
      "rows": [
        {
          "feature": "Real-time collaborative editing",
          "statuses": {
            "concord": "available",
            "contractbook": "not-documented",
            "evisort": "not-documented"
          }
        },
        {
          "feature": "Renewal and obligation tracking",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "evisort": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Published starting price",
          "statuses": {
            "concord": "available",
            "contractbook": "limited",
            "evisort": "unavailable"
          },
          "note": "Concord publishes a 499 dollar per month starting price; Contractbook uses named tiers that require contacting sales; Evisort offers custom quotes only."
        },
        {
          "feature": "Free or unlimited external guest access",
          "statuses": {
            "concord": "available",
            "contractbook": "not-documented",
            "evisort": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the main difference between Concord, Contractbook, and Evisort?",
      "answer": "Concord and Contractbook are full-lifecycle CLM suites for drafting, collaborating on, and e-signing contracts, while Evisort is more focused on AI-driven contract data extraction and analytics and is increasingly positioned as part of Workday rather than a standalone CLM buy."
    },
    {
      "question": "Is Evisort still available as a standalone product?",
      "answer": "Evisort operates as Workday Contract Intelligence following Workday's 2024 acquisition, and its pricing and roadmap are increasingly bundled with Workday licensing rather than sold as an independent standalone product."
    },
    {
      "question": "Which of these three has the most transparent pricing?",
      "answer": "Concord, which publishes flat per-tier pricing starting at 499 dollars a month. Contractbook requires a sales conversation for its named tiers, and Evisort offers custom quotes only."
    },
    {
      "question": "Does Contractbook still operate independently?",
      "answer": "Contractbook is now part of Scrive following an acquisition, and it uses Scrive's e-signature and digital identity infrastructure while continuing to run its own CLM product."
    },
    {
      "question": "Which tool is best for counterparties who don't want to pay for an account?",
      "answer": "Concord, which offers unlimited free external viewer and guest access so signers and counterparties never need a paid license."
    }
  ]
};

export default concordVsContractbookVsEvisortContent;

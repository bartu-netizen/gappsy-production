import type { GroupComparisonContent } from './types';

const concordVsContractbookVsContractworksContent: GroupComparisonContent = {
  "verdict": "All three are genuine contract lifecycle management competitors covering drafting, e-signature, and renewal tracking, but they differ most on pricing model and regional strengths. Concord offers the clearest published per-tier pricing plus unlimited free external signers, Contractbook leans hardest into European and Nordic digital identity support, and ContractWorks is the only one with flat-rate, unlimited-user pricing. The right choice depends on how many people across your organization need contract visibility, your region, and how much you value pricing transparency versus a quote-based sales process.",
  "bestFor": {
    "concord": "SMB and mid-market teams that want transparent, published per-tier pricing, an AI Copilot for contract review, and unlimited free external signers without paying enterprise CLM prices.",
    "contractbook": "Businesses, especially in Europe and the Nordics, that need strong digital ID and e-signature support (BankID, NemID/MitID) alongside standard drafting-to-signature-to-repository workflows.",
    "contractworks": "Organizations that want many employees across departments, not just legal, to have contract visibility, since pricing is a flat monthly rate for unlimited users rather than per-seat billing."
  },
  "highlights": [
    {
      "title": "ContractWorks is the only flat-rate, unlimited-user option",
      "description": "ContractWorks charges one flat monthly rate starting around $600 that includes unlimited users and a dedicated account manager, while Concord and Contractbook both include a set number of users per tier and charge per additional seat.",
      "toolSlugs": [
        "contractworks"
      ]
    },
    {
      "title": "Concord publishes the most transparent pricing",
      "description": "Concord lists three clear tiers at $499, $899, and $1,299 per month with defined feature sets, whereas Contractbook's published plans mostly say to contact sales for current pricing following its 2025 acquisition by Scrive.",
      "toolSlugs": [
        "concord",
        "contractbook"
      ]
    },
    {
      "title": "Contractbook leads on Nordic and European digital identity",
      "description": "Following its acquisition by Scrive, Contractbook supports Nordic digital ID schemes such as BankID and NemID/MitID for e-signature, a capability not documented for Concord or ContractWorks.",
      "toolSlugs": [
        "contractbook"
      ]
    },
    {
      "title": "All three include AI-assisted contract review, at different depths",
      "description": "Concord has an AI Copilot for review and data extraction, Contractbook has an AI contract assistant plus data extraction, and ContractWorks has AI-driven extraction and auto-tagging on upload; none publishes independently verified accuracy figures in this data.",
      "toolSlugs": [
        "concord",
        "contractbook",
        "contractworks"
      ]
    },
    {
      "title": "Free trials are confirmed for two of the three",
      "description": "Concord and Contractbook both explicitly offer 14-day free trials with full feature access, while free trial terms for ContractWorks are not documented in available data.",
      "toolSlugs": [
        "concord",
        "contractbook"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Drafting and Collaboration",
      "rows": [
        {
          "feature": "Built-in contract drafting editor",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "contractworks": "limited"
          },
          "note": "ContractWorks focuses on storage, tagging, and e-signature rather than a dedicated drafting editor like Concord's Word/Google Docs-style editor or Contractbook's template library."
        },
        {
          "feature": "Real-time collaboration and redlining",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "contractworks": "not-documented"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted contract review or data extraction",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "contractworks": "available"
          }
        },
        {
          "feature": "Approval workflow automation",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "contractworks": "not-documented"
          },
          "note": "Available on Concord's Business/Enterprise tiers and Contractbook's Accelerate tier and above."
        }
      ]
    },
    {
      "group": "Signature and Tracking",
      "rows": [
        {
          "feature": "Built-in electronic signature",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "contractworks": "available"
          }
        },
        {
          "feature": "Unlimited free external signers/viewers",
          "statuses": {
            "concord": "available",
            "contractbook": "not-documented",
            "contractworks": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Pricing and API",
      "rows": [
        {
          "feature": "Flat-rate, unlimited-user pricing",
          "statuses": {
            "concord": "unavailable",
            "contractbook": "unavailable",
            "contractworks": "available"
          }
        },
        {
          "feature": "Open API access",
          "statuses": {
            "concord": "available",
            "contractbook": "available",
            "contractworks": "available"
          },
          "note": "Available on Concord's Enterprise tier, Contractbook's custom/enterprise tier, and ContractWorks following its Onit acquisition."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the most transparent published pricing?",
      "answer": "Concord, which lists three defined monthly tiers at $499, $899, and $1,299. Contractbook's plan pricing mostly requires contacting sales, and ContractWorks publishes only its entry price of around $600 per month."
    },
    {
      "question": "Is there an option that does not charge per user?",
      "answer": "Yes, ContractWorks uses flat-rate pricing that includes unlimited users for one monthly fee, unlike Concord and Contractbook, which include a set number of users per tier and bill per additional seat."
    },
    {
      "question": "Which tool is strongest for European or Nordic e-signature requirements?",
      "answer": "Contractbook, which supports Nordic digital ID schemes like BankID and NemID/MitID through its integration with Scrive, a capability not documented for Concord or ContractWorks."
    },
    {
      "question": "Do all three offer a free trial before purchase?",
      "answer": "Concord and Contractbook both explicitly offer 14-day free trials with full feature access. Free trial terms for ContractWorks are not documented in available data."
    },
    {
      "question": "Can external counterparties sign a contract without paying for their own seat?",
      "answer": "Concord explicitly guarantees unlimited free external viewers and guests on every plan. This is not documented as a feature for Contractbook or ContractWorks."
    },
    {
      "question": "Which one is easiest to scale to a large number of internal viewers, not just the legal team?",
      "answer": "ContractWorks, since its flat monthly rate covers unlimited users rather than charging per seat, which matters if many employees outside legal need contract visibility."
    }
  ]
};

export default concordVsContractbookVsContractworksContent;

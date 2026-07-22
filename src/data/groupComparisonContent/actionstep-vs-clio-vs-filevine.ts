import type { GroupComparisonContent } from './types';

const actionstepVsClioVsFilevineContent: GroupComparisonContent = {
  "verdict": "Actionstep, Clio, and Filevine are all cloud-based legal practice management platforms with trust accounting built in, but they differ sharply in pricing transparency and AI depth. Clio is the only one of the three with published, tiered self-serve pricing, making it the easiest to comparison-shop. Actionstep differentiates with a bundled North America legal accounting suite alongside practice management. Filevine goes furthest on AI, embedding its LOIS assistant across every matter rather than gating it to a single plan, and both Actionstep and Filevine require a sales conversation to get a quote.",
  "bestFor": {
    "actionstep": "Midsize firms that want practice management and full back-office legal accounting, including North America-specific accounting, bundled together.",
    "clio": "Firms of any size, from solo practitioners to larger teams, that want transparent tiered pricing and the largest legal practice-management ecosystem.",
    "filevine": "High-volume plaintiff-side firms and larger legal teams that want a firm-wide AI layer embedded across every matter rather than a single drafting feature."
  },
  "highlights": [
    {
      "title": "Only Publicly Priced Option",
      "description": "Clio publishes four tiered plans from $49 to $149 per user per month; Actionstep and Filevine both require a custom quote through a sales conversation.",
      "toolSlugs": [
        "clio"
      ]
    },
    {
      "title": "Firm-Wide AI Built on a Legal Knowledge Graph",
      "description": "Filevine's LOIS assistant is built on a knowledge graph of more than 40 million matters and can draft documents, summarize depositions, and surface insights across an entire firm rather than a single case file.",
      "toolSlugs": [
        "filevine"
      ]
    },
    {
      "title": "Bundled North America Legal Accounting",
      "description": "Actionstep offers a dedicated Legal Accounting module for North America firms, covering general ledger, bank reconciliation, and revenue recognition alongside practice management.",
      "toolSlugs": [
        "actionstep"
      ]
    },
    {
      "title": "Trust Accounting Compliance Across All Three",
      "description": "Actionstep, Clio, and Filevine each build trust or IOLTA accounting compliance into their platforms, a requirement most general practice management tools do not handle.",
      "toolSlugs": [
        "actionstep",
        "clio",
        "filevine"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Packaging",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "statuses": {
            "actionstep": "unavailable",
            "clio": "available",
            "filevine": "unavailable"
          },
          "note": "Actionstep and Filevine both require a custom quote through their sales teams."
        },
        {
          "feature": "Free trial",
          "statuses": {
            "actionstep": "not-documented",
            "clio": "not-documented",
            "filevine": "available"
          }
        }
      ]
    },
    {
      "group": "Core Practice Management",
      "rows": [
        {
          "feature": "Trust or IOLTA accounting",
          "statuses": {
            "actionstep": "available",
            "clio": "available",
            "filevine": "available"
          },
          "note": "Filevine supports trust accounting via its LawPay integration rather than a native module."
        },
        {
          "feature": "Document automation and assembly",
          "statuses": {
            "actionstep": "available",
            "clio": "available",
            "filevine": "available"
          }
        },
        {
          "feature": "Client intake tools",
          "statuses": {
            "actionstep": "available",
            "clio": "limited",
            "filevine": "available"
          },
          "note": "Clio's automated intake (Clio Grow) is bundled only into the top-tier Complete plan."
        },
        {
          "feature": "Native e-signature",
          "statuses": {
            "actionstep": "not-documented",
            "clio": "available",
            "filevine": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted drafting or automation",
          "statuses": {
            "actionstep": "limited",
            "clio": "limited",
            "filevine": "available"
          },
          "note": "Actionstep offers AI-assisted time capture and document filing; Clio's AI drafting is limited to the top-tier Complete plan; Filevine's LOIS is embedded platform-wide."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Actionstep, Clio, and Filevine has published pricing?",
      "answer": "Only Clio publishes self-serve tiered pricing, from $49 per user per month (EasyStart) up to $149 per user per month (Complete). Actionstep and Filevine both require a sales conversation for a custom quote."
    },
    {
      "question": "What is LOIS and how is it different from Clio's or Actionstep's AI features?",
      "answer": "LOIS is Filevine's AI layer, built on a legal knowledge graph drawn from more than 40 million matters, and it works across an entire firm's matters rather than a single task. Clio's AI drafting is reserved for its top Complete plan, and Actionstep's AI features are described as AI-assisted time capture and document filing rather than a firm-wide reasoning layer."
    },
    {
      "question": "Do all three support trust or IOLTA accounting?",
      "answer": "Yes. Actionstep and Clio both build trust accounting directly into their billing modules, and Filevine supports trust accounting through its native LawPay integration."
    },
    {
      "question": "Which tool is built specifically for high-volume plaintiff-side practices like personal injury?",
      "answer": "Filevine has built particularly deep functionality for personal injury, mass torts, family law, and other high-volume plaintiff-side practice areas, alongside general practice management and government legal use cases."
    },
    {
      "question": "Is there a free trial for any of these platforms?",
      "answer": "Filevine offers a free trial before purchase. Trial availability for Actionstep and Clio is not documented in the available pricing data, so it's worth confirming directly with each vendor."
    }
  ]
};

export default actionstepVsClioVsFilevineContent;

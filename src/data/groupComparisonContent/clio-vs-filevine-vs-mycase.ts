import type { GroupComparisonContent } from './types';

const clioVsFilevineVsMycaseContent: GroupComparisonContent = {
  "verdict": "Clio, Filevine, and MyCase are all cloud legal practice management platforms, but they diverge sharply on pricing transparency and AI depth. Clio and MyCase both publish clear per-user tiers and build IOLTA trust accounting directly into billing, making them easy to comparison-shop for solo and small-to-midsize firms. Filevine skips self-serve pricing entirely in favor of a custom-quoted, module-based operating system anchored by LOIS, its firm-wide AI layer, which positions it toward larger firms, high-volume plaintiff practices, and legal teams willing to go through a sales process for deeper automation.",
  "bestFor": {
    "clio": "Solo attorneys and growing multi-practice firms that want transparent, published per-user pricing, built-in trust accounting, and a large, proven integration ecosystem.",
    "filevine": "Larger firms, high-volume plaintiff-side practices, and legal or government teams that want a firm-wide AI operating system (LOIS) across intake, matters, depositions, and signatures, and are comfortable with custom quote-based pricing.",
    "mycase": "Small-to-midsize firms that want a built-in client portal, texting, and LawPay-powered online payments alongside standard practice management at a mid-range price point."
  },
  "highlights": [
    {
      "title": "Only Clio and MyCase build trust accounting directly into billing",
      "description": "Clio and MyCase both include jurisdiction-aware IOLTA/trust accounting as a native part of their billing module, while Filevine handles trust accounting reconciliation through integrations with QuickBooks Online, Xero, and LawPay rather than a built-in module.",
      "toolSlugs": [
        "clio",
        "mycase",
        "filevine"
      ]
    },
    {
      "title": "Filevine's LOIS works across the entire firm, not one document at a time",
      "description": "LOIS is built on a legal knowledge graph drawn from more than 40 million matters and can read and write across Matters, Intake, Depositions, and Signatures simultaneously, a broader scope than Clio's Complete-tier AI drafting or MyCase's 8am IQ writing assistant.",
      "toolSlugs": [
        "filevine"
      ]
    },
    {
      "title": "Clio and MyCase publish self-serve pricing; Filevine does not",
      "description": "Clio's four tiers run $49 to $149 per user per month billed annually and MyCase's three tiers run $50 to $130 per user per month billed annually, while Filevine's pricing page directs every prospective buyer to a custom quote built around selected modules.",
      "toolSlugs": [
        "clio",
        "mycase",
        "filevine"
      ]
    },
    {
      "title": "AI features are gated behind the top tier at Clio and MyCase",
      "description": "Clio's AI drafting is only available on its Complete plan and MyCase's 8am IQ case assistant and OCR discovery review are limited to its Advanced plan, whereas Filevine bakes LOIS into its platform rather than reserving it for a single top tier.",
      "toolSlugs": [
        "clio",
        "mycase",
        "filevine"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Practice Management",
      "rows": [
        {
          "feature": "Case and matter management",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "mycase": "available"
          }
        },
        {
          "feature": "Secure client portal and messaging",
          "statuses": {
            "clio": "not-documented",
            "filevine": "not-documented",
            "mycase": "available"
          },
          "note": "MyCase explicitly documents a client portal with two-way messaging and texting; Clio and MyCase's competitors are not documented on this specific feature in the provided data."
        },
        {
          "feature": "Document templates and e-signature",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "mycase": "available"
          }
        }
      ]
    },
    {
      "group": "Billing and Trust Accounting",
      "rows": [
        {
          "feature": "Native IOLTA/trust accounting module",
          "statuses": {
            "clio": "available",
            "filevine": "limited",
            "mycase": "available"
          },
          "note": "Filevine supports trust accounting reconciliation via QuickBooks Online, Xero, and LawPay integrations rather than a native module."
        },
        {
          "feature": "Published self-serve pricing tiers",
          "statuses": {
            "clio": "available",
            "filevine": "unavailable",
            "mycase": "available"
          },
          "note": "Filevine is custom/quote-based with no published self-serve tiers."
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI drafting and case assistant",
          "statuses": {
            "clio": "limited",
            "filevine": "available",
            "mycase": "limited"
          },
          "note": "Clio's AI drafting is Complete-tier only; MyCase's 8am IQ is Pro/Advanced-tier only; Filevine's LOIS spans the whole platform."
        }
      ]
    },
    {
      "group": "Access and Integrations",
      "rows": [
        {
          "feature": "Open/documented REST API",
          "statuses": {
            "clio": "not-documented",
            "filevine": "available",
            "mycase": "limited"
          },
          "note": "MyCase's open API is limited to its Advanced plan; Filevine documents a public API Gateway."
        },
        {
          "feature": "Native iOS and Android apps",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "mycase": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three legal practice management tools has the most affordable published pricing?",
      "answer": "Clio's EasyStart plan starts at $49 per user per month and MyCase's Basic plan starts at $50 per user per month, both billed annually. Filevine does not publish self-serve pricing and requires a custom quote based on which modules a firm selects."
    },
    {
      "question": "What makes Filevine's AI different from Clio's or MyCase's AI features?",
      "answer": "Filevine's LOIS is built on a legal knowledge graph drawn from more than 40 million matters and can act across Matters, Intake, Depositions, and Signatures at once. Clio's AI drafting and MyCase's 8am IQ assistant are narrower tools reserved for each platform's top-priced tier."
    },
    {
      "question": "Do all three tools include built-in trust accounting?",
      "answer": "Clio and MyCase both build IOLTA/trust accounting directly into their billing module. Filevine handles trust accounting reconciliation through integrations with QuickBooks Online, Xero, and LawPay rather than a native trust accounting module."
    },
    {
      "question": "Which tool is best suited to high-volume plaintiff-side practices like personal injury or mass torts?",
      "answer": "Filevine has built particularly deep functionality for high-volume plaintiff-side practice areas including personal injury, mass torts, and family law, alongside serving government legal departments and large corporate legal teams."
    },
    {
      "question": "Can I try any of these platforms before committing to a contract?",
      "answer": "Yes. All three are tagged with free-trial availability, and Filevine's own pricing page explicitly offers a free trial period or demo booking before a firm commits to a custom quote."
    },
    {
      "question": "Which of the three has a dedicated client communication portal?",
      "answer": "MyCase explicitly documents a secure client portal supporting two-way messaging, document sharing, and texting. Clio and Filevine were not documented with this specific standalone client-portal feature in the available data, though Clio offers client intake through its companion Clio Grow product."
    }
  ]
};

export default clioVsFilevineVsMycaseContent;

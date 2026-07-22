import type { GroupComparisonContent } from './types';

const filevineVsMycaseVsPracticepantherContent: GroupComparisonContent = {
  "verdict": "Filevine, MyCase, and PracticePanther all offer case management, billing, and trust accounting with iOS and Android apps, but they differ in pricing transparency and how AI and communication features are packaged. MyCase and PracticePanther both publish clear tiered per-user pricing, while Filevine requires a custom quote built around selected modules. Filevine leads on AI depth with its firm-wide LOIS assistant, MyCase bundles its 8am IQ assistant starting at its Pro tier, and PracticePanther reserves its full trust and operating accounting suite for its top Business Pro plan.",
  "bestFor": {
    "filevine": "Large or high-volume plaintiff-side firms and legal teams wanting a firm-wide AI layer and custom packages built around specific modules.",
    "mycase": "Small to mid-sized firms wanting all-in-one billing, trust accounting, and an AI writing assistant at clear tiered pricing.",
    "practicepanther": "Solo attorneys and small firms wanting native e-signature, texting, and payments bundled in, with full trust accounting available on the top tier."
  },
  "highlights": [
    {
      "title": "Transparent Tiered Pricing",
      "description": "MyCase and PracticePanther both publish clear per-user monthly pricing across their tiers, while Filevine builds custom packages around selected modules and requires a sales conversation.",
      "toolSlugs": [
        "mycase",
        "practicepanther"
      ]
    },
    {
      "title": "Firm-Wide AI Knowledge Graph",
      "description": "Filevine's LOIS assistant draws on a legal knowledge graph of more than 40 million matters and can draft, summarize, and surface insights across an entire firm's caseload.",
      "toolSlugs": [
        "filevine"
      ]
    },
    {
      "title": "Native Communication and Payments Built In",
      "description": "MyCase and PracticePanther both include native two-way texting and online payment processing directly in the platform, reducing the need for third-party add-ons.",
      "toolSlugs": [
        "mycase",
        "practicepanther"
      ]
    },
    {
      "title": "AI Writing Assistant at the Mid Tier",
      "description": "MyCase's 8am IQ writing assistant becomes available starting at its Pro plan, with an expanded case assistant and OCR discovery review added at the Advanced tier.",
      "toolSlugs": [
        "mycase"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "statuses": {
            "filevine": "unavailable",
            "mycase": "available",
            "practicepanther": "available"
          }
        },
        {
          "feature": "Free trial",
          "statuses": {
            "filevine": "available",
            "mycase": "not-documented",
            "practicepanther": "available"
          },
          "note": "PracticePanther offers a 7-day free trial; Filevine offers a free trial before purchase."
        }
      ]
    },
    {
      "group": "Case and Billing",
      "rows": [
        {
          "feature": "Trust or IOLTA accounting",
          "statuses": {
            "filevine": "available",
            "mycase": "available",
            "practicepanther": "limited"
          },
          "note": "PracticePanther's full trust and operating accounting suite (PantherAccounting Plus) is limited to the Business Pro tier."
        },
        {
          "feature": "Native e-signature",
          "statuses": {
            "filevine": "available",
            "mycase": "limited",
            "practicepanther": "limited"
          },
          "note": "Unlimited e-signature is gated to MyCase Pro and above, and to PracticePanther Business and above."
        },
        {
          "feature": "Online payment processing",
          "statuses": {
            "filevine": "available",
            "mycase": "available",
            "practicepanther": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Communication",
      "rows": [
        {
          "feature": "AI writing or case assistant",
          "statuses": {
            "filevine": "available",
            "mycase": "limited",
            "practicepanther": "not-documented"
          },
          "note": "MyCase's 8am IQ assistant is available from the Pro tier upward."
        },
        {
          "feature": "Native two-way texting",
          "statuses": {
            "filevine": "not-documented",
            "mycase": "limited",
            "practicepanther": "limited"
          },
          "note": "Gated to MyCase Pro and above, and to PracticePanther Business and above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Filevine publish self-serve pricing like MyCase and PracticePanther?",
      "answer": "No. Filevine builds custom packages around the modules a firm selects and requires a sales conversation for a quote, while MyCase and PracticePanther both publish clear per-user monthly tiers."
    },
    {
      "question": "Which platform includes AI features at the lowest price point?",
      "answer": "Filevine's LOIS assistant is built into its packages from the start. MyCase's 8am IQ writing assistant requires stepping up to the Pro tier, and PracticePanther does not document a dedicated AI assistant feature in its plans."
    },
    {
      "question": "Which of the three includes trust accounting on its entry-level plan?",
      "answer": "MyCase includes trust accounting on its Basic tier. PracticePanther's full trust and operating accounting suite is reserved for its top Business Pro plan, and Filevine supports trust accounting through its LawPay integration."
    },
    {
      "question": "Do all three offer mobile apps?",
      "answer": "Yes. All three platforms support iOS and Android mobile access, letting attorneys and staff manage cases, documents, and billing away from their desks."
    },
    {
      "question": "Which is best suited to high-volume plaintiff-side practices?",
      "answer": "Filevine has built particularly deep functionality for personal injury, mass torts, and other high-volume plaintiff-side practice areas, while MyCase and PracticePanther are generally positioned toward solo and small firm practices across a broader range of specialties."
    },
    {
      "question": "What free trial options are available?",
      "answer": "PracticePanther offers a 7-day free trial and Filevine offers a free trial before purchase. Free trial availability for MyCase is not documented in the available pricing data."
    }
  ]
};

export default filevineVsMycaseVsPracticepantherContent;

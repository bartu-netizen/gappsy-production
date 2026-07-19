import type { GroupComparisonContent } from './types';

const clioVsFilevineVsPracticepantherContent: GroupComparisonContent = {
  "verdict": "Clio, Filevine, and PracticePanther are all legal practice management platforms with trust accounting, but they differ in pricing transparency and AI depth. Clio and PracticePanther both publish clear, per-user monthly pricing and target solo attorneys through mid-size firms, while Filevine is a quote-based, module-driven platform whose LOIS AI layer and heavy venture funding position it toward larger firms and high-volume plaintiff-side practices like personal injury and mass torts. Between the two transparently-priced options, Clio offers the broader integration ecosystem and adoption base, while PracticePanther differentiates with native two-way texting and ePayments built into every tier. Firms that want predictable, published pricing should start with Clio or PracticePanther; those evaluating a firm-wide AI operating system should get a Filevine quote.",
  "bestFor": {
    "clio": "Firms of any size that want the widest-adopted legal practice management platform with jurisdiction-aware trust accounting and a clear integration ecosystem.",
    "filevine": "Larger firms and high-volume practices, especially personal injury and mass torts, that want a firm-wide AI layer working across every matter.",
    "practicepanther": "Solo attorneys and small firms that want native two-way texting and ePayments built into every tier at a predictable per-user price."
  },
  "highlights": [
    {
      "title": "Filevine's LOIS works across every matter, not just one file",
      "description": "Built on a knowledge graph of more than 40 million matters, LOIS can draft, summarize, and surface insights firm-wide rather than in a single case.",
      "toolSlugs": [
        "filevine"
      ]
    },
    {
      "title": "Clio and PracticePanther both publish transparent per-user pricing",
      "description": "Both list clear monthly tiers ranging roughly from $49 to $149 per user, making it easy to estimate cost before a sales call.",
      "toolSlugs": [
        "clio",
        "practicepanther"
      ]
    },
    {
      "title": "PracticePanther bakes in native texting and payments",
      "description": "Two-way client texting and ePayments processing are included features rather than third-party add-ons, with texting unlocked on the Business tier.",
      "toolSlugs": [
        "practicepanther"
      ]
    },
    {
      "title": "Filevine is quote-based and built for larger, high-volume firms",
      "description": "Pricing is assembled from selected modules and confirmed only through a sales conversation, reflecting its focus on larger firms and complex caseloads.",
      "toolSlugs": [
        "filevine"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Platform Access",
      "rows": [
        {
          "feature": "Published, self-serve pricing",
          "statuses": {
            "clio": "available",
            "filevine": "unavailable",
            "practicepanther": "available"
          },
          "note": "Filevine requires a custom quote based on selected modules"
        },
        {
          "feature": "Open/REST API",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "practicepanther": "available"
          }
        },
        {
          "feature": "Native mobile apps (iOS/Android)",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "practicepanther": "available"
          }
        }
      ]
    },
    {
      "group": "Compliance and AI",
      "rows": [
        {
          "feature": "Trust/IOLTA accounting",
          "statuses": {
            "clio": "available",
            "filevine": "not-documented",
            "practicepanther": "available"
          },
          "note": "PracticePanther's full trust accounting requires the Business Pro tier"
        },
        {
          "feature": "Firm-wide AI assistant",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "practicepanther": "not-documented"
          },
          "note": "Clio's AI drafting is on its Complete tier; Filevine's LOIS spans every matter"
        }
      ]
    },
    {
      "group": "Client Communication",
      "rows": [
        {
          "feature": "Native e-signatures",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "practicepanther": "available"
          }
        },
        {
          "feature": "Native two-way texting",
          "statuses": {
            "clio": "not-documented",
            "filevine": "not-documented",
            "practicepanther": "available"
          },
          "note": "Available on PracticePanther's Business tier and above"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three legal platforms publishes clear, self-serve pricing?",
      "answer": "Clio and PracticePanther both list per-user monthly pricing tiers on their websites; Filevine does not publish pricing and requires a custom quote based on which product modules a firm selects."
    },
    {
      "question": "Which platform has the deepest AI capabilities?",
      "answer": "Filevine's LOIS is built as a firm-wide AI layer that can read and act across every matter using a knowledge graph of more than 40 million matters; Clio offers AI drafting on its top Complete tier, while PracticePanther does not document a comparable AI feature."
    },
    {
      "question": "Which tool includes native two-way texting with clients?",
      "answer": "PracticePanther, on its Business and Business Pro tiers; this is not a documented feature of Clio or Filevine."
    },
    {
      "question": "Is Filevine a good fit for a solo attorney?",
      "answer": "It can serve firms of any size, but Filevine's funding, module-based pricing, and deep focus on high-volume practices like personal injury and mass torts make it a heavier platform than a solo practitioner typically needs compared to Clio's EasyStart or PracticePanther's Solo tier."
    },
    {
      "question": "Do all three handle trust and IOLTA accounting?",
      "answer": "Clio and PracticePanther both document jurisdiction-aware trust accounting, with PracticePanther's requiring the Business Pro tier, while Filevine's trust accounting depth is not explicitly documented and instead relies on integrations like LawPay."
    }
  ]
};

export default clioVsFilevineVsPracticepantherContent;

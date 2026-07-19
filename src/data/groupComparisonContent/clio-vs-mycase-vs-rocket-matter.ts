import type { GroupComparisonContent } from './types';

const clioVsMycaseVsRocketMatterContent: GroupComparisonContent = {
  "verdict": "Clio, MyCase, and Rocket Matter are all cloud-based legal practice management platforms built around the same core workflow: matter management, time and billing, trust accounting, and a client portal. Clio has the widest adoption and the most fleshed-out AI drafting and client intake tooling on its top Complete tier, MyCase pairs solid practice management with the AffiniPay/8am payments ecosystem and its own 8am IQ AI assistant, and Rocket Matter leans on a long track record since 2008 plus included data migration and unlimited support. For most firms the decision comes down to which AI and intake features matter most relative to per-user price, since all three handle the compliance-critical basics well.",
  "bestFor": {
    "clio": "Firms of any size that want the broadest adoption, the deepest integration ecosystem, and AI drafting plus client intake automation bundled into a top-tier plan",
    "mycase": "Firms that want practice management bundled with the AffiniPay/8am payments ecosystem and an AI assistant available from the mid-tier Pro plan",
    "rocket-matter": "Firms that want a long-established platform with free data migration and unlimited support included on every plan, with a CRM add-on for firms that need lead tracking"
  },
  "highlights": [
    {
      "title": "AI and drafting tools are gated to higher tiers on every platform",
      "description": "Clio reserves AI drafting for its Complete tier, MyCase gates 8am IQ behind the Pro plan and above, and Rocket Matter does not document a comparable AI drafting feature at all, so firms that want AI assistance should compare Clio Complete against MyCase Pro directly.",
      "toolSlugs": [
        "clio",
        "mycase",
        "rocket-matter"
      ]
    },
    {
      "title": "Trust accounting compliance is a shared strength",
      "description": "All three platforms build jurisdiction-aware trust or IOLTA accounting directly into their billing modules, which is the baseline legal firms need and a key reason general project management tools are not a substitute.",
      "toolSlugs": [
        "clio",
        "mycase",
        "rocket-matter"
      ]
    },
    {
      "title": "Clio and MyCase extend into client intake and payments ecosystems",
      "description": "Clio's Complete tier bundles Clio Grow for lead management, while MyCase benefits from AffiniPay's LawPay payments heritage, giving both platforms adjacent tooling that Rocket Matter handles mainly through a separate paid CRM add-on.",
      "toolSlugs": [
        "clio",
        "mycase"
      ]
    },
    {
      "title": "Rocket Matter differentiates on included onboarding",
      "description": "Rocket Matter includes free data migration and unlimited support across every plan tier, reducing the switching cost for firms moving off spreadsheets or another platform.",
      "toolSlugs": [
        "rocket-matter"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Case and Client Management",
      "rows": [
        {
          "feature": "Matter and client management",
          "statuses": {
            "clio": "available",
            "mycase": "available",
            "rocket-matter": "available"
          }
        },
        {
          "feature": "Client portal",
          "statuses": {
            "clio": "available",
            "mycase": "available",
            "rocket-matter": "available"
          }
        },
        {
          "feature": "Mobile apps (iOS and Android)",
          "statuses": {
            "clio": "available",
            "mycase": "available",
            "rocket-matter": "available"
          }
        }
      ]
    },
    {
      "group": "Billing and Compliance",
      "rows": [
        {
          "feature": "Trust (IOLTA) accounting",
          "statuses": {
            "clio": "available",
            "mycase": "available",
            "rocket-matter": "available"
          }
        },
        {
          "feature": "Time tracking and billing",
          "statuses": {
            "clio": "available",
            "mycase": "available",
            "rocket-matter": "available"
          }
        }
      ]
    },
    {
      "group": "Advanced Features",
      "rows": [
        {
          "feature": "E-signatures",
          "statuses": {
            "clio": "available",
            "mycase": "available",
            "rocket-matter": "available"
          },
          "note": "Clio and MyCase offer unlimited e-signatures on their higher tiers"
        },
        {
          "feature": "AI drafting or assistant",
          "statuses": {
            "clio": "available",
            "mycase": "available",
            "rocket-matter": "not-documented"
          },
          "note": "Available on Clio Complete and MyCase Pro and above"
        },
        {
          "feature": "Client intake or CRM",
          "statuses": {
            "clio": "available",
            "mycase": "not-documented",
            "rocket-matter": "limited"
          },
          "note": "Clio bundles Clio Grow into Complete; Rocket Matter offers CRM as a paid add-on with an extra onboarding fee"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheapest to start with, Clio, MyCase, or Rocket Matter?",
      "answer": "Clio's EasyStart plan starts at $49 per user per month, which is the lowest entry price of the three, followed by MyCase Basic at around $50 per user per month and Rocket Matter Essentials at $59 per user per month, all billed annually."
    },
    {
      "question": "Do Clio, MyCase, and Rocket Matter all support trust accounting?",
      "answer": "Yes, all three platforms build jurisdiction-aware trust or IOLTA accounting directly into their billing modules, which is a baseline requirement for most law firms handling client funds."
    },
    {
      "question": "Which platform has the most AI features?",
      "answer": "Clio and MyCase both offer AI assistants, with Clio reserving AI drafting for its top Complete tier and MyCase offering its 8am IQ assistant from the Pro tier up; Rocket Matter does not document a comparable AI drafting feature."
    },
    {
      "question": "Is Rocket Matter a good fit for a solo attorney?",
      "answer": "Rocket Matter can work for solo attorneys on its Essentials plan, and it includes free data migration and unlimited support on every tier, though CRM and top-tier compliance features cost extra."
    },
    {
      "question": "Do all three offer mobile apps?",
      "answer": "Yes, Clio, MyCase, and Rocket Matter all provide iOS and Android mobile apps so attorneys can track time, review matters, and communicate with clients away from the office."
    },
    {
      "question": "Which is best for a firm that wants built-in client intake?",
      "answer": "Clio has the most integrated intake story through its companion Clio Grow product, bundled into the Complete tier, while MyCase and Rocket Matter rely more on separate portals or add-ons for lead management."
    }
  ]
};

export default clioVsMycaseVsRocketMatterContent;

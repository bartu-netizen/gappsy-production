import type { GroupComparisonContent } from './types';

const clioVsFilevineVsRocketMatterContent: GroupComparisonContent = {
  "verdict": "Clio and Rocket Matter compete most directly on transparent, per-user tiered pricing with trust accounting built into their billing modules, making them easy to comparison-shop for solo and small firms. Filevine plays a different game entirely, wrapping case management, intake, depositions, and signatures under a firm-wide AI layer (LOIS) and pricing everything custom per module, which suits larger or higher-volume practices willing to go through a sales process. There is no single winner: the right pick depends on whether a firm values price transparency and simplicity or the deepest available AI automation.",
  "bestFor": {
    "clio": "Firms that want the most widely adopted legal practice management platform with transparent per-tier pricing and built-in trust accounting compliance.",
    "filevine": "High-volume plaintiff-side firms, larger legal teams, and government legal departments that want a deeply embedded AI layer (LOIS) across intake, matters, depositions, and signatures.",
    "rocket-matter": "Solo attorneys and small firms that want Clio-like trust accounting and billing features at a similar price point with straightforward per-user tiers."
  },
  "highlights": [
    {
      "title": "Transparent tiers vs custom quotes",
      "description": "Clio and Rocket Matter both publish per-user monthly tiers ($49-149 and $59-145 respectively, billed annually), letting firms compare pricing without a sales call, while Filevine uses custom, quote-based pricing built around the modules a firm selects.",
      "toolSlugs": [
        "clio",
        "rocket-matter",
        "filevine"
      ]
    },
    {
      "title": "AI depth favors Filevine",
      "description": "Filevine's LOIS AI layer is built on a knowledge graph drawn from more than 40 million matters and can draft documents, summarize depositions, and act across an entire firm's caseload. Clio offers AI drafting only on its top Complete tier, and Rocket Matter has no dedicated AI drafting feature documented.",
      "toolSlugs": [
        "filevine",
        "clio",
        "rocket-matter"
      ]
    },
    {
      "title": "Trust accounting handled differently",
      "description": "Clio bakes jurisdiction-aware trust/IOLTA accounting into its billing module at every tier, Rocket Matter reserves full trust and financial compliance reporting for its top Elite tier, and Filevine supports trust accounting through its LawPay integration rather than a native module.",
      "toolSlugs": [
        "clio",
        "rocket-matter",
        "filevine"
      ]
    },
    {
      "title": "Filevine's scale and funding",
      "description": "Filevine is by far the best-capitalized of the three, having raised roughly $548 million and reaching an estimated $3 billion valuation, reflecting heavy investment in module breadth beyond core case management.",
      "toolSlugs": [
        "filevine"
      ]
    },
    {
      "title": "Clio's market reach",
      "description": "Clio reports serving more than 400,000 legal professionals across over 130 countries, the widest documented adoption of the three.",
      "toolSlugs": [
        "clio"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "statuses": {
            "clio": "available",
            "filevine": "unavailable",
            "rocket-matter": "available"
          },
          "note": "Filevine uses custom quote-based pricing built around selected modules."
        },
        {
          "feature": "Trust/IOLTA accounting",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "rocket-matter": "available"
          },
          "note": "Filevine supports trust accounting via its LawPay integration; Rocket Matter reserves full compliance reporting for its Elite tier."
        },
        {
          "feature": "E-signatures",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "rocket-matter": "available"
          },
          "note": "Clio offers unlimited e-signatures from Advanced up; Rocket Matter caps monthly e-signature counts by plan."
        }
      ]
    },
    {
      "group": "Case and Practice Management",
      "rows": [
        {
          "feature": "Matter and case management",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "rocket-matter": "available"
          }
        },
        {
          "feature": "Client intake / CRM",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "rocket-matter": "limited"
          },
          "note": "Clio bundles Clio Grow into its Complete tier and Filevine offers a dedicated Intake module; Rocket Matter requires a separate paid CRM add-on with its own onboarding fee."
        },
        {
          "feature": "Document management",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "rocket-matter": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Platform",
      "rows": [
        {
          "feature": "AI drafting or summarization",
          "statuses": {
            "clio": "available",
            "filevine": "available",
            "rocket-matter": "not-documented"
          },
          "note": "Clio's AI drafting is limited to its top Complete tier; Filevine's LOIS is core to the platform."
        },
        {
          "feature": "Open API for custom integrations",
          "statuses": {
            "clio": "not-documented",
            "filevine": "available",
            "rocket-matter": "not-documented"
          },
          "note": "Filevine publishes a documented REST API Gateway."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Clio, Filevine, and Rocket Matter has transparent public pricing?",
      "answer": "Clio and Rocket Matter both publish per-user monthly tiers ($49-149 and $59-145 respectively, billed annually), while Filevine uses custom quote-based pricing built around the modules a firm selects, so you'll need to talk to sales for a number."
    },
    {
      "question": "Which tool has the most advanced AI?",
      "answer": "Filevine's LOIS AI layer is the most deeply embedded, built on a knowledge graph of 40 million-plus matters and able to draft and act across a firm's caseload; Clio offers AI drafting only on its top Complete tier, and Rocket Matter has no dedicated AI drafting feature documented."
    },
    {
      "question": "Do all three handle trust accounting?",
      "answer": "Yes, but differently - Clio bundles jurisdiction-aware trust accounting into its billing module at every tier, Rocket Matter reserves full trust and financial compliance reporting for its top Elite tier, and Filevine supports trust accounting through its LawPay integration rather than a native module."
    },
    {
      "question": "Which is best for a solo attorney?",
      "answer": "Clio's EasyStart ($49/user/month) and Rocket Matter's Essentials ($59/user/month) are both built for solo practitioners with core billing and trust accounting; Filevine's module-based, quote-driven model is generally a heavier lift for solo practices."
    },
    {
      "question": "Which is built for high-volume plaintiff and government legal work?",
      "answer": "Filevine has built particularly deep functionality for personal injury, mass torts, and other high-volume plaintiff practices, plus government legal departments, citing customers like FedEx's legal department and public defender offices."
    },
    {
      "question": "Does client intake come standard?",
      "answer": "Clio bundles its Clio Grow intake tool into the Complete tier, Filevine offers an Intake module as part of its selectable package, while Rocket Matter treats CRM/intake as a separate paid add-on with its own onboarding fee."
    }
  ]
};

export default clioVsFilevineVsRocketMatterContent;

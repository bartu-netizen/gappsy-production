import type { GroupComparisonContent } from './types';

const basecampVsProofhubVsScoroContent: GroupComparisonContent = {
  "verdict": "Basecamp, ProofHub, and Scoro are all team collaboration and project management tools, but they optimize for different things. Basecamp and ProofHub both use flat-rate, unlimited-user pricing that rewards larger teams, while Scoro trades that flexibility for deeper professional-services features like invoicing and retainer management at a per-seat cost with a five-user minimum. The best choice depends on whether you need simple communication, agency-style proofing and views, or full project-to-invoice financial tracking.",
  "bestFor": {
    "basecamp": "Small teams and agencies who want a simple, calm, all-in-one communication and task hub with predictable flat-rate pricing and don't need Gantt charts, proofing, or billing tools.",
    "proofhub": "Marketing and creative agencies that need Kanban and Gantt-style views plus built-in proofing and approvals for client deliverables, all under flat-rate unlimited-user pricing.",
    "scoro": "Consultancies and agencies that need project management fused with quoting, invoicing, retainer management, and financial reporting in one platform, and don't mind per-seat pricing with a five-user minimum."
  },
  "highlights": [
    {
      "title": "Flat-rate vs. per-seat pricing",
      "description": "Basecamp's Pro Unlimited plan and both of ProofHub's plans charge one flat monthly fee for unlimited users, while Scoro charges per user per month with a minimum of five seats on every plan, making the economics diverge sharply as team size changes.",
      "toolSlugs": [
        "basecamp",
        "proofhub",
        "scoro"
      ]
    },
    {
      "title": "ProofHub's built-in proofing tool",
      "description": "ProofHub includes dedicated online proofing that lets teams review, mark up, and approve creative files like images and PDFs directly in the platform, a feature not documented for Basecamp or Scoro.",
      "toolSlugs": [
        "proofhub"
      ]
    },
    {
      "title": "Scoro is the only one built for project-to-invoice financial tracking",
      "description": "Scoro bundles quoting, invoicing, role-based labor costing, retainer management, and revenue forecasting directly into its project management core, functionality neither Basecamp nor ProofHub documents.",
      "toolSlugs": [
        "scoro"
      ]
    },
    {
      "title": "Basecamp's long track record",
      "description": "Basecamp has been sold since 1999 by 37signals, giving it the longest operating history of the three, versus ProofHub (founded 2012) and Scoro (founded 2013).",
      "toolSlugs": [
        "basecamp"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing Model",
      "rows": [
        {
          "feature": "No minimum seat requirement",
          "statuses": {
            "basecamp": "available",
            "proofhub": "available",
            "scoro": "unavailable"
          },
          "note": "Scoro requires a minimum of five user seats on every plan."
        },
        {
          "feature": "Flat-rate pricing option (not charged per user)",
          "statuses": {
            "basecamp": "available",
            "proofhub": "available",
            "scoro": "unavailable"
          },
          "note": "Basecamp's Pro Unlimited and both ProofHub plans are flat monthly fees; Scoro is priced per user across all four tiers."
        }
      ]
    },
    {
      "group": "Collaboration",
      "rows": [
        {
          "feature": "Built-in team chat",
          "statuses": {
            "basecamp": "available",
            "proofhub": "available",
            "scoro": "not-documented"
          },
          "note": "Basecamp offers Campfire group chat; ProofHub offers group chat and discussions."
        },
        {
          "feature": "Online proofing / creative file review",
          "statuses": {
            "basecamp": "unavailable",
            "proofhub": "available",
            "scoro": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Planning Views",
      "rows": [
        {
          "feature": "Gantt chart view",
          "statuses": {
            "basecamp": "not-documented",
            "proofhub": "available",
            "scoro": "available"
          }
        },
        {
          "feature": "Kanban board view",
          "statuses": {
            "basecamp": "not-documented",
            "proofhub": "available",
            "scoro": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Financial Tools",
      "rows": [
        {
          "feature": "Built-in invoicing or quoting",
          "statuses": {
            "basecamp": "unavailable",
            "proofhub": "unavailable",
            "scoro": "available"
          }
        },
        {
          "feature": "Time tracking",
          "statuses": {
            "basecamp": "unavailable",
            "proofhub": "available",
            "scoro": "available"
          },
          "note": "Scoro's timesheets and resource planner are available from its Performance tier and above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Basecamp, ProofHub, and Scoro is cheapest for a large team?",
      "answer": "Basecamp and ProofHub both offer flat-rate plans that cover unlimited users for one fixed monthly price, which tends to be far more cost-effective for larger teams than Scoro's per-user pricing, which also requires a minimum of five paid seats."
    },
    {
      "question": "Which one has built-in invoicing or billing?",
      "answer": "Scoro is the only one of the three with documented quoting and invoicing tools built directly into its project management platform."
    },
    {
      "question": "Which has online proofing for creative review?",
      "answer": "ProofHub is the only one of the three with a documented online proofing tool for reviewing and approving images, PDFs, and other creative files."
    },
    {
      "question": "Do all three offer a free trial?",
      "answer": "Yes. Basecamp offers a 30-day free trial, ProofHub offers a free trial with no credit card required, and Scoro offers a 14-day free trial with no credit card required."
    },
    {
      "question": "Can a very small team use all three?",
      "answer": "Basecamp and ProofHub have no minimum user requirement, but Scoro requires at least five paid seats on every plan, which can make it a poor fit for very small teams."
    },
    {
      "question": "Which is best for agencies that need to bill clients through the platform?",
      "answer": "Scoro, since it combines project management with quoting, invoicing, retainer management, and role-based labor costing aimed specifically at professional-services billing."
    }
  ]
};

export default basecampVsProofhubVsScoroContent;

import type { GroupComparisonContent } from './types';

const basecampVsScoroVsWorkfrontContent: GroupComparisonContent = {
  "verdict": "Basecamp, Scoro, and Workfront all manage projects and teams, but they target very different scales and buyers: Basecamp keeps things simple and flat-rate for small teams, Scoro bundles project delivery with billing and CRM for agencies and consultancies, and Workfront brings enterprise-grade portfolio governance to large marketing and creative organizations. The right pick depends less on feature checklists and more on organizational size and whether billing or creative approval workflows matter as much as task tracking. None of the three is a universal winner; each is built for a distinct rung of company complexity.",
  "bestFor": {
    "basecamp": "Small businesses, agencies, and remote teams that want a simple, predictable, all-in-one tool without complex configuration",
    "scoro": "Consultancies and agencies that need project management, invoicing, and client billing unified in one platform",
    "workfront": "Large enterprises with marketing, creative, or cross-functional teams that need portfolio-level governance and Adobe ecosystem integration"
  },
  "highlights": [
    {
      "title": "Flat-rate pricing keeps costs predictable at Basecamp",
      "description": "Basecamp offers an unlimited-user flat monthly plan alongside its per-user tier, letting growing teams avoid the seat-count math that drives up cost on most project management tools.",
      "toolSlugs": [
        "basecamp"
      ]
    },
    {
      "title": "Scoro folds billing and CRM into project delivery",
      "description": "Scoro combines Gantt-based project management with quoting, invoicing, retainer management, and role-based labor costing, aimed squarely at agencies that need profitability tracking alongside task tracking.",
      "toolSlugs": [
        "scoro"
      ]
    },
    {
      "title": "Workfront is built for enterprise creative and marketing governance",
      "description": "Workfront's proofing, approval chains, resource capacity views, and Workfront Fusion automation are designed for large organizations running complex, multi-stage creative and marketing workflows at scale.",
      "toolSlugs": [
        "workfront"
      ]
    },
    {
      "title": "Entry cost varies sharply across the three",
      "description": "Basecamp starts at $15/user/month, Scoro requires a 5-seat minimum starting around $19.90/user/month, and Workfront is entirely custom-quoted with third-party estimates around $49 to $99 per user per month, reflecting three very different budget realities.",
      "toolSlugs": [
        "basecamp",
        "scoro",
        "workfront"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Project Management",
      "rows": [
        {
          "feature": "Task and to-do management",
          "statuses": {
            "basecamp": "available",
            "scoro": "available",
            "workfront": "available"
          }
        },
        {
          "feature": "Gantt charts / timelines",
          "statuses": {
            "basecamp": "unavailable",
            "scoro": "available",
            "workfront": "available"
          }
        },
        {
          "feature": "Resource and capacity planning",
          "statuses": {
            "basecamp": "unavailable",
            "scoro": "limited",
            "workfront": "available"
          },
          "note": "Scoro's resource planner and timesheets are gated behind its Performance tier and above."
        }
      ]
    },
    {
      "group": "Business and Billing",
      "rows": [
        {
          "feature": "Quoting and invoicing",
          "statuses": {
            "basecamp": "unavailable",
            "scoro": "available",
            "workfront": "unavailable"
          }
        },
        {
          "feature": "Retainer and budget management",
          "statuses": {
            "basecamp": "unavailable",
            "scoro": "available",
            "workfront": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Governance and Creative Workflow",
      "rows": [
        {
          "feature": "Proofing and creative review",
          "statuses": {
            "basecamp": "unavailable",
            "scoro": "unavailable",
            "workfront": "available"
          }
        },
        {
          "feature": "Custom approval chains",
          "statuses": {
            "basecamp": "unavailable",
            "scoro": "limited",
            "workfront": "available"
          },
          "note": "Scoro's approval flows are an Enterprise-tier feature; Workfront builds them into its core workflow engine."
        },
        {
          "feature": "Enterprise security and compliance controls",
          "statuses": {
            "basecamp": "unavailable",
            "scoro": "limited",
            "workfront": "available"
          },
          "note": "Scoro offers SSO and provisioning only on its custom-priced Enterprise plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools is cheapest for a small team?",
      "answer": "Basecamp is the most accessible for small teams, starting at $15/user/month or a flat unlimited-user rate. Scoro requires a minimum of 5 seats even on its entry Core plan, and Workfront is entirely custom-quoted and generally aimed at larger budgets."
    },
    {
      "question": "Which tool includes invoicing and client billing?",
      "answer": "Scoro is the only one of the three built with quoting, invoicing, retainer management, and role-based labor costing as core features, since it is designed as a professional services automation platform for agencies and consultancies rather than a pure task tracker."
    },
    {
      "question": "Is Workfront a good fit for a small marketing team?",
      "answer": "Not typically. Workfront's proofing, approval chains, and portfolio governance features are built for large enterprise creative and marketing operations, and its own listed cons note it can feel like more structure than smaller teams or simple projects need."
    },
    {
      "question": "Does Basecamp support Gantt-chart style project timelines?",
      "answer": "No. Basecamp's feature set centers on to-do lists, message boards, schedules, file storage, and check-ins rather than Gantt charts, which is a capability both Scoro and Workfront offer."
    },
    {
      "question": "Which tool integrates most closely with a broader software ecosystem?",
      "answer": "Workfront integrates tightly with Adobe Creative Cloud and Adobe Experience Cloud through Workfront Fusion, making it a natural fit for organizations already standardized on Adobe tools. Scoro focuses on its own built-in CRM and billing rather than a large third-party ecosystem, and Basecamp is designed to be a self-contained hub."
    },
    {
      "question": "Can any of these tools scale to enterprise-size deployments?",
      "answer": "Workfront is explicitly built for this, scaling to thousands of users with enterprise security and governance controls. Scoro can scale via its custom Enterprise tier with SSO and multi-account reporting, while Basecamp's flat-rate unlimited-user plan controls cost at scale but offers less configurability for complex governance needs."
    }
  ]
};

export default basecampVsScoroVsWorkfrontContent;

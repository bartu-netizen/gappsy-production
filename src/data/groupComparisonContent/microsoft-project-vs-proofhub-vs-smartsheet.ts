import type { GroupComparisonContent } from './types';

const microsoftProjectVsProofhubVsSmartsheetContent: GroupComparisonContent = {
  "verdict": "Microsoft Project, ProofHub, and Smartsheet all handle project scheduling, but they're built for different-sized organizations and different pricing philosophies. Microsoft Project is the most scheduling-heavy of the three, with deep critical-path tools and native Power BI and Teams integration for PMOs already standardized on Microsoft 365. ProofHub stands out for flat-rate pricing that covers unlimited users plus a built-in proofing tool aimed at agencies handling client approvals. Smartsheet leans on a familiar spreadsheet-style interface layered with automation and dashboards, and now sits at enterprise scale, with roughly 85 percent of Fortune 500 companies reported as customers.",
  "bestFor": {
    "microsoft-project": "Mid-size to large organizations already standardized on Microsoft 365 that need formal critical-path scheduling and Power BI reporting.",
    "proofhub": "Agencies and small-to-mid businesses that want flat-rate pricing for unlimited users plus built-in file proofing for client approvals.",
    "smartsheet": "Teams comfortable with a spreadsheet interface that need workflow automation, dashboards, and enterprise-grade reliability."
  },
  "highlights": [
    {
      "title": "ProofHub is the only flat-rate option",
      "description": "ProofHub charges one fixed monthly price covering unlimited users, rather than the per-user pricing used by Microsoft Project and Smartsheet, which can make it cheaper for larger teams or those working with many external clients.",
      "toolSlugs": [
        "proofhub"
      ]
    },
    {
      "title": "Microsoft Project goes deepest on formal scheduling",
      "description": "Only Microsoft Project offers dedicated critical-path scheduling, resource leveling, and portfolio-level demand management on its top Plan 5 tier, reflecting its roots as enterprise PMO software.",
      "toolSlugs": [
        "microsoft-project"
      ]
    },
    {
      "title": "Smartsheet trades PM-specific depth for spreadsheet familiarity and scale",
      "description": "Smartsheet's grid interface lowers the learning curve for non-PM staff, and its Business plan adds workflow automation and no-code WorkApps, but it doesn't document dedicated resource-leveling and critical-path tools like Microsoft Project.",
      "toolSlugs": [
        "smartsheet"
      ]
    },
    {
      "title": "ProofHub bundles proofing that neither competitor documents",
      "description": "ProofHub's built-in tool for reviewing, marking up, and approving creative files like images and PDFs is a differentiator for marketing and creative agencies that neither Microsoft Project nor Smartsheet offers.",
      "toolSlugs": [
        "proofhub"
      ]
    },
    {
      "title": "Ownership status has shifted for two of the three",
      "description": "Microsoft Project remains part of publicly traded Microsoft, while Smartsheet went private again in January 2025 after Vista Equity Partners and Blackstone's 8.4 billion dollar acquisition; ProofHub has stayed an independent, bootstrapped company throughout.",
      "toolSlugs": [
        "microsoft-project",
        "smartsheet"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and Views",
      "rows": [
        {
          "feature": "Gantt chart scheduling",
          "statuses": {
            "microsoft-project": "available",
            "proofhub": "available",
            "smartsheet": "available"
          }
        },
        {
          "feature": "Dedicated critical-path / resource leveling",
          "statuses": {
            "microsoft-project": "available",
            "proofhub": "not-documented",
            "smartsheet": "not-documented"
          }
        },
        {
          "feature": "Multiple views (board, calendar, table)",
          "statuses": {
            "microsoft-project": "available",
            "proofhub": "available",
            "smartsheet": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration and Review",
      "rows": [
        {
          "feature": "Built-in time tracking",
          "statuses": {
            "microsoft-project": "available",
            "proofhub": "available",
            "smartsheet": "not-documented"
          },
          "note": "Microsoft Project's timesheets and time tracking are included on Plan 3 and above, not on the entry Plan 1 tier."
        },
        {
          "feature": "Online proofing / creative file approval",
          "statuses": {
            "microsoft-project": "not-documented",
            "proofhub": "available",
            "smartsheet": "not-documented"
          }
        },
        {
          "feature": "Built-in group chat / discussions",
          "statuses": {
            "microsoft-project": "not-documented",
            "proofhub": "available",
            "smartsheet": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Pricing and Automation",
      "rows": [
        {
          "feature": "Flat-rate pricing with unlimited users",
          "statuses": {
            "microsoft-project": "unavailable",
            "proofhub": "available",
            "smartsheet": "unavailable"
          }
        },
        {
          "feature": "Workflow automation engine",
          "statuses": {
            "microsoft-project": "not-documented",
            "proofhub": "not-documented",
            "smartsheet": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Microsoft Project or Smartsheet charge per user, or can I get unlimited users like ProofHub?",
      "answer": "Both Microsoft Project and Smartsheet use per-user subscription pricing that scales with headcount. ProofHub is the outlier, charging one flat monthly fee, Essential at $45 per month or Ultimate Control from about $89 to $150 per month, that covers unlimited users."
    },
    {
      "question": "Which of these three is best for agencies managing client approvals?",
      "answer": "ProofHub is the clearest fit, since it has a built-in proofing tool for reviewing, marking up, and approving creative files like images and PDFs directly in the platform, a feature neither Microsoft Project nor Smartsheet documents."
    },
    {
      "question": "Can ProofHub or Smartsheet replace Microsoft Project for enterprise portfolio management?",
      "answer": "Not fully. Microsoft Project's top Plan 5 tier adds portfolio selection, demand management, and enterprise resource planning that neither ProofHub nor Smartsheet's documented feature sets match, though Smartsheet's Business and Enterprise tiers add automation and governance features aimed at larger organizations."
    },
    {
      "question": "Do any of these tools include native chat or team messaging?",
      "answer": "ProofHub is the only one with built-in group chat and discussions. Microsoft Project relies on Microsoft Teams integration rather than native chat, and Smartsheet doesn't document a built-in messaging feature."
    },
    {
      "question": "Is Smartsheet still a good choice for spreadsheet-style teams after its 2025 acquisition?",
      "answer": "The product itself hasn't changed: Smartsheet still offers its familiar grid interface, automatic Gantt views, and dashboards. The main change is ownership, since Vista Equity Partners and Blackstone took the company private in January 2025 after it had traded publicly on the NYSE since 2018."
    }
  ]
};

export default microsoftProjectVsProofhubVsSmartsheetContent;

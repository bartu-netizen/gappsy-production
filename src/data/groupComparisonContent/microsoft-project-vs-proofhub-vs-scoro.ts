import type { GroupComparisonContent } from './types';

const microsoftProjectVsProofhubVsScoroContent: GroupComparisonContent = {
  "verdict": "These three tools solve project management for very different buyers. Microsoft Project is the enterprise choice for formal critical-path scheduling and portfolio management inside a Microsoft 365 shop, ProofHub is a flat-rate, unlimited-user platform built for small and mid-size teams and creative agencies that also need built-in proofing, and Scoro is a professional services automation platform that pairs project management with quoting, invoicing, and profitability reporting for agencies and consultancies. Budget-sensitive teams with growing headcount tend to favor ProofHub's flat pricing, while agencies that bill clients directly usually need Scoro's financial layer, and organizations already standardized on Microsoft 365 gravitate toward Microsoft Project regardless of price.",
  "bestFor": {
    "microsoft-project": "Enterprise PMOs and Microsoft 365-standardized organizations that need formal Gantt and critical-path scheduling with Power BI reporting.",
    "proofhub": "Small to mid-size teams and creative agencies that want flat-rate pricing with unlimited users plus built-in file proofing.",
    "scoro": "Agencies and consultancies that need project management combined with quoting, invoicing, and profitability reporting in one system."
  },
  "highlights": [
    {
      "title": "Flat rate vs per-seat pricing",
      "description": "ProofHub charges one fixed monthly price for unlimited users, while Microsoft Project and Scoro both price per user, with Scoro requiring a minimum of 5 seats on every plan.",
      "toolSlugs": [
        "proofhub",
        "microsoft-project",
        "scoro"
      ]
    },
    {
      "title": "Enterprise-grade scheduling",
      "description": "Microsoft Project's Gantt charts, critical path analysis, resource leveling, and Power BI connectors give it scheduling depth the other two do not attempt to match.",
      "toolSlugs": [
        "microsoft-project"
      ]
    },
    {
      "title": "Client billing built in",
      "description": "Scoro layers quoting, invoicing, retainer management, and role-based labor costing on top of project tracking, letting agencies run financials without a separate billing tool.",
      "toolSlugs": [
        "scoro"
      ]
    },
    {
      "title": "Creative approval workflows",
      "description": "ProofHub's dedicated online proofing tool lets teams mark up and approve images, PDFs, and documents directly in the platform, a workflow neither competitor offers.",
      "toolSlugs": [
        "proofhub"
      ]
    },
    {
      "title": "Microsoft ecosystem depth",
      "description": "Native ties to Teams, SharePoint, Power BI, and Entra ID make Microsoft Project the natural fit for teams already living inside Microsoft 365.",
      "toolSlugs": [
        "microsoft-project"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and planning",
      "rows": [
        {
          "feature": "Gantt chart or timeline scheduling",
          "statuses": {
            "microsoft-project": "available",
            "proofhub": "available",
            "scoro": "available"
          }
        },
        {
          "feature": "Resource management",
          "statuses": {
            "microsoft-project": "available",
            "proofhub": "limited",
            "scoro": "available"
          },
          "note": "ProofHub offers workload visibility through reporting dashboards rather than a dedicated resource allocation tool; Scoro's resource planner is available from the Performance plan up."
        }
      ]
    },
    {
      "group": "Collaboration and client work",
      "rows": [
        {
          "feature": "Time tracking or timesheets",
          "statuses": {
            "microsoft-project": "available",
            "proofhub": "available",
            "scoro": "available"
          },
          "note": "Microsoft Project timesheets require Plan 3 or above, and Scoro timesheets are gated to the Performance plan."
        },
        {
          "feature": "Creative file proofing and approval",
          "statuses": {
            "microsoft-project": "unavailable",
            "proofhub": "available",
            "scoro": "not-documented"
          }
        },
        {
          "feature": "Built-in team chat or discussions",
          "statuses": {
            "microsoft-project": "available",
            "proofhub": "available",
            "scoro": "not-documented"
          },
          "note": "Microsoft Project's chat relies on its Teams integration rather than a native inbox."
        }
      ]
    },
    {
      "group": "Billing and enterprise controls",
      "rows": [
        {
          "feature": "Quoting and invoicing",
          "statuses": {
            "microsoft-project": "unavailable",
            "proofhub": "unavailable",
            "scoro": "available"
          }
        },
        {
          "feature": "Flat-rate unlimited-user pricing",
          "statuses": {
            "microsoft-project": "unavailable",
            "proofhub": "available",
            "scoro": "unavailable"
          }
        },
        {
          "feature": "Portfolio and PPM management",
          "statuses": {
            "microsoft-project": "available",
            "proofhub": "unavailable",
            "scoro": "not-documented"
          },
          "note": "Microsoft Project's portfolio selection and optimization tools are exclusive to Plan 5."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is ProofHub's flat-rate pricing actually cheaper than Microsoft Project or Scoro?",
      "answer": "For teams above roughly 5 to 10 people, ProofHub's flat monthly fee for unlimited users can undercut both Microsoft Project's per-user Plan 3 or Plan 5 pricing and Scoro's per-seat tiers, since neither of those charges a flat rate regardless of headcount."
    },
    {
      "question": "Which tool is best for formal critical-path scheduling on construction or engineering projects?",
      "answer": "Microsoft Project is purpose-built for this, with Gantt-chart based scheduling, critical path analysis, resource leveling, and baseline tracking that ProofHub and Scoro do not offer at the same depth."
    },
    {
      "question": "Can Scoro replace a separate invoicing tool for an agency?",
      "answer": "Yes. Scoro includes quoting, invoicing, retainer management, and role-based labor costing built into the platform, which is a core reason agencies choose it over general project management tools."
    },
    {
      "question": "Does ProofHub handle client creative approvals the way an agency needs?",
      "answer": "ProofHub's online proofing tool lets teams review, annotate, and approve images, PDFs, and other files directly in the platform, which is a genuine differentiator for marketing and creative agencies compared to Microsoft Project or Scoro."
    },
    {
      "question": "Do any of these tools integrate with Microsoft Teams or Microsoft 365?",
      "answer": "Microsoft Project has native integration with Teams, SharePoint, Power BI, and Entra ID as part of the Microsoft 365 family. Neither ProofHub's nor Scoro's provided feature data documents a comparable native Microsoft 365 integration."
    }
  ]
};

export default microsoftProjectVsProofhubVsScoroContent;

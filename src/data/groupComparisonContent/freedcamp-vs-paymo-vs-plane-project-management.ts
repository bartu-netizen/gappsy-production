import type { GroupComparisonContent } from './types';

const freedcampVsPaymoVsPlaneProjectManagementContent: GroupComparisonContent = {
  "verdict": "These three freemium project management tools appeal to distinct buyers despite sharing a category. Freedcamp offers the most generous free tier and a bundled CRM for budget-conscious small businesses; Paymo is built around a tight time-tracking-to-invoice workflow that suits freelancers and client-billing agencies; and Plane is the open-source, self-hostable option aimed at engineering and product teams that want a modern Jira or Linear alternative. Choosing between them comes down to whether unlimited free users, native billing, or developer-friendly self-hosting matters most.",
  "bestFor": {
    "freedcamp": "Budget-conscious small businesses and agencies that want an unlimited free tier plus a built-in CRM and invoicing.",
    "paymo": "Freelancers and small agencies that bill clients by tracked time and want time tracking to flow directly into invoicing.",
    "plane-project-management": "Engineering and product teams that want an open-source, self-hostable Jira or Linear alternative with AI-assisted workflows."
  },
  "highlights": [
    {
      "title": "Freedcamp's free tier scales to unlimited users",
      "description": "Freedcamp's Free plan has no user cap, while Paymo's free plan is limited to a single user and Plane's free cloud tier is capped at 12 seats.",
      "toolSlugs": [
        "freedcamp",
        "paymo",
        "plane-project-management"
      ]
    },
    {
      "title": "Paymo turns tracked time directly into client invoices",
      "description": "Paymo's time-to-invoice workflow generates client invoices directly from tracked billable hours without needing a separate invoicing app, a core differentiator versus Freedcamp and Plane.",
      "toolSlugs": [
        "paymo"
      ]
    },
    {
      "title": "Plane is open source and self-hostable",
      "description": "Plane is released under AGPL-3.0 and deploys via Docker or Kubernetes, including air-gapped setups, giving it a data-control option neither Freedcamp nor Paymo offers.",
      "toolSlugs": [
        "plane-project-management"
      ]
    },
    {
      "title": "Freedcamp bundles CRM functionality Paymo and Plane don't offer",
      "description": "Freedcamp's Business tier adds a built-in CRM and an 'Invoices+' module, extending it into a small-business operations hub.",
      "toolSlugs": [
        "freedcamp"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier and Pricing",
      "rows": [
        {
          "feature": "Free plan user cap",
          "statuses": {
            "freedcamp": "available",
            "paymo": "limited",
            "plane-project-management": "limited"
          },
          "note": "Freedcamp: unlimited users; Paymo: 1 user, 2 projects; Plane: 12 seats."
        }
      ]
    },
    {
      "group": "Time Tracking and Billing",
      "rows": [
        {
          "feature": "Native time tracking",
          "statuses": {
            "freedcamp": "available",
            "paymo": "available",
            "plane-project-management": "limited"
          },
          "note": "Plane adds time tracking starting on its Pro tier."
        },
        {
          "feature": "Time-to-invoice workflow",
          "statuses": {
            "freedcamp": "available",
            "paymo": "available",
            "plane-project-management": "unavailable"
          },
          "note": "Freedcamp's invoicing lives in its Business tier's Invoices+ module; Paymo builds invoicing from tracked time as a core workflow."
        },
        {
          "feature": "Task dependencies",
          "statuses": {
            "freedcamp": "not-documented",
            "paymo": "limited",
            "plane-project-management": "available"
          },
          "note": "Paymo gates task dependencies to its top Pro tier; Plane supports sub-issues and dependencies as part of its core work item model."
        }
      ]
    },
    {
      "group": "Collaboration and Extensibility",
      "rows": [
        {
          "feature": "Built-in CRM",
          "statuses": {
            "freedcamp": "available",
            "paymo": "unavailable",
            "plane-project-management": "unavailable"
          }
        },
        {
          "feature": "Resource and employee scheduling",
          "statuses": {
            "freedcamp": "not-documented",
            "paymo": "limited",
            "plane-project-management": "not-documented"
          },
          "note": "Paymo offers resource and employee scheduling on its Pro tier."
        },
        {
          "feature": "Self-hosting or open-source deployment",
          "statuses": {
            "freedcamp": "unavailable",
            "paymo": "unavailable",
            "plane-project-management": "available"
          }
        },
        {
          "feature": "AI-assisted features",
          "statuses": {
            "freedcamp": "unavailable",
            "paymo": "not-documented",
            "plane-project-management": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool is best for freelancers who bill clients by the hour?",
      "answer": "Paymo, since it is built around tracking billable time and generating client invoices directly from that tracked time without a separate app."
    },
    {
      "question": "Which of the three has the most generous free plan?",
      "answer": "Freedcamp, whose Free plan supports unlimited users and projects. Paymo's free plan is limited to a single user, and Plane caps its free cloud tier at 12 seats."
    },
    {
      "question": "Can I self-host any of these tools?",
      "answer": "Only Plane, which is open source under AGPL-3.0 and can be deployed via Docker or Kubernetes, including air-gapped environments."
    },
    {
      "question": "Which tool includes a built-in CRM?",
      "answer": "Freedcamp, on its Business tier, bundles a CRM module alongside an 'Invoices+' feature. Neither Paymo nor Plane include a built-in CRM."
    },
    {
      "question": "Which is the best fit for engineering teams?",
      "answer": "Plane, which is purpose-built as an open-source Jira or Linear alternative with sprint-style Cycles, Modules, and AI-assisted workflows."
    },
    {
      "question": "Do all three support task dependencies?",
      "answer": "Plane supports them as part of its core work item model, and Paymo offers them on its top Pro tier. Freedcamp's dependency support is not documented in its feature set."
    }
  ]
};

export default freedcampVsPaymoVsPlaneProjectManagementContent;

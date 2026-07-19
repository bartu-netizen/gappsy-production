import type { GroupComparisonContent } from './types';

const freedcampVsNtaskVsPlaneProjectManagementContent: GroupComparisonContent = {
  "verdict": "All three are freemium project management tools with genuinely usable free tiers, but they solve different problems well. Freedcamp wins on raw free-tier value with unlimited users and a bundled CRM/invoicing module for small businesses; nTask stands out for baking lightweight risk and issue tracking into an affordable per-user price; and Plane is the pick for engineering-minded teams that want an open-source, self-hostable Jira or Linear alternative with AI-assisted workflows. There is no single best answer, since the right choice depends on whether cost, governance features, or developer-friendly self-hosting matters most.",
  "bestFor": {
    "freedcamp": "Budget-conscious small businesses and agencies that want a genuinely unlimited free tier plus built-in CRM and invoicing without buying separate tools.",
    "ntask": "Small to mid-sized teams and consultancies that want lightweight native risk and issue tracking bundled with affordable task management.",
    "plane-project-management": "Engineering and product teams that want an open-source, self-hostable Jira or Linear alternative with modern UX and AI-assisted workflows."
  },
  "highlights": [
    {
      "title": "Freedcamp's free tier has no user cap",
      "description": "Freedcamp's Free plan supports unlimited projects, tasks, storage, and users, while nTask caps its free plan at 5 team members and Plane caps its free cloud tier at 12 seats.",
      "toolSlugs": [
        "freedcamp",
        "ntask",
        "plane-project-management"
      ]
    },
    {
      "title": "nTask bundles risk management at a low price point",
      "description": "nTask includes a native risk register and issue tracking on its Business plan at $8/user/month, a governance feature that is uncommon at this price tier.",
      "toolSlugs": [
        "ntask"
      ]
    },
    {
      "title": "Plane is open source and self-hostable",
      "description": "Plane is released under AGPL-3.0 and can be deployed via Docker or Kubernetes, including air-gapped enterprise setups, giving teams full data control that neither Freedcamp nor nTask offers.",
      "toolSlugs": [
        "plane-project-management"
      ]
    },
    {
      "title": "Freedcamp adds CRM and invoicing on its Business tier",
      "description": "Freedcamp's Business plan layers in a built-in CRM and an 'Invoices+' module, turning it into a lightweight operations hub, a capability neither nTask nor Plane offers natively.",
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
            "ntask": "limited",
            "plane-project-management": "limited"
          },
          "note": "Freedcamp: unlimited users; nTask: capped at 5 team members; Plane: capped at 12 seats."
        },
        {
          "feature": "Free collaborator or guest seats",
          "statuses": {
            "freedcamp": "available",
            "ntask": "not-documented",
            "plane-project-management": "not-documented"
          },
          "note": "Freedcamp does not charge for external collaborators even on paid plans."
        }
      ]
    },
    {
      "group": "Task and Work Management",
      "rows": [
        {
          "feature": "Native time tracking",
          "statuses": {
            "freedcamp": "available",
            "ntask": "available",
            "plane-project-management": "limited"
          },
          "note": "Plane adds time tracking starting on its Pro tier."
        },
        {
          "feature": "Issue and risk tracking",
          "statuses": {
            "freedcamp": "limited",
            "ntask": "limited",
            "plane-project-management": "available"
          },
          "note": "Freedcamp's issue tracker and nTask's risk register are both gated to Business-tier plans; Plane treats work item and issue tracking as core."
        },
        {
          "feature": "Multiple work views (Kanban, Gantt, calendar)",
          "statuses": {
            "freedcamp": "not-documented",
            "ntask": "available",
            "plane-project-management": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration, Governance and Extensibility",
      "rows": [
        {
          "feature": "Built-in CRM and invoicing",
          "statuses": {
            "freedcamp": "available",
            "ntask": "unavailable",
            "plane-project-management": "unavailable"
          }
        },
        {
          "feature": "Self-hosting or open-source deployment",
          "statuses": {
            "freedcamp": "unavailable",
            "ntask": "unavailable",
            "plane-project-management": "available"
          }
        },
        {
          "feature": "AI-assisted features",
          "statuses": {
            "freedcamp": "unavailable",
            "ntask": "not-documented",
            "plane-project-management": "available"
          },
          "note": "Plane AI powers work item creation, summaries, and workflow automation."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the most generous free plan?",
      "answer": "Freedcamp, by a wide margin. Its Free plan supports unlimited projects, tasks, storage, and users, while nTask limits free teams to 5 members and Plane caps its free cloud tier at 12 seats."
    },
    {
      "question": "Can I self-host any of these tools?",
      "answer": "Only Plane. It is released under AGPL-3.0 and can be deployed via Docker or Kubernetes, including air-gapped setups, while Freedcamp and nTask are cloud-only."
    },
    {
      "question": "Which tool includes built-in CRM or invoicing features?",
      "answer": "Freedcamp, on its Business tier, which adds a CRM module and an 'Invoices+' feature. Neither nTask nor Plane offer built-in CRM or invoicing."
    },
    {
      "question": "Which is the best fit for engineering teams that want a Jira or Linear alternative?",
      "answer": "Plane is purpose-built for this use case, with work items, sprint-style Cycles, Modules, and a modern interface positioned directly against Jira and Linear."
    },
    {
      "question": "Does any of these tools offer native risk management?",
      "answer": "nTask does, with a built-in risk register available on its Business plan and above, which is uncommon among project management tools at this price point."
    },
    {
      "question": "Are all three available on mobile?",
      "answer": "Yes, Freedcamp, nTask, and Plane all offer web access alongside iOS and Android support."
    }
  ]
};

export default freedcampVsNtaskVsPlaneProjectManagementContent;

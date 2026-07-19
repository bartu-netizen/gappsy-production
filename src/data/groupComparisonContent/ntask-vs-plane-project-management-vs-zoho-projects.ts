import type { GroupComparisonContent } from './types';

const ntaskVsPlaneProjectManagementVsZohoProjectsContent: GroupComparisonContent = {
  "verdict": "nTask, Plane, and Zoho Projects are all freemium project management platforms with mobile apps, but they lead with different strengths. nTask is the most affordable way to add native risk and issue tracking to task management; Plane is the open-source, self-hostable choice for engineering teams that want a modern Jira or Linear alternative; and Zoho Projects offers the deepest integration ecosystem, especially for teams already inside the Zoho suite, along with mature Gantt-based planning and automation. The best fit depends on whether cost, developer-friendly self-hosting, or integration breadth is the priority.",
  "bestFor": {
    "ntask": "Cost-sensitive small teams that want lightweight native risk and issue tracking bundled with affordable task management.",
    "plane-project-management": "Engineering and product teams that want an open-source, self-hostable Jira or Linear alternative with AI-assisted workflows.",
    "zoho-projects": "Teams already using other Zoho apps, or that want Gantt-based planning, workflow automation, and 50-plus integrations."
  },
  "highlights": [
    {
      "title": "nTask has the lowest paid entry price",
      "description": "nTask's Premium plan starts at $3/user/month, undercutting Plane's $6/seat/month Pro tier and Zoho Projects' roughly $4-5/user/month Premium tier only slightly, but with risk management layered in at the Business tier.",
      "toolSlugs": [
        "ntask"
      ]
    },
    {
      "title": "Plane is open source and self-hostable",
      "description": "Plane is released under AGPL-3.0 and can be deployed via Docker or Kubernetes, including air-gapped setups, a data-control option neither nTask nor Zoho Projects offers.",
      "toolSlugs": [
        "plane-project-management"
      ]
    },
    {
      "title": "Zoho Projects has the widest integration ecosystem",
      "description": "Zoho Projects connects with more than 50 third-party apps and ties natively into the wider Zoho One suite, going well beyond what nTask or Plane document.",
      "toolSlugs": [
        "zoho-projects"
      ]
    },
    {
      "title": "All three cap their free tiers differently",
      "description": "nTask limits free teams to 5 members, Plane caps its free cloud tier at 12 seats, and Zoho Projects limits its free plan to 5 users and 3 projects.",
      "toolSlugs": [
        "ntask",
        "plane-project-management",
        "zoho-projects"
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
            "ntask": "limited",
            "plane-project-management": "limited",
            "zoho-projects": "limited"
          },
          "note": "nTask: 5 team members; Plane: 12 seats; Zoho Projects: 5 users and 3 projects."
        }
      ]
    },
    {
      "group": "Task and Work Management",
      "rows": [
        {
          "feature": "Native time tracking",
          "statuses": {
            "ntask": "available",
            "plane-project-management": "limited",
            "zoho-projects": "available"
          },
          "note": "Plane adds time tracking starting on its Pro tier."
        },
        {
          "feature": "Gantt charts",
          "statuses": {
            "ntask": "available",
            "plane-project-management": "available",
            "zoho-projects": "available"
          }
        },
        {
          "feature": "Workflow automation builder",
          "statuses": {
            "ntask": "not-documented",
            "plane-project-management": "not-documented",
            "zoho-projects": "available"
          },
          "note": "Zoho Projects' drag-and-drop Blueprints automate recurring processes."
        }
      ]
    },
    {
      "group": "Governance and Extensibility",
      "rows": [
        {
          "feature": "Issue and risk tracking",
          "statuses": {
            "ntask": "limited",
            "plane-project-management": "available",
            "zoho-projects": "not-documented"
          },
          "note": "nTask gates its risk register to the Business tier; Plane treats issue tracking as a core work item feature."
        },
        {
          "feature": "Self-hosting or open-source deployment",
          "statuses": {
            "ntask": "unavailable",
            "plane-project-management": "available",
            "zoho-projects": "unavailable"
          }
        },
        {
          "feature": "AI-assisted features",
          "statuses": {
            "ntask": "not-documented",
            "plane-project-management": "available",
            "zoho-projects": "not-documented"
          }
        },
        {
          "feature": "Third-party integration breadth",
          "statuses": {
            "ntask": "limited",
            "plane-project-management": "limited",
            "zoho-projects": "available"
          },
          "note": "Zoho Projects lists 50-plus integrations; nTask and Plane both note narrower ecosystems as a tradeoff."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is open source?",
      "answer": "Plane, released under AGPL-3.0, and self-hostable via Docker or Kubernetes. Neither nTask nor Zoho Projects offer a self-hosted option."
    },
    {
      "question": "Which has native risk management?",
      "answer": "nTask includes a built-in risk register on its Business plan and above. Plane covers general issue tracking but not a dedicated risk register, and Zoho Projects does not document risk management."
    },
    {
      "question": "Which tool has the broadest integration library?",
      "answer": "Zoho Projects, with more than 50 third-party integrations and native ties into the wider Zoho One suite."
    },
    {
      "question": "Which is cheapest to get started with a small team?",
      "answer": "nTask has the lowest paid entry price at $3/user/month, though all three offer usable free tiers capped at different user counts."
    },
    {
      "question": "Which is best for engineering teams that want a Jira alternative?",
      "answer": "Plane, purpose-built with work items, sprint-style Cycles, Modules, and AI-assisted workflows aimed squarely at Jira and Linear users."
    },
    {
      "question": "Do all three offer mobile apps?",
      "answer": "Yes, nTask, Plane, and Zoho Projects are all available on iOS and Android alongside the web."
    }
  ]
};

export default ntaskVsPlaneProjectManagementVsZohoProjectsContent;

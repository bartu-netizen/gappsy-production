import type { GroupComparisonContent } from './types';

const freedcampVsPlaneProjectManagementVsZohoProjectsContent: GroupComparisonContent = {
  "verdict": "There is no single winner here: Freedcamp wins on raw affordability with an unlimited free tier and free client collaborators, Plane wins for technical teams that want an open-source, self-hostable, AI-native alternative to Jira or Linear, and Zoho Projects wins for Gantt-chart-driven planning and deep integration with the wider Zoho ecosystem. The right choice depends more on whether you need self-hosting, an existing Zoho stack, or rock-bottom per-seat pricing than on raw feature count.",
  "bestFor": {
    "freedcamp": "Budget-conscious small businesses, nonprofits, and agencies that need unlimited users and free external collaborators without per-seat costs.",
    "plane-project-management": "Engineering and product teams that want a modern, self-hostable, AI-native Jira or Linear alternative with full control over their data.",
    "zoho-projects": "Teams already using other Zoho apps like CRM, Books, or Invoice who want deep Gantt-chart planning, time tracking, and 50-plus integrations at a budget-friendly price."
  },
  "highlights": [
    {
      "title": "Freedcamp is the only one with a truly unlimited free tier",
      "description": "Freedcamp's Free plan supports unlimited projects, tasks, storage, and users forever, while Plane caps its free cloud tier at 12 seats and Zoho Projects caps its free tier at 5 users and 3 projects.",
      "toolSlugs": [
        "freedcamp"
      ]
    },
    {
      "title": "Plane is the only self-hostable, open-source option",
      "description": "Plane is released under the AGPL-3.0 license and can be deployed via Docker or Kubernetes for full data control, an option that neither Freedcamp nor Zoho Projects, both cloud-only, offers.",
      "toolSlugs": [
        "plane-project-management"
      ]
    },
    {
      "title": "Zoho Projects has the deepest native Gantt-chart and time-tracking tooling",
      "description": "Zoho Projects is built around Gantt charts that visualize dependencies and schedule variance plus built-in timers for billable and non-billable hours that flow into Zoho Invoice, a combination not documented for Freedcamp or Plane.",
      "toolSlugs": [
        "zoho-projects"
      ]
    },
    {
      "title": "Only Freedcamp keeps external collaborators free on paid plans",
      "description": "Freedcamp explicitly does not charge for collaborator-role guest users even on its paid tiers, which is notable for agencies looping in many clients, a policy not documented for Plane or Zoho Projects.",
      "toolSlugs": [
        "freedcamp"
      ]
    },
    {
      "title": "Plane is the only one built around AI-assisted workflows out of the box",
      "description": "Plane AI ships with a metered AI-credit allowance per seat for AI-assisted work item creation, summaries, and automation, while AI features are not documented for Freedcamp or Zoho Projects.",
      "toolSlugs": [
        "plane-project-management"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier",
      "rows": [
        {
          "feature": "Unlimited users on the free tier",
          "statuses": {
            "freedcamp": "available",
            "plane-project-management": "unavailable",
            "zoho-projects": "unavailable"
          },
          "note": "Plane's free cloud tier caps at 12 seats; Zoho Projects caps its free tier at 5 users"
        },
        {
          "feature": "Free external collaborator or guest seats on paid plans",
          "statuses": {
            "freedcamp": "available",
            "plane-project-management": "not-documented",
            "zoho-projects": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment Model",
      "rows": [
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "freedcamp": "unavailable",
            "plane-project-management": "available",
            "zoho-projects": "unavailable"
          }
        },
        {
          "feature": "Open-source codebase",
          "statuses": {
            "freedcamp": "unavailable",
            "plane-project-management": "available",
            "zoho-projects": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Planning Tools",
      "rows": [
        {
          "feature": "Gantt or timeline view",
          "statuses": {
            "freedcamp": "not-documented",
            "plane-project-management": "available",
            "zoho-projects": "available"
          }
        },
        {
          "feature": "Built-in CRM module",
          "statuses": {
            "freedcamp": "available",
            "plane-project-management": "unavailable",
            "zoho-projects": "unavailable"
          },
          "note": "Freedcamp's CRM is bundled on its Business tier; Zoho Projects only integrates with the separate Zoho CRM app"
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted work item creation or automation",
          "statuses": {
            "freedcamp": "not-documented",
            "plane-project-management": "available",
            "zoho-projects": "not-documented"
          },
          "note": "Plane AI is metered by per-seat AI credits"
        },
        {
          "feature": "Workflow automation builder",
          "statuses": {
            "freedcamp": "not-documented",
            "plane-project-management": "not-documented",
            "zoho-projects": "available"
          },
          "note": "Zoho Projects calls this feature Blueprints"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool has the most generous free plan?",
      "answer": "Freedcamp, with unlimited users, projects, tasks, and storage on its free-forever plan, compared to Plane's 12-seat cap and Zoho Projects' 5-user cap on their free tiers."
    },
    {
      "question": "Can I self-host any of these instead of using the cloud version?",
      "answer": "Only Plane offers a self-hosted, open-source deployment option under the AGPL-3.0 license; Freedcamp and Zoho Projects are cloud-only."
    },
    {
      "question": "Which is best suited to software or engineering teams tracking sprints?",
      "answer": "Plane, which was built as a Jira and Linear alternative with Cycles for sprint tracking and burndown charts."
    },
    {
      "question": "Which integrates best with an existing CRM or invoicing workflow?",
      "answer": "Freedcamp bundles its own CRM and invoicing module on the Business tier, while Zoho Projects natively connects to the broader Zoho suite, including Zoho CRM, Books, and Invoice, if you are already a Zoho customer."
    },
    {
      "question": "Do any of these charge for guest or client collaborators?",
      "answer": "Freedcamp explicitly does not charge for collaborator-role users even on paid plans; Plane and Zoho Projects price per seat with no documented free-collaborator carve-out."
    },
    {
      "question": "Which has the most mature Gantt-chart and time-tracking functionality?",
      "answer": "Zoho Projects, which is built around Gantt charts and billable and non-billable time tracking with automatic invoicing through Zoho Invoice."
    }
  ]
};

export default freedcampVsPlaneProjectManagementVsZohoProjectsContent;

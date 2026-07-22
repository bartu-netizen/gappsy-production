import type { GroupComparisonContent } from './types';

const freedcampVsNtaskVsZohoProjectsContent: GroupComparisonContent = {
  "verdict": "Freedcamp, nTask, and Zoho Projects all offer freemium project management with mobile apps, but they target different buying motivations. Freedcamp leads on free-tier generosity and bundles a CRM plus invoicing for small businesses; nTask is the cheapest way to add native risk and issue tracking to task management; and Zoho Projects offers the deepest integration ecosystem, especially for teams already using other Zoho apps, along with stronger Gantt-based planning and automation. Teams should weigh raw cost against how much they value automation and integration breadth.",
  "bestFor": {
    "freedcamp": "Budget-conscious small businesses and agencies that want an unlimited free tier plus built-in CRM and invoicing without extra tools.",
    "ntask": "Cost-sensitive small teams that want lightweight native risk and issue tracking bundled with affordable task management.",
    "zoho-projects": "Teams already using other Zoho apps, or that want Gantt-based planning, workflow automation, and 50-plus third-party integrations."
  },
  "highlights": [
    {
      "title": "Freedcamp's free tier has no user limit",
      "description": "Freedcamp's Free plan supports unlimited users and projects, while nTask caps free teams at 5 members and Zoho Projects caps its free plan at 5 users and 3 projects.",
      "toolSlugs": [
        "freedcamp",
        "ntask",
        "zoho-projects"
      ]
    },
    {
      "title": "Zoho Projects has the broadest integration ecosystem",
      "description": "Zoho Projects connects natively with more than 50 third-party apps like Slack, GitHub, and Jira, plus deep ties into the wider Zoho One suite including Zoho CRM, Books, and Invoice.",
      "toolSlugs": [
        "zoho-projects"
      ]
    },
    {
      "title": "nTask combines risk management with task management at low cost",
      "description": "nTask's Business plan, at $8/user/month, adds a native risk register and issue tracking, a combination that is uncommon at this price point.",
      "toolSlugs": [
        "ntask"
      ]
    },
    {
      "title": "Freedcamp and Zoho Projects both add CRM capability, differently",
      "description": "Freedcamp bundles a built-in CRM directly into its Business tier, while Zoho Projects connects to the separate Zoho CRM app as part of the wider Zoho One suite.",
      "toolSlugs": [
        "freedcamp",
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
            "freedcamp": "available",
            "ntask": "limited",
            "zoho-projects": "limited"
          },
          "note": "Freedcamp: unlimited users; nTask: 5 team members; Zoho Projects: 5 users and 3 projects."
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
            "zoho-projects": "available"
          }
        },
        {
          "feature": "Gantt charts",
          "statuses": {
            "freedcamp": "not-documented",
            "ntask": "available",
            "zoho-projects": "available"
          }
        },
        {
          "feature": "Workflow automation builder",
          "statuses": {
            "freedcamp": "not-documented",
            "ntask": "not-documented",
            "zoho-projects": "available"
          },
          "note": "Zoho Projects' drag-and-drop Blueprints automate recurring, multi-step processes."
        }
      ]
    },
    {
      "group": "Collaboration, Governance and Extensibility",
      "rows": [
        {
          "feature": "Built-in or integrated CRM",
          "statuses": {
            "freedcamp": "available",
            "ntask": "unavailable",
            "zoho-projects": "limited"
          },
          "note": "Freedcamp's CRM is built into its Business tier; Zoho Projects connects to the separate Zoho CRM app rather than including CRM natively."
        },
        {
          "feature": "Third-party integration breadth",
          "statuses": {
            "freedcamp": "limited",
            "ntask": "limited",
            "zoho-projects": "available"
          },
          "note": "Zoho Projects lists 50-plus integrations; Freedcamp and nTask both note smaller integration ecosystems as a tradeoff."
        },
        {
          "feature": "Issue and risk tracking",
          "statuses": {
            "freedcamp": "limited",
            "ntask": "limited",
            "zoho-projects": "not-documented"
          }
        },
        {
          "feature": "SSO and enterprise security controls",
          "statuses": {
            "freedcamp": "available",
            "ntask": "not-documented",
            "zoho-projects": "available"
          },
          "note": "Freedcamp offers SSO/SAML on Enterprise; Zoho Projects offers SSO on Enterprise plus ISO 27001 certification."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool has the largest integration library?",
      "answer": "Zoho Projects, with more than 50 third-party integrations plus native connections to other Zoho apps like CRM, Books, and Invoice. Freedcamp and nTask both note smaller integration ecosystems."
    },
    {
      "question": "Which has the most generous free plan?",
      "answer": "Freedcamp, since its Free plan allows unlimited users and projects. nTask limits free teams to 5 members, and Zoho Projects limits its free plan to 5 users and 3 projects."
    },
    {
      "question": "Is Zoho Projects worth it if I don't use other Zoho apps?",
      "answer": "It can be, thanks to its Gantt charts, automation, and broad integrations, but its own documentation notes that its best value comes from pairing it with the wider Zoho One suite."
    },
    {
      "question": "Which tool includes native risk management?",
      "answer": "nTask, on its Business plan and above, includes a built-in risk register alongside issue tracking."
    },
    {
      "question": "Do all three offer mobile apps?",
      "answer": "Yes, Freedcamp, nTask, and Zoho Projects are all available on iOS and Android in addition to the web."
    },
    {
      "question": "Which is cheapest for a small team just starting out?",
      "answer": "nTask has the lowest entry-level paid price at $3/user/month, though Freedcamp's unlimited free tier may cost nothing at all for teams that don't need Pro-tier features."
    }
  ]
};

export default freedcampVsNtaskVsZohoProjectsContent;

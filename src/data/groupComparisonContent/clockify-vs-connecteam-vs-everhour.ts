import type { GroupComparisonContent } from './types';

const clockifyVsConnecteamVsEverhourContent: GroupComparisonContent = {
  "verdict": "All three track time, but they are optimized for different jobs. Clockify offers the most granular, feature-by-feature pricing ladder for teams that want to pay only for billing, approval, or security features as they need them. Connecteam is the only one built as a full deskless-workforce platform, bundling scheduling, internal communication, and HR document management around its time tracking. Everhour is the pick for teams that live inside a project management tool like Asana, Trello, or Jira and want budgeting and invoicing embedded there rather than in a separate app.",
  "bestFor": {
    "clockify": "Teams that want the most cost-efficient path from free tracking to full-featured invoicing and enterprise security, paying incrementally as they need more capability.",
    "connecteam": "Businesses managing deskless, mobile-first hourly staff, such as retail, construction, or field services, that need GPS scheduling, HR documents, and internal communication in one app.",
    "everhour": "Agencies and dev teams that already live inside Asana, Trello, Jira, or GitHub and want budgeting, invoicing, and time tracking embedded directly into those tools rather than a standalone timer app."
  },
  "highlights": [
    {
      "title": "Connecteam is the only true all-in-one deskless-workforce platform",
      "description": "Connecteam bundles GPS scheduling, internal communications, and HR document management into one product, not just time tracking, which Clockify and Everhour do not offer.",
      "toolSlugs": [
        "connecteam"
      ]
    },
    {
      "title": "Everhour's core differentiator is embedding directly into existing project tools",
      "description": "Rather than being a separate destination app, Everhour injects its timer into task cards inside Asana, Trello, Jira, Basecamp, and GitHub, which is central to how it is positioned against Clockify and Connecteam.",
      "toolSlugs": [
        "everhour"
      ]
    },
    {
      "title": "Clockify has the most granular pricing ladder of the three",
      "description": "Clockify spreads features like invoicing, GPS tracking, budgeting, and SSO across five separate tiers, letting teams pay only for what they need, versus Everhour's single no-feature-gating paid plan and Connecteam's per-hub pricing.",
      "toolSlugs": [
        "clockify"
      ]
    },
    {
      "title": "All three free plans are capped at a small headcount",
      "description": "Clockify and Everhour both cap free use at 5 users, while Connecteam's free plan covers up to 10 employees but only because it spans all three of its hubs at once.",
      "toolSlugs": [
        "clockify",
        "connecteam",
        "everhour"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Time Tracking and Workforce Scheduling",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "clockify": "available",
            "connecteam": "available",
            "everhour": "available"
          },
          "note": "Clockify and Everhour cap free use at 5 users; Connecteam's free plan covers up to 10 employees across all three hubs."
        },
        {
          "feature": "GPS or location-based time clock",
          "statuses": {
            "clockify": "available",
            "connecteam": "available",
            "everhour": "not-documented"
          },
          "note": "Clockify only unlocks GPS tracking on its Pro tier and above."
        },
        {
          "feature": "Shift-based employee scheduling",
          "statuses": {
            "clockify": "available",
            "connecteam": "available",
            "everhour": "limited"
          },
          "note": "Everhour offers capacity and availability planning across projects and clients rather than shift-based scheduling."
        }
      ]
    },
    {
      "group": "Budgeting, Billing and Integrations",
      "rows": [
        {
          "feature": "Client invoicing",
          "statuses": {
            "clockify": "available",
            "connecteam": "unavailable",
            "everhour": "available"
          },
          "note": "Clockify unlocks invoicing on its Standard tier and above."
        },
        {
          "feature": "Project budgets and profitability tracking",
          "statuses": {
            "clockify": "available",
            "connecteam": "unavailable",
            "everhour": "available"
          },
          "note": "Clockify's budgeting tools sit on its Pro tier and above; Everhour includes budgeting with no feature gating on its single paid Team plan."
        },
        {
          "feature": "Native embedding inside project management tools (Asana, Trello, Jira, GitHub)",
          "statuses": {
            "clockify": "limited",
            "connecteam": "not-documented",
            "everhour": "available"
          },
          "note": "Everhour is built specifically to inject a timer widget into task cards in these tools; Clockify connects via 90+ general integrations rather than native embedding."
        }
      ]
    },
    {
      "group": "HR and Team Communication",
      "rows": [
        {
          "feature": "Internal team chat or communications hub",
          "statuses": {
            "clockify": "unavailable",
            "connecteam": "available",
            "everhour": "unavailable"
          }
        },
        {
          "feature": "HR document e-signature, onboarding, or time-off workflows",
          "statuses": {
            "clockify": "limited",
            "connecteam": "available",
            "everhour": "limited"
          },
          "note": "Clockify includes time-off tracking on its Standard tier; Everhour includes time-off and accrual tracking with approvals. Only Connecteam adds full onboarding and e-signature document management."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three has the most generous free plan?",
      "answer": "Connecteam's free plan covers up to 10 employees across all three of its hubs, while Clockify and Everhour both cap free use at 5 users."
    },
    {
      "question": "Which tool works best for a team that already lives in Jira, Asana, or Trello?",
      "answer": "Everhour is built specifically to embed its timer inside those tools' task cards, whereas Clockify and Connecteam are standalone apps that connect via general integrations or do not mention this integration style at all."
    },
    {
      "question": "Do any of these charge extra for GPS tracking?",
      "answer": "Clockify only unlocks GPS tracking on its Pro tier ($7.99/user/month annual). Connecteam includes GPS time clock in its base Operations Hub plan. Everhour's provided data does not document a GPS tracking feature."
    },
    {
      "question": "Can I use any of these for internal company communication, not just time tracking?",
      "answer": "Only Connecteam includes a dedicated Communications Hub with a news feed, chat, and surveys. Clockify and Everhour are focused on time tracking and billing rather than general team communication."
    },
    {
      "question": "Which is cheapest for a small team that just needs basic time tracking?",
      "answer": "All three offer free tiers around a similar size: Clockify and Everhour cap free use at 5 users, and Connecteam covers up to 10 employees free, so a small team could realistically use any of the three at no cost depending on headcount and whether they also need scheduling or HR tools."
    }
  ]
};

export default clockifyVsConnecteamVsEverhourContent;

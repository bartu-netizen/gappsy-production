import type { GroupComparisonContent } from './types';

const asanaVsClickupVsHeightContent: GroupComparisonContent = {
  "verdict": "Asana and ClickUp are the two live contenders here, differing mainly in philosophy: Asana leans on its Work Graph data model and built-in AI Teammates for polished cross-functional reporting, while ClickUp bets on breadth, bundling docs, chat, whiteboards, and tasks into one highly configurable, budget-friendly workspace. Height, once praised for its keyboard-first speed and deeply integrated AI assistant, permanently shut down on September 24, 2025, so it now matters mainly as context for former users choosing where to migrate rather than as an active option.",
  "bestFor": {
    "asana": "Cross-functional teams that want a polished, integration-rich platform with built-in AI Teammates and enterprise-grade reporting and governance.",
    "clickup": "Teams that want to consolidate docs, chat, whiteboards, and tasks into one highly customizable, budget-friendly workspace.",
    "height": "Only relevant as historical context or for former Height users researching a replacement, since the product was permanently discontinued on September 24, 2025."
  },
  "highlights": [
    {
      "title": "Enterprise-Ready Reporting and Governance",
      "description": "Asana's Enterprise and Enterprise+ plans add SAML authentication, SCIM provisioning, and universal workload views, backed by its Work Graph model linking goals, portfolios, and tasks.",
      "toolSlugs": [
        "asana"
      ]
    },
    {
      "title": "All-in-One Workspace",
      "description": "ClickUp bundles Docs, Whiteboards, Chat, Goals, and Dashboards alongside tasks in a single workspace, aiming to replace several separate point tools.",
      "toolSlugs": [
        "clickup"
      ]
    },
    {
      "title": "AI Woven Into Everyday Workflows",
      "description": "Asana's AI Teammates and AI Studio, ClickUp Brain, and Height's discontinued AI assistant all embedded automation directly into task and project workflows rather than as a bolt-on chatbot.",
      "toolSlugs": [
        "asana",
        "clickup",
        "height"
      ]
    },
    {
      "title": "Permanently Discontinued",
      "description": "Height shut down for good on September 24, 2025, after CEO Michael Villar announced the closure in March 2025; there was no acquirer, and existing customers had to migrate their data elsewhere.",
      "toolSlugs": [
        "height"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Project Views",
      "rows": [
        {
          "feature": "List, board, and calendar views",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "height": "not-documented"
          }
        },
        {
          "feature": "Native Gantt or timeline view",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "height": "not-documented"
          }
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "height": "available"
          },
          "note": "ClickUp Brain is priced as an add-on. Height's AI assistant is no longer accessible following the product's September 2025 shutdown."
        },
        {
          "feature": "AI-driven bug or task triage",
          "statuses": {
            "asana": "not-documented",
            "clickup": "not-documented",
            "height": "available"
          },
          "note": "Height offered automated bug-priority triage historically; the feature is no longer usable since the shutdown."
        }
      ]
    },
    {
      "group": "Collaboration Tools",
      "rows": [
        {
          "feature": "Built-in docs and whiteboards",
          "statuses": {
            "asana": "not-documented",
            "clickup": "available",
            "height": "not-documented"
          }
        },
        {
          "feature": "Built-in team chat",
          "statuses": {
            "asana": "not-documented",
            "clickup": "available",
            "height": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Availability and Pricing",
      "rows": [
        {
          "feature": "Currently open to new signups",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "height": "unavailable"
          }
        },
        {
          "feature": "Free plan",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "height": "unavailable"
          },
          "note": "Asana's free Personal plan is limited to 2 users; ClickUp's Free Forever plan allows unlimited members with capped storage."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Height still available?",
      "answer": "No. Height permanently shut down on September 24, 2025, after CEO Michael Villar announced the closure in March 2025. There is no acquirer and no way to sign up or continue using the service today."
    },
    {
      "question": "Where should former Height users migrate?",
      "answer": "Asana and ClickUp are the two closest live alternatives covered here. Asana suits teams wanting polished cross-functional reporting and AI Teammates, while ClickUp suits teams wanting a single workspace that also covers docs, chat, and whiteboards."
    },
    {
      "question": "Which is cheaper, Asana or ClickUp?",
      "answer": "ClickUp's Unlimited plan starts at $7 per user per month billed annually, versus Asana's Starter plan at $10.99 per user per month billed annually. Both also offer free tiers, though ClickUp's Free Forever plan supports unlimited members while Asana's free Personal plan is capped at 2 users."
    },
    {
      "question": "Do Asana and ClickUp have AI features?",
      "answer": "Yes. Asana includes AI Teammates and AI Studio for building custom automations, while ClickUp offers ClickUp Brain as a paid add-on for writing assistance, summaries, and workspace-wide question answering."
    },
    {
      "question": "Which has the better free plan, Asana or ClickUp?",
      "answer": "ClickUp's Free Forever plan allows unlimited members and unlimited tasks, though storage is capped at 60MB. Asana's free Personal plan is currently limited to 2 users for new accounts but has no storage cap mentioned."
    },
    {
      "question": "Which offers better enterprise governance, Asana or ClickUp?",
      "answer": "Asana's Enterprise and Enterprise+ tiers add SAML authentication, SCIM provisioning, and universal workload and capacity planning. ClickUp's Enterprise tier adds SAML SSO, an enterprise API, white-labeling, and HIPAA and MSA compliance options."
    }
  ]
};

export default asanaVsClickupVsHeightContent;

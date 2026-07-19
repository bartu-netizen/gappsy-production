import type { GroupComparisonContent } from './types';

const happyfoxVsJiraServiceManagementVsZammadContent: GroupComparisonContent = {
  "verdict": "HappyFox, Jira Service Management, and Zammad are all ticket-based helpdesk platforms, but they differ sharply in deployment model and depth of ITSM tooling. Zammad is the only one with a truly free, self-hosted open-source edition, plus a GDPR-friendly hosted option from German data centers; Jira Service Management offers a free cloud tier for very small teams but is really built for ITIL-aligned IT and DevOps work inside the Atlassian ecosystem; HappyFox sits in between as a bootstrapped, all-in-one SaaS platform spanning customer support, IT, and HR with a flat-fee option for larger teams. The right choice depends more on self-hosting appetite and how IT-centric the workload is than on any single feature gap.",
  "bestFor": {
    "happyfox": "Teams wanting a bootstrapped, all-in-one SaaS ticketing platform for customer support, IT, and HR with flat-fee pricing at scale.",
    "jira-service-management": "IT and DevOps teams needing ITIL-aligned incident, change, and on-call management tied into an existing Jira and Confluence stack.",
    "zammad": "Cost-conscious or data-residency-sensitive teams that want a free, open-source helpdesk with an optional GDPR-friendly German-hosted cloud."
  },
  "highlights": [
    {
      "title": "The only genuinely free, open-source self-hosted pick",
      "description": "Zammad's self-hosted Community edition is fully free and open source, unlike HappyFox's trial-only free access or JSM's small-team-capped free tier.",
      "toolSlugs": [
        "zammad"
      ]
    },
    {
      "title": "A free tier without any self-hosting required",
      "description": "Jira Service Management's Free plan runs entirely in Atlassian's cloud for up to 3 agents, no server management needed, which Zammad's free option does not offer since it requires self-hosting.",
      "toolSlugs": [
        "jira-service-management"
      ]
    },
    {
      "title": "Broadest built-in channel coverage",
      "description": "Zammad's higher hosted tiers add Telegram, Facebook, and WhatsApp on top of email and chat, while HappyFox covers email, chat, phone, and social from its entry tiers.",
      "toolSlugs": [
        "zammad",
        "happyfox"
      ]
    },
    {
      "title": "Deepest ITIL tooling",
      "description": "Jira Service Management and HappyFox both offer ITIL-aligned change and incident management, while Zammad is a general-purpose ticketing system without dedicated ITIL workflows.",
      "toolSlugs": [
        "jira-service-management",
        "happyfox"
      ]
    },
    {
      "title": "AI pricing differs sharply across all three",
      "description": "HappyFox bundles its AI Copilot into the Pro tier price, Zammad bills AI features separately at roughly EUR 0.03 per call, and JSM restricts AI to its Premium tier and above.",
      "toolSlugs": [
        "happyfox",
        "jira-service-management",
        "zammad"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Licensing",
      "rows": [
        {
          "feature": "Free self-hosted open-source edition",
          "statuses": {
            "happyfox": "unavailable",
            "jira-service-management": "unavailable",
            "zammad": "available"
          }
        },
        {
          "feature": "Free hosted tier (no self-hosting needed)",
          "statuses": {
            "happyfox": "unavailable",
            "jira-service-management": "available",
            "zammad": "unavailable"
          },
          "note": "JSM's free tier is capped at 3 agents; Zammad's hosted plans start from roughly EUR 7 per agent per month with no free hosted option."
        }
      ]
    },
    {
      "group": "Core Ticketing",
      "rows": [
        {
          "feature": "Multichannel inbox (email, chat, social, SMS)",
          "statuses": {
            "happyfox": "available",
            "jira-service-management": "limited",
            "zammad": "available"
          },
          "note": "Zammad adds Telegram, Facebook, and WhatsApp on higher tiers; JSM is centered on its service portal and on-call notification channels."
        },
        {
          "feature": "SLA management",
          "statuses": {
            "happyfox": "not-documented",
            "jira-service-management": "available",
            "zammad": "available"
          }
        },
        {
          "feature": "Self-service knowledge base",
          "statuses": {
            "happyfox": "available",
            "jira-service-management": "available",
            "zammad": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "Workflow automation (triggers, rules, schedulers)",
          "statuses": {
            "happyfox": "available",
            "jira-service-management": "available",
            "zammad": "available"
          }
        },
        {
          "feature": "AI-assisted responses",
          "statuses": {
            "happyfox": "available",
            "jira-service-management": "limited",
            "zammad": "limited"
          },
          "note": "JSM's AI is Premium-tier only; Zammad's AI features are optional and billed per call on top of the subscription."
        }
      ]
    },
    {
      "group": "IT Service Management",
      "rows": [
        {
          "feature": "ITIL-aligned incident and change management",
          "statuses": {
            "happyfox": "available",
            "jira-service-management": "available",
            "zammad": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is the cheapest way to run a helpdesk long-term?",
      "answer": "Zammad's self-hosted Community edition is free and open source with no license cost, though you take on your own server management and updates."
    },
    {
      "question": "Do I need to self-host to use Zammad?",
      "answer": "No. Zammad also offers a hosted cloud edition on German, ISO27001-certified data centers, starting around EUR 7 per agent per month on annual billing for up to 5 agents."
    },
    {
      "question": "Which tool best supports GDPR or data-residency requirements?",
      "answer": "Zammad's hosted cloud plans run on German data centers designed for GDPR-friendly data residency, which neither HappyFox nor Jira Service Management specifically markets as a differentiator."
    },
    {
      "question": "Is Jira Service Management overkill for a small customer support team?",
      "answer": "It can be. JSM's free tier works for teams of 3 agents or fewer, but its deeper value - CMDB, major incident management, on-call scheduling - is aimed at IT and DevOps workloads rather than general customer support."
    },
    {
      "question": "Which platform bundles AI without extra per-use charges?",
      "answer": "HappyFox includes its AI Copilot suite in the Pro tier price, while Zammad bills AI features separately per call and Jira Service Management restricts AI to its higher-priced Premium tier."
    },
    {
      "question": "Can HappyFox handle IT ticketing as well as customer support?",
      "answer": "Yes. HappyFox includes a dedicated ITIL-style Service Desk module alongside its core Help Desk, so IT and customer support teams can share one ticketing backbone."
    }
  ]
};

export default happyfoxVsJiraServiceManagementVsZammadContent;

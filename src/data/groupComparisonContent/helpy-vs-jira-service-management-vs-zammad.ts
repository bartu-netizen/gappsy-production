import type { GroupComparisonContent } from './types';

const helpyVsJiraServiceManagementVsZammadContent: GroupComparisonContent = {
  "verdict": "Before comparing features, it is worth confirming these three solve the same problem for you: Helpy and Zammad are general-purpose, open-source customer support helpdesks, while Jira Service Management is primarily an IT service management platform built around ITIL-style incident, change, and problem management for internal IT and DevOps teams. For teams that specifically need a self-hosted, open-source ticketing system, Helpy and Zammad are the more direct comparison, with Helpy's included AI agent and Zammad's wider channel list as the main differentiators. For teams whose real need is IT service management tightly coupled to Jira and Confluence, Jira Service Management is the stronger fit despite its higher price at scale.",
  "bestFor": {
    "helpy": "Teams that want a genuinely free, MIT-licensed, self-hosted helpdesk with GDPR-compliant data tools and an included AI agent (Carin) aimed at resolving most tier-one tickets automatically.",
    "jira-service-management": "IT and DevOps teams already using Jira and Confluence that need ITIL-aligned incident, change, and problem management along with on-call alerting built in via Opsgenie.",
    "zammad": "Cost-conscious support teams, or those migrating from OTRS, that need multichannel ticketing across email, chat, Telegram, Facebook, and WhatsApp with either free self-hosting or GDPR-friendly German-hosted cloud plans."
  },
  "highlights": [
    {
      "title": "These solve different core problems",
      "description": "Jira Service Management is purpose-built for internal IT service management (incidents, changes, on-call alerting), while Helpy and Zammad are general-purpose, customer-facing support helpdesks; buyers should confirm which problem they are solving before comparing the three further.",
      "toolSlugs": [
        "helpy",
        "jira-service-management",
        "zammad"
      ]
    },
    {
      "title": "Self-hosting is a Helpy and Zammad feature, not a Jira Service Management one",
      "description": "Helpy and Zammad both offer a fully free, self-hosted open-source core that any team can run on its own infrastructure. The provided data documents no self-hosted option for Jira Service Management, which runs as cloud-native SaaS.",
      "toolSlugs": [
        "helpy",
        "zammad"
      ]
    },
    {
      "title": "All three have a free entry point, but the shape differs",
      "description": "Helpy offers a free cloud tier for up to 3 agents, Jira Service Management offers a free tier capped at 3 agents, and Zammad's free option is its fully self-hosted Community edition rather than a limited-agent hosted plan.",
      "toolSlugs": [
        "helpy",
        "jira-service-management",
        "zammad"
      ]
    },
    {
      "title": "Built-in AI shows up differently on each platform",
      "description": "Helpy's Carin agent is designed to autonomously resolve up to 90% of tier-one questions, Zammad offers optional AI features like language detection and reply suggestions billed per call, and Jira Service Management includes AI features starting at its Premium tier without further detail in the provided data.",
      "toolSlugs": [
        "helpy",
        "jira-service-management",
        "zammad"
      ]
    },
    {
      "title": "Zammad documents the widest customer channel list",
      "description": "Zammad's channel list spans email, SMS, chat, Telegram, Facebook, and WhatsApp, versus Helpy's email, widget, and community-forum channels and Jira Service Management's incident-alerting channels (SMS, email, push, chat, voice) aimed at on-call notifications rather than customer messaging.",
      "toolSlugs": [
        "zammad",
        "helpy",
        "jira-service-management"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Access",
      "rows": [
        {
          "feature": "Free, fully self-hosted open-source edition",
          "statuses": {
            "helpy": "available",
            "jira-service-management": "unavailable",
            "zammad": "available"
          }
        },
        {
          "feature": "Free tier for very small teams",
          "statuses": {
            "helpy": "available",
            "jira-service-management": "available",
            "zammad": "unavailable"
          },
          "note": "Helpy and Jira Service Management both cap their free tier at 3 agents; Zammad's free option is self-hosting rather than a limited-agent hosted plan."
        }
      ]
    },
    {
      "group": "Support Workflow and Channels",
      "rows": [
        {
          "feature": "ITIL-aligned change/incident management",
          "statuses": {
            "helpy": "not-documented",
            "jira-service-management": "available",
            "zammad": "not-documented"
          }
        },
        {
          "feature": "On-call scheduling and alerting",
          "statuses": {
            "helpy": "not-documented",
            "jira-service-management": "available",
            "zammad": "not-documented"
          },
          "note": "Built into Jira Service Management via its integrated Opsgenie capabilities."
        },
        {
          "feature": "Multichannel customer messaging (chat, social, SMS)",
          "statuses": {
            "helpy": "limited",
            "jira-service-management": "limited",
            "zammad": "available"
          },
          "note": "Zammad documents the widest list (email, SMS, chat, Telegram, Facebook, WhatsApp); Helpy covers email and widget/forum channels; Jira Service Management's documented channels are focused on incident alerting rather than customer-facing messaging."
        }
      ]
    },
    {
      "group": "AI and Self-Service",
      "rows": [
        {
          "feature": "Built-in AI support agent/assistant",
          "statuses": {
            "helpy": "available",
            "jira-service-management": "available",
            "zammad": "available"
          },
          "note": "Helpy's Carin agent, Zammad's pay-per-call AI features, and Jira Service Management's Premium-tier AI features all differ in scope."
        },
        {
          "feature": "Searchable knowledge base",
          "statuses": {
            "helpy": "available",
            "jira-service-management": "available",
            "zammad": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Jira Service Management really the same type of tool as Helpy and Zammad?",
      "answer": "Not exactly. Jira Service Management is primarily an IT service management platform for incident, change, and problem management, while Helpy and Zammad are general-purpose customer support helpdesks. They overlap on ticketing and knowledge base basics, but they are built for different core use cases."
    },
    {
      "question": "Can I self-host any of these for free?",
      "answer": "Yes, both Helpy and Zammad offer a fully free, open-source, self-hosted edition. Jira Service Management, based on the provided data, runs as cloud-native SaaS with no documented self-hosted option."
    },
    {
      "question": "Which of these includes AI-powered ticket resolution?",
      "answer": "All three offer some form of built-in AI. Helpy's Carin agent aims to autonomously resolve up to 90% of tier-one questions, Zammad offers optional pay-per-call AI features like language detection and reply suggestions, and Jira Service Management includes AI features starting at its Premium tier."
    },
    {
      "question": "Which supports the most customer channels, like WhatsApp or Telegram?",
      "answer": "Zammad documents the widest channel list of the three, covering email, SMS, chat, Telegram, Facebook, and WhatsApp on its higher hosted tiers. Helpy's documented channels center on email and an embeddable widget plus community forums."
    },
    {
      "question": "Do any of these offer on-call incident alerting?",
      "answer": "Only Jira Service Management, which bundles Opsgenie-derived on-call scheduling and alerting into its cloud editions. This is not documented as a feature of Helpy or Zammad."
    },
    {
      "question": "Which is the best fit for a small support team on a tight budget?",
      "answer": "Helpy or Zammad are the stronger fits for a small, budget-conscious support team, since both offer a genuinely free self-hosted open-source edition. Jira Service Management's free tier is capped at 3 agents and its paid tiers rise quickly for IT-service-management features like a CMDB and major incident management."
    }
  ]
};

export default helpyVsJiraServiceManagementVsZammadContent;

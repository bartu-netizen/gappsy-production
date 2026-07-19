import type { GroupComparisonContent } from './types';

const freshdeskVsFrontVsHelpScoutContent: GroupComparisonContent = {
  "verdict": "Freshdesk, Front, and Help Scout are all shared-inbox helpdesk platforms for small-to-midsize support teams, but they start from different philosophies. Freshdesk leans traditional-ticketing with the broadest built-in feature set (including field service management) at a low entry price. Front reframes support as collaborative 'customer operations' with live presence and shared drafts aimed at teams spanning support, sales, and account management. Help Scout stays the simplest and cheapest of the three, with a genuine permanent free plan for small teams. None is a strict upgrade over the others; the right pick depends on whether you want ticket-queue structure, inbox-style collaboration, or the lowest cost of entry.",
  "bestFor": {
    "freshdesk": "Growing support teams that want full omnichannel ticketing, field service dispatch, and AI automation without enterprise-grade pricing.",
    "front": "Support, sales, and account teams that want a collaborative shared inbox with live presence and co-authored replies instead of a ticket queue.",
    "help-scout": "Small teams and startups that want a simple, affordable, email-native help desk and a genuine free plan to start on."
  },
  "highlights": [
    {
      "title": "Freshdesk pairs ticketing with field service",
      "description": "Freshdesk is the only one of the three with field service management for scheduling and dispatching on-site technicians alongside standard support tickets, useful for hybrid remote/on-site support operations.",
      "toolSlugs": [
        "freshdesk"
      ]
    },
    {
      "title": "Front is built for real-time team collaboration",
      "description": "Front's Live Activity shows when a teammate is viewing or drafting a reply, and shared drafts let multiple people co-author a response before it goes out, reducing duplicate replies in a way that goes beyond typical collision detection.",
      "toolSlugs": [
        "front"
      ]
    },
    {
      "title": "Help Scout has the only permanent free plan",
      "description": "Help Scout offers a free plan for up to 5 users with 1 inbox and 1 Docs site, while Freshdesk's free tier is a time-limited 6-month program and Front has no free plan at all.",
      "toolSlugs": [
        "help-scout"
      ]
    },
    {
      "title": "AI reply drafting is available everywhere, but priced differently",
      "description": "All three now offer AI-assisted reply drafting, but Freshdesk's Freddy AI Copilot and Front's Copilot are separate paid add-ons, while Help Scout bundles unlimited AI Drafts into its Standard plan.",
      "toolSlugs": [
        "freshdesk",
        "front",
        "help-scout"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Inbox and Ticketing",
      "rows": [
        {
          "feature": "Shared or collaborative inbox",
          "statuses": {
            "freshdesk": "available",
            "front": "available",
            "help-scout": "available"
          }
        },
        {
          "feature": "Self-service knowledge base",
          "statuses": {
            "freshdesk": "available",
            "front": "not-documented",
            "help-scout": "available"
          },
          "note": "Front's published feature set does not include a standalone knowledge base product."
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted reply drafting",
          "statuses": {
            "freshdesk": "available",
            "front": "available",
            "help-scout": "available"
          },
          "note": "Freshdesk's Freddy AI Copilot and Front's Copilot are priced as add-ons; Help Scout's AI Drafts are included from the Standard plan."
        },
        {
          "feature": "Autonomous AI ticket resolution",
          "statuses": {
            "freshdesk": "limited",
            "front": "available",
            "help-scout": "limited"
          },
          "note": "Freshdesk's self-service agent and Help Scout's pay-per-resolution AI Answers are narrower than Front's Autopilot omnichannel AI agent."
        }
      ]
    },
    {
      "group": "Channels and Collaboration",
      "rows": [
        {
          "feature": "Omnichannel messaging (chat, SMS, social, WhatsApp)",
          "statuses": {
            "freshdesk": "available",
            "front": "available",
            "help-scout": "available"
          }
        },
        {
          "feature": "Live presence or duplicate-reply prevention",
          "statuses": {
            "freshdesk": "available",
            "front": "available",
            "help-scout": "available"
          },
          "note": "Freshdesk and Help Scout use collision detection; Front's Live Activity shows real-time drafting presence."
        }
      ]
    },
    {
      "group": "Plans and Scale",
      "rows": [
        {
          "feature": "Permanent free-forever plan",
          "statuses": {
            "freshdesk": "unavailable",
            "front": "unavailable",
            "help-scout": "available"
          },
          "note": "Freshdesk's free option is a time-limited 6-month program, not a permanent free tier."
        },
        {
          "feature": "Field service management",
          "statuses": {
            "freshdesk": "available",
            "front": "unavailable",
            "help-scout": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Freshdesk, Front, and Help Scout has a free plan?",
      "answer": "Help Scout has a permanent free plan for up to 5 users, 1 inbox, and 1 Docs site. Freshdesk offers a free program limited to 2 agents for 6 months rather than a permanent free tier. Front has no free plan."
    },
    {
      "question": "What is the cheapest paid plan across the three?",
      "answer": "Freshdesk's Growth plan starts at $19 per agent per month (annual billing), which is lower than Help Scout's Standard plan at $25 per user per month and Front's Starter plan at $25 per seat per month."
    },
    {
      "question": "Which tool is best if support, sales, and account management all need to collaborate in one inbox?",
      "answer": "Front is positioned as a customer operations platform rather than a pure support helpdesk, with Live Activity and shared drafts designed for cross-functional teams working out of the same inbox."
    },
    {
      "question": "Does any of these three include field service management for on-site technicians?",
      "answer": "Only Freshdesk includes field service management, letting teams schedule and dispatch on-site technicians alongside standard support tickets."
    },
    {
      "question": "How do the AI features differ between Freshdesk, Front, and Help Scout?",
      "answer": "Freshdesk's Freddy AI Copilot and Front's Copilot are both separate paid add-ons layered onto their base plans, while Help Scout includes unlimited AI Drafts starting on its Standard plan and offers AI Answers as a separate pay-per-resolution add-on for automated ticket closure."
    },
    {
      "question": "Which is the simplest option for a very small team just getting started?",
      "answer": "Help Scout is generally the simplest starting point, with a free plan for up to 5 users and an email-inbox-style interface that avoids traditional ticket-queue complexity."
    }
  ]
};

export default freshdeskVsFrontVsHelpScoutContent;

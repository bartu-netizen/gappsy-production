import type { GroupComparisonContent } from './types';

const freshdeskVsHelpScoutVsIntercomContent: GroupComparisonContent = {
  "verdict": "Freshdesk and Help Scout are both traditional, email- and ticket-centric helpdesks at accessible per-seat prices, while Intercom is built AI-first around Fin, an autonomous resolution agent billed per outcome rather than bundled into a seat price. Intercom can cut human agent workload the most aggressively but makes total cost harder to predict for high-volume teams, while Freshdesk adds field service management and Help Scout keeps the lowest, simplest cost of entry with a real free plan. None of the three is a universal winner; the differentiator is how much of the support workload you want an AI agent to own versus a human-first inbox.",
  "bestFor": {
    "freshdesk": "Teams that want an affordable, broad-channel helpdesk with field service dispatch included alongside standard ticketing.",
    "help-scout": "Small teams and startups that want the simplest, most affordable, email-native support tool with a genuine free plan.",
    "intercom": "Mid-market and enterprise teams that want an AI-first support stack where Fin autonomously resolves a large share of routine tickets."
  },
  "highlights": [
    {
      "title": "Intercom is built around an autonomous AI resolution agent",
      "description": "Fin reads a company's help center and support history to resolve customer questions across chat, email, and voice on its own, escalating to humans only when needed, and is billed at $0.99 per successful resolution rather than bundled into seat pricing.",
      "toolSlugs": [
        "intercom"
      ]
    },
    {
      "title": "Help Scout is the only one with a permanent free plan",
      "description": "Help Scout's free plan supports up to 5 users, 1 inbox, and 1 Docs site at no cost, while Freshdesk's free option is a time-limited 6-month program and Intercom has no free tier.",
      "toolSlugs": [
        "help-scout"
      ]
    },
    {
      "title": "Freshdesk adds field service management and undercuts Intercom on entry price",
      "description": "Freshdesk's Growth plan starts at $19 per agent per month, below Intercom's $29 per seat Essential plan, and Freshdesk is the only one of the three offering field service scheduling and dispatch for on-site technicians.",
      "toolSlugs": [
        "freshdesk"
      ]
    },
    {
      "title": "AI costs stack very differently across the three",
      "description": "Freshdesk's Freddy AI Copilot is a flat per-agent add-on, Help Scout's AI Answers charges per resolution on top of a base subscription, and Intercom's Fin is priced per resolution as a core part of the product rather than an optional extra.",
      "toolSlugs": [
        "freshdesk",
        "help-scout",
        "intercom"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Inbox and Ticketing",
      "rows": [
        {
          "feature": "Shared or collaborative inbox",
          "statuses": {
            "freshdesk": "available",
            "help-scout": "available",
            "intercom": "available"
          }
        },
        {
          "feature": "Self-service knowledge base or help center",
          "statuses": {
            "freshdesk": "available",
            "help-scout": "available",
            "intercom": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted reply drafting for human agents",
          "statuses": {
            "freshdesk": "available",
            "help-scout": "available",
            "intercom": "available"
          },
          "note": "Freshdesk's Freddy AI Copilot is a paid add-on; Help Scout's AI Drafts are included from Standard; Intercom's Fin Copilot supports human agents directly."
        },
        {
          "feature": "Autonomous AI ticket resolution",
          "statuses": {
            "freshdesk": "limited",
            "help-scout": "limited",
            "intercom": "available"
          },
          "note": "Intercom's Fin is a core, resolution-billed AI agent, while Freshdesk's self-service agent and Help Scout's AI Answers are narrower, add-on style tools."
        }
      ]
    },
    {
      "group": "Channels and Engagement",
      "rows": [
        {
          "feature": "Omnichannel messaging (chat, email, voice, WhatsApp)",
          "statuses": {
            "freshdesk": "available",
            "help-scout": "available",
            "intercom": "available"
          }
        },
        {
          "feature": "Proactive outbound messaging (banners, tours, campaigns)",
          "statuses": {
            "freshdesk": "not-documented",
            "help-scout": "not-documented",
            "intercom": "available"
          }
        }
      ]
    },
    {
      "group": "Plans and Cost Structure",
      "rows": [
        {
          "feature": "Permanent free-forever plan",
          "statuses": {
            "freshdesk": "unavailable",
            "help-scout": "available",
            "intercom": "unavailable"
          },
          "note": "Freshdesk's free option is a time-limited 6-month program, not a permanent free tier."
        },
        {
          "feature": "Field service management",
          "statuses": {
            "freshdesk": "available",
            "help-scout": "unavailable",
            "intercom": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Freshdesk, Help Scout, and Intercom has a free plan?",
      "answer": "Only Help Scout has a permanent free plan, supporting up to 5 users, 1 inbox, and 1 Docs site. Freshdesk offers a time-limited 6-month free program capped at 2 agents, and Intercom has no free tier."
    },
    {
      "question": "How does Intercom's Fin AI Agent pricing work?",
      "answer": "Fin is billed at $0.99 per successful resolution regardless of how many messages that resolution took, and it can also be deployed standalone on top of an existing helpdesk without requiring additional seat licenses."
    },
    {
      "question": "Which is the cheapest to start with?",
      "answer": "Freshdesk's Growth plan starts at $19 per agent per month, below Help Scout's Standard plan at $25 per user per month and Intercom's Essential plan at $29 per seat per month billed annually."
    },
    {
      "question": "Which tool is best for a team that wants AI to handle most routine tickets automatically?",
      "answer": "Intercom is the most AI-first of the three, built around Fin as an autonomous resolution agent rather than treating AI as an add-on feature layered onto a traditional ticketing system."
    },
    {
      "question": "Does any of these three include field service management for dispatching on-site technicians?",
      "answer": "Only Freshdesk includes field service management alongside standard ticketing; neither Help Scout nor Intercom offers this."
    },
    {
      "question": "Which is simplest for a small team just getting started?",
      "answer": "Help Scout is generally the simplest and lowest-cost starting point, with a free plan and an email-inbox-style interface, compared to Intercom's more complex, AI-usage-based pricing and Freshdesk's broader but more ticket-centric feature set."
    }
  ]
};

export default freshdeskVsHelpScoutVsIntercomContent;

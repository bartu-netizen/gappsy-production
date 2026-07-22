import type { GroupComparisonContent } from './types';

const happyfoxVsHelpyVsKommunicateContent: GroupComparisonContent = {
  "verdict": "HappyFox, Helpy, and Kommunicate all serve customer support teams, but they solve different pieces of the problem: HappyFox is a mature, AI-assisted omnichannel ticketing suite aimed at customer service, IT, and HR teams, Helpy is a free, self-hostable, open-source helpdesk with community forums, and Kommunicate is built around an AI chatbot with live chat and human handoff rather than traditional ticketing. Teams that need broad channel coverage and flexible per-agent or unlimited-agent pricing tend to favor HappyFox, cost-conscious teams that want full control favor Helpy, and teams focused on deflecting inbound chat with a bot before it reaches an agent favor Kommunicate. There is no single best answer; the right pick depends on whether ticketing depth, self-hosting, or conversational AI is the priority.",
  "bestFor": {
    "happyfox": "mid-size to large customer service, IT, and HR teams that want a mature omnichannel ticketing suite with per-agent or unlimited-agent pricing",
    "helpy": "teams that want a free, self-hostable, open-source helpdesk with community forums built in",
    "kommunicate": "teams that want to deploy an AI chatbot with live chat and human handoff across web, mobile, and messaging channels"
  },
  "highlights": [
    {
      "title": "HappyFox pairs an AI Copilot suite with unlimited-agent pricing",
      "description": "HappyFox offers an AI Copilot suite for ticket triage and response assistance, plus a flat annual fee unlimited-agent pricing option for larger teams, something neither Helpy nor Kommunicate documents.",
      "toolSlugs": [
        "happyfox"
      ]
    },
    {
      "title": "Helpy is the only genuinely free, open-source option",
      "description": "Helpy's MIT-licensed Community Edition costs nothing to self-host, while HappyFox starts at $24/agent/month and Kommunicate starts at $40/month with no permanently free tier.",
      "toolSlugs": [
        "helpy"
      ]
    },
    {
      "title": "Kommunicate centers on an AI chatbot builder with human handoff",
      "description": "Kommunicate's Kompose chatbot builder plus a clear human handoff path is a dedicated conversational-AI capability that HappyFox and Helpy do not offer as a core product.",
      "toolSlugs": [
        "kommunicate"
      ]
    },
    {
      "title": "Pricing models diverge sharply across the three",
      "description": "HappyFox charges per agent (or a flat unlimited-agent fee), Helpy is free to self-host with paid cloud tiers, and Kommunicate charges by conversation volume, so total cost scales very differently depending on team size and chat volume.",
      "toolSlugs": [
        "happyfox",
        "helpy",
        "kommunicate"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Ticketing and Channels",
      "rows": [
        {
          "feature": "Omnichannel ticketing (email, chat, phone, social)",
          "statuses": {
            "happyfox": "available",
            "helpy": "available",
            "kommunicate": "limited"
          },
          "note": "Kommunicate is centered on live chat and messaging rather than full multichannel ticketing."
        },
        {
          "feature": "Dedicated AI chatbot builder",
          "statuses": {
            "happyfox": "not-documented",
            "helpy": "unavailable",
            "kommunicate": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted agent responses",
          "statuses": {
            "happyfox": "available",
            "helpy": "available",
            "kommunicate": "available"
          }
        },
        {
          "feature": "Workflow automation",
          "statuses": {
            "happyfox": "available",
            "helpy": "not-documented",
            "kommunicate": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Pricing",
      "rows": [
        {
          "feature": "Self-hosted / open-source option",
          "statuses": {
            "happyfox": "unavailable",
            "helpy": "available",
            "kommunicate": "unavailable"
          }
        },
        {
          "feature": "Unlimited-agent pricing option",
          "statuses": {
            "happyfox": "available",
            "helpy": "not-documented",
            "kommunicate": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Knowledge Base and Self-Service",
      "rows": [
        {
          "feature": "Self-service knowledge base",
          "statuses": {
            "happyfox": "available",
            "helpy": "available",
            "kommunicate": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool is best for adding an AI chatbot to a website or app?",
      "answer": "Kommunicate, since its Kompose chatbot builder and human handoff flow are purpose-built for AI-driven live chat and messaging support."
    },
    {
      "question": "Can I use Helpy for free indefinitely?",
      "answer": "Yes, Helpy's MIT-licensed Community Edition is free to self-host with no artificial feature caps, unlike HappyFox and Kommunicate, which have no permanently free tier."
    },
    {
      "question": "Does HappyFox offer unlimited-agent pricing?",
      "answer": "Yes, HappyFox offers Unlimited Agent Plans priced as a flat annual fee with a fixed yearly ticket allowance, in addition to its per-agent Basic, Team, and Pro plans."
    },
    {
      "question": "Which of the three has the widest support channel coverage out of the box?",
      "answer": "HappyFox and Helpy both offer full omnichannel ticketing across email, chat, phone, and social, while Kommunicate is more narrowly focused on live chat and messaging."
    },
    {
      "question": "Do HappyFox and Kommunicate offer free trials?",
      "answer": "Yes, both offer trials with no credit card required, a 14-day trial for HappyFox and a 30-day trial for Kommunicate."
    },
    {
      "question": "Which of the three tools is open source?",
      "answer": "Only Helpy is open source; HappyFox and Kommunicate are closed-source, commercially licensed SaaS products."
    }
  ]
};

export default happyfoxVsHelpyVsKommunicateContent;

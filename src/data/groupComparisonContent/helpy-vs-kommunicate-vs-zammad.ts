import type { GroupComparisonContent } from './types';

const helpyVsKommunicateVsZammadContent: GroupComparisonContent = {
  "verdict": "Helpy and Zammad are both open-source, self-hostable helpdesks built around ticketing, while Kommunicate takes a different approach centered on an AI chatbot builder with live chat and human handoff. Helpy adds community forums to its free Community Edition, Zammad adds stronger SLA management and automation triggers plus GDPR-friendly EU-hosted plans, and Kommunicate trades self-hosting entirely for a conversation-based subscription aimed at deflecting chat volume with AI before it reaches a human agent. Choosing between them comes down to whether you need traditional multichannel ticketing with self-hosting control, or a dedicated conversational AI layer on top of existing support tools.",
  "bestFor": {
    "helpy": "teams that want a free, MIT-licensed, self-hostable helpdesk with community forums built in alongside ticketing",
    "kommunicate": "teams that want to deploy an AI chatbot with live chat and human handoff across web, mobile, and messaging channels",
    "zammad": "teams that want an open-source ticketing system with strong SLA management, automation, and GDPR-friendly EU-hosted data residency"
  },
  "highlights": [
    {
      "title": "Helpy and Zammad are both free to self-host",
      "description": "Helpy's Community Edition and Zammad's self-hosted Community plan are both open source and free to run, while Kommunicate has no self-hosted or free tier and starts at $40/month.",
      "toolSlugs": [
        "helpy",
        "zammad"
      ]
    },
    {
      "title": "Kommunicate is built around an AI chatbot, not ticketing",
      "description": "Kommunicate's Kompose chatbot builder, AI conversation summaries, and agent assist are a distinct product focus from the ticketing-centric designs of Helpy and Zammad.",
      "toolSlugs": [
        "kommunicate"
      ]
    },
    {
      "title": "Zammad adds SLA management and EU data residency",
      "description": "Zammad includes SLA management, triggers and schedulers, and German-hosted cloud plans for GDPR-friendly data residency, capabilities not documented for Helpy or Kommunicate.",
      "toolSlugs": [
        "zammad"
      ]
    },
    {
      "title": "Helpy pairs ticketing with community forums",
      "description": "Helpy bundles community forums and a knowledge base with its ticketing system, giving customers a self-service and discussion space that Zammad and Kommunicate don't offer.",
      "toolSlugs": [
        "helpy"
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
            "helpy": "available",
            "kommunicate": "limited",
            "zammad": "available"
          },
          "note": "Kommunicate is centered on live chat and messaging rather than full multichannel ticketing."
        },
        {
          "feature": "Dedicated AI chatbot builder",
          "statuses": {
            "helpy": "unavailable",
            "kommunicate": "available",
            "zammad": "unavailable"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted responses",
          "statuses": {
            "helpy": "available",
            "kommunicate": "available",
            "zammad": "limited"
          },
          "note": "Zammad's AI features are optional and carry an additional per-call usage fee."
        },
        {
          "feature": "Workflow automation and triggers",
          "statuses": {
            "helpy": "not-documented",
            "kommunicate": "not-documented",
            "zammad": "available"
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
            "helpy": "available",
            "kommunicate": "unavailable",
            "zammad": "available"
          }
        },
        {
          "feature": "Free tier available",
          "statuses": {
            "helpy": "available",
            "kommunicate": "unavailable",
            "zammad": "available"
          }
        }
      ]
    },
    {
      "group": "Knowledge Base and Extras",
      "rows": [
        {
          "feature": "Searchable knowledge base",
          "statuses": {
            "helpy": "available",
            "kommunicate": "not-documented",
            "zammad": "available"
          }
        },
        {
          "feature": "SLA management",
          "statuses": {
            "helpy": "not-documented",
            "kommunicate": "not-documented",
            "zammad": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Helpy and Zammad both free to self-host?",
      "answer": "Yes, both offer a free, open-source, self-hostable Community edition, while Kommunicate has no self-hosted or free tier and starts at $40/month."
    },
    {
      "question": "Which tool is best for an AI-powered live chat widget?",
      "answer": "Kommunicate, since its Kompose chatbot builder, AI conversation summaries, and human handoff are purpose-built for AI-driven live chat and messaging."
    },
    {
      "question": "Does Zammad charge extra for AI features?",
      "answer": "Yes, Zammad's AI features are optional and carry an additional per-call usage fee on top of the base subscription."
    },
    {
      "question": "Which of the three has community forums built in?",
      "answer": "Only Helpy includes built-in community forums alongside its ticketing and knowledge base."
    },
    {
      "question": "Is Kommunicate open source?",
      "answer": "No, Kommunicate is a closed-source, commercially licensed SaaS product, unlike Helpy and Zammad, which are both open source."
    },
    {
      "question": "Which tool offers GDPR-friendly EU data hosting?",
      "answer": "Zammad, through its Berlin-headquartered, German-hosted cloud plans; this is not documented as an option for Helpy or Kommunicate."
    }
  ]
};

export default helpyVsKommunicateVsZammadContent;

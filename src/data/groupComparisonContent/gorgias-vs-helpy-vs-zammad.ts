import type { GroupComparisonContent } from './types';

const gorgiasVsHelpyVsZammadContent: GroupComparisonContent = {
  "verdict": "Gorgias, Helpy, and Zammad all handle multichannel support ticketing, but they target different buyers: Gorgias is built specifically for ecommerce and Shopify stores with an AI agent tuned for both support and sales, while Helpy and Zammad are open-source, self-hostable helpdesks that trade Gorgias's commerce-native polish for free deployment and deep customization. Helpy leans toward smaller teams that want built-in community forums alongside ticketing, while Zammad adds stronger SLA management, automation triggers, and EU-based hosted plans for teams that need GDPR-friendly data residency. None of the three is a universal winner; the right choice depends on whether ecommerce integration, cost, or self-hosted control matters most.",
  "bestFor": {
    "gorgias": "Shopify and ecommerce stores that want an AI agent handling both support resolution and pre-purchase sales in one omnichannel inbox",
    "helpy": "budget-conscious teams that want a genuinely free, MIT-licensed, self-hostable helpdesk with community forums built in",
    "zammad": "technical teams that want an open-source ticketing system with strong automation, custom objects, and GDPR-friendly EU-hosted plans"
  },
  "highlights": [
    {
      "title": "Gorgias is purpose-built for ecommerce, not general support",
      "description": "Gorgias offers deep, real-time Shopify integration and an AI Shopping Assistant that handles pre-purchase questions alongside support tickets, a use case Helpy and Zammad do not target.",
      "toolSlugs": [
        "gorgias"
      ]
    },
    {
      "title": "Helpy and Zammad both offer genuinely free, self-hosted editions",
      "description": "Both are open source: Helpy's Community Edition and Zammad's self-hosted Community plan cost nothing to run, unlike Gorgias, which starts at $10/month for 50 tickets with no free tier.",
      "toolSlugs": [
        "helpy",
        "zammad"
      ]
    },
    {
      "title": "Zammad adds SLA management and EU data residency",
      "description": "Zammad includes SLA management, triggers and schedulers, and German-hosted cloud plans for teams that need GDPR-friendly data residency, features not documented for Helpy or Gorgias.",
      "toolSlugs": [
        "zammad"
      ]
    },
    {
      "title": "Helpy bundles community forums with its helpdesk",
      "description": "Helpy pairs ticketing and a knowledge base with built-in community forums, letting customers self-serve and discuss in one product, a combination Gorgias and Zammad don't offer.",
      "toolSlugs": [
        "helpy"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Ticketing and Channels",
      "rows": [
        {
          "feature": "Omnichannel ticketing (email, chat, social, phone)",
          "statuses": {
            "gorgias": "available",
            "helpy": "available",
            "zammad": "available"
          }
        },
        {
          "feature": "Native ecommerce/Shopify integration",
          "statuses": {
            "gorgias": "available",
            "helpy": "unavailable",
            "zammad": "unavailable"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "Built-in AI support agent",
          "statuses": {
            "gorgias": "available",
            "helpy": "available",
            "zammad": "limited"
          },
          "note": "Zammad's AI features are optional and carry an additional per-call usage fee."
        },
        {
          "feature": "Workflow automation and triggers",
          "statuses": {
            "gorgias": "available",
            "helpy": "not-documented",
            "zammad": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Cost",
      "rows": [
        {
          "feature": "Self-hosted / open-source option",
          "statuses": {
            "gorgias": "unavailable",
            "helpy": "available",
            "zammad": "available"
          }
        },
        {
          "feature": "Free tier available",
          "statuses": {
            "gorgias": "unavailable",
            "helpy": "available",
            "zammad": "available"
          }
        }
      ]
    },
    {
      "group": "Knowledge Base and Community",
      "rows": [
        {
          "feature": "Searchable knowledge base",
          "statuses": {
            "gorgias": "not-documented",
            "helpy": "available",
            "zammad": "available"
          }
        },
        {
          "feature": "Community forums",
          "statuses": {
            "gorgias": "unavailable",
            "helpy": "available",
            "zammad": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Gorgias, Helpy, and Zammad is best for a Shopify store?",
      "answer": "Gorgias, since it offers deep, real-time Shopify integration and an AI Shopping Assistant built specifically for ecommerce support and sales, which Helpy and Zammad do not provide."
    },
    {
      "question": "Can I self-host Helpy or Zammad for free?",
      "answer": "Yes. Both offer a free, open-source, self-hostable Community edition, while Gorgias has no self-hosted or free option and starts at $10/month for 50 tickets."
    },
    {
      "question": "Does Gorgias offer a free plan?",
      "answer": "No. Gorgias's lowest tier is the Starter plan at $10/month for 50 tickets, with pricing scaling up through Basic, Pro, Advanced, and custom Enterprise plans."
    },
    {
      "question": "Which tool has built-in AI support features?",
      "answer": "Gorgias includes an AI Support Agent and AI Shopping Assistant, Helpy includes a Carin AI agent, and Zammad offers optional AI features that carry an additional per-call usage fee."
    },
    {
      "question": "Is Zammad or Helpy better for GDPR and EU data residency?",
      "answer": "Zammad, since it explicitly offers German-hosted cloud plans for GDPR-friendly data residency; Helpy's cloud hosting terms are less transparent without contacting sales."
    },
    {
      "question": "Do any of these three tools include community forums?",
      "answer": "Only Helpy includes built-in community forums alongside its ticketing and knowledge base; this is not documented as a feature of Gorgias or Zammad."
    }
  ]
};

export default gorgiasVsHelpyVsZammadContent;

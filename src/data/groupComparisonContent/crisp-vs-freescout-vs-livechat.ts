import type { GroupComparisonContent } from './types';

const crispVsFreescoutVsLivechatContent: GroupComparisonContent = {
  "verdict": "Crisp, FreeScout, and LiveChat all put a shared inbox and live chat widget at the center of the product, but they solve the pricing and ownership question in very different ways. Crisp keeps a genuinely usable free tier and prices paid plans per workspace rather than per agent, which helps growing teams control costs. FreeScout removes licensing cost entirely by being free, open-source, and self-hosted, trading convenience for full data ownership. LiveChat is the most polished and financially stable of the three, backed by a publicly traded parent company, but it charges per agent seat and has no permanent free plan.",
  "bestFor": {
    "crisp": "Small e-commerce or SaaS teams that want live chat, email, and an AI chatbot bundled into one affordable, per-workspace-priced inbox with a genuinely useful free tier.",
    "freescout": "Budget-conscious or privacy-focused teams willing to self-host who want unlimited agents, tickets, and mailboxes without recurring per-seat licensing fees.",
    "livechat": "Support teams that want a mature, financially transparent, per-agent-priced chat platform with strong analytics, staffing prediction, and an AI-plus-human inbox."
  },
  "highlights": [
    {
      "title": "Three different pricing philosophies",
      "description": "Crisp charges per workspace regardless of exact seat count within a tier, FreeScout is free to self-host with paid modules for extras, and LiveChat charges per agent seat on an annual subscription.",
      "toolSlugs": [
        "crisp",
        "freescout",
        "livechat"
      ]
    },
    {
      "title": "Only FreeScout is self-hosted",
      "description": "FreeScout runs on a team's own PHP and MySQL infrastructure, giving full control over support data, while Crisp and LiveChat are cloud-only SaaS products.",
      "toolSlugs": [
        "freescout"
      ]
    },
    {
      "title": "Free tiers with real functionality",
      "description": "Crisp's Free plan supports two agents with a shared inbox and mobile apps forever, and FreeScout's core application is entirely free with unlimited agents, while LiveChat offers only a 14-day trial before requiring payment.",
      "toolSlugs": [
        "crisp",
        "freescout"
      ]
    },
    {
      "title": "AI features built into the inbox",
      "description": "Crisp bundles a metered AI chatbot and AI-assisted replies into paid tiers, and LiveChat pairs AI agents with human agents inside a unified inbox with revenue attribution.",
      "toolSlugs": [
        "crisp",
        "livechat"
      ]
    },
    {
      "title": "Company backing and ecosystem",
      "description": "LiveChat is sold by the publicly traded Text S.A. alongside sibling products ChatBot and HelpDesk, while Crisp is a smaller France-based company and FreeScout relies on an open-source community and third-party module marketplace.",
      "toolSlugs": [
        "livechat",
        "crisp",
        "freescout"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Support Channels",
      "rows": [
        {
          "feature": "Shared team inbox",
          "statuses": {
            "crisp": "available",
            "freescout": "available",
            "livechat": "available"
          }
        },
        {
          "feature": "Knowledge base / help center",
          "statuses": {
            "crisp": "available",
            "freescout": "limited",
            "livechat": "not-documented"
          },
          "note": "Crisp includes a knowledge base from its Essentials tier up; FreeScout offers one as a paid add-on module."
        },
        {
          "feature": "Native iOS and Android apps",
          "statuses": {
            "crisp": "available",
            "freescout": "available",
            "livechat": "not-documented"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI chatbot / AI-assisted replies",
          "statuses": {
            "crisp": "available",
            "freescout": "limited",
            "livechat": "available"
          },
          "note": "Crisp and LiveChat include AI in their core inbox; FreeScout's AI-related capability depends on optional modules."
        },
        {
          "feature": "Workflow automation builder",
          "statuses": {
            "crisp": "available",
            "freescout": "limited",
            "livechat": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Pricing",
      "rows": [
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "crisp": "unavailable",
            "freescout": "available",
            "livechat": "unavailable"
          }
        },
        {
          "feature": "Permanent free plan",
          "statuses": {
            "crisp": "available",
            "freescout": "available",
            "livechat": "unavailable"
          },
          "note": "LiveChat offers only a 14-day free trial rather than a forever-free tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Crisp, FreeScout, or LiveChat completely free to use?",
      "answer": "Crisp's Free plan supports two agent seats with a shared inbox and mobile apps forever, and FreeScout's core application is free and open source with no per-agent limits as long as you self-host it. LiveChat has no permanent free plan, only a 14-day free trial before you need to subscribe."
    },
    {
      "question": "Which of these three tools is self-hosted?",
      "answer": "Only FreeScout is self-hosted. It is a PHP and Laravel application that you install on your own server, which gives you full control over your support data but also means you are responsible for maintenance, backups, and security patching."
    },
    {
      "question": "Is LiveChat the same company as LiveAgent?",
      "answer": "No. LiveChat is sold by Text S.A. (formerly LiveChat Software), a publicly traded Polish company, while LiveAgent is a separate, unrelated business built by Quality Unit in Slovakia. The similar names are a common source of confusion."
    },
    {
      "question": "Which of these tools has AI chatbot features?",
      "answer": "Crisp and LiveChat both include AI in their inbox. Crisp offers an omnichannel AI chatbot and AI-assisted reply drafting powered by a monthly credit allotment on paid tiers, and LiveChat pairs AI agents with human agents in a unified inbox that includes revenue attribution."
    },
    {
      "question": "How does pricing scale as a support team grows?",
      "answer": "Crisp bills per workspace rather than strictly per agent, so a growing team can add agents within a tier's seat allotment without an immediate cost increase. LiveChat bills per agent seat, so cost rises directly with headcount. FreeScout has no licensing cost at all since agent count is unlimited on the free, self-hosted core."
    },
    {
      "question": "Which option is best for privacy- or compliance-conscious teams?",
      "answer": "FreeScout is the strongest fit for teams that need full control over where support data lives, since it is self-hosted on infrastructure the team owns rather than a third-party cloud service."
    }
  ]
};

export default crispVsFreescoutVsLivechatContent;

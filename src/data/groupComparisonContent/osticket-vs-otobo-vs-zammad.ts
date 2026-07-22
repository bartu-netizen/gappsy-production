import type { GroupComparisonContent } from './types';

const osticketVsOtoboVsZammadContent: GroupComparisonContent = {
  "verdict": "osTicket, OTOBO, and Zammad are all open-source ticketing platforms with genuinely free self-hosted editions, but they diverge on maturity, automation, and channel breadth. osTicket is the longest-running of the three, dating to 2003, and pairs a proven core with an affordable managed cloud tier, while OTOBO descends directly from the original OTRS engineering lineage and adds unlimited free agents plus AI-powered ticket classification. Zammad is the newest of the group and leans hardest into modern multichannel support, with chat, Telegram, and WhatsApp on hosted plans and GDPR-friendly, German-hosted cloud infrastructure. The right pick depends on whether a team values track record and cost predictability, unlimited free agents with AI triage, or broad channel coverage with EU data residency.",
  "bestFor": {
    "osticket": "Small and medium-sized support teams that want the most mature, battle-tested open-source ticketing platform with a low-cost managed cloud option and no artificial agent limits on the self-hosted edition.",
    "otobo": "IT service management teams and former OTRS Community Edition users who need unlimited free agents, AI-assisted ticket classification, and dedicated migration tooling from OTRS or Znuny.",
    "zammad": "Support teams that want modern multichannel coverage across chat, Telegram, and WhatsApp with GDPR-friendly, German-hosted cloud plans and optional AI-assisted replies."
  },
  "highlights": [
    {
      "title": "Free self-hosting across the board",
      "description": "osTicket, OTOBO, and Zammad all offer a fully free, self-hosted core edition with no per-agent licensing cost, making all three viable for cost-conscious support teams willing to manage their own servers.",
      "toolSlugs": [
        "osticket",
        "otobo",
        "zammad"
      ]
    },
    {
      "title": "AI ticket classification built in",
      "description": "OTOBO includes a machine learning plugin that automatically pre-sorts incoming tickets by category and priority, a differentiated feature not present in osTicket's documented feature set.",
      "toolSlugs": [
        "otobo"
      ]
    },
    {
      "title": "Two decades of continuous development",
      "description": "osTicket has been actively developed since 2003, giving it the longest track record, largest installed base, and most mature documentation and plugin ecosystem of the three platforms.",
      "toolSlugs": [
        "osticket"
      ]
    },
    {
      "title": "Chat, Telegram, and WhatsApp in one inbox",
      "description": "Zammad's hosted plans extend beyond email and web forms into chat, Telegram, Facebook, and WhatsApp, plus optional AI-assisted language detection and reply suggestions billed per call.",
      "toolSlugs": [
        "zammad"
      ]
    },
    {
      "title": "Direct lineage from OTRS's founding team",
      "description": "OTOBO was built by Rother OSS, led by Stefan Rother, OTRS GmbH's first employee, and it includes purpose-built migration tooling for teams moving off discontinued OTRS Community Edition or Znuny.",
      "toolSlugs": [
        "otobo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Licensing",
      "rows": [
        {
          "feature": "Free self-hosted edition with unlimited agents",
          "statuses": {
            "osticket": "available",
            "otobo": "available",
            "zammad": "available"
          }
        },
        {
          "feature": "Published, self-serve managed cloud plan",
          "statuses": {
            "osticket": "available",
            "otobo": "limited",
            "zammad": "available"
          },
          "note": "OTOBO's hosting is delivered through custom-quoted professional services rather than a published self-serve cloud tier like osTicket's or Zammad's."
        }
      ]
    },
    {
      "group": "Automation and Service Levels",
      "rows": [
        {
          "feature": "AI-powered ticket features",
          "statuses": {
            "osticket": "not-documented",
            "otobo": "available",
            "zammad": "available"
          },
          "note": "OTOBO offers AI ticket classification; Zammad offers AI-assisted language detection and replies billed per call. Neither is documented for osTicket."
        },
        {
          "feature": "SLA and business-hours management",
          "statuses": {
            "osticket": "available",
            "otobo": "available",
            "zammad": "available"
          }
        }
      ]
    },
    {
      "group": "Channels and Migration",
      "rows": [
        {
          "feature": "Chat and social channels (chat, Telegram, WhatsApp)",
          "statuses": {
            "osticket": "unavailable",
            "otobo": "not-documented",
            "zammad": "available"
          },
          "note": "osTicket's documented intake channels are email, web forms, and API only."
        },
        {
          "feature": "Customer self-service knowledge base portal",
          "statuses": {
            "osticket": "available",
            "otobo": "available",
            "zammad": "available"
          }
        },
        {
          "feature": "Migration tooling from legacy ticketing systems",
          "statuses": {
            "osticket": "not-documented",
            "otobo": "available",
            "zammad": "not-documented"
          },
          "note": "OTOBO ships built-in migration tools for OTRS 7, OTRS Community Edition, and Znuny."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are osTicket, OTOBO, and Zammad actually free to use?",
      "answer": "Yes, all three publish a genuinely free, self-hosted core edition with no per-agent licensing fee. Costs only enter the picture if a team chooses a managed cloud plan, buys a paid support contract, or in OTOBO's case pays for custom consulting and hosting."
    },
    {
      "question": "Which of the three has AI-assisted ticketing features?",
      "answer": "OTOBO includes a machine learning plugin that automatically classifies and prioritizes incoming tickets, and Zammad offers optional AI-assisted language detection and reply suggestions billed per call on top of its subscription. AI features are not documented for osTicket."
    },
    {
      "question": "Which tool is best for a team migrating away from OTRS?",
      "answer": "OTOBO is purpose-built for this. It was created as a fork of OTRS Community Edition by Stefan Rother, OTRS GmbH's first employee, and it ships dedicated migration tooling for teams moving from OTRS 7, OTRS Community Edition, or Znuny."
    },
    {
      "question": "Do any of these platforms offer GDPR-friendly EU hosting?",
      "answer": "Zammad's hosted cloud plans run on ISO27001-certified German data centers designed for GDPR-friendly data residency. osTicket's and OTOBO's cloud or hosting options do not specify EU-based data residency in the same way."
    },
    {
      "question": "Which of the three has been around the longest?",
      "answer": "osTicket has the longest track record, in continuous development since 2003. Zammad launched in 2016 and OTOBO was created in 2019 as a fork of OTRS Community Edition, though OTOBO's team traces its own engineering lineage back to OTRS's earliest days."
    },
    {
      "question": "Which one supports the most communication channels out of the box?",
      "answer": "Zammad supports the broadest channel set on its hosted plans, including email, web forms, SMS, chat, Telegram, and, on its top tier, Facebook and WhatsApp. osTicket focuses on email, web forms, and API intake, while OTOBO's documented channels center on ticketing, SLAs, and its self-service portal rather than chat or social messaging."
    }
  ]
};

export default osticketVsOtoboVsZammadContent;

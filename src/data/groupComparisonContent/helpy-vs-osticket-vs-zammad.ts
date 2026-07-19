import type { GroupComparisonContent } from './types';

const helpyVsOsticketVsZammadContent: GroupComparisonContent = {
  "verdict": "There is no outright winner among Helpy, osTicket and Zammad because each treats the shared open-source, self-hosted promise differently once you look past the label. osTicket has the longest track record and puts no artificial agent caps on its free self-hosted core, Helpy pairs that same free-core philosophy with a modern AI agent and GDPR-focused tooling, and Zammad leans hardest into native multichannel messaging and EU-hosted data residency. The right pick depends on whether you value proven simplicity, AI-assisted deflection, or channel breadth more.",
  "bestFor": {
    "helpy": "Teams that want a fully free, MIT-licensed self-hosted helpdesk but also want Carin, Helpy's AI agent, to autonomously resolve routine tier-one tickets before they reach a human.",
    "osticket": "IT and support teams that want the most mature, completely free self-hosted ticketing system with no agent limits and don't need built-in AI or social messaging channels.",
    "zammad": "Support teams with GDPR or EU data residency requirements that need Telegram, Facebook and WhatsApp messaging alongside email in one shared inbox."
  },
  "highlights": [
    {
      "title": "osTicket is the free, no-limits veteran",
      "description": "osTicket has been in continuous development since 2003, making it one of the longest-running open-source help desks still active, and its self-hosted edition remains completely free with no artificial agent caps.",
      "toolSlugs": [
        "osticket"
      ]
    },
    {
      "title": "Helpy pairs open source with a modern AI agent",
      "description": "Helpy's Carin is built to autonomously resolve up to 90 percent of tier-one customer questions, layering AI-assisted automation on top of a genuinely free, MIT-licensed open-source core.",
      "toolSlugs": [
        "helpy"
      ]
    },
    {
      "title": "Zammad leads on native multichannel and EU data residency",
      "description": "Zammad's hosted plans add Telegram, Facebook and WhatsApp channels alongside email and chat, and its cloud edition runs on ISO27001-certified German data centers built for GDPR-friendly data residency.",
      "toolSlugs": [
        "zammad"
      ]
    },
    {
      "title": "All three offer a genuinely free self-hosted core",
      "description": "None of the three require a license fee to self-host the open-source edition, which sets them apart from most commercial helpdesk platforms that gate core ticketing behind a paid seat.",
      "toolSlugs": [
        "helpy",
        "osticket",
        "zammad"
      ]
    },
    {
      "title": "Cloud pricing structures diverge once you leave the free self-hosted tier",
      "description": "osTicket's cloud plan starts from a flat $12 per agent per month, Zammad's hosted tiers start around EUR 7 per agent per month but add per-call AI usage fees, and Helpy's cloud tiers span roughly $15 to $50 per seat per month depending on features.",
      "toolSlugs": [
        "helpy",
        "osticket",
        "zammad"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Hosting",
      "rows": [
        {
          "feature": "Free, self-hosted open-source edition",
          "statuses": {
            "helpy": "available",
            "osticket": "available",
            "zammad": "available"
          },
          "note": "All three can be run entirely for free with no per-agent licensing cost on the self-hosted core."
        },
        {
          "feature": "Managed cloud-hosted plan",
          "statuses": {
            "helpy": "available",
            "osticket": "available",
            "zammad": "available"
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
            "helpy": "available",
            "osticket": "not-documented",
            "zammad": "limited"
          },
          "note": "Helpy's Carin is designed to autonomously resolve up to 90 percent of tier-one questions; Zammad's AI features are opt-in and billed per call rather than a dedicated autonomous agent."
        },
        {
          "feature": "Ticket routing rules, triggers or macros",
          "statuses": {
            "helpy": "not-documented",
            "osticket": "available",
            "zammad": "available"
          }
        }
      ]
    },
    {
      "group": "Channels and Collaboration",
      "rows": [
        {
          "feature": "Customer community forums",
          "statuses": {
            "helpy": "available",
            "osticket": "not-documented",
            "zammad": "not-documented"
          }
        },
        {
          "feature": "Chat, Telegram, Facebook or WhatsApp channels",
          "statuses": {
            "helpy": "not-documented",
            "osticket": "unavailable",
            "zammad": "available"
          },
          "note": "Zammad reserves WhatsApp and Facebook for its top hosted tier."
        }
      ]
    },
    {
      "group": "Compliance and Structure",
      "rows": [
        {
          "feature": "GDPR-specific compliance tooling or data residency",
          "statuses": {
            "helpy": "available",
            "osticket": "not-documented",
            "zammad": "available"
          }
        },
        {
          "feature": "SLA and business-hours enforcement",
          "statuses": {
            "helpy": "not-documented",
            "osticket": "available",
            "zammad": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three can I self-host for free with no agent limit?",
      "answer": "All three offer a free, self-hosted open-source edition. osTicket explicitly markets its self-hosted edition as having no artificial agent limits, while Helpy's Community Edition and Zammad's self-hosted edition are also free with no license cost."
    },
    {
      "question": "Does any of them include a built-in AI agent for deflecting tickets?",
      "answer": "Helpy is the most AI-forward, with its Carin agent designed to autonomously resolve up to 90 percent of tier-one questions. Zammad offers optional AI features like language detection and reply suggestions billed per call. osTicket does not document a built-in AI agent."
    },
    {
      "question": "Which one supports WhatsApp, Telegram or Facebook messaging?",
      "answer": "Zammad is the only one of the three with documented support for Telegram, Facebook and WhatsApp channels, though WhatsApp and Facebook are reserved for its top hosted tier."
    },
    {
      "question": "Which has been around the longest?",
      "answer": "osTicket has the longest history, in continuous development since 2003, compared to Helpy and Zammad, which both launched in 2016."
    },
    {
      "question": "Do any of these require an annual contract just to use the free tier?",
      "answer": "No. The free self-hosted editions of all three carry no contract. Annual commitments only apply to specific paid tiers, such as Helpy's self-hosted Pro license or Zammad's self-hosted support contracts."
    },
    {
      "question": "Are these tools GDPR compliant?",
      "answer": "Helpy advertises GDPR-compliant data deletion and anonymization tools, and Zammad's hosted cloud runs on ISO27001-certified German data centers built for GDPR-friendly data residency. GDPR-specific tooling is not documented for osTicket in the available data."
    }
  ]
};

export default helpyVsOsticketVsZammadContent;

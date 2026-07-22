import type { GroupComparisonContent } from './types';

const frontVsHelpScoutVsIntercomContent: GroupComparisonContent = {
  "verdict": "Front, Help Scout and Intercom all center on a shared team inbox, but they diverge in maturity and pricing philosophy: Front leans hardest into real-time internal collaboration with Live Activity and shared drafts, Help Scout stays the simplest and cheapest way to start with a genuine free plan, and Intercom pushes furthest into autonomous AI resolution through Fin at a materially higher and more usage-variable price. None is a strict upgrade over the others once seat costs, AI add-ons and channel breadth are weighed together.",
  "bestFor": {
    "front": "Support, sales and ops teams that want an email-native shared inbox with strong internal collaboration tools like Live Activity and shared drafts.",
    "help-scout": "Small and mid-sized teams that want an affordable, human-feeling helpdesk with a free plan to start and simple per-seat pricing.",
    "intercom": "Mid-market and enterprise teams that want to lean heavily into AI-driven ticket resolution via the Fin AI Agent alongside a shared inbox and help center."
  },
  "highlights": [
    {
      "title": "Front's Live Activity and shared drafts cut duplicate replies",
      "description": "Front's Live Activity shows in real time when a teammate is viewing or drafting a reply, and shared drafts let multiple people co-author a response before it sends, addressing a collaboration problem neither Help Scout nor Intercom documents an equivalent for.",
      "toolSlugs": [
        "front"
      ]
    },
    {
      "title": "Help Scout is the only one of the three with a real free plan",
      "description": "Help Scout's Free plan covers up to five users, one inbox, one Docs site and 100 contacts a month, giving very small teams a genuine no-cost starting point that neither Front nor Intercom offers.",
      "toolSlugs": [
        "help-scout"
      ]
    },
    {
      "title": "Intercom's Fin AI Agent is priced per resolution, not per seat",
      "description": "Fin bills at $0.99 per successful outcome and can even run standalone on top of another helpdesk, contrasting with Front's Autopilot and Help Scout's AI Answers, which are also usage-based add-ons but built to work inside their own inboxes only.",
      "toolSlugs": [
        "intercom",
        "front",
        "help-scout"
      ]
    },
    {
      "title": "Front and Intercom both cover a wider set of channels than Help Scout",
      "description": "Front spans email, SMS, live chat, social messaging, WhatsApp and voice on its higher tiers, and Intercom adds SMS and WhatsApp as pay-as-you-go channels alongside its Messenger, while Help Scout's documented channel list centers on email plus live chat, Instagram, Messenger and WhatsApp.",
      "toolSlugs": [
        "front",
        "intercom",
        "help-scout"
      ]
    },
    {
      "title": "Entry-level pricing sits close together, but AI add-ons change the math",
      "description": "Front Starter, Help Scout Standard and Intercom Essential all price in the mid-$20s to $29 per seat per month, but Front's Copilot, Smart QA and Smart CSAT, and Intercom's Fin, are billed as separate add-ons that can push real spend well above the sticker price.",
      "toolSlugs": [
        "front",
        "intercom"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Inbox and Collaboration",
      "rows": [
        {
          "feature": "Collaborative shared inbox",
          "statuses": {
            "front": "available",
            "help-scout": "available",
            "intercom": "available"
          }
        },
        {
          "feature": "Real-time presence showing who is viewing or drafting a reply",
          "statuses": {
            "front": "available",
            "help-scout": "not-documented",
            "intercom": "not-documented"
          },
          "note": "Front markets this as Live Activity; no equivalent is documented for Help Scout or Intercom."
        },
        {
          "feature": "Shared drafts for multi-person co-authoring before sending",
          "statuses": {
            "front": "available",
            "help-scout": "not-documented",
            "intercom": "not-documented"
          }
        }
      ]
    },
    {
      "group": "AI Automation",
      "rows": [
        {
          "feature": "AI-drafted reply suggestions",
          "statuses": {
            "front": "available",
            "help-scout": "available",
            "intercom": "available"
          },
          "note": "Front's Copilot is a paid add-on, Help Scout's AI Drafts is unlimited from the Standard plan, and Intercom's Fin Copilot ships with Fin usage."
        },
        {
          "feature": "Autonomous AI agent that resolves tickets without a human agent",
          "statuses": {
            "front": "available",
            "help-scout": "available",
            "intercom": "available"
          },
          "note": "Front's Autopilot, Help Scout's AI Answers ($0.75 per resolution) and Intercom's Fin ($0.99 per resolution) all bill separately from the base seat price."
        },
        {
          "feature": "Automated QA and CSAT scoring",
          "statuses": {
            "front": "available",
            "help-scout": "not-documented",
            "intercom": "not-documented"
          },
          "note": "Front sells Smart QA and Smart CSAT as add-ons; no equivalent is documented for Help Scout or Intercom."
        }
      ]
    },
    {
      "group": "Channels and Self-Service",
      "rows": [
        {
          "feature": "Knowledge base or help center",
          "statuses": {
            "front": "not-documented",
            "help-scout": "available",
            "intercom": "available"
          }
        },
        {
          "feature": "Free plan",
          "statuses": {
            "front": "unavailable",
            "help-scout": "available",
            "intercom": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Help Scout, Front or Intercom offer a free plan?",
      "answer": "Help Scout is the only one of the three with a genuine free plan, covering up to five users, one inbox and 100 contacts a month. Front's cheapest tier starts at $25 per seat per month and Intercom's Essential plan starts at $29 per seat per month, both billed annually."
    },
    {
      "question": "Which of the three has the most advanced AI ticket resolution?",
      "answer": "Intercom's Fin AI Agent is the most heavily marketed autonomous resolution feature and can even be deployed standalone on top of another helpdesk, but Front's Autopilot and Help Scout's AI Answers offer comparable pay-per-resolution automation inside their own inboxes."
    },
    {
      "question": "Which tool is best for a small support team on a tight budget?",
      "answer": "Help Scout is generally the cheapest path, with a free plan and a $25 per seat Standard tier that already includes unlimited AI Drafts, live chat and a knowledge base without separate AI add-on fees."
    },
    {
      "question": "Which tool has the strongest internal collaboration features?",
      "answer": "Front is built specifically around real-time internal collaboration, with Live Activity showing when a teammate is drafting a reply and shared drafts letting multiple people co-author a response before it sends."
    },
    {
      "question": "Are Front, Help Scout and Intercom all priced per seat?",
      "answer": "All three use per-seat pricing as their base model, but Front and Intercom layer usage-based AI add-ons on top, Copilot, Smart QA and Smart CSAT for Front, and Fin resolutions for Intercom, while Help Scout's AI Answers is the only comparable usage-based add-on in its lineup."
    },
    {
      "question": "Which tool covers the most communication channels?",
      "answer": "Front and Intercom both extend to SMS and WhatsApp alongside email, chat and social messaging, with Front adding voice on higher tiers, while Help Scout's channel list centers on email, live chat, Instagram, Messenger and WhatsApp."
    }
  ]
};

export default frontVsHelpScoutVsIntercomContent;

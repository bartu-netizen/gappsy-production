import type { GroupComparisonContent } from './types';

const freshdeskVsFrontVsIntercomContent: GroupComparisonContent = {
  "verdict": "All three are customer support platforms, but they lead with different mechanics. Freshdesk is the most affordable, ticket-based omnichannel helpdesk with field service dispatch on top. Front replaces the ticket queue with a collaborative shared inbox, adding Live Activity and shared drafts so teammates never duplicate a reply. Intercom is the most AI-forward, built around its Fin AI Agent as the primary resolution layer with human agents assisting rather than being the default path, at the cost of the most usage-based, harder-to-forecast pricing.",
  "bestFor": {
    "freshdesk": "Teams wanting a lower-cost, easy-to-set-up omnichannel helpdesk with field service dispatch, especially if already inside the Freshworks ecosystem.",
    "front": "Teams that prefer an email-native, collaborative shared inbox over a ticket-queue interface, and want internal tools like Live Activity and shared drafts to coordinate replies.",
    "intercom": "SaaS, e-commerce, and tech companies that want AI-led resolution through Fin as the primary support layer, with human agents assisting rather than being the default path."
  },
  "highlights": [
    {
      "title": "Intercom is the only one built AI-first around a resolution-based pricing model",
      "description": "Fin AI Agent is core to Intercom's product and billed per successful outcome at $0.99 per resolution, rather than sold as a bolt-on the way Freshdesk's and Front's AI agents are.",
      "toolSlugs": [
        "intercom"
      ]
    },
    {
      "title": "Front's Live Activity and shared drafts are unique among the three",
      "description": "Front lets teammates see in real time who is viewing or drafting a reply, preventing duplicate responses, a named core differentiator that Freshdesk and Intercom do not document.",
      "toolSlugs": [
        "front"
      ]
    },
    {
      "title": "Freshdesk is the only one with field service management",
      "description": "Freshdesk includes a module for scheduling and dispatching on-site technicians, extending beyond digital support in a way neither Front nor Intercom offers.",
      "toolSlugs": [
        "freshdesk"
      ]
    },
    {
      "title": "All three gate at least part of their AI capability behind extra cost",
      "description": "Freshdesk's Freddy AI Copilot ($29/agent/month) and Front's Copilot, Smart QA, and Smart CSAT are separate paid add-ons on lower tiers, while Intercom's Fin is billed per resolution on top of seat pricing.",
      "toolSlugs": [
        "freshdesk",
        "front",
        "intercom"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "Autonomous AI agent for resolving conversations",
          "statuses": {
            "freshdesk": "limited",
            "front": "limited",
            "intercom": "available"
          },
          "note": "Freshdesk's Freddy AI self-service agent and Front's Autopilot are both available but sold as separate paid add-ons on lower tiers; Intercom's Fin AI Agent is core to the product and billed per resolution."
        },
        {
          "feature": "AI copilot that drafts replies for human agents",
          "statuses": {
            "freshdesk": "available",
            "front": "available",
            "intercom": "available"
          },
          "note": "Freshdesk's Freddy AI Copilot is a $29/agent/month add-on and Front's Copilot is a paid add-on on its Starter and Professional tiers; Intercom's Fin Copilot is part of its plan structure."
        }
      ]
    },
    {
      "group": "Channels and Collaboration",
      "rows": [
        {
          "feature": "Omnichannel messaging (email, chat, SMS, social, WhatsApp)",
          "statuses": {
            "freshdesk": "available",
            "front": "available",
            "intercom": "limited"
          },
          "note": "Intercom lists SMS and WhatsApp as pay-as-you-go add-on channels rather than included channels."
        },
        {
          "feature": "Real-time internal collaboration (live presence, shared drafts)",
          "statuses": {
            "freshdesk": "not-documented",
            "front": "available",
            "intercom": "not-documented"
          },
          "note": "Front's Live Activity and shared drafts are a named core differentiator; the provided data does not describe an equivalent feature for Freshdesk or Intercom."
        }
      ]
    },
    {
      "group": "Support Model and Extras",
      "rows": [
        {
          "feature": "Traditional ticket-queue system",
          "statuses": {
            "freshdesk": "available",
            "front": "limited",
            "intercom": "available"
          },
          "note": "Front is explicitly designed as a collaborative shared inbox rather than an isolated ticket queue, though it still supports assignment and routing."
        },
        {
          "feature": "Field service / on-site technician dispatch",
          "statuses": {
            "freshdesk": "available",
            "front": "unavailable",
            "intercom": "unavailable"
          }
        },
        {
          "feature": "AI resolution included at entry tier without a separate add-on",
          "statuses": {
            "freshdesk": "unavailable",
            "front": "unavailable",
            "intercom": "available"
          },
          "note": "Freshdesk's Freddy AI Copilot and Front's Copilot/Smart QA/CSAT are separate paid add-ons on entry tiers; Intercom's Fin AI Agent is usage-based but built into the core Essential plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is the most AI-forward by design?",
      "answer": "Intercom, whose Fin AI Agent is central to the product and billed per resolution rather than as an add-on."
    },
    {
      "question": "Which tool avoids a traditional ticket-number interface?",
      "answer": "Front, which uses a collaborative shared-inbox model instead of the isolated ticket queues used by Freshdesk and, per its plan features, Intercom."
    },
    {
      "question": "Do any of these include field service or on-site technician management?",
      "answer": "Only Freshdesk documents a field service management module; Front and Intercom do not."
    },
    {
      "question": "Is AI included in the base price or billed separately?",
      "answer": "All three add some AI cost on top of base pricing: Freshdesk's Freddy AI Copilot is a $29/agent/month add-on, Front's Copilot and Smart QA/CSAT are separate add-ons on lower tiers, and Intercom's Fin AI Agent is billed at $0.99 per resolution."
    },
    {
      "question": "Which has the lowest entry-level price?",
      "answer": "Freshdesk's Growth plan at $19/agent/month is the lowest of the three; Front starts at $25/seat/month and Intercom's Essential plan starts at $29/seat/month."
    },
    {
      "question": "Which is best for omnichannel coverage including WhatsApp and social media?",
      "answer": "Freshdesk and Front both document WhatsApp and social channel support included in their plans; Intercom's data lists WhatsApp and SMS as pay-as-you-go add-ons rather than included channels."
    }
  ]
};

export default freshdeskVsFrontVsIntercomContent;

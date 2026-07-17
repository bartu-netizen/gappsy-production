import type { ToolComparisonContent } from './types';

const elementVsZulipContent: ToolComparisonContent = {
  "verdict": "Element and Zulip are both open-source, self-hostable communication tools, but they're built on different foundations for different needs. Element is built on the decentralized, federated Matrix protocol with end-to-end encryption by default and a Sovereign plan for fully air-gapped deployments, used by government and defense bodies. Zulip is organized around topic-based threading for asynchronous team discussion, with fully published per-user pricing from $3.50/user/month self-hosted to $10/user/month on Cloud Plus.",
  "bestForToolA": "Element fits government, defense, and security-vetted organizations that need end-to-end encrypted, decentralized/federated communication with air-gapped Sovereign deployment options and certifications like Cyber Essentials Plus and ISO/IEC 27001:2022.",
  "bestForToolB": "Zulip fits teams that want transparent, published per-user pricing and a topic-threading model for organizing large volumes of asynchronous team discussion.",
  "whoNeedsBoth": "A security-conscious organization could use Element for encrypted, federated communication with external partners on separate Matrix homeservers, while using Zulip internally for day-to-day team discussion organized by topic — these serve different communication patterns (federated/external vs. internal-threaded) rather than competing directly.",
  "keyDifferences": [
    {
      "title": "Underlying Protocol / Architecture",
      "toolA": "Element is built on the open, decentralized Matrix protocol, supporting federation between separate organizations' servers.",
      "toolB": "Zulip is not built on Matrix; it has its own architecture with topic-based threading and no documented federation between separate organizations.",
      "whyItMatters": "A decentralized protocol avoids vendor lock-in and enables cross-organization federation without a single central operator.",
      "benefitsWho": "Organizations that need to federate with external partners running their own servers."
    },
    {
      "title": "End-to-End Encryption",
      "toolA": "Element includes end-to-end encryption by default across all clients for messages and calls, on all plans.",
      "toolB": "No end-to-end encryption feature is documented for Zulip in the facts.",
      "whyItMatters": "E2E encryption is often a hard requirement for security-vetted or classified communication.",
      "benefitsWho": "Government, defense, and security-sensitive organizations."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Element's Enterprise and Sovereign plan pricing is custom and not published; only the free Community edition has a known price ($0).",
      "toolB": "Zulip publishes tiered pricing from $0 self-hosted up to $10/user/month (Cloud Plus).",
      "whyItMatters": "Published pricing lets buyers self-serve a cost estimate before engaging sales.",
      "benefitsWho": "Budget-conscious teams evaluating tools without a sales call."
    },
    {
      "title": "Air-Gapped / Sovereign Deployment",
      "toolA": "Element offers an explicit Sovereign plan for deployments with no internet connectivity, referencing use by bodies like NATO, US Space Force, and the Bundeswehr.",
      "toolB": "Zulip has a self-hosted option but no explicit air-gapped/no-internet deployment feature documented.",
      "whyItMatters": "Fully disconnected deployment is a hard requirement for classified or highly regulated environments.",
      "benefitsWho": "Government, defense, and classified-environment operators."
    },
    {
      "title": "Conversation Organization",
      "toolA": "Element uses channel/room-based Matrix chat without a documented topic-threading model.",
      "toolB": "Zulip organizes conversations into topic-based threads plus a unified inbox, designed for large asynchronous discussions.",
      "whyItMatters": "Topic threading helps large teams keep long-running, high-volume discussions navigable.",
      "benefitsWho": "Large distributed teams with heavy asynchronous discussion volume."
    }
  ],
  "featureMatrix": [
    {
      "group": "Protocol & Security",
      "rows": [
        {
          "feature": "End-to-end encryption",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Decentralized/federated architecture",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Air-gapped deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Element: Sovereign plan."
        },
        {
          "feature": "ISO/IEC 27001 certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Element: ISO/IEC 27001:2022."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published pricing for all tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Element's Enterprise/Sovereign plans are custom quotes."
        },
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "available",
          "note": "Element: Community edition."
        },
        {
          "feature": "Free cloud-hosted tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zulip: Cloud Free."
        }
      ]
    },
    {
      "group": "Conversation & Collaboration",
      "rows": [
        {
          "feature": "Topic-based threading",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in voice/video calling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Element: Element Call."
        },
        {
          "feature": "Guest accounts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SAML / OIDC SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Element: Enterprise/Sovereign plans. Zulip: paid plans."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool is built on the Matrix protocol?",
      "answer": "Element. It's built on the open, decentralized Matrix standard, supporting federation between separate organizations' homeservers."
    },
    {
      "question": "Does Zulip support end-to-end encryption?",
      "answer": "This isn't documented in Zulip's facts. Element includes end-to-end encryption by default across all clients and plans."
    },
    {
      "question": "Which tool has fully published pricing?",
      "answer": "Zulip, with tiered pricing from $0 self-hosted up to $10/user/month on Cloud Plus. Element's Enterprise and Sovereign plans are custom quotes."
    },
    {
      "question": "Which tool supports air-gapped, no-internet deployments?",
      "answer": "Element, via its Sovereign plan, which is referenced as used by government and defense bodies including NATO, US Space Force, and the Bundeswehr."
    },
    {
      "question": "Is Element free to use?",
      "answer": "Yes, Element's Community edition is free and open source under AGPL for self-hosted, non-professional deployments and evaluations."
    },
    {
      "question": "Which tool is designed around topic-based conversation threading?",
      "answer": "Zulip. It organizes conversations into topic-based threads within channels plus a unified inbox view."
    }
  ]
};

export default elementVsZulipContent;

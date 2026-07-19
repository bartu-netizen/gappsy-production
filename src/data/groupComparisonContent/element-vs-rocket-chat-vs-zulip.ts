import type { GroupComparisonContent } from './types';

const elementVsRocketChatVsZulipContent: GroupComparisonContent = {
  "verdict": "All three are open-source, self-hostable team chat platforms built as alternatives to centralized proprietary tools, but they emphasize different priorities. Element leans hardest into decentralized, end-to-end-encrypted, federated messaging with sovereign and air-gapped deployment options; Rocket.Chat pairs self-hosted internal chat with omnichannel customer-facing support in one platform; Zulip's topic-based threading is purpose-built for asynchronous, distributed teams that want organized, long-running conversations rather than flat channels.",
  "bestFor": {
    "element": "Organizations that need decentralized, federated, end-to-end encrypted messaging with sovereign or air-gapped deployment options",
    "rocket-chat": "Teams that want a single self-hosted platform for both internal chat and customer-facing omnichannel support",
    "zulip": "Distributed, asynchronous teams that want topic-threaded conversations to stay organized over time"
  },
  "highlights": [
    {
      "title": "Element defaults to end-to-end encryption",
      "description": "Element secures one-to-one and group conversations in private rooms by default using Olm and Megolm cryptographic ratchets derived from the Double Ratchet Algorithm.",
      "toolSlugs": [
        "element"
      ]
    },
    {
      "title": "Element's Matrix protocol is truly federated",
      "description": "Built on the open Matrix protocol, Element lets organizations self-host or connect across independently operated servers rather than depending on a single central provider.",
      "toolSlugs": [
        "element"
      ]
    },
    {
      "title": "Rocket.Chat merges team chat with customer support",
      "description": "Rocket.Chat's omnichannel customer service capability lets teams use the same platform for internal collaboration and customer-facing support conversations across channels.",
      "toolSlugs": [
        "rocket-chat"
      ]
    },
    {
      "title": "Zulip organizes conversations by topic",
      "description": "Every Zulip message is filed under a named topic within a stream, keeping parallel conversations organized in a way flat channel-based chat does not preserve as conversation volume grows.",
      "toolSlugs": [
        "zulip"
      ]
    },
    {
      "title": "All three offer a free self-hosted community edition",
      "description": "Element, Rocket.Chat, and Zulip each provide a free, open-source, self-hostable edition, though Element and Rocket.Chat's free community tiers cap user counts while Zulip's self-hosted free tier does not.",
      "toolSlugs": [
        "element",
        "rocket-chat",
        "zulip"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Security and Architecture",
      "rows": [
        {
          "feature": "End-to-end encryption enabled by default",
          "statuses": {
            "element": "available",
            "rocket-chat": "available",
            "zulip": "not-documented"
          },
          "note": "Element enables E2EE by default in private rooms; Rocket.Chat offers end-to-end encryption on its Community edition and paid tiers."
        },
        {
          "feature": "Federated, decentralized architecture",
          "statuses": {
            "element": "available",
            "rocket-chat": "limited",
            "zulip": "not-documented"
          },
          "note": "Element is built natively on the federated Matrix protocol; Rocket.Chat offers federation support as an add-on capability rather than its core architecture."
        }
      ]
    },
    {
      "group": "Collaboration Model",
      "rows": [
        {
          "feature": "Topic-based threaded conversations",
          "statuses": {
            "element": "not-documented",
            "rocket-chat": "not-documented",
            "zulip": "available"
          },
          "note": "Topic threading within streams is Zulip's core organizing principle."
        },
        {
          "feature": "Built-in omnichannel customer support tooling",
          "statuses": {
            "element": "not-documented",
            "rocket-chat": "available",
            "zulip": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Compliance",
      "rows": [
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "element": "available",
            "rocket-chat": "available",
            "zulip": "available"
          }
        },
        {
          "feature": "Air-gapped or government/defense-grade deployment",
          "statuses": {
            "element": "available",
            "rocket-chat": "available",
            "zulip": "not-documented"
          },
          "note": "Element offers a Sovereign tier for air-gapped deployments; Rocket.Chat offers FIPS 140-3 validated, SCIF-ready deployments for government and defense."
        }
      ]
    },
    {
      "group": "Pricing and Free Tier",
      "rows": [
        {
          "feature": "Free self-hosted community edition",
          "statuses": {
            "element": "available",
            "rocket-chat": "available",
            "zulip": "available"
          },
          "note": "Element's Community edition supports roughly 100 users and Rocket.Chat's Community edition caps at 50 users; Zulip's self-hosted free tier has no documented user cap."
        },
        {
          "feature": "Managed cloud hosting option",
          "statuses": {
            "element": "limited",
            "rocket-chat": "not-documented",
            "zulip": "available"
          },
          "note": "Element offers custom-quoted Enterprise cloud or on-premise hosting; Zulip Cloud has published Free, Standard, and Plus tiers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has true decentralized federation?",
      "answer": "Element, built on the open Matrix protocol, is the one designed for federation, letting organizations self-host or connect across independently operated servers rather than depending on a single central provider."
    },
    {
      "question": "Can Rocket.Chat handle customer support as well as internal team chat?",
      "answer": "Yes. Rocket.Chat includes an omnichannel customer service capability that lets the same platform handle both internal team collaboration and customer-facing support conversations across channels."
    },
    {
      "question": "What is topic-based threading in Zulip and why does it matter?",
      "answer": "Every message in Zulip is filed under a named topic within a stream, so parallel conversations stay organized and can be revisited later, an approach designed for asynchronous, distributed teams rather than always-on real-time chat."
    },
    {
      "question": "Do all three support self-hosting for free?",
      "answer": "Yes. Element's Community edition supports roughly 100 users, Rocket.Chat's Community edition caps at 50 users, and Zulip's self-hosted free tier is open source with no documented user cap, though all three require infrastructure you manage yourself."
    },
    {
      "question": "Which is best for government or defense-grade security requirements?",
      "answer": "Element offers a dedicated Sovereign tier for fully air-gapped, internet-free deployments, and Rocket.Chat offers FIPS 140-3 validated cryptography with SCIF-ready deployment options; both have documented government and defense customers."
    },
    {
      "question": "Is end-to-end encryption turned on automatically?",
      "answer": "Element enables end-to-end encryption by default in private rooms. Rocket.Chat offers end-to-end encryption on its Community edition and paid tiers. This is not documented as a default behavior for Zulip in the available data."
    }
  ]
};

export default elementVsRocketChatVsZulipContent;

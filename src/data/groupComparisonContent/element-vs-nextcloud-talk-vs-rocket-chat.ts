import type { GroupComparisonContent } from './types';

const elementVsNextcloudTalkVsRocketChatContent: GroupComparisonContent = {
  "verdict": "Element, Nextcloud Talk, and Rocket.Chat are all open-source, self-hostable communication tools, but they are built for different primary jobs: Element is a federated, end-to-end encrypted messaging protocol aimed at security and sovereignty, Nextcloud Talk is a chat and calling module that extends an existing Nextcloud deployment, and Rocket.Chat pairs internal team chat with customer-facing omnichannel support. The right fit depends on whether federation, suite integration, or customer support integration is the priority.",
  "bestFor": {
    "element": "Organizations that need federated, end-to-end encrypted messaging with sovereign or air-gapped deployment options for government and defense use cases",
    "nextcloud-talk": "Teams already running Nextcloud that want self-hosted chat, calls, and large-scale webinars integrated directly into that suite",
    "rocket-chat": "Organizations that want to combine internal team chat with customer-facing omnichannel support in one self-hosted platform"
  },
  "highlights": [
    {
      "title": "Shared open-source, self-hosted foundation",
      "description": "Element, Nextcloud Talk, and Rocket.Chat are all open source with free self-hosted tiers, giving organizations control over data residency that closed SaaS platforms cannot match.",
      "toolSlugs": [
        "element",
        "nextcloud-talk",
        "rocket-chat"
      ]
    },
    {
      "title": "Federated messaging architecture",
      "description": "Element's Matrix protocol and Rocket.Chat's federation support both let independently run servers communicate, while Nextcloud Talk does not document this capability.",
      "toolSlugs": [
        "element",
        "rocket-chat"
      ]
    },
    {
      "title": "Deep integration with a broader collaboration suite",
      "description": "Nextcloud Talk is a module inside the wider Nextcloud platform, so chat and calls sit alongside the same organization's existing files and collaboration tools rather than as a standalone app.",
      "toolSlugs": [
        "nextcloud-talk"
      ]
    },
    {
      "title": "Omnichannel customer support bundled in",
      "description": "Rocket.Chat combines internal team messaging with customer-facing omnichannel support channels, a use case Element and Nextcloud Talk do not target.",
      "toolSlugs": [
        "rocket-chat"
      ]
    },
    {
      "title": "Large-scale webinar support",
      "description": "Nextcloud Talk's High Performance Backend lets it scale from small one-to-one calls up to large webinars, a capability not documented for Element or Rocket.Chat.",
      "toolSlugs": [
        "nextcloud-talk"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "element": "available",
            "nextcloud-talk": "available",
            "rocket-chat": "available"
          }
        },
        {
          "feature": "Federated architecture across independent servers",
          "statuses": {
            "element": "available",
            "nextcloud-talk": "not-documented",
            "rocket-chat": "available"
          }
        }
      ]
    },
    {
      "group": "Security",
      "rows": [
        {
          "feature": "End-to-end encryption",
          "statuses": {
            "element": "available",
            "nextcloud-talk": "available",
            "rocket-chat": "available"
          }
        },
        {
          "feature": "Air-gapped or sovereign-grade deployment",
          "statuses": {
            "element": "available",
            "nextcloud-talk": "not-documented",
            "rocket-chat": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration Features",
      "rows": [
        {
          "feature": "Large-scale webinar or broadcast support",
          "statuses": {
            "element": "not-documented",
            "nextcloud-talk": "available",
            "rocket-chat": "not-documented"
          }
        },
        {
          "feature": "Omnichannel customer-facing support",
          "statuses": {
            "element": "unavailable",
            "nextcloud-talk": "unavailable",
            "rocket-chat": "available"
          }
        }
      ]
    },
    {
      "group": "Ecosystem",
      "rows": [
        {
          "feature": "Deep integration with a broader productivity suite",
          "statuses": {
            "element": "unavailable",
            "nextcloud-talk": "available",
            "rocket-chat": "unavailable"
          },
          "note": "Nextcloud Talk is a module of the wider Nextcloud collaboration platform"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is the best fit if we already run Nextcloud for file storage and collaboration?",
      "answer": "Nextcloud Talk, since it is built directly into the Nextcloud platform rather than operating as a separate standalone app."
    },
    {
      "question": "Which tool is designed to handle large webinars rather than just small team calls?",
      "answer": "Nextcloud Talk, which can scale from one-to-one calls to large webinars using its High Performance Backend add-on."
    },
    {
      "question": "Which tool combines chat with customer-facing support tooling?",
      "answer": "Rocket.Chat, which bundles omnichannel customer service alongside standard internal team messaging."
    },
    {
      "question": "Do all three offer end-to-end encryption?",
      "answer": "Yes, Element, Nextcloud Talk, and Rocket.Chat all document end-to-end encryption support."
    },
    {
      "question": "Which tool uses federation to connect independently run servers?",
      "answer": "Element, built on the Matrix protocol, and Rocket.Chat, which also lists federation support as a feature; Nextcloud Talk does not document this capability."
    },
    {
      "question": "Which is best suited for defense or government sovereign deployments?",
      "answer": "Element, which offers a dedicated air-gapped Sovereign tier and has a documented track record with government and defense customers in France and Germany."
    }
  ]
};

export default elementVsNextcloudTalkVsRocketChatContent;

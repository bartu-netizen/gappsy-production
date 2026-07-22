import type { GroupComparisonContent } from './types';

const mattermostVsRocketChatVsZulipContent: GroupComparisonContent = {
  "verdict": "Mattermost, Rocket.Chat, and Zulip are all open-source, self-hostable Slack alternatives, but they diverge on collaboration style: Mattermost adds Playbooks workflow automation for regulated and DevOps-heavy teams, Rocket.Chat bundles internal chat with customer-facing omnichannel support, and Zulip organizes conversations into topic threads built for asynchronous, distributed communication. The right fit depends on whether workflow automation, customer support integration, or conversation organization is the priority.",
  "bestFor": {
    "mattermost": "Regulated and technical organizations that want a Slack-like self-hosted platform with built-in workflow automation and DevOps integrations",
    "rocket-chat": "Organizations that want to combine internal team chat with customer-facing omnichannel support in one self-hosted platform",
    "zulip": "Distributed teams that communicate asynchronously and want topic-based threads that keep long-running conversations organized"
  },
  "highlights": [
    {
      "title": "Shared open-source, self-hosted foundation",
      "description": "Mattermost, Rocket.Chat, and Zulip are all open source and offer free self-hosted tiers, positioning them as alternatives to closed platforms like Slack for teams that want data control.",
      "toolSlugs": [
        "mattermost",
        "rocket-chat",
        "zulip"
      ]
    },
    {
      "title": "Built-in workflow automation",
      "description": "Mattermost's Playbooks feature provides checklist-driven workflow automation for incident response and DevOps processes, a capability not native to Rocket.Chat or Zulip.",
      "toolSlugs": [
        "mattermost"
      ]
    },
    {
      "title": "Omnichannel customer support bundled in",
      "description": "Rocket.Chat combines internal team messaging with customer-facing omnichannel support channels, a use case Mattermost and Zulip do not target.",
      "toolSlugs": [
        "rocket-chat"
      ]
    },
    {
      "title": "Topic-based threading for async work",
      "description": "Zulip organizes every conversation into topic threads rather than flat channels, which the vendor positions as better suited to high-volume, asynchronous team communication than Mattermost or Rocket.Chat's channel models.",
      "toolSlugs": [
        "zulip"
      ]
    },
    {
      "title": "Hosted cloud without self-hosting",
      "description": "Zulip offers a free hosted Cloud Free plan for teams that do not want to manage servers, an option not documented for Mattermost or Rocket.Chat.",
      "toolSlugs": [
        "zulip"
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
            "mattermost": "available",
            "rocket-chat": "available",
            "zulip": "available"
          }
        },
        {
          "feature": "Free hosted cloud plan (no self-hosting required)",
          "statuses": {
            "mattermost": "not-documented",
            "rocket-chat": "not-documented",
            "zulip": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration Style",
      "rows": [
        {
          "feature": "Topic-based threaded conversations",
          "statuses": {
            "mattermost": "unavailable",
            "rocket-chat": "unavailable",
            "zulip": "available"
          }
        },
        {
          "feature": "Built-in workflow automation (playbooks or checklists)",
          "statuses": {
            "mattermost": "available",
            "rocket-chat": "not-documented",
            "zulip": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Security and Compliance",
      "rows": [
        {
          "feature": "End-to-end encryption",
          "statuses": {
            "mattermost": "not-documented",
            "rocket-chat": "available",
            "zulip": "not-documented"
          }
        },
        {
          "feature": "Compliance exports and audit logging",
          "statuses": {
            "mattermost": "available",
            "rocket-chat": "not-documented",
            "zulip": "available"
          }
        }
      ]
    },
    {
      "group": "Customer-Facing Tools",
      "rows": [
        {
          "feature": "Omnichannel customer-facing support",
          "statuses": {
            "mattermost": "unavailable",
            "rocket-chat": "available",
            "zulip": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool organizes conversations by topic instead of flat channels?",
      "answer": "Zulip, which threads every conversation by topic to keep long-running discussions organized, unlike Mattermost's and Rocket.Chat's channel-based models."
    },
    {
      "question": "Which tool offers built-in workflow automation for incident response?",
      "answer": "Mattermost, thanks to its Playbooks feature for checklist-driven incident response and workflow automation."
    },
    {
      "question": "Which tool combines team chat with customer-facing support channels?",
      "answer": "Rocket.Chat, which bundles omnichannel customer service alongside standard internal team messaging."
    },
    {
      "question": "Is there a free hosted cloud option that does not require self-hosting?",
      "answer": "Zulip offers a Cloud Free plan for teams that do not want to manage their own servers; Mattermost and Rocket.Chat's documented free tiers are self-hosted."
    },
    {
      "question": "Which tool documents end-to-end encryption as a feature?",
      "answer": "Rocket.Chat lists end-to-end encryption as a feature; Mattermost and Zulip do not document it in the data reviewed here."
    },
    {
      "question": "Which tool is best suited for regulated, DevOps-heavy organizations?",
      "answer": "Mattermost, given its compliance exports, audit logging, and Playbooks workflow automation aimed at technical and regulated teams."
    }
  ]
};

export default mattermostVsRocketChatVsZulipContent;

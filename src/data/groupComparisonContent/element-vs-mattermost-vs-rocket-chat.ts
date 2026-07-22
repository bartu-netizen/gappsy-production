import type { GroupComparisonContent } from './types';

const elementVsMattermostVsRocketChatContent: GroupComparisonContent = {
  "verdict": "Element, Mattermost, and Rocket.Chat are all open-source, self-hostable Slack alternatives aimed at security-conscious and regulated organizations, but each has a distinct angle: Element leans on Matrix's federated, end-to-end encrypted protocol, Mattermost adds built-in Playbooks workflow automation for DevOps and incident response, and Rocket.Chat bundles internal team chat with omnichannel customer-facing support. The best choice depends on whether federation, workflow automation, or customer support integration matters most.",
  "bestFor": {
    "element": "Organizations that need federated, end-to-end encrypted chat with sovereign or air-gapped deployment options for government and defense use cases",
    "mattermost": "Regulated and technical organizations that want a Slack-like self-hosted platform with built-in workflow automation and DevOps integrations",
    "rocket-chat": "Organizations that want to combine internal team chat with customer-facing omnichannel support in one self-hosted platform"
  },
  "highlights": [
    {
      "title": "Shared open-source, self-hosted foundation",
      "description": "Element, Mattermost, and Rocket.Chat are all open source and offer free self-hosted tiers, giving regulated organizations control over data residency that closed SaaS platforms cannot match.",
      "toolSlugs": [
        "element",
        "mattermost",
        "rocket-chat"
      ]
    },
    {
      "title": "Matrix federation and decentralization",
      "description": "Element's Matrix protocol allows independently run servers to communicate with each other, a decentralized architecture neither Mattermost nor Rocket.Chat's core chat product replicates.",
      "toolSlugs": [
        "element"
      ]
    },
    {
      "title": "Built-in workflow automation",
      "description": "Mattermost's Playbooks feature provides checklist-driven workflow automation for incident response and DevOps processes that is not native to Slack or the other two tools compared here.",
      "toolSlugs": [
        "mattermost"
      ]
    },
    {
      "title": "Omnichannel customer support bundled in",
      "description": "Rocket.Chat combines internal team messaging with customer-facing omnichannel support channels in a single platform, a use case Element and Mattermost do not target.",
      "toolSlugs": [
        "rocket-chat"
      ]
    },
    {
      "title": "Government and defense-grade deployments",
      "description": "All three tools have documented traction in regulated, government, or defense environments, though Element and Rocket.Chat explicitly market government and defense-grade deployment options.",
      "toolSlugs": [
        "element",
        "rocket-chat"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Architecture",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "element": "available",
            "mattermost": "available",
            "rocket-chat": "available"
          }
        },
        {
          "feature": "Federated, decentralized architecture",
          "statuses": {
            "element": "available",
            "mattermost": "unavailable",
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
            "mattermost": "not-documented",
            "rocket-chat": "available"
          }
        },
        {
          "feature": "Air-gapped or sovereign-grade deployment",
          "statuses": {
            "element": "available",
            "mattermost": "available",
            "rocket-chat": "available"
          }
        }
      ]
    },
    {
      "group": "Workflow and Support",
      "rows": [
        {
          "feature": "Built-in workflow automation (playbooks or checklists)",
          "statuses": {
            "element": "unavailable",
            "mattermost": "available",
            "rocket-chat": "not-documented"
          }
        },
        {
          "feature": "Omnichannel customer-facing support",
          "statuses": {
            "element": "unavailable",
            "mattermost": "unavailable",
            "rocket-chat": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "statuses": {
            "element": "available",
            "mattermost": "available",
            "rocket-chat": "available"
          },
          "note": "Rocket.Chat's free Community edition caps out at fifty users before requiring a paid plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these tools is best for DevOps teams that want built-in workflow automation?",
      "answer": "Mattermost, thanks to its Playbooks feature for checklist-driven incident response and workflow automation."
    },
    {
      "question": "Which tool combines internal chat with customer-facing support?",
      "answer": "Rocket.Chat, which bundles omnichannel customer service alongside standard team messaging."
    },
    {
      "question": "Which tool uses a federated protocol that lets independently run servers talk to each other?",
      "answer": "Element, built on the Matrix protocol, though Rocket.Chat also lists federation support as a feature."
    },
    {
      "question": "Do all three support air-gapped or government-grade deployments?",
      "answer": "Yes, all three offer deployment options aimed at regulated, government, or defense environments, though the exact certifications and pricing require contacting sales."
    },
    {
      "question": "Is there a free self-hosted option for each tool?",
      "answer": "Yes. Element's Community tier, Mattermost's Starter tier, and Rocket.Chat's Community edition are all free to self-host, though Rocket.Chat's free tier caps out at fifty users."
    },
    {
      "question": "Which tools document end-to-end encryption as a feature?",
      "answer": "Element and Rocket.Chat both list end-to-end encryption; Mattermost does not document it as a core feature in the data reviewed here."
    }
  ]
};

export default elementVsMattermostVsRocketChatContent;

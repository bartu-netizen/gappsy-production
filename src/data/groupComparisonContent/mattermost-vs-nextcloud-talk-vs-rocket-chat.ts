import type { GroupComparisonContent } from './types';

const mattermostVsNextcloudTalkVsRocketChatContent: GroupComparisonContent = {
  "verdict": "Mattermost, Nextcloud Talk, and Rocket.Chat are all self-hostable, open-source communication platforms, but they emphasize different parts of the stack. Mattermost and Rocket.Chat are closest to direct Slack alternatives built around channel-based team messaging, with Mattermost differentiating through Playbooks workflow automation and developer tool integrations, and Rocket.Chat differentiating through omnichannel customer support and government/defense-grade compliance certifications. Nextcloud Talk is positioned more as the audio, video, and chat module of the broader Nextcloud collaboration suite, making it the strongest fit for teams already invested in Nextcloud's file-sync and document ecosystem.",
  "bestFor": {
    "mattermost": "Software engineering, DevOps, and incident-response teams that want Slack-style channels plus Playbooks-driven workflow automation and deep developer tool integrations, self-hosted or air-gapped.",
    "nextcloud-talk": "Organizations already using or considering Nextcloud's file-sync and collaboration suite that want video calls, screen sharing, and chat bundled into the same self-hosted, privacy-focused platform.",
    "rocket-chat": "Teams that want a single self-hosted platform covering both internal messaging and customer-facing omnichannel support, plus government and defense organizations that need FIPS-validated, air-gapped deployments."
  },
  "highlights": [
    {
      "title": "Mattermost's Playbooks automate incident response",
      "description": "Playbooks lets teams build repeatable, checklist-driven processes such as incident response or onboarding, automatically creating a dedicated channel with tasks, owners, and status tracking when triggered.",
      "toolSlugs": [
        "mattermost"
      ]
    },
    {
      "title": "Rocket.Chat combines team chat with customer-facing support",
      "description": "Rocket.Chat's omnichannel tools let the same platform handle internal team messaging and customer-facing support conversations, alongside FIPS 140-3 validated cryptography and SCIF-ready deployment options for regulated customers.",
      "toolSlugs": [
        "rocket-chat"
      ]
    },
    {
      "title": "Nextcloud Talk is bundled inside a broader collaboration suite",
      "description": "Talk ships as part of every Nextcloud installation, bringing voice and video calls, messaging, file sharing, and joint document editing together in one interface instead of a separate, standalone chat app.",
      "toolSlugs": [
        "nextcloud-talk"
      ]
    },
    {
      "title": "Free self-hosted tiers differ on user caps",
      "description": "Mattermost's Starter tier and Nextcloud Talk's Community core are both free and self-hosted with no documented user cap, while Rocket.Chat's free Community edition caps out at 50 users before requiring a paid plan.",
      "toolSlugs": [
        "mattermost",
        "nextcloud-talk",
        "rocket-chat"
      ]
    },
    {
      "title": "End-to-end encryption is documented for two of the three",
      "description": "Rocket.Chat documents end-to-end encryption on its free Community edition and all paid tiers, and Nextcloud Talk offers optional end-to-end encrypted calls on web and desktop clients. E2E encryption is not documented for Mattermost.",
      "toolSlugs": [
        "rocket-chat",
        "nextcloud-talk"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Communication",
      "rows": [
        {
          "feature": "Channel-based team messaging (Slack-style)",
          "statuses": {
            "mattermost": "available",
            "nextcloud-talk": "not-documented",
            "rocket-chat": "available"
          },
          "note": "Nextcloud Talk's documented core is 1:1 and group audio/video calls plus chat rather than a channel-organized messaging system."
        },
        {
          "feature": "Native voice/video calling",
          "statuses": {
            "mattermost": "available",
            "nextcloud-talk": "available",
            "rocket-chat": "available"
          }
        },
        {
          "feature": "End-to-end encryption",
          "statuses": {
            "mattermost": "not-documented",
            "nextcloud-talk": "available",
            "rocket-chat": "available"
          }
        }
      ]
    },
    {
      "group": "Workflow and Extensibility",
      "rows": [
        {
          "feature": "Workflow automation (playbooks/checklists)",
          "statuses": {
            "mattermost": "available",
            "nextcloud-talk": "not-documented",
            "rocket-chat": "limited"
          },
          "note": "Rocket.Chat's apps marketplace and bot framework support custom automation, but no dedicated playbook feature is documented."
        },
        {
          "feature": "Omnichannel customer-facing support",
          "statuses": {
            "mattermost": "not-documented",
            "nextcloud-talk": "not-documented",
            "rocket-chat": "available"
          }
        },
        {
          "feature": "Named developer/DevOps tool integrations (GitHub, Jira, ServiceNow, etc.)",
          "statuses": {
            "mattermost": "available",
            "nextcloud-talk": "not-documented",
            "rocket-chat": "limited"
          },
          "note": "Rocket.Chat offers a general apps marketplace and API, but specific DevOps integrations aren't named the way Mattermost's are."
        }
      ]
    },
    {
      "group": "Deployment and Compliance",
      "rows": [
        {
          "feature": "Free self-hosted tier with no documented user cap",
          "statuses": {
            "mattermost": "available",
            "nextcloud-talk": "available",
            "rocket-chat": "limited"
          },
          "note": "Rocket.Chat's free Community edition is capped at 50 users."
        },
        {
          "feature": "Government/defense-grade compliance certifications (e.g. FIPS)",
          "statuses": {
            "mattermost": "not-documented",
            "nextcloud-talk": "not-documented",
            "rocket-chat": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these is closest to a direct Slack replacement?",
      "answer": "Mattermost and Rocket.Chat are both built around channel-based team messaging similar to Slack. Nextcloud Talk is documented more as a video/audio-calling and chat module bundled inside the broader Nextcloud collaboration suite, rather than a standalone channel-first chat app."
    },
    {
      "question": "Which is truly free to self-host without a user cap?",
      "answer": "Mattermost's Starter tier and Nextcloud Talk's Community core are both free, self-hosted, and documented without a user limit. Rocket.Chat's free Community edition caps out at 50 users before a paid plan is required."
    },
    {
      "question": "Which has government or defense-grade certifications?",
      "answer": "Rocket.Chat's Enterprise/Government/Defense tier documents support for FIPS 140-3 cryptography plus SCIF-ready, air-gapped deployments aimed at regulated and public-sector buyers. Neither Mattermost nor Nextcloud Talk documents this."
    },
    {
      "question": "Do these tools support end-to-end encryption?",
      "answer": "Rocket.Chat documents end-to-end encryption on its free Community edition and all paid tiers, and Nextcloud Talk offers optional end-to-end encrypted calls for web and desktop clients. End-to-end encryption is not documented for Mattermost."
    },
    {
      "question": "Which is best for teams already using a broader collaboration suite?",
      "answer": "Nextcloud Talk is the strongest fit here, since it ships as part of every Nextcloud installation and lets calls, chat, file sharing, and document editing happen within the same interface."
    },
    {
      "question": "Which offers built-in workflow automation for incident response?",
      "answer": "Mattermost's Playbooks feature is purpose-built for this, automatically creating a dedicated channel with tasks, owners, and status tracking when a workflow like incident response is triggered."
    }
  ]
};

export default mattermostVsNextcloudTalkVsRocketChatContent;

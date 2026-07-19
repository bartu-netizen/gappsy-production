import type { GroupComparisonContent } from './types';

const elementVsMattermostVsNextcloudTalkContent: GroupComparisonContent = {
  "verdict": "Element, Mattermost, and Nextcloud Talk all let organizations run team communication on their own infrastructure instead of a vendor's cloud, but they solve different problems. Element is the choice when federation and default end-to-end encryption matter most, especially for government and security-conscious deployments. Mattermost leans developer- and DevOps-centric, pairing Slack-style channels with Playbooks for incident response workflows. Nextcloud Talk is less a standalone chat product and more a communication layer bundled into a broader self-hosted file and collaboration suite, making it the natural fit for teams already on Nextcloud.",
  "bestFor": {
    "element": "Privacy-focused organizations, government agencies, and communities that want federated, end-to-end encrypted chat with the flexibility to interoperate across independently run servers.",
    "mattermost": "Engineering, DevOps, and incident-response teams that want Slack-style self-hosted chat paired with Playbooks for structured, repeatable workflows.",
    "nextcloud-talk": "Organizations already running Nextcloud, or those under GDPR, who want video and chat bundled with file sharing and document collaboration in one self-hosted suite."
  },
  "highlights": [
    {
      "title": "Federation is Element's defining trait",
      "description": "Element is built on the open Matrix protocol, so organizations can self-host a homeserver that still interoperates with other Matrix servers, a capability neither Mattermost nor Nextcloud Talk offers.",
      "toolSlugs": [
        "element"
      ]
    },
    {
      "title": "Mattermost turns chat into workflow automation",
      "description": "Playbooks let Mattermost teams trigger a dedicated channel with tasks, owners, and status tracking for incident response or onboarding, a feature not present in Element or Nextcloud Talk.",
      "toolSlugs": [
        "mattermost"
      ]
    },
    {
      "title": "Nextcloud Talk ships inside a full collaboration suite",
      "description": "Calls and chat sit alongside file sharing and document editing in the same Nextcloud interface, so teams already using Nextcloud get communication without adding a separate app.",
      "toolSlugs": [
        "nextcloud-talk"
      ]
    },
    {
      "title": "All three avoid per-user SaaS lock-in",
      "description": "Each tool ships a free, self-hostable core under an open-source license, letting organizations run production chat without a mandatory per-seat subscription.",
      "toolSlugs": [
        "element",
        "mattermost",
        "nextcloud-talk"
      ]
    },
    {
      "title": "Encryption depth varies sharply",
      "description": "Element enables end-to-end encryption by default in private rooms and Nextcloud Talk offers optional end-to-end encrypted calls, while Mattermost's provided feature set centers on transport-level security rather than native end-to-end message encryption.",
      "toolSlugs": [
        "element",
        "mattermost",
        "nextcloud-talk"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Security and Architecture",
      "rows": [
        {
          "feature": "End-to-end encrypted messaging or calls",
          "statuses": {
            "element": "available",
            "mattermost": "unavailable",
            "nextcloud-talk": "available"
          },
          "note": "Element encrypts private rooms by default; Nextcloud Talk offers optional E2E encrypted calls; Mattermost's documented features center on transport and at-rest security."
        },
        {
          "feature": "Federated, multi-server architecture",
          "statuses": {
            "element": "available",
            "mattermost": "unavailable",
            "nextcloud-talk": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Deployment and Administration",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "element": "available",
            "mattermost": "available",
            "nextcloud-talk": "available"
          }
        },
        {
          "feature": "Free tier without a hard user cap",
          "statuses": {
            "element": "limited",
            "mattermost": "available",
            "nextcloud-talk": "available"
          },
          "note": "Element's free Community tier is aimed at deployments of up to about 100 users."
        },
        {
          "feature": "SSO or LDAP/Active Directory sync",
          "statuses": {
            "element": "limited",
            "mattermost": "limited",
            "nextcloud-talk": "limited"
          },
          "note": "All three reserve directory integration for paid Enterprise-level tiers."
        }
      ]
    },
    {
      "group": "Collaboration Features",
      "rows": [
        {
          "feature": "Built-in voice and video calling",
          "statuses": {
            "element": "available",
            "mattermost": "available",
            "nextcloud-talk": "available"
          }
        },
        {
          "feature": "Checklist-driven workflow automation",
          "statuses": {
            "element": "unavailable",
            "mattermost": "available",
            "nextcloud-talk": "unavailable"
          },
          "note": "Mattermost's Playbooks is the workflow automation feature among the three."
        },
        {
          "feature": "Bundled file sharing and document editing",
          "statuses": {
            "element": "unavailable",
            "mattermost": "unavailable",
            "nextcloud-talk": "available"
          },
          "note": "Nextcloud Talk shares an interface with Nextcloud's file sync and Nextcloud Office."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three offers real end-to-end encryption?",
      "answer": "Element enables end-to-end encryption by default in private rooms using the Olm and Megolm ratchets, and Nextcloud Talk offers optional end-to-end encrypted calls on web and desktop. Mattermost's documented feature set focuses on transport-level and at-rest security rather than native end-to-end encrypted messaging."
    },
    {
      "question": "Can any of these run without hitting a user cap on the free tier?",
      "answer": "Mattermost's free Starter edition and Nextcloud Talk's free Community edition don't publish a hard user cap, while Element's free Community tier is aimed at self-hosted deployments of up to roughly 100 users before Enterprise pricing applies."
    },
    {
      "question": "Which tool is best for incident response workflows?",
      "answer": "Mattermost is the clear fit here, thanks to Playbooks, which automatically creates a dedicated channel with tasks, owners, and status tracking when a workflow is triggered. Neither Element nor Nextcloud Talk offers an equivalent built-in workflow automation feature."
    },
    {
      "question": "Do any of these tools federate with servers run by other organizations?",
      "answer": "Only Element does, because it's built on the open Matrix protocol. Mattermost and Nextcloud Talk are designed as standalone, single-organization deployments without federation between separate instances."
    },
    {
      "question": "Which integrates most tightly with existing file storage and document tools?",
      "answer": "Nextcloud Talk, since it ships as part of the broader Nextcloud platform and shares its interface with file sync, sharing, and Nextcloud Office document editing."
    },
    {
      "question": "Is there a hosted option for teams that don't want to manage their own servers?",
      "answer": "Yes for all three: Element offers Element Enterprise Cloud, Mattermost offers Mattermost Cloud, and Nextcloud offers its own hosted Nextcloud.online option alongside hosting partners, so teams can trade some self-hosting control for a managed service."
    }
  ]
};

export default elementVsMattermostVsNextcloudTalkContent;

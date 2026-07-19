import type { GroupComparisonContent } from './types';

const elementVsMattermostVsZulipContent: GroupComparisonContent = {
  "verdict": "Element, Mattermost, and Zulip are all open-source, self-hostable alternatives to Slack, but they optimize for different priorities. Element leans hardest into federated architecture and end-to-end encryption by default, with a dedicated Sovereign tier for air-gapped government deployments. Mattermost is built for engineering and incident-response teams through its Playbooks workflow automation and deep DevOps integrations. Zulip's topic-based threading model is the standout choice for distributed teams that need organized, asynchronous discussion rather than a flat real-time feed.",
  "bestFor": {
    "element": "Organizations that need federated, end-to-end-encrypted messaging with air-gapped or sovereign deployment options, especially government and defense",
    "mattermost": "Engineering, DevOps, and incident-response teams that want built-in workflow automation and deep developer tool integrations",
    "zulip": "Distributed, asynchronous teams that need organized, searchable topic-based conversations instead of a flat channel feed"
  },
  "highlights": [
    {
      "title": "Element is built for sovereignty and government-grade security",
      "description": "Element's AGPL-licensed Community edition has no artificial caps, and its Sovereign tier supports fully air-gapped deployments, with a track record including France's Tchap and Germany's BwMessenger.",
      "toolSlugs": [
        "element"
      ]
    },
    {
      "title": "Mattermost's Playbooks automate incident response",
      "description": "Mattermost's signature Playbooks feature triggers a dedicated channel with tasks, owners, and status tracking for repeatable processes like incident response or onboarding, something neither Element nor Zulip offers.",
      "toolSlugs": [
        "mattermost"
      ]
    },
    {
      "title": "Zulip organizes conversation by topic, not just channel",
      "description": "Every Zulip message is filed under a named topic within a stream, letting distributed teams follow multiple parallel discussions without losing context, a structural difference from both Element's and Mattermost's channel models.",
      "toolSlugs": [
        "zulip"
      ]
    },
    {
      "title": "All three offer a free, self-hosted tier",
      "description": "Element's Community edition, Mattermost's Starter tier, and Zulip's self-hosted Free plan all let organizations run the full core product on their own infrastructure at no cost.",
      "toolSlugs": [
        "element",
        "mattermost",
        "zulip"
      ]
    },
    {
      "title": "Enterprise pricing is undisclosed across the board",
      "description": "Element's Enterprise and Sovereign tiers, Mattermost's Enterprise tier, and Zulip's Self-Hosted Enterprise plan are all custom-quoted, requiring a sales conversation to get a number.",
      "toolSlugs": [
        "element",
        "mattermost",
        "zulip"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Architecture",
      "rows": [
        {
          "feature": "Self-hosted free tier",
          "statuses": {
            "element": "limited",
            "mattermost": "available",
            "zulip": "available"
          },
          "note": "Element's free Community tier is intended for self-hosted deployments of up to roughly 100 users; Mattermost's Starter and Zulip's self-hosted Free plan do not document a similar user cap."
        },
        {
          "feature": "Federated, decentralized architecture",
          "statuses": {
            "element": "available",
            "mattermost": "not-documented",
            "zulip": "not-documented"
          }
        },
        {
          "feature": "Air-gapped or sovereign deployment",
          "statuses": {
            "element": "available",
            "mattermost": "available",
            "zulip": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Security",
      "rows": [
        {
          "feature": "End-to-end encryption by default",
          "statuses": {
            "element": "available",
            "mattermost": "not-documented",
            "zulip": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Collaboration and Workflow",
      "rows": [
        {
          "feature": "Topic-based threading",
          "statuses": {
            "element": "not-documented",
            "mattermost": "not-documented",
            "zulip": "available"
          }
        },
        {
          "feature": "Built-in workflow automation (Playbooks-style)",
          "statuses": {
            "element": "not-documented",
            "mattermost": "available",
            "zulip": "not-documented"
          }
        },
        {
          "feature": "Voice and video calls",
          "statuses": {
            "element": "available",
            "mattermost": "available",
            "zulip": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Enterprise and Admin",
      "rows": [
        {
          "feature": "SSO and directory sync",
          "statuses": {
            "element": "available",
            "mattermost": "available",
            "zulip": "available"
          },
          "note": "Reserved for the paid Enterprise-level tier on all three."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Element, Mattermost, and Zulip is easiest to self-host?",
      "answer": "Mattermost is generally the lightest to stand up, since it runs as a single Go binary with a PostgreSQL database, whereas Element's Synapse homeserver and Zulip's self-hosted stack involve more moving parts."
    },
    {
      "question": "Which one has true end-to-end encryption by default?",
      "answer": "Element, whose private rooms are encrypted by default using the Olm and Megolm cryptographic ratchets built on the Matrix protocol."
    },
    {
      "question": "Is Zulip's topic-based threading really different from Slack-style channels?",
      "answer": "Yes. Every message in Zulip is filed under a named topic within a stream, which keeps parallel conversations organized in a way flat channel-based chat in Mattermost or Element does not replicate natively."
    },
    {
      "question": "Which is the strongest fit for government or defense-grade security requirements?",
      "answer": "Element, given its dedicated Sovereign tier for fully air-gapped, internet-free deployments and its track record with government messaging projects in France and Germany."
    },
    {
      "question": "Do any of these three have a genuinely free tier for self-hosting?",
      "answer": "Yes, all three: Element's Community edition, Mattermost's Starter tier, and Zulip's self-hosted Free plan are all free to run on your own infrastructure."
    },
    {
      "question": "Which is best suited for engineering and incident-response teams specifically?",
      "answer": "Mattermost, thanks to its Playbooks workflow automation and native integrations with GitHub, GitLab, Jenkins, Jira, and ServiceNow."
    }
  ]
};

export default elementVsMattermostVsZulipContent;

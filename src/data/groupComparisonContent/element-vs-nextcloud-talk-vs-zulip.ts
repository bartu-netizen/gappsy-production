import type { GroupComparisonContent } from './types';

const elementVsNextcloudTalkVsZulipContent: GroupComparisonContent = {
  "verdict": "Element, Nextcloud Talk, and Zulip are all open-source, self-hostable alternatives to Slack, but they optimize for different things: Element leans on Matrix's federated, end-to-end encrypted architecture for security and data sovereignty, Nextcloud Talk is a chat and calling module built to extend an existing Nextcloud deployment, and Zulip is organized around topic-based threads for asynchronous, distributed teams. Picking between them depends on whether federation, suite integration, or conversation organization matters most.",
  "bestFor": {
    "element": "Security- and sovereignty-focused organizations, including government and defense teams, that need federated, end-to-end encrypted chat with air-gapped deployment options",
    "nextcloud-talk": "Teams already running Nextcloud for files and collaboration who want self-hosted chat, calls, and webinars integrated directly into that suite",
    "zulip": "Distributed teams that communicate asynchronously and want topic-based threads that keep long-running conversations organized"
  },
  "highlights": [
    {
      "title": "Shared open-source, self-hostable foundation",
      "description": "Element, Nextcloud Talk, and Zulip are all released under open-source licenses and can be fully self-hosted, giving organizations control over data residency that closed platforms cannot match.",
      "toolSlugs": [
        "element",
        "nextcloud-talk",
        "zulip"
      ]
    },
    {
      "title": "Federated architecture and government adoption",
      "description": "Element's Matrix protocol lets independently run servers communicate with each other, and it has a documented track record with government and defense customers in France and Germany.",
      "toolSlugs": [
        "element"
      ]
    },
    {
      "title": "Built into a broader collaboration suite",
      "description": "Nextcloud Talk is a module inside the wider Nextcloud platform, so chat, calls, and screen sharing sit alongside the same organization's existing files and collaboration tools rather than as a standalone app.",
      "toolSlugs": [
        "nextcloud-talk"
      ]
    },
    {
      "title": "Topic-based threading for async work",
      "description": "Zulip organizes every conversation into topic threads rather than flat channels, which the vendor positions as better suited to high-volume, asynchronous team communication.",
      "toolSlugs": [
        "zulip"
      ]
    },
    {
      "title": "Free hosted cloud without server management",
      "description": "Zulip offers a genuinely free hosted Cloud Free plan for teams that do not want to self-host at all, an option Element and Nextcloud Talk do not offer on their free tiers.",
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
            "element": "available",
            "nextcloud-talk": "available",
            "zulip": "available"
          }
        },
        {
          "feature": "Free hosted cloud plan (no self-hosting required)",
          "statuses": {
            "element": "unavailable",
            "nextcloud-talk": "unavailable",
            "zulip": "available"
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
            "zulip": "not-documented"
          }
        },
        {
          "feature": "Federation across independently run servers",
          "statuses": {
            "element": "available",
            "nextcloud-talk": "not-documented",
            "zulip": "not-documented"
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
            "element": "unavailable",
            "nextcloud-talk": "unavailable",
            "zulip": "available"
          }
        },
        {
          "feature": "Native voice and video calling",
          "statuses": {
            "element": "available",
            "nextcloud-talk": "available",
            "zulip": "not-documented"
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
            "zulip": "unavailable"
          },
          "note": "Nextcloud Talk is a module of the wider Nextcloud collaboration platform"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these tools organizes conversations by topic rather than flat channels?",
      "answer": "Zulip, which threads every conversation by topic to keep long-running discussions organized, unlike Element's rooms or Nextcloud Talk's conversation model."
    },
    {
      "question": "Which is the best fit if we already use Nextcloud for files and collaboration?",
      "answer": "Nextcloud Talk, since it is built directly into the Nextcloud platform rather than operating as a separate standalone app."
    },
    {
      "question": "Do all three support self-hosting?",
      "answer": "Yes. Element, Nextcloud Talk, and Zulip can all be self-hosted, though Zulip is the only one of the three that also offers a genuinely free hosted cloud plan."
    },
    {
      "question": "Which tool is best suited to government or defense deployments?",
      "answer": "Element, which has a documented track record with government and defense customers, including messaging platforms built for the French government and the German Armed Forces, and offers an air-gapped Sovereign tier."
    },
    {
      "question": "Is end-to-end encryption available in all three?",
      "answer": "Element and Nextcloud Talk both offer end-to-end encryption; Zulip does not document end-to-end encryption as a feature."
    },
    {
      "question": "Which supports large-scale webinars rather than just small team calls?",
      "answer": "Nextcloud Talk, which can scale from small one-to-one calls to large webinars using its High Performance Backend add-on."
    }
  ]
};

export default elementVsNextcloudTalkVsZulipContent;

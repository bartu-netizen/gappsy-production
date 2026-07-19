import type { GroupComparisonContent } from './types';

const nextcloudTalkVsRocketChatVsZulipContent: GroupComparisonContent = {
  "verdict": "Nextcloud Talk, Rocket.Chat, and Zulip are all open-source, self-hostable team chat platforms built around data control rather than SaaS convenience, but they solve different problems. Nextcloud Talk is the strongest fit for teams already running Nextcloud who want calls and chat folded into their existing collaboration suite, Rocket.Chat is built for organizations that need government or defense-grade compliance and omnichannel customer support alongside internal messaging, and Zulip is purpose-built for distributed, asynchronous teams that need topic-threaded conversations to stay organized. Each ships a genuinely free self-hosted core, so the choice mostly comes down to which specialization matters most.",
  "bestFor": {
    "nextcloud-talk": "Organizations already running Nextcloud that want calls, chat, and file collaboration in one integrated interface without adding a separate vendor",
    "rocket-chat": "Government, defense, and regulated organizations that need air-gapped or FIPS-validated deployments alongside omnichannel customer support",
    "zulip": "Distributed engineering, research, and open-source teams that need organized, searchable topic-threaded conversations for async collaboration"
  },
  "highlights": [
    {
      "title": "Deepest ecosystem integration",
      "description": "Nextcloud Talk is bundled directly into Nextcloud, so calls, chat, file sharing, and collaborative document editing happen in one interface rather than a separate app.",
      "toolSlugs": [
        "nextcloud-talk"
      ]
    },
    {
      "title": "Government and defense-grade compliance",
      "description": "Rocket.Chat offers FIPS 140-3 validated cryptography and air-gapped, SCIF-ready deployment options aimed squarely at public-sector and defense customers.",
      "toolSlugs": [
        "rocket-chat"
      ]
    },
    {
      "title": "Topic-based threading for async teams",
      "description": "Zulip files every message under a named topic within a stream, letting distributed teams follow multiple parallel conversations without losing context.",
      "toolSlugs": [
        "zulip"
      ]
    },
    {
      "title": "Free, self-hosted core on all three",
      "description": "Each platform offers a genuinely free, self-hostable community edition, so organizations can run any of them without per-seat licensing costs.",
      "toolSlugs": [
        "nextcloud-talk",
        "rocket-chat",
        "zulip"
      ]
    },
    {
      "title": "Chat plus customer-facing support in one platform",
      "description": "Rocket.Chat combines internal team messaging with omnichannel customer service tools, a capability the other two do not offer.",
      "toolSlugs": [
        "rocket-chat"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Hosting",
      "rows": [
        {
          "feature": "Free, self-hosted open-source core",
          "statuses": {
            "nextcloud-talk": "available",
            "rocket-chat": "available",
            "zulip": "available"
          }
        },
        {
          "feature": "Vendor-managed cloud hosting option",
          "statuses": {
            "nextcloud-talk": "available",
            "rocket-chat": "not-documented",
            "zulip": "available"
          },
          "note": "Nextcloud Talk can run via Nextcloud's own cloud offering or hosting partners; Zulip offers Zulip Cloud directly; Rocket.Chat's published options are self-managed on-prem, private cloud, or VPC rather than a first-party managed SaaS."
        }
      ]
    },
    {
      "group": "Security and Compliance",
      "rows": [
        {
          "feature": "End-to-end encrypted calls or messages",
          "statuses": {
            "nextcloud-talk": "available",
            "rocket-chat": "available",
            "zulip": "not-documented"
          }
        },
        {
          "feature": "Government or defense-grade certification (FIPS, air-gapped)",
          "statuses": {
            "nextcloud-talk": "not-documented",
            "rocket-chat": "available",
            "zulip": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Communication Features",
      "rows": [
        {
          "feature": "Topic-based threaded conversations",
          "statuses": {
            "nextcloud-talk": "unavailable",
            "rocket-chat": "unavailable",
            "zulip": "available"
          }
        },
        {
          "feature": "Omnichannel customer-facing support",
          "statuses": {
            "nextcloud-talk": "unavailable",
            "rocket-chat": "available",
            "zulip": "unavailable"
          }
        },
        {
          "feature": "Large-scale webinar or broadcast calls",
          "statuses": {
            "nextcloud-talk": "available",
            "rocket-chat": "not-documented",
            "zulip": "not-documented"
          },
          "note": "Nextcloud Talk's scale-up path is its separately licensed High Performance Backend add-on."
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Published per-user paid cloud pricing",
          "statuses": {
            "nextcloud-talk": "unavailable",
            "rocket-chat": "available",
            "zulip": "available"
          },
          "note": "Nextcloud's Enterprise pricing is custom and not publicly listed."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these is easiest to adopt if we already use Nextcloud?",
      "answer": "Nextcloud Talk, since it ships as a built-in module of Nextcloud and shares the same interface as file sharing and document editing, rather than requiring a separate login or app."
    },
    {
      "question": "Which tool is best suited for government or defense use cases?",
      "answer": "Rocket.Chat, which offers FIPS 140-3 validated cryptography and air-gapped, SCIF-ready deployment options specifically aimed at regulated and public-sector customers."
    },
    {
      "question": "Is Zulip's topic-threading model harder to learn than a typical channel-based chat app?",
      "answer": "It has a learning curve for teams used to Slack-style flat channels, but the tradeoff is that conversations stay organized and searchable as volume grows, which is why Zulip markets itself toward async, distributed teams."
    },
    {
      "question": "Do all three offer a managed cloud option, or is self-hosting required?",
      "answer": "Zulip offers a first-party Zulip Cloud service, and Nextcloud Talk can run through Nextcloud's own cloud offering or hosting partners. Rocket.Chat's documented options center on self-managed deployments such as on-premises, private cloud, or VPC rather than a first-party managed SaaS."
    },
    {
      "question": "Which is the cheapest option for a small team just getting started?",
      "answer": "All three offer a free, self-hosted core with no per-user licensing cost, so the real cost difference comes down to infrastructure and, for Rocket.Chat and Zulip, whether you outgrow the free user or feature caps and move to a paid tier."
    }
  ]
};

export default nextcloudTalkVsRocketChatVsZulipContent;

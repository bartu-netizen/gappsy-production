import type { ToolComparisonContent } from './types';

const mastodonVsPostizContent: ToolComparisonContent = {
  "verdict": "Mastodon and postiz occupy different layers of the social media stack: Mastodon is a free, open-source social network you post to, while postiz is a paid social media scheduling and management dashboard for other networks (Threads, LinkedIn, Google Business Profile, Instagram, X, and Bluesky are its documented platforms). postiz's feature set, including an AI-agent CLI for programmatic scheduling, is not documented to include Mastodon as a supported platform.",
  "bestForToolA": "Mastodon fits people and organizations who want to own and self-host their social presence on an ad-free, chronological, federated network, with official iOS and Android apps for day-to-day posting.",
  "bestForToolB": "postiz fits teams that need to schedule and manage posts across Threads, LinkedIn, Google Business Profile, Instagram, X, and Bluesky from one dashboard, including AI agents that schedule posts programmatically via its dedicated CLI.",
  "whoNeedsBoth": "A brand could maintain a self-hosted Mastodon presence for direct community engagement while using postiz to schedule and manage posts across its other accounts (LinkedIn, X, Instagram, Bluesky, Threads, Google Business Profile) — though Mastodon posts themselves would still need to be handled outside postiz since it isn't a documented supported platform.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Mastodon is the social network itself — a federated, ActivityPub-based microblogging platform.",
      "toolB": "postiz is a scheduling and management layer that sits on top of other social networks, not a network of its own.",
      "whyItMatters": "The two tools solve different problems and are typically used together rather than as alternatives to each other.",
      "benefitsWho": "Marketing teams scoping what each tool does before evaluating them."
    },
    {
      "title": "Pricing",
      "toolA": "Mastodon is completely free and open-source, funded by donations and sponsors.",
      "toolB": "postiz is paid, starting at $29/month (Standard plan) with a $39/month Team plan, and offers a free trial.",
      "whyItMatters": "Mastodon has zero licensing cost, while postiz is a recurring subscription cost tied to team size and usage.",
      "benefitsWho": "Budget-conscious individuals and communities (Mastodon) versus teams that need multi-account scheduling and are willing to pay for it (postiz)."
    },
    {
      "title": "Documented Platform Coverage",
      "toolA": "Mastodon interoperates with the wider ActivityPub fediverse but is not built to post to closed platforms like Instagram or LinkedIn.",
      "toolB": "postiz documents support for Threads, LinkedIn, Google Business Profile, Instagram, X, and Bluesky, each with platform-specific post formats such as Reels, Carousels, and Articles — Mastodon is not listed among its supported platforms.",
      "whyItMatters": "Teams wanting a single dashboard to schedule to Mastodon alongside other networks won't find that documented in postiz today.",
      "benefitsWho": "Social media managers mapping exact platform coverage before adopting a scheduling tool."
    },
    {
      "title": "AI-Agent Scheduling",
      "toolA": "Mastodon does not document any AI-agent scheduling or CLI tooling.",
      "toolB": "postiz exposes a dedicated CLI built specifically for AI agents to schedule and manage social posts programmatically, separate from its human dashboard.",
      "whyItMatters": "Teams automating posting through AI agents have a purpose-built integration path only with postiz.",
      "benefitsWho": "Developers and marketing-ops teams building AI-driven content pipelines."
    },
    {
      "title": "Self-Hosting",
      "toolA": "Mastodon is fully self-hostable, giving the operator complete control over their instance and data.",
      "toolB": "postiz's facts do not document a self-hosted deployment option; it is presented as a hosted paid product.",
      "whyItMatters": "Organizations requiring full data ownership of their posting infrastructure only have that option with Mastodon.",
      "benefitsWho": "Privacy-focused organizations and communities that want to run their own infrastructure."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Social network / posting destination",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "postiz manages posts to other networks, it is not one itself."
        },
        {
          "feature": "Multi-account scheduling dashboard",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Platform-specific post formats (Reels, Carousels, Articles)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Automation",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "postiz starts at $29/month."
        },
        {
          "feature": "AI-agent CLI for programmatic scheduling",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Reach & Access",
      "rows": [
        {
          "feature": "Federated / ActivityPub interoperability",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Documented support for Threads, LinkedIn, GBP, Instagram, X, Bluesky",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Official mobile apps",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does postiz support scheduling posts to Mastodon?",
      "answer": "This is not documented. postiz's listed platforms are Threads, LinkedIn, Google Business Profile, Instagram, X, and Bluesky; Mastodon is not among them."
    },
    {
      "question": "Is Mastodon free to use?",
      "answer": "Yes. Mastodon is entirely free and open-source software, sustained by donations rather than paid tiers."
    },
    {
      "question": "How much does postiz cost?",
      "answer": "postiz starts at $29/month on the Standard plan, with a Team plan at $39/month, and offers a free trial."
    },
    {
      "question": "Does postiz support AI agents scheduling posts?",
      "answer": "Yes. postiz exposes a dedicated CLI built specifically for AI agents to schedule and manage social posts programmatically."
    },
    {
      "question": "Can I self-host Mastodon like I might self-host other tools?",
      "answer": "Yes. Mastodon can be fully self-hosted for complete control over data and moderation, or you can join an existing public instance such as mastodon.social."
    },
    {
      "question": "Are Mastodon and postiz used for the same purpose?",
      "answer": "No. Mastodon is a social network you post to directly, while postiz is a paid dashboard for scheduling and managing posts across other networks like LinkedIn, X, and Instagram."
    }
  ]
};

export default mastodonVsPostizContent;

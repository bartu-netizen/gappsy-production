import type { ToolComparisonContent } from './types';

const rocketChatVsZulipContent: ToolComparisonContent = {
  "verdict": "Rocket.Chat and Zulip are both open-source, self-hostable team chat platforms, but they differ sharply on pricing transparency and conversation structure. Rocket.Chat documents the broadest compliance certification list (SOC 2, ISO 27001, GDPR, HIPAA, DoD ATO up to IL6) but keeps its Commercial/Government/Defense pricing behind a sales call. Zulip publishes exact per-user pricing for both cloud and self-hosted tiers and organizes conversations around topic-based threading built for large, asynchronous teams.",
  "bestForToolA": "Rocket.Chat fits organizations needing documented compliance certifications for government, defense, or regulated industries, or federation across separate Rocket.Chat deployments.",
  "bestForToolB": "Zulip fits teams with large, high-volume, asynchronous discussions who want topic-based threading to stay organized, with transparent published pricing starting at $3.50/user/month self-hosted.",
  "whoNeedsBoth": "There's little practical overlap for the same team — both are alternative primary team-chat platforms, so an organization comparing self-hosted chat tools would typically pilot one against the other rather than deploy both for the same user base.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Rocket.Chat's Commercial, Government, and Defense plans all require contacting sales; no price points are published.",
      "toolB": "Zulip publishes exact tiered pricing across cloud and self-hosted: Cloud Standard $6.67/user/month, Cloud Plus $10/user/month, Self-Hosted Basic $3.50/user/month, Self-Hosted Business $6.67/user/month.",
      "whyItMatters": "Published pricing lets buyers budget without a sales cycle.",
      "benefitsWho": "Small and mid-size teams evaluating tools on a tight timeline."
    },
    {
      "title": "Conversation Organization Model",
      "toolA": "Rocket.Chat documents unified messaging (chat, voice, video, screen sharing) without a documented topic-threading model.",
      "toolB": "Zulip organizes conversations into topic-based threads within channels, plus a unified inbox view surfacing unread messages across channels and topics.",
      "whyItMatters": "Topic threading keeps large-volume async conversations navigable rather than a single scrolling stream.",
      "benefitsWho": "Large distributed teams with heavy asynchronous discussion volume."
    },
    {
      "title": "Nonprofit / Open-Source Discounts",
      "toolA": "No discount program for nonprofits or open-source projects is documented.",
      "toolB": "Zulip offers free or discounted access for qualifying open-source projects, nonprofits, and academic research groups.",
      "whyItMatters": "Dedicated discount programs materially lower cost for mission-driven and community organizations.",
      "benefitsWho": "Open-source projects, nonprofits, and academic research teams."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Rocket.Chat documents SOC 2, ISO/IEC 27001, GDPR, HIPAA, and DoD ATO up to IL6.",
      "toolB": "Zulip does not document a compliance certification list in the facts, though paid tiers add SAML SSO and SCIM for enterprise authentication.",
      "whyItMatters": "Regulated buyers need to match specific certifications before procurement.",
      "benefitsWho": "Government, defense, and regulated-industry buyers."
    },
    {
      "title": "Minimum Seat Requirements",
      "toolA": "No minimum seat count is documented for Rocket.Chat's Commercial plan.",
      "toolB": "Zulip's Cloud Plus and Self-Hosted Business-equivalent tiers require minimums (10 users for Plus, 25 for Business).",
      "whyItMatters": "Minimum seat requirements affect cost for very small teams wanting top-tier features.",
      "benefitsWho": "Small teams evaluating whether they can access enterprise-auth features at their current headcount."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published free self-hosted tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published paid pricing (no sales call needed)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Zulip: $3.50-$10/user/month depending on tier."
        },
        {
          "feature": "Nonprofit / open-source discount program",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Cloud-hosted option",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Conversation Model",
      "rows": [
        {
          "feature": "Topic-based threading",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Unified inbox across channels/topics",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in voice/video/screen share",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Compliance & Enterprise Auth",
      "rows": [
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "HIPAA compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SAML SSO",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zulip: Cloud Plus and Self-Hosted Business tiers and above."
        },
        {
          "feature": "DoD Authorization to Operate",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Rocket.Chat: up to IL6."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool has fully published pricing?",
      "answer": "Zulip publishes exact per-user pricing for both cloud and self-hosted tiers. Rocket.Chat's Commercial, Government, and Defense plans all require contacting sales."
    },
    {
      "question": "Does Rocket.Chat offer nonprofit or open-source discounts?",
      "answer": "This isn't documented in Rocket.Chat's facts. Zulip explicitly offers free or discounted plans for qualifying open-source projects, nonprofits, and academic research."
    },
    {
      "question": "What's the core organizational difference in how conversations work?",
      "answer": "Zulip organizes messages into topic-based threads within channels plus a unified inbox. Rocket.Chat documents unified messaging (chat, voice, video, screen sharing) without a documented topic-threading structure."
    },
    {
      "question": "Which tool is DoD ATO certified?",
      "answer": "Rocket.Chat, up to IL6, as part of its Defense plan."
    },
    {
      "question": "Are there minimum seat requirements on either platform?",
      "answer": "Zulip's Cloud Plus and equivalent Self-Hosted Business tier require minimums of 10 and 25 users respectively. Rocket.Chat doesn't document a minimum seat count for its Commercial plan."
    },
    {
      "question": "Can both tools be self-hosted for free?",
      "answer": "Yes, both Rocket.Chat and Zulip offer free, open-source self-hosted editions."
    }
  ]
};

export default rocketChatVsZulipContent;

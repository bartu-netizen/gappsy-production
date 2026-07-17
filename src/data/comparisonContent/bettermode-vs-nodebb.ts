import type { ToolComparisonContent } from './types';

const bettermodeVsNodebbContent: ToolComparisonContent = {
  "verdict": "Bettermode and NodeBB both power online communities, but at very different price points and with different content models: Bettermode is a $399/month-and-up branded community platform combining Q&A, knowledge base, events, and enterprise CRM integrations for larger brands, while NodeBB is a mobile-first discussion forum available as a free self-hosted open-source project or hosted plans starting at $20/month. Neither is a universal winner — the choice depends on whether you need Bettermode's multi-format branded community hub or NodeBB's lighter-weight, fediverse-connected discussion forum.",
  "bestForToolA": "Larger brands wanting an all-in-one branded community combining Q&A, knowledge base, events, and support with enterprise integrations (Salesforce, HubSpot, Intercom) and AI-powered search, as used by IBM, HubSpot, Lenovo, and Webflow.",
  "bestForToolB": "Communities wanting a modern, mobile-first, real-time discussion forum with built-in chat and fediverse (ActivityPub) support, available as a free self-hosted option or hosted plans starting at $20/month.",
  "whoNeedsBoth": "There's limited realistic overlap for running both simultaneously — they occupy the same community-platform role, so a buyer would evaluate which content model (Bettermode's multi-space support/engagement hub versus NodeBB's discussion forum) fits their community and choose one rather than run both in parallel.",
  "keyDifferences": [
    {
      "title": "Pricing Entry Point",
      "toolA": "Bettermode starts at $399/month (Starter plan, 10,000 members); there's no permanent free plan, only a 14-day trial.",
      "toolB": "NodeBB offers a free, self-hosted open-source version plus hosted plans starting at $20/month (Starter, 50,000 pageviews, 5GB storage).",
      "whyItMatters": "The entry cost gap is roughly 20x, making NodeBB accessible to smaller budgets while Bettermode targets larger branded deployments from the start.",
      "benefitsWho": "Budget-constrained or open-source-friendly communities favor NodeBB; larger brands with bigger community budgets can absorb Bettermode's $399+/month entry."
    },
    {
      "title": "Content Format",
      "toolA": "Bettermode is structured around multiple distinct content spaces — Q&A, Discussion, Events, Polls, Wishlist, Changelog, Roadmap, Knowledge base, Academy, and Help center — aimed at engagement, support, and knowledge sharing together.",
      "toolB": "NodeBB is a modern forum built around threaded, tag-and-category discussions, with built-in real-time chat and social feed views.",
      "whyItMatters": "Bettermode is purpose-built for multi-format community programs combining support, knowledge base, and engagement in one, while NodeBB focuses specifically on forum-style discussion.",
      "benefitsWho": "Brands wanting a unified community, support, and docs hub lean toward Bettermode; communities wanting a fast, real-time discussion forum lean toward NodeBB."
    },
    {
      "title": "AI-Powered Search",
      "toolA": "Bettermode includes \"Ask AI,\" an AI-powered federated search across community content, available from the Growth plan ($1,500/month) up.",
      "toolB": "No AI features are documented for NodeBB.",
      "whyItMatters": "Members needing to quickly surface answers across mixed content types benefit from Bettermode's AI search, at a cost.",
      "benefitsWho": "Large support-focused communities on Bettermode's Growth+ tier."
    },
    {
      "title": "Open Source & Self-Hosting",
      "toolA": "No self-hosting or open-source option is documented for Bettermode; it's SaaS-only.",
      "toolB": "NodeBB offers a free, self-hosted open-source option in addition to hosted plans.",
      "whyItMatters": "Organizations wanting full infrastructure control or wanting to avoid recurring SaaS fees entirely have that option only with NodeBB.",
      "benefitsWho": "Technical teams and organizations with in-house hosting capability."
    },
    {
      "title": "Decentralized / Fediverse Integration",
      "toolA": "Bettermode's documented integrations are enterprise CRM/support tools (Salesforce, HubSpot, Intercom, Segment, Notion, Slack), with no fediverse integration documented.",
      "toolB": "NodeBB includes ActivityPub support for connecting with the broader decentralized fediverse.",
      "whyItMatters": "Communities wanting to federate with platforms like Mastodon need NodeBB's ActivityPub support, which isn't a Bettermode feature; communities needing to sync with enterprise CRM/support tools need Bettermode's named integrations instead.",
      "benefitsWho": "Fediverse-oriented forum communities favor NodeBB; enterprise support and marketing teams favor Bettermode."
    }
  ],
  "featureMatrix": [
    {
      "group": "Community Content Types",
      "rows": [
        {
          "feature": "Q&A / Discussion spaces",
          "toolA": "available",
          "toolB": "available",
          "note": "NodeBB: via forum threads"
        },
        {
          "feature": "Knowledge base / Help center",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Events and Polls",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real-time built-in chat",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Changelog / Roadmap / Wishlist",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Platform & Extensibility",
      "rows": [
        {
          "feature": "AI-powered search",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bettermode Ask AI: Growth plan and above"
        },
        {
          "feature": "Open source / self-hosting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "ActivityPub/fediverse support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "API and webhooks",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bettermode: Growth plan and above"
        },
        {
          "feature": "Enterprise integrations (Salesforce, HubSpot, etc.)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "Bettermode $399/month; NodeBB $20/month hosted or free self-hosted"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer 14-day trials"
        },
        {
          "feature": "SOC 2 compliance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bettermode: Premium plan"
        },
        {
          "feature": "GDPR compliance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "NodeBB states it was the first forum software to achieve GDPR compliance"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Bettermode free?",
      "answer": "No, there's no permanent free plan — only a 14-day free trial on the Starter and Growth plans, with Starter beginning at $399/month."
    },
    {
      "question": "Is NodeBB free?",
      "answer": "Yes, a free self-hosted open-source version is available, alongside hosted plans starting at $20/month with a 14-day trial (credit card required)."
    },
    {
      "question": "Which has AI-powered search?",
      "answer": "Bettermode includes \"Ask AI\" federated search from the Growth plan ($1,500/month) up; NodeBB doesn't document AI features."
    },
    {
      "question": "Which supports the fediverse?",
      "answer": "NodeBB includes ActivityPub support for fediverse integration; this isn't documented for Bettermode."
    },
    {
      "question": "What enterprise integrations does each support?",
      "answer": "Bettermode integrates with Salesforce, HubSpot, Intercom, Segment, Notion, and Slack; NodeBB's facts instead emphasize custom plugins and a custom domain rather than named CRM/support integrations."
    },
    {
      "question": "Who uses each platform?",
      "answer": "Bettermode is used by IBM, HubSpot, Lenovo, and Webflow; NodeBB is used by Vivaldi, Opera, and MOZ."
    }
  ]
};

export default bettermodeVsNodebbContent;

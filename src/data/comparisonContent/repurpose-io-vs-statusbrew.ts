import type { ToolComparisonContent } from './types';

const repurposeIoVsStatusbrewContent: ToolComparisonContent = {
  "verdict": "Repurpose.io and Statusbrew both operate in the social content space, but they solve different problems. Repurpose.io automatically detects new content on one platform and cross-posts, resizes, and de-watermarks it to 15+ destinations, making it a distribution engine. Statusbrew is a broader social media management suite covering scheduling, team approval workflows, a unified inbox with auto-moderation, and deep analytics (230+ metrics). Choosing between them depends on whether the priority is automated content redistribution or full-funnel publishing and engagement management.",
  "bestForToolA": "Creators and agencies who publish video on one primary platform and want it automatically reformatted, de-watermarked, and cross-posted to 15+ other networks without manual re-uploading.",
  "bestForToolB": "Teams that need end-to-end social media operations — scheduling, multi-step approval workflows, a unified inbox for replying across channels, and detailed analytics reporting, especially where CRM integration with Salesforce or HubSpot matters.",
  "whoNeedsBoth": "Agencies managing both original social engagement and video distribution may run Statusbrew for publishing, inbox, and analytics work while using Repurpose.io specifically to auto-redistribute video content across the 15+ destination platforms it supports.",
  "keyDifferences": [
    {
      "title": "Primary function: repurposing vs. full management",
      "toolA": "Automatically detects new content on a source platform and republishes it, resized and watermark-free, to 15+ destinations.",
      "toolB": "A full social media management platform covering publishing, scheduling, approvals, inbox, and analytics.",
      "whyItMatters": "A tool built around automated redistribution won't replace a full publishing and engagement suite, and vice versa.",
      "benefitsWho": "Solo creators or small teams that only need distribution automation benefit from Repurpose.io's focus; larger social teams need Statusbrew's broader toolset."
    },
    {
      "title": "Engagement and unified inbox",
      "toolA": "No inbox or engagement feature is documented — the focus is one-way content distribution.",
      "toolB": "Includes a unified inbox that auto-routes messages by intent and auto-moderates spam or negative comments across channels.",
      "whyItMatters": "Teams that need to respond to comments and DMs across multiple social accounts require inbox tooling that Repurpose.io doesn't offer.",
      "benefitsWho": "Community managers and support teams handling multi-channel engagement."
    },
    {
      "title": "Approval workflows",
      "toolA": "Not documented — Repurpose.io's feature set centers on automated publishing rather than review steps.",
      "toolB": "Includes approval workflows so content can be reviewed by team members or clients before it goes live.",
      "whyItMatters": "Agencies serving clients often need a sign-off step before publishing, which only Statusbrew documents.",
      "benefitsWho": "Agencies and teams that need client or manager approval before content goes live."
    },
    {
      "title": "Analytics depth",
      "toolA": "No analytics feature is documented in the available facts.",
      "toolB": "Offers 230+ customizable metrics with 18 months of data backfill and lifetime retention, plus scheduled reporting.",
      "whyItMatters": "Teams that need to prove ROI or track long-term performance trends need the reporting depth Statusbrew documents.",
      "benefitsWho": "Marketing teams and agencies that report performance to stakeholders or clients."
    },
    {
      "title": "Pricing transparency and structure",
      "toolA": "Publishes exact prices for all three tiers ($35/$79/$179 per month), scaled by account-connection limits per social network.",
      "toolB": "Publishes only a $69/month starting price; Lite, Standard, and Premium tier prices require checking out or contacting sales, and Agency pricing is charged per client starting at $49/mo/client.",
      "whyItMatters": "Buyers who want to compare costs upfront without a sales conversation can do so more easily with Repurpose.io's published tier pricing.",
      "benefitsWho": "Budget-conscious buyers and smaller teams evaluating cost before committing to a trial."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Automated cross-posting to multiple platforms",
          "toolA": "available",
          "toolB": "available",
          "note": "Repurpose.io auto-detects and republishes existing content; Statusbrew schedules and publishes across channels including Reels, Shorts, Stories, Threads, and Polls."
        },
        {
          "feature": "Watermark removal from source content",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Unified inbox for engagement",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Team approval workflows",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted content composer",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statusbrew documents an AI composer for captions and hashtags."
        },
        {
          "feature": "Analytics and reporting depth",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statusbrew documents 230+ metrics with 18-month data backfill."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free trial (no credit card)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published pricing across all tiers",
          "toolA": "available",
          "toolB": "limited",
          "note": "Statusbrew's Lite, Standard, and Premium tier prices require checkout or contacting sales; only the $69/mo starting price is published."
        },
        {
          "feature": "Agency / multi-client pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Repurpose.io's Agency tier is $179/mo for 25 connections; Statusbrew charges per client starting at $49/mo/client."
        },
        {
          "feature": "Enterprise / SSO tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SSO, full API access, and MCP support are reserved for Statusbrew's custom Enterprise plan."
        }
      ]
    },
    {
      "group": "Integrations & Compliance",
      "rows": [
        {
          "feature": "Destination platform breadth",
          "toolA": "available",
          "toolB": "available",
          "note": "Repurpose.io connects to 15+ platforms including YouTube, TikTok, and Instagram; Statusbrew manages multi-format publishing and CRM connections."
        },
        {
          "feature": "CRM integration (Salesforce/HubSpot)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Compliance certification (SOC 2 / GDPR)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the main difference between Repurpose.io and Statusbrew?",
      "answer": "Repurpose.io focuses on automatically resizing, rebranding, and cross-posting existing content to 15+ destinations, while Statusbrew is a broader social media management platform with publishing, approvals, a unified inbox, and analytics."
    },
    {
      "question": "Which tool has a unified inbox?",
      "answer": "Statusbrew includes a unified inbox that auto-routes messages by intent and auto-moderates spam or negative comments; this isn't documented for Repurpose.io."
    },
    {
      "question": "How does pricing compare?",
      "answer": "Repurpose.io publishes three tiers at $35, $79, and $179 per month based on account-connection limits. Statusbrew starts at $69/month, but its Lite, Standard, and Premium tier prices aren't published, and Agency pricing is charged per client starting at $49/mo/client."
    },
    {
      "question": "Does either tool remove watermarks from source content?",
      "answer": "Repurpose.io explicitly removes source-platform watermarks before republishing; this isn't documented as a Statusbrew feature."
    },
    {
      "question": "Do both offer free trials?",
      "answer": "Yes, both offer a 14-day free trial with no credit card required."
    },
    {
      "question": "Which tool includes CRM integrations?",
      "answer": "Statusbrew connects with Salesforce and HubSpot on higher tiers; this isn't documented for Repurpose.io."
    }
  ]
};

export default repurposeIoVsStatusbrewContent;

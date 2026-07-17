import type { ToolComparisonContent } from './types';

const screenStudioVsTellaContent: ToolComparisonContent = {
  "verdict": "Screen Studio and Tella both automate parts of screen-recording production, but they target different workflows. Screen Studio is a macOS-only app built around fully automatic cursor-following zoom and cursor smoothing, with locally processed transcripts and direct iOS device capture via USB, priced from $9/month. Tella runs on Mac, Windows, and the web, and pairs automatic zoom with transcript-based editing, shareable links, video analytics, and integrations with tools like Slack and Notion, priced from $13/month. Neither has a permanent free plan, so the decision mostly comes down to whether cross-platform reach and sharing/analytics matter more than Screen Studio's polish-focused, Mac-only automation.",
  "bestForToolA": "Mac-based creators who want highly automated, cursor-following zoom effects with minimal manual editing, plus direct iPhone/iPad screen capture via USB, and who value locally processed transcripts.",
  "bestForToolB": "Teams on Mac, Windows, or just a browser who need to share videos via links, track viewer analytics, connect recordings to tools like Slack and Notion, and migrate from Loom.",
  "whoNeedsBoth": "A team with Mac-only creators focused on polished demo videos might use Screen Studio for recording, while distributing and tracking those videos through Tella's sharing and analytics tools if cross-platform teammates also need to record on Windows.",
  "keyDifferences": [
    {
      "title": "Platform availability",
      "toolA": "macOS only; a Windows version is explicitly listed in its FAQ as \"not ready\" (in development).",
      "toolB": "Native apps for macOS and Windows, plus a web app and Chrome extension.",
      "whyItMatters": "Windows-only or mixed-OS teams cannot currently use Screen Studio at all.",
      "benefitsWho": "Organizations with Windows users or that need a browser-only recording option."
    },
    {
      "title": "iOS device screen recording",
      "toolA": "Records iPhone or iPad screens directly via a USB connection.",
      "toolB": "Not documented as a feature.",
      "whyItMatters": "Teams demoing mobile apps benefit from native device capture rather than screen-mirroring workarounds.",
      "benefitsWho": "Mobile app developers and product marketers."
    },
    {
      "title": "Sharing, analytics, and integrations",
      "toolA": "Not documented — no shareable links, viewer analytics, or third-party integrations are described.",
      "toolB": "Includes shareable links, an embeddable player, video analytics (views, engagement, funnel performance), and integrations with Slack, Notion, Linear, Zapier, and Google Drive, plus a Loom migration tool.",
      "whyItMatters": "Teams that need to distribute and track video performance across tools need Tella's built-in sharing and analytics layer.",
      "benefitsWho": "Marketing, sales, and product teams that share async video updates and want engagement data."
    },
    {
      "title": "Free plan and trial structure",
      "toolA": "No free plan; paid subscription required from $9/month (annual) or $20/month.",
      "toolB": "No permanent free plan; offers a 7-day free trial of the Pro plan with no credit card required, from $13/month.",
      "whyItMatters": "Buyers can't use either tool free indefinitely, but Tella allows a no-cost trial period before paying.",
      "benefitsWho": "Buyers who want to evaluate before committing to a subscription."
    },
    {
      "title": "Local transcript processing",
      "toolA": "States that transcript generation and background noise removal are processed locally rather than sent to servers.",
      "toolB": "Generates transcripts for text-based editing, but local-vs-cloud processing isn't stated.",
      "whyItMatters": "Privacy-sensitive teams may prefer a tool that documents local processing of recordings.",
      "benefitsWho": "Teams recording sensitive or confidential screen content."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platforms & Recording",
      "rows": [
        {
          "feature": "macOS support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Windows support",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Screen Studio's FAQ states a Windows version is 'not ready' (in development)."
        },
        {
          "feature": "Web app / Chrome extension recording",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "iPhone/iPad screen recording",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Editing & Automation",
      "rows": [
        {
          "feature": "Automatic cursor-following zoom",
          "toolA": "available",
          "toolB": "available",
          "note": "Tella calls this 'Studio Voice and automatic zoom.'"
        },
        {
          "feature": "Text-based / transcript editing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Built-in teleprompter",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Sharing, Analytics & Collaboration",
      "rows": [
        {
          "feature": "Shareable links / embeddable player",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Video analytics (views/engagement/funnel)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Third-party integrations (Slack, Notion, Linear, Zapier, Drive)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Loom migration tool",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Tella instead offers a 7-day free trial of Pro with no credit card required."
        },
        {
          "feature": "Starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "Screen Studio from $9/month (annual); Tella from $13/month."
        },
        {
          "feature": "Enterprise / custom tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tella's Enterprise tier adds SSO/SCIM and volume discounts."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Screen Studio work on Windows?",
      "answer": "No; its Windows version is explicitly listed as 'not ready' (in development), and it is currently macOS only."
    },
    {
      "question": "Does Tella work on Windows?",
      "answer": "Yes, Tella has native apps for macOS and Windows plus a web app and Chrome extension."
    },
    {
      "question": "Which tool records iPhone or iPad screens?",
      "answer": "Screen Studio can record iOS devices directly via a USB connection; this isn't documented as a Tella feature."
    },
    {
      "question": "Do either have a free plan?",
      "answer": "Neither has a permanent free plan. Screen Studio is paid only; Tella offers a 7-day free trial of its Pro plan with no credit card required."
    },
    {
      "question": "Which tool includes video analytics and team integrations?",
      "answer": "Tella includes video analytics (views, engagement, funnel performance) and integrates with Slack, Notion, Linear, Zapier, and Google Drive; these aren't documented for Screen Studio."
    },
    {
      "question": "Is transcript processing private?",
      "answer": "Screen Studio states its transcript generation and background noise removal are processed locally rather than sent to servers; this isn't stated for Tella."
    }
  ]
};

export default screenStudioVsTellaContent;

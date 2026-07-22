import type { ToolComparisonContent } from './types';

const plannVsSkedSocialContent: ToolComparisonContent = {
  "verdict": "Plann and Sked Social both schedule and manage content across many networks, but differ sharply on free access and compliance posture. Plann offers a genuine Free Forever plan (1 brand, Instagram-only, 30 AI credits) backed by Linktree's ownership, with paid tiers starting at $12.50/month; Sked Social has no free plan beyond a 14-day trial, but is SOC 2 Type 2 certified and natively publishes to 10 platforms with flat team-based pricing rather than uncapped per-seat charges. Buyers who want to try before paying anything will lean toward Plann; those needing compliance certification or broader native platform coverage from the start will lean toward Sked Social.",
  "bestForToolA": "Solo creators or small brands who want to start on Instagram scheduling for free indefinitely, upgrading only when they need more brands, AI credits, or team collaboration.",
  "bestForToolB": "Agencies and teams needing SOC 2 Type 2 compliance (relevant for enterprise and healthcare clients), native publishing across 10 platforms including Google Business Profile and Snapchat, and flat team-based pricing instead of per-seat fees.",
  "whoNeedsBoth": "An agency onboarding new solo clients on Plann's free tier while running its own compliance-sensitive enterprise accounts through Sked Social would use both depending on the client's scale and compliance requirements.",
  "keyDifferences": [
    {
      "title": "Free access",
      "toolA": "Free Forever plan: 1 brand, 1 user, Instagram-only scheduling, 30 AI credits/month, 5 video posts/month.",
      "toolB": "No permanent free plan — only a 14-day free trial.",
      "whyItMatters": "A no-cost entry point matters for solo creators testing a tool before committing budget.",
      "benefitsWho": "Budget-constrained solo creators and hobbyists."
    },
    {
      "title": "Compliance certification",
      "toolA": "Facts don't mention a compliance certification.",
      "toolB": "SOC 2 Type 2 certified.",
      "whyItMatters": "SOC 2 Type 2 is often a procurement requirement for enterprise and healthcare clients handling sensitive data.",
      "benefitsWho": "Agencies pitching enterprise or healthcare clients with security review requirements."
    },
    {
      "title": "Platform coverage",
      "toolA": "Auto-posts to Instagram, TikTok, Pinterest, Facebook, LinkedIn, YouTube Shorts, and Threads (7 platforms).",
      "toolB": "Natively publishes to Instagram, TikTok, YouTube, Pinterest, Threads, Facebook, Snapchat, Google Business Profile, LinkedIn, and X (10 platforms).",
      "whyItMatters": "Sked Social covers additional networks — Snapchat, Google Business Profile, and X — not listed in Plann's facts.",
      "benefitsWho": "Local businesses needing Google Business Profile, or brands active on Snapchat or X."
    },
    {
      "title": "Pricing structure",
      "toolA": "Scales per brand (1 brand on Power User, 2 on Build, 5 on Grow), priced $12.50-$62.50/month.",
      "toolB": "Uses flat team-based pricing per plan, from $24/month (Basic) up to a Custom tier from $249/month.",
      "whyItMatters": "Per-brand tiering versus flat team pricing changes how cost scales as an agency adds clients or brands.",
      "benefitsWho": "Agencies managing multiple brands who want a predictable pricing structure."
    },
    {
      "title": "Approval workflows",
      "toolA": "Team chat, notifications, and approval workflows are included starting on the Build plan ($25/month).",
      "toolB": "Internal and external approval workflows are an add-on on the Grow plan rather than included by default, per the facts, with full inclusion at the Accelerate tier.",
      "whyItMatters": "Client-facing agencies need to know at what price tier approval workflows become available.",
      "benefitsWho": "Agencies managing client sign-off processes."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling & Platforms",
      "rows": [
        {
          "feature": "Platforms supported",
          "toolA": "available",
          "toolB": "available",
          "note": "7 (Plann) vs. 10 (Sked Social)."
        },
        {
          "feature": "Visual drag-and-drop calendar",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Built-in video editor",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Team & Compliance",
      "rows": [
        {
          "feature": "Approval workflows",
          "toolA": "available",
          "toolB": "limited",
          "note": "Sked Social: add-on on Grow, included from Accelerate."
        },
        {
          "feature": "SOC 2 Type 2 certification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Unified inbox",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Plann's Free Forever plan."
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "$12.50/month vs. $24/month."
        },
        {
          "feature": "AI caption generation",
          "toolA": "available",
          "toolB": "available",
          "note": "Plann: 30 free credits; Sked Social: Smart Assist brand-trained captions."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Plann have a free plan?",
      "answer": "Yes, the Free Forever plan supports 1 brand, 1 user, and Instagram-only scheduling with 30 monthly AI credits."
    },
    {
      "question": "Who owns Plann?",
      "answer": "Plann is owned by Linktree."
    },
    {
      "question": "Does Sked Social have a free trial?",
      "answer": "Yes, a 14-day free trial is available with no credit card required."
    },
    {
      "question": "Where is Sked Social based?",
      "answer": "Sked Social was founded in 2014 in Melbourne, Australia, and is Australian owned."
    },
    {
      "question": "Is Sked Social SOC 2 certified?",
      "answer": "Yes, Sked Social is SOC 2 Type 2 certified."
    },
    {
      "question": "What platforms can I schedule to with Plann?",
      "answer": "Instagram, TikTok, Facebook, Pinterest, LinkedIn, YouTube Shorts, and Threads."
    }
  ]
};

export default plannVsSkedSocialContent;

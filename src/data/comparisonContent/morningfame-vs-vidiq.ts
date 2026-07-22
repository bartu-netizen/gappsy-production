import type { ToolComparisonContent } from './types';

const morningfameVsVidiqContent: ToolComparisonContent = {
  "verdict": "Morningfame and VidIQ both help YouTube creators optimize and grow, but differ significantly in documented feature depth and pricing transparency. VidIQ is freemium with a genuine free plan (150 monthly AI credits), AI-powered title/tag/thumbnail suggestions, an AI Coach, a browser extension, native iOS/Android apps, and support for Instagram alongside YouTube. Morningfame focuses narrowly on peer benchmarking — comparing a channel against similarly sized channels — and video search optimization, but its pricing isn't visible on the pages accessible for this comparison, and the facts describe no AI capabilities or platforms beyond YouTube. Creators wanting a fuller-featured, multi-platform, AI-driven toolkit have more documented reasons to choose VidIQ; those specifically wanting peer-benchmarked YouTube guidance may still find Morningfame's narrower focus useful, though its cost can't be confirmed here.",
  "bestForToolA": "Creators specifically interested in peer benchmarking — comparing their channel against similarly sized channels to spot performance gaps — and who want to review a sample demo report before committing.",
  "bestForToolB": "Creators wanting a free-to-start toolkit (150 AI credits/month on the Free plan) with AI-generated title/tag/thumbnail suggestions, a browser extension, native mobile apps, and optimization tools that extend to Instagram as well as YouTube.",
  "whoNeedsBoth": "A YouTube-focused creator who wants Morningfame's peer-benchmarking view alongside VidIQ's AI optimization suggestions and mobile app access might reasonably use both tools side by side.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Pricing was not visible on the official pages accessible for this comparison.",
      "toolB": "Publishes a Free plan ($0), a Max plan ($39/month billed annually), and custom Enterprise pricing.",
      "whyItMatters": "Buyers can't budget for a tool whose pricing isn't documented.",
      "benefitsWho": "Buyers comparing cost before committing time to sign up."
    },
    {
      "title": "AI capabilities",
      "toolA": "Facts state no AI capabilities are described on the official site.",
      "toolB": "Includes AI-generated title, tag, and thumbnail suggestions plus an AI Coach for personalized guidance.",
      "whyItMatters": "Creators wanting AI-assisted optimization suggestions have a documented option in VidIQ but not in Morningfame.",
      "benefitsWho": "Creators who want automated, AI-driven optimization suggestions rather than manual benchmarking review."
    },
    {
      "title": "Platform coverage",
      "toolA": "The official site only describes YouTube-focused features.",
      "toolB": "Covers both YouTube and Instagram optimization.",
      "whyItMatters": "Creators active on multiple platforms need a tool that spans more than one network.",
      "benefitsWho": "Multi-platform creators managing both YouTube and Instagram presence."
    },
    {
      "title": "Access format",
      "toolA": "Offers a demo report link rather than an ongoing free tier.",
      "toolB": "Offers a genuine ongoing Free plan with 150 monthly AI credits and core research tools.",
      "whyItMatters": "An ongoing free plan lets creators use core tools indefinitely, while a demo report is a one-time preview.",
      "benefitsWho": "Creators wanting to use core tools long-term at no cost."
    },
    {
      "title": "Mobile and extension access",
      "toolA": "Facts don't mention a mobile app or browser extension.",
      "toolB": "Offers a YouTube browser extension and native iOS/Android apps.",
      "whyItMatters": "Creators who want to check optimization data or channel performance on the go need mobile or extension access.",
      "benefitsWho": "Creators who manage their channel from mobile devices or want in-browser data while uploading."
    }
  ],
  "featureMatrix": [
    {
      "group": "Analytics & Optimization",
      "rows": [
        {
          "feature": "Peer/channel benchmarking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Video search optimization guidance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-generated title/tag/thumbnail suggestions",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Morningfame's facts state no AI capabilities are described."
        },
        {
          "feature": "AI Coach / personalized guidance",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platforms & Access",
      "rows": [
        {
          "feature": "Platforms supported",
          "toolA": "available",
          "toolB": "available",
          "note": "YouTube only vs. YouTube + Instagram."
        },
        {
          "feature": "Browser extension",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Mobile app (iOS/Android)",
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
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Morningfame offers a demo report, not a described free plan; VidIQ's Free plan includes 150 AI credits/month."
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Morningfame's pricing was not visible on accessible pages."
        },
        {
          "feature": "Enterprise tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Custom pricing."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What does Morningfame do?",
      "answer": "It provides YouTube analytics and search optimization guidance, including benchmarking against similarly sized channels."
    },
    {
      "question": "Does Morningfame offer a demo?",
      "answer": "Yes, a demo report is available via a link on the site."
    },
    {
      "question": "Does vidIQ have a free plan?",
      "answer": "Yes, the Free plan includes 150 monthly AI credits and core research tools at no cost."
    },
    {
      "question": "What does the vidIQ Max plan cost?",
      "answer": "Max is $39/month billed annually and includes 6,000 monthly AI credits."
    },
    {
      "question": "Does vidIQ work on Instagram?",
      "answer": "Yes, vidIQ includes Instagram optimization tools in addition to YouTube."
    },
    {
      "question": "Does Morningfame support platforms other than YouTube?",
      "answer": "The official site only describes YouTube-focused features."
    }
  ]
};

export default morningfameVsVidiqContent;

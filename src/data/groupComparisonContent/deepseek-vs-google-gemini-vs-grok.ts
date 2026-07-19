import type { GroupComparisonContent } from './types';

const deepseekVsGoogleGeminiVsGrokContent: GroupComparisonContent = {
  "verdict": "DeepSeek, Google Gemini, and Grok represent three different bets in the AI chatbot market: DeepSeek competes on price and open-weight access, Gemini competes on native multimodality and deep integration across Google's own product ecosystem, and Grok competes on real-time X data and a fast model-release cadence. Teams choosing between them should weigh budget and self-hosting needs against how much they already rely on Google Workspace or X.",
  "bestFor": {
    "deepseek": "Cost-sensitive developers and teams that want frontier-level reasoning and coding performance at a fraction of the price, with the option to self-host open-weight models.",
    "google-gemini": "Users and businesses already invested in Google Workspace who want an AI assistant natively embedded in Gmail, Docs, Sheets, and Slides with a very large context window.",
    "grok": "Users who want an AI chatbot with live access to X's real-time conversation feed and a faster, less filtered conversational style."
  },
  "highlights": [
    {
      "title": "Lowest-cost path to capable models",
      "description": "DeepSeek-V3 and DeepSeek-R1 are priced well below Gemini and Grok on a per-token basis and ship as open weights, letting teams self-host instead of paying per-seat subscriptions.",
      "toolSlugs": [
        "deepseek"
      ]
    },
    {
      "title": "Deepest first-party ecosystem integration",
      "description": "Gemini is woven directly into Gmail, Docs, Sheets, and Slides, an integration breadth that neither DeepSeek nor Grok can match since they do not own a comparable productivity suite.",
      "toolSlugs": [
        "google-gemini"
      ]
    },
    {
      "title": "Largest context window on paid tiers",
      "description": "Google AI Pro and Ultra support context windows up to one million tokens, letting Gemini ingest very large documents, codebases, or video transcripts in a single prompt.",
      "toolSlugs": [
        "google-gemini"
      ]
    },
    {
      "title": "Live access to public conversation",
      "description": "Grok's native integration with X's post feed gives it real-time awareness of breaking news and trending discussion that Gemini and DeepSeek retrieve through separate web search tools instead.",
      "toolSlugs": [
        "grok"
      ]
    },
    {
      "title": "Native multimodality from the ground up",
      "description": "Gemini was built to reason across text, image, audio, and video natively rather than bolting on separate tools, and it includes built-in image and video generation inside the chat app.",
      "toolSlugs": [
        "google-gemini",
        "grok"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core assistant capabilities",
      "rows": [
        {
          "feature": "Conversational chat assistant",
          "statuses": {
            "deepseek": "available",
            "google-gemini": "available",
            "grok": "available"
          }
        },
        {
          "feature": "Image generation",
          "statuses": {
            "deepseek": "unavailable",
            "google-gemini": "available",
            "grok": "available"
          },
          "note": "Gemini and Grok Imagine also generate video, a capability DeepSeek does not document."
        },
        {
          "feature": "Chain-of-thought reasoning mode",
          "statuses": {
            "deepseek": "available",
            "google-gemini": "available",
            "grok": "available"
          }
        }
      ]
    },
    {
      "group": "Access and openness",
      "rows": [
        {
          "feature": "Open-weight / self-hostable models",
          "statuses": {
            "deepseek": "available",
            "google-gemini": "unavailable",
            "grok": "unavailable"
          }
        },
        {
          "feature": "Extended context window (1M+ tokens)",
          "statuses": {
            "deepseek": "unavailable",
            "google-gemini": "available",
            "grok": "not-documented"
          },
          "note": "DeepSeek-V3 documents a roughly 164K token context window, well below Gemini's top-tier 1M token support."
        },
        {
          "feature": "Native productivity-suite integration",
          "statuses": {
            "deepseek": "unavailable",
            "google-gemini": "available",
            "grok": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Business and developer features",
      "rows": [
        {
          "feature": "Developer API",
          "statuses": {
            "deepseek": "available",
            "google-gemini": "available",
            "grok": "available"
          }
        },
        {
          "feature": "Mobile apps (iOS and Android)",
          "statuses": {
            "deepseek": "available",
            "google-gemini": "available",
            "grok": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, DeepSeek, Gemini, or Grok?",
      "answer": "DeepSeek is the cheapest, with a free chat app and API pricing well under a cent per thousand tokens. Gemini's paid tier starts at Google AI Plus for $9.99/month, and Grok's standalone SuperGrok Lite starts at $10/month, with X Premium bundling in basic Grok access from $8/month."
    },
    {
      "question": "Which tool integrates best with existing productivity tools?",
      "answer": "Gemini has the deepest first-party integration of the three, embedded directly into Gmail, Docs, Sheets, and Slides as part of the Google Workspace ecosystem. DeepSeek and Grok do not offer a comparable native productivity-suite integration."
    },
    {
      "question": "Can I self-host any of these models?",
      "answer": "DeepSeek releases DeepSeek-V3 and DeepSeek-R1 with open weights, so they can be downloaded and run on private infrastructure. Gemini and Grok are closed, hosted-only products with no self-hosting option."
    },
    {
      "question": "Which has the largest context window?",
      "answer": "Gemini leads on documented context length, supporting up to one million tokens on its Google AI Pro and Ultra tiers, well beyond DeepSeek-V3's roughly 164K token window. Grok's context window is not documented in the same detail."
    },
    {
      "question": "What makes Grok different from DeepSeek and Gemini?",
      "answer": "Grok's native integration with X's live post feed gives it real-time visibility into breaking news and public conversation, plus a faster, more irreverent conversational style, differentiators that come from its tight integration with the X platform rather than from raw model benchmarks."
    }
  ]
};

export default deepseekVsGoogleGeminiVsGrokContent;

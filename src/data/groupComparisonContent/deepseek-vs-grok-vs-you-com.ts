import type { GroupComparisonContent } from './types';

const deepseekVsGrokVsYouComContent: GroupComparisonContent = {
  "verdict": "These three take different approaches to AI-assisted answers. DeepSeek and Grok are conversational assistants built on their own proprietary models, one optimized for low-cost, open-weight reasoning, the other for real-time, X-integrated multimodal chat, while You.com is built around citation-grounded search and multi-source deep research through its ARI agent rather than a single proprietary chat personality, and has shifted its business toward enterprise research and API customers rather than a public consumer subscription. The right choice depends on whether you want a low-cost, open conversational model (DeepSeek), a real-time-aware assistant with image and video generation (Grok), or a citation-backed research tool for verifying sourced answers (You.com).",
  "bestFor": {
    "deepseek": "Developers who want the cheapest API pricing and open-weight models they can self-host, plus a capable free consumer chat app.",
    "grok": "Users who want an assistant with live access to X's real-time feed and integrated image and video generation via Grok Imagine.",
    "you-com": "Researchers and enterprise teams who need citation-grounded, multi-source answers or automated deep-research reports through ARI, rather than a purely conversational chatbot."
  },
  "highlights": [
    {
      "title": "You.com is the only one built around citation-grounded, multi-source answers",
      "description": "Rather than generating answers purely from a single proprietary model, You.com grounds chatbot responses in live web citations and lets users route queries across multiple AI providers.",
      "toolSlugs": [
        "you-com"
      ]
    },
    {
      "title": "You.com's ARI agent produces structured research reports, not just chat replies",
      "description": "ARI scans hundreds of public and private sources for a single research task and synthesizes a report with citations, charts, and visualizations, a workflow not documented for DeepSeek or Grok.",
      "toolSlugs": [
        "you-com"
      ]
    },
    {
      "title": "DeepSeek is the only one offering open-weight, self-hostable models",
      "description": "DeepSeek's V3 and R1 models can be downloaded and self-hosted, unlike Grok's models or You.com's model-agnostic routing layer.",
      "toolSlugs": [
        "deepseek"
      ]
    },
    {
      "title": "Grok is the only one with native social-platform data and built-in media generation",
      "description": "Grok has real-time integration with X's live post feed and Grok Imagine for generating images and video, capabilities not documented for DeepSeek or You.com.",
      "toolSlugs": [
        "grok"
      ]
    },
    {
      "title": "You.com has pulled back on public consumer pricing",
      "description": "By mid-2026 You.com's consumer pricing page had been retired in favor of enterprise and usage-based API pricing, while DeepSeek and Grok both continue to publish free and paid consumer tiers.",
      "toolSlugs": [
        "you-com",
        "deepseek",
        "grok"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Assistant Capabilities",
      "rows": [
        {
          "feature": "Proprietary first-party AI model",
          "statuses": {
            "deepseek": "available",
            "grok": "available",
            "you-com": "unavailable"
          },
          "note": "You.com is model-agnostic and routes queries to models from providers like OpenAI, Anthropic, and Google rather than relying on one proprietary model."
        },
        {
          "feature": "Multimodal image or video generation",
          "statuses": {
            "deepseek": "not-documented",
            "grok": "available",
            "you-com": "not-documented"
          }
        },
        {
          "feature": "Real-time web or social data integration",
          "statuses": {
            "deepseek": "available",
            "grok": "available",
            "you-com": "available"
          }
        }
      ]
    },
    {
      "group": "Research and Sourcing",
      "rows": [
        {
          "feature": "Inline citations grounding answers",
          "statuses": {
            "deepseek": "not-documented",
            "grok": "not-documented",
            "you-com": "available"
          }
        },
        {
          "feature": "Deep multi-source research reports",
          "statuses": {
            "deepseek": "not-documented",
            "grok": "not-documented",
            "you-com": "available"
          },
          "note": "You.com's ARI agent is purpose-built for this workflow."
        },
        {
          "feature": "Model-agnostic routing across multiple AI providers",
          "statuses": {
            "deepseek": "unavailable",
            "grok": "unavailable",
            "you-com": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Publicly documented consumer free tier",
          "statuses": {
            "deepseek": "available",
            "grok": "available",
            "you-com": "limited"
          },
          "note": "You.com previously offered a free consumer tier, but its consumer pricing page had been retired by mid-2026 in favor of enterprise and usage-based pricing."
        },
        {
          "feature": "Developer or API access",
          "statuses": {
            "deepseek": "available",
            "grok": "available",
            "you-com": "available"
          },
          "note": "You.com's API access is enterprise-focused and usage-based rather than published per-token rates."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the main difference between You.com and DeepSeek or Grok?",
      "answer": "You.com is built around citation-grounded web search and multi-source deep research through its ARI agent, while DeepSeek and Grok are conversational assistants built on their own proprietary models."
    },
    {
      "question": "Does You.com still offer a public pricing plan for individuals?",
      "answer": "As of mid-2026 its consumer pricing page has been retired in favor of enterprise and usage-based API pricing, whereas DeepSeek and Grok both still publish free and paid consumer tiers."
    },
    {
      "question": "Which is cheapest for developers building on the API?",
      "answer": "DeepSeek's API pricing is far below Grok's per-token rates. You.com's current API pricing is enterprise and usage-based rather than published per-token rates."
    },
    {
      "question": "Can any of these access real-time information from the web or social media?",
      "answer": "Yes, all three: DeepSeek's chat app includes web search, Grok has native real-time X data integration, and You.com's entire model is built around live web retrieval with citations."
    },
    {
      "question": "Which is best for producing a structured research report with sources?",
      "answer": "You.com's ARI agent is purpose-built for this, scanning many sources and generating a report with citations and visualizations, a capability not documented for DeepSeek or Grok."
    },
    {
      "question": "Are any of these open-weight or self-hostable?",
      "answer": "Only DeepSeek releases open-weight models. Grok's models and You.com's underlying model routing are accessed only through their respective apps and APIs."
    }
  ]
};

export default deepseekVsGrokVsYouComContent;

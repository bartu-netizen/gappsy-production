import type { GroupComparisonContent } from './types';

const deepseekVsGrokVsPoeContent: GroupComparisonContent = {
  "verdict": "DeepSeek and Grok are each a single-lab, first-party AI assistant, one built around low-cost, open-weight reasoning models, the other around real-time, X-integrated multimodal chat, while Poe is a multi-model marketplace that gives access to many different labs' models, including at times Grok itself, under one subscription rather than committing to a single provider's technology. The right pick depends on whether you want the cheapest and most open model access (DeepSeek), the most real-time-aware assistant with built-in image and video generation (Grok), or the flexibility to compare and switch between many different AI labs' models in one app (Poe).",
  "bestFor": {
    "deepseek": "Developers and cost-conscious users who want a free, capable chat app plus the cheapest per-token API access and the option to self-host open-weight models.",
    "grok": "Users who want an assistant with real-time access to live X posts and trends plus built-in image and video generation through Grok Imagine.",
    "poe": "Users who want to try and compare multiple AI labs' models, including GPT, Claude, Gemini, and Grok, from a single subscription instead of committing to just one provider."
  },
  "highlights": [
    {
      "title": "Poe is the only aggregator of the three",
      "description": "Poe lets users chat with models from OpenAI, Anthropic, Google, xAI, and others inside one app, rather than offering its own proprietary foundation model the way DeepSeek and Grok do.",
      "toolSlugs": [
        "poe"
      ]
    },
    {
      "title": "DeepSeek has by far the lowest API pricing",
      "description": "DeepSeek-V3 is priced at roughly $0.27 per million input tokens and $0.40 per million output tokens, well below Grok 4.5's roughly $2 per million input and $6 per million output tokens, and it is the only one of the three offering open-weight, self-hostable models.",
      "toolSlugs": [
        "deepseek"
      ]
    },
    {
      "title": "Grok combines real-time data with built-in image and video generation",
      "description": "Grok's native integration with X's live post feed and its Grok Imagine feature for generating images and video are not matched by a documented equivalent in DeepSeek or Poe.",
      "toolSlugs": [
        "grok"
      ]
    },
    {
      "title": "Pricing complexity varies sharply across the three",
      "description": "DeepSeek's chat app is simply free with metered API pricing, Poe uses a points-based system that consumes credits at different rates per model, and Grok splits pricing across standalone SuperGrok tiers and separate X Premium bundles.",
      "toolSlugs": [
        "deepseek",
        "grok",
        "poe"
      ]
    },
    {
      "title": "Only DeepSeek is open-weight and self-hostable",
      "description": "DeepSeek's models can be downloaded, self-hosted, and fine-tuned, a capability not documented for Grok or for the models Poe aggregates.",
      "toolSlugs": [
        "deepseek"
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
            "poe": "unavailable"
          },
          "note": "Poe provides access to third-party labs' models rather than its own foundation model."
        },
        {
          "feature": "Image and video generation",
          "statuses": {
            "deepseek": "not-documented",
            "grok": "available",
            "poe": "available"
          },
          "note": "Grok offers this via Grok Imagine; Poe offers it via integrated third-party models like Ideogram and Runway."
        },
        {
          "feature": "Multi-model access within a single app",
          "statuses": {
            "deepseek": "unavailable",
            "grok": "unavailable",
            "poe": "available"
          }
        },
        {
          "feature": "Real-time web or social data integration",
          "statuses": {
            "deepseek": "available",
            "grok": "available",
            "poe": "not-documented"
          },
          "note": "DeepSeek's chat app includes web search; Grok has native real-time X integration."
        },
        {
          "feature": "Open-weight, self-hostable models",
          "statuses": {
            "deepseek": "available",
            "grok": "unavailable",
            "poe": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Access and Platforms",
      "rows": [
        {
          "feature": "Free tier available",
          "statuses": {
            "deepseek": "available",
            "grok": "available",
            "poe": "available"
          }
        },
        {
          "feature": "Developer API",
          "statuses": {
            "deepseek": "available",
            "grok": "available",
            "poe": "available"
          },
          "note": "Poe's API is billed through its shared points system rather than a separate metered rate."
        }
      ]
    },
    {
      "group": "Pricing and Cost Model",
      "rows": [
        {
          "feature": "Published per-token usage-based API pricing",
          "statuses": {
            "deepseek": "available",
            "grok": "available",
            "poe": "limited"
          },
          "note": "Poe uses a points-based allowance rather than a simple published per-token rate."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Poe the same company as DeepSeek or Grok?",
      "answer": "No. Poe is built and operated by Quora as an aggregator app that gives access to many different labs' models, including at times Grok, rather than being its own AI lab."
    },
    {
      "question": "Which is cheapest for API or developer use?",
      "answer": "DeepSeek's API is the cheapest of the three, priced at roughly $0.27 per million input tokens and $0.40 per million output tokens for DeepSeek-V3, well below Grok's per-million-token pricing and Poe's points-based system."
    },
    {
      "question": "Can I self-host any of these models?",
      "answer": "Only DeepSeek releases open-weight models that can be downloaded and self-hosted. Grok's models and the models Poe aggregates are only accessible through their respective apps or APIs."
    },
    {
      "question": "Which one has real-time access to social media or web data?",
      "answer": "Grok has native real-time integration with X's live post feed, and DeepSeek's chat app includes web search. Poe's available data does not document a similar live-data integration."
    },
    {
      "question": "Do all three have free tiers?",
      "answer": "Yes. DeepSeek's chat app is entirely free, Grok offers a free tier with limited prompts every two hours, and Poe offers a free tier with a limited daily point allowance."
    },
    {
      "question": "Which is best if I want to compare answers from multiple AI labs on the same question?",
      "answer": "Poe, since it is built specifically to let users chat with and compare models from OpenAI, Anthropic, Google, xAI, and others inside one app."
    }
  ]
};

export default deepseekVsGrokVsPoeContent;

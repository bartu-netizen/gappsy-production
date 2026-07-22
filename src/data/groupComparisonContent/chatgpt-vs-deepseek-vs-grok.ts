import type { GroupComparisonContent } from './types';

const chatgptVsDeepseekVsGrokContent: GroupComparisonContent = {
  "verdict": "ChatGPT, DeepSeek, and Grok are all general-purpose AI chatbots, but they optimize for different things: ChatGPT leads on polish, breadth of features, and ecosystem maturity, DeepSeek wins on raw price-to-performance with open-weight models developers can self-host, and Grok differentiates through real-time X data access and a faster, less filtered personality. Budget-conscious developers and self-hosters tend to gravitate to DeepSeek, mainstream consumers and professionals defaults to ChatGPT, and users who want live social context or Musk-ecosystem integration pick Grok.",
  "bestFor": {
    "chatgpt": "Individuals and businesses that want the most mature, feature-complete AI assistant with strong writing, coding, and agentic tools across every platform.",
    "deepseek": "Developers and cost-sensitive teams who want frontier-level reasoning and coding performance at a fraction of the API cost, with the option to self-host open-weight models.",
    "grok": "Users who want an AI chatbot with live access to X's real-time conversation feed and a more irreverent tone, especially those already inside the X ecosystem."
  },
  "highlights": [
    {
      "title": "Cheapest path to frontier-level reasoning",
      "description": "DeepSeek-R1 and DeepSeek-V3 are priced far below Western competitors on a per-token basis and are released as open weights, letting developers self-host or fine-tune models instead of paying subscription fees.",
      "toolSlugs": [
        "deepseek"
      ]
    },
    {
      "title": "Most complete assistant ecosystem",
      "description": "ChatGPT spans web, mobile, desktop, and API with Custom GPTs, Projects, persistent memory, voice mode, and coding-agent tools, backed by the largest active user base of any consumer AI assistant.",
      "toolSlugs": [
        "chatgpt"
      ]
    },
    {
      "title": "Real-time social awareness",
      "description": "Grok's native integration with X's live post feed gives it access to breaking news and public conversation that ChatGPT and DeepSeek must retrieve through separate web search tools.",
      "toolSlugs": [
        "grok"
      ]
    },
    {
      "title": "Free tiers with real usage caps",
      "description": "All three offer a free way to start, though the generosity differs: ChatGPT's free tier has periodic message caps, DeepSeek's chat app is free without a metered subscription layer, and Grok's free tier limits users to roughly 10 prompts every two hours.",
      "toolSlugs": [
        "chatgpt",
        "deepseek",
        "grok"
      ]
    },
    {
      "title": "Data governance considerations",
      "description": "DeepSeek's hosted consumer app routes data through China-based infrastructure, which has led some governments and enterprises to restrict the official app, a consideration that does not apply to ChatGPT or Grok.",
      "toolSlugs": [
        "deepseek"
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
            "chatgpt": "available",
            "deepseek": "available",
            "grok": "available"
          }
        },
        {
          "feature": "Chain-of-thought reasoning mode",
          "statuses": {
            "chatgpt": "available",
            "deepseek": "available",
            "grok": "available"
          },
          "note": "ChatGPT uses higher-effort model variants, DeepSeek offers a dedicated Deep Think mode, and Grok relies on its flagship model tier."
        },
        {
          "feature": "Image generation",
          "statuses": {
            "chatgpt": "available",
            "deepseek": "unavailable",
            "grok": "available"
          },
          "note": "Grok Imagine also generates short videos, a capability neither ChatGPT nor DeepSeek documents."
        }
      ]
    },
    {
      "group": "Access and openness",
      "rows": [
        {
          "feature": "Open-weight / self-hostable models",
          "statuses": {
            "chatgpt": "unavailable",
            "deepseek": "available",
            "grok": "unavailable"
          }
        },
        {
          "feature": "Real-time social feed integration",
          "statuses": {
            "chatgpt": "unavailable",
            "deepseek": "unavailable",
            "grok": "available"
          }
        },
        {
          "feature": "Mobile apps (iOS and Android)",
          "statuses": {
            "chatgpt": "available",
            "deepseek": "available",
            "grok": "available"
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
            "chatgpt": "available",
            "deepseek": "available",
            "grok": "available"
          }
        },
        {
          "feature": "Dedicated business/team plan",
          "statuses": {
            "chatgpt": "available",
            "deepseek": "not-documented",
            "grok": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, ChatGPT, DeepSeek, or Grok?",
      "answer": "DeepSeek is the cheapest option overall: its chat app is free and its API is priced at a fraction of a cent per thousand tokens. ChatGPT's paid tiers start at $8/month for Go and $20/month for Plus, while Grok's standalone SuperGrok Lite starts at $10/month, with X Premium bundling in basic Grok access from $8/month."
    },
    {
      "question": "Can I self-host DeepSeek instead of using ChatGPT or Grok?",
      "answer": "Yes. DeepSeek releases its DeepSeek-V3 and DeepSeek-R1 models with open weights, so developers can download and run them on their own infrastructure. ChatGPT and Grok are closed, hosted-only products with no self-hosting option."
    },
    {
      "question": "Does Grok have access to information ChatGPT and DeepSeek do not?",
      "answer": "Grok's tightest differentiator is native, real-time access to X's live post feed, which gives it visibility into breaking news and public conversation as it happens. ChatGPT and DeepSeek instead rely on separate built-in web search features to retrieve current information."
    },
    {
      "question": "Are there data privacy concerns with any of these three chatbots?",
      "answer": "DeepSeek's official consumer app routes data through China-based infrastructure, which has led some governments and enterprises to restrict or ban it on official devices. ChatGPT and Grok do not carry that same restriction, though all three vendors publish their own data-handling policies worth reviewing for specific compliance needs."
    },
    {
      "question": "Which tool is best for coding tasks?",
      "answer": "All three offer competent coding assistance. ChatGPT includes sandboxed code execution and coding-agent tools on paid tiers, DeepSeek benchmarks strongly on coding and math relative to its low cost, and Grok provides general code writing and debugging as part of its conversational assistant."
    }
  ]
};

export default chatgptVsDeepseekVsGrokContent;

import type { GroupComparisonContent } from './types';

const chatgptVsClaudeVsDeepseekContent: GroupComparisonContent = {
  "verdict": "ChatGPT, Claude, and DeepSeek all offer a free consumer chatbot plus a paid API, but they optimize for different priorities. ChatGPT remains the broadest consumer product, layering voice mode, image generation, and Custom GPTs on top of the GPT-5 model family. Claude leans toward developers and enterprises through Claude Code and compliance-heavy admin features like SSO and audit logs. DeepSeek competes almost entirely on cost and openness, shipping open-weight models at a fraction of the per-token price of its Western rivals, though its China-based infrastructure draws scrutiny in some regulated markets.",
  "bestFor": {
    "chatgpt": "Users who want the most full-featured, widely integrated consumer AI assistant, with strong image generation, voice mode, and Custom GPTs.",
    "claude": "Developers and teams building agentic coding workflows through Claude Code who also need enterprise-grade compliance controls like SSO and audit logs.",
    "deepseek": "Cost-sensitive developers and enterprises that want open-weight models they can self-host or call through an extremely low-cost pay-per-token API."
  },
  "highlights": [
    {
      "title": "DeepSeek undercuts on API price",
      "description": "DeepSeek-V3 API pricing runs a fraction of a cent per thousand tokens, dramatically cheaper than ChatGPT or Claude's per-token API rates, making it attractive for high-volume applications.",
      "toolSlugs": [
        "deepseek"
      ]
    },
    {
      "title": "Claude Code targets agentic development",
      "description": "Claude Code lets Claude read, edit, and run code across a codebase from a terminal or IDE, a dedicated agentic coding surface that neither ChatGPT's nor DeepSeek's documented feature sets match in depth.",
      "toolSlugs": [
        "claude"
      ]
    },
    {
      "title": "ChatGPT has the broadest consumer feature surface",
      "description": "Voice mode, image generation, Custom GPTs, Projects, and sandboxed code execution are all bundled into one product, giving ChatGPT the widest range of built-in capabilities among the three.",
      "toolSlugs": [
        "chatgpt"
      ]
    },
    {
      "title": "Only DeepSeek ships open weights",
      "description": "DeepSeek-V3 and DeepSeek-R1 can be downloaded and self-hosted, an option ChatGPT and Claude don't offer since both remain closed, API- or app-access-only models.",
      "toolSlugs": [
        "deepseek",
        "chatgpt",
        "claude"
      ]
    },
    {
      "title": "Data governance differs sharply",
      "description": "ChatGPT and Claude both offer enterprise-tier SSO, SCIM, and audit logging, while DeepSeek's hosted consumer app routes data through China-based infrastructure, leading some governments and enterprises to restrict it on official devices.",
      "toolSlugs": [
        "chatgpt",
        "claude",
        "deepseek"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Model Access and Capabilities",
      "rows": [
        {
          "feature": "Voice mode",
          "statuses": {
            "chatgpt": "available",
            "claude": "not-documented",
            "deepseek": "not-documented"
          }
        },
        {
          "feature": "Agentic coding tool (edit and run code in a codebase)",
          "statuses": {
            "chatgpt": "limited",
            "claude": "available",
            "deepseek": "not-documented"
          },
          "note": "ChatGPT Plus includes coding-agent tools and sandboxed code execution; Claude Code is a dedicated agentic development surface."
        },
        {
          "feature": "Image generation",
          "statuses": {
            "chatgpt": "available",
            "claude": "not-documented",
            "deepseek": "not-documented"
          }
        },
        {
          "feature": "Open-weight, self-hostable models",
          "statuses": {
            "chatgpt": "unavailable",
            "claude": "unavailable",
            "deepseek": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free tier chat access",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "deepseek": "available"
          }
        },
        {
          "feature": "Real-time web search",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "deepseek": "available"
          }
        }
      ]
    },
    {
      "group": "Enterprise and API",
      "rows": [
        {
          "feature": "Developer API",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "deepseek": "available"
          }
        },
        {
          "feature": "Enterprise SSO and SCIM admin controls",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "deepseek": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheapest to run at scale through the API?",
      "answer": "DeepSeek, by a wide margin. DeepSeek-V3 is priced at roughly $0.27 per million input tokens and $0.40 per million output tokens, compared to Claude and ChatGPT's per-model API pricing, which runs substantially higher for comparable capability tiers."
    },
    {
      "question": "Which has the strongest coding agent?",
      "answer": "Claude, through Claude Code, which is built specifically for reading, editing, and running code across a codebase from a terminal or IDE. ChatGPT offers coding-agent tools and sandboxed code execution within Plus, while DeepSeek's documented feature set doesn't include a comparable agentic coding product."
    },
    {
      "question": "Can I self-host any of these models?",
      "answer": "Only DeepSeek's models are open-weight and downloadable for self-hosting or fine-tuning. ChatGPT and Claude are closed models accessible only through their official apps and APIs."
    },
    {
      "question": "Are there data privacy concerns with any of these tools?",
      "answer": "DeepSeek's hosted consumer app routes data through China-based infrastructure, which has led some governments and enterprises to restrict or ban the official app on official devices. ChatGPT and Claude both publish enterprise data-handling and compliance options, including workspace data exclusion from training."
    },
    {
      "question": "Do all three have a genuinely free tier?",
      "answer": "Yes. ChatGPT, Claude, and DeepSeek each offer a free chat plan with usage limits, though the specific caps and included capabilities differ across the three."
    },
    {
      "question": "Which is best for enterprise admin and compliance needs?",
      "answer": "ChatGPT and Claude both offer enterprise tiers with SSO, SCIM provisioning, and audit logging. DeepSeek's provided feature set doesn't document equivalent enterprise administration controls."
    }
  ]
};

export default chatgptVsClaudeVsDeepseekContent;

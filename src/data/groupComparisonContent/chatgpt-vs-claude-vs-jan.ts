import type { GroupComparisonContent } from './types';

const chatgptVsClaudeVsJanContent: GroupComparisonContent = {
  "verdict": "ChatGPT and Claude are both cloud-hosted AI assistants with free tiers and paid plans that scale up to enterprise administration, while Jan is a fully free, open-source, local-first alternative that runs open-weight models entirely offline on a user's own hardware. ChatGPT leans on features like voice mode, image generation, and real-time web browsing, while Claude emphasizes coding and agentic tasks through Claude Code plus enterprise compliance features. Jan trades some raw capability and polish for complete data privacy, no telemetry by default, and zero ongoing cost beyond the user's own hardware. The choice largely comes down to whether cloud convenience and top-tier model capability or local control and privacy matter more.",
  "bestFor": {
    "chatgpt": "Users who want the broadest general-purpose assistant with voice, image generation, real-time web browsing, and a fast-moving feature set across web, mobile, and desktop",
    "claude": "Users and teams focused on coding and agentic workflows who want strong developer tooling through Claude Code plus enterprise-grade admin, SSO, and audit features",
    "jan": "Users who want a completely free, open-source, offline-capable AI assistant that keeps data on-device and offers an OpenAI-compatible local API for developers"
  },
  "highlights": [
    {
      "title": "Jan is the only fully offline, privacy-first option",
      "description": "Jan runs open-weight models entirely on a user's own device with no telemetry by default, while ChatGPT and Claude are both cloud-hosted services that require an internet connection and send data to the provider.",
      "toolSlugs": [
        "jan",
        "chatgpt",
        "claude"
      ]
    },
    {
      "title": "ChatGPT and Claude both scale from free to enterprise",
      "description": "Both platforms offer a free tier alongside paid consumer plans and custom enterprise pricing with admin controls, giving individuals and organizations a path to upgrade as usage grows.",
      "toolSlugs": [
        "chatgpt",
        "claude"
      ]
    },
    {
      "title": "Claude Code differentiates Claude for developers",
      "description": "Claude's dedicated Claude Code product and emphasis on agentic tasks give it a distinct edge for coding-focused workflows compared to ChatGPT's more general code execution feature.",
      "toolSlugs": [
        "claude"
      ]
    },
    {
      "title": "ChatGPT covers the widest range of built-in capabilities",
      "description": "Voice mode, custom GPTs, image generation, and real-time web browsing are all documented ChatGPT features that are not all matched feature-for-feature by Claude or Jan.",
      "toolSlugs": [
        "chatgpt"
      ]
    },
    {
      "title": "Jan is free to use with no subscription required",
      "description": "Jan is free and open source with local models, or usable with cloud models by bringing your own API key, avoiding the recurring subscription costs of ChatGPT Plus or Claude Pro.",
      "toolSlugs": [
        "jan"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Availability and Privacy",
      "rows": [
        {
          "feature": "Free to use",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "jan": "available"
          }
        },
        {
          "feature": "Fully offline or local operation",
          "statuses": {
            "chatgpt": "unavailable",
            "claude": "unavailable",
            "jan": "available"
          }
        },
        {
          "feature": "No telemetry by default",
          "statuses": {
            "chatgpt": "not-documented",
            "claude": "not-documented",
            "jan": "available"
          }
        }
      ]
    },
    {
      "group": "Core Capabilities",
      "rows": [
        {
          "feature": "Real-time web search or browsing",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "jan": "not-documented"
          }
        },
        {
          "feature": "Image generation",
          "statuses": {
            "chatgpt": "available",
            "claude": "not-documented",
            "jan": "not-documented"
          }
        },
        {
          "feature": "Coding-focused agent tooling",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "jan": "not-documented"
          },
          "note": "ChatGPT offers code execution; Claude offers the dedicated Claude Code product"
        }
      ]
    },
    {
      "group": "Developer and Enterprise",
      "rows": [
        {
          "feature": "Developer API",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "jan": "available"
          },
          "note": "Jan exposes an OpenAI-compatible local API server rather than a hosted cloud API"
        },
        {
          "feature": "Enterprise administration (SSO, audit logs)",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "jan": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the main difference between ChatGPT, Claude, and Jan?",
      "answer": "ChatGPT and Claude are cloud-hosted AI assistants from OpenAI and Anthropic with free and paid tiers, while Jan is a free, open-source app that runs open-weight AI models entirely offline on the user's own computer."
    },
    {
      "question": "Is Jan really free with no subscription?",
      "answer": "Yes, Jan is free and open source under Apache 2.0 for running local models, and it also supports bringing your own API key to connect to cloud models if you want to pay a provider directly instead of a Jan subscription."
    },
    {
      "question": "Which is best for coding, ChatGPT or Claude?",
      "answer": "Claude has a dedicated Claude Code product built for agentic coding tasks, while ChatGPT offers a general code execution feature; both are capable, but Claude leans more specifically into developer and agentic workflows."
    },
    {
      "question": "Can Jan generate images like ChatGPT?",
      "answer": "Image generation is not documented as a Jan feature, while ChatGPT includes image generation as part of its core feature set."
    },
    {
      "question": "Does Jan work without an internet connection?",
      "answer": "Yes, Jan's core feature is fully offline local inference using open-weight models, with no telemetry by default, unlike ChatGPT and Claude which require a connection to their cloud services."
    },
    {
      "question": "Do ChatGPT and Claude both offer enterprise plans?",
      "answer": "Yes, both offer enterprise-tier plans with custom pricing that add administration features such as SSO and audit logs, while Jan does not document enterprise administration features since it is a local-first, open-source app."
    }
  ]
};

export default chatgptVsClaudeVsJanContent;

import type { GroupComparisonContent } from './types';

const gpt4allVsJanVsLibrechatContent: GroupComparisonContent = {
  "verdict": "GPT4All and Jan are both free, single-user desktop apps for running open-weight models locally, while LibreChat is a self-hosted, multi-user server application built for teams. GPT4All is the most tightly focused on fully offline, private use with its LocalDocs feature, Jan adds the ability to mix local models with cloud providers like OpenAI or Anthropic using your own API key, and LibreChat trades desktop simplicity for the broadest provider support, agents, and enterprise login features. All three are completely free and open source, so the choice comes down to deployment model and whether cloud model access or multi-user support matters.",
  "bestFor": {
    "gpt4all": "Privacy-focused individuals who want a beginner-friendly, fully offline desktop app that can chat with their own local documents through LocalDocs, without any cloud dependency at all.",
    "jan": "Users who want a single desktop app that can run local open-weight models and also call cloud models like OpenAI, Anthropic, or Google Gemini with their own API key, without setting up a separate server.",
    "librechat": "Teams and organizations that need a self-hosted, multi-user ChatGPT-style interface with SSO, AI agents, code execution, and access to nearly every major LLM provider in one governed deployment."
  },
  "highlights": [
    {
      "title": "LibreChat is the only multi-user, self-hosted option",
      "description": "GPT4All and Jan are both single-user desktop applications, while LibreChat is a Node.js and React web application deployed via Docker with multi-user authentication, SSO, and two-factor authentication built in.",
      "toolSlugs": [
        "librechat"
      ]
    },
    {
      "title": "GPT4All's LocalDocs stands out for offline document chat",
      "description": "GPT4All's LocalDocs feature indexes a user's own files into on-device embeddings so the model can search and cite them in chat, entirely offline - a capability not documented for Jan.",
      "toolSlugs": [
        "gpt4all"
      ]
    },
    {
      "title": "Jan blends local and cloud models in one app",
      "description": "Jan can run fully local open-weight models via llama.cpp and also connect to OpenAI, Anthropic Claude, or Google Gemini using a bring-your-own-API-key model, letting users switch between local privacy and cloud model quality inside one interface.",
      "toolSlugs": [
        "jan"
      ]
    },
    {
      "title": "LibreChat has the broadest provider list and developer tooling",
      "description": "LibreChat connects to OpenAI, Anthropic, Google, AWS Bedrock, Azure, Mistral, Groq, DeepSeek, OpenRouter, and Ollama-compatible endpoints, and adds AI agents with Model Context Protocol tool integration plus a sandboxed Code Interpreter that neither GPT4All nor Jan document.",
      "toolSlugs": [
        "librechat"
      ]
    },
    {
      "title": "All three are completely free with no paid tier",
      "description": "GPT4All, Jan, and LibreChat are all free and open source with no subscription, seat licensing, or usage limits from the project itself; any recurring cost comes from optional cloud API usage or, for LibreChat, self-hosting infrastructure.",
      "toolSlugs": [
        "gpt4all",
        "jan",
        "librechat"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and access model",
      "rows": [
        {
          "feature": "Single-user desktop app",
          "statuses": {
            "gpt4all": "available",
            "jan": "available",
            "librechat": "unavailable"
          },
          "note": "LibreChat is a self-hosted web application deployed via Docker, not a desktop app."
        },
        {
          "feature": "Multi-user accounts with SSO",
          "statuses": {
            "gpt4all": "unavailable",
            "jan": "unavailable",
            "librechat": "available"
          }
        }
      ]
    },
    {
      "group": "Model sourcing and connectivity",
      "rows": [
        {
          "feature": "Fully offline local model inference",
          "statuses": {
            "gpt4all": "available",
            "jan": "available",
            "librechat": "limited"
          },
          "note": "LibreChat can use locally-run models only via a separate Ollama-compatible endpoint rather than a built-in local inference engine."
        },
        {
          "feature": "Native cloud provider connections (OpenAI, Anthropic, Google, etc.)",
          "statuses": {
            "gpt4all": "unavailable",
            "jan": "available",
            "librechat": "available"
          }
        }
      ]
    },
    {
      "group": "Document handling and developer tooling",
      "rows": [
        {
          "feature": "Document upload or RAG chat over personal files",
          "statuses": {
            "gpt4all": "available",
            "jan": "not-documented",
            "librechat": "available"
          },
          "note": "GPT4All's LocalDocs and LibreChat's RAG pipeline both support this; Jan does not document an equivalent feature."
        },
        {
          "feature": "OpenAI-compatible local API server",
          "statuses": {
            "gpt4all": "available",
            "jan": "available",
            "librechat": "not-documented"
          }
        },
        {
          "feature": "AI agents and MCP tool-calling",
          "statuses": {
            "gpt4all": "not-documented",
            "jan": "not-documented",
            "librechat": "available"
          }
        },
        {
          "feature": "Sandboxed code execution (Code Interpreter)",
          "statuses": {
            "gpt4all": "not-documented",
            "jan": "not-documented",
            "librechat": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these is easiest to run as a single-user desktop app with no server setup?",
      "answer": "GPT4All and Jan are both native desktop applications for Windows, macOS, and Linux that run models locally with no server to configure. LibreChat instead requires deploying a self-hosted web application, typically via Docker."
    },
    {
      "question": "Which supports multi-user login and SSO for a team?",
      "answer": "Only LibreChat documents multi-user authentication with SSO (OAuth, SAML, LDAP) and two-factor authentication. GPT4All and Jan are both designed as single-user desktop tools."
    },
    {
      "question": "Which one can chat with my own local documents?",
      "answer": "GPT4All's LocalDocs feature and LibreChat's RAG pipeline both let you upload documents for the model to search and reference. Jan does not document an equivalent document-chat feature."
    },
    {
      "question": "Can I use cloud models like GPT or Claude with these instead of a local model?",
      "answer": "Jan and LibreChat both support connecting to cloud providers such as OpenAI, Anthropic, and Google using your own API key. GPT4All is documented as a local-only tool with no cloud model connection."
    },
    {
      "question": "Which one requires self-hosting infrastructure like Docker?",
      "answer": "LibreChat is the one built around self-hosted deployment, officially recommended via Docker Compose. GPT4All and Jan are installed as standalone desktop apps with no server required."
    },
    {
      "question": "Are any of these three paid products?",
      "answer": "No. GPT4All, Jan, and LibreChat are all free and open source with no subscription tiers from the project itself. The only ongoing costs are optional cloud API usage (for Jan and LibreChat) or self-hosting infrastructure (for LibreChat)."
    }
  ]
};

export default gpt4allVsJanVsLibrechatContent;

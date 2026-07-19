import type { GroupComparisonContent } from './types';

const anythingllmVsFlowiseVsOllamaContent: GroupComparisonContent = {
  "verdict": "These three sit at different layers of a private or local AI stack rather than being pure substitutes: Ollama is the free, lightweight runtime that downloads and serves open-weight models locally via CLI and REST API, while AnythingLLM and Flowise are application layers that can run on top of a model source like Ollama. AnythingLLM is the closest to a ready-made private chat app for documents and agents, whereas Flowise trades that turnkey simplicity for a visual canvas to design custom RAG pipelines and multi-agent workflows. Buyers researching all three are usually deciding how much of the stack they want pre-built versus assembled themselves.",
  "bestFor": {
    "anythingllm": "Individuals and small teams who want a ready-made, privacy-first app for chatting with their own documents and running agents without building anything from scratch",
    "flowise": "Developers and technical teams who want a visual, drag-and-drop canvas to design and deploy custom RAG pipelines and multi-agent workflows as APIs",
    "ollama": "Anyone who just needs a free, lightweight way to download and run open-weight LLMs locally via CLI or REST API, often as the backend model source for other tools"
  },
  "highlights": [
    {
      "title": "Ollama is the model engine, not a full application",
      "description": "Ollama wraps llama.cpp behind a simple CLI and REST API for pulling and running open-weight models like Llama, Qwen, and Mistral; it does not include a document-chat interface or visual workflow builder the way AnythingLLM and Flowise do.",
      "toolSlugs": [
        "ollama"
      ]
    },
    {
      "title": "AnythingLLM ships a ready-made private chat app",
      "description": "AnythingLLM is purpose-built for chatting with PDFs, Word files, CSVs, and codebases entirely on-device, with AI agents layered on top, so it needs the least assembly to get a usable private assistant running.",
      "toolSlugs": [
        "anythingllm"
      ]
    },
    {
      "title": "Flowise trades turnkey simplicity for visual workflow control",
      "description": "Flowise's drag-and-drop Chatflows and Agentflows, plus over 100 model and vector store integrations, let teams design custom RAG and multi-agent logic visually rather than accepting a fixed app structure.",
      "toolSlugs": [
        "flowise"
      ]
    },
    {
      "title": "All three are free to self-host, with different paid cloud tiers",
      "description": "AnythingLLM, Flowise, and Ollama each offer a free open-source or local core, with optional paid cloud plans ranging from Ollama Cloud at $20 to $100 per month, to AnythingLLM Cloud at $50 to $99 per month, to Flowise Cloud at $35 to $65 per month.",
      "toolSlugs": [
        "anythingllm",
        "flowise",
        "ollama"
      ]
    },
    {
      "title": "AnythingLLM and Flowise both expose developer APIs for embedding",
      "description": "Both tools can be integrated into other applications through a built-in developer API, while Ollama's REST API is aimed at serving model inference rather than embedding a finished chat or agent experience.",
      "toolSlugs": [
        "anythingllm",
        "flowise"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capability",
      "rows": [
        {
          "feature": "Document chat or RAG out of the box",
          "statuses": {
            "anythingllm": "available",
            "flowise": "available",
            "ollama": "unavailable"
          },
          "note": "AnythingLLM is purpose-built for this; Flowise requires assembling a Chatflow to get the same result. Ollama has no document-chat interface of its own."
        },
        {
          "feature": "Visual drag-and-drop workflow builder",
          "statuses": {
            "anythingllm": "unavailable",
            "flowise": "available",
            "ollama": "unavailable"
          }
        },
        {
          "feature": "Multi-agent orchestration",
          "statuses": {
            "anythingllm": "available",
            "flowise": "available",
            "ollama": "not-documented"
          }
        },
        {
          "feature": "One-command open-weight model library",
          "statuses": {
            "anythingllm": "not-documented",
            "flowise": "not-documented",
            "ollama": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Integration",
      "rows": [
        {
          "feature": "Local or offline operation",
          "statuses": {
            "anythingllm": "available",
            "flowise": "available",
            "ollama": "available"
          }
        },
        {
          "feature": "Built-in developer API",
          "statuses": {
            "anythingllm": "available",
            "flowise": "available",
            "ollama": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing Model",
      "rows": [
        {
          "feature": "Free self-hosted or local core",
          "statuses": {
            "anythingllm": "available",
            "flowise": "available",
            "ollama": "available"
          }
        },
        {
          "feature": "Paid managed cloud tier",
          "statuses": {
            "anythingllm": "available",
            "flowise": "available",
            "ollama": "available"
          },
          "note": "AnythingLLM Cloud from $50/month, Flowise Cloud from $35/month, Ollama Cloud from $20/month."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do I need Ollama if I already use AnythingLLM or Flowise?",
      "answer": "Not necessarily, since both AnythingLLM and Flowise can connect to cloud LLM providers like OpenAI or Azure. But many users pair them with Ollama so model inference runs locally: Ollama serves the model and AnythingLLM or Flowise provides the document-chat or workflow layer on top."
    },
    {
      "question": "Which is easiest for a non-developer to start with?",
      "answer": "AnythingLLM is the closest to a ready-to-use app; the free desktop version requires no account and works out of the box for chatting with documents, while Flowise and Ollama both expect more comfort with building flows or using a CLI."
    },
    {
      "question": "Which tool is best for building a custom multi-agent workflow?",
      "answer": "Flowise is the strongest fit here, with its visual Agentflows for coordinating multi-step, multi-agent systems and over 100 integrations across LLM providers and vector stores. AnythingLLM also supports agents but with less visual workflow control, and Ollama has no orchestration layer of its own."
    },
    {
      "question": "Are all three free to self-host?",
      "answer": "Yes. AnythingLLM's desktop and self-hosted versions are free and MIT licensed, Flowise's core is free under Apache 2.0 and self-hostable via Docker, and Ollama's local runtime is free and open source with no per-token cost."
    },
    {
      "question": "Can these tools run completely offline?",
      "answer": "Yes, all three support local or offline operation: AnythingLLM's desktop app can run entirely on-device, Flowise can be self-hosted on infrastructure you control, and Ollama's core purpose is running models locally without sending data to a third-party API."
    }
  ]
};

export default anythingllmVsFlowiseVsOllamaContent;

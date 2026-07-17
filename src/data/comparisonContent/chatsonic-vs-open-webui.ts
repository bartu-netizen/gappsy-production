import type { ToolComparisonContent } from './types';

const chatsonicVsOpenWebuiContent: ToolComparisonContent = {
  "verdict": "Chatsonic is a hosted, subscription-based AI chatbot from Writesonic that bundles access to multiple leading models (GPT-4o, o1, Claude 3.5 Sonnet, Gemini) with real-time web search and marketing integrations, while Open WebUI is a free, self-hosted interface for running local and remote LLMs with full infrastructure control. Chatsonic optimizes for convenience and built-in content workflows; Open WebUI optimizes for data control, offline operation, and connecting to models of your own choosing.",
  "bestForToolA": "Chatsonic fits marketers and content teams who want multi-model access (GPT-4o, o1, Claude 3.5 Sonnet, Gemini) plus real-time web search, Google Search Console, and WordPress integrations in one hosted subscription starting at $16/month.",
  "bestForToolB": "Open WebUI fits technical users and organizations who want to self-host a chat interface connected to Ollama, OpenAI-compatible APIs, or other providers, with granular access control (LDAP/OAuth) and the ability to run entirely offline with local models.",
  "whoNeedsBoth": "A team could use Chatsonic for marketing-specific workflows like SEO content tied to Google Search Console and WordPress publishing, while separately running Open WebUI internally for engineers who need an offline, self-hosted interface to local models for sensitive internal work - the two address different infrastructure and use-case needs.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "Chatsonic is a hosted SaaS product with no self-hosting option documented.",
      "toolB": "Open WebUI is designed to be self-hosted via Docker, Kubernetes, or Python pip, and can run entirely offline when paired with local models like those served by Ollama.",
      "whyItMatters": "Self-hosting gives full control over data location and infrastructure, which matters for privacy-sensitive or offline use cases.",
      "benefitsWho": "Organizations with data-residency requirements or air-gapped environments benefit from Open WebUI's self-hosted, offline-capable design."
    },
    {
      "title": "Pricing",
      "toolA": "Chatsonic's Individual plan costs $16/month (billed annually), with a free plan limited to lighter models like GPT-4o mini and Claude Haiku.",
      "toolB": "Open WebUI's Open Source tier is $0, with an optional custom-priced Enterprise plan adding custom branding, SLA support, and Long-Term Support (LTS) versions.",
      "whyItMatters": "Open WebUI's base product is free software you host yourself, while Chatsonic is a recurring subscription for a hosted product.",
      "benefitsWho": "Budget-conscious technical teams benefit from Open WebUI's free open-source tier; teams wanting a turnkey hosted product may prefer Chatsonic's low $16/month entry price."
    },
    {
      "title": "Model Access",
      "toolA": "Chatsonic's paid Individual plan gives full access to GPT-4o, o1, Claude 3.5 Sonnet, and Gemini within a single subscription.",
      "toolB": "Open WebUI connects to Ollama, OpenAI-compatible APIs, LMStudio, GroqCloud, Mistral, and other providers, but users must supply and pay for their own model access/API keys separately.",
      "whyItMatters": "Chatsonic bundles model costs into one subscription price, while Open WebUI's model costs are separate and depend on what you connect it to.",
      "benefitsWho": "Users wanting one flat price for multiple frontier models benefit from Chatsonic; users wanting to mix and match their own model providers (including free local models) benefit from Open WebUI."
    },
    {
      "title": "Marketing/Content Integrations",
      "toolA": "Chatsonic includes direct Google Search Console and WordPress integrations for pulling SEO data and publishing content without leaving the chat.",
      "toolB": "Open WebUI's documented integrations focus on vector databases (9 options) for RAG and Model Context Protocol (MCP) tools rather than marketing-specific publishing workflows.",
      "whyItMatters": "Built-in publishing integrations save steps for content-focused teams, which is specific to Chatsonic here.",
      "benefitsWho": "SEO and content marketing teams benefit from Chatsonic's WordPress/Search Console integrations."
    },
    {
      "title": "Access Control & Enterprise Auth",
      "toolA": "Chatsonic's documented plans don't detail LDAP/OAuth or role-based access control features.",
      "toolB": "Open WebUI offers granular role-based access control with LDAP/Active Directory and OAuth support.",
      "whyItMatters": "Enterprise-grade authentication and access control matter for organizations managing many internal users with varying permission levels.",
      "benefitsWho": "IT/security teams deploying a chat tool company-wide benefit from Open WebUI's LDAP/OAuth support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Model Access",
      "rows": [
        {
          "feature": "Multi-model chat (GPT-4o, Claude, Gemini, etc.)",
          "toolA": "available",
          "toolB": "available",
          "note": "Chatsonic: paid plan; Open WebUI: bring your own provider"
        },
        {
          "feature": "Real-time web search grounding",
          "toolA": "available",
          "toolB": "available",
          "note": "Open WebUI via web search integration"
        },
        {
          "feature": "Local/offline model support",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Via Ollama"
        },
        {
          "feature": "Image generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Flux 1.1, DALL-E 3 on Chatsonic's paid plan"
        }
      ]
    },
    {
      "group": "Deployment & Control",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Offline operation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "LDAP/OAuth access control",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Vector database / RAG support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "9 vector database options"
        }
      ]
    },
    {
      "group": "Content & Collaboration",
      "rows": [
        {
          "feature": "WordPress publishing integration",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Google Search Console integration",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Canvas/writing workspace",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Team collaboration tools (voice/video, channels)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Open WebUI replace Chatsonic for content marketing tasks?",
      "answer": "Open WebUI doesn't document the Google Search Console or WordPress publishing integrations that Chatsonic includes, so it isn't built for that specific marketing workflow, though it can still be used for general chat with connected models."
    },
    {
      "question": "Is Open WebUI free?",
      "answer": "Yes, Open WebUI's Open Source tier is free and self-hosted; an optional custom-priced Enterprise plan adds branding, SLA support, and Long-Term Support versions."
    },
    {
      "question": "Does Chatsonic offer real-time web search like Open WebUI?",
      "answer": "Yes, real-time web search grounding is one of Chatsonic's core features, and Open WebUI also supports web search integration alongside its retrieval-augmented generation (RAG) capabilities."
    },
    {
      "question": "Can Open WebUI run without an internet connection?",
      "answer": "Yes, it's designed to operate entirely offline when paired with local models such as those served by Ollama, which Chatsonic (a hosted SaaS product) does not support."
    },
    {
      "question": "How much does Chatsonic cost compared to Open WebUI?",
      "answer": "Chatsonic's Individual plan is $16/month billed annually with a limited free tier, while Open WebUI's core software is free to self-host, though you separately pay for whatever model providers you connect it to."
    },
    {
      "question": "Which tool gives access to more AI models?",
      "answer": "Chatsonic bundles GPT-4o, o1, Claude 3.5 Sonnet, and Gemini under one subscription. Open WebUI itself doesn't include models but connects to many providers (Ollama, OpenAI-compatible APIs, LMStudio, GroqCloud, Mistral), so its effective model access depends on what you connect."
    }
  ]
};

export default chatsonicVsOpenWebuiContent;

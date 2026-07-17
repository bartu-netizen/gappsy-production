import type { ToolComparisonContent } from './types';

const chatgptVsOpenWebuiContent: ToolComparisonContent = {
  "verdict": "ChatGPT is OpenAI's hosted conversational AI assistant with a polished consumer product (voice mode, image generation, Custom GPTs, memory) available on a freemium model, while Open WebUI is a free, self-hosted interface for running and managing local and remote LLMs, giving technical users full infrastructure control rather than a finished consumer product. ChatGPT prioritizes ease of use and its own frontier models; Open WebUI prioritizes flexibility, offline capability, and choice of model provider.",
  "bestForToolA": "ChatGPT fits general users and businesses wanting a ready-to-use assistant with voice mode, image generation, code interpreter, and web browsing, accessible on a free plan or $20/month Plus without any setup or hosting.",
  "bestForToolB": "Open WebUI fits developers and organizations that want to self-host a chat interface connected to Ollama, OpenAI-compatible APIs, or other providers, with LDAP/OAuth access control and the ability to run entirely offline for privacy or air-gapped use cases.",
  "whoNeedsBoth": "A team could rely on ChatGPT Plus for everyday drafting, research, and coding help via OpenAI's hosted models, while separately running Open WebUI internally to give employees access to self-hosted local models for sensitive data that shouldn't leave company infrastructure - the two address different data-sensitivity needs rather than the same job.",
  "keyDifferences": [
    {
      "title": "Hosting & Data Control",
      "toolA": "ChatGPT is a fully hosted product; enterprise-grade data controls and compliance guarantees require a separate, custom-priced Enterprise agreement.",
      "toolB": "Open WebUI is self-hosted via Docker, Kubernetes, or Python pip and can run entirely offline, giving organizations direct control over where data is processed.",
      "whyItMatters": "Data residency and privacy requirements often can't be satisfied by a hosted consumer product without an enterprise contract, while self-hosting addresses this by default.",
      "benefitsWho": "Regulated industries or privacy-sensitive teams benefit from Open WebUI's self-hosted model."
    },
    {
      "title": "Pricing",
      "toolA": "ChatGPT is freemium, with Plus at $20/month, and Team/Enterprise plans at custom per-seat or contract pricing.",
      "toolB": "Open WebUI's core Open Source tier is $0 to self-host, with a custom-priced Enterprise add-on for branding, SLA, and LTS support.",
      "whyItMatters": "Open WebUI's base cost is just infrastructure and whatever model APIs you connect, while ChatGPT Plus is a flat recurring subscription for OpenAI's own models.",
      "benefitsWho": "Cost-conscious technical teams that already have model access (e.g., via local Ollama models) benefit from Open WebUI's lower marginal cost."
    },
    {
      "title": "Native Features",
      "toolA": "ChatGPT includes Custom GPTs (configurable assistants with tailored instructions and tools), Projects for organizing ongoing work, Memory across conversations, voice mode, and a code interpreter for running/debugging code and analyzing files.",
      "toolB": "Open WebUI's native features focus on infrastructure: broad model support, local RAG with 9 vector database options, and team collaboration tools like voice/video calling and channels, rather than OpenAI-specific features like Custom GPTs.",
      "whyItMatters": "ChatGPT's polished built-in features (Custom GPTs, code interpreter) aren't automatically present in Open WebUI, which depends on what plugins/models are configured.",
      "benefitsWho": "Users wanting ready-made assistant features out of the box benefit from ChatGPT; users wanting a flexible, model-agnostic base to build on benefit from Open WebUI's plugin architecture."
    },
    {
      "title": "Model Choice",
      "toolA": "ChatGPT is limited to OpenAI's own models, with paid tiers unlocking more advanced/faster models.",
      "toolB": "Open WebUI connects to Ollama, OpenAI-compatible APIs, LMStudio, GroqCloud, Mistral, and other providers, letting users choose or switch model backends.",
      "whyItMatters": "Organizations wanting to avoid vendor lock-in or use open-weight models need a tool like Open WebUI that isn't tied to one provider.",
      "benefitsWho": "Teams wanting model flexibility or wanting to use open-weight/local models benefit from Open WebUI."
    },
    {
      "title": "Developer/API Access",
      "toolA": "ChatGPT's underlying models are accessible via OpenAI's Developer API for building custom applications separate from the ChatGPT product itself.",
      "toolB": "Open WebUI itself is the interface layer, extensible through filters, actions, pipes, tools, and Model Context Protocol (MCP) integrations, rather than exposing its own consumer API.",
      "whyItMatters": "The two offer different kinds of extensibility: ChatGPT's API lets you build new products on OpenAI's models, while Open WebUI's plugin architecture lets you extend the chat interface itself.",
      "benefitsWho": "Developers building standalone AI products benefit from ChatGPT's API; developers wanting to extend a self-hosted chat UI benefit from Open WebUI's plugin system."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Chat Capabilities",
      "rows": [
        {
          "feature": "Voice mode",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Image generation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Code interpreter / data analysis",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Web browsing",
          "toolA": "available",
          "toolB": "available",
          "note": "Open WebUI via web search integration"
        }
      ]
    },
    {
      "group": "Deployment & Infrastructure",
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
          "feature": "Multiple model provider support",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "ChatGPT: OpenAI models only; Open WebUI: Ollama, OpenAI-compatible, LMStudio, GroqCloud, Mistral"
        },
        {
          "feature": "LDAP/OAuth access control",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Customization & Extensibility",
      "rows": [
        {
          "feature": "Custom assistant builder",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChatGPT's Custom GPTs"
        },
        {
          "feature": "Developer API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Open WebUI uses MCP/plugin architecture instead"
        },
        {
          "feature": "Persistent memory across chats",
          "toolA": "available",
          "toolB": "available",
          "note": "Open WebUI via team collaboration/persistent memory features"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "ChatGPT usage-limited; Open WebUI entirely free, self-hosted"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Open WebUI a ChatGPT alternative?",
      "answer": "It's a different kind of product: Open WebUI is a self-hosted interface you connect to models of your choice (including local models via Ollama), while ChatGPT is a hosted product built specifically around OpenAI's own models with features like Custom GPTs and voice mode."
    },
    {
      "question": "Can Open WebUI use OpenAI's models?",
      "answer": "Yes, Open WebUI supports OpenAI-compatible APIs, so it can connect to OpenAI's models as one of several provider options, alongside Ollama, LMStudio, GroqCloud, and Mistral."
    },
    {
      "question": "Which is cheaper, ChatGPT or Open WebUI?",
      "answer": "Open WebUI's core software is free and self-hosted, so ongoing cost depends only on whatever model APIs you connect it to (or $0 if using local models). ChatGPT Plus costs $20/month for OpenAI's hosted models and features."
    },
    {
      "question": "Does ChatGPT offer self-hosting for data control?",
      "answer": "No, ChatGPT is a hosted product; enterprise-grade data controls require a separate, custom-priced Enterprise agreement rather than a self-hosted deployment option."
    },
    {
      "question": "Does Open WebUI have voice mode or image generation like ChatGPT?",
      "answer": "The available facts don't document built-in voice mode or image generation in Open WebUI itself; those capabilities would depend on the specific models and plugins connected to it, whereas ChatGPT includes both natively."
    },
    {
      "question": "Can Open WebUI run completely offline?",
      "answer": "Yes, it's designed to operate entirely offline when paired with local models such as those served by Ollama, which isn't possible with ChatGPT since it requires a connection to OpenAI's hosted service."
    }
  ]
};

export default chatgptVsOpenWebuiContent;

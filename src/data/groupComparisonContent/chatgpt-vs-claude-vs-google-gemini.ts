import type { GroupComparisonContent } from './types';

const chatgptVsClaudeVsGoogleGeminiContent: GroupComparisonContent = {
  "verdict": "ChatGPT, Claude, and Google Gemini are the three leading general-purpose AI assistants, and each leans into a different strength rather than one clearly beating the others. ChatGPT leads on sheer scale, feature breadth, and consumer adoption with tools like Custom GPTs and Voice Mode; Claude differentiates on coding and agentic-task performance through Claude Code plus enterprise compliance options like HIPAA-ready configurations; and Gemini leads on context window size, up to one million tokens on higher tiers, and native integration across Google's own Workspace apps. The right pick depends on whether ecosystem integration, coding workflows, or general-purpose breadth matters most to the buyer.",
  "bestFor": {
    "chatgpt": "Users who want the most widely adopted, fastest-moving general-purpose assistant with strong image generation, Voice Mode, and Custom GPTs across a huge existing user base.",
    "claude": "Developers and teams who prioritize coding and agentic-task performance through Claude Code, along with enterprise compliance features like HIPAA-ready options and configurable data retention.",
    "google-gemini": "Users and teams already inside the Google ecosystem (Gmail, Docs, Sheets, Android) who want native multimodal generation and the largest documented context window for handling very large documents or codebases."
  },
  "highlights": [
    {
      "title": "Claude Code is Anthropic's agentic coding differentiator",
      "description": "Claude Code lets Claude read, edit, and run code across a codebase from a terminal or IDE, positioned as a core reason developers pick Claude's Pro plan and above.",
      "toolSlugs": [
        "claude"
      ]
    },
    {
      "title": "Gemini's context window and Workspace integration stand out",
      "description": "Google AI Pro and Ultra plans support context windows up to one million tokens, and Gemini is embedded directly into Gmail, Docs, Sheets, and Slides, an integration breadth neither ChatGPT nor Claude documents.",
      "toolSlugs": [
        "google-gemini"
      ]
    },
    {
      "title": "ChatGPT leads on adoption and consumer feature breadth",
      "description": "ChatGPT is described as the highest-traffic consumer AI assistant globally, with features like Voice Mode, Custom GPTs, Projects, and built-in image generation available across web, mobile, and desktop.",
      "toolSlugs": [
        "chatgpt"
      ]
    },
    {
      "title": "Top-tier pricing varies significantly",
      "description": "ChatGPT Pro costs $200/month, Claude Max starts at $100/month, and Google AI Ultra was reduced from $249.99/month to $99.99/month following Google's I/O 2026 announcements.",
      "toolSlugs": [
        "chatgpt",
        "claude",
        "google-gemini"
      ]
    },
    {
      "title": "All three offer a usable free tier",
      "description": "ChatGPT, Claude, and Gemini each provide a $0 plan with a capable default model and usage limits, letting individuals try the core assistant before subscribing.",
      "toolSlugs": [
        "chatgpt",
        "claude",
        "google-gemini"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Access and Platforms",
      "rows": [
        {
          "feature": "Free tier available",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "google-gemini": "available"
          }
        },
        {
          "feature": "Native iOS and Android apps",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "google-gemini": "available"
          }
        },
        {
          "feature": "Developer API",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "google-gemini": "available"
          }
        }
      ]
    },
    {
      "group": "Capabilities",
      "rows": [
        {
          "feature": "Dedicated agentic coding tool",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "google-gemini": "not-documented"
          },
          "note": "ChatGPT Plus includes coding-agent tools and Claude offers Claude Code; a comparable dedicated coding-agent product is not documented for Gemini."
        },
        {
          "feature": "Built-in image/video generation",
          "statuses": {
            "chatgpt": "available",
            "claude": "not-documented",
            "google-gemini": "available"
          }
        },
        {
          "feature": "Extended context window (up to ~1 million tokens)",
          "statuses": {
            "chatgpt": "not-documented",
            "claude": "not-documented",
            "google-gemini": "available"
          },
          "note": "Gemini's higher tiers document context windows up to one million tokens; comparable figures aren't documented for ChatGPT or Claude."
        },
        {
          "feature": "Persistent memory across sessions",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "google-gemini": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Enterprise and Pricing",
      "rows": [
        {
          "feature": "Enterprise-grade SSO/SCIM and compliance options",
          "statuses": {
            "chatgpt": "available",
            "claude": "available",
            "google-gemini": "not-documented"
          },
          "note": "ChatGPT Enterprise and Claude Enterprise both document SSO, SCIM, and compliance features; comparable named features are not documented for the consumer Gemini plans, though enterprise deployment exists through Vertex AI."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which has the largest context window?",
      "answer": "Google Gemini documents context windows up to one million tokens on its higher-tier plans, letting it ingest very large documents, codebases, or transcripts in a single prompt. Comparable context window sizes are not documented for ChatGPT or Claude."
    },
    {
      "question": "Which is best for coding tasks?",
      "answer": "Claude differentiates specifically on coding and agentic-task performance through Claude Code, its terminal- and IDE-based agentic coding tool. ChatGPT also offers coding-agent tools on its Plus plan and above. A dedicated coding-agent product is not documented for Gemini."
    },
    {
      "question": "Which is cheapest to get started with?",
      "answer": "All three offer a free plan with a capable default model and usage limits. For entry-level paid plans, ChatGPT Go costs about $8/month, Claude Pro costs $17/month billed annually, and Google AI Plus costs $9.99/month."
    },
    {
      "question": "Which integrates best with existing productivity tools?",
      "answer": "Google Gemini is embedded directly into Gmail, Docs, Sheets, and Slides, giving it the deepest documented integration with an existing productivity suite among the three."
    },
    {
      "question": "Do all three offer team or enterprise plans with SSO?",
      "answer": "ChatGPT and Claude both document Enterprise tiers with SSO, SCIM provisioning, and compliance features. Comparable named enterprise administration features are not documented for the consumer Gemini plans, though Google offers enterprise deployment through Vertex AI."
    },
    {
      "question": "Which has a dedicated voice mode for spoken conversation?",
      "answer": "ChatGPT explicitly documents a Voice Mode feature for natural spoken conversation. A comparable named voice-conversation feature is not documented for Claude or Gemini in the same way."
    }
  ]
};

export default chatgptVsClaudeVsGoogleGeminiContent;

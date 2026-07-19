import type { GroupComparisonContent } from './types';

const agentaVsArizePhoenixVsEvidentlyContent: GroupComparisonContent = {
  "verdict": "Agenta, Arize Phoenix, and Evidently all address the same core job, testing, tracing, and monitoring AI application quality before and after it ships, but they start from different angles. Agenta leans into a full LLMOps workflow with built-in prompt management and a no-code UI for non-engineers, Arize Phoenix leans into open, OpenTelemetry-native tracing with the broadest out-of-the-box framework auto-instrumentation, and Evidently leans into a code-first Python library with the deepest catalog of evaluation metrics spanning classic ML drift and modern LLM and RAG evaluation. None is a strict upgrade over the others, so the right choice depends on whether prompt collaboration, tracing depth, or metric breadth matters most to your team.",
  "bestFor": {
    "agenta": "Teams that want prompt management, evaluation, and observability bundled in one product, with a no-code UI so product managers and domain experts can edit and test prompts without engineering help.",
    "arize-phoenix": "Engineering teams that want vendor-neutral, OpenTelemetry-native tracing with the widest range of out-of-the-box framework and model-provider auto-instrumentation, including newer agent SDKs.",
    "evidently": "ML and MLOps teams that need a large, battle-tested library of statistical evaluation metrics, over 100 built in, covering both classic ML data drift and modern LLM and RAG evaluation inside existing Python pipelines."
  },
  "highlights": [
    {
      "title": "Prompt collaboration without code",
      "description": "Agenta is the only one of the three built around a collaboration UI that lets non-engineering domain experts and product managers edit and test prompts directly, rather than requiring code changes.",
      "toolSlugs": [
        "agenta"
      ]
    },
    {
      "title": "OpenTelemetry-native tracing depth",
      "description": "Arize Phoenix is built on OTLP and Arize's OpenInference standard, with out-of-the-box auto-instrumentation for a long list of frameworks and SDKs including LangChain, LlamaIndex, DSPy, CrewAI, LangGraph, and the Claude Agent SDK.",
      "toolSlugs": [
        "arize-phoenix"
      ]
    },
    {
      "title": "The largest evaluation metric library",
      "description": "Evidently ships more than 100 built-in metrics and statistical tests covering data drift, data quality, and LLM/RAG-specific checks like hallucination and relevance, distributed as a widely downloaded open-source Python library.",
      "toolSlugs": [
        "evidently"
      ]
    },
    {
      "title": "All three have a genuinely usable free tier",
      "description": "Agenta's Hobby plan, Phoenix's open-source core, and Evidently's open-source core are all free to start with no forced upgrade, though each gates advanced collaboration or scale features behind a paid or enterprise tier.",
      "toolSlugs": [
        "agenta",
        "arize-phoenix",
        "evidently"
      ]
    },
    {
      "title": "Enterprise pricing transparency varies",
      "description": "Agenta publishes concrete Pro ($49/month) and Business ($399/month) pricing, while both Phoenix's production-scale Arize AX tier and Evidently Cloud require a sales conversation for pricing.",
      "toolSlugs": [
        "agenta",
        "arize-phoenix",
        "evidently"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Evaluation and Observability",
      "rows": [
        {
          "feature": "Prompt management and versioning",
          "statuses": {
            "agenta": "available",
            "arize-phoenix": "unavailable",
            "evidently": "unavailable"
          },
          "note": "Agenta centralizes and version-controls prompts; Phoenix and Evidently focus on tracing and evaluation rather than prompt storage."
        },
        {
          "feature": "Distributed request tracing",
          "statuses": {
            "agenta": "available",
            "arize-phoenix": "available",
            "evidently": "limited"
          },
          "note": "Evidently offers dashboards to track model and prompt performance trends over time but is not built as a full distributed tracing system like Phoenix."
        },
        {
          "feature": "LLM-as-judge evaluation",
          "statuses": {
            "agenta": "available",
            "arize-phoenix": "available",
            "evidently": "available"
          }
        },
        {
          "feature": "Classic ML data drift and data quality checks",
          "statuses": {
            "agenta": "unavailable",
            "arize-phoenix": "not-documented",
            "evidently": "available"
          },
          "note": "Evidently's 100+ metrics explicitly cover classic ML drift and data quality; Agenta and Phoenix are focused on LLM application behavior."
        }
      ]
    },
    {
      "group": "Collaboration and Deployment",
      "rows": [
        {
          "feature": "No-code UI for non-engineers",
          "statuses": {
            "agenta": "available",
            "arize-phoenix": "unavailable",
            "evidently": "unavailable"
          },
          "note": "Phoenix and Evidently are code-first tools aimed at engineers working in notebooks or pipelines."
        },
        {
          "feature": "Native OpenTelemetry (OTLP) support",
          "statuses": {
            "agenta": "not-documented",
            "arize-phoenix": "available",
            "evidently": "not-documented"
          }
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "agenta": "available",
            "arize-phoenix": "available",
            "evidently": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free tier with no credit card required",
          "statuses": {
            "agenta": "available",
            "arize-phoenix": "available",
            "evidently": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Agenta, Arize Phoenix, and Evidently all require self-hosting?",
      "answer": "No. All three can be self-hosted, but each also offers a hosted option: Agenta has a cloud SaaS product plus a free Hobby plan, Arize Phoenix has a managed Arize AX cloud with free Phoenix Cloud instances to start, and Evidently's open-source library pairs with the hosted Evidently Cloud dashboard for teams that don't want to run their own infrastructure."
    },
    {
      "question": "Which of these three is best for a team without engineers who wants to edit prompts directly?",
      "answer": "Agenta is the clearest fit. It includes a no-code collaboration UI specifically so product managers and other domain experts can edit and test prompts without writing code, a capability that isn't part of Arize Phoenix or Evidently's core design."
    },
    {
      "question": "Is Evidently only for classic machine learning, or does it also cover LLM evaluation?",
      "answer": "Evidently covers both. Its 100+ built-in metrics started with classic ML data drift and data quality checks and have expanded to include LLM and RAG-specific evaluation criteria such as correctness, relevance, and hallucination detection."
    },
    {
      "question": "Which tool has the broadest tracing integrations out of the box?",
      "answer": "Arize Phoenix. It's built natively on OpenTelemetry and Arize's OpenInference standard, with auto-instrumentation already available for frameworks like LangChain, LlamaIndex, DSPy, CrewAI, LangGraph, and newer agent SDKs, without custom instrumentation work."
    },
    {
      "question": "Are any of these three genuinely usable in production for free?",
      "answer": "Yes, all three have production-capable free tiers. Agenta's Hobby plan supports 5,000 monthly traces and unlimited prompts, Arize Phoenix's open-source core has no forced usage cap when self-hosted, and Evidently's open-source library is fully featured under an Apache 2.0 license with no artificial limits."
    },
    {
      "question": "Can these three tools be used together instead of choosing just one?",
      "answer": "Some teams do combine them, for example using Agenta for prompt management and collaboration, Arize Phoenix for tracing, and Evidently for its broader statistical evaluation library, since their core strengths only partially overlap. Whether that's worth the added operational overhead depends on how much each team values consolidation versus best-of-breed tooling."
    }
  ]
};

export default agentaVsArizePhoenixVsEvidentlyContent;

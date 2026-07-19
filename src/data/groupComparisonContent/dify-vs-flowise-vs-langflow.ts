import type { GroupComparisonContent } from './types';

const difyVsFlowiseVsLangflowContent: GroupComparisonContent = {
  "verdict": "Dify, Flowise, and Langflow all let teams visually build LLM applications, RAG pipelines, and multi-agent workflows instead of writing orchestration code by hand, and all three offer a free, open-source, self-hostable core. Dify differentiates by bundling workflow building, RAG, and an agent framework into one integrated, model-agnostic stack. Flowise leans on breadth, with the largest catalog of LLM, embedding, and vector store integrations among the three. Langflow stands out for letting developers export any visual flow to raw Python code, easing the path from prototype to production, and now carries IBM's backing following its DataStax acquisition.",
  "bestFor": {
    "dify": "Teams that want an all-in-one, model-agnostic LLM app platform combining workflow building, retrieval-augmented generation, and agents without stitching together separate tools.",
    "flowise": "Developers who want the broadest catalog of LLM, embedding, and vector store integrations, plus human-in-the-loop multi-agent flows.",
    "langflow": "Developers who want to prototype visually and then export clean Python code, backed by a large community and IBM's long-term support."
  },
  "highlights": [
    {
      "title": "Langflow bridges prototyping and production code",
      "description": "Every visual flow in Langflow can be exported as raw Python code, letting developers move from a drag-and-drop prototype to hand-tuned production code without a rewrite.",
      "toolSlugs": [
        "langflow"
      ]
    },
    {
      "title": "Flowise offers the widest integration catalog",
      "description": "Flowise natively supports more than 100 LLM providers, embedding models, and vector databases, giving it the broadest out-of-the-box connectivity of the three.",
      "toolSlugs": [
        "flowise"
      ]
    },
    {
      "title": "Dify bundles the full LLM app stack",
      "description": "Dify combines a visual workflow builder, RAG pipeline, and agent framework in one product, reducing the need to stitch together separate tools for retrieval, orchestration, and agents.",
      "toolSlugs": [
        "dify"
      ]
    },
    {
      "title": "Corporate backing differs across the three",
      "description": "Dify remains an independent, venture-backed startup, Flowise's team was acquired by Workday, and Langflow now carries IBM's backing following the DataStax acquisition, which shapes how each project's long-term roadmap may evolve.",
      "toolSlugs": [
        "dify",
        "flowise",
        "langflow"
      ]
    },
    {
      "title": "All three are free to self-host",
      "description": "Dify, Flowise, and Langflow each publish an open-source core that teams can self-host at no license cost, though Dify's license carries some restrictions on multi-tenant SaaS resale that the others don't share.",
      "toolSlugs": [
        "dify",
        "flowise",
        "langflow"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Building Blocks",
      "rows": [
        {
          "feature": "Visual drag-and-drop flow builder",
          "statuses": {
            "dify": "available",
            "flowise": "available",
            "langflow": "available"
          }
        },
        {
          "feature": "Retrieval-augmented generation (RAG) pipeline",
          "statuses": {
            "dify": "available",
            "flowise": "available",
            "langflow": "available"
          }
        },
        {
          "feature": "Multi-agent orchestration",
          "statuses": {
            "dify": "available",
            "flowise": "available",
            "langflow": "available"
          }
        },
        {
          "feature": "Export visual flow to raw code",
          "statuses": {
            "dify": "not-documented",
            "flowise": "not-documented",
            "langflow": "available"
          },
          "note": "Langflow exports flows as raw Python code."
        }
      ]
    },
    {
      "group": "Deployment and Licensing",
      "rows": [
        {
          "feature": "Self-hosted open-source core",
          "statuses": {
            "dify": "available",
            "flowise": "available",
            "langflow": "available"
          }
        },
        {
          "feature": "Free hosted cloud tier",
          "statuses": {
            "dify": "available",
            "flowise": "available",
            "langflow": "available"
          }
        }
      ]
    },
    {
      "group": "Enterprise and Ecosystem",
      "rows": [
        {
          "feature": "Model Context Protocol (MCP) support",
          "statuses": {
            "dify": "not-documented",
            "flowise": "not-documented",
            "langflow": "available"
          }
        },
        {
          "feature": "Enterprise SSO and role-based access control",
          "statuses": {
            "dify": "available",
            "flowise": "available",
            "langflow": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is best for RAG-heavy applications?",
      "answer": "All three support retrieval-augmented generation, but they approach it differently: Dify automatically chunks, embeds, and indexes documents as part of its integrated stack; Flowise offers RAG-enabled Chatflows pulling from PDFs, spreadsheets, and websites; and Langflow treats RAG pipeline design as a core, prebuilt part of its component library."
    },
    {
      "question": "Can I export a visual flow to code I can maintain by hand?",
      "answer": "Yes, but only with Langflow, which lets you export any visual flow as raw Python code. Dify and Flowise don't document an equivalent code-export capability."
    },
    {
      "question": "Which has the largest integration library?",
      "answer": "Flowise, with native support for more than 100 LLM providers, embedding models, and vector databases, including OpenAI, Anthropic, Pinecone, Weaviate, and Chroma."
    },
    {
      "question": "Are these tools really free to self-host?",
      "answer": "Yes, all three publish an open-source core that can be self-hosted at no license cost: Dify under its own Dify Open Source License (with some multi-tenant SaaS resale restrictions), Flowise under Apache 2.0, and Langflow under MIT."
    },
    {
      "question": "Who backs the long-term development of each project?",
      "answer": "Dify is an independent, venture-backed startup founded in 2023. Flowise's team was acquired by Workday. Langflow has moved from Logspace to DataStax to IBM, and now carries IBM's resources following that acquisition."
    }
  ]
};

export default difyVsFlowiseVsLangflowContent;

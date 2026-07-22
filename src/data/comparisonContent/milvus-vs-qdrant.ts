import type { ToolComparisonContent } from './types';

const milvusVsQdrantContent: ToolComparisonContent = {
  "verdict": "Milvus and Qdrant are both open-source vector databases with large GitHub followings, but they emphasize different strengths and pricing paths. Milvus is built to scale to tens of billions of vectors with flexible Lite/Standalone/Distributed deployment modes but has no verified managed-cloud pricing in the available facts, while Qdrant is written in Rust with SIMD optimization, offers hybrid search combining BM25 and SPLADE++, and publishes a free-forever managed cloud tier. The right pick depends on whether massive self-hosted scale or a documented, free-forever managed cloud entry point matters more.",
  "bestForToolA": "Teams that need to self-host at very large scale (tens of billions of vectors), want flexible deployment modes from an embedded library up to a distributed enterprise cluster, and are already integrating with LangChain, LlamaIndex, OpenAI, or Hugging Face.",
  "bestForToolB": "Teams that want a documented free-forever cloud tier to start, need hybrid search combining dense and sparse vectors (BM25, SPLADE++), or want quantization to cut memory usage by up to 64x.",
  "whoNeedsBoth": "A team building a large-scale RAG pipeline might self-host Milvus for its billions-of-vectors capacity in a core data store while using Qdrant's free-forever cloud tier for a smaller, hybrid-search-driven feature like semantic search with keyword filtering, since the two emphasize different scale/search tradeoffs.",
  "keyDifferences": [
    {
      "title": "Managed cloud pricing transparency",
      "toolA": "Managed hosting (Zilliz Cloud) pricing could not be verified from the official pricing page during this research; no pricing plans are documented.",
      "toolB": "Publishes a free-forever tier (0.5 vCPU, 1GB RAM, 4GB disk) plus Standard (usage-based) and Premium (minimum spend) tiers.",
      "whyItMatters": "Documented managed pricing lets teams evaluate cost without needing a sales conversation.",
      "benefitsWho": "Teams wanting to estimate cloud costs upfront rather than self-hosting or negotiating."
    },
    {
      "title": "Search technology emphasis",
      "toolA": "Global Index technology powers high-speed similarity search across huge datasets, with metadata filtering and hybrid/multi-vector queries.",
      "toolB": "Hybrid search explicitly combines dense and sparse vectors using BM25 and SPLADE++, plus native multivector support for multimodal retrieval.",
      "whyItMatters": "Qdrant's facts name the specific sparse-retrieval algorithms (BM25, SPLADE++) it combines with dense vectors, giving more concrete insight into its hybrid search implementation.",
      "benefitsWho": "Teams building search that needs to blend keyword-style relevance with semantic similarity."
    },
    {
      "title": "Scale ceiling",
      "toolA": "Explicitly built to scale to tens of billions of vectors.",
      "toolB": "Uses quantization to reduce memory usage by up to 64x, which helps efficiency at scale but does not state a specific vector-count ceiling.",
      "whyItMatters": "Milvus's facts make an explicit massive-scale claim, while Qdrant's facts emphasize memory efficiency rather than a stated absolute scale ceiling.",
      "benefitsWho": "Teams with very large, high-growth vector datasets."
    },
    {
      "title": "Implementation language and performance profile",
      "toolA": "No implementation language is specified in the available facts.",
      "toolB": "Built in Rust with SIMD optimization for performance.",
      "whyItMatters": "Rust with SIMD optimization is a specific, documented performance characteristic that engineering teams may weigh when evaluating latency-sensitive workloads.",
      "benefitsWho": "Engineering teams optimizing for low-latency vector search."
    },
    {
      "title": "Deployment flexibility",
      "toolA": "Lite (embedded library), Standalone (single machine), or Distributed (enterprise cluster).",
      "toolB": "Cloud, Hybrid Cloud, Private Cloud, and Edge (Edge deployment is still in beta).",
      "whyItMatters": "Milvus's modes scale from embedded to distributed compute topology, while Qdrant's modes span cloud-hosting arrangements including an in-beta Edge option.",
      "benefitsWho": "Teams with specific infrastructure requirements, from embedded local search (Milvus Lite) to edge deployment (Qdrant Edge, beta)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Open-source / self-hostable",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Hybrid search (dense + sparse vectors)",
          "toolA": "available",
          "toolB": "available",
          "note": "Qdrant names BM25 and SPLADE++ specifically."
        },
        {
          "feature": "Metadata filtering",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Built-in web UI",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI framework integrations (LangChain, LlamaIndex, OpenAI, Hugging Face)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Quantization for memory reduction",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Qdrant states up to 64x memory reduction."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Documented managed cloud pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Milvus's Zilliz Cloud pricing could not be verified from the official pricing page."
        },
        {
          "feature": "Free-forever cloud tier",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO / private VPC links",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Qdrant reserves this for the Premium tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Milvus free?",
      "answer": "Yes, Milvus is open-source and free to self-host, though its managed Zilliz Cloud pricing could not be verified from the official pricing page."
    },
    {
      "question": "Does Qdrant have a free plan?",
      "answer": "Yes, a free-forever tier is available for testing and prototypes (0.5 vCPU, 1GB RAM, 4GB disk)."
    },
    {
      "question": "Is Qdrant open source?",
      "answer": "Yes, it can be self-hosted, with 30K+ GitHub stars, similar to Milvus's 45.2K+ GitHub stars."
    },
    {
      "question": "What deployment modes does Milvus support?",
      "answer": "Lite (embedded library), Standalone (single machine), and Distributed (enterprise-scale)."
    },
    {
      "question": "Does Qdrant support hybrid search?",
      "answer": "Yes, combining dense and sparse vectors including BM25 and SPLADE++."
    },
    {
      "question": "Does Milvus integrate with AI frameworks?",
      "answer": "Yes, including LangChain, LlamaIndex, OpenAI, and Hugging Face."
    }
  ]
};

export default milvusVsQdrantContent;

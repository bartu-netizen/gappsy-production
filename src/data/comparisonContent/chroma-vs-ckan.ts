import type { ToolComparisonContent } from './types';

const chromaVsCkanContent: ToolComparisonContent = {
  "verdict": "Chroma is an open-source vector, full-text, and metadata search database purpose-built for AI applications like RAG, available self-hosted or via the usage-based Chroma Cloud (Starter plan at $0/month plus usage, with $5 in free credits). CKAN is an open-source data management system for publishing and cataloging datasets as searchable, themeable open data portals, with a 20-year track record in government and enterprise deployments. Chroma stores and retrieves embeddings for AI applications; CKAN publishes and organizes structured datasets for public discovery — fundamentally different data models and audiences.",
  "bestForToolA": "AI application developers building RAG pipelines or semantic search features who need dense/sparse vector search, full-text search with regex, and metadata filtering, with named enterprise users including Capital One, UnitedHealthcare, Weights & Biases, and Mintlify per the vendor.",
  "bestForToolB": "Government agencies, researchers, and organizations that need to publish and catalog open datasets through a searchable, geospatial-aware, themeable public data portal — CKAN's cons note it is specifically aimed at data-portal/catalog use cases, not general-purpose database or BI needs, which also means it isn't built for vector/AI search.",
  "whoNeedsBoth": "An organization running a CKAN open data portal could use Chroma separately to power an AI-driven semantic search or chatbot feature over its published datasets' documentation — two independent systems serving different parts of a broader data-discoverability initiative.",
  "keyDifferences": [
    {
      "title": "Data Model",
      "toolA": "Chroma is built around vector embeddings, with dense vector search, sparse vector search (BM25/SPLADE), full-text search, and metadata filtering, all designed for AI application retrieval.",
      "toolB": "CKAN is built around structured datasets and files, with geospatial data, metadata, filestore, and federation features for cataloging.",
      "whyItMatters": "The underlying data model determines what each tool is actually good at storing and retrieving.",
      "benefitsWho": "AI developers need Chroma's embedding-native model; data publishers need CKAN's dataset-native model."
    },
    {
      "title": "Pricing",
      "toolA": "Chroma's core database is free/open source (Apache 2.0) to self-host; Chroma Cloud adds a $0/month plus usage Starter plan with $5 in free credits, a $250/month Team plan with $100 in credits, and custom Enterprise pricing.",
      "toolB": "CKAN is Free / Open Source with no pricing tiers or managed cloud service documented.",
      "whyItMatters": "Chroma has a documented path to a managed, usage-billed cloud service, while CKAN's cost structure stays purely self-hosted/open-source.",
      "benefitsWho": "Teams wanting a managed, scalable AI database with a cloud option benefit from Chroma; teams comfortable fully self-hosting an open-data portal benefit from CKAN."
    },
    {
      "title": "AI/ML Use Case Fit",
      "toolA": "Chroma is explicitly designed for AI applications, with automatic data tiering across memory, SSD, and cloud object storage to control cost as vector data scales.",
      "toolB": "CKAN has no documented AI or vector search capability.",
      "whyItMatters": "Chroma is purpose-built for the retrieval layer of AI applications in a way CKAN simply doesn't address.",
      "benefitsWho": "Teams building AI/RAG features need Chroma specifically; CKAN offers nothing comparable."
    },
    {
      "title": "Community Scale",
      "toolA": "Chroma reports over 26,000 GitHub stars, 11+ million monthly downloads, and 10,000+ Discord members per the vendor's site.",
      "toolB": "CKAN's community scale isn't quantified in available facts, though it has a documented 20-year track record.",
      "whyItMatters": "Community size can indicate ecosystem support, plugin availability, and long-term maintenance likelihood.",
      "benefitsWho": "Teams wanting an actively growing, heavily adopted AI-infrastructure project may weigh Chroma's documented download and star numbers."
    },
    {
      "title": "Deployment Flexibility",
      "toolA": "Chroma supports self-hosting via open-source deployment guides, plus an Enterprise BYOC (bring-your-own-cloud) option for deployment inside a customer's own VPC.",
      "toolB": "CKAN's deployment is documented only as open source/self-hosted, without a BYOC or managed-cloud equivalent noted.",
      "whyItMatters": "Chroma documents a broader range of deployment options spanning self-hosted, managed cloud, and BYOC.",
      "benefitsWho": "Enterprises needing to keep vector data inside their own cloud environment benefit specifically from Chroma's documented BYOC option."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Vector/embedding search for AI",
          "toolA": "available",
          "toolB": "unavailable",
          "note": null
        },
        {
          "feature": "Open data portal / dataset cataloging",
          "toolA": "unavailable",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Full-text search",
          "toolA": "available",
          "toolB": "available",
          "note": "Chroma includes regex support; CKAN's own Search feature"
        },
        {
          "feature": "Metadata filtering/management",
          "toolA": "available",
          "toolB": "available",
          "note": null
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free/open-source core",
          "toolA": "available",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Managed cloud service",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Chroma Cloud Starter $0 + usage"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Chroma Enterprise, custom with BYOC option"
        }
      ]
    },
    {
      "group": "Deployment & Ecosystem",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Bring-your-own-cloud (BYOC)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        },
        {
          "feature": "Documented named enterprise customers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Capital One, UnitedHealthcare, Weights & Biases, Mintlify"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Chroma be used to build search for a CKAN-style data portal?",
      "answer": "The facts don't document a direct integration, but conceptually Chroma could power AI-driven semantic search over documents or metadata separately from CKAN's own dataset cataloging."
    },
    {
      "question": "Is Chroma free like CKAN?",
      "answer": "The core Chroma database is open source under Apache 2.0 and free to self-host, similar to CKAN's Free / Open Source model. Chroma additionally offers a paid, usage-based Chroma Cloud service, which CKAN does not document an equivalent for."
    },
    {
      "question": "Does CKAN support vector search?",
      "answer": "No, CKAN's documented features are focused on dataset cataloging, geospatial data, and metadata — vector search is not part of its feature set. Chroma is purpose-built for vector search."
    },
    {
      "question": "Which tool has larger enterprise adoption evidence?",
      "answer": "Chroma names specific enterprise customers (Capital One, UnitedHealthcare, Weights & Biases, Mintlify) per the vendor. CKAN's pros cite a 20-year track record and public real-world open data portal deployments, but without naming specific customers in available facts."
    },
    {
      "question": "What's Chroma Cloud's pricing?",
      "answer": "Chroma Cloud has a Starter plan ($0/month plus usage, with $5 in free credits), a Team plan ($250/month with $100 in credits), and custom Enterprise pricing with BYOC options."
    },
    {
      "question": "Is CKAN a general-purpose database alternative to something like Chroma?",
      "answer": "No — CKAN's own documented cons state it's aimed at data-portal/catalog use cases specifically, not general-purpose database or BI functionality, and it has no vector search capability documented."
    }
  ]
};

export default chromaVsCkanContent;

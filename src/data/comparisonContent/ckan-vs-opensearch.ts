import type { ToolComparisonContent } from './types';

const ckanVsOpensearchContent: ToolComparisonContent = {
  "verdict": "CKAN is an open-source data management system for publishing, cataloging, and sharing datasets as open data portals. OpenSearch is an Apache 2.0-licensed search, analytics, and observability suite governed by the Linux Foundation, covering full-text search, dashboards, data ingestion (Data Prepper), vector search for AI/ML, and security analytics. CKAN focuses on dataset publishing and discovery for open-data use cases, while OpenSearch focuses on indexing, searching, and analyzing data (including vectors) at scale — different jobs that can also work together, since CKAN includes its own \"Search\" feature that could plausibly be backed by an engine like OpenSearch.",
  "bestForToolA": "Government agencies and organizations that need to publish and catalog open datasets in a themeable, searchable public portal with geospatial and metadata support, and a 20-year track record in that specific niche.",
  "bestForToolB": "Engineering and data teams that need full-text search, log/observability analytics, or vector search for AI/ML applications, wanting an Apache 2.0-licensed, Linux Foundation-governed alternative that covers search, dashboards (OpenSearch Dashboards), and security analytics under one project.",
  "whoNeedsBoth": "A government open-data portal built on CKAN could use OpenSearch as the underlying search/indexing engine to power CKAN's dataset search functionality at scale — a realistic technical pairing rather than a redundant choice.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "CKAN is a data management system (DMS) for open data portals and cataloging.",
      "toolB": "OpenSearch is a search, analytics, and observability suite covering full-text search, dashboards, data ingestion, and security analytics.",
      "whyItMatters": "CKAN's documented cons explicitly state it's not a general-purpose database or BI tool, and it is even further from being a search/observability engine, which is OpenSearch's core purpose.",
      "benefitsWho": "Teams need to be clear on whether they're solving dataset cataloging (CKAN) or large-scale search and analytics (OpenSearch)."
    },
    {
      "title": "AI/Vector Search Capability",
      "toolA": "CKAN's documented features do not include vector search.",
      "toolB": "OpenSearch includes a dedicated vector engine supporting vector search and anomaly detection for AI and ML applications.",
      "whyItMatters": "Teams building AI-powered search or RAG features need vector search capability, which only OpenSearch documents.",
      "benefitsWho": "AI/ML application developers specifically need OpenSearch's vector engine."
    },
    {
      "title": "Governance",
      "toolA": "CKAN's governance model is not detailed beyond being open source.",
      "toolB": "OpenSearch is governed by the OpenSearch Software Foundation under the Linux Foundation, established in September 2024.",
      "whyItMatters": "Formal foundation governance signals long-term vendor neutrality and project sustainability.",
      "benefitsWho": "Enterprises with procurement requirements around open-governance software specifically favor OpenSearch's documented Linux Foundation backing."
    },
    {
      "title": "Observability Scope",
      "toolA": "CKAN has no documented observability or security analytics features.",
      "toolB": "OpenSearch includes security analytics for threat intelligence and event correlation, plus OpenSearch Dashboards for visualization and OpenSearch Data Prepper for data transformation and enrichment.",
      "whyItMatters": "OpenSearch covers a much broader scope beyond search alone, extending into security and observability.",
      "benefitsWho": "Security and infrastructure teams needing threat intelligence and event correlation benefit specifically from OpenSearch."
    },
    {
      "title": "Deployment Complexity & Pricing Transparency",
      "toolA": "CKAN is Free / Open Source with no documented managed-service option.",
      "toolB": "OpenSearch is also free (Apache 2.0), but its documented cons note that no pricing or managed-service details are provided directly by the project, and running it at scale requires operational expertise or a third-party managed service, with multiple components (Core, Dashboards, Data Prepper, Vector Engine) adding deployment complexity.",
      "whyItMatters": "Both are free to license, but OpenSearch's multi-component architecture is documented as more operationally complex at scale.",
      "benefitsWho": "Teams with in-house operational expertise (or budget for a third-party managed OpenSearch service) can handle its added complexity; smaller teams needing a single-purpose data portal may find CKAN simpler to operate."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Data cataloging / open data portal",
          "toolA": "available",
          "toolB": "unavailable",
          "note": null
        },
        {
          "feature": "Full-text search engine",
          "toolA": "available",
          "toolB": "available",
          "note": "CKAN's own Search feature vs. OpenSearch built on Apache Lucene"
        },
        {
          "feature": "Vector search for AI/ML",
          "toolA": "unavailable",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Security analytics / threat intelligence",
          "toolA": "unavailable",
          "toolB": "available",
          "note": null
        }
      ]
    },
    {
      "group": "Licensing & Governance",
      "rows": [
        {
          "feature": "Free / open source",
          "toolA": "available",
          "toolB": "available",
          "note": "OpenSearch is Apache 2.0"
        },
        {
          "feature": "Foundation governance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linux Foundation via OpenSearch Software Foundation"
        },
        {
          "feature": "Published managed-service pricing",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "no managed-service pricing from the project itself"
        }
      ]
    },
    {
      "group": "Platform Components",
      "rows": [
        {
          "feature": "Data visualization/dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": "CKAN Visualization feature vs. OpenSearch Dashboards"
        },
        {
          "feature": "Data ingestion/transformation tooling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "OpenSearch Data Prepper"
        },
        {
          "feature": "Geospatial data support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Could OpenSearch power the search functionality inside a CKAN data portal?",
      "answer": "The facts don't document a direct CKAN-OpenSearch integration, but architecturally this is a plausible pairing — CKAN handles dataset cataloging and publishing, while OpenSearch could serve as an underlying search/indexing engine."
    },
    {
      "question": "Does CKAN support vector or AI-powered search?",
      "answer": "No — CKAN's documented features focus on cataloging, geospatial data, metadata, and traditional search, with no vector search capability. OpenSearch includes a dedicated vector engine for AI/ML use cases."
    },
    {
      "question": "Are both tools free?",
      "answer": "Yes, CKAN is Free / Open Source, and OpenSearch is free under the Apache 2.0 license. However, OpenSearch's documented cons note that running it at scale typically requires operational expertise or a third-party managed service, since the project itself doesn't publish managed-service pricing."
    },
    {
      "question": "Which tool is better for government open-data publishing?",
      "answer": "CKAN, which has a 20-year track record and is explicitly positioned for government and enterprise open data deployments. OpenSearch has no documented open-data-portal positioning."
    },
    {
      "question": "Which tool handles security analytics?",
      "answer": "OpenSearch, which documents security analytics features for threat intelligence and event correlation. CKAN has no documented security analytics capability."
    },
    {
      "question": "How are the two governed?",
      "answer": "OpenSearch is governed by the OpenSearch Software Foundation under the Linux Foundation (established September 2024). CKAN's governance structure is not detailed beyond being open source."
    }
  ]
};

export default ckanVsOpensearchContent;

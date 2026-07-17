import type { ToolComparisonContent } from './types';

const ckanVsMariadbContent: ToolComparisonContent = {
  "verdict": "CKAN is an open-source data management system (DMS) purpose-built for publishing, sharing, and cataloging datasets as open data portals, with a 20-year track record in government and enterprise deployments. MariaDB is a general-purpose, free, open-source relational database created as a drop-in MySQL replacement. CKAN itself is not a general-purpose database or BI tool per its own documented cons — in fact, CKAN commonly runs on top of a relational database like MariaDB/MySQL or PostgreSQL under the hood, making the two more complementary than competing.",
  "bestForToolA": "Government agencies, research institutions, and organizations that need to publish, catalog, and share open datasets publicly through a themeable, searchable data portal with geospatial and metadata support.",
  "bestForToolB": "Developers and teams that need a general-purpose relational database for application data storage, with MySQL compatibility, high-availability clustering (Galera Cluster 4), and support for JSON, BLOB, TEXT, and GEOMETRY data types.",
  "whoNeedsBoth": "A government open-data initiative would typically run CKAN as its public-facing data portal application while using MariaDB (or a similar relational database) as CKAN's underlying data store — a realistic and common architecture rather than an either/or choice.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "CKAN is a data management system (DMS) specifically for open data portals and data catalogs, with geospatial, metadata, and visualization features.",
      "toolB": "MariaDB is a general-purpose relational database engine used to store and query application data.",
      "whyItMatters": "CKAN's own documented cons state it is \"aimed at data-portal/catalog use cases specifically — not a general-purpose database or BI tool,\" clarifying it is not a MariaDB substitute.",
      "benefitsWho": "Buyers evaluating which database to use need MariaDB; buyers evaluating how to publish open data to the public need CKAN."
    },
    {
      "title": "Licensing & Pricing",
      "toolA": "CKAN is Free / Open Source with no pricing tiers documented.",
      "toolB": "MariaDB Server is also Free (open source), with a separate custom-priced Enterprise Server available via MariaDB Corporation.",
      "whyItMatters": "Both are free at the core, but MariaDB has a documented enterprise upgrade path that CKAN does not detail.",
      "benefitsWho": "Organizations wanting optional commercial support and hardened builds have that documented path with MariaDB."
    },
    {
      "title": "Track Record",
      "toolA": "CKAN has a 20-year track record as a widely deployed open-source data management platform, per its documented pros.",
      "toolB": "MariaDB was founded in 2009 and is used in production by Wikipedia, WordPress.com, and Google.",
      "whyItMatters": "Both have long, proven histories, but in different domains: data cataloging versus core database infrastructure.",
      "benefitsWho": "Risk-averse public-sector buyers can point to either tool's maturity depending on which layer of their stack they're evaluating."
    },
    {
      "title": "Core Capabilities",
      "toolA": "CKAN's documented features include geospatial support, metadata management, federation, filestore, search, and themeable portals.",
      "toolB": "MariaDB's documented features include Galera Cluster 4 for high availability, Oracle Database compatibility, temporal (system-versioned) tables, and online schema changes.",
      "whyItMatters": "The feature sets don't overlap: CKAN is about presenting and organizing datasets publicly, MariaDB is about storing and querying structured data reliably.",
      "benefitsWho": "Teams building a public data catalog need CKAN's cataloging features; teams building applications need MariaDB's database engine features."
    },
    {
      "title": "Target Use Case",
      "toolA": "CKAN's documented positioning explicitly targets \"government and enterprise deployments\" for open data.",
      "toolB": "MariaDB has no specific vertical positioning documented — it's a general-purpose database used across industries.",
      "whyItMatters": "CKAN's government/open-data focus is a narrower niche than MariaDB's broad applicability.",
      "benefitsWho": "Public-sector organizations building open data initiatives benefit from CKAN's purpose-built focus."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Open data portal / catalog",
          "toolA": "available",
          "toolB": "unavailable",
          "note": null
        },
        {
          "feature": "General-purpose relational database engine",
          "toolA": "unavailable",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Geospatial data support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        },
        {
          "feature": "Search across published datasets",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free / open source core",
          "toolA": "available",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Documented commercial/enterprise tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "MariaDB Corporation Enterprise Server, custom pricing"
        },
        {
          "feature": "Published SaaS/managed pricing tiers",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Neither publishes a tiered SaaS price list"
        }
      ]
    },
    {
      "group": "Technical Architecture",
      "rows": [
        {
          "feature": "High-availability clustering",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Galera Cluster 4"
        },
        {
          "feature": "Metadata management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        },
        {
          "feature": "Rich data types (JSON, BLOB, GEOMETRY)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Filestore for datasets/files",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is CKAN a replacement for a database like MariaDB?",
      "answer": "No. CKAN's own documented cons state it's \"aimed at data-portal/catalog use cases specifically — not a general-purpose database or BI tool.\" CKAN typically runs on top of a relational database for its own storage needs."
    },
    {
      "question": "Are both CKAN and MariaDB free?",
      "answer": "Yes, both are Free / Open Source at their core. MariaDB additionally offers a custom-priced Enterprise Server through MariaDB Corporation for organizations wanting commercial support."
    },
    {
      "question": "Which is better for publishing open government data?",
      "answer": "CKAN is purpose-built for this — it's positioned specifically for government and enterprise open data deployments with geospatial, metadata, and portal theming features. MariaDB is a general-purpose database with no specific open-data portal features documented."
    },
    {
      "question": "How long have these tools been around?",
      "answer": "CKAN has a documented 20-year track record as a widely deployed open-source data management platform. MariaDB was created in 2009."
    },
    {
      "question": "Does MariaDB have features for geospatial or metadata-heavy data catalogs?",
      "answer": "MariaDB's documented features (Galera Cluster, Oracle compatibility, temporal tables, rich data types) don't include the geospatial, metadata, or cataloging features that CKAN offers specifically for data portals."
    },
    {
      "question": "Would an organization typically choose one or the other, or use both?",
      "answer": "In practice these are complementary rather than competing — CKAN is commonly deployed with an underlying relational database, such as MariaDB, powering its data storage layer."
    }
  ]
};

export default ckanVsMariadbContent;

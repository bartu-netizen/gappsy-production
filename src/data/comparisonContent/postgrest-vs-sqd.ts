import type { ToolComparisonContent } from './types';

const postgrestVsSqdContent: ToolComparisonContent = {
  "verdict": "PostgREST is a free, open-source, MIT-licensed standalone web server that turns any PostgreSQL database directly into a RESTful API; SQD is a blockchain data provider offering real-time and historical data across 225+ networks through a free public API or paid enterprise data portals. PostgREST is infrastructure you run against your own database, while SQD is a managed data source for blockchain information -- different layers of a data stack that could plausibly be combined.",
  "bestForToolA": "PostgREST fits teams that already have, or plan to run, a PostgreSQL database and want an auto-generated, schema-driven REST API without hand-writing backend code, with authorization delegated to database roles.",
  "bestForToolB": "SQD fits teams and applications that specifically need blockchain data -- real-time or historical -- across a large number of networks (225+), from the free public API up to dedicated enterprise data portals.",
  "whoNeedsBoth": "A team building a blockchain analytics application could ingest data from SQD's API into their own PostgreSQL database, then expose that indexed data to their frontend or partners through a PostgREST-generated REST API.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "PostgREST auto-generates a REST API directly from an existing PostgreSQL database's schema and permissions, with no custom coding required.",
      "toolB": "SQD provides blockchain data itself, spanning more than 225 networks.",
      "whyItMatters": "PostgREST is a data-serving layer for data you already have, while SQD is itself a source of blockchain data.",
      "benefitsWho": "Backend teams with an existing Postgres database benefit from PostgREST; teams needing blockchain data specifically benefit from SQD."
    },
    {
      "title": "Pricing",
      "toolA": "PostgREST is free under the MIT license with no paid tier.",
      "toolB": "SQD offers a free public API and paid dedicated enterprise data portals for larger deployments.",
      "whyItMatters": "PostgREST has zero cost at any scale, while SQD's enterprise tier introduces cost as usage grows.",
      "benefitsWho": "Cost-conscious teams running their own Postgres infrastructure benefit from PostgREST; enterprises needing dedicated blockchain data SLAs need SQD."
    },
    {
      "title": "Deployment Model",
      "toolA": "PostgREST is self-run software with no official managed or hosted version -- it must be deployed, for example via its Docker image, against your own database.",
      "toolB": "SQD is delivered as a hosted API/data service, not something you self-host.",
      "whyItMatters": "PostgREST requires the buyer to operate their own server and database, whereas SQD's value is its managed network coverage.",
      "benefitsWho": "Engineering teams comfortable self-hosting infrastructure use PostgREST; teams wanting a ready-made data feed use SQD."
    },
    {
      "title": "Data Domain",
      "toolA": "PostgREST is domain-agnostic -- it can expose any PostgreSQL database as an API, regardless of what data it contains.",
      "toolB": "SQD is purpose-built for blockchain data specifically, across 225+ networks.",
      "whyItMatters": "PostgREST is general-purpose infrastructure, while SQD is a vertical-specific data product; buyers need the right one for their actual data need.",
      "benefitsWho": "General backend and API teams benefit from PostgREST; Web3 and blockchain application teams benefit from SQD."
    },
    {
      "title": "Production Track Record",
      "toolA": "PostgREST documents production use by Supabase, Catarse, and Image-charts, has 27.5k+ GitHub stars, and is backed by sponsors including Supabase, Neon, and Cybertec.",
      "toolB": "Not documented -- no named production users, GitHub metrics, or company details are provided for SQD.",
      "whyItMatters": "Visible production usage and community backing help de-risk adoption; this evidence is documented for PostgREST but not available for SQD in this data.",
      "benefitsWho": "Buyers wanting proof of production-grade adoption before committing engineering time."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Auto-generated REST API from a database",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Blockchain data (real-time/historical)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "OpenAPI documentation",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Access & Cost",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "PostgREST fully free MIT license; SQD free public API"
        },
        {
          "feature": "Enterprise/paid option",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SQD dedicated data portals"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "PostgREST Docker image"
        }
      ]
    },
    {
      "group": "Data Scope & Coverage",
      "rows": [
        {
          "feature": "Multi-network coverage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SQD covers 225+ networks; PostgREST works with any single Postgres DB"
        },
        {
          "feature": "Schema-based API versioning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Database-delegated authorization",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do PostgREST and SQD do the same thing?",
      "answer": "No -- PostgREST turns your own PostgreSQL database into a REST API, while SQD provides blockchain data itself across 225+ networks; PostgREST is infrastructure you run, SQD is a data source you consume."
    },
    {
      "question": "Is PostgREST free?",
      "answer": "Yes, it's MIT licensed and completely free with no paid tier, unlike SQD which pairs a free public API with paid dedicated enterprise data portals."
    },
    {
      "question": "Does PostgREST offer a managed/hosted version?",
      "answer": "No, per its documented cons, there's no official managed or hosted version -- it's self-run software, unlike SQD's hosted API/portal model."
    },
    {
      "question": "Who uses PostgREST in production?",
      "answer": "The documentation lists Supabase, Catarse, and Image-charts as production users; no comparable named users are documented for SQD."
    },
    {
      "question": "Could PostgREST expose blockchain data indexed from SQD?",
      "answer": "Yes -- a team could ingest SQD's blockchain data into a PostgreSQL database and then use PostgREST to auto-generate a REST API on top of it."
    }
  ]
};

export default postgrestVsSqdContent;

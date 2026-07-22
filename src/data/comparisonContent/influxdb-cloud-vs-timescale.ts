import type { ToolComparisonContent } from './types';

const influxdbCloudVsTimescaleContent: ToolComparisonContent = {
  "verdict": "InfluxDB Cloud and Timescale both handle time-series workloads but from different foundations — InfluxDB Cloud is a purpose-built time-series engine with Parquet-based storage and a 400+-plugin Telegraf ecosystem for data collection, while Timescale is a PostgreSQL extension (recently rebranded to Tiger Data / Tiger Cloud) offering full SQL compatibility and 200+ time-series-specific SQL functions. Neither publishes a simple flat entry price for its top-tier managed offering: InfluxDB Cloud Serverless is metered across multiple usage dimensions, while Timescale's Tiger Cloud publishes a $30/month Performance plan starting price but bills hourly on consumption.",
  "bestForToolA": "Teams that need very high-throughput ingest of millions of points per second from external sensors or devices, want to use the Telegraf ecosystem (400+ plugins) for data collection, or want a choice between open-source Core, self-managed Enterprise, or fully managed Cloud deployments.",
  "bestForToolB": "Teams already using PostgreSQL who want to keep standard SQL, drivers, and tooling while adding time-series-specific functions, automatic compression, and tiered hot/cold storage, with a published Performance plan starting at $30/month.",
  "whoNeedsBoth": "A platform ingesting both raw sensor telemetry, well suited to InfluxDB's high-speed ingest and Telegraf plugins, and needing to run standard SQL analytics and joins against that data alongside other PostgreSQL-resident application data might use InfluxDB Cloud for ingest and Timescale for the Postgres-integrated analytical layer.",
  "keyDifferences": [
    {
      "title": "SQL/PostgreSQL compatibility",
      "toolA": "Not documented as PostgreSQL-based; uses its own query approach with Parquet-based file storage.",
      "toolB": "Full PostgreSQL compatibility via SQL, standard drivers, and the Postgres ecosystem.",
      "whyItMatters": "Determines whether existing Postgres tooling, ORMs, and drivers work unmodified.",
      "benefitsWho": "Teams standardized on PostgreSQL wanting to avoid a separate query language and ecosystem."
    },
    {
      "title": "Data collection ecosystem",
      "toolA": "400+ Telegraf plugins available for collecting data from external sources.",
      "toolB": "Ingests from Kafka/S3 and replicates into Iceberg for lakehouse architectures, but no equivalent plugin-collector ecosystem is documented.",
      "whyItMatters": "Affects how easily raw data from diverse sources, such as sensors, apps, or logs, can be piped in without custom integration work.",
      "benefitsWho": "IoT and infrastructure-monitoring teams collecting from many heterogeneous sources."
    },
    {
      "title": "Published pricing entry point",
      "toolA": "No flat starting price documented — Cloud Serverless is billed across multiple metered dimensions (data in, queries, storage, data out).",
      "toolB": "Tiger Cloud Performance plan starts at a published $30/month.",
      "whyItMatters": "A published flat starting price is easier to budget against than a purely metered model.",
      "benefitsWho": "Teams wanting cost predictability before committing."
    },
    {
      "title": "Branding stability",
      "toolA": "No rebrand noted in the facts.",
      "toolB": "The company and cloud product recently rebranded from Timescale to Tiger Data / Tiger Cloud, which its own cons note can cause naming confusion.",
      "whyItMatters": "Recent rebrands can create confusion when searching for documentation, support, or billing history under the old name.",
      "benefitsWho": "Existing customers and new evaluators searching for current product names and documentation."
    },
    {
      "title": "Headquarters transparency",
      "toolA": "Headquartered in San Francisco, California, US.",
      "toolB": "Headquarters not documented.",
      "whyItMatters": "Documented company location matters for some vendor-risk and procurement processes.",
      "benefitsWho": "Enterprise security and procurement reviewers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Time-Series Capabilities",
      "rows": [
        {
          "feature": "High-speed ingest",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "InfluxDB documents millions of points/sec; no equivalent figure documented for Timescale"
        },
        {
          "feature": "Time-series-specific SQL functions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Timescale documents 200+ functions"
        },
        {
          "feature": "Compression/downsampling",
          "toolA": "available",
          "toolB": "available",
          "note": "InfluxDB: Parquet-based; Timescale: row-columnar hybrid plus tiered storage"
        },
        {
          "feature": "Vector/hybrid search",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Ecosystem & Compatibility",
      "rows": [
        {
          "feature": "PostgreSQL compatibility",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Telegraf/plugin data collection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Client libraries",
          "toolA": "available",
          "toolB": "available",
          "note": "InfluxDB: Python, JavaScript, Go, C#, Java; Timescale: standard PostgreSQL drivers"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free/open-source self-hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "InfluxDB 3 Core; open-source TimescaleDB extension"
        },
        {
          "feature": "Published managed starting price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Timescale's Tiger Cloud Performance plan is $30/month"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a free version of InfluxDB?",
      "answer": "Yes, InfluxDB 3 Core is open source and free to self-host."
    },
    {
      "question": "Is TimescaleDB open source?",
      "answer": "Yes, the TimescaleDB PostgreSQL extension is available as an open-source offering that can be self-hosted."
    },
    {
      "question": "Did Timescale change its name?",
      "answer": "The open-source TimescaleDB extension is still available, but the company and its managed cloud service now operate under the Tiger Data / Tiger Cloud brand."
    },
    {
      "question": "What does InfluxDB Cloud pricing look like?",
      "answer": "Cloud Serverless is billed on a usage basis: $0.0025/MB written, $0.012/100 queries, $0.002/GB-hour storage, and $0.09/GB data out, with $250 in free credit to start."
    },
    {
      "question": "What does Tiger Cloud pricing look like?",
      "answer": "Tiger Cloud uses hourly consumption-based billing, with published Performance and Scale plans starting at $30/month and $36/month respectively, plus a custom-priced Enterprise tier."
    },
    {
      "question": "What client libraries does InfluxDB support?",
      "answer": "Python, JavaScript, Go, C#, and Java are listed as supported client libraries."
    }
  ]
};

export default influxdbCloudVsTimescaleContent;

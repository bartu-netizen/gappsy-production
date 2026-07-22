import type { ToolComparisonContent } from './types';

const minioVsWetransferContent: ToolComparisonContent = {
  "verdict": "MinIO is a self-hosted, S3-compatible object storage system (now shipped as MinIO AIStor) built for developers who need programmatic, scalable storage infrastructure integrated with S3 tooling, data lakehouse formats, and AI frameworks; WeTransfer is a consumer and prosumer file-sharing service for one-off large file transfers to recipients who don't need an account. MinIO is infrastructure you run yourself; WeTransfer is a hosted service you use to send files.",
  "bestForToolA": "Developers and platform teams needing self-hostable, S3-API-compatible object storage across edge, on-premises, or cloud environments, starting with a free single-node tier for development and small deployments and scaling to Enterprise multi-node architecture for larger data and AI workloads.",
  "bestForToolB": "Individuals or small teams sending large files to people who shouldn't need an account, wanting native iOS, Android, and Mac apps and a free tier covering occasional transfers of up to 10 transfers or 3GB every 30 days.",
  "whoNeedsBoth": "A creative agency could store finished project assets long-term in a self-hosted MinIO bucket while using WeTransfer for the actual one-off delivery of large final files to a client who won't create an account, since WeTransfer's own listed limitations note it isn't suited to long-term storage or archiving.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Persistent, S3-compatible object storage infrastructure.",
      "toolB": "Ephemeral, link-based file transfer and sharing to recipients without accounts.",
      "whyItMatters": "One is storage infrastructure and the other is a delivery mechanism, so they aren't really substitutes for each other.",
      "benefitsWho": "Developers building storage backends (MinIO) versus anyone needing to send a file to someone quickly (WeTransfer)."
    },
    {
      "title": "Deployment Model",
      "toolA": "Self-hosted; you run it on your own infrastructure across edge, on-premises, or cloud environments.",
      "toolB": "Fully hosted SaaS with no self-hosting option documented.",
      "whyItMatters": "Self-hosting gives full control over data location and cost at scale but requires ops effort; hosted SaaS requires none.",
      "benefitsWho": "Engineering teams with infrastructure resources (MinIO) versus non-technical users wanting zero setup (WeTransfer)."
    },
    {
      "title": "Pricing",
      "toolA": "Free tier is a full-featured single-node deployment; Enterprise Lite (under 400 TiB) and Enterprise (24/7/365 support, sub-4-hour response SLA) are both custom-priced and require contacting sales.",
      "toolB": "Free at $0 (10 transfers or 3GB per 30 days), Starter at $6.99/month (300GB per 30 days), Ultimate at $25/month (1TB per transfer plus cloud storage), and custom Teams.",
      "whyItMatters": "WeTransfer has transparent, published consumer pricing, while MinIO's paid multi-node tiers require a sales conversation.",
      "benefitsWho": "Individuals wanting self-serve pricing (WeTransfer) versus enterprises negotiating custom storage contracts (MinIO)."
    },
    {
      "title": "API & Automation",
      "toolA": "Exposes a native S3-compatible API so existing S3 SDKs and tooling work against it directly.",
      "toolB": "Its public developer API has been retired, per WeTransfer's own listed limitations, restricting automation and custom integrations.",
      "whyItMatters": "Matters for teams that want to programmatically upload or manage files rather than use a web or app interface.",
      "benefitsWho": "Developers automating storage workflows (MinIO); WeTransfer users are now limited to manual or app-based transfers."
    },
    {
      "title": "Data Longevity",
      "toolA": "Designed for persistent storage with data protection features including encryption, versioning, immutability, replication, and lifecycle management.",
      "toolB": "Files and links expire by design (free plan links last a few days; paid plans allow longer custom expiration), explicitly not suited to long-term storage or archiving.",
      "whyItMatters": "Determines whether a tool can be trusted to keep files available indefinitely.",
      "benefitsWho": "Teams needing durable archival storage (MinIO) versus those doing quick, time-limited handoffs (WeTransfer)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage & Data Protection",
      "rows": [
        {
          "feature": "Persistent long-term storage",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "WeTransfer files/links expire by design"
        },
        {
          "feature": "Encryption, versioning, replication, lifecycle management",
          "toolA": "available",
          "toolB": "limited",
          "note": "WeTransfer encrypts in transit and at rest only"
        },
        {
          "feature": "S3-compatible API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "WeTransfer's public API has been retired"
        },
        {
          "feature": "AI/analytics framework integration (Iceberg, PyTorch)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        }
      ]
    },
    {
      "group": "Access & Sharing",
      "rows": [
        {
          "feature": "No account needed for recipients",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Password-protected sharing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Custom link expiration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Paid plans"
        },
        {
          "feature": "Transfer/download tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Native mobile apps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "iOS, Android, Mac"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Full-featured single-node vs. 10 transfers/3GB per 30 days"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Published paid pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "MinIO Enterprise requires contacting sales"
        },
        {
          "feature": "Multi-node/scalable architecture",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "MinIO Enterprise tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is MinIO still open source?",
      "answer": "The original open-source Community Edition repository (minio/minio) was archived and marked no longer maintained in 2026; current development is focused on the commercial MinIO AIStor product, which still offers a free single-node tier."
    },
    {
      "question": "Is WeTransfer free to use?",
      "answer": "Yes, the free plan allows up to 10 transfers or 3GB total within a rolling 30-day period, with no account required for recipients."
    },
    {
      "question": "Can MinIO be self-hosted?",
      "answer": "Yes, MinIO AIStor is designed to be self-hosted across edge, on-premises, and cloud environments."
    },
    {
      "question": "Does WeTransfer have a developer API?",
      "answer": "No, its public developer API has been retired, which limits automation and custom integrations."
    },
    {
      "question": "How much does MinIO Enterprise cost?",
      "answer": "Pricing for the Enterprise Lite (under 400 TiB) and Enterprise tiers isn't publicly listed and requires contacting MinIO directly."
    },
    {
      "question": "How long do WeTransfer links stay active?",
      "answer": "On the free plan, links typically stay active for a few days; paid plans allow custom, longer expiration windows."
    }
  ]
};

export default minioVsWetransferContent;

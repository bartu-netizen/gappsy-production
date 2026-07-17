import type { ToolComparisonContent } from './types';

const awsVsGoogleCloudContent: ToolComparisonContent = {
  "verdict": "AWS and Google Cloud both sell usage-based, pay-as-you-go infrastructure, but they are built for slightly different buyers. AWS is the broadest general-purpose cloud, with 200 plus services, the largest global infrastructure footprint of any provider, and a mature, tiered support system (Basic through Enterprise) that regulated and large enterprises rely on for predictable escalation paths. Google Cloud leans on its own heritage running Search and YouTube, and it shows up most clearly in data and AI tooling: BigQuery for serverless analytics and Vertex AI as a unified model training and foundation-model platform, plus Google Kubernetes Engine from the team that created Kubernetes itself. Google Cloud also lowers the entry barrier further with an Always Free tier on top of a limited-time trial credit, while AWS offers a single Free Tier. Both share real weaknesses: a steep learning curve for newcomers and usage-based billing that can produce surprise costs without active monitoring. Teams choosing based on raw service breadth, global reach, or enterprise support maturity tend toward AWS. Teams whose workloads center on large-scale analytics, machine learning pipelines, or Kubernetes-native architecture often find Google Cloud a tighter fit. Neither is objectively better; the right choice depends on which workload class and support model matters most to the buyer.",
  "bestForToolA": "AWS fits organizations that want the widest possible catalog of infrastructure services in one ecosystem, need the largest global footprint for low-latency deployment, or require a clearly tiered, published support plan for enterprise and regulated workloads.",
  "bestForToolB": "Google Cloud fits data and AI-heavy teams that want serverless analytics through BigQuery, a unified machine learning platform in Vertex AI, and Kubernetes-native container operations, along with a generous Always Free tier for getting started.",
  "whoNeedsBoth": "Organizations running large, multi-cloud or acquired engineering teams often end up using both, for example running core infrastructure on AWS while routing analytics or Kubernetes workloads through Google Cloud services like BigQuery or GKE.",
  "keyDifferences": [
    {
      "title": "Company heritage",
      "toolA": "AWS launched in 2006 as Amazons dedicated cloud computing platform, headquartered in Seattle, Washington.",
      "toolB": "Google Cloud is built on infrastructure behind Search and YouTube, with Google itself dating back to 1998 and headquartered in Mountain View, California.",
      "whyItMatters": "Buyers evaluating platform maturity and origin often want to know whether a clouds infrastructure grew up serving external customers from the start or was adapted from internal systems.",
      "benefitsWho": "Enterprise buyers who prioritize a track record of external cloud service delivery tend to weigh AWS heritage more heavily."
    },
    {
      "title": "Data warehousing",
      "toolA": "AWS documented database services are RDS, Aurora, and DynamoDB, none of which are described as a serverless analytical data warehouse.",
      "toolB": "Google Cloud offers BigQuery, a serverless SQL data warehouse purpose built for running analytical queries over large datasets without provisioning infrastructure.",
      "whyItMatters": "Teams running heavy analytical workloads need a warehouse layer, and provisioning one on AWS requires assembling additional services rather than using a single documented offering.",
      "benefitsWho": "Data engineering and analytics teams benefit most from Google Clouds built-in BigQuery offering."
    },
    {
      "title": "Kubernetes origin and tooling",
      "toolA": "AWS supports Docker and Kubernetes workloads through ECS, EKS, and Fargate, with or without managing underlying servers.",
      "toolB": "Google Cloud offers Google Kubernetes Engine, built by the same team that created and open-sourced the Kubernetes project.",
      "whyItMatters": "Teams standardized on Kubernetes may value working with the platform maintained by Kubernetes originators for closer alignment with upstream development.",
      "benefitsWho": "Container-first engineering teams with deep Kubernetes investment tend to favor Google Clouds GKE lineage."
    },
    {
      "title": "AI and machine learning platform shape",
      "toolA": "AWS splits AI workloads across SageMaker for custom model training and Bedrock for foundation model access as two distinct services.",
      "toolB": "Google Cloud consolidates model training, foundation model access, tuning, and deployment into a single unified platform called Vertex AI.",
      "whyItMatters": "A unified platform can simplify workflow handoffs between training and deployment, while a split model gives teams more service level choice for each stage.",
      "benefitsWho": "Teams wanting one consolidated ML workflow may prefer Vertex AI, while teams wanting to mix and match training versus foundation model tooling may prefer AWS separate services."
    },
    {
      "title": "Free tier structure",
      "toolA": "AWS offers a single Free Tier with limited usage of many services aimed at helping new customers experiment.",
      "toolB": "Google Cloud offers both an Always Free tier with ongoing monthly limits on select services and a separate, time-limited free trial with introductory credit.",
      "whyItMatters": "A two part free offering lets newcomers both experiment indefinitely on core services and stress test a broader set of products during a trial window.",
      "benefitsWho": "Individual developers, students, and early stage startups testing multiple services benefit from Google Clouds layered free access."
    },
    {
      "title": "Support plan pricing transparency",
      "toolA": "AWS publishes four named support tiers with explicit starting prices: Basic Support is free, Developer Support starts at $29 per month, Business Support starts at $100 per month, and Enterprise Support starts at $15,000 per month.",
      "toolB": "Google Cloud documents an Enterprise and Committed Use plan with custom pricing and dedicated technical account management, negotiated through Google Cloud sales rather than published tiers.",
      "whyItMatters": "Published support pricing lets buyers budget and compare support costs upfront, while custom sales-negotiated pricing requires a direct conversation before costs are known.",
      "benefitsWho": "Smaller teams and procurement-conscious buyers benefit from AWS published support tiers, while enterprises comfortable negotiating custom terms are unaffected either way."
    },
    {
      "title": "Global infrastructure footprint",
      "toolA": "AWS is documented as having the largest global infrastructure footprint of any cloud provider, enabling low-latency deployments worldwide.",
      "toolB": "Google Cloud documentation notes that some services and regions have less global coverage compared to the largest competitors.",
      "whyItMatters": "Applications with strict latency requirements across many geographies depend on the breadth and density of a providers regions and availability zones.",
      "benefitsWho": "Global consumer applications and latency-sensitive workloads benefit most from AWS broader regional footprint."
    },
    {
      "title": "Database breadth for global distribution",
      "toolA": "AWS documented databases are RDS, Aurora, and DynamoDB, focused on relational and NoSQL workloads without an explicitly named globally distributed relational database.",
      "toolB": "Google Cloud offers Cloud SQL for traditional MySQL, PostgreSQL, and SQL Server workloads alongside Spanner, a globally distributed, horizontally scalable database.",
      "whyItMatters": "Applications that need strong consistency across multiple regions at scale require a globally distributed database rather than a regionally replicated one.",
      "benefitsWho": "Teams building globally consistent, horizontally scalable applications benefit from Google Clouds Spanner offering."
    },
    {
      "title": "Ecosystem size and market share",
      "toolA": "AWS is documented as having the largest service catalog, at over 200 services, and a mature ecosystem of documentation, certifications, training, and partners.",
      "toolB": "Google Cloud documentation notes a smaller market share than AWS, resulting in a somewhat smaller pool of third-party tools and community tutorials.",
      "whyItMatters": "A larger ecosystem generally means more prebuilt integrations, more community troubleshooting resources, and a deeper hiring pool of experienced practitioners.",
      "benefitsWho": "Teams that rely heavily on third-party tooling, community support, and a large talent pool tend to benefit from AWS larger ecosystem."
    }
  ],
  "featureMatrix": [
    {
      "group": "Compute",
      "rows": [
        {
          "feature": "Resizable virtual machines",
          "toolA": "available",
          "toolB": "available",
          "note": "AWS via EC2 across dozens of instance families; Google Cloud via Compute Engine with custom machine types and per-second billing"
        },
        {
          "feature": "Event-driven serverless functions",
          "toolA": "available",
          "toolB": "available",
          "note": "AWS Lambda versus Google Cloud Functions"
        },
        {
          "feature": "Serverless container execution",
          "toolA": "available",
          "toolB": "available",
          "note": "AWS Fargate versus Google Cloud Run"
        }
      ]
    },
    {
      "group": "Container and Kubernetes",
      "rows": [
        {
          "feature": "Managed Kubernetes service",
          "toolA": "available",
          "toolB": "available",
          "note": "AWS EKS versus Google Kubernetes Engine, built by Kubernetes originators"
        },
        {
          "feature": "Docker container orchestration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AWS documents ECS in addition to EKS and Fargate; Google Clouds provided facts do not name a separate Docker-specific orchestrator beyond GKE and Cloud Run"
        }
      ]
    },
    {
      "group": "Databases",
      "rows": [
        {
          "feature": "Managed relational database",
          "toolA": "available",
          "toolB": "available",
          "note": "AWS RDS and Aurora versus Google Cloud SQL"
        },
        {
          "feature": "Managed NoSQL database",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AWS documents DynamoDB; Google Clouds provided facts do not name a dedicated NoSQL document database"
        },
        {
          "feature": "Globally distributed, horizontally scalable database",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Google Cloud documents Spanner for this use case; AWS facts do not name an equivalent"
        }
      ]
    },
    {
      "group": "Data Analytics",
      "rows": [
        {
          "feature": "Serverless SQL data warehouse",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Google Cloud documents BigQuery; AWS facts do not name a warehouse-specific service"
        }
      ]
    },
    {
      "group": "AI and Machine Learning",
      "rows": [
        {
          "feature": "Custom model training",
          "toolA": "available",
          "toolB": "available",
          "note": "AWS SageMaker versus Google Cloud Vertex AI"
        },
        {
          "feature": "Foundation model access",
          "toolA": "available",
          "toolB": "available",
          "note": "AWS Bedrock versus Vertex AI foundation model access"
        }
      ]
    },
    {
      "group": "Networking and Delivery",
      "rows": [
        {
          "feature": "Content delivery network",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AWS documents CloudFront; Google Clouds provided facts do not name a CDN product"
        },
        {
          "feature": "Managed DNS",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AWS documents Route 53; not named in Google Cloud facts"
        },
        {
          "feature": "Global load balancing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Google Cloud documents Cloud Load Balancing; AWS facts do not separately name a load balancing product"
        }
      ]
    },
    {
      "group": "Identity, Security, and Compliance",
      "rows": [
        {
          "feature": "Identity and access management",
          "toolA": "available",
          "toolB": "available",
          "note": "AWS IAM versus Google Cloud IAM"
        },
        {
          "feature": "Centralized security and risk visibility dashboard",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Google Cloud documents Security Command Center; AWS facts do not name an equivalent dashboard"
        },
        {
          "feature": "Documented compliance support (HIPAA, GDPR, SOC)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Confirmed for AWS via FAQ; not addressed in Google Clouds provided facts"
        }
      ]
    },
    {
      "group": "DevOps and Infrastructure as Code",
      "rows": [
        {
          "feature": "Infrastructure as code tooling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AWS documents CloudFormation and the AWS CDK; not named in Google Cloud facts"
        },
        {
          "feature": "Managed CI or CD pipeline tooling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AWS documents CodePipeline; not named in Google Cloud facts"
        }
      ]
    },
    {
      "group": "Monitoring and Support",
      "rows": [
        {
          "feature": "Metrics, logging, and distributed tracing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AWS documents CloudWatch and X-Ray; not named in Google Cloud facts"
        },
        {
          "feature": "Free tier for new customers",
          "toolA": "available",
          "toolB": "available",
          "note": "AWS Free Tier versus Google Clouds Always Free tier plus a separate free trial credit"
        },
        {
          "feature": "Published, tiered paid support pricing",
          "toolA": "available",
          "toolB": "limited",
          "note": "AWS lists four named tiers with starting prices; Google Cloud names an Enterprise or Committed Use plan but with custom, sales-negotiated pricing"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, AWS or Google Cloud?",
      "answer": "Neither is definitively cheaper across the board, since both use usage-based, pay-as-you-go pricing with a free entry point; AWS offers a single Free Tier while Google Cloud combines an Always Free tier with a separate free trial credit, and both providers documentation warns that costs can become unpredictable without active monitoring."
    },
    {
      "question": "Is AWS or Google Cloud better for beginners?",
      "answer": "Both are documented as having a steep learning curve for teams without prior cloud experience, though Google Clouds Always Free tier plus trial credit gives newcomers more ways to experiment before committing to paid usage."
    },
    {
      "question": "Can Google Cloud do everything AWS can do?",
      "answer": "Not according to the documented facts here; AWS lists dedicated services for content delivery, DNS, infrastructure as code, and CI or CD pipelines that are not named in Google Clouds provided feature set, while Google Cloud documents a serverless data warehouse and a globally distributed database that AWS facts do not name."
    },
    {
      "question": "Which has better AI and machine learning tools, AWS or Google Cloud?",
      "answer": "Both offer documented AI and machine learning platforms, AWS through SageMaker for training and Bedrock for foundation models, and Google Cloud through the unified Vertex AI platform plus BigQuery for the underlying analytics, so the better fit depends on whether a team prefers a single consolidated platform or separate specialized services."
    },
    {
      "question": "Does AWS or Google Cloud have better Kubernetes support?",
      "answer": "Google Cloud has a distinct advantage in documented Kubernetes heritage, since Google Kubernetes Engine comes from the same team that created and open-sourced the Kubernetes project, while AWS supports Kubernetes workloads through EKS alongside ECS and Fargate."
    },
    {
      "question": "Do enterprises typically use both AWS and Google Cloud?",
      "answer": "Yes, it is common for larger organizations to run core infrastructure on one provider while routing specific workloads, such as analytics on BigQuery or container operations on GKE, through the other, particularly when teams or acquired companies bring in existing cloud investments."
    }
  ]
};

export default awsVsGoogleCloudContent;

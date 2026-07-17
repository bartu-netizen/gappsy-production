import type { ToolComparisonContent } from './types';

const herokuVsRenderContent: ToolComparisonContent = {
  "verdict": "Heroku and Render solve the same core problem, deploying and running web apps, APIs, and databases without managing servers, but they come from different eras and serve slightly different needs. Heroku, founded in 2007 and owned by Salesforce since 2011, is the more mature platform, with a long track record, a large third-party add-ons marketplace, and Heroku Connect for teams syncing data with Salesforce. Its pricing is usage-based starting at 5 dollars per month, and it lost its permanent free tier in November 2022. Render, founded in 2019, is a newer platform built around a similar git-push workflow but with a freemium model: free web services, static sites, and databases for prototyping, plus native Docker support, background workers and cron jobs, private networking, and render.yaml-based infrastructure as code. Neither tool is a strict upgrade over the other. Heroku's strengths sit in ecosystem maturity, add-ons, and Salesforce integration, while Render's strengths sit in a lower cost of entry, container flexibility, and built-in infrastructure-as-code tooling. The right choice depends on whether a team needs Heroku's established marketplace and Salesforce ties or Render's free tier and Docker-first workflow. Budget-conscious teams and container-based workloads tend to lean toward Render, while Salesforce-adjacent or add-on-dependent teams tend to lean toward Heroku.",
  "bestForToolA": "Heroku is the better fit for teams already inside the Salesforce ecosystem that need Heroku Connect data sync, or for teams that value a mature, long-established add-ons marketplace and don't require a permanent free tier.",
  "bestForToolB": "Render is the better fit for teams and solo developers who want a generous free tier to prototype on, plus native Docker support, background workers, and infrastructure-as-code tooling without paying from day one.",
  "whoNeedsBoth": "Teams managing a portfolio of client or internal projects with different budgets and integration needs may run some apps on Heroku for its add-ons marketplace and Salesforce Connect, and others on Render for free-tier prototypes or Docker-based services.",
  "keyDifferences": [
    {
      "title": "Free Tier Availability",
      "toolA": "No permanent free tier; free dynos and free databases were removed in November 2022, leaving the 5 dollar per month Eco plan as the cheapest option.",
      "toolB": "Free Hobby plan includes free web service, static site, and database instances with 750 free instance hours per month.",
      "whyItMatters": "For students, hobbyists, and early-stage prototypes, zero-cost hosting removes the barrier to trying the platform before committing to a paid plan.",
      "benefitsWho": "Solo developers, students, and teams validating a new project before spending money benefit most from Render's free tier."
    },
    {
      "title": "Platform Maturity and Backing",
      "toolA": "Founded in 2007 and a wholly owned Salesforce subsidiary since 2011, giving it a long operating history.",
      "toolB": "Founded in 2019, a newer platform without a stated corporate parent in the provided facts.",
      "whyItMatters": "A longer operating history and large-company backing can signal stability and a broader partner ecosystem, while a newer platform may iterate faster on developer experience.",
      "benefitsWho": "Risk-averse enterprises and regulated teams often value Heroku's longer track record and Salesforce backing, while smaller teams may not weigh company age as heavily."
    },
    {
      "title": "Third-Party Add-ons Marketplace",
      "toolA": "Large add-ons marketplace covering databases, caching, logging, and monitoring that attach with one command.",
      "toolB": "Built-in managed Postgres and a Key Value store are offered, but the documented feature set does not describe a broad third-party add-ons marketplace, and Render's own materials note fewer specialized integrations than larger providers.",
      "whyItMatters": "A wide add-ons catalog lets teams bolt on specialized services without leaving the platform or managing extra infrastructure.",
      "benefitsWho": "Teams that rely on many specialized third-party integrations benefit more from Heroku's marketplace breadth."
    },
    {
      "title": "Infrastructure as Code Support",
      "toolA": "The provided facts do not describe a dedicated infrastructure-as-code configuration file for Heroku.",
      "toolB": "Render Blueprints let teams define services, databases, and environment variables in a single render.yaml file.",
      "whyItMatters": "Defining infrastructure in a version-controlled file makes environments reproducible and easier to review in pull requests.",
      "benefitsWho": "Engineering teams practicing infrastructure as code and GitOps-style workflows benefit from Render's Blueprint support."
    },
    {
      "title": "Native Salesforce Integration",
      "toolA": "Heroku Connect keeps data synchronized between a Heroku app's database and Salesforce.",
      "toolB": "No equivalent Salesforce sync feature appears in Render's documented feature set.",
      "whyItMatters": "Teams already running their business on Salesforce need a reliable, supported way to keep application and CRM data in sync.",
      "benefitsWho": "Companies with an existing Salesforce deployment benefit specifically from Heroku Connect."
    },
    {
      "title": "Docker and Container Deployment",
      "toolA": "Deployment is described around buildpacks that detect a language and build a slug; the provided facts do not mention Docker-based deploys.",
      "toolB": "Render explicitly supports deploying any containerized application by pointing it at a Dockerfile.",
      "whyItMatters": "Container-based deploys give teams full control over the runtime environment and dependencies rather than relying on a platform's buildpack detection.",
      "benefitsWho": "Teams with existing Dockerized applications or complex custom runtimes benefit from Render's documented container support."
    },
    {
      "title": "Enterprise and High-End Pricing Tiers",
      "toolA": "Pricing tops out at Performance dynos priced from 250 to 500-plus dollars per month per dyno, with no separate named enterprise tier in the provided plans.",
      "toolB": "Render has a distinct Scale plan at 499 dollars per month and a custom-priced Enterprise plan with dedicated SLAs and onboarding.",
      "whyItMatters": "A clearly named enterprise tier signals dedicated support and negotiable terms for large organizations.",
      "benefitsWho": "Larger organizations negotiating custom terms may find Render's explicit Enterprise plan more clearly aligned to their needs, based on the documented plans."
    },
    {
      "title": "Language and Runtime Support",
      "toolA": "Native buildpacks cover Ruby, Node.js, Python, Java, PHP, Go, Scala, and Clojure, with custom buildpacks extending support further.",
      "toolB": "The provided facts confirm Docker-based deployment but do not list specific native language runtimes.",
      "whyItMatters": "Clear, documented language support reduces the risk of hitting an unsupported runtime mid-project.",
      "benefitsWho": "Teams working in one of Heroku's explicitly listed languages benefit from its documented buildpack coverage."
    },
    {
      "title": "Background Jobs and Scheduling",
      "toolA": "Dynos can run worker or one-off processes, but the provided facts do not explicitly describe a scheduled cron job feature.",
      "toolB": "Render explicitly bundles background workers and cron jobs as a named platform feature.",
      "whyItMatters": "Recurring scheduled tasks, like nightly reports or cleanup jobs, are common production needs and are easier to manage when natively supported.",
      "benefitsWho": "Teams needing scheduled or recurring background tasks benefit from Render's explicitly documented cron job support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Workflow",
      "rows": [
        {
          "feature": "Git-based deploys",
          "toolA": "available",
          "toolB": "available",
          "note": "Both trigger an automatic build and release on push."
        },
        {
          "feature": "Docker container deploys",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Render deploys any app by pointing at a Dockerfile."
        },
        {
          "feature": "CLI management tool",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Heroku CLI manages apps, config vars, dynos, logs, and add-ons."
        },
        {
          "feature": "Preview or review environments for pull requests",
          "toolA": "available",
          "toolB": "available",
          "note": "Heroku calls these review apps within Pipelines; Render calls these Preview Environments."
        },
        {
          "feature": "Infrastructure-as-code configuration file",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Render Blueprints use a single render.yaml file."
        }
      ]
    },
    {
      "group": "Databases and Data Stores",
      "rows": [
        {
          "feature": "Managed PostgreSQL",
          "toolA": "available",
          "toolB": "available",
          "note": "Both include automated backups."
        },
        {
          "feature": "Redis-compatible key-value store",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Render names this the Key Value Store."
        },
        {
          "feature": "Read replicas or follower databases",
          "toolA": "available",
          "toolB": "available",
          "note": "Heroku calls these follower databases; Render calls these read replicas."
        }
      ]
    },
    {
      "group": "Compute and Scaling",
      "rows": [
        {
          "feature": "Autoscaling",
          "toolA": "available",
          "toolB": "available",
          "note": "Heroku autoscaling is limited to higher-tier dynos."
        },
        {
          "feature": "Background worker processes",
          "toolA": "available",
          "toolB": "available",
          "note": "Heroku dynos can run worker processes; Render has a dedicated Background Workers feature."
        },
        {
          "feature": "Scheduled cron jobs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Render explicitly names Cron Jobs as a feature."
        },
        {
          "feature": "Zero-downtime deploys",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Networking and Security",
      "rows": [
        {
          "feature": "Private internal networking between services",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Keeps backend traffic off the public internet by default."
        },
        {
          "feature": "Automatic free TLS certificates",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Automatically renewed on every service."
        }
      ]
    },
    {
      "group": "Integrations and Ecosystem",
      "rows": [
        {
          "feature": "Third-party add-ons marketplace",
          "toolA": "available",
          "toolB": "limited",
          "note": "Render offers its own managed Postgres and Key Value store but fewer specialized third-party integrations."
        },
        {
          "feature": "Native Salesforce data sync",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Heroku Connect is specific to Heroku's Salesforce ownership."
        }
      ]
    },
    {
      "group": "Language and Runtime Support",
      "rows": [
        {
          "feature": "Native buildpack language support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Heroku lists Ruby, Node.js, Python, Java, PHP, Go, Scala, and Clojure."
        },
        {
          "feature": "Custom buildpack or runtime extensibility",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Permanent free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Heroku removed its free tier in November 2022; Render's Hobby plan remains free."
        },
        {
          "feature": "Named enterprise pricing tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Render's Enterprise plan includes custom SLAs and dedicated onboarding."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Heroku or Render?",
      "answer": "Render is cheaper to start with since it offers a free Hobby plan with 750 free instance hours per month, while Heroku's cheapest paid plan is the 5 dollar per month Eco tier, since Heroku no longer offers a free tier; both scale into comparable per-instance monthly costs as usage grows."
    },
    {
      "question": "Does Heroku still have a free plan?",
      "answer": "No, Heroku discontinued its free dyno and free database tiers in November 2022, so the cheapest option today is the paid 5 dollar per month Eco plan."
    },
    {
      "question": "Is Render a good Heroku alternative?",
      "answer": "Yes, Render is commonly chosen by teams migrating from Heroku because it offers a similar git-based deploy workflow along with managed databases, background workers, and preview environments."
    },
    {
      "question": "Can Render run Docker containers?",
      "answer": "Yes, Render supports deploying any containerized application by pointing it at a Dockerfile in addition to native language runtimes; the provided facts do not confirm equivalent native Docker support on Heroku."
    },
    {
      "question": "Which platform has more documented programming language support?",
      "answer": "Heroku's documented buildpack support explicitly covers Ruby, Node.js, Python, Java, PHP, Go, Scala, and Clojure, plus custom buildpacks for other languages, while Render's provided facts confirm Docker-based deployment but do not list specific native language runtimes."
    },
    {
      "question": "Does either platform integrate with Salesforce?",
      "answer": "Heroku offers Heroku Connect, a dedicated sync service between a Heroku app's database and Salesforce, a feature not present in Render's documented feature set, which follows from Heroku being a Salesforce-owned platform."
    }
  ]
};

export default herokuVsRenderContent;

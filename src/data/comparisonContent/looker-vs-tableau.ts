import type { ToolComparisonContent } from './types';

const lookerVsTableauContent: ToolComparisonContent = {
  "verdict": "Looker and Tableau both sit in the BI category but are built for different jobs. Looker centers on LookML, a governed semantic layer that centralizes metric and join definitions so every dashboard draws from one consistent source of truth, running live queries directly against the connected warehouse rather than a cached extract. That suits engineering-led data teams, especially those standardized on BigQuery and Google Cloud, who want git-based version control over the data model and are comfortable with quote-based enterprise pricing. Tableau centers on fast, drag-and-drop visual authoring: connect to a source, drop fields on a canvas, and Tableau suggests the chart. It ships with its own data prep tool, row-level security, mobile apps, and Tableau Pulse for natural-language insights, with public, role-based pricing starting at 15 dollars per user per month. That transparency and shallower on-ramp suit business analysts and Salesforce-centric organizations more than teams building a governed metric layer from scratch. Neither tool is objectively better: Looker wins on modeling discipline, live warehouse-native queries, and embedded product licensing; Tableau wins on visual flexibility, published pricing, data prep, and a larger trained-analyst ecosystem. The right choice depends on whether the priority is a single governed semantic model feeding embedded products, or fast, accessible visual analytics deployed broadly across a business.",
  "bestForToolA": "Looker fits engineering-led data teams, especially those standardized on BigQuery or Google Cloud, who need one governed semantic layer and are building embedded, customer-facing analytics products.",
  "bestForToolB": "Tableau fits business analysts and teams that want fast, drag-and-drop visual exploration with transparent per-user pricing, built-in data prep, and natural-language insights without first building a code-based data model.",
  "whoNeedsBoth": "Large enterprises often run both: Looker as the governed, warehouse-native layer of truth for core metrics and embedded products, and Tableau for broader self-serve visual exploration, mobile access, and Salesforce-integrated reporting across business teams.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "No public pricing; Looker is quote-based and requires contacting Google Cloud sales, with no free tier",
      "toolB": "Published, role-based pricing starting at 15 dollars per user per month for Viewer, up to 75 dollars for Creator",
      "whyItMatters": "Buyers need to know whether they can self-serve a budget estimate or must go through a sales cycle before evaluating fit",
      "benefitsWho": "Smaller teams and self-serve buyers benefit from Tableau's published tiers; enterprises already running a procurement process are less affected by Looker's opacity"
    },
    {
      "title": "Core product philosophy",
      "toolA": "Built around LookML, a governed semantic layer centralizing metric and join definitions across every dashboard",
      "toolB": "Built around drag-and-drop visual authoring where users build charts and dashboards directly on a canvas",
      "whyItMatters": "Determines whether the organization gets one enforced source of truth or fast, flexible ad hoc exploration",
      "benefitsWho": "Data teams enforcing consistent metrics benefit from Looker; analysts wanting quick visual exploration benefit from Tableau"
    },
    {
      "title": "Query architecture",
      "toolA": "Queries run live, directly against the connected warehouse such as BigQuery, Snowflake, or Redshift, with no separate extract layer",
      "toolB": "Connects natively to warehouses, databases, and SaaS apps, though the provided facts do not specify live versus cached-extract behavior",
      "whyItMatters": "Live-only querying keeps analysis current but ties cost to warehouse compute, which matters for budgeting and data freshness",
      "benefitsWho": "Teams that need every report to reflect current warehouse state lean toward Looker's live-query model"
    },
    {
      "title": "Data preparation tooling",
      "toolA": "No dedicated data preparation tool is documented in Looker's feature set",
      "toolB": "Includes Tableau Prep, a dedicated visual flow-based tool for cleaning, shaping, and combining data before it reaches a dashboard",
      "whyItMatters": "Determines whether messy raw data can be handled inside the BI tool or requires separate ETL tooling first",
      "benefitsWho": "Teams without a mature warehouse pipeline benefit from Tableau Prep; teams with an already-modeled warehouse fit Looker's warehouse-native approach"
    },
    {
      "title": "Modeling and governance discipline",
      "toolA": "LookML plus git-based version control bring review, rollback, and collaborative software development practices to the data model",
      "toolB": "Governance comes through Tableau Cloud or Server publishing, certified data sources, and row-level security rather than a code-based modeling layer",
      "whyItMatters": "Affects how metric drift and definition conflicts get prevented as an organization scales",
      "benefitsWho": "Engineering-led data teams benefit from Looker's git workflow; business-analyst-led teams benefit from Tableau's certified-source governance without learning a modeling language"
    },
    {
      "title": "AI-assisted analysis",
      "toolA": "No natural-language or AI insight capability appears in Looker's documented feature set",
      "toolB": "Tableau Pulse delivers automated natural-language summaries of key metrics and answers plain-English questions with relevant visualizations",
      "whyItMatters": "Lowers the barrier for non-technical stakeholders to get answers without building a dashboard themselves",
      "benefitsWho": "Business users who want quick answers benefit from Tableau Pulse; Looker's documented facts show no equivalent"
    },
    {
      "title": "Mobile access",
      "toolA": "No mobile app is mentioned in Looker's documented features",
      "toolB": "Dedicated iOS and Android apps let users view and interact with published dashboards on the go",
      "whyItMatters": "Field teams and executives who check dashboards away from a desktop need native mobile support",
      "benefitsWho": "Distributed or field-based workforces benefit from Tableau's mobile apps"
    },
    {
      "title": "Embedding licensing model",
      "toolA": "Offers a dedicated Embed pricing plan with usage-based elements specifically for embedding dashboards into external, customer-facing applications",
      "toolB": "Embeds dashboards through a JavaScript API and manages content via a REST API, with no separate embed-specific plan documented",
      "whyItMatters": "Companies building data products for external customers need predictable, purpose-built embed licensing rather than adapting a general plan",
      "benefitsWho": "SaaS vendors building embedded analytics products benefit from Looker's purpose-built Embed plan"
    },
    {
      "title": "Cloud and CRM ecosystem affiliation",
      "toolA": "Now part of Google Cloud, with deep native integration into BigQuery and other Google Cloud data services",
      "toolB": "Now Salesforce's primary analytics platform following its 2019 acquisition, with tighter integration into Salesforce CRM and Data Cloud",
      "whyItMatters": "An organization already standardized on one ecosystem gets smoother native integration and likely licensing bundling",
      "benefitsWho": "BigQuery-centric organizations favor Looker; Salesforce-centric organizations favor Tableau"
    },
    {
      "title": "Company age and ecosystem maturity",
      "toolA": "Founded in 2012 in Santa Cruz, California, before joining Google Cloud",
      "toolB": "Founded in 2003 in Seattle, Washington, giving it a longer independent track record before the Salesforce acquisition",
      "whyItMatters": "A longer history correlates with a larger pool of trained analysts, consultants, and community resources to hire from",
      "benefitsWho": "Organizations wanting a large existing talent pool benefit from Tableau's more mature, longer-established ecosystem"
    }
  ],
  "featureMatrix": [
    {
      "group": "Semantic Modeling and Governance",
      "rows": [
        {
          "feature": "Governed semantic modeling layer",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "LookML centralizes metric and join definitions; Tableau's facts describe no equivalent semantic layer"
        },
        {
          "feature": "Git-based version control for the data model",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "LookML projects integrate with Git for review and rollback"
        },
        {
          "feature": "Role-based access control",
          "toolA": "available",
          "toolB": "available",
          "note": "Both restrict what data or dashboards different users can see"
        },
        {
          "feature": "Certified or governed data source publishing",
          "toolA": "available",
          "toolB": "available",
          "note": "Looker via a governed LookML source of truth; Tableau via certified data sources on Tableau Cloud/Server"
        }
      ]
    },
    {
      "group": "Data Connectivity and Querying",
      "rows": [
        {
          "feature": "Native cloud warehouse connectors",
          "toolA": "available",
          "toolB": "available",
          "note": "Both connect to BigQuery, Snowflake, Redshift and similar warehouses"
        },
        {
          "feature": "Broad SaaS and third-party connector library",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tableau's facts cite a large library of native, third-party, and community connectors; Looker's facts focus on databases and warehouses"
        },
        {
          "feature": "Live query with no required extract layer",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Looker explicitly avoids a cached extract layer; Tableau's facts don't specify live-versus-extract behavior"
        }
      ]
    },
    {
      "group": "Data Preparation and Calculation Depth",
      "rows": [
        {
          "feature": "Dedicated visual data preparation tool",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tableau Prep is a named, dedicated tool"
        },
        {
          "feature": "Calculated fields and level-of-detail expressions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Not described in Looker's provided feature set"
        }
      ]
    },
    {
      "group": "Visualization and Dashboards",
      "rows": [
        {
          "feature": "Drag-and-drop chart building",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Looker's self-serve interface builds Explores and Looks without SQL, but isn't described as drag-and-drop"
        },
        {
          "feature": "Interactive dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": "Both support published, interactive dashboards"
        },
        {
          "feature": "Scheduled delivery and alerts",
          "toolA": "available",
          "toolB": "available",
          "note": "Looker schedules to email, Slack, or cloud storage; Tableau's Viewer plan includes scheduled reports and alerts"
        }
      ]
    },
    {
      "group": "AI, Mobile and Extensibility",
      "rows": [
        {
          "feature": "AI-assisted, natural-language insights",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tableau Pulse; no equivalent in Looker's documented features"
        },
        {
          "feature": "Dedicated mobile apps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tableau ships iOS and Android apps"
        },
        {
          "feature": "Extensions or data-driven workflow actions",
          "toolA": "available",
          "toolB": "available",
          "note": "Looker's data actions and workflow automation versus Tableau's extensions and dashboard actions"
        }
      ]
    },
    {
      "group": "Embedding and APIs",
      "rows": [
        {
          "feature": "Embedding SDK for external applications",
          "toolA": "available",
          "toolB": "available",
          "note": "Looker's embed SDKs versus Tableau's JavaScript API"
        },
        {
          "feature": "REST API for content management",
          "toolA": "available",
          "toolB": "available",
          "note": "Both expose APIs beyond just embedding"
        },
        {
          "feature": "Dedicated embed pricing plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Looker has a distinct Embed plan with usage-based elements; no equivalent plan is documented for Tableau"
        }
      ]
    },
    {
      "group": "Pricing and Access Tiers",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Looker's facts state no free tier; Tableau is paid with a free trial"
        },
        {
          "feature": "Free public or open tier",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Tableau Public is free but publishes data openly and is unsuitable for confidential data"
        },
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Looker requires contacting sales; Tableau lists 15 dollars per user per month for Viewer"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Looker or Tableau?",
      "answer": "Tableau publishes list pricing starting at 15 dollars per user per month for Viewer access, rising to 75 dollars per user per month for Creator, while Looker has no public pricing and requires contacting sales, though third-party estimates put typical Looker deployments in the tens of thousands to over a hundred thousand dollars per year."
    },
    {
      "question": "Is Tableau good for beginners?",
      "answer": "Tableau's drag-and-drop interface makes basic charting approachable, but its own documented facts note a real learning investment is needed for advanced calculations like level-of-detail expressions, and Looker similarly requires meaningful investment to learn LookML, so neither tool is trivially beginner-friendly."
    },
    {
      "question": "Can Looker do what Tableau does with drag-and-drop dashboards?",
      "answer": "Looker builds dashboards and Explores through a self-serve interface without requiring SQL, but its documented feature set centers on governed, warehouse-native querying rather than the free-form drag-and-drop visual authoring that defines Tableau."
    },
    {
      "question": "Which has better AI features, Looker or Tableau?",
      "answer": "Tableau documents a specific AI capability, Tableau Pulse, which delivers automated natural-language summaries and plain-English question answering, while Looker's documented feature set includes no equivalent natural-language or AI insight tool."
    },
    {
      "question": "Does Looker or Tableau integrate better with Google Cloud or Salesforce?",
      "answer": "Looker is now part of Google Cloud with deep native BigQuery integration, while Tableau operates as Salesforce's primary analytics platform following Salesforce's 2019 acquisition of the company."
    },
    {
      "question": "Can either tool be embedded into another application?",
      "answer": "Yes, both support embedding: Looker offers a dedicated Embed pricing plan with APIs and SDKs for white-labeled dashboards, and Tableau embeds interactive dashboards via its JavaScript API alongside a REST API for content management."
    }
  ]
};

export default lookerVsTableauContent;

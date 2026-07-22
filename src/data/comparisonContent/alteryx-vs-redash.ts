import type { ToolComparisonContent } from './types';

const alteryxVsRedashContent: ToolComparisonContent = {
  "verdict": "Alteryx is a commercial, no-code data analytics platform with a visual drag-and-drop workflow canvas for data blending, predictive and spatial analytics, and enterprise-grade automation via Alteryx Server, priced with a historical list price around $5,195/user/year and no free tier for production use. Redash is a free, open-source, SQL-first tool for querying multiple data sources and building shareable dashboards, but it has been in maintenance mode with infrequent releases since Databricks acquired it in 2020, and its hosted Redash Cloud service was discontinued in 2021. The choice is largely between paying for an actively developed, no-code analytics platform versus using a free but slower-moving SQL dashboarding tool.",
  "bestForToolA": "Data and business analysts needing a no-code visual canvas for advanced data blending, predictive modeling (regression, clustering), and spatial analytics (geocoding, drive-time analysis), backed by enterprise scheduling and governance via Alteryx Server, and able to justify list prices around $5,195/user/year.",
  "bestForToolB": "Teams comfortable writing SQL who want a free, self-hosted way to query multiple SQL, NoSQL, and API-based data sources and build shareable dashboards without licensing cost, and who can accept that the project has been in maintenance mode under Databricks since 2020.",
  "whoNeedsBoth": "A data team could use Alteryx to blend and prep complex data from disparate sources (spreadsheets, databases, cloud apps) into clean datasets, then push the output into a self-hosted Redash instance for lightweight, no-cost SQL dashboarding and sharing across the wider organization.",
  "keyDifferences": [
    {
      "title": "Price & Licensing",
      "toolA": "Alteryx is quote-based with a historical list price around $5,195/user/year for Designer alone, and offers no permanent free tier for production use, only trials.",
      "toolB": "Redash is fully free and open source with no licensing cost, self-hosted only since Redash Cloud was discontinued in November 2021.",
      "whyItMatters": "The cost gap between the two is enormous, which matters heavily for budget-constrained teams versus enterprises with dedicated analytics budgets.",
      "benefitsWho": "Enterprises with analytics budgets and dedicated licensing processes fit Alteryx; cost-sensitive teams and individuals fit Redash."
    },
    {
      "title": "No-Code vs. SQL-First",
      "toolA": "Alteryx uses a visual drag-and-drop workflow canvas so non-programmers can blend and prepare data without writing code, while still supporting embedded SQL, Python, or R for advanced users.",
      "toolB": "Redash is built around a SQL editor with schema browsing and click-to-insert query building, requiring SQL knowledge to use effectively.",
      "whyItMatters": "Teams without dedicated SQL/data engineering skills need a no-code option, while SQL-fluent teams can move faster with a query-first tool.",
      "benefitsWho": "Business analysts without coding backgrounds benefit from Alteryx; data-literate teams comfortable writing SQL benefit from Redash's lighter-weight query interface."
    },
    {
      "title": "Advanced Analytics Built In",
      "toolA": "Alteryx bundles predictive and statistical analytics tools (regression, clustering) and spatial analytics (geocoding, drive-time analysis, location-based joins) directly into the same workflow canvas used for everyday data prep.",
      "toolB": "Redash does not document predictive or spatial analytics; it is focused on querying and visualizing existing data rather than modeling it.",
      "whyItMatters": "Teams needing statistical modeling or location analysis without a separate stats package need that capability built into the same tool.",
      "benefitsWho": "Analysts doing predictive modeling or location-based analysis as part of their regular workflow."
    },
    {
      "title": "Ongoing Development & Maintenance Status",
      "toolA": "Alteryx is an actively sold, actively developed commercial product, expanding with Alteryx Server, Analytics Cloud, and AI-assisted features like Auto Insights.",
      "toolB": "Redash has been in maintenance mode since its 2020 Databricks acquisition, with infrequent releases and a read-only community forum, and its hosted Redash Cloud service was shut down in November 2021.",
      "whyItMatters": "A tool's development pace affects how quickly bugs get fixed and new capabilities (like AI features) appear.",
      "benefitsWho": "Teams wanting an actively evolving product benefit from Alteryx; teams satisfied with a stable, feature-frozen tool can still rely on Redash for core querying."
    },
    {
      "title": "Governance & Automation at Scale",
      "toolA": "Alteryx Server provides scheduling, sharing, and governance of workflows across an organization, backed by the Alteryx Connect data catalog for discovering and reusing prior work.",
      "toolB": "Redash offers scheduled refresh and dashboard sharing/alerting, but no documented equivalent to a workflow data catalog or enterprise governance layer.",
      "whyItMatters": "Larger organizations need centralized governance and discoverability as the number of workflows and dashboards grows.",
      "benefitsWho": "Enterprise data teams managing many workflows across departments benefit from Alteryx's governance tooling."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Prep & Analytics",
      "rows": [
        {
          "feature": "No-code visual workflow canvas",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "SQL query editor",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Data blending from multiple sources",
          "toolA": "available",
          "toolB": "available",
          "note": "Redash: broad data source support (SQL, NoSQL, Big Data, API)"
        },
        {
          "feature": "Predictive/statistical analytics (regression, clustering)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Spatial/location analytics",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free tier for production use",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Alteryx: trial only; Redash: fully free"
        },
        {
          "feature": "Self-hosting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Hosted/cloud version",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Alteryx Analytics Cloud; Redash Cloud discontinued Nov 2021"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Alteryx: quote-based, list ~$5,195/user/year; Redash: free"
        }
      ]
    },
    {
      "group": "Automation & Governance",
      "rows": [
        {
          "feature": "Scheduled workflow/refresh automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Alteryx Server; Redash scheduled refresh"
        },
        {
          "feature": "Data catalog / asset discovery",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Alteryx Connect"
        },
        {
          "feature": "AI-assisted insight generation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Alteryx: Auto Insights"
        },
        {
          "feature": "Active ongoing development",
          "toolA": "available",
          "toolB": "limited",
          "note": "Redash: maintenance mode since 2020 Databricks acquisition"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Redash still actively developed?",
      "answer": "No, Redash has been in maintenance mode since Databricks acquired it in 2020, with infrequent releases and a read-only community forum."
    },
    {
      "question": "Does Alteryx have a free tier?",
      "answer": "No, Alteryx does not offer a permanent free tier for production use; it offers a free trial only, while Redash is fully free and open source with no licensing cost."
    },
    {
      "question": "Do I need to know how to code to use these tools?",
      "answer": "Redash requires SQL knowledge to write queries. Alteryx is designed as a no-code visual workflow tool for business and finance analysts, though it also supports embedding SQL, Python, or R code for advanced users who want more control."
    },
    {
      "question": "Is there a hosted version of Redash?",
      "answer": "No, the original Redash Cloud hosted service was discontinued in November 2021; only self-hosting is currently available. Alteryx, by contrast, offers Alteryx Analytics Cloud as a browser-based hosted option."
    },
    {
      "question": "Which tool has predictive and spatial analytics built in?",
      "answer": "Alteryx, which includes built-in predictive/statistical tools (regression, clustering) and spatial analytics (geocoding, drive-time analysis) directly in its workflow canvas. Redash does not document these capabilities."
    },
    {
      "question": "How large is the price gap between the two?",
      "answer": "Very large. Alteryx's Designer product has a historical list price around $5,195 per user per year, sold through custom enterprise quotes, while Redash is entirely free and open source to self-host."
    }
  ]
};

export default alteryxVsRedashContent;

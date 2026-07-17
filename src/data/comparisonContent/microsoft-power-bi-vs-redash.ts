import type { ToolComparisonContent } from './types';

const microsoftPowerBiVsRedashContent: ToolComparisonContent = {
  "verdict": "Microsoft Power BI is a freemium BI platform with a free but Windows-only Desktop authoring app, DAX-driven data modeling, AI-assisted Copilot features, and enterprise governance, with paid Pro and Premium tiers required for sharing and collaboration. Redash is a fully free, open-source, SQL-first tool for querying multiple data sources and building shareable dashboards, but it has been in maintenance mode since Databricks acquired it in 2020 and lacks the AI and semantic-layer features found in newer BI tools. The decision largely comes down to Microsoft-ecosystem depth and governance versus a free, lightweight, SQL-native dashboard tool with a slower development pace.",
  "bestForToolA": "Organizations already using Microsoft 365, Teams, SharePoint, and Azure that want deep DAX-driven data modeling, enterprise governance (row-level security, certified datasets, deployment pipelines), and AI-assisted Copilot reporting, and can pay $10-$20/user/month for sharing and collaboration.",
  "bestForToolB": "Teams that write SQL and want a completely free, self-hosted way to query multiple SQL, NoSQL, and API-based data sources and share dashboards without per-seat licensing, and who can accept that the project has been in maintenance mode since 2020.",
  "whoNeedsBoth": "A data team might self-host Redash for quick, no-cost internal SQL dashboards and ad hoc querying while using Power BI for polished, governed reports distributed to executives and embedded in Teams or SharePoint, serving different audiences with different governance requirements from the same underlying data.",
  "keyDifferences": [
    {
      "title": "Cost Structure",
      "toolA": "Power BI Desktop is free for individual report authoring, but sharing and collaboration require paid Pro ($10/user/month) or Premium Per User ($20/user/month) licensing, with Premium Capacity starting from $4,995/month for organization-wide compute.",
      "toolB": "Redash's entire stack, including the SQL editor, dashboards, sharing, and alerting, is free and open source with no per-user licensing cost.",
      "whyItMatters": "Power BI's free tier only covers solo authoring, while real collaborative use has ongoing per-seat costs; Redash has none.",
      "benefitsWho": "Cost-sensitive teams that need to share dashboards broadly without per-seat fees benefit from Redash; enterprises willing to pay for governed collaboration benefit from Power BI's licensing model."
    },
    {
      "title": "Platform & OS",
      "toolA": "Power BI Desktop is a Windows-only application; Mac users need to access reports via a browser or run Desktop through a Windows virtual machine.",
      "toolB": "Redash is a self-hosted web application not tied to a specific desktop operating system.",
      "whyItMatters": "Organizations with mixed-OS environments, especially Mac-heavy teams, face friction with a Windows-only authoring tool.",
      "benefitsWho": "Mac-based teams and organizations with mixed operating systems benefit from Redash's OS-agnostic, browser-based access."
    },
    {
      "title": "AI Features",
      "toolA": "Power BI includes Natural Language Q&A, AI Visuals (forecasting, clustering, key influencers), and Copilot-assisted report creation and narrative summaries.",
      "toolB": "Redash's own documented con states it lacks the AI and semantic-layer features found in newer open source BI tools.",
      "whyItMatters": "AI-assisted report creation and natural-language querying can significantly speed up analysis for non-technical users.",
      "benefitsWho": "Business users who want to ask questions in plain English or get AI-generated report narratives benefit from Power BI."
    },
    {
      "title": "Governance & Enterprise Scale",
      "toolA": "Power BI offers row-level security, certified/endorsed datasets, deployment pipelines, and Premium Capacity licensing for large, IT-managed analytics programs.",
      "toolB": "Redash has no documented row-level security or dataset certification workflow, and has been in maintenance mode since its 2020 Databricks acquisition with infrequent releases.",
      "whyItMatters": "Large organizations need formal governance controls over who sees what data and confidence that the platform is actively maintained.",
      "benefitsWho": "IT-managed enterprise analytics programs with formal data governance requirements benefit from Power BI."
    },
    {
      "title": "Report Types & Mobile Access",
      "toolA": "Power BI supports pixel-perfect paginated reports for invoices and statements, plus native mobile apps for iOS, Android, and Windows.",
      "toolB": "Redash does not document paginated/print-format reports or native mobile apps, focusing instead on web-based dashboards.",
      "whyItMatters": "Operational reporting (invoices, statements) and on-the-go mobile access are specific needs not all BI tools cover.",
      "benefitsWho": "Organizations needing fixed-layout operational documents and mobile dashboard access benefit from Power BI."
    }
  ],
  "featureMatrix": [
    {
      "group": "Reporting & Visualization",
      "rows": [
        {
          "feature": "Interactive drag-and-drop reports",
          "toolA": "available",
          "toolB": "available",
          "note": "Redash: drag-and-drop dashboards from query results"
        },
        {
          "feature": "Paginated/print-format reports",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Natural language Q&A",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Scheduled data refresh",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Native mobile apps",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Power BI: iOS, Android, Windows"
        }
      ]
    },
    {
      "group": "Pricing & Platform",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "limited",
          "toolB": "available",
          "note": "Power BI Desktop free but no sharing; Redash fully free"
        },
        {
          "feature": "Entry collaborative-tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "Power BI Pro $10/user/month; Redash $0 self-hosted"
        },
        {
          "feature": "Mac-native authoring",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Power BI Desktop is Windows-only"
        },
        {
          "feature": "Hosted/cloud version currently available",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Redash Cloud discontinued Nov 2021"
        }
      ]
    },
    {
      "group": "AI & Enterprise Governance",
      "rows": [
        {
          "feature": "AI-assisted report creation (Copilot)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Row-level security",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Certified/endorsed datasets",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Deep Microsoft 365/Teams/SharePoint integration",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Power BI free?",
      "answer": "Power BI Desktop, the report-authoring app, is free to download and use. Sharing reports with others, scheduling refreshes, and collaborating in the Power BI service generally require a paid Pro ($10/user/month) or Premium license."
    },
    {
      "question": "Is Redash free?",
      "answer": "Yes, Redash is entirely free and open source with no licensing cost, though it is self-hosted only since the original Redash Cloud hosted service was discontinued in November 2021."
    },
    {
      "question": "Does Redash have AI features like Power BI's Copilot?",
      "answer": "No, Redash's own documented con states it lacks the AI and semantic-layer features found in newer open source BI tools, while Power BI includes Natural Language Q&A, AI Visuals, and Copilot-assisted report creation."
    },
    {
      "question": "Does Power BI run on Mac?",
      "answer": "Power BI Desktop is a Windows-only application. Mac users typically access reports through the Power BI service in a web browser or run Desktop via a Windows virtual machine, whereas Redash's self-hosted web app isn't tied to a specific desktop OS."
    },
    {
      "question": "Which tool is better for teams already on Microsoft 365?",
      "answer": "Power BI, due to its deep integration with Excel, Teams, SharePoint, and Azure, which lowers friction for organizations already standardized on Microsoft 365. Redash does not document comparable Microsoft ecosystem integrations."
    },
    {
      "question": "Is there a hosted version of Redash today?",
      "answer": "No, the original Redash Cloud hosted service was shut down in November 2021; only self-hosting is currently available. Power BI, by contrast, is offered as a cloud service (the Power BI service) alongside its free desktop app."
    }
  ]
};

export default microsoftPowerBiVsRedashContent;

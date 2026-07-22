import type { GroupComparisonContent } from './types';

const celoxisVsHiveVsMicrosoftProjectContent: GroupComparisonContent = {
  "verdict": "Celoxis, Hive, and Microsoft Project all handle Gantt-based scheduling and resource management, but they target different organizations. Celoxis stands out for its rare on-premise deployment option and deep what-if scenario forecasting for PMOs, Hive is the most accessible with a free tier, native chat, and an AI assistant, and Microsoft Project offers the deepest enterprise portfolio management for teams already inside Microsoft 365. Which one wins depends on whether you need data-residency control, low-cost flexibility, or Microsoft-ecosystem depth.",
  "bestFor": {
    "celoxis": "Mid-size and large PMOs that need the option of on-premise or cloud deployment, along with deep what-if scenario forecasting and trend analysis for portfolio planning.",
    "hive": "Smaller or cross-functional teams that want a flexible, chat-native, AI-assisted work management tool with a genuinely free starting tier.",
    "microsoft-project": "Large organizations already standardized on Microsoft 365 that need enterprise-grade portfolio and demand management tied into Teams and Power BI."
  },
  "highlights": [
    {
      "title": "Celoxis is the only one with an on-premise option",
      "description": "Celoxis can be deployed as self-managed on-premise software on Linux and PostgreSQL in addition to the cloud, a deployment option not documented for Hive or Microsoft Project, making it a candidate for organizations with data residency requirements.",
      "toolSlugs": [
        "celoxis"
      ]
    },
    {
      "title": "Hive is the only one with a free plan and native AI",
      "description": "Hive's Free plan covers up to 10 workspace members at no cost, and its AI Assistant is built into paid tiers starting at $5/user/month. Neither is documented for Celoxis or Microsoft Project.",
      "toolSlugs": [
        "hive"
      ]
    },
    {
      "title": "Microsoft Project's portfolio management sits on top of Microsoft 365",
      "description": "Microsoft Project's top Plan 5 tier adds portfolio selection, optimization, and demand management, all tied into Power BI reporting and Teams, but requires a separate Microsoft 365 license for most users.",
      "toolSlugs": [
        "microsoft-project"
      ]
    },
    {
      "title": "Both Celoxis and Microsoft Project support PMO-level what-if forecasting",
      "description": "Celoxis offers trend analysis and what-if scenario forecasting at the portfolio level, and Microsoft Project's Plan 5 adds capacity heat maps for similar enterprise-level planning; Hive does not document an equivalent capability.",
      "toolSlugs": [
        "celoxis",
        "microsoft-project"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Access",
      "rows": [
        {
          "feature": "On-premise / self-hosted deployment option",
          "statuses": {
            "celoxis": "available",
            "hive": "unavailable",
            "microsoft-project": "not-documented"
          }
        },
        {
          "feature": "Free plan available",
          "statuses": {
            "celoxis": "unavailable",
            "hive": "available",
            "microsoft-project": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Scheduling and Resourcing",
      "rows": [
        {
          "feature": "Gantt chart view",
          "statuses": {
            "celoxis": "available",
            "hive": "available",
            "microsoft-project": "available"
          },
          "note": "Celoxis and Microsoft Project explicitly document critical-path highlighting/analysis on their Gantt views; this is not documented for Hive."
        },
        {
          "feature": "Resource / capacity management",
          "statuses": {
            "celoxis": "available",
            "hive": "available",
            "microsoft-project": "available"
          },
          "note": "Hive gates resource and workload management behind its Teams tier and above; Microsoft Project's resource management is available from Plan 3 up."
        },
        {
          "feature": "What-if / scenario forecasting",
          "statuses": {
            "celoxis": "available",
            "hive": "not-documented",
            "microsoft-project": "available"
          },
          "note": "Microsoft Project's capacity heat maps and scenario analysis are limited to Plan 5."
        }
      ]
    },
    {
      "group": "Collaboration and AI",
      "rows": [
        {
          "feature": "Native team chat",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "available",
            "microsoft-project": "unavailable"
          },
          "note": "Microsoft Project relies on Teams integration for conversation rather than a documented native chat feature."
        },
        {
          "feature": "AI assistant",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "available",
            "microsoft-project": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Portfolio and PMO",
      "rows": [
        {
          "feature": "Portfolio-level PMO reporting",
          "statuses": {
            "celoxis": "available",
            "hive": "available",
            "microsoft-project": "available"
          },
          "note": "Hive's portfolio view and Portfolios feature are available from its Teams tier; Microsoft Project's portfolio selection and optimization are limited to Plan 5."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Celoxis, Hive, and Microsoft Project can be deployed on-premise?",
      "answer": "Only Celoxis. It offers both cloud-hosted and self-managed on-premise deployment on Linux and PostgreSQL; Hive and Microsoft Project are documented as cloud-based products."
    },
    {
      "question": "Which has a free plan?",
      "answer": "Hive has a Free plan for up to 10 workspace members. Celoxis has no free tier and requires a minimum of five full-access users, and Microsoft Project's cheapest tier, Project Plan 1, starts at $10/user/month with no free plan documented."
    },
    {
      "question": "Which is best for a PMO managing multiple projects at once?",
      "answer": "Celoxis and Microsoft Project both document portfolio-level reporting and what-if scenario forecasting aimed at PMOs, with Microsoft Project's deepest portfolio tools reserved for its top Plan 5 tier."
    },
    {
      "question": "Does any of them include a built-in AI assistant?",
      "answer": "Hive is the only one of the three with a documented AI Assistant, available from its Starter tier at $5/user/month."
    },
    {
      "question": "Which integrates most tightly with Microsoft 365?",
      "answer": "Microsoft Project, since it is a Microsoft product that connects natively to Teams, Power BI, and Entra ID, and requires an underlying Microsoft 365 license for most production users."
    },
    {
      "question": "How do minimum seats and entry pricing compare?",
      "answer": "Celoxis requires a minimum of five full-access users starting at $10/user/month, Hive has no minimum and a free tier before paid plans start at $5/user/month, and Microsoft Project has no documented minimum with entry pricing at $10/user/month."
    }
  ]
};

export default celoxisVsHiveVsMicrosoftProjectContent;

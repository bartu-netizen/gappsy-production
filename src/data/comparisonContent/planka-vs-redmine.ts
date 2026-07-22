import type { ToolComparisonContent } from './types';

const plankaVsRedmineContent: ToolComparisonContent = {
  "verdict": "Planka is a Trello-style, real-time Kanban board tool with a free but feature-limited self-hosted Community edition, an optional managed cloud hosting tier starting at €13.00/month, and Pro-tier extras like calendar/map views and custom branding. Redmine is a broader, fully free and open-source project management and issue-tracking application (GPL v2, no feature gating) with built-in Gantt charts, wikis, time tracking, and native SCM integration, but no official managed hosting. Planka fits teams that want a lightweight, modern Kanban interface with an optional hosted option; Redmine fits teams that want a comprehensive, unrestricted, self-hosted project management suite tied closely to source control.",
  "bestForToolA": "Teams that want a modern, real-time Kanban board with unlimited boards and cards, and either want the option of managed cloud hosting or are comfortable self-hosting under Planka's Fair Use license, fit Planka.",
  "bestForToolB": "Teams needing a comprehensive, fully free, self-hosted project management suite with Gantt charts, time tracking, wikis, and native Git/SVN integration are better served by Redmine.",
  "whoNeedsBoth": "A team could realistically run both: Planka for a lightweight, real-time Kanban board that individual squads use for day-to-day task flow, alongside Redmine as the system of record for formal issue tracking, Gantt-based scheduling, and Git/SVN-linked development history across the wider organization.",
  "keyDifferences": [
    {
      "title": "Board Tool vs. Full PM Suite",
      "toolA": "Planka is purpose-built as a Kanban board tool with unlimited boards and cards in a Trello-style interface and real-time synchronization across users.",
      "toolB": "Redmine is a broader project management and issue-tracking application with Gantt charts, calendars, wikis, forums, and time tracking built in, not primarily a Kanban board.",
      "whyItMatters": "Teams that just need visual task boards may find Redmine's broader feature set unnecessary overhead, while teams needing formal scheduling and documentation may find Planka too narrow.",
      "benefitsWho": "Planka benefits teams wanting simple visual task flow; Redmine benefits teams needing formal project management and reporting."
    },
    {
      "title": "Managed Hosting Availability",
      "toolA": "Planka offers official managed cloud hosting for both Community and Pro editions, starting at €13.00/month base plus €2.60-2.90 per user/month.",
      "toolB": "Redmine has no official managed cloud plan; the redmine.org project is self-hosted only, requiring ongoing server and technical maintenance.",
      "whyItMatters": "Teams without infrastructure resources may prefer a managed option rather than running their own server.",
      "benefitsWho": "Smaller teams or non-technical organizations that don't want to self-host."
    },
    {
      "title": "Free-Tier Licensing Restrictions",
      "toolA": "Planka's free Community Self-Hosted edition is capped by a Fair Use license that prohibits cross-company use and withholds calendar/map views, recurring cards, and custom branding, all reserved for the paid Pro tier.",
      "toolB": "Redmine is fully free and open source under GPL v2 with no feature gating and no cross-company use restrictions.",
      "whyItMatters": "License restrictions can matter for consultancies or agencies managing multiple client organizations on one instance.",
      "benefitsWho": "Consultancies, agencies, or multi-entity organizations needing to serve multiple companies from one self-hosted instance benefit from Redmine's unrestricted license."
    },
    {
      "title": "Time Tracking",
      "toolA": "Planka's documented feature set does not include native time tracking.",
      "toolB": "Redmine includes native time tracking, letting teams log and report time spent on issues and projects.",
      "whyItMatters": "Time tracking is often required for billing, capacity planning, or client reporting.",
      "benefitsWho": "Consultancies and teams that bill clients by the hour or need effort-based reporting."
    },
    {
      "title": "Source Control Integration",
      "toolA": "Planka's documented integration surface is a REST API with Swagger UI plus community Python and PHP SDKs, without native SCM integration.",
      "toolB": "Redmine natively integrates with SVN, CVS, Git, Mercurial, and Bazaar repositories.",
      "whyItMatters": "Native SCM integration links commits and code changes directly to issues without custom tooling.",
      "benefitsWho": "Software development teams that want commit history tied directly to their issue tracker."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Hosting",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "available",
          "note": "Planka Community edition has Fair Use restrictions; Redmine is unrestricted GPL v2"
        },
        {
          "feature": "Official managed cloud hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Planka from €13.00/month base"
        },
        {
          "feature": "Cross-company use on free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Planka Community edition prohibits it"
        }
      ]
    },
    {
      "group": "Core Task/Project Management",
      "rows": [
        {
          "feature": "Kanban boards",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Gantt charts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Time tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Calendar views",
          "toolA": "limited",
          "toolB": "available",
          "note": "Planka Pro tier only"
        },
        {
          "feature": "Custom fields",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Collaboration & Integration",
      "rows": [
        {
          "feature": "Real-time board sync",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Wikis",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SCM integration (Git/SVN/etc.)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Git, SVN, CVS, Mercurial, Bazaar"
        },
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "available",
          "note": "Planka has Swagger UI; Redmine supports XML/JSON"
        },
        {
          "feature": "Multilingual interface",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Planka: 35+ languages"
        },
        {
          "feature": "Plugin ecosystem",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Large Redmine community plugin ecosystem"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Planka or Redmine free?",
      "answer": "Both have free self-hosted options: Planka's Community Self-Hosted edition (with Fair Use license restrictions) and Redmine (fully free under GPL v2 with no restrictions)."
    },
    {
      "question": "Does either offer managed cloud hosting?",
      "answer": "Planka does, starting at €13.00/month base plus per-user fees for both Community and Pro editions. Redmine has no official managed cloud plan; it's self-hosted only."
    },
    {
      "question": "Which has native Git integration?",
      "answer": "Redmine has native SCM integration supporting Git, SVN, CVS, Mercurial, and Bazaar. Planka's integration surface is a documented REST API without native SCM support."
    },
    {
      "question": "Which is better for formal project scheduling?",
      "answer": "Redmine, with built-in Gantt charts, calendars, and time tracking. Planka is a Kanban board tool and does not document Gantt charts or time tracking."
    },
    {
      "question": "Can Planka's Community edition be used across multiple client companies?",
      "answer": "No, Planka's Community Self-Hosted edition's Fair Use license prohibits cross-company use; cross-company use requires the paid Pro tier. Redmine's GPL v2 license has no such restriction."
    },
    {
      "question": "How is Planka deployed?",
      "answer": "Planka is commonly deployed via Docker, with over 8.1 million image pulls reported, and its source code is publicly available on GitHub under a fair-code licensing model."
    }
  ]
};

export default plankaVsRedmineContent;

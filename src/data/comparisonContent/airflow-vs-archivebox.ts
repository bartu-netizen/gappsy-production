import type { ToolComparisonContent } from './types';

const airflowVsArchiveboxContent: ToolComparisonContent = {
  "verdict": "Airflow orchestrates and schedules data/task pipelines; ArchiveBox preserves web content, such as pages, bookmarks, and social posts, in durable multi-format archives. They serve different purposes, though ArchiveBox's own archiving runs could plausibly be triggered on a schedule by a tool like Airflow.",
  "bestForToolA": "Teams needing to programmatically author, schedule, and monitor multi-step data or task pipelines with automatic retries.",
  "bestForToolB": "Individuals, researchers, or organizations wanting to self-host durable, redundant archives of web pages, bookmarks, RSS feeds, and social posts in multiple formats (HTML, PDF, PNG, WARC, JSON, SQLite).",
  "whoNeedsBoth": "A team could use Airflow to schedule recurring ArchiveBox runs — for example, a nightly DAG that feeds a list of URLs into ArchiveBox to keep an institutional or research archive continuously up to date.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Schedules and monitors general-purpose workflows/pipelines.",
      "toolB": "Specifically preserves web content — pages, bookmarks, RSS feeds, social posts, media, evidence, research sources — in durable multi-format archives.",
      "whyItMatters": "ArchiveBox is a purpose-built archiving tool, not a general workflow engine, so it can't replace Airflow's broader scheduling role and vice versa.",
      "benefitsWho": "Teams needing durable web archiving specifically benefit from ArchiveBox; teams needing general pipeline scheduling benefit from Airflow."
    },
    {
      "title": "Output Formats",
      "toolA": "Does not produce archival output itself — it orchestrates tasks that may call other systems.",
      "toolB": "Saves each page as a screenshot, PDF, raw HTML, WARC, JSON, SQLite, and other formats simultaneously for redundancy.",
      "whyItMatters": "ArchiveBox's multi-format redundancy is specifically built for long-term preservation and evidentiary use, a capability Airflow doesn't offer natively.",
      "benefitsWho": "Researchers, legal/compliance teams, and archivists needing redundant, durable records."
    },
    {
      "title": "Hosting",
      "toolA": "Facts don't describe an official hosted offering.",
      "toolB": "Explicitly has no managed cloud version to skip server setup.",
      "whyItMatters": "Both tools are self-hosted, so teams adopting either should plan for self-managed infrastructure.",
      "benefitsWho": "Infra teams budgeting hosting and maintenance time for either or both tools."
    },
    {
      "title": "Community Support Channel",
      "toolA": "Backed by the Apache Software Foundation's dedicated security team and sponsorship program, with a large community holding regular in-person meetups.",
      "toolB": "Provides a public Zulip community for support and discussion.",
      "whyItMatters": "Support channel style differs — informal community chat for ArchiveBox versus foundation-level security and sponsorship backing for Airflow.",
      "benefitsWho": "Teams weighing how much formal governance and support backing they need."
    },
    {
      "title": "Failure Handling",
      "toolA": "Automatically retries failed tasks and triggers alerts on failure.",
      "toolB": "Documented features focus on capture and redundant storage rather than retry/alerting logic for the archiving process itself.",
      "whyItMatters": "If archiving needs to run reliably and unattended, pairing ArchiveBox with a scheduler like Airflow adds the retry/alerting layer ArchiveBox doesn't document natively.",
      "benefitsWho": "Teams running unattended, mission-critical archiving jobs."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Deployment",
      "rows": [
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Self-hosted only (no managed cloud)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Community support channel",
          "toolA": "available",
          "toolB": "available",
          "note": "Airflow: ASF community/meetups; ArchiveBox: public Zulip chat"
        }
      ]
    },
    {
      "group": "Workflow Orchestration",
      "rows": [
        {
          "feature": "DAG-based pipeline authoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automatic retries & failure alerting",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Scheduled/triggered execution",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Web Archiving",
      "rows": [
        {
          "feature": "Multi-format page capture (HTML/PDF/PNG/WARC/JSON/SQLite)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Bookmark/RSS feed archiving",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Social post archiving",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Redundant simultaneous format storage",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can ArchiveBox schedule its own archiving runs like Airflow schedules pipelines?",
      "answer": "The facts don't document built-in scheduling within ArchiveBox itself; pairing it with a scheduler like Airflow is one way teams could automate recurring archive runs."
    },
    {
      "question": "Are both tools free and self-hosted?",
      "answer": "Yes — Airflow is a free Apache Software Foundation project, and ArchiveBox is free, open source, and self-hosted with no managed cloud version."
    },
    {
      "question": "What formats does ArchiveBox save pages in?",
      "answer": "HTML, PDF, PNG, WARC, JSON, SQLite, and filesystem formats, all saved simultaneously for redundancy."
    },
    {
      "question": "Does ArchiveBox handle failures and retries the way Airflow does?",
      "answer": "This isn't documented — ArchiveBox's featured capabilities focus on capture and redundant storage, not retry/alerting logic, which is where Airflow's automatic retries and failure alerting would complement it."
    },
    {
      "question": "Where can I get help with each tool?",
      "answer": "ArchiveBox offers a public Zulip community chat; Airflow is backed by the Apache Software Foundation's dedicated security team and a large community with regular in-person meetups."
    },
    {
      "question": "What kinds of content can ArchiveBox archive?",
      "answer": "Websites, bookmarks, RSS feeds, social posts, media, evidence, research sources, and institutional records."
    }
  ]
};

export default airflowVsArchiveboxContent;

import type { ToolComparisonContent } from './types';

const notionVsWebrecorderContent: ToolComparisonContent = {
  "verdict": "Notion is an AI-powered workspace for docs, wikis, project management, and databases that teams use to run their company day to day. Webrecorder is a nonprofit suite of open-source web archiving tools — Browsertrix, ArchiveWeb.page, and ReplayWeb.page — built for capturing and replaying web pages, including login-protected and interactive content, for long-term digital preservation. These tools rarely compete: one organizes team work, the other preserves the web.",
  "bestForToolA": "Notion fits teams that want a single connected workspace with flexible database views, AI-assisted writing, and AI Q&A over their own content, priced from Free up to $20 per member/month for Business.",
  "bestForToolB": "Webrecorder fits libraries, universities, governments, and cultural organizations that need to capture and replay complex, interactive, or login-protected web pages for digital preservation, using free tools like ArchiveWeb.page and ReplayWeb.page or the tiered Browsertrix crawling platform.",
  "whoNeedsBoth": "A research or archival team could use Webrecorder's tools to capture and preserve web-based sources at scale, then organize project plans, findings, and documentation about that archival work inside a Notion workspace.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Notion combines block-based pages, flexible databases, docs, and project management into one workspace for running team operations.",
      "toolB": "Webrecorder builds specialized tools for capturing and replaying web pages — including interactive, social media, and login-protected content — for digital preservation.",
      "whyItMatters": "Choosing between a productivity workspace and a specialized web-archiving toolkit depends entirely on whether the goal is organizing team work or preserving web content.",
      "benefitsWho": "Teams running day-to-day operations benefit from Notion; libraries, universities, and archival institutions benefit from Webrecorder's purpose-built tools."
    },
    {
      "title": "Pricing Model",
      "toolA": "Notion is freemium with a Free plan, then Plus at $10 per member/month, Business at $20 per member/month, and custom Enterprise pricing.",
      "toolB": "Webrecorder mixes free and paid components: ArchiveWeb.page and ReplayWeb.page are free, while Browsertrix (the automated crawling platform) offers a free trial with paid, tiered plans beyond that.",
      "whyItMatters": "Understanding which specific components are free versus paid matters for budgeting large-scale archiving projects versus everyday workspace use.",
      "benefitsWho": "Casual users capturing individual pages benefit from Webrecorder's free tools; organizations needing automated, large-scale crawling budget for Browsertrix; teams needing a workspace budget per-seat for Notion."
    },
    {
      "title": "Target User Base",
      "toolA": "Notion's documented use case is general team collaboration across docs, wikis, and project management.",
      "toolB": "Webrecorder is run by a nonprofit and documented as used by libraries, universities, governments, and cultural organizations for digital preservation.",
      "whyItMatters": "Tools built for a specific institutional mission (preservation) often have deeper capabilities for that mission than general-purpose software.",
      "benefitsWho": "Archival and preservation institutions benefit from Webrecorder's mission-built tools; general business teams benefit from Notion's broad applicability."
    },
    {
      "title": "Handling Complex Web Content",
      "toolA": "Notion's facts do not document any capability to capture or archive external web pages.",
      "toolB": "Webrecorder's tools can archive pages that require a login, along with interactive and social media content, and use deduplication technology to reduce storage requirements for large archives.",
      "whyItMatters": "Simple crawlers often miss dynamic, login-gated, or interactive web content, which is exactly what Webrecorder is built to capture.",
      "benefitsWho": "Anyone needing to preserve complex or gated web content benefits specifically from Webrecorder; this isn't a Notion use case."
    },
    {
      "title": "Open Source Availability",
      "toolA": "Notion's facts do not document it as open source.",
      "toolB": "Webrecorder provides open-source libraries, command-line tools, and file format specifications on GitHub, alongside its free ArchiveWeb.page and ReplayWeb.page tools.",
      "whyItMatters": "Open-source availability lets technical teams build custom archiving pipelines and inspect exactly how capture and replay work.",
      "benefitsWho": "Developers and technical archivists benefit from Webrecorder's open-source tooling."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Capture vs Workspace",
      "rows": [
        {
          "feature": "Web page archiving/capture",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Login-protected page capture",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Block-based pages / docs",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Flexible database views",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automated large-scale crawling",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Webrecorder's Browsertrix platform"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-assisted writing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI Q&A over your own content",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Deduplication for storage efficiency",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Free tier/tools available",
          "toolA": "available",
          "toolB": "available",
          "note": "Notion Free plan; Webrecorder's ArchiveWeb.page and ReplayWeb.page are free"
        },
        {
          "feature": "Paid tiered plans",
          "toolA": "available",
          "toolB": "available",
          "note": "Notion: $10-$20/member/month; Browsertrix: paid tiers beyond free trial"
        },
        {
          "feature": "Open-source tools/specs on GitHub",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Nonprofit-run",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Notion and Webrecorder used for the same purpose?",
      "answer": "No. Notion is a workspace for docs, wikis, and project management. Webrecorder is a suite of tools for capturing and replaying web pages for digital preservation. They serve entirely different needs."
    },
    {
      "question": "Is Webrecorder free like Notion's free plan?",
      "answer": "Partially. ArchiveWeb.page and ReplayWeb.page are free Webrecorder tools. Browsertrix, its automated crawling platform, offers a free trial but then requires a paid, tiered plan. Notion offers a hosted Free plan, with paid tiers from $10 per member/month."
    },
    {
      "question": "Can Webrecorder capture pages that require a login?",
      "answer": "Yes — Webrecorder's tools are built to capture login-protected pages and interactive content, including social media posts, which simple crawlers typically miss."
    },
    {
      "question": "Who uses Webrecorder?",
      "answer": "Webrecorder is used by libraries, universities, governments, and cultural organizations for digital preservation, run by a nonprofit focused on that mission."
    },
    {
      "question": "Does Notion have web archiving features like Webrecorder?",
      "answer": "No — Notion's documented features center on docs, databases, and AI-assisted writing and Q&A, with no web-page capture or archiving capability documented."
    },
    {
      "question": "Is Webrecorder open source?",
      "answer": "Yes, its developer tools, libraries, and file format specifications are open source and available on GitHub, in addition to the free ArchiveWeb.page and ReplayWeb.page apps."
    }
  ]
};

export default notionVsWebrecorderContent;

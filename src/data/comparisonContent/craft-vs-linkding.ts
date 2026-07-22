import type { ToolComparisonContent } from './types';

const craftVsLinkdingContent: ToolComparisonContent = {
  "verdict": "Craft is a hosted notes and docs app for writing, planning, and AI-assisted content creation across Docs, Tasks, Calendar, and Whiteboards, built for individuals and small teams who want a polished, synced writing environment. Linkding is a free, self-hosted bookmark manager built to run in a single Docker container, focused narrowly on saving, tagging, and archiving links rather than authoring content. They overlap only at the edges — Craft is for creating documents, Linkding is for collecting and retrieving URLs you've already found.",
  "bestForToolA": "Craft fits individuals and small teams who want AI-assisted writing (Core/Fast/Max models), whiteboards, and templates in a managed, cross-device-synced app — its Free plan includes 1,500 blocks, 1GB storage, and 15 AI credits.",
  "bestForToolB": "Linkding fits developers and self-hosters who want a completely free, minimal bookmark archive with automatic metadata fetching, website archiving, and a REST API, deployed in one Docker container with SQLite.",
  "whoNeedsBoth": "A researcher could save and archive source links in Linkding (using its automatic metadata fetching and website archiving) and then write the actual analysis, summary, or report from those sources as a document in Craft.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "Craft is a fully hosted, cross-device-synced SaaS app with no self-hosting option documented.",
      "toolB": "Linkding requires self-hosting, deployed as a single Docker container using SQLite, with no official managed cloud version.",
      "whyItMatters": "Self-hosting shifts operational responsibility (backups, updates, uptime) onto the user in exchange for data control and zero subscription cost.",
      "benefitsWho": "Privacy-conscious self-hosters and homelab users benefit from Linkding's model, while non-technical users benefit from Craft's fully managed sync."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Craft's Free plan caps out at 1,500 blocks, 1GB storage, and 15 AI credits; Plus is €4.8/month billed monthly (€8.0/month billed yearly), Family is €9.0/month, and Team is €50.0/month.",
      "toolB": "Linkding has no pricing plans documented at all — it is free, open-source software with no paid tier.",
      "whyItMatters": "Craft's usage caps and AI credit limits mean cost scales with content volume and AI use, while Linkding has no billing to plan around beyond hosting infrastructure.",
      "benefitsWho": "Budget-conscious technical users benefit from Linkding's zero-cost model, while users wanting a managed product with support benefit from Craft's paid tiers."
    },
    {
      "title": "Core Purpose",
      "toolA": "Craft centers on content creation: Docs, Tasks embedded in documents, a built-in Calendar, Whiteboards for visual collaboration, and Publish & Share for direct publishing.",
      "toolB": "Linkding centers on content retrieval: automatic metadata fetching (title, description, icon, preview image), bulk editing, and Netscape HTML import/export for bookmark libraries.",
      "whyItMatters": "Choosing the wrong category tool means either drafting documents in a bookmark manager or trying to archive links inside a notes app — neither works well.",
      "benefitsWho": "Writers and planners benefit from Craft; people managing large personal or team link libraries benefit from Linkding."
    },
    {
      "title": "AI Writing Features",
      "toolA": "Craft includes \"Write with AI\" with access to Core, Fast, and Max AI models on paid plans, plus 15 AI credits on the Free plan and 50 monthly AI credits on Plus.",
      "toolB": "Linkding does not document any AI writing or summarization features.",
      "whyItMatters": "AI-assisted drafting and editing is a differentiator for content creation but irrelevant to a tool whose job is just storing links.",
      "benefitsWho": "Writers who want AI help drafting content benefit from Craft; this dimension doesn't apply to Linkding's use case."
    },
    {
      "title": "API and Extensibility",
      "toolA": "Craft integrates with external AI tools — Claude, ChatGPT, Cursor, VS Code, and Apple Shortcuts — but does not document its own REST API.",
      "toolB": "Linkding ships official browser extensions for Firefox and Chrome plus a REST API for building custom scripts and third-party integrations.",
      "whyItMatters": "A documented REST API lets teams automate saving, tagging, or syncing bookmarks programmatically, which matters for building custom workflows.",
      "benefitsWho": "Developers building automation around saved links benefit from Linkding's REST API; users who live inside other AI tools benefit from Craft's integrations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & Organization",
      "rows": [
        {
          "feature": "Rich document/notes editing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Craft's Docs feature; Linkding has no document editor"
        },
        {
          "feature": "Bookmark management with metadata",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linkding auto-fetches title, description, icon, preview image"
        },
        {
          "feature": "Task management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Craft embeds tasks directly in documents"
        },
        {
          "feature": "Website archiving / offline snapshots",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linkding creates local HTML snapshots or archives via Internet Archive"
        },
        {
          "feature": "Whiteboards",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "Built-in AI writing assistant",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Core/Fast/Max AI models"
        },
        {
          "feature": "Third-party AI tool integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft connects to Claude, ChatGPT, Cursor, VS Code, Apple Shortcuts"
        },
        {
          "feature": "REST API",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Bulk editing across items",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linkding supports bulk tagging, archiving, deletion"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft: 1,500 blocks/1GB/15 AI credits; Linkding: fully free"
        },
        {
          "feature": "Self-hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Linkding requires it; Craft doesn't offer it"
        },
        {
          "feature": "Multi-user / team plans",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft Family (2-6 accounts, €9/mo) and Team (up to 10, €50/mo); Linkding has built-in multi-user support"
        },
        {
          "feature": "Official browser extensions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linkding: Firefox and Chrome"
        },
        {
          "feature": "Import/export",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linkding supports Netscape HTML bookmark format"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Craft or Linkding free to use?",
      "answer": "Both have free options, but they work differently. Craft's Free plan is capped at 1,500 blocks of content, 1GB storage, and 15 AI credits, with paid Plus/Family/Team tiers for more. Linkding is entirely free and open source with no pricing plans at all, though you must provide your own hosting."
    },
    {
      "question": "Can I self-host Craft the way I self-host Linkding?",
      "answer": "No self-hosting option is documented for Craft — it's a hosted SaaS app. Linkding, by contrast, requires self-hosting and is designed to run in a single Docker container with SQLite."
    },
    {
      "question": "Does either tool have AI features?",
      "answer": "Craft has AI features documented, including a \"Write with AI\" tool with Core, Fast, and Max models and monthly AI credits. Linkding does not document any AI functionality."
    },
    {
      "question": "Which tool has an API for automation?",
      "answer": "Linkding documents a REST API for building custom scripts and third-party integrations. Craft does not document a public REST API, though it integrates with external AI tools like Claude, ChatGPT, and Cursor."
    },
    {
      "question": "Can I use Craft and Linkding together?",
      "answer": "Yes — they serve different jobs. You could archive and tag research links in Linkding, then write up findings or reports as documents in Craft."
    },
    {
      "question": "Which is better for a small team?",
      "answer": "Craft offers dedicated Family (2-6 Plus accounts) and Team (up to 10 accounts) plans with Shared Space collaboration for €9/month and €50/month respectively. Linkding supports multiple user accounts with bookmark sharing built into the free, self-hosted app."
    }
  ]
};

export default craftVsLinkdingContent;

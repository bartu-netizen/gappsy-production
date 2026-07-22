import type { ToolComparisonContent } from './types';

const cronofyVsZeegContent: ToolComparisonContent = {
  "verdict": "Cronofy and Zeeg both sit in the scheduling space, but they're built for different buyers: Cronofy is developer-facing calendar and scheduling infrastructure meant to be embedded inside other products, while Zeeg is a ready-to-use end-user scheduling app distinguished by an AI voice agent that answers calls and books meetings directly.",
  "bestForToolA": "Teams building software that needs calendar sync or scheduling as an embedded feature, especially where an MCP server for agentic AI workflows, meeting transcription, or certified multi-region compliance (ISO 27001/27701/27018, SOC 2 Type 2) matters.",
  "bestForToolB": "Sales or service teams that want a ready-made booking page plus an AI phone agent that qualifies inbound callers and books meetings, with transparent per-user pricing and GDPR-only EU data hosting.",
  "whoNeedsBoth": "Companies that build products embedding calendar sync via Cronofy's API while separately running their own outward-facing appointment booking and lead qualification through Zeeg — the two solve adjacent but non-overlapping problems.",
  "keyDifferences": [
    {
      "title": "Product model: API infrastructure vs. end-user app",
      "toolA": "Calendar sync API and scheduling API meant to be embedded inside another company's software, plus pre-built UI components.",
      "toolB": "A direct, standalone scheduling app with booking pages and an AI voice agent that answers and qualifies calls.",
      "whyItMatters": "Determines whether you're buying a building block for your own product or a finished tool your team uses directly.",
      "benefitsWho": "Developers embedding scheduling (Cronofy) vs. sales/ops teams booking their own meetings (Zeeg)."
    },
    {
      "title": "AI capability focus",
      "toolA": "Meeting transcription with AI-generated summaries and an MCP server for connecting calendar data to agentic AI workflows.",
      "toolB": "An AI voice agent that answers inbound calls, has a qualifying conversation, and books the right meeting automatically.",
      "whyItMatters": "One augments developer/agent workflows after the fact; the other automates the live call-to-booking process itself.",
      "benefitsWho": "Product teams building AI features (Cronofy) vs. teams fielding inbound sales/support calls (Zeeg)."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Self-serve pricing is not published; the pricing page uses a usage-based seat calculator.",
      "toolB": "Publishes explicit per-user tiers from a free Starter plan up to €40/user/month, plus a custom Enterprise plan.",
      "whyItMatters": "Buyers who need to budget precisely without a sales call will find one tool far easier to plan around.",
      "benefitsWho": "Procurement-sensitive teams and smaller companies comparing costs upfront (favors Zeeg)."
    },
    {
      "title": "Compliance and data hosting",
      "toolA": "States ISO 27001/27701/27018 certification, SOC 2 Type 2 attestation, and data centers across the US, UK, Canada, Germany, Australia, and Singapore.",
      "toolB": "Described as GDPR-compliant with data hosted in Europe.",
      "whyItMatters": "Global enterprises with multi-region data residency needs have different requirements than EU-focused teams.",
      "benefitsWho": "Multinational SaaS vendors needing broad certifications (Cronofy) vs. EU-centric teams needing GDPR-only assurance (Zeeg)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Calendar sync across multiple providers",
          "toolA": "available",
          "toolB": "available",
          "note": "Cronofy: Google/Microsoft/Apple/Exchange; Zeeg: Google Calendar/Outlook/Office 365/Exchange/iCloud"
        },
        {
          "feature": "Developer scheduling API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Booking pages / scheduling UI",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automatic video conferencing links",
          "toolA": "available",
          "toolB": "available",
          "note": "Zeeg attaches Zoom, Google Meet, Teams, or Webex links"
        },
        {
          "feature": "Round-robin lead/meeting routing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI phone/voice agent",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Meeting transcription with AI summaries",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "MCP server for agentic AI workflows",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free tier / sandbox",
          "toolA": "available",
          "toolB": "available",
          "note": "Cronofy: 20 accounts, 24hr recording; Zeeg: 2 pages, 1 calendar"
        },
        {
          "feature": "Published self-serve pricing tiers",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Formal security certifications (ISO/SOC 2)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "GDPR compliance stated",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Cronofy or Zeeg offer a free plan?",
      "answer": "Both do — Cronofy offers a free sandbox connecting up to 20 accounts with 24 hours of meeting recording and no credit card required, while Zeeg's Starter plan is free forever with 2 scheduling pages and 1 calendar connection."
    },
    {
      "question": "Which calendars does each tool support?",
      "answer": "Cronofy syncs with Google, Microsoft, Apple, and Exchange calendars from a single integration; Zeeg integrates with Google Calendar, Outlook, Office 365, Exchange, and iCloud."
    },
    {
      "question": "Does either tool use AI?",
      "answer": "Cronofy offers an MCP server for agentic AI workflows and AI-generated meeting summaries via transcription; Zeeg's AI voice agent answers inbound calls, qualifies leads, and books meetings automatically."
    },
    {
      "question": "How is pricing structured?",
      "answer": "Cronofy doesn't publish self-serve pricing and instead uses a usage-based seat calculator on its pricing page; Zeeg publishes explicit per-user tiers from free up to €40/user/month, plus a custom Enterprise plan."
    },
    {
      "question": "What compliance certifications does each hold?",
      "answer": "Cronofy states ISO 27001/27701/27018 certification and SOC 2 Type 2 attestation with data centers across the US, UK, Canada, Germany, Australia, and Singapore; Zeeg is described as GDPR-compliant with data hosted in Europe."
    }
  ]
};

export default cronofyVsZeegContent;

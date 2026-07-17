import type { ToolComparisonContent } from './types';

const noteplanVsScrintalContent: ToolComparisonContent = {
  "verdict": "NotePlan and Scrintal both include AI-assisted note-taking, but they're organized around fundamentally different structures. NotePlan is a markdown-based notes, tasks, and calendar app that stores everything as plaintext files, aimed at daily planning within the Apple ecosystem plus web. Scrintal is a visual note-taking and research tool built on an infinite canvas for brainstorming and connecting ideas, available on Mac, Windows, and web, with a stated user base of 10,000+ learners and researchers.",
  "bestForToolA": "Users who want daily, weekly, and monthly planning notes tied to a calendar, stored as portable plaintext markdown files, with AI tools for voice-note transcription (Memo AI) and writing/summarizing (Smart Note Assistant).",
  "bestForToolB": "Researchers and learners who think visually and want an infinite canvas for brainstorming, multi-format content (PDFs, images, videos, documents), bi-directional visual links, and real-time collaboration on boards, with study/research-specific templates.",
  "whoNeedsBoth": "A researcher could use Scrintal's infinite canvas to visually map out sources, brainstorm connections, and collaborate with peers on a research board, then use NotePlan to schedule the daily writing tasks and calendar deadlines needed to turn that research into a finished paper.",
  "keyDifferences": [
    {
      "title": "Organizational Structure",
      "toolA": "NotePlan organizes content around daily, weekly, and monthly notes integrated with a calendar.",
      "toolB": "Scrintal organizes content on an Infinite Canvas, a freeform space for brainstorming without a fixed daily/calendar structure.",
      "whyItMatters": "The underlying structure determines whether the tool suits linear day-by-day planning or nonlinear visual brainstorming.",
      "benefitsWho": "Daily planners and journalers (NotePlan) versus visual thinkers and researchers mapping relationships between ideas (Scrintal)."
    },
    {
      "title": "Platform Availability",
      "toolA": "NotePlan is built primarily for the Apple ecosystem (Mac, iPhone, iPad) plus a web app, with no confirmed native Windows, Android, or Linux app.",
      "toolB": "Scrintal has native apps for Mac (Apple Silicon and Intel) and Windows, plus web access.",
      "whyItMatters": "Windows users specifically need a tool with native desktop support rather than relying on a web app.",
      "benefitsWho": "Windows-based researchers and teams, since Scrintal documents native Windows support that NotePlan lacks."
    },
    {
      "title": "Content Format",
      "toolA": "NotePlan is markdown/plaintext-centric, with content stored as plaintext markdown files.",
      "toolB": "Scrintal supports multi-format content directly on boards, including PDFs, images, notes, videos, and documents.",
      "whyItMatters": "Multi-format embedding matters for research workflows that mix source PDFs and media, while plaintext suits users who prioritize simplicity and portability.",
      "benefitsWho": "Researchers collecting varied source material (Scrintal) versus writers who want lightweight, portable text files (NotePlan)."
    },
    {
      "title": "Collaboration",
      "toolA": "NotePlan's documented features don't mention real-time multi-user collaboration.",
      "toolB": "Scrintal documents real-time collaboration for working together on boards live.",
      "whyItMatters": "Real-time collaboration is essential for teams or study groups working on shared material simultaneously.",
      "benefitsWho": "Study groups or research teams collaborating on the same canvas at once."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "NotePlan publishes clear subscription pricing: $12/month or $8.33/month billed annually ($99.99/year).",
      "toolB": "Scrintal's exact subscription pricing is not displayed as plain text on its official site, and it has no confirmed free plan.",
      "whyItMatters": "Transparent pricing lets buyers budget without contacting sales or hunting for pricing pages.",
      "benefitsWho": "Buyers who want to compare costs quickly before committing, which is easier with NotePlan's published rates."
    }
  ],
  "featureMatrix": [
    {
      "group": "Structure & Format",
      "rows": [
        {
          "feature": "Organizational model",
          "toolA": "available",
          "toolB": "available",
          "note": "NotePlan: daily/weekly/monthly notes + calendar; Scrintal: infinite canvas"
        },
        {
          "feature": "Plaintext markdown storage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-format content (PDF/video/images)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Bi-directional linking",
          "toolA": "available",
          "toolB": "available",
          "note": "Scrintal: visual arrows/links"
        }
      ]
    },
    {
      "group": "Collaboration & Platforms",
      "rows": [
        {
          "feature": "Real-time collaboration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Native Windows app",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Native Mac app",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Web app",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Pricing",
      "rows": [
        {
          "feature": "AI assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "NotePlan: Smart Note Assistant, Memo AI; Scrintal: AI Assistant for organization"
        },
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Neither has a confirmed free plan"
        },
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Scrintal price not shown as plain text"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Scrintal have a free plan?",
      "answer": "No, Scrintal's documented facts note no confirmed free plan. NotePlan also has no permanent free plan, only a 7-day free trial."
    },
    {
      "question": "Which tool supports real-time collaboration?",
      "answer": "Scrintal does, documenting real-time collaboration for working together on boards live. NotePlan's documented features don't mention real-time multi-user collaboration."
    },
    {
      "question": "Is Scrintal available on Windows?",
      "answer": "Yes, Scrintal has native apps for Mac and Windows plus web access. NotePlan has no confirmed native Windows app."
    },
    {
      "question": "How do the AI features compare?",
      "answer": "NotePlan's AI tools include a Smart Note Assistant for writing/summarizing and Memo AI for turning voice notes into structured insights. Scrintal's AI Assistant automates repetitive organizational tasks on the canvas, a different AI use case suited to its different structure."
    },
    {
      "question": "Which tool publishes clear pricing?",
      "answer": "NotePlan does: $12/month or $8.33/month billed annually. Scrintal's exact subscription pricing is not displayed as plain text on its official site, per its documented cons."
    },
    {
      "question": "Which is better for visual brainstorming versus daily planning?",
      "answer": "Scrintal's infinite canvas is built for visual brainstorming and connecting ideas, while NotePlan's daily/weekly/monthly notes integrated with a calendar suit structured daily planning."
    }
  ]
};

export default noteplanVsScrintalContent;

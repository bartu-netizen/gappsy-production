import type { ToolComparisonContent } from './types';

const siyuanVsTriliumNotesContent: ToolComparisonContent = {
  "verdict": "SiYuan and Trilium Notes are both self-hosted, open-source personal knowledge base apps, but they organize information differently and price access differently. Trilium uses a hierarchical tree structure with note cloning and is completely free with no paid tier ever; SiYuan uses block-level editing with bidirectional linking and a knowledge graph, and reserves official cloud sync for one-time paid PRO ($64) or Subscription ($148) tiers.",
  "bestForToolA": "SiYuan fits users who want a graph-oriented, block-based note structure with built-in FSRS spaced-repetition flashcards and native mobile apps for iOS, Android, and HarmonyOS.",
  "bestForToolB": "Trilium Notes fits users who prefer a hierarchical, tree-based note organization, need to encrypt individual notes with AES-128-CBC, or are managing very large note collections (documented at 100,000+ notes) without ever paying.",
  "whoNeedsBoth": "There's no clearly documented complementary scenario here - both are full personal knowledge base apps competing for the same core job, so most users would pick one as their primary note system rather than running both in parallel.",
  "keyDifferences": [
    {
      "title": "Pricing & Licensing",
      "toolA": "SiYuan's core is free (AGPL-3.0), but official cloud sync requires a one-time paid PRO ($64) or Subscription ($148) tier.",
      "toolB": "Trilium Notes is fully free and open source with no paid tier at all, for any feature.",
      "whyItMatters": "Whether advanced features are ever gated behind payment changes total cost of ownership over time.",
      "benefitsWho": "Users who want to guarantee zero future cost benefit from Trilium's fully free model."
    },
    {
      "title": "Note Structure Model",
      "toolA": "SiYuan uses block-level editing with bidirectional linking, backlinks, and a knowledge graph to connect notes non-hierarchically.",
      "toolB": "Trilium organizes notes in a tree structure, with the ability to clone a single note into multiple locations in the hierarchy.",
      "whyItMatters": "A graph-based versus tree-based mental model changes how users navigate and structure large note collections.",
      "benefitsWho": "Users who think in networks of linked ideas benefit from SiYuan's graph model; users who prefer strict hierarchical folders benefit from Trilium's tree with cloning."
    },
    {
      "title": "Native Mobile Support",
      "toolA": "SiYuan has native apps for iOS, Android, and HarmonyOS, alongside Windows/macOS/Linux desktop and Docker/web deployment.",
      "toolB": "Trilium has no official mobile app; only an unofficial community Android client (TriliumDroid) and PWA browser support exist.",
      "whyItMatters": "Official native mobile apps typically offer more reliable performance and support than unofficial community clients.",
      "benefitsWho": "Users who need dependable on-the-go note access benefit from SiYuan's official mobile apps."
    },
    {
      "title": "Spaced Repetition & Study Tools",
      "toolA": "SiYuan has built-in flashcard review using the FSRS spaced-repetition algorithm.",
      "toolB": "No flashcard or spaced-repetition feature is documented for Trilium Notes.",
      "whyItMatters": "Built-in spaced repetition turns a notes app into a study tool without needing a separate flashcard app.",
      "benefitsWho": "Students and lifelong learners reviewing material over time benefit from SiYuan's flashcard system."
    },
    {
      "title": "Note Encryption",
      "toolA": "Individual note encryption is not documented for SiYuan; privacy instead relies on self-hosting and local data control.",
      "toolB": "Trilium supports password-protecting individual notes using AES-128-CBC encryption.",
      "whyItMatters": "Per-note encryption lets users protect specific sensitive content without encrypting an entire vault or relying solely on server access control.",
      "benefitsWho": "Users storing sensitive personal or financial notes benefit from Trilium's per-note password protection."
    }
  ],
  "featureMatrix": [
    {
      "group": "Note Organization & Editing",
      "rows": [
        {
          "feature": "Hierarchical/tree notes with cloning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Block-level editing (20+ block elements)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multiple note types (canvas, Mermaid, mindmap, code)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Note revisions/versioning",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Trilium: automatic background versioning with undo"
        },
        {
          "feature": "Database/table/collection views",
          "toolA": "available",
          "toolB": "available",
          "note": "Trilium adds calendar, Kanban, geomap, presentation views"
        }
      ]
    },
    {
      "group": "Knowledge Tools",
      "rows": [
        {
          "feature": "Bidirectional linking/backlinks",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Knowledge graph view",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Spaced-repetition flashcards",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "PDF annotation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "REST API and scripting",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform & Access",
      "rows": [
        {
          "feature": "Native mobile apps",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SiYuan: iOS/Android/HarmonyOS; Trilium: unofficial only"
        },
        {
          "feature": "Individual note encryption",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Trilium uses AES-128-CBC"
        },
        {
          "feature": "Self-hosted/Docker deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Paid tier for extra features",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SiYuan PRO $64 one-time / Subscription $148 one-time"
        },
        {
          "feature": "Handles very large note collections (100k+)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Trilium Notes completely free?",
      "answer": "Yes, Trilium Notes is free and open source with no paid tier at all."
    },
    {
      "question": "Does SiYuan cost money?",
      "answer": "The core app is free (AGPL-3.0), but official cloud sync requires a one-time PRO tier ($64) or Subscription tier ($148)."
    },
    {
      "question": "Which app has spaced-repetition flashcards?",
      "answer": "SiYuan, via built-in flashcard review using the FSRS algorithm. This isn't documented as a Trilium feature."
    },
    {
      "question": "Does Trilium have an official mobile app?",
      "answer": "No - Trilium has no official mobile app, only an unofficial community Android client (TriliumDroid) and PWA support for browser-based mobile access."
    },
    {
      "question": "Can I encrypt individual notes?",
      "answer": "Trilium supports password-protecting individual notes with AES-128-CBC encryption. Per-note encryption is not documented for SiYuan."
    },
    {
      "question": "Which tool is documented to handle very large note collections?",
      "answer": "Trilium Notes documents handling 100,000+ notes. A similar scale claim is not documented for SiYuan."
    }
  ]
};

export default siyuanVsTriliumNotesContent;

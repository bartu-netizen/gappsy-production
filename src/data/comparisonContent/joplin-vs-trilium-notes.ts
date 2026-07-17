import type { ToolComparisonContent } from './types';

const joplinVsTriliumNotesContent: ToolComparisonContent = {
  "verdict": "Joplin and Trilium Notes are both open-source, self-hostable note apps, but Joplin is built around a hosted subscription model (Joplin Cloud) with native mobile apps, while Trilium is a fully free, tree-structured knowledge base with no official mobile app and no paid tier at all. Joplin documents specific Cloud pricing from Basic (€2.99/month) up to Teams (€7.99/user/month); Trilium's entire feature set, including its REST API and scripting, is free.",
  "bestForToolA": "Joplin fits users who want native iOS/Android apps, a choice between Rich Text and Markdown editors, and either free sync backends (Nextcloud, Dropbox, OneDrive, WebDAV) or a paid hosted Joplin Cloud plan.",
  "bestForToolB": "Trilium Notes fits users comfortable self-hosting who want a hierarchical, cloneable note tree, per-note AES-128-CBC encryption, and a REST API with scripting for automation, all without ever paying for a tier.",
  "whoNeedsBoth": "There's no clear complementary use case documented - both target the same core job of personal note-taking, so the practical choice is Joplin for mobile-first, hosted convenience versus Trilium for self-hosted, tree-structured control.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "Joplin is freemium: the app is free, but Joplin Cloud plans run from Basic (€2.99/month, 2GB storage) to Pro (€5.99/month, 30GB), Pro 100GB (€9.99/month), and Teams (€7.99/user/month).",
      "toolB": "Trilium Notes is entirely free with no paid tier at all, for any feature.",
      "whyItMatters": "A published, tiered pricing model gives buyers predictable upgrade costs, while a fully free tool removes budgeting concerns entirely.",
      "benefitsWho": "Teams needing hosted storage and support may accept Joplin's paid tiers; individuals who never want to pay benefit from Trilium's free model."
    },
    {
      "title": "Mobile App Support",
      "toolA": "Joplin has native apps for Android and iOS, alongside Windows, macOS, Linux, and a terminal client.",
      "toolB": "Trilium has no official mobile app - only an unofficial Android client (TriliumDroid) and PWA browser support.",
      "whyItMatters": "Official native mobile apps generally offer more reliable sync and support than community-built alternatives.",
      "benefitsWho": "Users who frequently capture notes from a phone benefit from Joplin's native mobile apps."
    },
    {
      "title": "Sync Options",
      "toolA": "Joplin supports Joplin Cloud plus free alternatives: Nextcloud, Dropbox, OneDrive, or WebDAV.",
      "toolB": "Trilium requires self-hosting a Trilium server for cross-device sync; no hosted cloud sync option is documented.",
      "whyItMatters": "The range of sync backends determines how much infrastructure a user must manage themselves.",
      "benefitsWho": "Users without server experience benefit from Joplin's free consumer sync backends; self-hosters comfortable running servers can use Trilium."
    },
    {
      "title": "Note Organization Model",
      "toolA": "Joplin organizes notes into notebooks with a choice of Rich Text or Markdown editing modes; a tree/cloning structure isn't documented.",
      "toolB": "Trilium uses a hierarchical tree structure with the ability to clone a single note into multiple locations.",
      "whyItMatters": "A cloneable tree structure supports more complex cross-referenced organization than flat notebooks.",
      "benefitsWho": "Users managing very large, deeply nested note collections benefit from Trilium's tree-and-cloning model."
    },
    {
      "title": "Extensibility Model",
      "toolA": "Joplin offers a community plugin and theme ecosystem (55.6k GitHub stars) rather than a documented public REST API.",
      "toolB": "Trilium offers a REST API and custom scripting for automation directly within the app.",
      "whyItMatters": "A REST API enables programmatic automation, while a plugin ecosystem favors ready-made community extensions.",
      "benefitsWho": "Developers wanting to script and automate their notes benefit from Trilium's REST API; users wanting ready-made add-ons benefit from Joplin's plugin ecosystem."
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage & Sync",
      "rows": [
        {
          "feature": "Free sync backends (non-cloud)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Joplin: Nextcloud, Dropbox, OneDrive, WebDAV"
        },
        {
          "feature": "Paid hosted cloud sync",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Joplin Cloud from €2.99/month"
        },
        {
          "feature": "Note/data encryption",
          "toolA": "available",
          "toolB": "available",
          "note": "Joplin: E2EE; Trilium: AES-128-CBC per note"
        },
        {
          "feature": "Self-hosted server option",
          "toolA": "limited",
          "toolB": "available",
          "note": "Joplin Server for teams requires additional setup"
        }
      ]
    },
    {
      "group": "Editing & Organization",
      "rows": [
        {
          "feature": "Hierarchical tree notes with cloning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Rich Text + Markdown editor toggle",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multiple note types (canvas, Mermaid, mindmap)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Web clipper",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Note revisions/versioning",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platforms & Extensibility",
      "rows": [
        {
          "feature": "Native mobile apps",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Terminal/CLI client",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "REST API & scripting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Plugin/theme ecosystem",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Notebook/note sharing collaboration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Joplin Pro plan adds notebook sharing"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What does Joplin Cloud cost?",
      "answer": "Basic is €2.99/month (2GB storage), Pro is €5.99/month (30GB), Pro 100GB is €9.99/month, and Teams is €7.99/user/month."
    },
    {
      "question": "Is Trilium Notes completely free?",
      "answer": "Yes, Trilium is always free and open source with no paid tier, unlike Joplin's optional paid Cloud plans."
    },
    {
      "question": "Does Trilium have a mobile app?",
      "answer": "Not an official one - only an unofficial community Android client (TriliumDroid) and PWA browser support, versus Joplin's native Android and iOS apps."
    },
    {
      "question": "Can I sync Joplin without paying?",
      "answer": "Yes - Joplin supports free sync via Nextcloud, Dropbox, OneDrive, or WebDAV, in addition to the paid Joplin Cloud option."
    },
    {
      "question": "Which app has a REST API for automation?",
      "answer": "Trilium documents a REST API and custom scripting for automation. A public REST API is not documented for Joplin."
    },
    {
      "question": "Which tool is documented to handle very large note collections better?",
      "answer": "Trilium Notes documents handling 100,000+ notes. Joplin doesn't document a similar scale claim in the available facts."
    }
  ]
};

export default joplinVsTriliumNotesContent;

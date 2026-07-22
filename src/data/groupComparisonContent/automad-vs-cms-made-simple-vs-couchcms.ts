import type { GroupComparisonContent } from './types';

const automadVsCmsMadeSimpleVsCouchcmsContent: GroupComparisonContent = {
  "verdict": "All three are free, self-hosted PHP content platforms aimed at developers and designers rather than large marketing teams, but they take different architectural paths. Automad stores content as flat text files with no database, CMS Made Simple uses a MySQL-backed Smarty templating layer with a Module Manager for e-commerce and forms, and CouchCMS turns an existing hand-coded HTML/CSS template into an editable MySQL-backed site through embedded tags. Automad suits developers wanting database-free portability, CMS Made Simple suits teams wanting a fuller-featured, extensible CMS, and CouchCMS suits designers who want to keep their own markup rather than adopting a new theming system.",
  "bestFor": {
    "automad": "Developers who want a database-free, git-friendly CMS with a page-tree content structure.",
    "cms-made-simple": "Developers and agencies who want a mature, module-extensible CMS with real-time content editing and permissions.",
    "couchcms": "Designers with a hand-built HTML/CSS site who want to turn it into an editable CMS without adopting an unfamiliar theming layer."
  },
  "highlights": [
    {
      "title": "No-database portability",
      "description": "Automad's plain-text content files can be version-controlled and moved without a database, unlike CMS Made Simple or CouchCMS.",
      "toolSlugs": [
        "automad"
      ]
    },
    {
      "title": "Converts existing templates directly",
      "description": "CouchCMS is built to couchify an already-built HTML/CSS template into an editable site rather than requiring a new theming system.",
      "toolSlugs": [
        "couchcms"
      ]
    },
    {
      "title": "Module-driven extensibility",
      "description": "CMS Made Simple's Module Manager adds e-commerce, forms, and gallery functionality that neither Automad nor CouchCMS documents natively.",
      "toolSlugs": [
        "cms-made-simple"
      ]
    },
    {
      "title": "Fully free and open source",
      "description": "Automad (MIT), CMS Made Simple (GPL-3.0), and CouchCMS's core (CPAL) are all free to self-host, with only CouchCMS offering an optional paid tier for white-labeling.",
      "toolSlugs": [
        "automad",
        "cms-made-simple",
        "couchcms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture",
      "rows": [
        {
          "feature": "Database required",
          "statuses": {
            "automad": "unavailable",
            "cms-made-simple": "available",
            "couchcms": "available"
          },
          "note": "Both CMS Made Simple and CouchCMS use MySQL; Automad is entirely flat-file."
        },
        {
          "feature": "Converts an existing HTML/CSS template into an editable site",
          "statuses": {
            "automad": "not-documented",
            "cms-made-simple": "unavailable",
            "couchcms": "available"
          }
        }
      ]
    },
    {
      "group": "Content and Users",
      "rows": [
        {
          "feature": "Granular multi-user permissions",
          "statuses": {
            "automad": "not-documented",
            "cms-made-simple": "available",
            "couchcms": "not-documented"
          }
        },
        {
          "feature": "Built-in visitor comments with moderation",
          "statuses": {
            "automad": "not-documented",
            "cms-made-simple": "not-documented",
            "couchcms": "available"
          }
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Official module or extension manager",
          "statuses": {
            "automad": "not-documented",
            "cms-made-simple": "available",
            "couchcms": "not-documented"
          }
        },
        {
          "feature": "Multilingual site support",
          "statuses": {
            "automad": "available",
            "cms-made-simple": "not-documented",
            "couchcms": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three needs no database?",
      "answer": "Automad, which stores all content as plain text files rather than in MySQL."
    },
    {
      "question": "Which is best for turning a pre-built HTML template into an editable site?",
      "answer": "CouchCMS, which is specifically designed to couchify existing markup rather than requiring a rebuild."
    },
    {
      "question": "Which has a built-in module manager for e-commerce or forms?",
      "answer": "CMS Made Simple, through its in-admin Module Manager."
    },
    {
      "question": "Does CouchCMS require attribution in its free version?",
      "answer": "Yes, the free version keeps an attribution credit visible in the source code, and that credit only goes away once a paid commercial license is bought."
    },
    {
      "question": "Which supports multiple languages for site content?",
      "answer": "Automad has built-in multilingual support; multilingual capabilities for CMS Made Simple and CouchCMS are not documented."
    },
    {
      "question": "Are all three free to self-host?",
      "answer": "Yes, Automad and CMS Made Simple are entirely free, and CouchCMS's core codebase is free under CPAL, with an optional paid commercial license available for white-labeling."
    }
  ]
};

export default automadVsCmsMadeSimpleVsCouchcmsContent;

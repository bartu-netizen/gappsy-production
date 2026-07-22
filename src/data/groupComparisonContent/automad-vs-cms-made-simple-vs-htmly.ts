import type { GroupComparisonContent } from './types';

const automadVsCmsMadeSimpleVsHtmlyContent: GroupComparisonContent = {
  "verdict": "Automad and HTMLy are both free, database-free CMS platforms that store content as plain text files, making them lightweight and portable, while CMS Made Simple keeps a traditional MySQL-backed, Smarty-templated architecture with a Module Manager for more structured, multi-editor sites. Automad focuses on page-tree-structured brochure sites with its own templating toolkit, HTMLy focuses specifically on blogging with scheduled publishing and automatic sitemaps, and CMS Made Simple trades database-free simplicity for a more extensible, permissioned CMS.",
  "bestFor": {
    "automad": "Developers who want a git-friendly, database-free CMS with a page-tree structure for brochure sites and portfolios.",
    "cms-made-simple": "Developers and agencies who want a more extensible, permissioned CMS with a Module Manager for added functionality.",
    "htmly": "Technical bloggers who want a fast, no-database blogging platform with scheduled publishing and automatic sitemap generation."
  },
  "highlights": [
    {
      "title": "Database-free architecture",
      "description": "Both Automad and HTMLy store content as plain text files, so neither needs a database server to install, configure, or back up.",
      "toolSlugs": [
        "automad",
        "htmly"
      ]
    },
    {
      "title": "Scheduled publishing for bloggers",
      "description": "HTMLy lets writers prepare posts in advance and publish them automatically at a set date and time, a feature not documented for the other two.",
      "toolSlugs": [
        "htmly"
      ]
    },
    {
      "title": "Module-driven extensibility",
      "description": "CMS Made Simple's Module Manager adds e-commerce, forms, and gallery functionality beyond what Automad or HTMLy document.",
      "toolSlugs": [
        "cms-made-simple"
      ]
    },
    {
      "title": "Runs on minimal shared hosting",
      "description": "HTMLy is documented to run on shared hosting plans with as little as 512 MB of RAM, thanks to its flat-file design.",
      "toolSlugs": [
        "htmly"
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
            "htmly": "unavailable"
          }
        },
        {
          "feature": "Documented to run on very low-resource hosting (512 MB RAM or less)",
          "statuses": {
            "automad": "not-documented",
            "cms-made-simple": "not-documented",
            "htmly": "available"
          }
        }
      ]
    },
    {
      "group": "Content Management",
      "rows": [
        {
          "feature": "Scheduled publishing",
          "statuses": {
            "automad": "not-documented",
            "cms-made-simple": "not-documented",
            "htmly": "available"
          }
        },
        {
          "feature": "Multi-user permissions",
          "statuses": {
            "automad": "not-documented",
            "cms-made-simple": "available",
            "htmly": "limited"
          },
          "note": "HTMLy's documentation notes limited multi-author collaboration tooling."
        }
      ]
    },
    {
      "group": "Extensibility and SEO",
      "rows": [
        {
          "feature": "Official module or extension manager",
          "statuses": {
            "automad": "not-documented",
            "cms-made-simple": "available",
            "htmly": "not-documented"
          }
        },
        {
          "feature": "Automatic XML sitemap generation",
          "statuses": {
            "automad": "not-documented",
            "cms-made-simple": "not-documented",
            "htmly": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which two of these three need no database at all?",
      "answer": "Automad and HTMLy both store content as plain text files; CMS Made Simple requires MySQL."
    },
    {
      "question": "Which is purpose-built for blogging with scheduled posts?",
      "answer": "HTMLy, which includes scheduled publishing for posts written in advance."
    },
    {
      "question": "Which has the most robust multi-user permission system?",
      "answer": "CMS Made Simple, through its permissions-based user management."
    },
    {
      "question": "Can HTMLy run on very low-resource hosting?",
      "answer": "Yes, the project documents it running on shared hosting with as little as 512 MB of RAM."
    },
    {
      "question": "Which has a module manager for adding e-commerce or forms?",
      "answer": "CMS Made Simple, via its in-admin Module Manager."
    },
    {
      "question": "Are all three free?",
      "answer": "Yes, all three are free and open source: Automad under MIT, CMS Made Simple under GPL-3.0, and HTMLy under GPL v2 or later."
    }
  ]
};

export default automadVsCmsMadeSimpleVsHtmlyContent;

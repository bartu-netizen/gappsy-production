import type { GroupComparisonContent } from './types';

const antvilleVsCmsMadeSimpleVsHtmlyContent: GroupComparisonContent = {
  "verdict": "Antville offers free community-hosted blogging with essentially no technical overhead but runs on a dated Java stack, while CMS Made Simple is a mature, MySQL-backed CMS with a Smarty template engine and a Module Manager for building more structured, multi-editor sites. HTMLy takes the opposite path from CMS Made Simple, stripping out the database entirely and storing posts as flat text files, aimed at developers who want the lightest possible self-hosted blogging platform on modest shared hosting.",
  "bestFor": {
    "antville": "Individuals who want free, donation-supported community blog hosting with no server management required.",
    "cms-made-simple": "Developers and agencies building multi-page, multi-editor sites who want Smarty-based templating plus a module ecosystem.",
    "htmly": "Technical bloggers who want a fast, no-database, low-maintenance publishing platform that runs on minimal shared hosting."
  },
  "highlights": [
    {
      "title": "Zero-setup community hosting",
      "description": "Antville's flagship instance, antville.org, provides free, donation-supported hosting for thousands of sites with no server to manage.",
      "toolSlugs": [
        "antville"
      ]
    },
    {
      "title": "Database-free simplicity",
      "description": "HTMLy stores every post as a plain text file and can run on shared hosting with as little as 512 MB of RAM, avoiding a database entirely.",
      "toolSlugs": [
        "htmly"
      ]
    },
    {
      "title": "Structured template engine and module ecosystem",
      "description": "CMS Made Simple's Smarty-based templating and Module Manager give it more built-in structure for multi-editor sites than either of the other two.",
      "toolSlugs": [
        "cms-made-simple"
      ]
    },
    {
      "title": "Decade-plus track records",
      "description": "All three have been continuously maintained for many years, with Antville dating to 2001 and CMS Made Simple to 2004.",
      "toolSlugs": [
        "antville",
        "cms-made-simple",
        "htmly"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting and Infrastructure",
      "rows": [
        {
          "feature": "Free community-hosted option (no self-hosting required)",
          "statuses": {
            "antville": "available",
            "cms-made-simple": "unavailable",
            "htmly": "unavailable"
          }
        },
        {
          "feature": "Runs without a database",
          "statuses": {
            "antville": "not-documented",
            "cms-made-simple": "unavailable",
            "htmly": "available"
          },
          "note": "CMS Made Simple requires MySQL; HTMLy stores posts as flat text files."
        }
      ]
    },
    {
      "group": "Content Management",
      "rows": [
        {
          "feature": "Built-in module or extension manager",
          "statuses": {
            "antville": "not-documented",
            "cms-made-simple": "available",
            "htmly": "limited"
          }
        },
        {
          "feature": "Scheduled publishing",
          "statuses": {
            "antville": "not-documented",
            "cms-made-simple": "not-documented",
            "htmly": "available"
          }
        },
        {
          "feature": "Multi-user or multi-author support",
          "statuses": {
            "antville": "not-documented",
            "cms-made-simple": "available",
            "htmly": "limited"
          },
          "note": "HTMLy's documentation notes limited multi-author collaboration tooling compared to larger CMS platforms."
        }
      ]
    },
    {
      "group": "SEO and Discovery",
      "rows": [
        {
          "feature": "Automatic XML sitemap generation",
          "statuses": {
            "antville": "not-documented",
            "cms-made-simple": "not-documented",
            "htmly": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which platform requires no database at all?",
      "answer": "HTMLy, which stores every post as a plain text file and indexes them without a MySQL or similar database layer."
    },
    {
      "question": "Which of the three can I use without setting up my own server?",
      "answer": "Antville, through its free, donation-supported community host at antville.org."
    },
    {
      "question": "Which is best for a multi-editor team site?",
      "answer": "CMS Made Simple, thanks to its permissions-based user management and Module Manager for adding functionality."
    },
    {
      "question": "Does HTMLy support scheduling posts in advance?",
      "answer": "Yes, HTMLy includes scheduled publishing so posts written in advance go live automatically at a set date and time."
    },
    {
      "question": "Which has the most module or plugin ecosystem?",
      "answer": "CMS Made Simple, via its in-admin Module Manager for e-commerce, forms, galleries, and more."
    },
    {
      "question": "Is Antville still actively used today?",
      "answer": "Yes, antville.org reports over 3,400 hosted sites, with roughly 1,500 publicly accessible, and continues to see regular new posts and comments."
    }
  ]
};

export default antvilleVsCmsMadeSimpleVsHtmlyContent;

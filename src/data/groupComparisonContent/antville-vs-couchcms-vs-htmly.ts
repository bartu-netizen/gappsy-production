import type { GroupComparisonContent } from './types';

const antvilleVsCouchcmsVsHtmlyContent: GroupComparisonContent = {
  "verdict": "Antville, CouchCMS, and HTMLy are all free, open-source, lightweight alternatives to heavyweight CMS platforms for people running small personal or community sites, but they solve that problem differently. Antville is the only one offering a ready-to-use free hosted community instance, CouchCMS is built specifically for designers who want to reuse existing HTML/CSS templates rather than learn a theming system, and HTMLy strips out the database entirely for maximum simplicity on cheap shared hosting. None of the three aims to compete with full-featured platforms like WordPress on plugin ecosystem or multi-author collaboration.",
  "bestFor": {
    "antville": "Individuals or small communities who want free, no-signup blog hosting with a long operating history and don't want to manage their own server",
    "couchcms": "Designers and freelancers building small-to-medium client websites who want to couchify an existing HTML/CSS template instead of learning a new theming system",
    "htmly": "Developers and technical bloggers who want a fast, databaseless blog that runs on minimal shared hosting resources"
  },
  "highlights": [
    {
      "title": "Only tool with a ready-made free hosted instance",
      "description": "antville.org is a donation-supported community host with thousands of sites already running, so users can start a blog immediately without installing or self-hosting anything, unlike CouchCMS or HTMLy which require a PHP/MySQL server from day one.",
      "toolSlugs": [
        "antville"
      ]
    },
    {
      "title": "Template-first workflow for designers",
      "description": "CouchCMS lets a designer start from an already-built HTML/CSS template and insert simple tags to make sections editable, plus it ships built-in visitor comments with moderation and SEO-friendly nestable virtual folders for clean URLs.",
      "toolSlugs": [
        "couchcms"
      ]
    },
    {
      "title": "No database, minimal hosting footprint",
      "description": "HTMLy stores every post as a plain text file instead of using a database, letting it run on shared hosting with as little as 512 MB of RAM while the project states its custom indexing stays fast even past 20,000 posts.",
      "toolSlugs": [
        "htmly"
      ]
    },
    {
      "title": "Admin security and automation extras",
      "description": "HTMLy is the only one of the three with documented two-factor authentication for the admin login and automatic XML sitemap generation built in, both useful for a solo blogger without a dedicated security or SEO plugin stack.",
      "toolSlugs": [
        "htmly"
      ]
    },
    {
      "title": "All completely free and open source",
      "description": "None of the three gates core functionality behind a paywall: Antville and HTMLy are fully free, and CouchCMS's only paid option is a commercial license that removes attribution branding rather than unlocking features.",
      "toolSlugs": [
        "antville",
        "couchcms",
        "htmly"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting and Architecture",
      "rows": [
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "antville": "available",
            "couchcms": "available",
            "htmly": "available"
          }
        },
        {
          "feature": "Free ready-to-use hosted instance (no server setup)",
          "statuses": {
            "antville": "available",
            "couchcms": "unavailable",
            "htmly": "unavailable"
          },
          "note": "Antville's antville.org is a donation-supported community host; CouchCMS and HTMLy must be installed on your own PHP hosting."
        },
        {
          "feature": "Databaseless flat-file storage",
          "statuses": {
            "antville": "not-documented",
            "couchcms": "unavailable",
            "htmly": "available"
          },
          "note": "CouchCMS requires a traditional MySQL/MariaDB database; HTMLy stores posts as plain text files."
        }
      ]
    },
    {
      "group": "Content and Editing",
      "rows": [
        {
          "feature": "Reuses existing HTML/CSS templates directly",
          "statuses": {
            "antville": "not-documented",
            "couchcms": "available",
            "htmly": "not-documented"
          }
        },
        {
          "feature": "Built-in visitor comments with moderation",
          "statuses": {
            "antville": "not-documented",
            "couchcms": "available",
            "htmly": "not-documented"
          }
        }
      ]
    },
    {
      "group": "SEO and Security",
      "rows": [
        {
          "feature": "Automatic XML sitemap generation",
          "statuses": {
            "antville": "not-documented",
            "couchcms": "not-documented",
            "htmly": "available"
          }
        },
        {
          "feature": "Two-factor authentication for admin login",
          "statuses": {
            "antville": "not-documented",
            "couchcms": "not-documented",
            "htmly": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do I need to self-host any of these to use them?",
      "answer": "Only Antville offers a free, ready-to-use hosted option through its antville.org community instance. CouchCMS and HTMLy are both distributed as software you install on your own PHP hosting; there is no official managed hosted version of either."
    },
    {
      "question": "Which of these requires a database?",
      "answer": "CouchCMS requires a standard MySQL or MariaDB database alongside PHP hosting. HTMLy is intentionally databaseless, storing posts as plain text files. Antville's database requirements are not documented in the available data since it runs on the Helma Object Publisher framework."
    },
    {
      "question": "Which is best for a client website rather than a personal blog?",
      "answer": "CouchCMS is purpose-built for this: it lets a designer couchify an already-built HTML/CSS template for a client project without rebuilding it around a CMS theming system, and its cloned-pages feature can model anything from a portfolio to an event listing."
    },
    {
      "question": "Which is easiest to set up with no server experience?",
      "answer": "Antville has the lowest barrier to entry because antville.org hosts your site for you at no cost. CouchCMS and HTMLy both require you to provision PHP and, in CouchCMS's case, MySQL hosting yourself."
    },
    {
      "question": "Are there any licensing costs to watch for?",
      "answer": "All three are free to use. The one nuance is CouchCMS's Common Public Attribution License, which requires visible attribution in the source unless you purchase its optional commercial license to remove the attribution link and rebrand the admin panel."
    },
    {
      "question": "Which has documented security features like two-factor authentication?",
      "answer": "Only HTMLy documents built-in two-factor authentication for its admin login. Neither Antville nor CouchCMS lists 2FA support in their available feature data."
    }
  ]
};

export default antvilleVsCouchcmsVsHtmlyContent;

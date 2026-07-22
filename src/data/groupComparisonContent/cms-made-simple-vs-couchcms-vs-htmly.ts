import type { GroupComparisonContent } from './types';

const cmsMadeSimpleVsCouchcmsVsHtmlyContent: GroupComparisonContent = {
  "verdict": "All three are free, open-source, self-hosted PHP alternatives to WordPress, but they take different bets on how templating should work. If your site needs modular functionality (news, galleries, forms) with a strict content/logic/template split, CMS Made Simple's Smarty architecture and Module Manager fit best. If you already have a static HTML/CSS design and want to make it editable without learning a new templating language, CouchCMS's tag-based couchification is the more direct path. If you just need a fast, low-maintenance blog and want to avoid a database entirely, HTMLy's flat-file approach is the simplest to host and back up. None of the three match WordPress's plugin ecosystem, so the right pick depends on how much you value hosting simplicity versus built-in extensibility.",
  "bestFor": {
    "cms-made-simple": "Teams building a structured, multi-page site (not just a blog) who want one-click modules for things like news, forms, and galleries, plus a Smarty template layer that lets designers work without touching PHP.",
    "couchcms": "Designers or agencies who already have a finished static HTML/CSS template and want to couchify it into an editable, database-backed site with cloned pages for portfolios, event listings, or galleries, without rebuilding from scratch.",
    "htmly": "Bloggers and site owners on minimal shared hosting who want a fast, databaseless blog with no MySQL to install, back up, or secure, and who are comfortable with a smaller plugin ecosystem in exchange for that simplicity."
  },
  "highlights": [
    {
      "title": "HTMLy skips the database entirely",
      "description": "HTMLy stores every post as a plain text file and indexes it with a custom algorithm, so there is no MySQL to install, configure, back up, or secure. It runs on shared hosting with as little as 512 MB of RAM and stays fast even past 20,000 posts.",
      "toolSlugs": [
        "htmly"
      ]
    },
    {
      "title": "CouchCMS turns existing templates into a CMS instead of replacing them",
      "description": "Rather than requiring a new theming system, CouchCMS lets a designer take an already-built static HTML/CSS template and couchify it by inserting XHTML-style tags, with Cloned Pages generating repeatable structures like blogs, portfolios, or event listings from one template.",
      "toolSlugs": [
        "couchcms"
      ]
    },
    {
      "title": "CMS Made Simple pairs template separation with one-click modules",
      "description": "Its Smarty template engine strictly separates content, business logic, and templates, and its Module Manager adds one-click community modules for e-commerce, forms, and galleries, features neither CouchCMS nor HTMLy document.",
      "toolSlugs": [
        "cms-made-simple"
      ]
    },
    {
      "title": "All three are free and self-hosted with no per-seat cost",
      "description": "CMS Made Simple and HTMLy are fully free under GPL licenses with no paid tier, while CouchCMS is free under a Common Public Attribution License and only requires a one-time commercial license if you want to remove the attribution link.",
      "toolSlugs": [
        "cms-made-simple",
        "couchcms",
        "htmly"
      ]
    },
    {
      "title": "Track record varies",
      "description": "CMS Made Simple has the longest continuous history, dating to 2004 with two decades of releases, followed by CouchCMS from 2009; HTMLy's founding year and team size are not publicly documented.",
      "toolSlugs": [
        "cms-made-simple",
        "couchcms",
        "htmly"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture and Hosting",
      "rows": [
        {
          "feature": "Databaseless, flat-file storage",
          "statuses": {
            "cms-made-simple": "unavailable",
            "couchcms": "unavailable",
            "htmly": "available"
          },
          "note": "CMS Made Simple and CouchCMS both require a MySQL database; HTMLy stores posts as plain text files."
        },
        {
          "feature": "Runs on minimal shared hosting (low RAM, no database setup)",
          "statuses": {
            "cms-made-simple": "not-documented",
            "couchcms": "not-documented",
            "htmly": "available"
          },
          "note": "HTMLy explicitly supports shared hosting with as little as 512 MB of RAM; the other two require PHP plus MySQL hosting."
        }
      ]
    },
    {
      "group": "Content Modeling and Templating",
      "rows": [
        {
          "feature": "Reuse an existing static HTML/CSS template directly",
          "statuses": {
            "cms-made-simple": "not-documented",
            "couchcms": "available",
            "htmly": "not-documented"
          },
          "note": "CouchCMS's core design is couchifying a pre-built static template; this specific workflow is not documented for the other two."
        },
        {
          "feature": "Repeatable content structures beyond blog posts (portfolios, galleries, event listings)",
          "statuses": {
            "cms-made-simple": "limited",
            "couchcms": "available",
            "htmly": "limited"
          },
          "note": "CouchCMS has a dedicated Cloned Pages mechanism; CMS Made Simple covers similar ground via its news/article module, and HTMLy is scoped mainly to blog posts with categories and tags."
        },
        {
          "feature": "One-click module or plugin marketplace",
          "statuses": {
            "cms-made-simple": "available",
            "couchcms": "limited",
            "htmly": "limited"
          },
          "note": "CMS Made Simple names a Module Manager for e-commerce, forms, and galleries; both competitors are described as having smaller plugin and theme ecosystems without a dedicated marketplace feature."
        }
      ]
    },
    {
      "group": "Editorial and Account Security",
      "rows": [
        {
          "feature": "Built-in visitor commenting with moderation",
          "statuses": {
            "cms-made-simple": "not-documented",
            "couchcms": "available",
            "htmly": "not-documented"
          }
        },
        {
          "feature": "Two-factor authentication for admin login",
          "statuses": {
            "cms-made-simple": "not-documented",
            "couchcms": "not-documented",
            "htmly": "available"
          }
        },
        {
          "feature": "Free commercial use with no attribution requirement",
          "statuses": {
            "cms-made-simple": "available",
            "couchcms": "limited",
            "htmly": "available"
          },
          "note": "CouchCMS's free license requires a visible attribution link unless you buy its one-time commercial license; CMS Made Simple and HTMLy are GPL-licensed with no attribution requirement."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do any of these three CMS platforms avoid needing a database?",
      "answer": "Yes, HTMLy is the only one of the three that is fully databaseless, storing posts as plain text files and indexing them directly. CMS Made Simple and CouchCMS both run on a MySQL database."
    },
    {
      "question": "Which of these is best for a general website rather than just a blog?",
      "answer": "CMS Made Simple and CouchCMS are built as general-purpose page-based CMS platforms, with modules for news, galleries, and forms (CMS Made Simple) or cloned pages for portfolios and event listings (CouchCMS). HTMLy is positioned specifically as a blogging platform and flat-file CMS, so it is the least suited to complex, non-blog sites."
    },
    {
      "question": "Can I turn an existing HTML and CSS design into an editable site with any of these?",
      "answer": "CouchCMS is purpose-built for this: it lets you insert XHTML-style tags directly into an already-built static template to make it editable, without learning a new templating language. CMS Made Simple uses its own Smarty templating layer instead, and HTMLy is oriented around its own theme structure for blogs."
    },
    {
      "question": "Is there any cost to using CouchCMS's free license?",
      "answer": "CouchCMS is free under a Common Public Attribution License, which requires a visible attribution link in the source unless you purchase its one-time Commercial License (CCCL), which removes the attribution link, rebrands the admin panel, and includes one month of premium support."
    },
    {
      "question": "How much server capacity do I need for each option?",
      "answer": "HTMLy is designed to run on very modest shared hosting, including as little as 512 MB of RAM, since it has no database layer. CMS Made Simple and CouchCMS both require PHP hosting with a MySQL database, which adds setup and maintenance overhead but supports more structured content models."
    },
    {
      "question": "Which has the largest plugin or module ecosystem?",
      "answer": "None of the three approaches WordPress's ecosystem size. CMS Made Simple is the only one that documents a dedicated Module Manager for one-click community modules like e-commerce and forms; CouchCMS and HTMLy are both described as having smaller plugin and theme ecosystems than WordPress."
    }
  ]
};

export default cmsMadeSimpleVsCouchcmsVsHtmlyContent;

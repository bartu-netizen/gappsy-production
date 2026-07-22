import type { GroupComparisonContent } from './types';

const bluditVsCouchcmsVsHtmlyContent: GroupComparisonContent = {
  "verdict": "Bludit and HTMLy are both free, database-free CMS platforms built for fast, low-maintenance blogging, storing content as JSON or plain text files respectively, while CouchCMS keeps a traditional MySQL database but differentiates by letting designers couchify an existing HTML/CSS template rather than adopting a new theming system. Bludit adds a dedicated plugin and theme directory plus built-in privacy-first SEO defaults, HTMLy focuses on scheduled publishing and sitemap generation for solo bloggers, and CouchCMS is the pick for designer-led client sites built around bespoke markup rather than a blog-first content model.",
  "bestFor": {
    "bludit": "Site owners who want a fast, no-database blogging CMS with built-in SEO tools and a dedicated plugin and theme ecosystem.",
    "couchcms": "Web designers who want to make an existing hand-coded HTML/CSS template editable without learning a new theming system.",
    "htmly": "Technical bloggers who want a lightweight, no-database publishing platform with scheduled posts and automatic sitemaps."
  },
  "highlights": [
    {
      "title": "No-database simplicity",
      "description": "Bludit stores content as JSON files and HTMLy stores posts as plain text files, so neither requires configuring or backing up a database server.",
      "toolSlugs": [
        "bludit",
        "htmly"
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
      "title": "Built-in SEO tooling across all three",
      "description": "Bludit ships with built-in SEO tools, CouchCMS offers SEO-friendly nestable virtual folders for URLs, and HTMLy generates automatic XML sitemaps.",
      "toolSlugs": [
        "bludit",
        "couchcms",
        "htmly"
      ]
    },
    {
      "title": "Dedicated plugin and theme directory",
      "description": "Bludit is extendable through an official plugins directory and companion theme repositories, an ecosystem the other two do not document.",
      "toolSlugs": [
        "bludit"
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
            "bludit": "unavailable",
            "couchcms": "available",
            "htmly": "unavailable"
          },
          "note": "Bludit stores JSON files and HTMLy stores plain text files; CouchCMS requires MySQL."
        },
        {
          "feature": "Converts an existing HTML/CSS template into an editable site",
          "statuses": {
            "bludit": "unavailable",
            "couchcms": "available",
            "htmly": "unavailable"
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
            "bludit": "not-documented",
            "couchcms": "not-documented",
            "htmly": "available"
          }
        },
        {
          "feature": "Built-in visitor comments with moderation",
          "statuses": {
            "bludit": "not-documented",
            "couchcms": "available",
            "htmly": "not-documented"
          }
        }
      ]
    },
    {
      "group": "SEO and Extensibility",
      "rows": [
        {
          "feature": "Built-in SEO tools",
          "statuses": {
            "bludit": "available",
            "couchcms": "available",
            "htmly": "available"
          },
          "note": "Bludit ships general SEO tools, CouchCMS uses SEO-friendly virtual folders, and HTMLy generates automatic XML sitemaps."
        },
        {
          "feature": "Official plugin or theme directory",
          "statuses": {
            "bludit": "available",
            "couchcms": "not-documented",
            "htmly": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three requires a MySQL database?",
      "answer": "CouchCMS; Bludit and HTMLy are both database-free, storing content as JSON or plain text files respectively."
    },
    {
      "question": "Which is designed to convert an existing HTML/CSS template into a CMS?",
      "answer": "CouchCMS, which lets designers couchify a static template into an editable site."
    },
    {
      "question": "Which has a dedicated official plugin and theme directory?",
      "answer": "Bludit, via plugins.bludit.com and companion theme repositories."
    },
    {
      "question": "Which supports scheduled publishing for posts written in advance?",
      "answer": "HTMLy."
    },
    {
      "question": "Does Bludit track visitor data?",
      "answer": "No, Bludit is positioned as privacy-first with no default tracking and is described as GDPR compliant."
    },
    {
      "question": "Is CouchCMS completely free to use?",
      "answer": "Its core is free and open source under the Common Public Attribution License, though a paid commercial license is available to remove attribution and add custom branding."
    }
  ]
};

export default bluditVsCouchcmsVsHtmlyContent;

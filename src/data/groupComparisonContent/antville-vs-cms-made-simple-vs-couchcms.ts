import type { GroupComparisonContent } from './types';

const antvilleVsCmsMadeSimpleVsCouchcmsContent: GroupComparisonContent = {
  "verdict": "Antville, CMS Made Simple, and CouchCMS are all free, self-hosted publishing platforms, but they solve different problems. Antville is a donation-supported community host that lets anyone spin up a blog with no server setup at all, at the cost of running on a niche, decades-old Java framework. CMS Made Simple is a mature, MySQL-backed CMS built around the Smarty template engine and a Module Manager, suited to developers building more structured, multi-editor sites. CouchCMS takes a designer-first approach, turning an existing hand-coded HTML/CSS template into an editable site through embedded tags rather than asking anyone to learn a new theming system.",
  "bestFor": {
    "antville": "Individuals who want free, donation-supported community blog hosting with no server management required.",
    "cms-made-simple": "Developers and agencies who want a mature, module-extensible CMS with Smarty templating and permissioned multi-editor access.",
    "couchcms": "Ideal for designers who already have a hand-coded HTML/CSS template and want it to become editable, without having to rebuild it inside a new templating system."
  },
  "highlights": [
    {
      "title": "Zero-setup community hosting",
      "description": "Antville's flagship instance, antville.org, hosts thousands of sites for free with no server or database to manage, an option neither CMS Made Simple nor CouchCMS offers.",
      "toolSlugs": [
        "antville"
      ]
    },
    {
      "title": "Template-first content conversion",
      "description": "CouchCMS is built specifically to couchify an already-built HTML/CSS template into an editable site, rather than requiring a rebuild around a new theming system.",
      "toolSlugs": [
        "couchcms"
      ]
    },
    {
      "title": "Module-driven extensibility",
      "description": "CMS Made Simple ships with a Module Manager for one-click installation of e-commerce, forms, and gallery modules, giving it more built-in growth room than the other two.",
      "toolSlugs": [
        "cms-made-simple"
      ]
    },
    {
      "title": "Decades of continuous maintenance",
      "description": "All three projects have been actively maintained for over 15 years, with Antville dating to 2001, CMS Made Simple to 2004, and CouchCMS to 2009.",
      "toolSlugs": [
        "antville",
        "cms-made-simple",
        "couchcms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Templating and Design",
      "rows": [
        {
          "feature": "Converts an existing HTML/CSS template into an editable site",
          "statuses": {
            "antville": "unavailable",
            "cms-made-simple": "unavailable",
            "couchcms": "available"
          }
        },
        {
          "feature": "Dedicated template engine separating logic from design",
          "statuses": {
            "antville": "not-documented",
            "cms-made-simple": "available",
            "couchcms": "available"
          },
          "note": "CMS Made Simple uses Smarty; CouchCMS uses its own XHTML-style tag system."
        }
      ]
    },
    {
      "group": "Content and Editing",
      "rows": [
        {
          "feature": "Built-in visitor comments with moderation",
          "statuses": {
            "antville": "not-documented",
            "cms-made-simple": "not-documented",
            "couchcms": "available"
          }
        },
        {
          "feature": "Granular multi-user permissions",
          "statuses": {
            "antville": "not-documented",
            "cms-made-simple": "available",
            "couchcms": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Hosting and Ecosystem",
      "rows": [
        {
          "feature": "Free community-hosted option (no self-hosting required)",
          "statuses": {
            "antville": "available",
            "cms-made-simple": "unavailable",
            "couchcms": "unavailable"
          }
        },
        {
          "feature": "Official module or extension marketplace",
          "statuses": {
            "antville": "not-documented",
            "cms-made-simple": "available",
            "couchcms": "limited"
          },
          "note": "CMS Made Simple's Module Manager is larger; CouchCMS has no dedicated marketplace beyond community sharing."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three can I use without setting up my own server?",
      "answer": "Antville, whose flagship instance antville.org offers free, donation-supported community hosting for thousands of sites with no server management required."
    },
    {
      "question": "Which is best for designers who already have an HTML/CSS template built?",
      "answer": "CouchCMS, since it is designed to couchify an existing static template into an editable site rather than requiring a rebuild in a new theming system."
    },
    {
      "question": "Which offers the most built-in extensibility for e-commerce or forms?",
      "answer": "CMS Made Simple, through its in-admin Module Manager, which installs community-built modules for e-commerce, forms, and galleries."
    },
    {
      "question": "Do CMS Made Simple and CouchCMS require a database?",
      "answer": "Yes, both are built on MySQL. Antville runs on the Helma Object Publisher's own object-based architecture rather than a conventional database."
    },
    {
      "question": "Is CouchCMS completely free to use?",
      "answer": "The core software is released at no cost under the Common Public Attribution License and is open source; designers who prefer to strip out the visible attribution link and put their own branding on the admin panel can instead purchase a commercial license."
    },
    {
      "question": "Which platform has the largest, most active community today?",
      "answer": "CMS Made Simple has a broader developer and agency community built around its Module Manager and Smarty templating, while Antville's community skews toward long-running hobbyist blog hosting."
    }
  ]
};

export default antvilleVsCmsMadeSimpleVsCouchcmsContent;

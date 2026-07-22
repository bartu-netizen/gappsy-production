import type { GroupComparisonContent } from './types';

const automadVsBoltCmsVsJoomlaContent: GroupComparisonContent = {
  "verdict": "Automad and Bolt CMS are both free, MIT-licensed, developer-oriented PHP platforms built around simplicity, but Automad drops the database entirely in favor of flat text files while Bolt CMS keeps a Symfony and Doctrine database layer and can run headless via API-Platform. Joomla is the heaviest of the three, a GPL-licensed, database-backed CMS with native multilingual support, role-based access control, and a 10,000-plus extension marketplace built by a large volunteer community. Automad suits git-friendly brochure sites, Bolt CMS suits developers who want Symfony and Twig familiarity or a headless option, and Joomla suits larger multilingual or access-controlled sites.",
  "bestFor": {
    "automad": "Developers who want a lightweight, database-free CMS built around plain text files and a custom templating toolkit.",
    "bolt-cms": "Developers comfortable with Symfony and Twig who want the option to run a traditional or headless, API-driven CMS.",
    "joomla": "Teams needing native multilingual content, role-based access control, and a large extension ecosystem for bigger or membership-based sites."
  },
  "highlights": [
    {
      "title": "Database-free deployment",
      "description": "Automad stores all content as plain text files, avoiding the database setup, backup, and maintenance that Bolt CMS and Joomla both require.",
      "toolSlugs": [
        "automad"
      ]
    },
    {
      "title": "Headless option via API-Platform",
      "description": "Bolt CMS can run as a traditional server-rendered CMS or as a headless, API-driven backend through API-Platform, giving developers flexibility Automad does not document.",
      "toolSlugs": [
        "bolt-cms"
      ]
    },
    {
      "title": "Native multilingual content and access control",
      "description": "Joomla includes native multilingual content management and role-based access control as core features, without a third-party plugin.",
      "toolSlugs": [
        "joomla"
      ]
    },
    {
      "title": "Large extension marketplace",
      "description": "Joomla's Extensions Directory offers more than 10,000 templates, plugins, modules, and components.",
      "toolSlugs": [
        "joomla"
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
            "bolt-cms": "available",
            "joomla": "available"
          },
          "note": "Bolt CMS supports SQLite, MySQL, or PostgreSQL; Joomla uses MySQL or a compatible database."
        },
        {
          "feature": "Headless or API-first mode",
          "statuses": {
            "automad": "not-documented",
            "bolt-cms": "available",
            "joomla": "available"
          },
          "note": "Bolt CMS uses API-Platform; Joomla exposes a REST-style Web Services API."
        }
      ]
    },
    {
      "group": "Content and Access",
      "rows": [
        {
          "feature": "Native multilingual content management",
          "statuses": {
            "automad": "available",
            "bolt-cms": "not-documented",
            "joomla": "available"
          },
          "note": "Bolt CMS's editor UI is available in roughly 15 languages, but native multilingual content management is not documented."
        },
        {
          "feature": "Role-based access control",
          "statuses": {
            "automad": "not-documented",
            "bolt-cms": "not-documented",
            "joomla": "available"
          }
        }
      ]
    },
    {
      "group": "Ecosystem",
      "rows": [
        {
          "feature": "Official plugin or extension marketplace",
          "statuses": {
            "automad": "not-documented",
            "bolt-cms": "limited",
            "joomla": "available"
          },
          "note": "Bolt CMS extends via Composer packages rather than a dedicated marketplace directory."
        },
        {
          "feature": "Self-hosted only, with no vendor SaaS tier",
          "statuses": {
            "automad": "available",
            "bolt-cms": "available",
            "joomla": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three can run as a headless CMS?",
      "answer": "Bolt CMS, via API-Platform, and Joomla, via its Web Services API; Automad does not document a headless mode."
    },
    {
      "question": "Which requires no database at all?",
      "answer": "Automad, which stores content entirely as plain text files."
    },
    {
      "question": "Which is built on Symfony and Twig?",
      "answer": "Bolt CMS, which evolved from Silex to the Symfony framework and uses Twig for templating."
    },
    {
      "question": "Which has native multilingual content management without a plugin?",
      "answer": "Joomla, and Automad also supports multilingual sites; Bolt CMS's multilingual editor covers the admin interface language rather than documented native multilingual content."
    },
    {
      "question": "Which has the largest extension marketplace?",
      "answer": "Joomla, with over 10,000 extensions and templates available through the Joomla Extensions Directory."
    },
    {
      "question": "Are all three free to use?",
      "answer": "Yes. Automad and Bolt CMS are MIT licensed and Joomla is GPL licensed, and all three are self-hosted with no mandatory vendor fees."
    }
  ]
};

export default automadVsBoltCmsVsJoomlaContent;

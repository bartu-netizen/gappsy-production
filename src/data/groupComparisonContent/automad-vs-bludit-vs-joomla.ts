import type { GroupComparisonContent } from './types';

const automadVsBluditVsJoomlaContent: GroupComparisonContent = {
  "verdict": "Automad and Bludit are both free, MIT-licensed, flat-file CMS platforms that skip the database entirely, trading plugin-ecosystem breadth for hosting simplicity and portability, while Joomla is a far larger, GPL-licensed, database-backed CMS with native multilingual support, role-based access control, and over 10,000 extensions built by a large volunteer community. Automad leans toward developers who want git-friendly, page-tree-structured content in plain text files, Bludit stores content as JSON and adds a dedicated plugin directory plus privacy-first defaults, and Joomla scales to complex, multilingual, or membership-driven sites that need built-in access control out of the box.",
  "bestFor": {
    "automad": "Developers and small businesses who want a git-friendly, database-free CMS with a custom templating toolkit for brochure sites and portfolios.",
    "bludit": "Site owners who want a fast, no-database blogging CMS with built-in SEO tools, privacy-first defaults, and a dedicated plugin directory.",
    "joomla": "Organizations needing native multilingual content and granular role-based access control for larger or membership-driven websites."
  },
  "highlights": [
    {
      "title": "No-database, flat-file simplicity",
      "description": "Automad stores content as plain text files and Bludit stores it as JSON, so neither requires configuring or backing up a database server.",
      "toolSlugs": [
        "automad",
        "bludit"
      ]
    },
    {
      "title": "Native multilingual content and access control",
      "description": "Joomla includes multilingual content management and role-based access control as built-in features, without needing a third-party plugin.",
      "toolSlugs": [
        "joomla"
      ]
    },
    {
      "title": "Privacy-first SEO defaults",
      "description": "Bludit ships with built-in SEO tools and does not track visitor data by default, positioning it as GDPR-compliant out of the box.",
      "toolSlugs": [
        "bludit"
      ]
    },
    {
      "title": "Large extension marketplace",
      "description": "Joomla's Extensions Directory offers more than 10,000 templates, plugins, modules, and components, far more than either flat-file alternative.",
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
            "bludit": "unavailable",
            "joomla": "available"
          },
          "note": "Joomla runs on MySQL or a compatible database; Automad and Bludit are both flat-file."
        },
        {
          "feature": "Docker deployment support",
          "statuses": {
            "automad": "not-documented",
            "bludit": "available",
            "joomla": "not-documented"
          }
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
            "bludit": "limited",
            "joomla": "available"
          },
          "note": "Bludit's interface lacks built-in multi-language switching and typically needs a community plugin."
        },
        {
          "feature": "Role-based access control",
          "statuses": {
            "automad": "not-documented",
            "bludit": "not-documented",
            "joomla": "available"
          }
        },
        {
          "feature": "Built-in SEO tooling",
          "statuses": {
            "automad": "not-documented",
            "bludit": "available",
            "joomla": "available"
          }
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Official plugin or extension directory",
          "statuses": {
            "automad": "not-documented",
            "bludit": "available",
            "joomla": "available"
          },
          "note": "Joomla's directory lists over 10,000 extensions versus Bludit's smaller plugins.bludit.com catalog."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three requires a MySQL database?",
      "answer": "Joomla. Automad and Bludit are both flat-file CMS platforms that avoid a database entirely."
    },
    {
      "question": "Which has native multilingual support built in without a plugin?",
      "answer": "Joomla has native multilingual content management out of the box, and Automad supports multilingual sites at the content level; Bludit needs a third-party plugin for interface language switching."
    },
    {
      "question": "Which is easiest to deploy on minimal shared hosting?",
      "answer": "Automad or Bludit, since neither needs a database server, keeping hosting requirements to standard PHP."
    },
    {
      "question": "Which has the largest extension or plugin ecosystem?",
      "answer": "Joomla, with more than 10,000 extensions and templates available through the Joomla Extensions Directory."
    },
    {
      "question": "Does Bludit track visitor data by default?",
      "answer": "No, Bludit is described by its maintainers as privacy-first, tracking no visitor data by default and positioned as GDPR-compliant."
    },
    {
      "question": "Which is better suited to a membership-driven or access-controlled site?",
      "answer": "Joomla, due to its granular, built-in role-based access control system."
    }
  ]
};

export default automadVsBluditVsJoomlaContent;

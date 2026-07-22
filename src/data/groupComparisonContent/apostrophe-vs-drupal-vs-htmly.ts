import type { GroupComparisonContent } from './types';

const apostropheVsDrupalVsHtmlyContent: GroupComparisonContent = {
  "verdict": "Apostrophe, Drupal, and HTMLy are all free, self-hosted, template-driven publishing platforms, but they sit at very different scales. HTMLy is a minimalist, databaseless blogging engine built to run on minimal shared hosting; Drupal is a full enterprise-grade CMS built for complex, large, or multi-site projects; and Apostrophe offers a modern middle ground with in-context visual editing on a Node.js stack. The right pick depends far more on project scale and hosting constraints than on any single tool being objectively 'better'.",
  "bestFor": {
    "apostrophe": "Content teams that want in-context visual editing on the live page plus an optional headless/API delivery mode.",
    "drupal": "Large, complex, or multi-site websites that need maximum content-model flexibility, granular permissions, and a big module ecosystem.",
    "htmly": "Solo bloggers or small sites that want a lightweight, databaseless platform that runs on minimal hosting resources."
  },
  "highlights": [
    {
      "title": "HTMLy needs no database at all",
      "description": "HTMLy stores posts as plain text files rather than in a database, which simplifies hosting and backups and lets it run on hosting with as little as 512 MB of RAM, even with tens of thousands of posts.",
      "toolSlugs": [
        "htmly"
      ]
    },
    {
      "title": "Apostrophe's in-context editing is built for content teams",
      "description": "Editors can change content directly on the live rendered page in Apostrophe, a more modern editorial workflow than HTMLy's admin-panel forms or Drupal's traditional back-end editing.",
      "toolSlugs": [
        "apostrophe"
      ]
    },
    {
      "title": "Drupal offers by far the deepest content modeling and ecosystem",
      "description": "Drupal supports fully custom content types, fields, and taxonomies, granular role-based permissions, multi-site management, and thousands of contributed modules, none of which are part of HTMLy's or Apostrophe's core proposition.",
      "toolSlugs": [
        "drupal"
      ]
    },
    {
      "title": "HTMLy has no company or funding behind it",
      "description": "HTMLy has no official commercial support, funding, or company backing, and its founding year and team size are not publicly documented, unlike Apostrophe (backed by a company selling Pro/Enterprise tiers) or Drupal (backed by a large global community and security team).",
      "toolSlugs": [
        "htmly"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core architecture",
      "rows": [
        {
          "feature": "Free open-source core",
          "statuses": {
            "apostrophe": "available",
            "drupal": "available",
            "htmly": "available"
          }
        },
        {
          "feature": "Databaseless / flat-file storage",
          "statuses": {
            "apostrophe": "not-documented",
            "drupal": "not-documented",
            "htmly": "available"
          }
        },
        {
          "feature": "Two-factor authentication for admin login",
          "statuses": {
            "apostrophe": "not-documented",
            "drupal": "not-documented",
            "htmly": "available"
          }
        }
      ]
    },
    {
      "group": "Content and editing",
      "rows": [
        {
          "feature": "In-context / visual live-page editing",
          "statuses": {
            "apostrophe": "available",
            "drupal": "not-documented",
            "htmly": "not-documented"
          }
        },
        {
          "feature": "Headless / API content delivery",
          "statuses": {
            "apostrophe": "available",
            "drupal": "available",
            "htmly": "not-documented"
          }
        },
        {
          "feature": "Multilingual site support",
          "statuses": {
            "apostrophe": "available",
            "drupal": "available",
            "htmly": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Ecosystem",
      "rows": [
        {
          "feature": "Size of contributed module/theme ecosystem",
          "statuses": {
            "apostrophe": "limited",
            "drupal": "available",
            "htmly": "limited"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is the simplest to host on minimal or shared hosting?",
      "answer": "HTMLy is built for this: it uses databaseless, flat-file storage instead of MySQL, runs on as little as 512 MB of RAM, and stays fast even with tens of thousands of posts, according to the project."
    },
    {
      "question": "Which offers the best editing experience for a content team, not just a solo author?",
      "answer": "Apostrophe is designed for content teams, with in-context visual editing directly on the live rendered page. HTMLy is aimed more at individual bloggers, and its multi-author collaboration tooling is limited compared to Apostrophe or Drupal."
    },
    {
      "question": "Which scales best for a large or complex website?",
      "answer": "Drupal, by a clear margin. It supports fully custom content types and taxonomies, granular role-based permissions, multi-site management from one codebase, and thousands of contributed modules, none of which HTMLy or Apostrophe's core is built to match."
    },
    {
      "question": "Does HTMLy support multiple authors or contributors well?",
      "answer": "Not particularly. HTMLy's documented feature set is oriented around a single blogger or small team, and it has limited multi-author collaboration tooling compared to Apostrophe or Drupal."
    },
    {
      "question": "Are all three of these free to use?",
      "answer": "Yes. HTMLy is free under the GPL license with no paid tier, Drupal's core is entirely free and open source, and Apostrophe's Community Edition is free with optional paid Pro, Assembly, and Enterprise tiers for advanced features."
    },
    {
      "question": "Which is the better choice for a solo blogger versus an organization running a larger site?",
      "answer": "HTMLy fits a solo blogger who wants a lightweight, low-maintenance platform. Apostrophe suits a small-to-mid content team that wants in-context editing without Drupal's full complexity. Drupal fits an organization with complex content structures, multiple sites, or enterprise security requirements."
    }
  ]
};

export default apostropheVsDrupalVsHtmlyContent;

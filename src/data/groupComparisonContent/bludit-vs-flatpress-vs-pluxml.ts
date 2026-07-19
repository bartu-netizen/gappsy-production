import type { GroupComparisonContent } from './types';

const bluditVsFlatpressVsPluxmlContent: GroupComparisonContent = {
  "verdict": "Bludit, FlatPress, and PluXml are all free, open-source, database-free CMS platforms built for lightweight blogs and small sites, but they diverge sharply on collaboration and maturity. PluXml is the only one of the three built for multiple contributors, with five distinct permission levels and standout portability, including the ability to copy a full site to a USB drive. FlatPress is the elder of the group, actively maintained since 2006 with a WordPress-inspired plugin and widget system, but it is explicitly designed around a single author. Bludit sits in between, pairing a modern Markdown-or-WYSIWYG editing choice with built-in SEO tooling and a privacy-first, no-tracking default, making it the more turnkey pick for solo publishers who still want SEO polish.",
  "bestFor": {
    "bludit": "Solo bloggers and small site owners who want built-in SEO tooling, a choice between Markdown and WYSIWYG editing, and a privacy-first, no-tracking default without touching a database.",
    "flatpress": "Long-term, single-author bloggers who value a mature, continuously maintained (since 2006) flat-file engine with a WordPress-style plugin and widget architecture.",
    "pluxml": "Small teams, families, or organizations that need multiple contributor accounts with granular permissions and want a site portable enough to copy to a USB drive."
  },
  "highlights": [
    {
      "title": "Only PluXml supports multiple contributors",
      "description": "PluXml ships with five distinct permission levels for collaborative site management, while Bludit and FlatPress are architected around a single author with no native multi-user roles.",
      "toolSlugs": [
        "pluxml"
      ]
    },
    {
      "title": "Three different flat-file storage formats",
      "description": "All three avoid a database, but they structure content differently: Bludit stores pages and posts as JSON files, FlatPress writes plain files to disk, and PluXml stores everything as XML.",
      "toolSlugs": [
        "bludit",
        "flatpress",
        "pluxml"
      ]
    },
    {
      "title": "FlatPress is the longest-running of the three",
      "description": "FlatPress traces its roots to 2006, giving it the longest continuous development history among these flat-file CMS options, versus Bludit's 2015 start.",
      "toolSlugs": [
        "flatpress"
      ]
    },
    {
      "title": "Bludit leads on built-in SEO and privacy defaults",
      "description": "Bludit ships dedicated built-in SEO tools and is positioned as privacy-first with no default visitor tracking, features not called out in FlatPress's or PluXml's own feature lists.",
      "toolSlugs": [
        "bludit"
      ]
    },
    {
      "title": "PluXml markets extreme portability",
      "description": "Because everything lives in XML files, PluXml sites can be backed up or relocated with a simple file copy, including onto removable media like a USB drive.",
      "toolSlugs": [
        "pluxml"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Architecture",
      "rows": [
        {
          "feature": "Database-free flat-file storage",
          "statuses": {
            "bludit": "available",
            "flatpress": "available",
            "pluxml": "available"
          },
          "note": "Bludit uses JSON files, FlatPress uses plain files, and PluXml uses XML files."
        },
        {
          "feature": "Plugin or extension ecosystem",
          "statuses": {
            "bludit": "available",
            "flatpress": "available",
            "pluxml": "available"
          },
          "note": "PluXml's plugin system is marketed as no-code; Bludit and FlatPress use more developer-oriented plugin architectures."
        },
        {
          "feature": "Docker-based deployment",
          "statuses": {
            "bludit": "available",
            "flatpress": "not-documented",
            "pluxml": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Collaboration and Content Creation",
      "rows": [
        {
          "feature": "Multi-user accounts with permission levels",
          "statuses": {
            "bludit": "not-documented",
            "flatpress": "unavailable",
            "pluxml": "available"
          },
          "note": "FlatPress is explicitly single-author oriented; PluXml offers five distinct permission levels."
        },
        {
          "feature": "Markdown editing",
          "statuses": {
            "bludit": "available",
            "flatpress": "not-documented",
            "pluxml": "not-documented"
          },
          "note": "Bludit offers a choice of Markdown or WYSIWYG editing; the other two do not document a dedicated Markdown editor."
        },
        {
          "feature": "Built-in comment system with spam protection",
          "statuses": {
            "bludit": "not-documented",
            "flatpress": "available",
            "pluxml": "available"
          }
        }
      ]
    },
    {
      "group": "SEO and Localization",
      "rows": [
        {
          "feature": "Built-in SEO tooling",
          "statuses": {
            "bludit": "available",
            "flatpress": "not-documented",
            "pluxml": "not-documented"
          }
        },
        {
          "feature": "Multi-language interface",
          "statuses": {
            "bludit": "limited",
            "flatpress": "available",
            "pluxml": "available"
          },
          "note": "FlatPress ships 20+ interface languages and PluXml ships 11; Bludit's admin interface lacks robust native language switching without third-party plugins."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the main difference between Bludit, FlatPress, and PluXml?",
      "answer": "All three are free, self-hosted CMS platforms that store content as files instead of using a database, but they differ in storage format (JSON, plain files, and XML respectively), collaboration support, and maturity. PluXml is the only one built for multiple contributors, FlatPress is the oldest and most single-author focused, and Bludit adds built-in SEO tools and a Markdown-or-WYSIWYG editor choice."
    },
    {
      "question": "Which of these three flat-file CMS platforms supports multiple user accounts?",
      "answer": "PluXml is the clear choice for teams, offering five distinct permission levels for collaborative site management. Bludit does not document native multi-user roles, and FlatPress is explicitly designed around a single author."
    },
    {
      "question": "Are Bludit, FlatPress, and PluXml free to use?",
      "answer": "Yes. All three are free, open-source software with no subscription plans or paid tiers; the only cost is whatever self-hosted web hosting you choose to run them on."
    },
    {
      "question": "Which of these CMS platforms has been around the longest?",
      "answer": "FlatPress has the longest track record, with roots going back to 2006, compared to Bludit's 2015 start. PluXml's founding year is not publicly documented, though it has a long-running presence in French-speaking open-source communities."
    },
    {
      "question": "Do these platforms include SEO tools out of the box?",
      "answer": "Bludit is the only one of the three that lists dedicated built-in SEO tools in its feature set. FlatPress and PluXml do not document specific SEO tooling, though their lightweight, database-free architecture inherently supports fast page loads."
    },
    {
      "question": "How easy is it to migrate a site built on one of these platforms?",
      "answer": "Because all three store content as files rather than in a database, migration generally means copying a directory to a new host. PluXml specifically markets this portability, noting that a site can be moved on something as simple as a USB drive."
    }
  ]
};

export default bluditVsFlatpressVsPluxmlContent;

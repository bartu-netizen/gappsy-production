import type { GroupComparisonContent } from './types';

const apostropheVsCmsMadeSimpleVsDrupalContent: GroupComparisonContent = {
  "verdict": "These three self-hosted CMS platforms appeal to different kinds of teams rather than competing head to head on the same axis. CMS Made Simple is the choice for developers and designers who want a lightweight PHP CMS with a strict Smarty-based separation between templates and logic, running on ordinary LAMP hosting. Apostrophe suits JavaScript/Node.js teams who want in-context live editing and an optional headless mode, particularly agencies managing multiple client sites. Drupal remains the go-to option once requirements call for complex custom content modeling, large multi-site deployments, or the security governance that large organizations need.",
  "bestFor": {
    "apostrophe": "Agencies and software teams on a Node.js stack who want in-context live editing plus the option to run headless, with a formal paid ladder (Pro, Assembly, Enterprise) for growing needs.",
    "cms-made-simple": "Freelance designers and developers who want a lightweight, free PHP CMS with the Smarty template engine keeping design work fully separate from PHP logic on standard shared hosting.",
    "drupal": "Enterprises, government agencies, and universities needing custom content types, multi-site governance, and enterprise-grade security at scale."
  },
  "highlights": [
    {
      "title": "Three different templating philosophies",
      "description": "CMS Made Simple is built around the Smarty template engine's strict separation of content, business logic, and templates, Drupal offers flexible custom content-type theming, and Apostrophe centers its architecture on a Node.js module system with in-context editing.",
      "toolSlugs": [
        "apostrophe",
        "cms-made-simple",
        "drupal"
      ]
    },
    {
      "title": "Drupal dominates on ecosystem size",
      "description": "Drupal's community of more than 10,000 active contributors and its large contributed module library dwarf the smaller communities around Apostrophe and CMS Made Simple, both of which list a smaller ecosystem as a known tradeoff.",
      "toolSlugs": [
        "apostrophe",
        "cms-made-simple",
        "drupal"
      ]
    },
    {
      "title": "Only Apostrophe offers true in-context editing",
      "description": "Apostrophe lets content editors work directly on the live rendered page. CMS Made Simple instead offers a real-time Content Manager with a WYSIWYG editor in a separate admin area, and Drupal's editorial experience improvements are bundled into its newer Drupal CMS starter package rather than in-context editing on the page itself.",
      "toolSlugs": [
        "apostrophe"
      ]
    },
    {
      "title": "Hosting simplicity favors CMS Made Simple",
      "description": "CMS Made Simple needs only a standard LAMP or LEMP stack and has a lighter resource footprint than Drupal, while Apostrophe needs Node.js-compatible hosting (or its own managed hosting) and Drupal's total cost of ownership can climb once specialized hosting and development are factored in.",
      "toolSlugs": [
        "cms-made-simple",
        "drupal",
        "apostrophe"
      ]
    },
    {
      "title": "Only Apostrophe has a formal commercial product ladder",
      "description": "Apostrophe is the only one of the three with named paid tiers (Pro, Assembly, Enterprise) and vendor-run managed hosting; CMS Made Simple and Drupal core are both entirely free, community-maintained open source projects with no official paid tier from the project itself.",
      "toolSlugs": [
        "apostrophe",
        "cms-made-simple",
        "drupal"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture and Extensibility",
      "rows": [
        {
          "feature": "Dedicated templating layer separating logic from design",
          "statuses": {
            "apostrophe": "not-documented",
            "cms-made-simple": "available",
            "drupal": "not-documented"
          },
          "note": "CMS Made Simple's Smarty engine is explicitly built for this separation; it is not documented as a standalone feature for the other two."
        },
        {
          "feature": "Headless/API-first content delivery",
          "statuses": {
            "apostrophe": "available",
            "cms-made-simple": "not-documented",
            "drupal": "available"
          }
        },
        {
          "feature": "Custom content types and fields",
          "statuses": {
            "apostrophe": "not-documented",
            "cms-made-simple": "not-documented",
            "drupal": "available"
          }
        }
      ]
    },
    {
      "group": "Editing Experience",
      "rows": [
        {
          "feature": "In-context/live visual editing on the page itself",
          "statuses": {
            "apostrophe": "available",
            "cms-made-simple": "not-documented",
            "drupal": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Ecosystem, Hosting, and Support",
      "rows": [
        {
          "feature": "Large contributed module/plugin ecosystem",
          "statuses": {
            "apostrophe": "limited",
            "cms-made-simple": "limited",
            "drupal": "available"
          }
        },
        {
          "feature": "Official vendor-run managed hosting",
          "statuses": {
            "apostrophe": "available",
            "cms-made-simple": "unavailable",
            "drupal": "unavailable"
          }
        },
        {
          "feature": "Formal paid/commercial tier with vendor support",
          "statuses": {
            "apostrophe": "available",
            "cms-made-simple": "unavailable",
            "drupal": "unavailable"
          },
          "note": "CMS Made Simple and Drupal core are community-maintained with no company-run paid tier of their own."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the main technical difference between these three CMS platforms?",
      "answer": "CMS Made Simple is a PHP CMS built around the Smarty template engine, which strictly separates templates from business logic. Apostrophe is a Node.js CMS built for in-context editing and optional headless delivery. Drupal is a PHP CMS focused on highly flexible, custom content modeling for complex sites."
    },
    {
      "question": "Which of these is easiest to host on standard shared hosting?",
      "answer": "CMS Made Simple, since it only needs a standard LAMP or LEMP stack (Linux, Apache or Nginx, MySQL, PHP) and has a lighter resource footprint than Drupal. Apostrophe needs Node.js-compatible hosting, and Drupal's total cost of ownership can climb once specialized hosting and development are factored in."
    },
    {
      "question": "Does any of these let editors change content directly on the live page?",
      "answer": "Apostrophe is the only one of the three that offers in-context visual editing, where editors work directly on the rendered page rather than a separate admin form. CMS Made Simple offers a real-time Content Manager with a WYSIWYG editor instead, and Drupal's editorial improvements ship through its newer Drupal CMS starter bundle."
    },
    {
      "question": "Is there a paid, vendor-supported version of any of these?",
      "answer": "Only Apostrophe has a formal commercial ladder, with Pro, Assembly, and Enterprise tiers plus its own managed hosting. CMS Made Simple and Drupal core are both free, community-maintained open source projects without an official paid tier from the project itself, though third-party Drupal hosts like Acquia and Pantheon sell commercial plans."
    },
    {
      "question": "Which has the largest community and module ecosystem?",
      "answer": "Drupal, by a significant margin, with more than 10,000 active contributors and a large contributed module library. Both Apostrophe and CMS Made Simple explicitly list a smaller plugin and theme ecosystem as a tradeoff in their own pros and cons."
    },
    {
      "question": "Which is best suited for a large, complex organization versus a small agency project?",
      "answer": "Drupal is the strongest fit for large, complex organizations that need custom content modeling, multi-site management, and enterprise security. CMS Made Simple suits freelance designers and small agencies wanting a lightweight PHP CMS, while Apostrophe fits agencies on a Node.js stack that want in-context editing with room to grow into paid tiers."
    }
  ]
};

export default apostropheVsCmsMadeSimpleVsDrupalContent;

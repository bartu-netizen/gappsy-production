import type { GroupComparisonContent } from './types';

const apostropheVsAutomadVsDrupalContent: GroupComparisonContent = {
  "verdict": "There is no single winner here because these three CMS platforms solve the hosting-and-editing problem in very different ways. Automad is the right call when the goal is a lightweight, database-free site that a solo developer can deploy on plain PHP hosting and manage through Git. Apostrophe fits teams already comfortable with Node.js who want in-context visual editing plus an optional headless mode, especially agencies running many client sites on its Assembly tier. Drupal remains the default choice once the requirements involve complex custom content modeling, large multi-site deployments, or strict security and governance needs that smaller open-source CMS projects are not built to handle.",
  "bestFor": {
    "apostrophe": "Digital agencies and software teams on a JavaScript/Node.js stack who want in-context live editing and the option to run headless with Astro, Gatsby, or Nuxt front ends.",
    "automad": "Developers and small businesses building brochure sites, blogs, or portfolios who want a free, database-free CMS that is simple to back up and version with Git.",
    "drupal": "Enterprises, government agencies, and universities that need custom content types, multi-site management, and enterprise-grade security at scale."
  },
  "highlights": [
    {
      "title": "Free tier depth varies a lot",
      "description": "Automad is entirely free with no paid tier at all, Drupal core is free with real costs showing up in hosting and development, and Apostrophe's Community Edition is free but its AI translation, versioning, and multisite tools sit behind the paid Pro and Assembly tiers.",
      "toolSlugs": [
        "apostrophe",
        "automad",
        "drupal"
      ]
    },
    {
      "title": "Database-free versus database-driven architecture",
      "description": "Automad stores everything in plain text files with no database dependency, while Apostrophe runs on Node.js with MongoDB and Drupal runs on PHP with MySQL, so hosting and backup complexity differ sharply between the three.",
      "toolSlugs": [
        "apostrophe",
        "automad",
        "drupal"
      ]
    },
    {
      "title": "Headless delivery is not universal",
      "description": "Apostrophe and Drupal both explicitly support headless or API-first content delivery to front-end frameworks, while Automad's provided feature set does not document a headless mode.",
      "toolSlugs": [
        "apostrophe",
        "drupal"
      ]
    },
    {
      "title": "Drupal wins on ecosystem scale",
      "description": "Drupal's contributed module ecosystem and community of more than 10,000 active contributors dwarfs the smaller, more niche communities around Apostrophe and Automad, both of which list a smaller plugin and theme ecosystem as a tradeoff in their own pros and cons.",
      "toolSlugs": [
        "apostrophe",
        "automad",
        "drupal"
      ]
    },
    {
      "title": "Only Apostrophe sells its own managed hosting",
      "description": "Apostrophe offers vendor-run managed hosting starting at $39 a month as an alternative to self-hosting, while Automad and Drupal both rely entirely on self-hosting or third-party hosting providers.",
      "toolSlugs": [
        "apostrophe"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture and Deployment",
      "rows": [
        {
          "feature": "No-database (flat-file) architecture",
          "statuses": {
            "apostrophe": "unavailable",
            "automad": "available",
            "drupal": "unavailable"
          },
          "note": "Automad stores content as plain text files; Apostrophe uses MongoDB and Drupal uses MySQL."
        },
        {
          "feature": "Headless/API-first content delivery",
          "statuses": {
            "apostrophe": "available",
            "automad": "not-documented",
            "drupal": "available"
          }
        }
      ]
    },
    {
      "group": "Content Editing",
      "rows": [
        {
          "feature": "In-context/live visual editing",
          "statuses": {
            "apostrophe": "available",
            "automad": "available",
            "drupal": "not-documented"
          }
        },
        {
          "feature": "Multilingual/localization support",
          "statuses": {
            "apostrophe": "available",
            "automad": "available",
            "drupal": "available"
          }
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Custom content types and fields",
          "statuses": {
            "apostrophe": "not-documented",
            "automad": "available",
            "drupal": "available"
          }
        },
        {
          "feature": "Large contributed module/plugin ecosystem",
          "statuses": {
            "apostrophe": "limited",
            "automad": "limited",
            "drupal": "available"
          }
        }
      ]
    },
    {
      "group": "Hosting and Support",
      "rows": [
        {
          "feature": "Vendor-provided managed hosting",
          "statuses": {
            "apostrophe": "available",
            "automad": "unavailable",
            "drupal": "unavailable"
          },
          "note": "Third-party providers like Acquia and Pantheon host Drupal, but that is not an official offering from the Drupal project itself."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CMS platforms is completely free?",
      "answer": "Automad is free with no paid tier at all. Drupal core is also free and open source, though real-world costs come from hosting and development. Apostrophe's Community Edition is free too, but its AI translation, document versioning, and multisite tools require the paid Pro or Assembly tiers."
    },
    {
      "question": "Do I need to know how to code to use Apostrophe, Automad, or Drupal?",
      "answer": "Yes, all three expect some development skill. Apostrophe requires comfort with Node.js and Vue.js, Automad requires PHP hosting knowledge for setup, and Drupal has the steepest learning curve of the three given its custom content modeling and module ecosystem."
    },
    {
      "question": "Which one is best for a small brochure site versus a large enterprise site?",
      "answer": "Automad is built specifically for lightweight brochure sites, blogs, and portfolios. Drupal is aimed at the opposite end, handling complex content modeling and large multi-site deployments for enterprises and government agencies. Apostrophe sits in between, well suited to agencies and software teams building on Node.js."
    },
    {
      "question": "Can any of these run headless with a React or Vue front end?",
      "answer": "Apostrophe and Drupal both explicitly support headless or API-first delivery, with Apostrophe offering official integrations for Astro, Gatsby, and Nuxt and Drupal exposing REST and JSON:API endpoints. Automad's documented feature set does not mention a headless mode."
    },
    {
      "question": "Which has the largest plugin or module ecosystem?",
      "answer": "Drupal, by a wide margin. Its contributed module ecosystem and community of more than 10,000 active contributors is significantly larger than the ecosystems around Apostrophe or Automad, both of which cite a smaller plugin and theme selection as a known tradeoff."
    },
    {
      "question": "Does any of these offer official managed hosting from the vendor?",
      "answer": "Only Apostrophe does, with managed hosting plans starting at $39 a month. Automad and Drupal both rely on self-hosting or third-party hosting providers rather than an official hosting product from the project itself."
    }
  ]
};

export default apostropheVsAutomadVsDrupalContent;

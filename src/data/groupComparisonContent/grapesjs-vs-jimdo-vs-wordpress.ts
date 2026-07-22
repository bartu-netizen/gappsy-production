import type { GroupComparisonContent } from './types';

const grapesjsVsJimdoVsWordpressContent: GroupComparisonContent = {
  "verdict": "GrapesJS, Jimdo, and WordPress sit at different points on the no-code spectrum. GrapesJS is a free, open-source drag-and-drop framework best suited to developers who want to build or embed their own editor rather than a finished consumer website builder. Jimdo is a hosted, AI-assisted no-code builder aimed at non-technical small business owners who want a usable site in minutes. WordPress is the free, self-hosted, open-source CMS with by far the largest plugin and theme ecosystem for those willing to manage their own hosting.",
  "bestFor": {
    "grapesjs": "Developers who want a free, self-hostable, framework-agnostic drag-and-drop editor to build or embed into their own product.",
    "jimdo": "Non-technical small business owners who want an AI-assisted website and online store built in minutes, with managed hosting included.",
    "wordpress": "Anyone who wants the largest plugin and theme ecosystem and full self-hosted control with no vendor lock-in."
  },
  "highlights": [
    {
      "title": "AI-Generated Starter Sites",
      "description": "Jimdo's Dolphin builder turns answers to a short business questionnaire into a ready-to-edit starter website with relevant sections and copy suggestions.",
      "toolSlugs": [
        "jimdo"
      ]
    },
    {
      "title": "Embeddable Open-Source Editor",
      "description": "GrapesJS is free, open source, and framework-agnostic, making it easy to embed inside React, Vue, or Angular applications rather than used as a finished site builder.",
      "toolSlugs": [
        "grapesjs"
      ]
    },
    {
      "title": "Largest Ecosystem and Full Control",
      "description": "WordPress's plugin and theme directory dwarfs the ecosystems around GrapesJS and Jimdo, giving self-hosters the widest range of add-on functionality.",
      "toolSlugs": [
        "wordpress"
      ]
    },
    {
      "title": "European, Privacy-Conscious Managed Hosting",
      "description": "Jimdo is a Hamburg-based, founder-owned company offering fully managed hosting with SSL included on every paid plan, positioned as a European alternative to major US website builders.",
      "toolSlugs": [
        "jimdo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Editing Experience",
      "rows": [
        {
          "feature": "No-code drag-and-drop editor",
          "statuses": {
            "grapesjs": "available",
            "jimdo": "available",
            "wordpress": "available"
          }
        },
        {
          "feature": "AI-assisted site generation",
          "statuses": {
            "grapesjs": "available",
            "jimdo": "available",
            "wordpress": "not-documented"
          },
          "note": "GrapesJS's AI template generation is part of its hosted Studio product rather than the open-source core."
        }
      ]
    },
    {
      "group": "Hosting and Ecommerce",
      "rows": [
        {
          "feature": "Integrated managed hosting",
          "statuses": {
            "grapesjs": "not-documented",
            "jimdo": "available",
            "wordpress": "unavailable"
          },
          "note": "WordPress requires the site owner to source and manage their own hosting."
        },
        {
          "feature": "Built-in ecommerce or online store",
          "statuses": {
            "grapesjs": "not-documented",
            "jimdo": "available",
            "wordpress": "available"
          },
          "note": "WordPress supports ecommerce through its plugin architecture rather than a native store module."
        }
      ]
    },
    {
      "group": "Ecosystem",
      "rows": [
        {
          "feature": "Free plan or free self-hosted tier",
          "statuses": {
            "grapesjs": "available",
            "jimdo": "available",
            "wordpress": "available"
          }
        },
        {
          "feature": "Third-party plugin and template marketplace",
          "statuses": {
            "grapesjs": "limited",
            "jimdo": "limited",
            "wordpress": "available"
          },
          "note": "WordPress's official directory is far larger than the ecosystems around GrapesJS or Jimdo."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does GrapesJS include hosting like Jimdo does?",
      "answer": "No. GrapesJS is primarily a framework and SDK for building editors, and integrated hosting is not part of its documented offering, unlike Jimdo, which bundles managed hosting and SSL into every paid plan."
    },
    {
      "question": "Which of the three offers built-in ecommerce?",
      "answer": "Jimdo includes a native online store with inventory management and multiple payment gateways. WordPress supports ecommerce through its plugin architecture. GrapesJS does not document dedicated ecommerce features."
    },
    {
      "question": "Is WordPress harder to use than Jimdo?",
      "answer": "Generally yes for non-technical users. WordPress requires the site owner to source hosting and manage updates and security, while Jimdo is a fully managed, AI-assisted builder aimed at small business owners without technical experience."
    },
    {
      "question": "Can I self-host any of these for free?",
      "answer": "GrapesJS's core framework and WordPress can both be self-hosted for free. Jimdo is a hosted SaaS product without a self-hosting option."
    },
    {
      "question": "What does Jimdo's Dolphin AI builder actually generate?",
      "answer": "Dolphin takes answers to a short business questionnaire and produces a ready-to-edit starter website with relevant sections and copy suggestions, which can then be refined manually."
    }
  ]
};

export default grapesjsVsJimdoVsWordpressContent;

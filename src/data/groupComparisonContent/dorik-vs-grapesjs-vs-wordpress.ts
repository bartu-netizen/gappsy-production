import type { GroupComparisonContent } from './types';

const dorikVsGrapesjsVsWordpressContent: GroupComparisonContent = {
  "verdict": "Dorik and WordPress are both ready-to-use ways to publish a website, while GrapesJS is primarily a developer framework meant to be embedded inside other products rather than a finished builder on its own. Dorik trades flexibility for simplicity, offering a hosted, no-code, AI-assisted builder with a genuinely usable free plan, while WordPress offers unmatched extensibility and control at the cost of sourcing your own hosting. GrapesJS's core library is free and self-hostable for developers, and its newer Grapes Studio product is the more direct hosted competitor to Dorik and WordPress.",
  "bestFor": {
    "dorik": "Small businesses, freelancers, and agencies who want a hosted, no-code AI website builder with a usable free plan and a white-label reselling option.",
    "grapesjs": "Developers and SaaS teams who want a free, open-source, embeddable drag-and-drop editor to build into their own product rather than a ready-made hosted site builder.",
    "wordpress": "Anyone who wants complete control and the largest plugin and theme ecosystem, in exchange for sourcing and managing their own hosting."
  },
  "highlights": [
    {
      "title": "No-Code Hosted Builder for Non-Developers",
      "description": "Dorik combines 110+ templates and 250+ drag-and-drop blocks with AI page generation and included hosting, so non-technical users can publish without touching code.",
      "toolSlugs": [
        "dorik"
      ]
    },
    {
      "title": "Free, Open-Source, Embeddable Editor",
      "description": "GrapesJS's core library is free and self-hostable, letting developers embed a drag-and-drop editor engine into their own product rather than licensing one.",
      "toolSlugs": [
        "grapesjs"
      ]
    },
    {
      "title": "Largest Plugin and Theme Ecosystem",
      "description": "WordPress is backed by tens of thousands of free and premium themes and plugins covering ecommerce, SEO, and page building, built over more than two decades.",
      "toolSlugs": [
        "wordpress"
      ]
    },
    {
      "title": "Self-Hosting and Full Ownership",
      "description": "WordPress's self-hosted GPLv2 software and GrapesJS's open-source core both give technical teams full control over their code and infrastructure with no vendor lock-in.",
      "toolSlugs": [
        "grapesjs",
        "wordpress"
      ]
    },
    {
      "title": "White-Label Reselling for Agencies",
      "description": "Dorik's Agency plan removes site and page limits and adds a white-label dashboard, letting agencies manage and present client sites under their own brand.",
      "toolSlugs": [
        "dorik"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting and Deployment",
      "rows": [
        {
          "feature": "Fully hosted, ready-to-use builder",
          "statuses": {
            "dorik": "available",
            "grapesjs": "limited",
            "wordpress": "unavailable"
          },
          "note": "GrapesJS's core library is not itself a hosted builder; its newer Grapes Studio product is the hosted, end-user-facing version. WordPress.org distributes only the software, not hosting."
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "dorik": "unavailable",
            "grapesjs": "available",
            "wordpress": "available"
          },
          "note": "Dorik is fully hosted with code export available, but does not support self-hosting the platform itself."
        }
      ]
    },
    {
      "group": "Content and Ease of Use",
      "rows": [
        {
          "feature": "No-code drag-and-drop editor out of the box",
          "statuses": {
            "dorik": "available",
            "grapesjs": "limited",
            "wordpress": "available"
          },
          "note": "Raw GrapesJS requires developer effort to integrate and style into a production-ready editor; WordPress achieves this via Gutenberg or page-builder plugins."
        },
        {
          "feature": "Built-in CMS or blog",
          "statuses": {
            "dorik": "available",
            "grapesjs": "not-documented",
            "wordpress": "available"
          }
        }
      ]
    },
    {
      "group": "Cost",
      "rows": [
        {
          "feature": "Free tier available",
          "statuses": {
            "dorik": "available",
            "grapesjs": "available",
            "wordpress": "available"
          },
          "note": "WordPress software itself is entirely free; GrapesJS's core library and Studio SDK free tier are also free; Dorik's paid plans start at $29/month."
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Plugin or extension ecosystem",
          "statuses": {
            "dorik": "not-documented",
            "grapesjs": "available",
            "wordpress": "available"
          },
          "note": "GrapesJS ships a plugin and command API for custom blocks; WordPress has a large official plugin and theme directory."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is GrapesJS a ready-to-use website builder like Dorik or WordPress?",
      "answer": "Not directly. GrapesJS's core library is a developer framework meant to be embedded inside other software. Its newer Grapes Studio product, launched in October 2025, is the hosted, end-user-facing version positioned as an AI-powered alternative to WordPress and similar builders."
    },
    {
      "question": "Which of the three is completely free?",
      "answer": "The WordPress software itself is free and open source under GPLv2, and GrapesJS's open-source core library is also free to self-host. Dorik has a usable free plan, but its paid tiers start at $29 per month."
    },
    {
      "question": "Do I need to manage my own hosting?",
      "answer": "Yes for WordPress, since WordPress.org distributes only the software and you must obtain hosting from a third-party provider, and yes for self-hosted GrapesJS deployments. Dorik includes hosting with unlimited storage and bandwidth on every plan."
    },
    {
      "question": "Which is best for agencies reselling websites to clients?",
      "answer": "Dorik, through its white-label dashboard and Agency plan, which removes custom domain, page, and blog post limits for managing many client sites under one account."
    },
    {
      "question": "Which has the largest plugin or theme ecosystem?",
      "answer": "WordPress, with tens of thousands of free and premium plugins and themes covering ecommerce, SEO, and page building, built up over more than two decades."
    },
    {
      "question": "Can I export code from Dorik or GrapesJS?",
      "answer": "Yes. Dorik supports code export so users can extract the underlying HTML and CSS, and GrapesJS's editor natively includes a code export view for viewing or exporting generated HTML and CSS."
    }
  ]
};

export default dorikVsGrapesjsVsWordpressContent;

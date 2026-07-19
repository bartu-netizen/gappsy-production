import type { GroupComparisonContent } from './types';

const grapesjsVsWebstudioVsWordpressContent: GroupComparisonContent = {
  "verdict": "All three tools share an open-source, self-hostable core, but they solve different problems. GrapesJS is primarily a developer framework for embedding a drag-and-drop editor inside another product, Webstudio is a ready-to-use, Webflow-style visual builder with full CSS control and headless CMS integrations, and WordPress is a mature, self-hosted CMS with the largest plugin and theme ecosystem of the three. Webstudio is the most direct like-for-like alternative to WordPress for building a site visually, while GrapesJS is better suited to teams building their own page-builder product.",
  "bestFor": {
    "grapesjs": "Developers and SaaS teams who want a free, framework-agnostic drag-and-drop editor library to embed inside their own product.",
    "webstudio": "Designers and technical marketers who want Webflow-style visual design with full CSS control and the option to self-host and avoid vendor lock-in.",
    "wordpress": "Anyone who wants the largest theme and plugin ecosystem and full self-hosted control over a content-driven website."
  },
  "highlights": [
    {
      "title": "Open Source and Self-Hostable Core",
      "description": "GrapesJS's core library, Webstudio's AGPL-licensed builder, and WordPress's GPLv2 software can all be self-hosted, avoiding vendor lock-in for technical teams.",
      "toolSlugs": [
        "grapesjs",
        "webstudio",
        "wordpress"
      ]
    },
    {
      "title": "Webflow-Style Visual Design",
      "description": "Webstudio offers a visual canvas with full CSS control similar to Webflow, built by a founder with direct Webflow product experience, but with an open-source, self-hostable core.",
      "toolSlugs": [
        "webstudio"
      ]
    },
    {
      "title": "Embeddable Developer SDK",
      "description": "GrapesJS's Studio SDK packages the editor as a white-labelable, embeddable component that SaaS teams can drop into their own products instead of building one from scratch.",
      "toolSlugs": [
        "grapesjs"
      ]
    },
    {
      "title": "Largest Plugin and Theme Ecosystem",
      "description": "WordPress is backed by tens of thousands of free and premium themes and plugins covering ecommerce, SEO, and page building.",
      "toolSlugs": [
        "wordpress"
      ]
    },
    {
      "title": "Headless CMS Flexibility",
      "description": "Webstudio connects to external headless content sources including Strapi, Supabase, Notion, and WordPress instead of forcing a proprietary CMS.",
      "toolSlugs": [
        "webstudio"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting and Deployment",
      "rows": [
        {
          "feature": "Self-hosting option",
          "statuses": {
            "grapesjs": "available",
            "webstudio": "available",
            "wordpress": "available"
          }
        },
        {
          "feature": "Fully hosted cloud option",
          "statuses": {
            "grapesjs": "limited",
            "webstudio": "available",
            "wordpress": "unavailable"
          },
          "note": "GrapesJS's hosted option is its newer Grapes Studio product; WordPress.org itself does not offer first-party hosting, though the separate WordPress.com service does."
        }
      ]
    },
    {
      "group": "Design and Editing",
      "rows": [
        {
          "feature": "No-code visual canvas out of the box",
          "statuses": {
            "grapesjs": "limited",
            "webstudio": "available",
            "wordpress": "available"
          },
          "note": "Raw GrapesJS requires developer integration to become a usable editor; WordPress achieves this via Gutenberg or page-builder plugins."
        },
        {
          "feature": "Full CSS control",
          "statuses": {
            "grapesjs": "available",
            "webstudio": "available",
            "wordpress": "limited"
          },
          "note": "WordPress's CSS control depends on the active theme or page-builder plugin rather than being native to core."
        }
      ]
    },
    {
      "group": "Content and CMS",
      "rows": [
        {
          "feature": "Built-in or headless CMS integration",
          "statuses": {
            "grapesjs": "not-documented",
            "webstudio": "available",
            "wordpress": "available"
          },
          "note": "Webstudio connects to external headless sources like Strapi, Supabase, Notion, and WordPress; WordPress has a native built-in CMS."
        }
      ]
    },
    {
      "group": "Extensibility and Cost",
      "rows": [
        {
          "feature": "Free tier available",
          "statuses": {
            "grapesjs": "available",
            "webstudio": "available",
            "wordpress": "available"
          }
        },
        {
          "feature": "Plugin or extension ecosystem",
          "statuses": {
            "grapesjs": "available",
            "webstudio": "not-documented",
            "wordpress": "available"
          },
          "note": "GrapesJS ships a plugin and command API for custom blocks; WordPress has a large official plugin and theme directory."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are GrapesJS, Webstudio, and WordPress all open source?",
      "answer": "Yes. GrapesJS's core library, Webstudio's builder under AGPL-3.0-or-later, and WordPress under GPLv2 or later all have open-source cores that can be self-hosted, though GrapesJS's commercial Studio SDK and any WordPress hosting still involve separate costs."
    },
    {
      "question": "Which is the easiest for non-developers to use out of the box?",
      "answer": "Webstudio and WordPress both offer ready-to-use visual or block editors that non-developers can pick up directly. Raw GrapesJS requires developer setup before it becomes a usable, end-user-facing builder."
    },
    {
      "question": "Can Webstudio connect to WordPress as a CMS?",
      "answer": "Yes. Webstudio is designed to connect to external headless content sources, including WordPress, Strapi, Supabase, and Notion, rather than forcing its own proprietary CMS."
    },
    {
      "question": "Which has the largest plugin ecosystem?",
      "answer": "WordPress, with tens of thousands of free and premium plugins and themes covering nearly any website need, built up over more than two decades."
    },
    {
      "question": "Is there a free way to use each tool?",
      "answer": "Yes. WordPress software is free, GrapesJS's core library and Studio SDK both have free tiers, and Webstudio's Hobby plan is free for unlimited projects and pages on a wstd.io subdomain."
    },
    {
      "question": "Which is better for developers building their own SaaS page builder?",
      "answer": "GrapesJS, thanks to its framework-agnostic library and embeddable, white-labelable Studio SDK designed specifically for integration into other products."
    }
  ]
};

export default grapesjsVsWebstudioVsWordpressContent;

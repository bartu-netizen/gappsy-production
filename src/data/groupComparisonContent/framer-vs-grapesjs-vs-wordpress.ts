import type { GroupComparisonContent } from './types';

const framerVsGrapesjsVsWordpressContent: GroupComparisonContent = {
  "verdict": "Framer, GrapesJS, and WordPress sit at different points on the build-your-own-website spectrum. Framer is a polished, hosted no-code builder with an AI site generator, built-in CMS, and integrated hosting on every paid plan. GrapesJS is an open-source, self-hostable drag-and-drop framework and SDK better suited to developers embedding an editor into their own product than to someone wanting a finished site out of the box. WordPress is the free, self-hosted, open-source CMS with by far the largest plugin and theme ecosystem and full control over hosting and code.",
  "bestFor": {
    "framer": "Designers and small teams who want a fast, no-code, AI-assisted website builder with integrated hosting and strong visual design tools.",
    "grapesjs": "Developers building a custom page or email editor into their own product, or teams wanting a free, self-hostable drag-and-drop framework.",
    "wordpress": "Anyone wanting the largest plugin and theme ecosystem and full self-hosted control over code, hosting, and data with no vendor lock-in."
  },
  "highlights": [
    {
      "title": "AI-Generated Sites From a Description",
      "description": "Framer's AI-assisted site generation lets users describe a website and get an initial design and layout to edit from, rendered as real production code rather than a static mockup.",
      "toolSlugs": [
        "framer"
      ]
    },
    {
      "title": "Embeddable SDK for Developers",
      "description": "GrapesJS's Studio SDK is a packaged, white-labelable version of its editor for embedding a drag-and-drop builder directly inside another SaaS product.",
      "toolSlugs": [
        "grapesjs"
      ]
    },
    {
      "title": "Largest Plugin and Theme Ecosystem",
      "description": "WordPress's official directory of free plugins and themes, built over more than two decades, is far larger than the ecosystems around Framer or GrapesJS.",
      "toolSlugs": [
        "wordpress"
      ]
    },
    {
      "title": "Fully Open-Source and Self-Hostable",
      "description": "GrapesJS's core framework and WordPress's core CMS are both free, open source, and self-hostable, unlike Framer, which is a proprietary hosted SaaS product.",
      "toolSlugs": [
        "grapesjs",
        "wordpress"
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
            "framer": "available",
            "grapesjs": "available",
            "wordpress": "available"
          },
          "note": "GrapesJS provides the underlying editor framework; production use typically requires developer integration or the hosted Studio product."
        },
        {
          "feature": "AI-assisted site or template generation",
          "statuses": {
            "framer": "available",
            "grapesjs": "available",
            "wordpress": "not-documented"
          }
        },
        {
          "feature": "Built-in content management system",
          "statuses": {
            "framer": "available",
            "grapesjs": "not-documented",
            "wordpress": "available"
          }
        }
      ]
    },
    {
      "group": "Hosting and Deployment",
      "rows": [
        {
          "feature": "Integrated hosting included",
          "statuses": {
            "framer": "available",
            "grapesjs": "not-documented",
            "wordpress": "unavailable"
          },
          "note": "WordPress requires the site owner to source and manage their own hosting."
        },
        {
          "feature": "Free, self-hosted open-source core",
          "statuses": {
            "framer": "unavailable",
            "grapesjs": "available",
            "wordpress": "available"
          }
        }
      ]
    },
    {
      "group": "Ecosystem",
      "rows": [
        {
          "feature": "Free plan or free tier available",
          "statuses": {
            "framer": "available",
            "grapesjs": "available",
            "wordpress": "available"
          }
        },
        {
          "feature": "Third-party plugin and template marketplace",
          "statuses": {
            "framer": "limited",
            "grapesjs": "limited",
            "wordpress": "available"
          },
          "note": "Framer and GrapesJS both have smaller ecosystems than WordPress's official plugin and theme directory."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is GrapesJS a website builder in the same sense as Framer or WordPress?",
      "answer": "Not exactly. GrapesJS is primarily an open-source drag-and-drop framework and SDK for building custom editors, and it is often embedded by developers into their own products. Its hosted Studio product can also generate templates, but it is generally more developer-oriented than Framer or WordPress."
    },
    {
      "question": "Which of these three is free to self-host?",
      "answer": "GrapesJS's core framework and WordPress are both free and open source to self-host. Framer is a hosted SaaS product and does not offer a self-hosted option."
    },
    {
      "question": "Does Framer include AI website generation?",
      "answer": "Yes. Framer includes AI-assisted site generation where a user can describe a website and get an initial design and layout to edit, rendered as real production code."
    },
    {
      "question": "Which of the three has the largest plugin and theme ecosystem?",
      "answer": "WordPress, by a wide margin, with thousands of free and premium themes and plugins in its official directory."
    },
    {
      "question": "Can GrapesJS be embedded inside my own product?",
      "answer": "Yes. GrapesJS's Studio SDK is designed to be embedded and white-labeled inside another SaaS product, with pricing based on monthly session volume."
    }
  ]
};

export default framerVsGrapesjsVsWordpressContent;

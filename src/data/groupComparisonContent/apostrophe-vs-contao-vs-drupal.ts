import type { GroupComparisonContent } from './types';

const apostropheVsContaoVsDrupalContent: GroupComparisonContent = {
  "verdict": "Apostrophe, Contao, and Drupal are all free, self-hosted, open-source content management systems, but they target different priorities: Apostrophe leans on a modern Node.js stack with in-context visual editing, Contao is built around an accessibility-first, Symfony-based PHP core, and Drupal offers the deepest flexibility and the largest module ecosystem for complex or large-scale sites. There is no single winner; the right choice depends on team skill set (Node.js versus PHP), how much editorial simplicity matters, and how complex the site's content structure needs to be.",
  "bestFor": {
    "apostrophe": "Content teams that want to edit pages directly on the live site and developers who want an optional headless/API mode with modern JavaScript frameworks.",
    "contao": "Organizations that prioritize accessible, WCAG-conformant output and want a Symfony-based PHP CMS with native multilingual and newsletter tools.",
    "drupal": "Large, complex, or multi-site deployments that need maximum content-model flexibility, enterprise-grade security governance, and a large contributed module ecosystem."
  },
  "highlights": [
    {
      "title": "Apostrophe's in-context editing changes the authoring workflow",
      "description": "Content editors can edit page content directly on the live rendered page in Apostrophe rather than filling out a separate admin form, which lowers the learning curve for non-technical teams.",
      "toolSlugs": [
        "apostrophe"
      ]
    },
    {
      "title": "Contao is built around accessibility from the ground up",
      "description": "Contao's templates and back-end conventions are oriented around producing barrier-free, WCAG-conformant websites, a focus the other two tools do not call out as a defining feature.",
      "toolSlugs": [
        "contao"
      ]
    },
    {
      "title": "Drupal has by far the largest module and theme ecosystem",
      "description": "Thousands of community-built contributed modules add e-commerce, SEO, workflow, and integration capabilities, and Drupal ships with REST and JSON:API support for headless/decoupled delivery to React, Vue, or mobile front ends.",
      "toolSlugs": [
        "drupal"
      ]
    },
    {
      "title": "Only Apostrophe offers official managed hosting from the vendor",
      "description": "Apostrophe sells its own managed hosting plans starting at $39/month as an alternative to self-hosting, while Contao and Drupal are self-hosted with no official first-party hosting plan in the provided data.",
      "toolSlugs": [
        "apostrophe"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core capabilities",
      "rows": [
        {
          "feature": "Free open-source core",
          "statuses": {
            "apostrophe": "available",
            "contao": "available",
            "drupal": "available"
          }
        },
        {
          "feature": "In-context / visual page editing",
          "statuses": {
            "apostrophe": "available",
            "contao": "limited",
            "drupal": "not-documented"
          },
          "note": "Contao offers structured content-element management in the back end rather than full live-page in-context editing."
        },
        {
          "feature": "Multilingual site support",
          "statuses": {
            "apostrophe": "available",
            "contao": "available",
            "drupal": "available"
          }
        }
      ]
    },
    {
      "group": "Developer and hosting model",
      "rows": [
        {
          "feature": "Headless / API content delivery",
          "statuses": {
            "apostrophe": "available",
            "contao": "not-documented",
            "drupal": "available"
          }
        },
        {
          "feature": "Official managed hosting from the vendor",
          "statuses": {
            "apostrophe": "available",
            "contao": "unavailable",
            "drupal": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Ecosystem and accessibility",
      "rows": [
        {
          "feature": "Accessibility (WCAG) as a stated design focus",
          "statuses": {
            "apostrophe": "not-documented",
            "contao": "available",
            "drupal": "not-documented"
          }
        },
        {
          "feature": "Size of contributed module/theme ecosystem",
          "statuses": {
            "apostrophe": "limited",
            "contao": "limited",
            "drupal": "available"
          },
          "note": "Both Apostrophe and Contao are described as having a smaller plugin/theme ecosystem than dominant platforms; Drupal's ecosystem includes thousands of contributed modules."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is easiest for non-technical content editors to use day to day?",
      "answer": "Apostrophe is designed around this specifically: its in-context visual editing lets editors change content directly on the live rendered page instead of navigating a separate admin form, which is generally friendlier for non-technical teams than Contao's or Drupal's back-end-driven editing screens."
    },
    {
      "question": "Which CMS is the best fit for a site that must meet strict accessibility standards?",
      "answer": "Contao is the strongest fit among these three, since its templates and back-end conventions are explicitly oriented around producing barrier-free, WCAG-conformant websites, and it has a stated strong accessibility track record."
    },
    {
      "question": "Which CMS scales best for a large, complex, or multi-site deployment?",
      "answer": "Drupal is built for this scenario: it supports custom content modeling, granular role-based permissions, multi-site management from a single codebase, and a dedicated security team, backed by thousands of contributed modules for e-commerce, SEO, and workflow needs."
    },
    {
      "question": "Do any of these three offer official managed hosting from the company behind the CMS?",
      "answer": "Apostrophe does, with managed hosting plans starting at $39/month plus a custom Enterprise hosting option. Contao and Drupal are self-hosted open-source projects without an official first-party hosting plan in the available data, so teams typically rely on third-party hosts or their own infrastructure."
    },
    {
      "question": "Are all three of these CMS platforms free to use?",
      "answer": "Yes. Apostrophe's Community Edition, Contao's core, and Drupal's core are all free and open source. Apostrophe additionally offers paid Pro, Assembly, and Enterprise tiers for advanced permissions, versioning, AI tooling, and multisite management, which are optional upgrades rather than requirements."
    },
    {
      "question": "Which one requires the least PHP-specific expertise to run?",
      "answer": "Apostrophe is built on Node.js and Vue.js rather than PHP, so teams without PHP experience may find it more approachable. Contao and Drupal are both PHP-based systems (Contao on Symfony), so they generally require PHP and, for Drupal in particular, MySQL/database administration skills."
    }
  ]
};

export default apostropheVsContaoVsDrupalContent;

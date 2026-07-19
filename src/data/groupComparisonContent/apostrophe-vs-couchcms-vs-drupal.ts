import type { GroupComparisonContent } from './types';

const apostropheVsCouchcmsVsDrupalContent: GroupComparisonContent = {
  "verdict": "Apostrophe, CouchCMS, and Drupal sit at very different points on the complexity spectrum even though all three are free, self-hosted content management systems. CouchCMS is the lightest-weight option, designed to turn an existing HTML/CSS template into an editable site with minimal setup; Drupal is the heaviest, built for complex, large-scale, or multi-site projects; and Apostrophe sits in between, offering modern in-context visual editing on a Node.js stack. Choosing between them is less about which is 'best' and more about how much structure and scale the project actually needs.",
  "bestFor": {
    "apostrophe": "Content teams that want in-context visual editing and an optional headless/API mode without adopting Drupal's full complexity.",
    "couchcms": "Designers and developers who already have an HTML/CSS template and want to make it editable with minimal rebuilding or overhead.",
    "drupal": "Large, complex, or multi-site projects that need maximum content-model flexibility and a big contributed module ecosystem."
  },
  "highlights": [
    {
      "title": "CouchCMS reuses existing templates instead of forcing a new theme system",
      "description": "CouchCMS turns any existing static HTML/CSS template into a CMS-managed site by inserting simple tags directly into the markup, letting designers keep their existing front-end work rather than rebuilding it in a new theming language.",
      "toolSlugs": [
        "couchcms"
      ]
    },
    {
      "title": "Apostrophe's in-context editing suits content teams, not just developers",
      "description": "Editors change content directly on the live rendered page in Apostrophe, which is a meaningfully different (and generally friendlier) editorial workflow than CouchCMS's tag-based editable regions or Drupal's admin forms.",
      "toolSlugs": [
        "apostrophe"
      ]
    },
    {
      "title": "Drupal's ecosystem dwarfs the other two",
      "description": "Drupal ships with thousands of community-built contributed modules covering e-commerce, SEO, workflow, and integrations, plus built-in REST and JSON:API support, compared to the much smaller plugin ecosystems around Apostrophe and CouchCMS.",
      "toolSlugs": [
        "drupal"
      ]
    },
    {
      "title": "Licensing approaches differ even though all three are free",
      "description": "Apostrophe's core is free with optional paid Pro/Assembly/Enterprise tiers and managed hosting, CouchCMS is free under the CPAL license with an optional one-time commercial license to remove attribution, and Drupal's core is entirely free with no vendor-sold commercial tier.",
      "toolSlugs": [
        "apostrophe",
        "couchcms",
        "drupal"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CMS model",
      "rows": [
        {
          "feature": "Free open-source core",
          "statuses": {
            "apostrophe": "available",
            "couchcms": "available",
            "drupal": "available"
          }
        },
        {
          "feature": "In-context / visual live-page editing",
          "statuses": {
            "apostrophe": "available",
            "couchcms": "limited",
            "drupal": "not-documented"
          },
          "note": "CouchCMS uses tag-based editable regions inserted into existing templates rather than full in-context editing of the live page."
        },
        {
          "feature": "Build the CMS around an existing HTML/CSS template",
          "statuses": {
            "apostrophe": "not-documented",
            "couchcms": "available",
            "drupal": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Headless / API content delivery",
          "statuses": {
            "apostrophe": "available",
            "couchcms": "not-documented",
            "drupal": "available"
          }
        },
        {
          "feature": "Size of contributed module/theme ecosystem",
          "statuses": {
            "apostrophe": "limited",
            "couchcms": "limited",
            "drupal": "available"
          }
        }
      ]
    },
    {
      "group": "Licensing and hosting",
      "rows": [
        {
          "feature": "Vendor-sold commercial/paid tier",
          "statuses": {
            "apostrophe": "available",
            "couchcms": "available",
            "drupal": "unavailable"
          },
          "note": "Apostrophe sells Pro, Assembly, and Enterprise tiers plus managed hosting; CouchCMS sells an optional one-time commercial license (CCCL) to remove attribution; Drupal's core has no vendor-sold paid tier in the provided data."
        },
        {
          "feature": "Official managed hosting from the vendor",
          "statuses": {
            "apostrophe": "available",
            "couchcms": "unavailable",
            "drupal": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these is best if I already have a finished HTML/CSS design and just want it editable?",
      "answer": "CouchCMS is purpose-built for exactly this scenario: it turns an existing static HTML/CSS template into a database-driven, editable site by inserting simple tags into the markup, without requiring a rebuild in a new theming system."
    },
    {
      "question": "Which offers the most modern content-editing experience?",
      "answer": "Apostrophe is the strongest fit for editorial teams, since it supports in-context visual editing directly on the live rendered page, a more modern workflow than CouchCMS's tag-based editable regions or Drupal's traditional admin-form editing."
    },
    {
      "question": "Which has the largest ecosystem of modules, themes, and integrations?",
      "answer": "Drupal by a wide margin. It has thousands of community-contributed modules covering e-commerce, SEO, workflow, and integrations, while both Apostrophe and CouchCMS are described as having smaller plugin and theme ecosystems."
    },
    {
      "question": "Is CouchCMS really free to use commercially?",
      "answer": "Yes. CouchCMS is released under the Common Public Attribution License 1.0, which permits free commercial use as long as attribution is kept in the source code. An optional one-time commercial license (CCCL) is available to remove the attribution link and rebrand the admin panel."
    },
    {
      "question": "Do I need Node.js or PHP skills for these three CMS platforms?",
      "answer": "Apostrophe is built on Node.js and Vue.js, so it requires JavaScript/Node.js development skills to build and customize. CouchCMS and Drupal are both PHP-based and require PHP and MySQL hosting."
    },
    {
      "question": "Which one is overkill for a simple brochure or small business site?",
      "answer": "Drupal is generally the heaviest option of the three, with a steeper learning curve and higher total cost of ownership once development, hosting, and maintenance are factored in, which makes it better suited to complex or large-scale sites than a simple brochure site where CouchCMS or Apostrophe's Community Edition would be a lighter fit."
    }
  ]
};

export default apostropheVsCouchcmsVsDrupalContent;

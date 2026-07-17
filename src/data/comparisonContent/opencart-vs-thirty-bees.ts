import type { ToolComparisonContent } from './types';

const opencartVsThirtyBeesContent: ToolComparisonContent = {
  "verdict": "OpenCart and Thirty Bees are both free, open-source, self-hosted PHP ecommerce platforms, but they took different paths to get there: OpenCart (founded 2009) grew its own ecosystem into a marketplace of over 13,000 extensions and themes, while Thirty Bees (founded 2017) was created as a fork of PrestaShop 1.6, inheriting compatibility with many PrestaShop 1.6 modules and themes and shipping with 500+ built-in features. OpenCart leans on breadth of third-party extensions; Thirty Bees leans on a larger built-in feature set plus a pre-existing PrestaShop-compatible ecosystem.",
  "bestForToolA": "OpenCart fits merchants who want the longest-established, most extension-rich free PHP cart (13,000+ marketplace listings) and are comfortable assembling functionality through third-party extensions and themes.",
  "bestForToolB": "Thirty Bees fits merchants who want a large set of features (500+) already built into the core, or who are already familiar with or invested in the PrestaShop 1.6 module/theme ecosystem and want continued compatibility.",
  "whoNeedsBoth": "There's no realistic scenario for using both together — both are complete, self-hosted ecommerce platforms, so a merchant chooses one as the foundation of their store rather than running them in parallel.",
  "keyDifferences": [
    {
      "title": "Origin and Founding Year",
      "toolA": "OpenCart was founded in 2009 as an independent PHP shopping cart project.",
      "toolB": "Thirty Bees was founded in 2017 as a fork of PrestaShop 1.6, created to maintain a stable, compatible alternative.",
      "whyItMatters": "OpenCart's longer independent history versus Thirty Bees's inherited PrestaShop lineage shapes each platform's starting feature set and community.",
      "benefitsWho": "Merchants with existing PrestaShop 1.6 investments benefit from Thirty Bees's compatibility lineage; those wanting an independently evolved platform may prefer OpenCart."
    },
    {
      "title": "Built-in Feature Count",
      "toolA": "OpenCart's core feature set centers on catalog/order management, multi-language/currency support, and payment gateway integrations, with more advanced functionality typically added via extensions.",
      "toolB": "Thirty Bees ships with 500+ built-in features out of the box, including flexible checkout options, multi-site/multi-currency support, built-in SEO tools, and native PDF invoice generation.",
      "whyItMatters": "A larger built-in feature count can reduce reliance on paid third-party extensions to reach a usable feature set.",
      "benefitsWho": "Merchants who want more capability pre-installed without shopping for extensions benefit from Thirty Bees."
    },
    {
      "title": "Extension/Module Ecosystem Size",
      "toolA": "OpenCart's official marketplace lists over 13,000 extensions and themes.",
      "toolB": "Thirty Bees retains compatibility with many modules and themes built for PrestaShop 1.6, but its own dedicated marketplace and community are described as smaller than platforms like PrestaShop.",
      "whyItMatters": "A larger, dedicated extension marketplace (OpenCart) generally offers more choice and competition on price for add-on functionality.",
      "benefitsWho": "Merchants wanting maximum choice in pre-built extensions benefit from OpenCart's larger marketplace."
    },
    {
      "title": "Active Maintenance Signal",
      "toolA": "OpenCart is described as a long-running project with an active developer community, without a specific recent version date cited.",
      "toolB": "Thirty Bees released version 1.6 in November 2024, cited as evidence of ongoing active development.",
      "whyItMatters": "A recent release date is a concrete, verifiable signal of active maintenance that buyers can point to.",
      "benefitsWho": "Buyers wanting reassurance a smaller open-source project is still actively maintained benefit from Thirty Bees's documented recent release."
    },
    {
      "title": "SEO Tooling",
      "toolA": "OpenCart's documented feature list does not call out dedicated built-in SEO tools.",
      "toolB": "Thirty Bees includes built-in SEO-oriented configuration options as a named feature.",
      "whyItMatters": "Native SEO configuration reduces the need for separate SEO extensions or manual setup.",
      "benefitsWho": "Merchants without an SEO extension budget who want baseline SEO controls out of the box."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Basics",
      "rows": [
        {
          "feature": "Free, open-source, self-hosted",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Founding year",
          "toolA": "available",
          "toolB": "available",
          "note": "OpenCart: 2009; Thirty Bees: 2017"
        },
        {
          "feature": "GPL / open license",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OpenCart explicitly GPL-licensed"
        }
      ]
    },
    {
      "group": "Built-in Features",
      "rows": [
        {
          "feature": "Built-in SEO tools",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Native PDF invoice generation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-language and multi-currency",
          "toolA": "available",
          "toolB": "available",
          "note": "Thirty Bees: multi-site + multi-currency"
        },
        {
          "feature": "Responsive (Bootstrap-based) storefront",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Ecosystem",
      "rows": [
        {
          "feature": "Official extension/theme marketplace size",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OpenCart: 13,000+ listings"
        },
        {
          "feature": "PrestaShop 1.6 module/theme compatibility",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multiple payment gateways",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OpenCart: PayPal, Authorize.Net, Amazon Payments, Klarna"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Thirty Bees related to OpenCart?",
      "answer": "No, they are unrelated projects. Thirty Bees is a fork of PrestaShop 1.6 (created in 2017), while OpenCart is an independently developed PHP shopping cart platform founded in 2009."
    },
    {
      "question": "Which platform has more built-in features?",
      "answer": "Thirty Bees documents 500+ built-in features out of the box. OpenCart's core is comparatively lean, with advanced functionality typically added via its 13,000+ extension marketplace."
    },
    {
      "question": "Which has the larger extension marketplace?",
      "answer": "OpenCart's official marketplace lists over 13,000 extensions and themes, a scale not documented for Thirty Bees, though Thirty Bees retains compatibility with many existing PrestaShop 1.6 modules and themes."
    },
    {
      "question": "Are OpenCart and Thirty Bees both free?",
      "answer": "Yes, both have free, open-source cores that require self-hosting. Thirty Bees notes that some modules, themes, and support are paid add-ons via its marketplace."
    },
    {
      "question": "Is Thirty Bees still actively maintained?",
      "answer": "Yes, the project released version 1.6 in November 2024, indicating ongoing development. OpenCart's data does not cite a specific recent release date but describes it as a long-running, actively maintained project."
    },
    {
      "question": "Does either platform include built-in SEO tools?",
      "answer": "Thirty Bees documents built-in SEO-oriented configuration options as a named feature. OpenCart's documented feature list does not call out dedicated SEO tooling."
    }
  ]
};

export default opencartVsThirtyBeesContent;

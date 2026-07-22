import type { ToolComparisonContent } from './types';

const keystonejsVsSubstackContent: ToolComparisonContent = {
  "verdict": "KeystoneJS is a free, open-source Node.js/TypeScript framework that generates a GraphQL API and admin UI from a schema — a developer tool for building custom applications and content backends. Substack is a free, hosted platform purpose-built for writers to publish and monetize newsletters, podcasts, and video with zero setup. These serve fundamentally different audiences: one is infrastructure for engineers building custom software, the other is a turnkey publishing product for non-technical writers.",
  "bestForToolA": "Developers building a custom application or content-driven product who want an auto-generated GraphQL API and admin UI from a TypeScript schema, with full self-hosting control, fit KeystoneJS best.",
  "bestForToolB": "Independent writers or creators who want to launch a paid newsletter, podcast, or video publication instantly, without writing code or managing infrastructure, fit Substack best.",
  "whoNeedsBoth": "A company could build its core product or documentation site on KeystoneJS as a headless content backend while separately running a content-marketing newsletter on Substack to reach and monetize an audience.",
  "keyDifferences": [
    {
      "title": "Target User",
      "toolA": "KeystoneJS is a developer framework requiring Node.js and TypeScript skills — it is a coding tool, not a no-code platform.",
      "toolB": "Substack requires no coding at all; writers sign up and start publishing directly through a hosted interface.",
      "whyItMatters": "The required skill set determines whether a solo non-technical creator can use the tool without help.",
      "benefitsWho": "Engineering teams benefit from KeystoneJS's code-first flexibility; non-technical writers benefit from Substack's no-code simplicity."
    },
    {
      "title": "Content Model Flexibility",
      "toolA": "KeystoneJS lets developers define a custom schema, which automatically generates a GraphQL API with CRUD, pagination, sorting, and filtering plus a customizable admin UI.",
      "toolB": "Substack has a fixed content model built around posts, podcasts, and video — there is no custom schema or data modeling.",
      "whyItMatters": "Custom schema support matters for building bespoke applications; a fixed model matters less when the goal is simply publishing.",
      "benefitsWho": "Developers building custom apps benefit from KeystoneJS's schema-driven approach."
    },
    {
      "title": "Built-In Monetization",
      "toolA": "KeystoneJS has no documented monetization or payment features — it is a CMS/API backend, not a publishing business platform.",
      "toolB": "Substack has built-in paid subscriptions, with writers keeping 90% of subscription revenue.",
      "whyItMatters": "For anyone wanting to charge readers directly, built-in payments remove significant engineering work.",
      "benefitsWho": "Writers seeking to monetize content immediately benefit from Substack."
    },
    {
      "title": "Hosting Responsibility",
      "toolA": "KeystoneJS requires self-hosting or third-party PaaS deployment (DigitalOcean, Heroku, Render, Vercel, AWS, Azure, Google Cloud) — there is no official managed hosting product.",
      "toolB": "Substack is fully managed and hosted by Substack itself, with no deployment step required by the writer.",
      "whyItMatters": "Hosting responsibility affects both technical overhead and ongoing operational cost.",
      "benefitsWho": "Teams wanting zero infrastructure management benefit from Substack; teams needing infrastructure control benefit from KeystoneJS."
    },
    {
      "title": "Cost Structure",
      "toolA": "KeystoneJS is fully free and open source under the MIT license; paid enterprise support is available separately through Thinkmill, not as a packaged pricing tier.",
      "toolB": "Substack is free to publish on but takes a 10% cut of paid subscription revenue, on top of separate payment-processing fees.",
      "whyItMatters": "One model has no ongoing platform cost at all; the other's cost scales directly with monetization success.",
      "benefitsWho": "Developers with in-house hosting capacity benefit from KeystoneJS's zero licensing cost; writers prioritizing simplicity over revenue share benefit from Substack."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Type & Audience",
      "rows": [
        {
          "feature": "No-code / non-technical use",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Custom schema/data modeling",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Auto-generated GraphQL API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Auto-generated admin UI",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Publishing & Monetization",
      "rows": [
        {
          "feature": "Built-in paid subscriptions",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Substack: 90% revenue to writer"
        },
        {
          "feature": "Multi-format publishing (podcast/video)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in reader/discovery network",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Hosting & Cost",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Managed/hosted option",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free to use core product",
          "toolA": "available",
          "toolB": "available",
          "note": "KeystoneJS fully free (MIT); Substack free minus 10% subscription cut"
        },
        {
          "feature": "Paid enterprise support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "KeystoneJS via Thinkmill enterprise contract"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is KeystoneJS a good fit for building a newsletter site?",
      "answer": "Not directly — KeystoneJS is a general headless CMS/GraphQL framework for developers, not a purpose-built newsletter platform like Substack."
    },
    {
      "question": "Does Substack require developers to set up?",
      "answer": "No. Substack is a hosted, no-code platform; writers can start publishing with no contract or upfront fee."
    },
    {
      "question": "Is KeystoneJS free?",
      "answer": "Yes, it's free and open source under the MIT license. Paid enterprise support is available separately through Thinkmill, the consultancy that maintains it."
    },
    {
      "question": "Can KeystoneJS handle payments or subscriptions?",
      "answer": "This is not documented as a KeystoneJS feature — it's a schema-driven API/admin-UI framework, not a monetization platform."
    },
    {
      "question": "Who maintains KeystoneJS?",
      "answer": "Thinkmill, an Australian design and development consultancy, has maintained it since the project's first commit in 2013, with contributions from 250+ people."
    },
    {
      "question": "Which tool requires ongoing infrastructure management?",
      "answer": "KeystoneJS requires self-hosting or third-party PaaS deployment. Substack is fully managed by Substack, with no hosting responsibility for the writer."
    }
  ]
};

export default keystonejsVsSubstackContent;

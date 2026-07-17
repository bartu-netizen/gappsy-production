import type { ToolComparisonContent } from './types';

const silexVsWordpressContent: ToolComparisonContent = {
  "verdict": "Silex is a 100% free, open-source, donation-funded visual builder for static sites maintained by the nonprofit Silex Labs, producing standard HTML/CSS with no vendor lock-in; WordPress is a free, open-source, self-hosted, database-driven CMS with a vast plugin and theme ecosystem for building anything from blogs to full e-commerce stores. Silex targets simpler, static, SEO-friendly sites with direct code access, while WordPress targets dynamic, extensible sites needing structured content types and plugins.",
  "bestForToolA": "Individuals or small teams wanting a fully free (donation-funded, no paid tiers) visual builder that outputs SEO-optimized static HTML/CSS with no vendor lock-in, especially if they want to pull data from Supabase, Strapi, or GraphQL APIs.",
  "bestForToolB": "Anyone needing a dynamic, database-driven site with structured content types, user roles, multisite support, and access to WordPress's tens of thousands of plugins and themes, including e-commerce via WooCommerce.",
  "whoNeedsBoth": "Since Silex documents a direct WordPress CMS integration, a team could use WordPress as the content backend while using Silex's visual editor to design and generate the front-end static site pages that pull that WordPress content.",
  "keyDifferences": [
    {
      "title": "Site Architecture",
      "toolA": "Generates static output while still supporting dynamic, data-driven content pulled from connected sources.",
      "toolB": "Is a dynamic, database-driven CMS that renders pages via themes and plugins on each request.",
      "whyItMatters": "Static output can be faster and cheaper to host, while a dynamic CMS offers more built-in interactivity without extra configuration.",
      "benefitsWho": "Teams prioritizing simple, fast, low-maintenance hosting (Silex) versus teams needing rich dynamic functionality out of the box (WordPress)."
    },
    {
      "title": "Pricing",
      "toolA": "100% free and open source under the AGPL license, with no paid tiers at all, funded by donations.",
      "toolB": "Core software is free under the GPL, but hosting, domains, and premium themes or plugins are separate costs.",
      "whyItMatters": "Silex has no paid tier to budget for, while WordPress's total cost depends on the hosting and extensions chosen.",
      "benefitsWho": "Zero-budget individual creators (Silex) versus those willing to pay for hosting or premium plugins for more features (WordPress)."
    },
    {
      "title": "Governance & Development Pace",
      "toolA": "Maintained by Silex Labs, a nonprofit, funded by donations, which its own listed cons note can mean slower feature development than VC-backed competitors.",
      "toolB": "Backed by a large community, extensive documentation, and a huge developer talent pool actively maintaining core software.",
      "whyItMatters": "Affects how quickly bugs get fixed and new features ship.",
      "benefitsWho": "Teams needing rapid third-party plugin availability (WordPress) versus those aligned with a nonprofit, donation-funded governance model (Silex)."
    },
    {
      "title": "Ecosystem Size",
      "toolA": "Has a smaller plugin/integration ecosystem than commercial alternatives like Webflow, per its own listed cons, though it connects to WordPress, Strapi, Supabase, and Squidex as CMS backends.",
      "toolB": "Has tens of thousands of plugins and themes.",
      "whyItMatters": "A bigger ecosystem means more out-of-the-box features without custom development work.",
      "benefitsWho": "Non-technical users wanting existing plugins (WordPress) versus developers comfortable connecting a handful of CMS/API integrations (Silex)."
    },
    {
      "title": "Code Access & Lock-In",
      "toolA": "Built on open web standards with no vendor lock-in and direct access to underlying HTML/CSS while editing visually.",
      "toolB": "Also open source and self-hosted with no vendor lock-in, though functionality is more plugin- and theme-dependent than raw markup editing.",
      "whyItMatters": "Both avoid proprietary lock-in, but Silex emphasizes direct standard-markup editing as a core design principle.",
      "benefitsWho": "Developers who want to edit HTML/CSS directly while still using a visual tool (Silex)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Site Building & Output",
      "rows": [
        {
          "feature": "Visual drag-and-drop editor",
          "toolA": "available",
          "toolB": "available",
          "note": "Silex vs. Gutenberg block editor"
        },
        {
          "feature": "Static site generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "WordPress is dynamic by default"
        },
        {
          "feature": "SEO-optimized output by default",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Depends on WordPress theme/plugins"
        },
        {
          "feature": "Direct HTML/CSS access while editing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Governance",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available",
          "note": "Silex has no paid tiers at all"
        },
        {
          "feature": "Paid premium tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Premium WordPress themes, plugins, hosting"
        },
        {
          "feature": "Nonprofit / donation-funded governance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Silex Labs"
        },
        {
          "feature": "Offline-first desktop app",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "In development, not yet available for Silex"
        }
      ]
    },
    {
      "group": "CMS & Data Integrations",
      "rows": [
        {
          "feature": "Plugin/theme marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tens of thousands of plugins and themes"
        },
        {
          "feature": "CMS backend integrations (WordPress, Strapi, Supabase, Squidex)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "WordPress is itself the CMS"
        },
        {
          "feature": "Multisite networks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "REST/GraphQL API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Silex connects via GraphQL APIs; WordPress has a native REST API"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Silex really free?",
      "answer": "Yes, all features are free of charge, funded through donations, with no paid tiers, under the AGPL license."
    },
    {
      "question": "Is WordPress really free?",
      "answer": "Yes, the core software is free under the GPL; hosting, domain, and premium themes or plugins cost extra."
    },
    {
      "question": "Can Silex connect to WordPress?",
      "answer": "Yes, Silex documents CMS integrations with WordPress, Strapi, Supabase, and Squidex."
    },
    {
      "question": "Who maintains Silex?",
      "answer": "Silex Labs, a nonprofit organization."
    },
    {
      "question": "Does Silex have an offline desktop app?",
      "answer": "An offline-first desktop app is in development and not yet available."
    },
    {
      "question": "Can WordPress be used for e-commerce?",
      "answer": "Yes, via plugins like WooCommerce, which add product catalogs, payments, shipping, and inventory management."
    }
  ]
};

export default silexVsWordpressContent;

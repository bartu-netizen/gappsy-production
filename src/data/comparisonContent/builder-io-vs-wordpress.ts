import type { ToolComparisonContent } from './types';

const builderIoVsWordpressContent: ToolComparisonContent = {
  "verdict": "Builder.io is a visual development platform combining an AI-assisted visual editor, production code sync, and a headless CMS aimed at engineering-led teams; WordPress is a free, open-source, self-hosted CMS with an enormous plugin and theme ecosystem that powers everything from blogs to full e-commerce sites on its own. Builder.io is often used as a front-end/CMS layer that plugs into an existing codebase, while WordPress is a complete, self-contained CMS that needs no additional development platform to function.",
  "bestForToolA": "Engineering-led teams wanting an AI-assisted visual editor whose edits map directly into production components and Git, with enterprise integrations for commerce, search, and localization (Builder.io lists users like Everlane, Zapier, and J.Crew).",
  "bestForToolB": "Anyone wanting a free, self-hosted CMS with full control over hosting and data, tens of thousands of plugins (including WooCommerce for e-commerce), and a large community and developer talent pool, from simple blogs to complex sites.",
  "whoNeedsBoth": "A team could run WordPress as the content backend using its native REST API while using Builder.io's visual editor and Fusion tooling to build and edit the actual front-end UI and components that consume that content, effectively pairing a headless WordPress backend with a Builder.io front end.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Builder.io has a Free tier at $0/user/month (1 user, 60 AI agent credits), then Pro at $24/user/month, Team at $40/user/month, and custom Enterprise, plus AI credit overages at $25 per 500.",
      "toolB": "WordPress core software is free and open source under the GPL; only hosting, a domain name, and optional premium themes or plugins cost extra.",
      "whyItMatters": "WordPress's cost is driven by hosting and extensions chosen, while Builder.io scales per user and per AI credit usage.",
      "benefitsWho": "Cost-sensitive solo bloggers or small sites (WordPress) versus teams needing AI-assisted visual editing budgeted per seat (Builder.io)."
    },
    {
      "title": "Hosting Model",
      "toolA": "Not documented as self-hostable; it operates as a cloud platform with no self-hosting option mentioned in its feature set.",
      "toolB": "WordPress is self-hosted by design, requiring you to choose and manage your own hosting provider.",
      "whyItMatters": "Self-hosting gives full control over data and infrastructure at the cost of added maintenance responsibility.",
      "benefitsWho": "IT teams wanting full infrastructure control (WordPress) versus teams preferring a managed SaaS platform (Builder.io)."
    },
    {
      "title": "Extensibility & Ecosystem",
      "toolA": "Offers enterprise integrations connecting to commerce, search, asset management, and localization tools, plus an MCP connector, rather than an open plugin marketplace.",
      "toolB": "Has tens of thousands of free and paid plugins and themes covering SEO, e-commerce, forms, security, and more.",
      "whyItMatters": "WordPress's plugin ecosystem is broader and community-driven, while Builder.io's integrations are a smaller, curated, enterprise-focused set.",
      "benefitsWho": "Teams wanting many low-cost extensions (WordPress) versus teams wanting a focused set of enterprise-grade integrations (Builder.io)."
    },
    {
      "title": "Content Editing Approach",
      "toolA": "Uses AI-prompt-driven content creation (its Agentic CMS/Publish product) with A/B testing, personalization, and scheduling, with edits mapping to real production code and components.",
      "toolB": "Uses the native block-based Gutenberg editor plus Full Site Editing for customizing headers, footers, templates, and global styles.",
      "whyItMatters": "Builder.io's editor is AI-assisted and tied to production code, while WordPress's is a mature, code-free block editor built into the CMS itself.",
      "benefitsWho": "Marketing teams wanting AI-assisted personalization and A/B testing (Builder.io) versus teams wanting a proven, code-free block editor (WordPress)."
    },
    {
      "title": "Compliance Certification",
      "toolA": "States it is SOC 2 Type II compliant, with role-based access and SSO on higher tiers.",
      "toolB": "Not documented as holding a formal compliance certification; security instead depends on keeping self-managed core, themes, and plugins updated.",
      "whyItMatters": "Relevant during enterprise security reviews that require a documented third-party attestation.",
      "benefitsWho": "Regulated enterprises needing a formal compliance certification (Builder.io)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & Editing",
      "rows": [
        {
          "feature": "Block-based visual editor",
          "toolA": "available",
          "toolB": "available",
          "note": "AI-assisted editor vs. Gutenberg"
        },
        {
          "feature": "AI-assisted content generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Agentic CMS/Publish"
        },
        {
          "feature": "A/B testing and personalization",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Custom post types / structured content",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Platform & Hosting",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "REST API",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Builder.io offers Core Data APIs to its own layer"
        },
        {
          "feature": "Multisite networks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Free plan/tier",
          "toolA": "available",
          "toolB": "available",
          "note": "$0/user/month, 1 user vs. free core software"
        }
      ]
    },
    {
      "group": "Ecosystem & Compliance",
      "rows": [
        {
          "feature": "Plugin/theme marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tens of thousands of plugins and themes"
        },
        {
          "feature": "Git-integrated collaboration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "E-commerce support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Via WooCommerce plugin"
        },
        {
          "feature": "SOC 2 Type II compliance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is WordPress really free?",
      "answer": "Yes, the core software is free and open source under the GPL; you still pay for hosting, a domain, and any premium themes or plugins."
    },
    {
      "question": "Does Builder.io have a free plan?",
      "answer": "Yes, $0/user/month for 1 user with 60 monthly AI agent credits."
    },
    {
      "question": "Can Builder.io work with an existing WordPress site?",
      "answer": "This isn't documented directly. Builder.io's features focus on Git-integrated collaboration with GitHub, GitLab, and Bitbucket rather than a named WordPress connector, while WordPress separately exposes a REST API for headless setups, so pairing them would rely on custom integration work rather than an out-of-the-box connector."
    },
    {
      "question": "Is Builder.io SOC 2 compliant?",
      "answer": "Yes, Builder.io states it is SOC 2 Type II compliant."
    },
    {
      "question": "Can WordPress power an online store?",
      "answer": "Yes, via plugins like WooCommerce, which add product catalogs, payments, shipping, and inventory management."
    },
    {
      "question": "Do I need to know how to code for either tool?",
      "answer": "WordPress can be built and managed via its block editor, themes, and plugins without code, though PHP, HTML, CSS, and JavaScript help for deeper customization. Builder.io's edits are visual but map into production code and components, and its Fusion tool builds app/UI code, so it leans toward more technical teams."
    }
  ]
};

export default builderIoVsWordpressContent;

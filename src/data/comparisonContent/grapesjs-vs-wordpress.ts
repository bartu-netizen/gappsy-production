import type { ToolComparisonContent } from './types';

const grapesjsVsWordpressContent: ToolComparisonContent = {
  "verdict": "GrapesJS is an open-source JavaScript framework that developers embed inside their own applications to build a drag-and-drop page or template editor; it is not a ready-made website platform. WordPress is a complete, self-hosted CMS with its own built-in block editor, themes, and plugin ecosystem that end users can operate without any development work. GrapesJS requires developer setup before anyone gets a usable product; WordPress is usable out of the box.",
  "bestForToolA": "Developers or product teams building their own white-label page builder or email-template editor feature into an existing web app, wanting an MIT-licensed framework they can self-host and that exports clean HTML, CSS, and JavaScript.",
  "bestForToolB": "Anyone wanting a complete, ready-to-use CMS with a built-in block editor, tens of thousands of plugins and themes, and a large community, without needing to build an editor themselves.",
  "whoNeedsBoth": "A software company could embed GrapesJS inside its own SaaS product so customers can design pages, while separately running WordPress for the company's own blog or marketing site — two independent uses of each tool rather than one combined workflow.",
  "keyDifferences": [
    {
      "title": "What Each Tool Actually Is",
      "toolA": "GrapesJS is a JavaScript library/framework for building a visual editor, not a finished CMS on its own.",
      "toolB": "WordPress is a complete CMS that is immediately usable to run a website.",
      "whyItMatters": "GrapesJS requires development work before any end user gets a usable product, while WordPress can be used right away.",
      "benefitsWho": "Developers building a custom product (GrapesJS) versus non-technical site owners (WordPress)."
    },
    {
      "title": "Pricing",
      "toolA": "The MIT-licensed core framework is free; the hosted Studio SDK has a Free tier ($0/month, 1,000 sessions, 1 domain, Studio branding) then Startup at $200/month (20,000 sessions, custom branding), Business at $2,000/month, and custom Enterprise.",
      "toolB": "Core software is free under the GPL; you pay only for hosting, a domain, and optional premium themes or plugins.",
      "whyItMatters": "GrapesJS's Studio SDK pricing is usage-based by monthly sessions and can scale to $200-$2,000+/month, while WordPress costs are hosting-based and typically far lower for a single site.",
      "benefitsWho": "Budget-conscious single-site owners (WordPress) versus SaaS products needing a white-labeled embedded editor at scale (GrapesJS Studio)."
    },
    {
      "title": "Deployment Model",
      "toolA": "Self-hostable as an open-source library you embed and host yourself, or usable via the hosted Studio SDK.",
      "toolB": "Self-hosted CMS requiring you to choose and manage your own hosting.",
      "whyItMatters": "Both can be self-hosted, but GrapesJS is a component you build into something else, while WordPress is the whole application.",
      "benefitsWho": "Teams that already have a hosting/dev pipeline to embed GrapesJS versus those wanting a turnkey CMS."
    },
    {
      "title": "Output & Portability",
      "toolA": "Stores editor state as JSON and exports clean, standard HTML, CSS, and JavaScript with no vendor lock-in.",
      "toolB": "Content is rendered dynamically through WordPress's own database structure via themes and plugins rather than exported as static markup.",
      "whyItMatters": "Matters for how portable the actual output is outside the platform that created it.",
      "benefitsWho": "Developers who need framework-agnostic, portable output (GrapesJS)."
    },
    {
      "title": "Ecosystem Maturity",
      "toolA": "Has an active GitHub community with 25,000+ stars, but is a smaller, developer-focused framework rather than a broad content ecosystem.",
      "toolB": "Has tens of thousands of plugins and themes and a large community and developer talent pool, powering millions of sites since 2003.",
      "whyItMatters": "WordPress's ecosystem covers nearly any out-of-the-box feature need, while GrapesJS's community centers on the editor framework itself.",
      "benefitsWho": "Non-developers wanting off-the-shelf plugins (WordPress) versus developers wanting a lean, embeddable building block (GrapesJS)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Editor & Development Model",
      "rows": [
        {
          "feature": "Drag-and-drop visual editor",
          "toolA": "available",
          "toolB": "available",
          "note": "Core engine vs. Gutenberg"
        },
        {
          "feature": "Custom component system for developers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Ready-to-use CMS out of the box",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "GrapesJS requires developer setup"
        },
        {
          "feature": "Clean HTML/CSS/JS export",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free/open-source core",
          "toolA": "available",
          "toolB": "available",
          "note": "MIT vs. GPL"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Hosted managed option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Studio SDK"
        },
        {
          "feature": "White-label / custom branding removal",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Paid Studio plans"
        }
      ]
    },
    {
      "group": "Ecosystem & Content Management",
      "rows": [
        {
          "feature": "Plugin/theme marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tens of thousands of plugins and themes"
        },
        {
          "feature": "Multisite networks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "REST API",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "User roles and permissions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is GrapesJS free?",
      "answer": "The core framework is free and open source under the MIT license. The hosted Studio SDK adds a free tier plus paid plans starting at $200/month."
    },
    {
      "question": "Is WordPress free?",
      "answer": "Yes, the core software is free; hosting, a domain name, and optional premium themes or plugins cost extra."
    },
    {
      "question": "Can I self-host GrapesJS?",
      "answer": "Yes, it's an open-source JavaScript library you can embed and host yourself."
    },
    {
      "question": "Does GrapesJS work as a standalone website like WordPress?",
      "answer": "No. It requires developer setup to embed and isn't a ready-made builder for non-technical end users on its own, unlike WordPress, which is usable out of the box."
    },
    {
      "question": "What is GrapesJS Studio SDK?",
      "answer": "A commercial, hosted layer built on top of the open-source GrapesJS core, adding custom domains, branding removal, and support tiers, billed by monthly sessions starting at $200/month."
    },
    {
      "question": "Can WordPress be used for e-commerce?",
      "answer": "Yes, via plugins like WooCommerce, which add product catalogs, payments, shipping, and inventory management."
    }
  ]
};

export default grapesjsVsWordpressContent;

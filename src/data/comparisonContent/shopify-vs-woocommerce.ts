import type { ToolComparisonContent } from './types';

const shopifyVsWoocommerceContent: ToolComparisonContent = {
  "verdict": "Shopify and WooCommerce solve the same underlying problem, running an online store, but from opposite ends of the hosting spectrum. Shopify is a fully hosted, all-in-one SaaS platform where infrastructure, security, and updates are handled for you, and it now bundles Sidekick, an AI assistant, into every plan including the entry-level Basic tier. That convenience comes through a monthly subscription plus tiered transaction fees that are actually highest on the cheapest plan. WooCommerce is the opposite: a free, open-source WordPress plugin that gives merchants full ownership of their store's code, data, and hosting environment, backed by a deep library of extensions for shipping, tax, subscriptions, and memberships. The tradeoff is that WooCommerce merchants take on the responsibility, and cost, of hosting, security, and plugin maintenance themselves, and total spend can climb once hosting, premium extensions, and themes are added up. Neither tool is a strict upgrade over the other. A merchant who wants to sell today without managing servers will find Shopify's model faster to launch and simpler to run. A merchant who already has WordPress expertise, wants full control over customization, or needs to avoid recurring platform fees will find WooCommerce's open architecture a better long-term fit. The right choice depends less on feature checklists and more on how much infrastructure responsibility a team is willing to own.",
  "bestForToolA": "Shopify fits merchants and teams who want a fully hosted, ready-to-sell platform with built-in AI assistance and multichannel selling, without managing servers, security, or updates themselves.",
  "bestForToolB": "WooCommerce fits merchants already comfortable with WordPress who want full ownership of their store's code and data, deep customization through extensions, and no mandatory monthly platform fee.",
  "whoNeedsBoth": "Agencies and larger merchants who build stores for multiple clients, or who want to compare a fully hosted option against a self-hosted one before committing, often end up evaluating or running both platforms side by side.",
  "keyDifferences": [
    {
      "title": "Hosting model",
      "toolA": "Shopify is a fully hosted SaaS platform that manages infrastructure, security, and updates.",
      "toolB": "WooCommerce is a self-hosted, open-source WordPress plugin that runs on infrastructure the merchant manages, with a separate WordPress.com Commerce hosted option starting from $45 per month.",
      "whyItMatters": "Hosting model determines who is responsible for uptime, security patches, and server costs, which changes both the technical burden and the total cost of running the store.",
      "benefitsWho": "Non-technical merchants and small teams benefit from Shopify's managed model, while merchants with development resources benefit from WooCommerce's self-hosted control."
    },
    {
      "title": "Core pricing structure",
      "toolA": "Shopify charges tiered monthly plans from $21 (Basic) up to $2,100 plus (Plus).",
      "toolB": "WooCommerce's core plugin is free, with costs coming from optional premium extensions priced $29 to $299 per year, plus separate hosting and payment processing.",
      "whyItMatters": "The two models spread cost very differently, one predictable monthly fee versus a free base with variable add-on costs.",
      "benefitsWho": "Merchants who want predictable, all-in pricing benefit from Shopify, while merchants who want to pay only for the specific features they use benefit from WooCommerce."
    },
    {
      "title": "Built-in AI assistant",
      "toolA": "Shopify includes Sidekick, an AI assistant, on every plan including the entry-level Basic tier.",
      "toolB": "WooCommerce's documented facts do not confirm a built-in AI assistant.",
      "whyItMatters": "Built-in AI can reduce the need for separate tools or manual work on tasks like store management, but only matters if a merchant intends to use it.",
      "benefitsWho": "Merchants who want AI assistance without adding third-party tools benefit from Shopify's approach."
    },
    {
      "title": "Transaction and payment fees",
      "toolA": "Shopify's payment processing rates are tiered by plan and are highest on the entry Basic tier, decreasing at higher tiers.",
      "toolB": "WooPayments charges roughly 2.5 to 2.9 percent plus 30 cents per transaction, with 0 percent WooPayments fees available on the WordPress.com Commerce hosted plan.",
      "whyItMatters": "Per-transaction costs compound with sales volume, so the fee structure can matter more than the sticker price of a plan for high-volume sellers.",
      "benefitsWho": "Larger merchants on higher Shopify tiers, or on WooCommerce's hosted 0 percent fee plan, benefit most from lower effective transaction costs."
    },
    {
      "title": "Ownership of code and data",
      "toolA": "Shopify is a proprietary SaaS platform; merchants do not own or directly control the underlying store code or hosting.",
      "toolB": "WooCommerce is open-source and self-hosted, giving merchants full ownership of their store's code, data, and hosting environment.",
      "whyItMatters": "Ownership affects portability, long-term control, and the ability to customize beyond what the platform natively supports.",
      "benefitsWho": "Merchants who want maximum control and portability benefit from WooCommerce; merchants who prioritize simplicity over ownership benefit from Shopify."
    },
    {
      "title": "Extensibility and customization",
      "toolA": "Shopify's documented facts emphasize multichannel selling across online store, social, marketplaces, and point of sale rather than a broad extension catalog.",
      "toolB": "WooCommerce offers a large marketplace of official and third-party extensions plus WordPress themes and hooks for deep customization.",
      "whyItMatters": "The depth of available extensions determines how far a store can be customized without custom development.",
      "benefitsWho": "Merchants with complex or evolving catalog and workflow needs benefit from WooCommerce's extension ecosystem."
    },
    {
      "title": "Multichannel and point-of-sale selling",
      "toolA": "Shopify natively supports selling across an online store, social channels, marketplaces, and point of sale from one platform.",
      "toolB": "WooCommerce's documented facts do not confirm native multichannel or point-of-sale selling.",
      "whyItMatters": "Merchants selling in person or across multiple channels need this built in or must add it separately.",
      "benefitsWho": "Retail and omnichannel merchants benefit from Shopify's native multichannel support."
    },
    {
      "title": "Subscriptions and recurring billing",
      "toolA": "Shopify's documented facts do not confirm native subscription or membership functionality.",
      "toolB": "WooCommerce offers official extensions for recurring billing, membership content gating, and appointment or rental bookings.",
      "whyItMatters": "Recurring revenue models require dedicated subscription and billing functionality.",
      "benefitsWho": "Merchants building subscription boxes, memberships, or bookings benefit from WooCommerce's dedicated extensions."
    },
    {
      "title": "Entry cost and trial structure",
      "toolA": "Shopify offers 3 days free followed by $1 per month for 3 months before standard pricing applies.",
      "toolB": "WooCommerce's core plugin is free with no trial period needed, though hosting and payment processing are billed separately from day one.",
      "whyItMatters": "Low-risk entry pricing lowers the barrier to testing a platform before committing to it long-term.",
      "benefitsWho": "New merchants testing the waters benefit from Shopify's discounted trial period, while cost-conscious merchants benefit from WooCommerce having no mandatory fee at all to start."
    },
    {
      "title": "Maintenance and technical responsibility",
      "toolA": "Shopify manages hosting, security, and platform updates as part of its SaaS model.",
      "toolB": "WooCommerce requires the merchant to manage hosting, security, and plugin or theme updates themselves, per its documented cons.",
      "whyItMatters": "Ongoing maintenance responsibility affects both the technical skill required and the time a merchant must dedicate to keeping the store running smoothly.",
      "benefitsWho": "Non-technical or resource-constrained merchants benefit from Shopify's managed maintenance, while merchants with in-house development resources benefit from WooCommerce's control over updates."
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting and Infrastructure",
      "rows": [
        {
          "feature": "Fully hosted SaaS platform",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "WooCommerce is self-hosted by default; a hosted option exists via WordPress.com Commerce from $45 per month"
        },
        {
          "feature": "Full code and data ownership",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "WooCommerce is open-source and self-hosted"
        }
      ]
    },
    {
      "group": "Platform and AI",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Shopify's Sidekick"
        },
        {
          "feature": "AI included on entry-level plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Sidekick is included on Shopify's Basic plan"
        }
      ]
    },
    {
      "group": "Payments",
      "rows": [
        {
          "feature": "Native payment processing",
          "toolA": "available",
          "toolB": "available",
          "note": "Shopify's rates are tiered by plan; WooCommerce's is WooPayments"
        },
        {
          "feature": "Third-party payment gateway support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WooCommerce supports Stripe, PayPal, Square, and regional gateways"
        },
        {
          "feature": "Transaction fee structure",
          "toolA": "available",
          "toolB": "available",
          "note": "Shopify fees decrease at higher tiers; WooPayments is roughly 2.5-2.9 percent plus 30 cents, with 0 percent on the WordPress.com Commerce hosted plan"
        }
      ]
    },
    {
      "group": "Sales Channels",
      "rows": [
        {
          "feature": "Multichannel selling (online store, social, marketplaces)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Point of sale (POS)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Part of Shopify's multichannel selling"
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Extension or app marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Large catalog of official and third-party WooCommerce extensions"
        },
        {
          "feature": "REST API for headless or custom integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Native mobile app for store management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "iOS and Android"
        }
      ]
    },
    {
      "group": "Commerce and Analytics",
      "rows": [
        {
          "feature": "Product and catalog management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WordPress block editor with categories, attributes, and variations"
        },
        {
          "feature": "Shipping tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shipping zones, live carrier rates, label printing"
        },
        {
          "feature": "Tax automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Subscriptions and memberships",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Via official WooCommerce extensions"
        },
        {
          "feature": "Built-in store analytics dashboard",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Trial",
      "rows": [
        {
          "feature": "Free core product with no mandatory platform fee",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Shopify's Basic plan starts at $21 per month; WooCommerce's core plugin is free"
        },
        {
          "feature": "Low-cost entry trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Shopify offers 3 free days then $1 per month for 3 months; WooCommerce's core is free rather than trial-based"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Shopify or WooCommerce?",
      "answer": "WooCommerce is cheaper at the core level since the plugin itself is free, while Shopify starts at $21 per month on the Basic plan, though WooCommerce's total cost can rise once hosting, premium extensions, and payment processing are added, so the actual cheaper option depends on the specific store's setup."
    },
    {
      "question": "Is Shopify or WooCommerce better for beginners?",
      "answer": "Shopify is generally simpler for beginners since it is fully hosted and includes a built-in AI assistant called Sidekick on every plan, while WooCommerce has a steeper learning curve because it requires managing WordPress hosting, security, and updates."
    },
    {
      "question": "Can WooCommerce do everything Shopify can do?",
      "answer": "WooCommerce can match many of Shopify's core commerce features through extensions, such as payments, shipping, and subscriptions, but the documented facts do not confirm that WooCommerce natively includes an AI assistant or built-in multichannel and point-of-sale selling the way Shopify does."
    },
    {
      "question": "Does Shopify or WooCommerce have better AI features?",
      "answer": "Shopify has the documented advantage here, since its Sidekick AI assistant is included on every plan including the entry-level Basic tier, while WooCommerce's provided facts do not confirm a built-in AI assistant."
    },
    {
      "question": "Do I have to pay a monthly fee to use WooCommerce?",
      "answer": "No, the core WooCommerce plugin is free with no mandatory monthly platform fee, though most stores still pay separately for hosting, and optionally for premium extensions ranging from $29 to $299 per year."
    },
    {
      "question": "Which platform gives merchants more control over their store?",
      "answer": "WooCommerce gives merchants more control, since it is open-source and self-hosted with full ownership of the store's code and data, while Shopify is a proprietary SaaS platform where Shopify manages the underlying infrastructure."
    }
  ]
};

export default shopifyVsWoocommerceContent;

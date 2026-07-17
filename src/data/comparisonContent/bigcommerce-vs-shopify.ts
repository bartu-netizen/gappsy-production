import type { ToolComparisonContent } from './types';

const bigcommerceVsShopifyContent: ToolComparisonContent = {
  "verdict": "BigCommerce and Shopify are both SaaS ecommerce platforms, but they are built for different growth paths. BigCommerce leans into native depth: built-in multi-currency selling, faceted search, customer groups, and a full B2B Edition covering quoting, customer-specific pricing, purchase orders, and account hierarchies ship on the platform itself, and its GraphQL Storefront API plus the Catalyst framework give developers a real headless option. That depth comes with a steeper learning curve, more developer dependency for deep customization, and a plan structure tied to annual sales volume that automatically pushes growing stores into higher tiers. Shopify centers on ease and breadth of channel reach: a flat, predictable monthly tier structure, an unusually long low-cost trial of $1 per month for three months after three free days, and Sidekick, an AI assistant included on every plan rather than gated to premium tiers. Its notable cost tradeoff runs the opposite direction from BigCommerce: payment processing rates are highest on the cheapest Basic tier and decrease as merchants move up, so smaller Shopify merchants pay proportionally more per transaction. Meanwhile BigCommerce's historic no-transaction-fee positioning changed in June 2026 with a new Open Payment Provider Fee on orders routed outside its approved gateway list. The right choice depends on whether the priority is native B2B and headless depth or fast setup, built-in AI, and multichannel simplicity.",
  "bestForToolA": "BigCommerce is the better fit for mid-market, B2B, and wholesale retailers that need built-in quoting, customer-specific pricing, purchase orders, and multi-currency selling without stitching together third-party apps, plus teams that want a native headless or Catalyst-based storefront.",
  "bestForToolB": "Shopify is the better fit for merchants who want a fast, all-in-one setup with a flat, predictable pricing ladder, a low-cost extended trial, and an AI assistant included from the cheapest plan up.",
  "whoNeedsBoth": "Agencies and multi-brand companies sometimes end up running both: BigCommerce for a B2B or wholesale storefront that needs native quoting and purchase orders, and Shopify for a separate consumer-facing or social-selling storefront that benefits from its AI assistant and simpler setup.",
  "keyDifferences": [
    {
      "title": "Entry-level pricing",
      "toolA": "Core plan starts at $29/month billed annually, or $39/month billed monthly",
      "toolB": "Basic plan starts at $21/month billed yearly",
      "whyItMatters": "For cost-sensitive new merchants, the lowest recurring monthly commitment is a first-order decision factor",
      "benefitsWho": "Small merchants and solo sellers watching monthly overhead lean toward Shopify's lower entry tier"
    },
    {
      "title": "Free trial and low-cost onboarding",
      "toolA": "Offers a free trial with no permanent free plan",
      "toolB": "Freemium onboarding: 3 free days, then $1/month for 3 months before standard pricing applies",
      "whyItMatters": "An extended low-cost runway lowers the risk of testing a store before committing to full price",
      "benefitsWho": "First-time store owners and side-project sellers benefit most from Shopify's longer discounted runway"
    },
    {
      "title": "Plan tier escalation mechanics",
      "toolA": "Plans are tied to annual online sales volume; exceeding a plan's threshold automatically moves the store to the next tier",
      "toolB": "Flat monthly tiers (Basic, Grow, Advanced, Plus) with pricing not documented as tied to sales volume",
      "whyItMatters": "Sales-based auto-upgrades mean growing merchants can be moved to a pricier tier without actively choosing it",
      "benefitsWho": "Predictable-budget merchants may prefer Shopify's flat tiers, while fast-scaling B2B sellers may accept BigCommerce's model in exchange for its native B2B depth"
    },
    {
      "title": "Payment fee structure",
      "toolA": "New Open Payment Provider Fee (added June 2026) charges up to roughly 2 percent of GMV on the entry Core plan for orders processed through a gateway outside BigCommerce's approved embedded-payments list, including offline and B2B purchase-order transactions",
      "toolB": "Tiered payment processing rates that decrease as plan tier increases, with the highest rate on the entry Basic tier",
      "whyItMatters": "Both models penalize smaller or lower-tier merchants more than larger ones, just through different mechanisms: gateway choice versus plan tier",
      "benefitsWho": "Merchants already using an approved embedded payment provider avoid BigCommerce's new fee, while high-volume Shopify Plus merchants get the platform's lowest processing rates"
    },
    {
      "title": "Built-in AI assistant",
      "toolA": "No AI assistant is documented in BigCommerce's listed feature set",
      "toolB": "Sidekick AI assistant is included on all plans, including the entry Basic tier",
      "whyItMatters": "Built-in AI assistance for tasks like store setup and content can meaningfully lower the skill floor for new merchants",
      "benefitsWho": "Merchants without dedicated technical or marketing staff benefit most from Shopify's included AI"
    },
    {
      "title": "B2B and wholesale tooling",
      "toolA": "B2B Edition includes quoting, customer-specific catalogs and pricing, purchase orders, and account hierarchies built directly into the platform",
      "toolB": "Not documented in the provided Shopify feature data",
      "whyItMatters": "Native B2B functionality avoids needing a separate wholesale platform or a stack of third-party apps",
      "benefitsWho": "Wholesale distributors and B2B sellers with tiered customer pricing benefit from BigCommerce's built-in B2B Edition"
    },
    {
      "title": "Headless and composable architecture",
      "toolA": "GraphQL Storefront API and the Catalyst framework, built on Next.js, let developers fully decouple the front end from the BigCommerce backend",
      "toolB": "Not documented in the provided Shopify feature data",
      "whyItMatters": "A documented headless framework signals first-party support for custom or composable front-end builds rather than relying on undocumented workarounds",
      "benefitsWho": "Development teams building fully custom or composable storefronts benefit from BigCommerce's documented headless tooling"
    },
    {
      "title": "Multi-storefront support",
      "toolA": "Multi-storefront capability runs multiple branded storefronts from a single backend and shared product catalog, included at the Performance tier",
      "toolB": "Not documented in the provided Shopify feature data",
      "whyItMatters": "Running several brands or regions from one backend and catalog reduces duplicate inventory and admin overhead",
      "benefitsWho": "Multi-brand retailers and enterprises with several storefronts benefit from BigCommerce's native multi-storefront support"
    },
    {
      "title": "Third-party app and theme ecosystem",
      "toolA": "BigCommerce itself lists a smaller third-party app and theme marketplace as a documented drawback compared to Shopify",
      "toolB": "Not separately quantified in the provided Shopify data, but positioned by BigCommerce's own comparison as the larger ecosystem",
      "whyItMatters": "A larger app and theme marketplace generally means more off-the-shelf options before custom development is needed",
      "benefitsWho": "Merchants who prefer solving needs with existing apps rather than custom development lean toward the platform with the broader marketplace"
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and plans",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "BigCommerce offers a free trial only; Shopify offers 3 free days plus $1/month for 3 months, not an ongoing free tier"
        },
        {
          "feature": "Free or low-cost trial period",
          "toolA": "available",
          "toolB": "available",
          "note": "BigCommerce: free trial. Shopify: 3 free days then $1/month for 3 months"
        },
        {
          "feature": "Custom enterprise-level pricing tier",
          "toolA": "available",
          "toolB": "available",
          "note": "BigCommerce Performance plan is custom priced; Shopify Plus starts at $2,100+/month"
        },
        {
          "feature": "Sales-volume-based automatic tier upgrades",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BigCommerce plans are explicitly tied to annual sales thresholds"
        }
      ]
    },
    {
      "group": "Core commerce and catalog",
      "rows": [
        {
          "feature": "Multi-currency selling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included on BigCommerce's Core plan and above"
        },
        {
          "feature": "Built-in abandoned cart recovery",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Native automated emails without a separate app on BigCommerce"
        },
        {
          "feature": "Faceted search and product filtering",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Faceted search on BigCommerce Core; product filtering added on Growth"
        },
        {
          "feature": "Customer groups and segmentation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included from BigCommerce's Growth plan up"
        }
      ]
    },
    {
      "group": "B2B and wholesale",
      "rows": [
        {
          "feature": "Quoting tools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Part of BigCommerce's B2B Edition"
        },
        {
          "feature": "Customer-specific catalogs and pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Part of BigCommerce's B2B Edition"
        },
        {
          "feature": "Purchase order support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Part of BigCommerce's B2B Edition"
        },
        {
          "feature": "Account hierarchies",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Part of BigCommerce's B2B Edition"
        }
      ]
    },
    {
      "group": "Platform architecture",
      "rows": [
        {
          "feature": "Headless or composable storefront framework",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GraphQL Storefront API plus the Catalyst (Next.js) framework"
        },
        {
          "feature": "Multi-storefront from one backend",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included at BigCommerce's Performance tier"
        },
        {
          "feature": "Custom SSL support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included from BigCommerce's Scale plan up"
        },
        {
          "feature": "Higher or custom API rate limits",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Higher limits on BigCommerce Scale; custom/highest limits on Performance"
        }
      ]
    },
    {
      "group": "AI and automation",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shopify's Sidekick assistant"
        },
        {
          "feature": "AI included on the cheapest plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sidekick is included on Shopify's Basic plan, not gated to premium tiers"
        }
      ]
    },
    {
      "group": "Multichannel and marketplace selling",
      "rows": [
        {
          "feature": "Marketplace integrations such as Amazon, eBay, and Walmart",
          "toolA": "available",
          "toolB": "available",
          "note": "Shopify's data describes general marketplace selling without naming specific marketplaces"
        },
        {
          "feature": "Social selling on Facebook and Instagram",
          "toolA": "available",
          "toolB": "available",
          "note": "Shopify's data describes general social selling without naming specific channels"
        },
        {
          "feature": "Point-of-sale for physical retail",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shopify explicitly lists point-of-sale as part of its multichannel selling"
        }
      ]
    },
    {
      "group": "Payments",
      "rows": [
        {
          "feature": "Open choice of payment gateway, no mandated processor",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BigCommerce lets merchants choose from a range of supported payment providers"
        },
        {
          "feature": "Additional fee for using a non-approved payment gateway",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BigCommerce's Open Payment Provider Fee, added June 2026, charges up to roughly 2 percent of GMV on orders outside its approved embedded-payments list"
        },
        {
          "feature": "Payment processing rate decreases with higher plan tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shopify's rates are highest on Basic and decrease on higher tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, BigCommerce or Shopify?",
      "answer": "Shopify's entry-level Basic plan starts at $21/month billed yearly, undercutting BigCommerce's Core plan at $29/month billed annually, though BigCommerce's lowest tier has no equivalent to Shopify's extended $1-per-month introductory trial period."
    },
    {
      "question": "Is Shopify or BigCommerce better for beginners?",
      "answer": "Shopify is generally the simpler starting point for beginners, with flat monthly pricing tiers, an included AI assistant called Sidekick on every plan, and a long low-cost trial, while BigCommerce's deeper native B2B and headless tooling are better suited to teams with more technical resources."
    },
    {
      "question": "Does BigCommerce support headless or composable commerce?",
      "answer": "Yes, BigCommerce documents a GraphQL Storefront API and the Catalyst framework, built on Next.js, that let developers build a fully custom front end while using BigCommerce for catalog, checkout, and order management; Shopify's headless capabilities are not addressed in the available documented data here."
    },
    {
      "question": "Which platform is better for B2B and wholesale selling?",
      "answer": "BigCommerce is the documented choice for B2B and wholesale selling, with its B2B Edition covering quoting, customer-specific catalogs and pricing, purchase orders, and account hierarchies built directly into the platform; no equivalent B2B feature set is documented for Shopify here."
    },
    {
      "question": "Does Shopify charge transaction fees?",
      "answer": "Shopify's documented data shows tiered payment processing rates that decrease as plan tier increases, with the highest rate charged on the entry Basic tier, meaning smaller merchants pay proportionally more per transaction."
    },
    {
      "question": "Does BigCommerce still charge no transaction fees?",
      "answer": "Historically BigCommerce marketed itself as charging no transaction fees regardless of payment gateway, but as of June 2026 it introduced an Open Payment Provider Fee of roughly 2 percent on the entry Core plan, lower on higher tiers, that applies to orders processed through a gateway outside its approved embedded-payments list, including offline and purchase-order transactions."
    }
  ]
};

export default bigcommerceVsShopifyContent;

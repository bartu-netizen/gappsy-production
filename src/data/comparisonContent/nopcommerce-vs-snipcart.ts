import type { ToolComparisonContent } from './types';

const nopcommerceVsSnipcartContent: ToolComparisonContent = {
  "verdict": "nopCommerce is a full, free, self-hosted storefront platform with its own admin dashboard, plugin/theme marketplace, and SEO tooling, built for merchants who want to own the entire ASP.NET Core stack. Snipcart is a paid, usage-based drop-in cart and checkout snippet that layers commerce onto an existing site built in virtually any tech stack, charging 2% per transaction with a $20/month minimum. One is a platform you build a store on; the other is a checkout layer you add to a site you already have.",
  "bestForToolA": "Merchants who want a complete, self-hosted storefront with an admin dashboard, discount engine, and SEO-friendly URLs, and who have or can hire ASP.NET Core / .NET expertise.",
  "bestForToolB": "Developers who already have a site (Jamstack, React, Vue, WordPress, Laravel, or otherwise) and want to add a cart and checkout via an HTML/JS snippet without building or hosting a full commerce backend.",
  "whoNeedsBoth": "There's little practical overlap since both solve the storefront/checkout layer directly, but a team could prototype quickly with Snipcart's free testing environment on a marketing site before deciding whether to invest in a full nopCommerce build for a larger catalog.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "nopCommerce is free to download, install, and use commercially with no license fee, distributed under the nopCommerce Public License.",
      "toolB": "Snipcart charges 2% per transaction, with a $20/month minimum for stores generating under $1,000 USD in monthly sales.",
      "whyItMatters": "Transaction-based pricing scales with revenue and can add up for high-volume stores, while a free self-hosted platform shifts cost to infrastructure and development time instead.",
      "benefitsWho": "High-volume merchants may prefer nopCommerce's flat cost structure; low-volume or early-stage sellers may prefer Snipcart's pay-as-you-go model."
    },
    {
      "title": "Deployment Model",
      "toolA": "nopCommerce is a full self-hosted platform including storefront, admin dashboard, and database (MS SQL Server backend).",
      "toolB": "Snipcart is a drop-in cart snippet added to an existing site rather than a full storefront builder, per its own documented cons.",
      "whyItMatters": "Teams need to know whether they're building a whole site or bolting commerce onto one that already exists.",
      "benefitsWho": "Teams starting from scratch benefit from nopCommerce's complete platform; teams with an existing site benefit from Snipcart's drop-in approach."
    },
    {
      "title": "Tech Stack Flexibility",
      "toolA": "nopCommerce is built specifically on ASP.NET Core with an MS SQL Server backend.",
      "toolB": "Snipcart is designed to work with virtually any tech stack, including Jamstack, React, Vue, WordPress, and Laravel sites.",
      "whyItMatters": "Teams not using .NET need a checkout solution that doesn't dictate their existing frontend or CMS choice.",
      "benefitsWho": "Developers on non-.NET stacks (Jamstack, React, Vue, WordPress, Laravel) benefit from Snipcart's stack-agnostic integration."
    },
    {
      "title": "Abandoned Cart Recovery",
      "toolA": "Not documented as a specific nopCommerce feature; nopCommerce instead documents a discount and promotion engine.",
      "toolB": "Snipcart includes built-in tools to recover abandoned shopping carts.",
      "whyItMatters": "Recovering abandoned carts directly affects conversion rate and revenue without extra development work.",
      "benefitsWho": "Merchants focused on conversion optimization who want abandoned-cart recovery out of the box in Snipcart."
    },
    {
      "title": "Free Testing / Trial Access",
      "toolA": "Not documented as a formal trial program; the core platform itself is free to use commercially.",
      "toolB": "Snipcart offers a free, unlimited testing environment with no credit card required before going live.",
      "whyItMatters": "A no-commitment sandbox lets developers validate integration before any transaction fees apply.",
      "benefitsWho": "Developers evaluating Snipcart who want to test the full checkout flow risk-free before launch."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Cost",
      "rows": [
        {
          "feature": "Self-hosted full platform",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Snipcart is a cart/checkout layer, not a full storefront builder"
        },
        {
          "feature": "Usage-based transaction pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "2% per transaction, $20/month minimum"
        },
        {
          "feature": "Free testing / sandbox environment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "No credit card required"
        }
      ]
    },
    {
      "group": "Storefront & Commerce Features",
      "rows": [
        {
          "feature": "Full admin dashboard",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Plugin and theme marketplace",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Abandoned cart recovery",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Tax management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-currency support",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Technical Integration",
      "rows": [
        {
          "feature": "Works with any frontend tech stack",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "nopCommerce requires ASP.NET Core; Snipcart works with Jamstack, React, Vue, WordPress, Laravel"
        },
        {
          "feature": "API and webhooks",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Digital product sales",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does nopCommerce charge transaction fees?",
      "answer": "No, nopCommerce is free to download and use commercially with no license fee; Snipcart, by contrast, charges 2% per transaction with a $20/month minimum."
    },
    {
      "question": "What's the minimum monthly cost for Snipcart?",
      "answer": "Snipcart's minimum fee is $20/month for stores generating under $1,000 USD in monthly sales; above that threshold, cost is purely the 2% transaction fee."
    },
    {
      "question": "Can I add Snipcart to any website?",
      "answer": "Yes, Snipcart is documented to work with virtually any tech stack, including Jamstack, React, Vue, WordPress, and Laravel sites, via an HTML/JS snippet."
    },
    {
      "question": "Does nopCommerce come with a full storefront and admin panel?",
      "answer": "Yes, nopCommerce is a complete self-hosted platform with an admin dashboard, discount engine, and plugin/theme marketplace, unlike Snipcart, which is a drop-in checkout layer."
    },
    {
      "question": "Can Snipcart sell digital products?",
      "answer": "Yes, Snipcart supports selling both physical and digital products."
    },
    {
      "question": "Which is better for a developer who already has a custom site?",
      "answer": "Snipcart is designed for exactly that case — adding a cart and checkout to an existing site without redirecting users elsewhere — while nopCommerce expects to be the site itself."
    }
  ]
};

export default nopcommerceVsSnipcartContent;

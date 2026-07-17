import type { ToolComparisonContent } from './types';

const gumroadVsSellfyContent: ToolComparisonContent = {
  "verdict": "Gumroad and Sellfy both launched in 2011 and serve creators selling digital products, but they are built around different cost models and product scope. Gumroad charges no monthly fee and instead takes 10 percent plus 0.50 dollars per transaction, which makes it a low-risk starting point for creators with unpredictable or early-stage sales volume. It layers on a Discover marketplace, an affiliate program, and merchant of record tax handling so sellers do not have to manage VAT and sales tax compliance themselves. Sellfy requires a subscription starting around 22 dollars a month billed annually, with 0 percent transaction fees on top, which favors sellers who already have steady sales and want predictable costs as revenue grows. Sellfy also extends beyond pure digital downloads into print on demand merchandise, and bundles a no-code storefront builder, cart abandonment recovery, and tiered email marketing limits into its plans. Gumroad leans toward a simple, transactional checkout experience, while Sellfy leans toward building a fuller, customizable branded storefront. Neither tool is built for businesses that manage physical inventory and shipping themselves. The right pick comes down to whether a creator wants to avoid any upfront cost and keep things simple, which favors Gumroad, or is ready to commit to a subscription in exchange for zero transaction fees at scale, merch options, and built-in marketing tooling, which favors Sellfy.",
  "bestForToolA": "Gumroad is the better fit for creators just starting out or with unpredictable sales volume who want to avoid any upfront cost while getting built-in tax handling and marketplace discovery.",
  "bestForToolB": "Sellfy is the better fit for creators with steady sales volume who want a customizable storefront, print on demand merch, and predictable subscription costs with zero transaction fees.",
  "whoNeedsBoth": "A creator might list quick, low-commitment digital products on Gumroad while running a dedicated Sellfy storefront for a subscription or merch line that benefits from zero transaction fees once sales volume is steady.",
  "keyDifferences": [
    {
      "title": "Pricing structure",
      "toolA": "No monthly fee, pay only 10 percent plus 0.50 dollars per transaction on direct sales",
      "toolB": "Subscription starting at 22 dollars a month billed annually, with 0 percent transaction fees on top",
      "whyItMatters": "It determines whether cost scales with sales volume or stays fixed regardless of how much a seller sells",
      "benefitsWho": "Low-volume or unpredictable sellers benefit from Gumroad, while sellers with steady, higher-volume revenue benefit from Sellfy's flat fee"
    },
    {
      "title": "Physical and print on demand merch",
      "toolA": "Not built for physical goods that require inventory and shipping management",
      "toolB": "Supports print on demand apparel and accessories produced and shipped by partner fulfillment facilities",
      "whyItMatters": "Creators who want to sell wearable merch alongside digital content need a platform that handles fulfillment",
      "benefitsWho": "Creators wanting to diversify into merch benefit from Sellfy; pure digital sellers are unaffected either way"
    },
    {
      "title": "Marketplace discovery",
      "toolA": "Has a Discover marketplace that surfaces products to Gumroad shoppers, at a 30 percent transaction fee",
      "toolB": "No built-in marketplace for discovery is documented",
      "whyItMatters": "An extra discovery channel can matter for sellers without an existing audience, even at a higher fee",
      "benefitsWho": "Creators without a built-in audience benefit from Gumroad's Discover marketplace despite the added cost"
    },
    {
      "title": "Tax and VAT compliance",
      "toolA": "Acts as merchant of record, calculating, collecting, and remitting sales tax, VAT, and GST in many jurisdictions",
      "toolB": "No merchant of record tax handling is documented",
      "whyItMatters": "Automated tax compliance removes a significant administrative burden, especially for solo creators",
      "benefitsWho": "Solo creators without accounting support benefit most from Gumroad's built-in tax handling"
    },
    {
      "title": "Free plan availability",
      "toolA": "Permanent free account with no sign-up cost, pay only when a sale is made",
      "toolB": "No permanent free plan, only a 14-day free trial before a paid plan is required",
      "whyItMatters": "It affects whether a creator can test or use the platform indefinitely without financial commitment",
      "benefitsWho": "Early-stage creators and testers benefit from Gumroad's no-cost entry point"
    },
    {
      "title": "Storefront customization",
      "toolA": "Hosted checkout and product pages with limited design customization compared to dedicated storefront builders",
      "toolB": "No-code storefront builder for customizing colors, fonts, and layout",
      "whyItMatters": "Brand control over the buying experience matters to creators building a distinct storefront identity",
      "benefitsWho": "Creators wanting a branded shopfront benefit from Sellfy; those wanting zero setup benefit from Gumroad's simplicity"
    },
    {
      "title": "Affiliate program access",
      "toolA": "Affiliate program for recruiting affiliates and splitting commission automatically",
      "toolB": "Affiliate marketing is available only on the Business plan and above",
      "whyItMatters": "Whether affiliate marketing requires an extra plan tier affects the real cost of running an affiliate program",
      "benefitsWho": "Creators wanting affiliate marketing without upgrading benefit from Gumroad; Sellfy sellers must budget for a higher tier"
    },
    {
      "title": "Annual sales caps",
      "toolA": "No annual sales cap documented; fees scale per transaction instead",
      "toolB": "Each plan has an annual sales cap of 10,000, 50,000, or 200,000 dollars, requiring an upgrade or custom pricing above that",
      "whyItMatters": "Fast-growing sellers on Sellfy need to plan for plan upgrades, while Gumroad's model has no revenue ceiling",
      "benefitsWho": "Sellers who prefer flat, predictable costs but must track growth benefit from understanding Sellfy's caps upfront"
    },
    {
      "title": "License keys for software products",
      "toolA": "Automatic license key generation and verification for software, plugins, and templates",
      "toolB": "Not documented as a supported feature",
      "whyItMatters": "Developers selling software or plugins need anti-piracy licensing tools built into checkout",
      "benefitsWho": "Developers and plugin or template sellers benefit specifically from Gumroad's built-in licensing"
    },
    {
      "title": "Email marketing capacity",
      "toolA": "Basic audience and email tools for followers and product updates, no stated volume limits",
      "toolB": "Tiered email marketing limits by plan, from 2,000 up to 50,000 emails per month",
      "whyItMatters": "Creators with growing email lists may need higher send volumes than a basic tool provides",
      "benefitsWho": "Creators with large, active email lists benefit from Sellfy's higher-tier plans; those needing basic tools are served by Gumroad"
    }
  ],
  "featureMatrix": [
    {
      "group": "Product Types and Delivery",
      "rows": [
        {
          "feature": "Digital product hosting and delivery",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Print on demand merchandise",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Sellfy merch is produced and shipped by partner fulfillment facilities"
        },
        {
          "feature": "Memberships and subscription billing",
          "toolA": "available",
          "toolB": "available",
          "note": "Sellfy bills weekly, monthly, or yearly"
        },
        {
          "feature": "License keys for software products",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Cost Structure",
      "rows": [
        {
          "feature": "No monthly subscription fee",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Sellfy plans start at 22 dollars per month billed annually"
        },
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Sellfy offers a 14-day free trial instead"
        },
        {
          "feature": "Zero percent transaction fees on sales",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Gumroad charges 10 percent plus 0.50 dollars per direct sale, 30 percent via Discover"
        }
      ]
    },
    {
      "group": "Storefront and Checkout",
      "rows": [
        {
          "feature": "No-code customizable storefront builder",
          "toolA": "limited",
          "toolB": "available",
          "note": "Gumroad offers hosted checkout and product pages with limited design customization"
        },
        {
          "feature": "Embeddable buy buttons or product widgets",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Custom domain support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included starting on Sellfy's Starter plan"
        }
      ]
    },
    {
      "group": "Discovery and Marketing",
      "rows": [
        {
          "feature": "Built-in marketplace for product discovery",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gumroad's Discover marketplace carries a 30 percent fee"
        },
        {
          "feature": "Affiliate program",
          "toolA": "available",
          "toolB": "limited",
          "note": "Sellfy requires the Business plan or above"
        },
        {
          "feature": "Discount codes and upsells",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Cart abandonment recovery",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Sellfy requires the Business plan or above"
        }
      ]
    },
    {
      "group": "Email and Audience Tools",
      "rows": [
        {
          "feature": "Email marketing to customer list",
          "toolA": "available",
          "toolB": "available",
          "note": "Sellfy limits are tiered by plan, from 2,000 to 50,000 emails per month"
        },
        {
          "feature": "Follower and audience collection tools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Payments and Tax Compliance",
      "rows": [
        {
          "feature": "Merchant of record sales tax, VAT, and GST handling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "PayPal and Stripe checkout options",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sellfy advertises 0 percent transaction fees on top of processor fees"
        }
      ]
    },
    {
      "group": "Developer and Analytics Tools",
      "rows": [
        {
          "feature": "API access for custom integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Sales analytics dashboard",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Gumroad or Sellfy?",
      "answer": "It depends on sales volume: Gumroad has no monthly fee and charges 10 percent plus 0.50 dollars per transaction, which is cheaper at low volume, while Sellfy charges a flat monthly subscription starting at 22 dollars with 0 percent transaction fees, which becomes cheaper once sales volume is high and consistent."
    },
    {
      "question": "Is Gumroad or Sellfy better for beginners?",
      "answer": "Gumroad is generally easier for beginners to try because it is free to join with no monthly cost, while Sellfy requires committing to a paid plan after its 14-day free trial ends."
    },
    {
      "question": "Can I sell physical products or merch on Gumroad like I can on Sellfy?",
      "answer": "No, Gumroad is not built for physical goods that require inventory and shipping, whereas Sellfy supports print on demand apparel and accessories fulfilled by partner facilities with no inventory to manage."
    },
    {
      "question": "Does Gumroad or Sellfy handle sales tax automatically?",
      "answer": "Gumroad handles this automatically as a merchant of record, calculating, collecting, and remitting sales tax, VAT, and GST in many jurisdictions, while Sellfy's provided facts do not document equivalent merchant of record tax handling."
    },
    {
      "question": "Which platform has lower fees at high sales volume?",
      "answer": "Sellfy tends to have lower effective fees at high sales volume because it charges 0 percent transaction fees on top of its flat subscription, while Gumroad's per-transaction fee scales up with every sale regardless of volume."
    },
    {
      "question": "Can I get a free plan with either tool?",
      "answer": "Only Gumroad offers a permanent free plan with no sign-up cost, paying only when a sale is made, while Sellfy offers just a 14-day free trial before requiring a paid subscription."
    }
  ]
};

export default gumroadVsSellfyContent;

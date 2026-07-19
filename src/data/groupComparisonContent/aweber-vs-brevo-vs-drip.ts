import type { GroupComparisonContent } from './types';

const aweberVsBrevoVsDripContent: GroupComparisonContent = {
  "verdict": "There is no single winner here because the three tools are built for different senders: AWeber suits general small-business list building with a long-standing feature set and an optional done-for-you setup, Brevo suits cost-conscious teams that want unlimited contacts and multi-channel messaging bundled with email, and Drip suits ecommerce brands that need behavior-triggered automation tied to Shopify or WooCommerce order data. Anyone with a large but low-engagement contact list will likely find Brevo's volume-based billing the cheapest path, while ecommerce sellers chasing cart-recovery and win-back revenue should weigh Drip's all-features-included pricing against Brevo's automation depth. AWeber remains the safest choice for a straightforward newsletter-and-autoresponder use case with minimal setup effort.",
  "bestFor": {
    "aweber": "Small businesses and solopreneurs who want a mature, easy-to-use email platform with AI writing help, a large integration library, and the option to pay extra for a fully done-for-you setup.",
    "brevo": "Cost-conscious teams with large or low-engagement contact lists who want unlimited contacts, SMS and WhatsApp alongside email, and a built-in CRM, starting from a genuine free plan.",
    "drip": "Ecommerce brands on Shopify, WooCommerce, or BigCommerce that need purchase-behavior-triggered automation, revenue-per-workflow reporting, and every feature unlocked on the first paid plan."
  },
  "highlights": [
    {
      "title": "Brevo bills by email volume, not contact count",
      "description": "Brevo is the only one of the three that offers unlimited contacts on every paid plan and charges based on emails sent per month, which can produce major savings for businesses with large but relatively low-engagement lists compared to AWeber and Drip, both of which scale price with subscriber or contact count.",
      "toolSlugs": [
        "brevo",
        "aweber",
        "drip"
      ]
    },
    {
      "title": "Drip is the only tool with a flat, all-inclusive pricing structure",
      "description": "Drip charges purely by contact count and unlocks its entire feature set, including unlimited workflows and SMS, from the very first paid plan, while AWeber's Lite plan restricts lists and automations and Brevo gates automation and A/B testing behind its Standard tier and above.",
      "toolSlugs": [
        "drip",
        "aweber",
        "brevo"
      ]
    },
    {
      "title": "Only Brevo has a real free plan",
      "description": "Brevo offers a free plan with 300 emails per day and up to 100,000 stored contacts. AWeber and Drip both rely on 14-day free trials instead of a permanent free tier.",
      "toolSlugs": [
        "brevo",
        "aweber",
        "drip"
      ]
    },
    {
      "title": "Drip is purpose-built for ecommerce, AWeber and Brevo are not",
      "description": "Drip ingests order and product-catalog data directly from Shopify, WooCommerce, and BigCommerce to power revenue-attributed automations, a level of ecommerce depth that AWeber's general e-commerce and payments tools and Brevo's Shopify, WooCommerce, and Magento integrations do not match.",
      "toolSlugs": [
        "drip",
        "brevo",
        "aweber"
      ]
    },
    {
      "title": "Brevo is the only multi-channel platform with a built-in CRM",
      "description": "Brevo combines email, SMS, WhatsApp, and a sales CRM in one product, while Drip pairs email with SMS but has no CRM, and AWeber is primarily an email and landing-page platform.",
      "toolSlugs": [
        "brevo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core channels and automation",
      "rows": [
        {
          "feature": "SMS marketing",
          "statuses": {
            "aweber": "not-documented",
            "brevo": "available",
            "drip": "available"
          }
        },
        {
          "feature": "WhatsApp marketing",
          "statuses": {
            "aweber": "not-documented",
            "brevo": "available",
            "drip": "not-documented"
          }
        },
        {
          "feature": "Automation triggered by purchase or cart behavior",
          "statuses": {
            "aweber": "limited",
            "brevo": "limited",
            "drip": "available"
          },
          "note": "AWeber's automation is email-follow-up focused; Brevo's behavior triggers cover opens, clicks, purchases, and form submissions but are gated to Standard tier and above; Drip's triggers are built specifically around order and cart data."
        },
        {
          "feature": "AI writing or content assistance",
          "statuses": {
            "aweber": "available",
            "brevo": "available",
            "drip": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Ecommerce and integrations",
      "rows": [
        {
          "feature": "Native Shopify or WooCommerce integration",
          "statuses": {
            "aweber": "limited",
            "brevo": "available",
            "drip": "available"
          },
          "note": "AWeber connects to Shopify and WordPress among 750+ integrations but without Drip or Brevo's order-data-level depth."
        },
        {
          "feature": "Built-in sales CRM",
          "statuses": {
            "aweber": "unavailable",
            "brevo": "available",
            "drip": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Pricing and support",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "aweber": "unavailable",
            "brevo": "available",
            "drip": "unavailable"
          }
        },
        {
          "feature": "All features included on every paid plan",
          "statuses": {
            "aweber": "unavailable",
            "brevo": "unavailable",
            "drip": "available"
          }
        },
        {
          "feature": "Priority or live chat support on entry-level paid plans",
          "statuses": {
            "aweber": "available",
            "brevo": "not-documented",
            "drip": "limited"
          },
          "note": "AWeber's Plus plan includes priority 24/7 support; Drip reserves live chat for accounts on $99/month plans or higher."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of AWeber, Brevo, and Drip has a genuinely free plan?",
      "answer": "Brevo is the only one with a permanent free plan, allowing 300 emails per day and up to 100,000 stored contacts. AWeber and Drip both offer 14-day free trials instead of a free tier."
    },
    {
      "question": "Which tool is best for an ecommerce store specifically?",
      "answer": "Drip is purpose-built for ecommerce, with native Shopify, WooCommerce, and BigCommerce integrations that power purchase-behavior-triggered automations and revenue-per-workflow reporting. Brevo also offers ecommerce integrations, but its feature set is broader and less commerce-specific, and AWeber's ecommerce tools are more basic."
    },
    {
      "question": "How do the pricing models actually differ?",
      "answer": "AWeber and Drip both scale price with the number of contacts or subscribers on your list. Brevo instead bills based on how many emails you send per month and includes unlimited contacts on every paid plan, which can be cheaper for large, low-engagement lists."
    },
    {
      "question": "Do any of these platforms support SMS marketing?",
      "answer": "Brevo and Drip both include SMS alongside email in their automation workflows. AWeber's published feature set does not mention SMS marketing."
    },
    {
      "question": "Which platform offers a fully managed, done-for-you setup?",
      "answer": "AWeber is the only one of the three with a dedicated Done-For-You plan, priced at $20/month plus a $79 one-time setup fee, where AWeber's team builds emails, landing pages, and workflows within 7 days."
    },
    {
      "question": "Which of the three has the longest operating history?",
      "answer": "AWeber, founded in 1998, has by far the longest track record. Brevo and Drip were both founded in 2012."
    }
  ]
};

export default aweberVsBrevoVsDripContent;

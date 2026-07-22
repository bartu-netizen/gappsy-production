import type { ToolComparisonContent } from './types';

const fastspringVsKillBillContent: ToolComparisonContent = {
  "verdict": "FastSpring and Kill Bill both handle recurring billing, but they sit on opposite ends of the build-versus-buy spectrum. FastSpring is a merchant-of-record platform that takes on tax and compliance liability for sellers, with custom flat-rate pricing negotiated per business and no public price list, processing over $2B in transactions per year for 3,200+ customers. Kill Bill is a free, open-source, self-hosted billing engine with no merchant-of-record service; it's a billing and payments engine you run yourself, integrating your own gateway and tax plugins.",
  "bestForToolA": "FastSpring fits software and SaaS companies that want to sell globally (200+ regions, 35+ currencies) without taking on VAT and sales tax liability themselves, and that prefer a flat-rate, all-inclusive pricing model over building billing infrastructure.",
  "bestForToolB": "Kill Bill fits engineering teams that want to own their billing logic and data outright, are equipped to integrate their own tax engine (via Avalara or Vertex plugins) and payment gateways, and want to avoid the transaction and merchant-of-record fees built into FastSpring's flat-rate model.",
  "whoNeedsBoth": "A company scaling internationally could start with FastSpring as merchant of record to launch quickly in new tax jurisdictions, then later migrate core subscription logic to a self-hosted Kill Bill deployment if it decides to bring billing in-house and handle tax and merchant obligations itself.",
  "keyDifferences": [
    {
      "title": "Merchant of Record vs. Self-Managed Billing",
      "toolA": "FastSpring acts as the merchant of record, taking on tax and compliance liability for the seller as part of its service.",
      "toolB": "Kill Bill is a billing engine only; it does not act as merchant of record, so the operating company remains responsible for its own tax and compliance obligations, typically via integrated tax engines like Avalara or Vertex.",
      "whyItMatters": "Merchant-of-record status shifts legal and tax liability to the platform, which removes significant compliance burden but also removes control over the checkout relationship.",
      "benefitsWho": "Companies without in-house tax/legal expertise for global sales benefit from FastSpring's merchant-of-record model; companies that want to remain the seller of record benefit from Kill Bill's self-managed approach."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "FastSpring has no public pricing list; rates are negotiated per business with an account executive using a flat-rate model based on transaction type and volume.",
      "toolB": "Kill Bill's core platform is free and open source under Apache 2.0, with no per-transaction or revenue-percentage fees.",
      "whyItMatters": "Custom-negotiated pricing makes upfront cost comparison harder, while a free open-source core has a knowable direct cost (though not a knowable total cost once engineering time is factored in).",
      "benefitsWho": "Companies wanting predictable, quotable pricing before committing benefit from working with FastSpring's sales process; cost-conscious engineering-led teams benefit from Kill Bill's zero licensing cost."
    },
    {
      "title": "Global Tax and Currency Handling",
      "toolA": "FastSpring supports 200+ regions and 35+ currencies with automated VAT and sales tax compliance built into the platform, plus 21+ languages.",
      "toolB": "Kill Bill connects to third-party tax engines such as Avalara and Vertex rather than handling tax compliance natively.",
      "whyItMatters": "Native, automated global tax handling reduces implementation complexity for companies selling into many jurisdictions at once.",
      "benefitsWho": "Digital product sellers expanding into many countries at once benefit from FastSpring's built-in tax automation, which Kill Bill requires external plugins to replicate."
    },
    {
      "title": "Fraud Prevention",
      "toolA": "FastSpring includes built-in risk management and fraud prevention on transactions as part of its service.",
      "toolB": "Kill Bill's documented features do not include native fraud prevention; this would need to be handled by the integrated payment gateway or a separate tool.",
      "whyItMatters": "Built-in fraud tooling reduces chargebacks and fraudulent transactions without requiring a separate vendor integration.",
      "benefitsWho": "Digital goods sellers exposed to higher fraud risk benefit from FastSpring's included fraud prevention."
    },
    {
      "title": "Deployment and Control",
      "toolA": "FastSpring is a fully managed, hosted checkout and billing platform.",
      "toolB": "Kill Bill deploys via Docker or Kubernetes in your own infrastructure, avoiding SaaS lock-in and giving full data ownership.",
      "whyItMatters": "Infrastructure control affects data residency, customization depth, and vendor lock-in risk.",
      "benefitsWho": "Companies wanting full ownership of billing data and infrastructure benefit from Kill Bill's self-hosted model; companies wanting to avoid infrastructure operations entirely benefit from FastSpring's managed platform."
    }
  ],
  "featureMatrix": [
    {
      "group": "Compliance & Risk",
      "rows": [
        {
          "feature": "Merchant of record service",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automated tax compliance (VAT/sales tax)",
          "toolA": "available",
          "toolB": "limited",
          "note": "Kill Bill integrates external tax engines (Avalara, Vertex) rather than handling tax natively"
        },
        {
          "feature": "Fraud prevention",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Billing & Payments",
      "rows": [
        {
          "feature": "Subscription/recurring billing management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-currency support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "FastSpring: 35+ currencies across 200+ regions"
        },
        {
          "feature": "Payment gateway plugin architecture",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Kill Bill: Stripe, Adyen, PayPal, Braintree plugins"
        },
        {
          "feature": "Developer APIs",
          "toolA": "available",
          "toolB": "available",
          "note": "FastSpring: REST APIs, webhooks, JS libraries; Kill Bill: plugin architecture"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Public pricing list",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "FastSpring pricing is negotiated per business; Kill Bill core is free"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Affiliate marketing network",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free trial",
          "toolA": "limited",
          "toolB": "available",
          "note": "FastSpring offers a 'Try Now For Free' option without detailed public terms; Kill Bill core is free to use outright"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Kill Bill act as a merchant of record like FastSpring?",
      "answer": "No, Kill Bill is a billing engine only and does not take on merchant-of-record status; FastSpring's core service is acting as merchant of record and taking on tax and compliance liability for sellers."
    },
    {
      "question": "How is FastSpring priced compared to Kill Bill?",
      "answer": "FastSpring uses flat-rate pricing negotiated per business with no public price list, while Kill Bill's core platform is free and open source under Apache 2.0 with no licensing fees."
    },
    {
      "question": "Does Kill Bill handle VAT and sales tax automatically?",
      "answer": "Not natively; Kill Bill connects to third-party tax engines like Avalara and Vertex, while FastSpring handles VAT and sales tax compliance automatically as part of its merchant-of-record service."
    },
    {
      "question": "How many currencies does FastSpring support?",
      "answer": "FastSpring supports 35+ currencies and 200+ regions with localized, branded checkout; Kill Bill's currency handling is not documented in the available facts since it depends on the integrated payment gateway."
    },
    {
      "question": "Is Kill Bill free to use?",
      "answer": "Yes, the core Kill Bill platform is open source under the Apache License 2.0 and free to self-host, though it requires engineering resources to deploy and operate; FastSpring's pricing is custom and requires talking to their sales team."
    },
    {
      "question": "How large is FastSpring's customer base?",
      "answer": "FastSpring reports serving 3,200+ customers and processing over $2 billion in transactions per year; comparable adoption figures are not documented for Kill Bill, though it has been in production for over 15 years since its 2010 founding."
    }
  ]
};

export default fastspringVsKillBillContent;

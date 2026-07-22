import type { ToolComparisonContent } from './types';

const gocardlessVsMollieContent: ToolComparisonContent = {
  "verdict": "GoCardless and Mollie are both European payment companies with pay-as-you-go pricing, but they cover different parts of the payment stack. GoCardless, headquartered in Paris, specializes in recurring bank-to-bank Direct Debit collection (SEPA, UK, Swedish Autogiro) with add-ons for failed-payment recovery (Success+) and fraud protection (Protect+). Mollie is a broader processor accepting cards, PayPal, SEPA, iDEAL, Klarna, and digital wallets both online and in person via POS terminals, with fees that vary by method and region.",
  "bestForToolA": "Businesses collecting recurring subscription or invoice payments via bank debit across SEPA countries, the UK, or Sweden, that want a dedicated add-on to automatically recover up to 70% of failed payments (Success+), and that value 350+ named integrations with accounting tools like Xero, QuickBooks, and Zuora.",
  "bestForToolB": "Businesses that need to accept a wide range of payment methods — cards, PayPal, iDEAL, Klarna, Apple Pay, Google Pay — for both online and in-person (POS terminal) transactions, and that want prebuilt developer libraries in JavaScript, PHP, .NET, and Python.",
  "whoNeedsBoth": "A subscription business with European customers could reasonably use GoCardless for its documented specialty — automated recurring bank-debit collection with Success+ failed-payment recovery — while using Mollie for one-off card, wallet, or in-person payments, since neither tool's documented feature set covers the other's core use case.",
  "keyDifferences": [
    {
      "title": "Payment method scope",
      "toolA": "GoCardless's documented methods are bank-to-bank Direct Debit schemes: SEPA, UK Direct Debit, and Swedish Autogiro. Card payments are not documented.",
      "toolB": "Mollie accepts cards, PayPal, SEPA, iDEAL, Klarna, Apple Pay, and Google Pay for online payments.",
      "whyItMatters": "A business that needs card acceptance alongside Direct Debit would need to look beyond GoCardless's documented feature set, while Mollie documents both bank-debit and card methods.",
      "benefitsWho": "Merchants deciding whether they need a card-payment processor, a recurring-debit specialist, or both."
    },
    {
      "title": "In-person payment acceptance",
      "toolA": "GoCardless's facts do not document any in-person or point-of-sale payment capability.",
      "toolB": "Mollie offers in-person payments via POS card terminals, on either a Pay-as-you-Go (€0/month) or Pro (€20/month, 1-year contract) plan.",
      "whyItMatters": "In-person acceptance is a distinct product surface from online-only payment collection.",
      "benefitsWho": "Businesses with a physical retail or in-person sales presence in addition to online payments."
    },
    {
      "title": "Failed-payment recovery",
      "toolA": "GoCardless's Success+ add-on automatically recovers up to 70% of failed payments.",
      "toolB": "Mollie's facts do not document an equivalent failed-payment recovery feature.",
      "whyItMatters": "Recurring-billing businesses lose revenue to failed Direct Debit collections; an automated recovery feature directly addresses that specific risk.",
      "benefitsWho": "Subscription businesses relying on recurring bank-debit collection, where failed payments are a known revenue leak."
    },
    {
      "title": "Named accounting integrations vs. developer libraries",
      "toolA": "GoCardless documents 350+ integrations, including named accounting platforms Xero, QuickBooks, and Zuora.",
      "toolB": "Mollie documents prebuilt e-commerce integrations and developer libraries for JavaScript, PHP, .NET, and Python, without a specific named integration count.",
      "whyItMatters": "A large named integration catalog benefits finance teams connecting to existing accounting software, while language-specific libraries benefit engineering teams building custom checkout flows.",
      "benefitsWho": "Finance/ops teams (GoCardless) versus engineering teams building custom integrations (Mollie)."
    },
    {
      "title": "Headquarters disclosure",
      "toolA": "GoCardless SAS is documented as headquartered in Paris, France.",
      "toolB": "Mollie's headquarters is not documented in the facts available.",
      "whyItMatters": "A disclosed legal headquarters can matter for procurement and contractual due diligence.",
      "benefitsWho": "Procurement teams performing vendor verification."
    }
  ],
  "featureMatrix": [
    {
      "group": "Payment Methods",
      "rows": [
        {
          "feature": "Card payments",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SEPA / bank Direct Debit",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "In-person / POS terminal payments",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Buy-now-pay-later (Klarna)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Risk & Recovery",
      "rows": [
        {
          "feature": "Failed-payment recovery add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GoCardless: Success+, recovers up to 70%."
        },
        {
          "feature": "Fraud protection",
          "toolA": "available",
          "toolB": "available",
          "note": "GoCardless: Protect+ add-on. Mollie: built into standard processing."
        },
        {
          "feature": "Chargeback challenge assistance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GoCardless: Protect+ tier."
        }
      ]
    },
    {
      "group": "Pricing & Reach",
      "rows": [
        {
          "feature": "Published base transaction rate",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Capped domestic fee",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GoCardless: capped at £4-£5.60 depending on plan."
        },
        {
          "feature": "No-contract standard tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Named accounting integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GoCardless: Xero, QuickBooks, Zuora."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much does GoCardless charge per transaction?",
      "answer": "The Standard plan charges 1% + 20p per transaction, capped at £4 for domestic UK payments."
    },
    {
      "question": "Does Mollie charge a monthly fee?",
      "answer": "Standard online payment pricing has no monthly fee — you only pay per successful transaction."
    },
    {
      "question": "Does GoCardless offer failed payment recovery?",
      "answer": "Yes. Its Success+ add-on automatically recovers up to 70% of failed payments."
    },
    {
      "question": "Does Mollie support in-person payments?",
      "answer": "Yes, via a Pay-as-You-Go plan (€0/month) or a Pro plan (€20/month with a 1-year contract) using card terminals."
    },
    {
      "question": "What payment schemes does GoCardless support?",
      "answer": "SEPA Direct Debit, UK Direct Debit, and Swedish Autogiro, across 34 SEPA countries plus the UK."
    },
    {
      "question": "Where is GoCardless headquartered?",
      "answer": "GoCardless SAS is headquartered in Paris, France."
    }
  ]
};

export default gocardlessVsMollieContent;

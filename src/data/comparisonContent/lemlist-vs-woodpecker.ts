import type { ToolComparisonContent } from './types';

const lemlistVsWoodpeckerContent: ToolComparisonContent = {
  "verdict": "lemlist and Woodpecker both pair cold email with lead sourcing, but they price and package channels very differently. lemlist charges flat, largely per-plan tiers ($69/month Email, $109/user/month Multichannel) and bundles LinkedIn, SMS, WhatsApp, and calling into the pricier Multichannel plan. Woodpecker charges per contacted prospect (from $7 per 100/month) and treats LinkedIn outreach as a separate $29/month-per-account add-on on top of a cheaper email-only base. lemlist discloses SOC 2/GDPR compliance and multi-language support that Woodpecker doesn't document; Woodpecker discloses its founding (2015, Wrocław, Poland) and a larger 1B+ contact database that lemlist doesn't match in stated size.",
  "bestForToolA": "Teams running heavy multichannel campaigns (LinkedIn, SMS, WhatsApp, and calls together) who want it bundled into one per-user plan and need documented SOC 2/GDPR compliance for procurement.",
  "bestForToolB": "Teams that want to pay only for prospects they actually contact rather than a flat per-seat fee, adding LinkedIn as a separate line item only if and when they need it.",
  "whoNeedsBoth": "An agency running email-first campaigns for most clients but LinkedIn-heavy campaigns for a few might use Woodpecker's usage-based pricing for high-volume, low-touch email clients while reserving lemlist's bundled Multichannel plan for accounts that need LinkedIn, SMS, and calling in one workflow.",
  "keyDifferences": [
    {
      "title": "Pricing model",
      "toolA": "Flat monthly tiers ($69/month Email plan; $109/user/month Multichannel plan).",
      "toolB": "Usage-based pricing starting at $7 per 100 contacted prospects/month.",
      "whyItMatters": "Usage-based pricing scales with actual send volume rather than seats, which can be cheaper for lean teams and more expensive for high-volume ones.",
      "benefitsWho": "Small teams with variable or low outreach volume benefit from Woodpecker's model; teams with many users on one plan may prefer lemlist's flat pricing."
    },
    {
      "title": "LinkedIn outreach packaging",
      "toolA": "Bundled into the Multichannel plan ($109/user/month) alongside SMS, WhatsApp, and a call dialer.",
      "toolB": "Sold as a separate $29/month per-account add-on on top of the base usage plan.",
      "whyItMatters": "Whether LinkedIn is bundled or an add-on changes the real cost of running multichannel campaigns.",
      "benefitsWho": "Teams that need LinkedIn from day one benefit from lemlist's bundle; teams that only sometimes need it benefit from Woodpecker's pay-as-needed add-on."
    },
    {
      "title": "Company transparency",
      "toolA": "Founding year and headquarters are not disclosed.",
      "toolB": "Founded in 2015, headquartered in Wrocław, Poland.",
      "whyItMatters": "Disclosed company details can matter for procurement or vendor-risk reviews.",
      "benefitsWho": "Buyers at companies with formal vendor-vetting requirements."
    },
    {
      "title": "Compliance certifications stated",
      "toolA": "SOC 2 certified and GDPR compliant.",
      "toolB": "Not documented in the facts.",
      "whyItMatters": "Formal compliance certifications are often required by security/legal review before a tool can be adopted.",
      "benefitsWho": "Teams at companies with a security review process for new vendors."
    },
    {
      "title": "Stated contact database size",
      "toolA": "650M+ lead database with an email finder, verifier, and phone number finder.",
      "toolB": "Sources prospects from a database of over 1 billion contacts.",
      "whyItMatters": "A larger stated database can mean more prospecting coverage without needing a separate data provider.",
      "benefitsWho": "Teams that want to source and enrich leads inside the same tool they send from."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Billing",
      "rows": [
        {
          "feature": "Billing basis",
          "toolA": "available",
          "toolB": "available",
          "note": "lemlist: flat/per-user plans; Woodpecker: usage-based per contacted prospect"
        },
        {
          "feature": "Free trial (no credit card)",
          "toolA": "available",
          "toolB": "available",
          "note": "lemlist 14-day trial; Woodpecker 14-day trial"
        },
        {
          "feature": "Permanent free tier",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Woodpecker has a $0 usage baseline that scales with contacted prospects"
        }
      ]
    },
    {
      "group": "Lead Sourcing & Channels",
      "rows": [
        {
          "feature": "Stated contact database size",
          "toolA": "available",
          "toolB": "available",
          "note": "650M+ (lemlist) vs 1B+ (Woodpecker)"
        },
        {
          "feature": "Native LinkedIn outreach",
          "toolA": "available",
          "toolB": "limited",
          "note": "Woodpecker: $29/month per-account add-on, not included by default"
        },
        {
          "feature": "SMS/WhatsApp outreach",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Call dialer",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Compliance & Company Info",
      "rows": [
        {
          "feature": "SOC 2 / GDPR compliance stated",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Founding year & HQ disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Woodpecker: founded 2015, Wrocław, Poland"
        },
        {
          "feature": "Multi-language UI",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "lemlist supports English, French, German, Spanish"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does lemlist have a free plan?",
      "answer": "No, but it offers a 14-day free trial with no credit card required."
    },
    {
      "question": "Does Woodpecker have a free plan?",
      "answer": "It has a $0 usage tier plus a 14-day free trial with no credit card required."
    },
    {
      "question": "How is Woodpecker priced?",
      "answer": "Based on contacted prospects, starting at $7 per 100 prospects/month."
    },
    {
      "question": "Is LinkedIn outreach included in lemlist?",
      "answer": "Yes, on the Multichannel plan ($109/user/month), alongside SMS/WhatsApp automation and a call dialer."
    },
    {
      "question": "Is LinkedIn outreach included in Woodpecker?",
      "answer": "No, it's a $29/month per-account add-on."
    },
    {
      "question": "Where is Woodpecker based?",
      "answer": "Wrocław, Poland, founded in 2015."
    }
  ]
};

export default lemlistVsWoodpeckerContent;

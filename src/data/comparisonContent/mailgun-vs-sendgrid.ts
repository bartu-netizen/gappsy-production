import type { ToolComparisonContent } from './types';

const mailgunVsSendgridContent: ToolComparisonContent = {
  "verdict": "Mailgun and SendGrid are both API-first email delivery platforms, but they package things differently: Mailgun bundles sending, deliverability optimization, validation, and inspection tools under published tiered pricing up to $90/month before a custom Enterprise tier, while SendGrid (under Twilio) splits its offering into a separate Email API and Marketing Campaigns product, cites a much larger stated sending volume across its platform, and doesn't publish consistent plan pricing on its current site. Neither wins outright — the choice depends on whether transparent tiered pricing and bundled validation tooling matter more, or vendor ecosystem and stated scale.",
  "bestForToolA": "Teams that want published, predictable tiered pricing ($15 Basic / $35 Foundation / $90 Scale) plus built-in email validation and inbound routing without adding another tool.",
  "bestForToolB": "Teams already using Twilio for SMS, voice, or identity that want transactional email plus a separate marketing campaigns product from the same vendor relationship.",
  "whoNeedsBoth": "Companies that route SMS and voice through Twilio (and use SendGrid for that ecosystem tie-in) but also want Mailgun's dedicated validation and inbound-routing tooling for parts of the stack neither product documents on its own.",
  "keyDifferences": [
    {
      "title": "Email Validation Tooling",
      "toolA": "Mailgun bundles real-time and bulk email address validation as a named product (\"Validate\"), with an allotment included on the Scale plan.",
      "toolB": "The facts for SendGrid don't document a validation product or feature.",
      "whyItMatters": "Validating addresses before sending affects deliverability and bounce rates, which is core to inbox placement.",
      "benefitsWho": "Teams managing large, list-based sends who need to clean data before campaigns."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Mailgun publishes four tiered monthly prices ($0, $15, $35, $90) plus a custom Enterprise tier.",
      "toolB": "SendGrid's plan prices aren't published; the facts note they are \"not consistently published on the current site.\"",
      "whyItMatters": "Buyers evaluating cost upfront can budget with Mailgun without a sales call, while SendGrid pricing requires more research or direct contact.",
      "benefitsWho": "Startups and small teams comparing costs before committing."
    },
    {
      "title": "Product Structure",
      "toolA": "Mailgun offers Send, Optimize, Validate, and Inspect as parts of one platform aimed primarily at developers sending transactional and inbound email.",
      "toolB": "SendGrid separates an Email API/SMTP product for developers from a Marketing Campaigns product for marketers, priced and sold separately.",
      "whyItMatters": "Determines whether a company needs one tool for both technical and marketing sending, or two.",
      "benefitsWho": "Marketing teams that also need a campaign-builder UI, not just an API."
    },
    {
      "title": "Vendor Ecosystem",
      "toolA": "Mailgun is part of Sinch's email suite alongside Mailjet and Email on Acid.",
      "toolB": "SendGrid is owned by Twilio and integrates with Twilio's SMS, voice, and identity verification products.",
      "whyItMatters": "Existing platform relationships can simplify billing, support, and cross-channel integration.",
      "benefitsWho": "Companies already invested in either the Sinch or Twilio ecosystem."
    },
    {
      "title": "Stated Sending Scale",
      "toolA": "Mailgun states it is used by 150,000+ businesses.",
      "toolB": "SendGrid states its infrastructure sends more than 200 billion emails per month.",
      "whyItMatters": "These are different scale metrics (customer count vs. total volume) offered as proof points about reliability at scale.",
      "benefitsWho": "High-volume senders evaluating infrastructure track record."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Sending & Deliverability",
      "rows": [
        {
          "feature": "Transactional email API / SMTP",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Inbound email routing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Send time optimization",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mailgun offers this on higher tiers."
        },
        {
          "feature": "Marketing campaign builder (non-developer)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SendGrid's Marketing Campaigns product."
        }
      ]
    },
    {
      "group": "Validation & Tooling",
      "rows": [
        {
          "feature": "Real-time / bulk email validation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Email preview / testing before sending",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mailgun's Inspect tool."
        },
        {
          "feature": "Log retention tiers documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mailgun documents 1-day, 5-day, and 30-day retention depending on plan."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "limited",
          "note": "Mailgun: 100 emails/day, no time limit. SendGrid's facts describe a free trial with no credit card required rather than a documented permanent free tier."
        },
        {
          "feature": "Published tiered pricing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SAML SSO",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included on Mailgun's Scale plan."
        },
        {
          "feature": "Dedicated IP pools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included on Mailgun's Scale plan."
        }
      ]
    },
    {
      "group": "Ecosystem",
      "rows": [
        {
          "feature": "Cross-integration with SMS/voice platform",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Twilio SMS, voice, identity."
        },
        {
          "feature": "Documented monthly send volume at scale",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "200B+ emails/month across the platform."
        },
        {
          "feature": "Serves both developer (API) and marketer (campaign builder) audiences from one vendor",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Mailgun have a free plan?",
      "answer": "Yes — 100 emails/day with no time limit, 1 sending domain, and 2 API keys."
    },
    {
      "question": "Does SendGrid have a free plan?",
      "answer": "The facts describe a free trial with no credit card required rather than a documented permanent free plan."
    },
    {
      "question": "What does the entry-level paid plan cost for each?",
      "answer": "Mailgun's Basic plan starts at $15/month for 10,000 emails with no daily limit; SendGrid's plan prices are not consistently published on its current site."
    },
    {
      "question": "Does either platform include email validation?",
      "answer": "Mailgun includes real-time and bulk validation, with an allotment on the Scale plan; SendGrid's facts don't mention a validation feature."
    },
    {
      "question": "Who owns each company?",
      "answer": "Mailgun is part of Sinch's email suite (with Mailjet and Email on Acid); SendGrid is owned by Twilio and integrates with Twilio's SMS, voice, and identity products."
    }
  ]
};

export default mailgunVsSendgridContent;

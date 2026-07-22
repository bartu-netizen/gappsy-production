import type { ToolComparisonContent } from './types';

const amplemarketVsWarmlyContent: ToolComparisonContent = {
  "verdict": "Amplemarket and Warmly address different halves of the go-to-market funnel rather than competing head-to-head. Amplemarket is an outbound platform (Duo Copilot, multichannel sequences, a Domain Health Center for deliverability) starting at $600/month on an annual term. Warmly is built around inbound website de-anonymization, AI chat engagement, and ad retargeting, starting considerably higher at $10,000/year with no free trial. Neither publishes a free plan; Amplemarket offers a trial, Warmly does not.",
  "bestForToolA": "Teams doing outbound prospecting who want AI-driven signal capture (job changes, competitor activity) folded directly into multichannel email/phone/social sequences, with visibility into deliverability via the Domain Health Center.",
  "bestForToolB": "Teams focused on converting inbound website traffic — identifying anonymous visitors at the person level, engaging them via AI chat, and retargeting them on LinkedIn/email — that also need API/MCP access to build custom workflows around that data.",
  "whoNeedsBoth": "A revenue team running outbound campaigns with Amplemarket could pair it with Warmly to also capture and engage the inbound visitors those campaigns drive to the website, since Amplemarket doesn't document person-level website de-anonymization and Warmly doesn't document outbound multichannel sequencing.",
  "keyDifferences": [
    {
      "title": "Primary use case",
      "toolA": "Outbound prospecting and multichannel sequencing (email, phone, social) driven by AI-captured buying signals.",
      "toolB": "Inbound website visitor identification, AI chat engagement, and ad retargeting.",
      "whyItMatters": "The two tools solve opposite problems in the funnel — generating outbound touches vs. converting existing site traffic.",
      "benefitsWho": "Outbound-heavy sales teams need Amplemarket's sequencing; inbound-heavy marketing/sales teams need Warmly's visitor ID."
    },
    {
      "title": "Entry pricing",
      "toolA": "Startup plan is $600/month on an annual term (2 users).",
      "toolB": "Plans start at $10,000/year (AI Web-Deanonymization).",
      "whyItMatters": "The two tools sit in very different budget tiers even before considering add-ons.",
      "benefitsWho": "Budget planners comparing total annual GTM tool spend."
    },
    {
      "title": "Deliverability monitoring",
      "toolA": "Domain Health Center monitors email warmup, spam risk, and inbox placement.",
      "toolB": "Not documented; Warmly isn't positioned as an email-sending tool.",
      "whyItMatters": "Teams sending high email volumes need visibility into deliverability before campaigns go out.",
      "benefitsWho": "Outbound teams worried about inbox placement and sender reputation."
    },
    {
      "title": "API and MCP access",
      "toolA": "Not documented in the facts.",
      "toolB": "Accessible via app, API, and MCP for custom workflows.",
      "whyItMatters": "Programmatic access lets technical teams build custom automations on top of the platform's data.",
      "benefitsWho": "RevOps or engineering teams building custom GTM workflows."
    },
    {
      "title": "Free trial availability",
      "toolA": "Offers a free trial (pricing model is Free Trial).",
      "toolB": "No free trial; pricing model is Paid only.",
      "whyItMatters": "The ability to trial reduces the risk of committing to enterprise pricing sight-unseen.",
      "benefitsWho": "Buyers who want to validate fit before an enterprise-level commitment."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Focus & Signals",
      "rows": [
        {
          "feature": "Outbound multichannel sequencing (email/phone/social)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Person-level website visitor identification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Core capability of Warmly's Inbound Agent"
        },
        {
          "feature": "AI chatbot for site visitors",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Email deliverability/domain health monitoring",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Amplemarket's Domain Health Center"
        },
        {
          "feature": "Ad retargeting (LinkedIn/email)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry-level price",
          "toolA": "available",
          "toolB": "available",
          "note": "$600/mo annual term vs $10,000/year"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Custom pricing tiers above entry",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Warmly's three tiers all have disclosed prices"
        }
      ]
    },
    {
      "group": "Access & Integrations",
      "rows": [
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "MCP support",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Amplemarket offer a free plan?",
      "answer": "No published free plan; Amplemarket offers a free trial rather than an ongoing free tier."
    },
    {
      "question": "How much does Amplemarket cost?",
      "answer": "The Startup plan is $600/month on an annual term for 2 users; Growth and Elite plans use custom pricing."
    },
    {
      "question": "What is Duo Copilot?",
      "answer": "Amplemarket's AI sales agent that captures buying signals and builds personalized multichannel outreach sequences."
    },
    {
      "question": "What does Warmly's Inbound Agent do?",
      "answer": "It identifies website visitors at the person level and engages them via an AI chatbot, smart popups, and retargeting."
    },
    {
      "question": "How much does Warmly cost?",
      "answer": "Plans start at $10,000/year for AI Web-Deanonymization, up to $30,000/year for AI Inbound Autopilot; quarterly billing is also available."
    },
    {
      "question": "Does Warmly have an API?",
      "answer": "Yes, the platform is accessible via app, API, and MCP."
    }
  ]
};

export default amplemarketVsWarmlyContent;

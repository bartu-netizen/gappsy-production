import type { ToolComparisonContent } from './types';

const mailshakeVsSaleshandyContent: ToolComparisonContent = {
  "verdict": "Both are cold-outreach platforms bundling lead data with sequencing, but they treat trials and disclosure differently. Mailshake requires payment upfront with no free trial while including its SHAKEspeare AI writer on every paid tier. Saleshandy offers a 7-day trial plus free lead credits and documents a much larger 852M+ contact database across 42M+ companies, along with SOC 2/ISO 27001/GDPR compliance and more native channels (LinkedIn, WhatsApp) than Mailshake discloses.",
  "bestForToolA": "Teams that want AI email writing bundled into every paid tier without hunting for it in an add-on, and that already know they want Mailshake's phone dialer plus CRM integrations (Salesforce, Pipedrive, HubSpot) without needing to trial it first.",
  "bestForToolB": "Teams that want to test the platform before paying, need a documented large B2B contact database (852M+ contacts/42M+ companies) with buying signals, or require SOC 2/ISO 27001/GDPR compliance on paper for procurement.",
  "whoNeedsBoth": "A sales org already paying for Mailshake's phone dialer and CRM-native workflow might still pull Saleshandy's larger stated prospect database and buying-signal data during list-building, since Mailshake doesn't document a comparable database size.",
  "keyDifferences": [
    {
      "title": "Free trial availability",
      "toolA": "No free trial; all plans require payment upfront.",
      "toolB": "7-day free trial plus up to 50 free lead credits.",
      "whyItMatters": "The ability to trial before paying lowers the risk of committing budget to an unfamiliar tool.",
      "benefitsWho": "Buyers who want to validate deliverability and workflow fit before paying."
    },
    {
      "title": "Stated B2B contact database",
      "toolA": "Not documented; the Data Finder tool identifies prospects by role/location/company but no total database size is stated.",
      "toolB": "852M+ verified contacts across 42M+ companies with buying signals.",
      "whyItMatters": "A disclosed database size and company count let buyers gauge prospecting coverage before committing.",
      "benefitsWho": "Teams sourcing prospect lists directly inside the outreach tool rather than a separate data provider."
    },
    {
      "title": "Compliance certifications stated",
      "toolA": "Not documented in the facts.",
      "toolB": "SOC 2, ISO 27001, and GDPR compliant.",
      "whyItMatters": "Documented certifications matter for security/legal reviews at larger buyers.",
      "benefitsWho": "Teams at companies with formal vendor-security requirements."
    },
    {
      "title": "Channel breadth",
      "toolA": "Email, phone dialer (Sales Engagement tier), and social outreach.",
      "toolB": "Email, calls, LinkedIn, WhatsApp, and custom tasks in a single sequence.",
      "whyItMatters": "More documented channels in one sequence reduces the need for separate point tools.",
      "benefitsWho": "Teams running coordinated multichannel cadences across LinkedIn and WhatsApp."
    },
    {
      "title": "AI writer availability",
      "toolA": "SHAKEspeare AI Email Writer is included on all paid tiers.",
      "toolB": "AI Sequence Copilot is a listed feature, though the facts don't specify which tier it starts on.",
      "whyItMatters": "Knowing whether AI writing is included from the cheapest plan affects total cost for smaller teams.",
      "benefitsWho": "Solo founders or small teams on the entry-level plan who want AI drafting without upgrading."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Trial",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Saleshandy: 7 days + 50 free lead credits"
        },
        {
          "feature": "Entry-level monthly price",
          "toolA": "available",
          "toolB": "available",
          "note": "Mailshake $29/mo vs Saleshandy $25/mo (annual)"
        },
        {
          "feature": "Custom Agency/Enterprise tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mailshake's Agency tier is custom-priced; Saleshandy's top disclosed tier (Outreach Scale Plus) has a stated price"
        }
      ]
    },
    {
      "group": "Lead Sourcing & Channels",
      "rows": [
        {
          "feature": "Stated B2B contact database",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "852M+ contacts, 42M+ companies"
        },
        {
          "feature": "Phone dialer",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Mailshake: Sales Engagement tier only, 5 phone numbers; Saleshandy: available as an add-on"
        },
        {
          "feature": "LinkedIn outreach",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "WhatsApp outreach",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deliverability & Compliance",
      "rows": [
        {
          "feature": "SOC 2 / ISO 27001 / GDPR compliance stated",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated SPF/DKIM/DMARC setup",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Saleshandy: auto-configured in under 10 minutes"
        },
        {
          "feature": "AI writing assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "Mailshake: SHAKEspeare, all paid tiers; Saleshandy: AI Sequence Copilot"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Mailshake offer a free trial?",
      "answer": "No, all plans require payment upfront; there's no free plan or trial."
    },
    {
      "question": "Does Saleshandy offer a free trial?",
      "answer": "Yes, a 7-day free trial plus up to 50 free lead credits."
    },
    {
      "question": "How large is Saleshandy's B2B database?",
      "answer": "Over 852 million contacts across 42 million companies."
    },
    {
      "question": "Is Mailshake's AI writer included on all plans?",
      "answer": "Yes, the SHAKEspeare AI Email Writer is included on all paid tiers."
    },
    {
      "question": "Is Saleshandy SOC 2 compliant?",
      "answer": "Yes, along with ISO 27001 and GDPR compliance."
    },
    {
      "question": "What's the cheapest plan for each tool?",
      "answer": "Mailshake's Starter plan is $29/month ($25/month billed yearly); Saleshandy's Outreach Starter is $25/month billed annually."
    }
  ]
};

export default mailshakeVsSaleshandyContent;

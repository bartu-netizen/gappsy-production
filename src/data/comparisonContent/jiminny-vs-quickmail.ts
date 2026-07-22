import type { ToolComparisonContent } from './types';

const jiminnyVsQuickmailContent: ToolComparisonContent = {
  "verdict": "Jiminny and QuickMail sit at different stages of the sales process rather than competing head-on: QuickMail is a cold outreach platform for running multi-channel email and LinkedIn campaigns to generate new conversations, starting at $49/month, while Jiminny is a conversation-intelligence tool that records, transcribes, and analyzes the sales calls that happen after a meeting is booked. QuickMail publishes its pricing tiers openly; Jiminny discloses none. Both offer a 14-day free trial, but only QuickMail states there is no automatic charge after it ends.",
  "bestForToolA": "Sales teams that want AI-recorded, transcribed calls with automated CRM logging, coaching insights, and pipeline risk detection, especially organizations needing documented SOC 2 Type II, GDPR, CCPA, and HIPAA compliance for recorded conversations.",
  "bestForToolB": "SDR and growth teams running outbound email and LinkedIn prospecting who want published pricing (from $49/month), built-in deliverability protection (warming, sender rotation, blacklist monitoring), and native two-way CRM sync with HubSpot or Pipedrive.",
  "whoNeedsBoth": "This is a realistic combination: an SDR team could use QuickMail to source and book meetings through cold email and LinkedIn outreach, then hand qualified conversations to an AE team using Jiminny to record, transcribe, and coach on the resulting sales calls, covering prospecting and post-meeting analysis end to end.",
  "keyDifferences": [
    {
      "title": "Stage of the Sales Funnel",
      "toolA": "Jiminny analyzes conversations after they happen, recording and transcribing calls, video meetings, and emails and syncing insights to the CRM.",
      "toolB": "QuickMail generates new conversations before they happen, running multi-channel email and LinkedIn outreach campaigns with ICP filtering.",
      "whyItMatters": "Buyers need to know which stage of the pipeline a tool addresses before comparing them as substitutes.",
      "benefitsWho": "Sales leaders mapping tools to specific stages of their funnel."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Jiminny's specific pricing tiers are not disclosed on its site; you need to sign up or contact the company for pricing.",
      "toolB": "QuickMail publishes exact tiers: Starter at $49/month, Growth at $99/month, and Agency at $299/month.",
      "whyItMatters": "Published pricing lets buyers budget without a sales call, which matters for smaller teams evaluating quickly.",
      "benefitsWho": "Budget-conscious teams and solo founders comparing costs upfront."
    },
    {
      "title": "AI Use Case",
      "toolA": "Jiminny's AI powers call recording, transcription, and an AI notetaker that captures notes during conversations.",
      "toolB": "QuickMail's AI feature, Reword with AI, rewrites outreach message copy rather than analyzing conversations.",
      "whyItMatters": "The two tools apply AI to opposite ends of the process: writing outreach versus listening to sales calls.",
      "benefitsWho": "Teams evaluating whether they need AI for message writing or for call analysis."
    },
    {
      "title": "CRM Integration Depth",
      "toolA": "Jiminny automatically syncs extracted insights, notes, and activity data to the CRM and integrates with HubSpot and Aircall.",
      "toolB": "QuickMail offers native two-way sync with HubSpot and Pipedrive, plus Zapier and API/webhook access on Growth and Agency plans.",
      "whyItMatters": "Teams standardized on a specific CRM need to confirm native, two-way sync rather than one-way logging.",
      "benefitsWho": "RevOps teams maintaining a single source of truth in HubSpot or Pipedrive."
    },
    {
      "title": "Compliance and Security Documentation",
      "toolA": "Jiminny is SOC 2 Type II certified and compliant with GDPR, CCPA, and HIPAA, hosted on AWS with a 99.9% uptime guarantee.",
      "toolB": "QuickMail's facts don't document specific compliance certifications.",
      "whyItMatters": "Recording customer conversations carries higher compliance stakes than sending outbound emails, so certification documentation matters more for Jiminny's use case.",
      "benefitsWho": "Sales teams in regulated industries like healthcare or finance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Outreach & Prospecting",
      "rows": [
        {
          "feature": "Multi-channel email + LinkedIn campaigns",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Deliverability monitoring (warming, sender rotation, blacklist)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Unified inbox for replies",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Conversation Intelligence & Coaching",
      "rows": [
        {
          "feature": "AI call/meeting recording and transcription",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Sales coaching insights",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Pipeline risk detection",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Competitive intelligence tracking",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Integrations, Pricing & Trust",
      "rows": [
        {
          "feature": "Native CRM sync",
          "toolA": "available",
          "toolB": "available",
          "note": "Jiminny: HubSpot, Aircall. QuickMail: two-way HubSpot and Pipedrive sync."
        },
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "QuickMail: Growth ($99/mo) and Agency ($299/mo) plans."
        },
        {
          "feature": "Published pricing tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "QuickMail: $49 / $99 / $299 per month."
        },
        {
          "feature": "Compliance certifications (SOC 2, GDPR, HIPAA)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Jiminny and QuickMail direct competitors?",
      "answer": "No. QuickMail is an outbound cold outreach platform for generating new conversations via email and LinkedIn, while Jiminny is a conversation-intelligence tool that records and analyzes sales calls after they happen."
    },
    {
      "question": "Which has published pricing?",
      "answer": "QuickMail publishes tiers at $49/month (Starter), $99/month (Growth), and $299/month (Agency). Jiminny does not disclose pricing tiers publicly."
    },
    {
      "question": "Do both offer free trials?",
      "answer": "Yes. Both offer 14-day free trials. QuickMail states there is no automatic charge after the trial ends; Jiminny's trial includes full feature access with no credit card required, but post-trial pricing isn't disclosed."
    },
    {
      "question": "How does each tool use AI?",
      "answer": "QuickMail's Reword with AI rewrites outreach message copy. Jiminny's AI records, transcribes, and takes notes on calls and video meetings."
    },
    {
      "question": "Which integrates better with a CRM?",
      "answer": "QuickMail has native two-way sync with HubSpot and Pipedrive plus API and webhook access on higher tiers. Jiminny automatically syncs insights to the CRM and names HubSpot and Aircall as integrations."
    },
    {
      "question": "Should a sales team use both tools together?",
      "answer": "It can make sense: QuickMail to generate outbound meetings, and Jiminny to record and analyze the resulting sales calls once they're booked."
    }
  ]
};

export default jiminnyVsQuickmailContent;

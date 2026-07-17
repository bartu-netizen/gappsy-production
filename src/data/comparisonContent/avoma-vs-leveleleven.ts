import type { ToolComparisonContent } from './types';

const avomaVsLevelelevenContent: ToolComparisonContent = {
  "verdict": "Avoma and LevelEleven both support sales coaching but pull from different data sources. Avoma, founded in 2017 and based in Palo Alto, is an AI meeting assistant that transcribes calls in 40+ languages, scores conversations, and surfaces deal risk, with transparent pricing starting at $19/user/month and free view-only seats. LevelEleven, now part of the Ascent Cloud suite, turns Salesforce activity and pipeline data into scorecards, coaching views, and gamified leaderboard competitions, available as a free trial via the Salesforce AppExchange. Avoma coaches based on what was said in a call; LevelEleven coaches based on what activity and outcomes show up in the CRM.",
  "bestForToolA": "Sales teams that want AI-recorded, transcribed, and scored conversations with an AI copilot (Ask Avoma) for querying deal history, at transparent pricing starting at $19/user/month with a 14-day free trial.",
  "bestForToolB": "Salesforce-native sales organizations that want daily scorecards against targets and gamified leaderboard competitions to drive specific selling behaviors -- LevelEleven has an installed base of 1,000+ sales teams.",
  "whoNeedsBoth": "A Salesforce-based sales team could use Avoma to record, transcribe, and coach on individual sales calls, then use LevelEleven to track daily scorecards and run leaderboard competitions on the resulting activity and pipeline data logged in Salesforce -- the two tools operate at different altitudes, call-level coaching versus team-level performance management, and are not documented as overlapping.",
  "keyDifferences": [
    {
      "title": "Data Source for Coaching",
      "toolA": "Avoma coaches from actual recorded conversations -- call scoring and talk pattern analysis via its Conversation Intelligence tier, plus AI-generated notes and summaries.",
      "toolB": "LevelEleven coaches from Salesforce activity and pipeline data through coaching views that give managers visibility into rep activity and outcomes.",
      "whyItMatters": "Teams wanting to improve how reps handle live conversations need call-level data (Avoma), while teams wanting to track pipeline discipline and activity volume need CRM-level data (LevelEleven).",
      "benefitsWho": "Sales enablement teams focused on call quality (Avoma) versus sales managers focused on pipeline activity metrics (LevelEleven)."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Avoma publishes pricing: $19/user/month for AI Meeting Assistant, $29/user/month for AI Meeting Assistant plus Conversation Intelligence, both billed annually.",
      "toolB": "LevelEleven does not publish pricing; Ascent Cloud provides custom quotes based on team size and selected products.",
      "whyItMatters": "Teams comparing costs upfront can budget for Avoma immediately, while LevelEleven requires a sales conversation to get a number.",
      "benefitsWho": "Budget-conscious sales teams wanting to compare exact monthly costs before committing to a demo."
    },
    {
      "title": "Gamification",
      "toolA": "Avoma does not document gamification, leaderboards, or team competitions.",
      "toolB": "LevelEleven runs leaderboards and recognition-based competitions specifically designed to drive selling behaviors.",
      "whyItMatters": "Organizations wanting to motivate reps through friendly competition and public recognition need LevelEleven's gamification layer, which Avoma does not offer.",
      "benefitsWho": "Sales managers running team-wide motivation programs and competitions."
    },
    {
      "title": "CRM Breadth",
      "toolA": "Avoma integrates with 1,000+ tools including major CRMs such as Salesforce, HubSpot, and Pipedrive.",
      "toolB": "LevelEleven is built to work primarily with Salesforce CRM data and distributed via the Salesforce AppExchange.",
      "whyItMatters": "Teams on HubSpot, Pipedrive, or other CRMs get full value from Avoma, while LevelEleven's value is concentrated for Salesforce-only shops.",
      "benefitsWho": "Multi-CRM or non-Salesforce sales organizations (Avoma) versus Salesforce-committed organizations (LevelEleven)."
    },
    {
      "title": "AI Copilot for Deal Context",
      "toolA": "Avoma includes Ask Avoma, an AI copilot that answers questions about recorded conversations and deal history.",
      "toolB": "LevelEleven does not document an AI copilot feature.",
      "whyItMatters": "Reps and managers wanting quick answers about a deal's conversation history without manually reviewing recordings benefit from a conversational AI layer, unique to Avoma here.",
      "benefitsWho": "Managers and reps who need fast context on past conversations before a follow-up call."
    }
  ],
  "featureMatrix": [
    {
      "group": "Coaching & Conversation Intelligence",
      "rows": [
        {
          "feature": "Call recording and transcription",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Avoma: 40+ languages"
        },
        {
          "feature": "Call scoring / talk pattern coaching",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Avoma: Conversation Intelligence tier, $29/user/month"
        },
        {
          "feature": "AI copilot for deal Q&A",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ask Avoma"
        },
        {
          "feature": "Manager coaching views from CRM activity",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Performance Management & Gamification",
      "rows": [
        {
          "feature": "Scorecards vs. targets",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Leaderboards / competitions",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Deal risk / pipeline visibility",
          "toolA": "available",
          "toolB": "available",
          "note": "Avoma: revenue intelligence; LevelEleven: KPI tracking"
        },
        {
          "feature": "Meeting scheduling and lead routing",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Avoma: $19-$29/user/month"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Avoma: 14 days, no credit card; LevelEleven: via Salesforce AppExchange"
        },
        {
          "feature": "Free / no-cost seats",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Avoma: free view-only seats"
        },
        {
          "feature": "Native mobile apps",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Avoma: iOS and Android"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Avoma or LevelEleven publish pricing?",
      "answer": "Avoma publishes pricing at $19/user/month for AI Meeting Assistant and $29/user/month with Conversation Intelligence, both billed annually. LevelEleven does not publish pricing and requires a custom quote through Ascent Cloud."
    },
    {
      "question": "Which tool records and transcribes sales calls?",
      "answer": "Avoma records and transcribes meetings in real time, supporting 40+ languages. This is not documented as a LevelEleven feature."
    },
    {
      "question": "Does LevelEleven include gamification?",
      "answer": "Yes, LevelEleven runs leaderboards and recognition-based competitions to drive selling behaviors. Avoma does not document gamification features."
    },
    {
      "question": "Is LevelEleven usable outside Salesforce?",
      "answer": "LevelEleven is built to work primarily with Salesforce CRM data, which limits its value for teams on other CRMs. Avoma integrates with 1,000+ tools including Salesforce, HubSpot, and Pipedrive."
    },
    {
      "question": "Can I try both tools for free?",
      "answer": "Yes, Avoma offers a 14-day free trial with no credit card required, plus free view-only seats. LevelEleven is available as a free trial through the Salesforce AppExchange."
    },
    {
      "question": "Which tool is better for coaching reps on actual sales calls?",
      "answer": "Avoma is built specifically for this -- it records, transcribes, and scores calls, and offers an AI copilot (Ask Avoma) to query conversation history. LevelEleven's coaching views are based on Salesforce activity data rather than call content."
    }
  ]
};

export default avomaVsLevelelevenContent;

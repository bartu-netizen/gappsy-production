import type { ToolComparisonContent } from './types';

const aircallVsOpenphoneContent: ToolComparisonContent = {
  "verdict": "Aircall and OpenPhone are both cloud business phone systems, but they are built for differently shaped teams. Aircall, founded in 2014 and based in Paris and New York, targets sales and support call teams that need real call-center depth: a Power Dialer for outbound prospecting, IVR and smart routing for inbound queues, and live call monitoring so managers can listen in, whisper, or barge into calls for coaching. It connects to a wide integration marketplace including Salesforce, HubSpot, Zendesk, Intercom, and Pipedrive, plus a public API, and its AI layer adds transcription, summaries, and sentiment tagging. The tradeoff is cost and structure: pricing starts around $30/user/month with a 3-license minimum, so it is not built for solo users or two-person teams. OpenPhone, founded in 2018 in San Francisco, starts at roughly $15/user/month with no stated seat minimum, and centers on shared phone numbers, a team inbox, and texting so small teams and startups can collaborate on the same line. It covers the fundamentals well, including call recording, voicemail transcription, AI summaries, auto-replies, and CRM integrations, but its own documentation acknowledges more limited IVR customization and less depth for large-scale contact center operations. Neither tool is a strict upgrade over the other: Aircall is built for structured, coached outbound and inbound calling teams, while OpenPhone is built for lean teams that want a shared number and lightweight AI assistance without licensing overhead.",
  "bestForToolA": "Aircall best fits sales and support teams of three or more reps that need outbound power dialing, inbound call routing, and live coaching tools built into one platform.",
  "bestForToolB": "OpenPhone best fits startups and small teams that want a shared business number, team texting, and AI call summaries without a per-seat minimum or a steep learning curve.",
  "whoNeedsBoth": "A growing company might start on OpenPhone for its shared number and texting, then layer in Aircall once a dedicated sales or support team needs power dialing and formal call routing and coaching.",
  "keyDifferences": [
    {
      "title": "Pricing and Minimum Seats",
      "toolA": "Starts at about $30/user/month billed annually with a 3-license minimum, so cost effectively begins near $90/month for a small team.",
      "toolB": "Starts at around $15/user/month billed annually with no documented seat minimum.",
      "whyItMatters": "The 3-seat minimum and higher per-user rate make Aircall a bigger upfront commitment, while OpenPhone's lower floor suits very small teams.",
      "benefitsWho": "Cost-sensitive startups and small teams benefit from OpenPhone's lower entry price; teams already planning 3 or more seats may not mind Aircall's minimum."
    },
    {
      "title": "Core Use Case",
      "toolA": "Built around structured outbound and inbound call-center workflows for sales and support teams.",
      "toolB": "Built around shared business numbers, team texting, and lightweight collaboration for startups and small teams.",
      "whyItMatters": "Buyers deciding between call-center-style call handling and a shared communications inbox will land on different tools.",
      "benefitsWho": "Dedicated sales or support call teams lean toward Aircall; general small business teams lean toward OpenPhone."
    },
    {
      "title": "Outbound Power Dialing",
      "toolA": "Includes a Power Dialer that automatically queues and dials through prospect lists.",
      "toolB": "Not documented as offering an automated power or outbound dialer.",
      "whyItMatters": "Teams doing high-volume outbound prospecting need automated dialing to cut manual dial time between calls.",
      "benefitsWho": "Outbound sales teams benefit from Aircall's Power Dialer; teams handling mostly inbound or one-to-one calls may not need it."
    },
    {
      "title": "Live Call Monitoring and Coaching",
      "toolA": "Managers can listen in, whisper coaching tips, or barge into live calls, plus review recordings afterward.",
      "toolB": "Not documented as offering live listen, whisper, or barge monitoring.",
      "whyItMatters": "Real-time coaching capability matters for sales and support managers actively training reps during live calls.",
      "benefitsWho": "Sales and support managers running structured coaching programs benefit from Aircall; smaller teams without formal coaching needs may not miss it."
    },
    {
      "title": "Team Texting",
      "toolA": "Not documented as offering SMS or team texting.",
      "toolB": "Offers team texting as a core capability alongside shared phone numbers.",
      "whyItMatters": "Teams that rely on text messaging alongside calls need it built into the same tool rather than bolted on separately.",
      "benefitsWho": "Small teams and startups that text customers regularly benefit from OpenPhone's built-in texting."
    },
    {
      "title": "Voicemail Handling",
      "toolA": "Offers voicemail drop, letting reps leave a pre-recorded voicemail without waiting through a live greeting.",
      "toolB": "Offers voicemail transcription, converting voicemail messages into readable text.",
      "whyItMatters": "These solve different problems: saving rep time on outbound voicemails versus saving triage time on inbound voicemails.",
      "benefitsWho": "Outbound sales reps benefit from Aircall's voicemail drop; teams triaging inbound messages benefit from OpenPhone's transcription."
    },
    {
      "title": "Integration Breadth and API",
      "toolA": "Connects natively with Salesforce, HubSpot, Zendesk, Intercom, Pipedrive, and Slack, backed by a public API for custom setups.",
      "toolB": "Connects with HubSpot, Salesforce, Slack, and Zapier.",
      "whyItMatters": "A broader native marketplace plus a public API gives more flexibility for custom or helpdesk-heavy tech stacks.",
      "benefitsWho": "Teams using helpdesk tools like Zendesk or Intercom, or with custom API needs, benefit from Aircall; teams already relying on Zapier for lightweight automation benefit from OpenPhone."
    },
    {
      "title": "AI Features Availability by Plan",
      "toolA": "Aircall AI, covering transcription, summaries, and sentiment or topic tagging, is a paid add-on on the entry-level Essentials plan and included on Professional.",
      "toolB": "AI call transcripts and summaries are included starting on the Business plan, above the entry-level Starter plan.",
      "whyItMatters": "Buyers wanting AI features on the cheapest plan need to check whether it is included or an extra cost in either tool.",
      "benefitsWho": "Teams that only need basic calling can save money on Essentials or Starter; teams that want AI from day one should budget for the Professional or Business tier, or the add-on."
    },
    {
      "title": "Company Maturity and Headquarters",
      "toolA": "Founded in 2014, headquartered in Paris, France and New York, NY.",
      "toolB": "Founded in 2018, headquartered in San Francisco, California.",
      "whyItMatters": "Aircall has several more years in market building out its integration marketplace and enterprise-facing features.",
      "benefitsWho": "Buyers prioritizing a longer track record and broader integration marketplace may lean toward Aircall; those comfortable with a newer, more startup-focused vendor may prefer OpenPhone."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Calling and Devices",
      "rows": [
        {
          "feature": "Browser, Desktop and Mobile Calling",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer native apps across web, desktop, and mobile."
        },
        {
          "feature": "Click-to-Dial from CRM Record",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aircall explicitly documents one-click dialing from a connected CRM or helpdesk record."
        },
        {
          "feature": "Virtual / Shared Phone Numbers",
          "toolA": "available",
          "toolB": "available",
          "note": "Aircall provisions local, national, and toll-free numbers across many countries; OpenPhone provides shared team numbers."
        },
        {
          "feature": "Number Porting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "OpenPhone's FAQ confirms porting of existing numbers; Aircall's facts do not address porting."
        }
      ]
    },
    {
      "group": "Outbound Sales Tools",
      "rows": [
        {
          "feature": "Power / Auto Dialer",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Voicemail Drop",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OpenPhone instead documents voicemail transcription, a different capability."
        }
      ]
    },
    {
      "group": "Inbound Call Routing",
      "rows": [
        {
          "feature": "IVR / Menu Routing",
          "toolA": "available",
          "toolB": "available",
          "note": "OpenPhone's own documentation notes its advanced IVR and routing customization is more limited than dedicated enterprise platforms."
        },
        {
          "feature": "Business-Hours-Based Routing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Team Collaboration and Messaging",
      "rows": [
        {
          "feature": "Shared Call Inbox",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Team Texting (SMS)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Auto-Replies and Snooze",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Contact Management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI Call Transcription",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI Call Summaries",
          "toolA": "available",
          "toolB": "available",
          "note": "Aircall AI is a paid add-on on Essentials; OpenPhone's AI summaries start on the Business plan."
        },
        {
          "feature": "Sentiment / Topic Tagging",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Voicemail Transcription",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Aircall documents voicemail drop instead, not transcription."
        }
      ]
    },
    {
      "group": "Coaching, Recording and Analytics",
      "rows": [
        {
          "feature": "Live Call Monitoring (Listen / Whisper / Barge)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Call Recording",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Analytics and Reporting",
          "toolA": "available",
          "toolB": "available",
          "note": "Aircall's advanced analytics with extended history is documented on the Professional plan and above."
        }
      ]
    },
    {
      "group": "Integrations and Extensibility",
      "rows": [
        {
          "feature": "CRM / Helpdesk Integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Aircall lists Salesforce, HubSpot, Zendesk, Intercom, Pipedrive, and Slack; OpenPhone lists HubSpot, Salesforce, Slack, and Zapier."
        },
        {
          "feature": "Public API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Aircall or OpenPhone?",
      "answer": "OpenPhone is cheaper at the entry level, starting around $15/user/month, versus Aircall's roughly $30/user/month plus a 3-license minimum that raises the effective starting cost."
    },
    {
      "question": "Is Aircall or OpenPhone better for a small startup team?",
      "answer": "OpenPhone is generally the better fit for small startup teams since it has no documented seat minimum and centers on shared numbers and texting, while Aircall requires a 3-license minimum built around structured call-center workflows."
    },
    {
      "question": "Does OpenPhone have a power dialer like Aircall?",
      "answer": "No, OpenPhone's documented feature set does not include an automated power dialer; Aircall offers a dedicated Power Dialer for queuing and dialing through prospect lists."
    },
    {
      "question": "Which tool has better AI call features?",
      "answer": "Both offer AI call transcription and summaries, but Aircall AI additionally documents sentiment and topic tagging, and Aircall's AI features are a paid add-on on its entry Essentials plan while OpenPhone's AI features start on its Business plan rather than its cheapest Starter plan."
    },
    {
      "question": "Can Aircall or OpenPhone replace an enterprise contact center platform?",
      "answer": "Neither is positioned as a full enterprise contact center replacement; Aircall's own documentation notes it is less suited to very large, complex omnichannel contact centers, and OpenPhone's documentation notes limited depth for large-scale contact center operations."
    },
    {
      "question": "Does Aircall support team texting like OpenPhone?",
      "answer": "Not documented; Aircall's verified feature set covers calling, IVR, and voicemail but does not list SMS or team texting, while OpenPhone documents team texting as a core capability alongside shared phone numbers."
    }
  ]
};

export default aircallVsOpenphoneContent;

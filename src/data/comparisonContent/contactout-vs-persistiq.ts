import type { ToolComparisonContent } from './types';

const contactoutVsPersistiqContent: ToolComparisonContent = {
  "verdict": "ContactOut and PersistIQ solve different halves of outbound prospecting. ContactOut is a contact-finding tool built around a 350-million-professional database, a Chrome extension, and an API for pulling verified emails and phone numbers. PersistIQ is a sales engagement platform for small teams that automates multi-step email, call, and task sequences and syncs activity into Salesforce or Copper. One finds who to contact; the other runs the outreach campaign once you have them.",
  "bestForToolA": "ContactOut fits recruiters and sales teams who need to pull verified emails and phone numbers at scale from a 350-million-professional, 40-million-company database, especially via its Chrome extension while browsing LinkedIn or through its API for bulk lookups.",
  "bestForToolB": "PersistIQ fits small sales teams that want to build LinkedIn-sourced prospect lists and immediately launch automated, A/B-tested email, call, and task sequences with native bi-directional sync into Salesforce or Copper.",
  "whoNeedsBoth": "A small sales team could use ContactOut's Chrome extension and API to find and verify contact data at scale, then feed those contacts into PersistIQ to run automated, multi-touch outreach sequences with A/B testing and CRM sync, since ContactOut does not document its own sequencing/automation layer.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "ContactOut is a contact intelligence tool focused on finding verified emails and phone numbers for 350 million professionals across 40 million companies, with a Chrome extension, web search portal, and API.",
      "toolB": "PersistIQ is a sales engagement platform focused on automating personalized email, call, and task sequences once prospects are identified, including A/B testing of messages.",
      "whyItMatters": "Buyers need to know whether they're evaluating a data-sourcing tool or an outreach-automation tool, since the two solve different steps in the pipeline.",
      "benefitsWho": "Teams that already have a CRM full of contacts but need better sequencing benefit from PersistIQ; teams that lack contact data in the first place benefit from ContactOut."
    },
    {
      "title": "Free Access",
      "toolA": "ContactOut offers 5 free credits daily with no credit card required, per its documented Free plan.",
      "toolB": "PersistIQ offers a 14-day free trial rather than an ongoing free tier.",
      "whyItMatters": "A perpetual daily free allowance behaves differently in a budgeting decision than a time-boxed trial that eventually requires payment.",
      "benefitsWho": "Individual users or very light prospecting needs benefit from ContactOut's recurring free credits; teams wanting to fully trial an outreach workflow benefit from PersistIQ's 14-day window."
    },
    {
      "title": "CRM Sync",
      "toolA": "ContactOut's documented facts do not list native CRM sync as a feature; it focuses on contact search, Chrome extension lookups, email campaigns, and API access.",
      "toolB": "PersistIQ offers native bi-directional sync integrations specifically with Salesforce and Copper for contact records and activities.",
      "whyItMatters": "Bi-directional CRM sync determines whether outreach activity automatically shows up in a team's system of record without manual export/import.",
      "benefitsWho": "Salesforce or Copper users running structured sales pipelines benefit most from PersistIQ's native sync."
    },
    {
      "title": "AI Features",
      "toolA": "ContactOut includes an AI Personalizer that generates personalized outreach emails, which the company says can increase response rates, plus multi-stage email campaigns built on found contact data.",
      "toolB": "PersistIQ includes a Sales Email AI tool for generating sales email content as part of its campaign automation.",
      "whyItMatters": "Both tools apply AI to email personalization, but at different stages: ContactOut ties it to the contact record, PersistIQ ties it to the campaign sequence.",
      "benefitsWho": "Reps who want AI drafting help at both the data-lookup and the sequencing stage benefit from using the two tools' AI features together."
    },
    {
      "title": "API and Programmatic Access",
      "toolA": "ContactOut provides API access for programmatic retrieval of email, phone, and company records.",
      "toolB": "PersistIQ's documented facts do not mention a public API for programmatic access.",
      "whyItMatters": "API access determines whether a team can build custom data pipelines or integrate contact lookups into internal tools rather than relying on the UI or Chrome extension alone.",
      "benefitsWho": "Engineering-supported RevOps or data teams building custom enrichment pipelines benefit from ContactOut's API."
    }
  ],
  "featureMatrix": [
    {
      "group": "Contact Discovery",
      "rows": [
        {
          "feature": "Professional contact database search",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ContactOut: 350M professionals, 40M companies"
        },
        {
          "feature": "Chrome extension for LinkedIn lookups",
          "toolA": "available",
          "toolB": "available",
          "note": "Both pull data while browsing LinkedIn"
        },
        {
          "feature": "LinkedIn Sales Navigator list building",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Data enrichment (20+ data points)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Job titles, revenue, skills, company size, tech used"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Outreach & Automation",
      "rows": [
        {
          "feature": "Multi-step email campaigns",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated call and task sequencing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "A/B testing of messages",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Cloud phone dialer",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "AI-generated email content",
          "toolA": "available",
          "toolB": "available",
          "note": "ContactOut: AI Personalizer; PersistIQ: Sales Email AI"
        }
      ]
    },
    {
      "group": "CRM & Reporting",
      "rows": [
        {
          "feature": "Native CRM sync",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PersistIQ: Salesforce and Copper"
        },
        {
          "feature": "Performance reporting (replies, meetings booked)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Free ongoing tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ContactOut: 5 free credits/day; PersistIQ: 14-day trial only"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is ContactOut or PersistIQ better for finding contact data?",
      "answer": "ContactOut is purpose-built for contact discovery, searching a database of 350 million professionals across 40 million companies via a Chrome extension, web portal, and API. PersistIQ's Chrome extension pulls prospects from LinkedIn and Sales Navigator but is positioned around outreach automation rather than a standalone contact database."
    },
    {
      "question": "Does either tool offer a free plan?",
      "answer": "ContactOut offers 5 free credits daily with no credit card required. PersistIQ offers a 14-day free trial rather than a recurring free tier."
    },
    {
      "question": "Which CRMs does PersistIQ sync with?",
      "answer": "PersistIQ offers native bi-directional sync with Salesforce and Copper. ContactOut's documented facts do not list a native CRM sync feature."
    },
    {
      "question": "Can I use ContactOut and PersistIQ together?",
      "answer": "Yes. A common workflow is using ContactOut's Chrome extension or API to find and verify contact data, then loading those contacts into PersistIQ to run automated, A/B-tested outreach sequences with Salesforce or Copper sync."
    },
    {
      "question": "Does ContactOut have an outreach automation feature like PersistIQ's?",
      "answer": "ContactOut offers email campaigns with AI-personalized messaging built on top of found contact data, but PersistIQ's documented feature set goes further with automated calls, tasks, and A/B testing across the full campaign."
    },
    {
      "question": "Is PersistIQ suitable for large sales organizations?",
      "answer": "PersistIQ is explicitly positioned for small teams, per its own documentation, which may limit fit for larger sales organizations with more complex CRM or reporting needs."
    }
  ]
};

export default contactoutVsPersistiqContent;

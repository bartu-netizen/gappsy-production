import type { ToolComparisonContent } from './types';

const cronofyVsHiContent: ToolComparisonContent = {
  "verdict": "Cronofy and hi (Hi.Events) solve different problems: Cronofy is calendar and scheduling infrastructure that developers embed into their own apps via API, while hi is an Eventbrite-style event ticketing platform for selling tickets and running registration. Cronofy's value is in syncing Google, Microsoft, Apple, and Exchange calendars and provisioning meeting/scheduling logic behind the scenes; hi's value is a low-fee, self-hostable checkout flow for event organizers. They're rarely evaluated as substitutes, but an events business could plausibly need both.",
  "bestForToolA": "Cronofy fits engineering teams building scheduling, booking, or calendar-sync features into their own product, especially ones that also want an MCP server to expose calendar data to AI agents.",
  "bestForToolB": "hi fits event organizers who want to sell tickets without paying a percentage of ticket revenue, since the service fee is charged to the buyer and the organizer keeps 100% of face value, with an optional self-hosted deployment.",
  "whoNeedsBoth": "A ticketing or events company could use hi to run ticket sales and payouts while embedding Cronofy's Scheduling API to let attendees book 1:1 sessions or speaker meetings inside the same event app.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Cronofy is calendar-sync and scheduling infrastructure (Calendar sync API, Scheduling API, Meeting transcription) meant to be embedded in someone else's software.",
      "toolB": "hi is a standalone event ticketing platform (\"the Eventbrite alternative\") with instant payouts, a badge designer, and its own checkout flow.",
      "whyItMatters": "Buyers evaluating these as a straight swap will be disappointed since Cronofy has no ticketing features and hi has no calendar-sync API.",
      "benefitsWho": "Developers researching category fit before committing engineering time."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Cronofy's self-serve pricing is not published; the site instead uses a usage-based seat calculator, though a free sandbox with up to 20 connected accounts and 24 hours of recording is available with no credit card.",
      "toolB": "hi lists a $0 \"For Organizers\" plan directly, with no monthly fees or setup costs since a small service fee is instead paid by the ticket buyer.",
      "whyItMatters": "Teams that need a fixed budget number up front can plan around hi's published $0 tier more easily than Cronofy's opaque usage pricing.",
      "benefitsWho": "Budget-constrained event organizers and finance teams that need cost certainty before signing up."
    },
    {
      "title": "Self-Hosted Deployment",
      "toolA": "Cronofy is not documented as self-hostable; it is delivered as a hosted API/infrastructure service with data centers across the US, UK, Canada, Germany, Australia, and Singapore.",
      "toolB": "hi explicitly supports self-hosting via a documented quick-start guide and Docker-based local development, in addition to its hosted cloud option.",
      "whyItMatters": "Organizations with strict data-residency or full-data-ownership requirements can only self-host with hi.",
      "benefitsWho": "Event organizers who need full control of attendee data or want to avoid a third-party cloud dependency."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Cronofy includes meeting transcription with AI-generated summaries and offers an MCP server specifically for connecting calendar data to agentic AI workflows.",
      "toolB": "hi does not document any AI features in its feature list, pros, or FAQs.",
      "whyItMatters": "Teams building AI-agent-driven scheduling tools have a documented integration path with Cronofy that hi doesn't offer.",
      "benefitsWho": "Product teams building AI agents that need to read, summarize, or act on calendar and meeting data."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Cronofy states ISO 27001/27701/27018 certification and SOC 2 Type 2 attestation, plus GDPR, CCPA, and HIPAA compliance.",
      "toolB": "hi does not list any formal security certifications or compliance attestations in its documented facts.",
      "whyItMatters": "Enterprise buyers with vendor security review processes will find Cronofy easier to pass through procurement.",
      "benefitsWho": "Regulated enterprises and healthcare or finance-adjacent companies embedding scheduling into their own product."
    }
  ],
  "featureMatrix": [
    {
      "group": "Access & Deployment",
      "rows": [
        {
          "feature": "Free tier / sandbox",
          "toolA": "available",
          "toolB": "available",
          "note": "Cronofy: free sandbox, 20 accounts, 24hrs recording, no card. hi: $0 For Organizers plan."
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "hi has a documented self-host quick-start guide and Docker setup."
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Cronofy requires visiting a usage-based pricing calculator."
        },
        {
          "feature": "Mobile app / consumer app",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Cronofy: no mobile app or consumer-facing product described."
        }
      ]
    },
    {
      "group": "Core Functionality",
      "rows": [
        {
          "feature": "Calendar sync (Google/Microsoft/Apple/Exchange)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Event ticket sales & payouts",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "hi offers instant payouts to organizers."
        },
        {
          "feature": "AI meeting transcription/summaries",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Event badge designer",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Developer & Trust",
      "rows": [
        {
          "feature": "Scheduling/booking API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "MCP server for AI agents",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published compliance certifications",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cronofy: ISO 27001/27701/27018, SOC 2 Type 2."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Cronofy and hi (Hi.Events) direct competitors?",
      "answer": "No. Cronofy is calendar-sync and scheduling infrastructure that developers embed into their own software, while hi is a standalone event ticketing platform. They serve different buyers and are not typically evaluated as substitutes for each other."
    },
    {
      "question": "Does Cronofy have a free plan?",
      "answer": "Cronofy offers a free sandbox that connects up to 20 accounts with 24 hours of meeting recording included, and no credit card is required. Beyond that, self-serve pricing is not publicly published."
    },
    {
      "question": "Does hi (Hi.Events) charge organizers a fee?",
      "answer": "No. There are no monthly fees or setup costs for organizers on hi; a small service fee is instead paid by the ticket buyer, so organizers keep 100% of ticket face value."
    },
    {
      "question": "Can hi (Hi.Events) be self-hosted?",
      "answer": "Yes. hi provides a documented self-hosted deployment quick-start guide plus local development with Docker, in addition to using its hosted cloud version."
    },
    {
      "question": "Does Cronofy offer AI meeting summaries?",
      "answer": "Yes. Cronofy can capture recordings and transcripts with AI-generated summaries as part of its meeting transcription feature."
    },
    {
      "question": "Which tool is better for an events business that also needs scheduling infrastructure?",
      "answer": "Neither replaces the other. An events company would use hi to sell tickets and handle payouts, and could separately integrate Cronofy's Scheduling API if it wants to embed calendar sync or 1:1 booking into its own event app."
    }
  ]
};

export default cronofyVsHiContent;

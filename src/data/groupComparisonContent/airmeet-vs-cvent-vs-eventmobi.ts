import type { GroupComparisonContent } from './types';

const airmeetVsCventVsEventmobiContent: GroupComparisonContent = {
  "verdict": "Cvent is the clear choice when an organization needs venue and hotel sourcing alongside event management, but that breadth comes with quote-only enterprise pricing and a steeper implementation curve. Airmeet suits webinar-heavy teams that want affordable, self-serve monthly pricing plus AI-generated content. EventMobi lands in the middle, offering transparent modular pricing per event or per year for organizations that want strong onsite tooling without Cvent's enterprise complexity or procurement timeline.",
  "bestFor": {
    "airmeet": "Marketing and webinar teams that want self-serve monthly pricing and AI-generated content via AirGenie for frequent virtual and hybrid events, without an enterprise procurement process.",
    "cvent": "Enterprise event and meeting-planning teams that need venue and hotel sourcing through RFPs, deep CRM integrations, and one connected ecosystem spanning registration, onsite, webinar, and sourcing, and who have the budget and timeline for custom enterprise sales.",
    "eventmobi": "Associations, nonprofits, and corporate planners who want transparent modular pricing, either per event or per year, with onsite badge printing and hybrid streaming, without Cvent's enterprise scale or Airmeet's webinar-first focus."
  },
  "highlights": [
    {
      "title": "Cvent's venue sourcing marketplace has no equivalent here",
      "description": "Cvent's Supplier Network is a large online marketplace for sourcing event venues and hotel room blocks, letting planners submit RFPs and compare bids, a capability neither Airmeet nor EventMobi offers.",
      "toolSlugs": [
        "cvent"
      ]
    },
    {
      "title": "Transparent pricing versus quote-only enterprise sales",
      "description": "Airmeet and EventMobi both publish starting prices and offer self-serve signup paths, while Cvent does not publish pricing and requires a sales engagement to get a quote for any deployment.",
      "toolSlugs": [
        "airmeet",
        "cvent",
        "eventmobi"
      ]
    },
    {
      "title": "AI content generation is an Airmeet-specific strength",
      "description": "AirGenie automatically produces event summaries, blog posts, social content, and performance analytics; Cvent is expanding AI-assisted website and content creation, but this is not detailed as a packaged feature the way AirGenie is for Airmeet.",
      "toolSlugs": [
        "airmeet"
      ]
    },
    {
      "title": "EventMobi keeps modular, pay-per-event pricing",
      "description": "EventMobi lets organizations choose and pay only for the modules they need per event, from $3,000, an option neither the subscription-based Airmeet nor the quote-based Cvent replicates as directly.",
      "toolSlugs": [
        "eventmobi"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Event Management",
      "rows": [
        {
          "feature": "Webinar hosting",
          "statuses": {
            "airmeet": "available",
            "cvent": "available",
            "eventmobi": "available"
          },
          "note": "Cvent Webinar was significantly expanded through the ON24 acquisition."
        },
        {
          "feature": "Venue and hotel sourcing marketplace",
          "statuses": {
            "airmeet": "unavailable",
            "cvent": "available",
            "eventmobi": "unavailable"
          }
        },
        {
          "feature": "Onsite check-in and badging",
          "statuses": {
            "airmeet": "available",
            "cvent": "available",
            "eventmobi": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "statuses": {
            "airmeet": "available",
            "cvent": "unavailable",
            "eventmobi": "available"
          }
        },
        {
          "feature": "Free trial",
          "statuses": {
            "airmeet": "available",
            "cvent": "not-documented",
            "eventmobi": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Integrations",
      "rows": [
        {
          "feature": "AI-generated event content",
          "statuses": {
            "airmeet": "available",
            "cvent": "available",
            "eventmobi": "not-documented"
          },
          "note": "Cvent's AI features focus on event website and content creation plus attendee-matching recommendations rather than a single named tool like AirGenie."
        },
        {
          "feature": "CRM integrations (Salesforce, HubSpot, Marketo)",
          "statuses": {
            "airmeet": "available",
            "cvent": "available",
            "eventmobi": "available"
          },
          "note": "Airmeet names HubSpot specifically; EventMobi connects to CRMs via its free API and Zapier integration."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which platform is best for sourcing venues and hotels for a conference?",
      "answer": "Cvent, through its Supplier Network marketplace, which connects planners with tens of thousands of hotels and venues for RFP-based sourcing. Neither Airmeet nor EventMobi offers this capability."
    },
    {
      "question": "Which of these three is the most affordable to start with?",
      "answer": "Airmeet publishes a starting price of $167/month and EventMobi starts at $3,000 per event. Cvent does not publish pricing and requires a sales quote, which is typically aimed at larger budgets."
    },
    {
      "question": "Does any of these platforms include AI-generated event content?",
      "answer": "Airmeet's AirGenie automatically generates summaries, blog posts, and social content. Cvent is also expanding AI-assisted website and content creation across its platform, though it is not packaged as a single named tool in the available data."
    },
    {
      "question": "Can I try any of these before committing to a contract?",
      "answer": "Airmeet and EventMobi both offer accessible entry points, including free trials and self-serve signup. Cvent generally requires a demo and sales engagement before a trial or purchase."
    },
    {
      "question": "Which is designed for the largest, most complex conference programs?",
      "answer": "Cvent, given its enterprise scale, combined venue-sourcing and event-management breadth, and deep CRM integrations built for large corporate and association event teams."
    },
    {
      "question": "Do all three support hybrid events?",
      "answer": "Yes, all three platforms support virtual, hybrid, and in-person event formats."
    }
  ]
};

export default airmeetVsCventVsEventmobiContent;

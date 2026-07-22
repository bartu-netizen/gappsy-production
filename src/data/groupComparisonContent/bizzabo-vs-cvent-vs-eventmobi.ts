import type { GroupComparisonContent } from './types';

const bizzaboVsCventVsEventmobiContent: GroupComparisonContent = {
  "verdict": "Bizzabo, Cvent, and EventMobi all cover the same core event lifecycle of registration, mobile apps, onsite check-in, and virtual or hybrid delivery, but they target buyers differently on scale and pricing transparency. Cvent is the broadest suite, set apart by its venue and hotel sourcing marketplace and named CRM integrations, but it publishes no pricing and is built for large enterprise procurement. Bizzabo pairs its Event Experience OS with proprietary Klik SmartBadge wearable hardware for large in-person conferences, at a published $17,999 per year floor with a three-user minimum. EventMobi is the more accessible option of the three, with published per-event and per-year starting prices, a free API plus native Zapier integration, and a dedicated Event Success Manager on annual plans, making it a common pick for mid-market teams that want less sales friction.",
  "bestFor": {
    "bizzabo": "Mid-market to enterprise B2B conference organizers who want an end-to-end Event Experience OS plus proprietary Klik SmartBadge hardware for large in-person events.",
    "cvent": "Large enterprises and associations that need the broadest event lifecycle suite, including a dedicated hotel and venue sourcing marketplace alongside registration, onsite, and webinar tools.",
    "eventmobi": "Mid-market corporate event teams and associations that want modular, published per-event or per-year pricing with a dedicated Event Success Manager instead of a pure enterprise sales process."
  },
  "highlights": [
    {
      "title": "Cvent's venue sourcing marketplace has no equivalent here",
      "description": "The Cvent Supplier Network connects planners with tens of thousands of hotels and venues for RFP-based sourcing, a business line neither Bizzabo nor EventMobi offers.",
      "toolSlugs": [
        "cvent"
      ]
    },
    {
      "title": "Bizzabo is the only one with wearable onsite hardware",
      "description": "Klik SmartBadge combines a wearable event badge with click-to-connect networking, automated lead capture, and live engagement heatmaps, positioned for conferences with 500-plus attendees.",
      "toolSlugs": [
        "bizzabo"
      ]
    },
    {
      "title": "EventMobi is the only one with published self-serve pricing",
      "description": "EventMobi lists starting prices of $3,000 per event or $8,900 per year for unlimited events, while Bizzabo starts at $17,999 per year and Cvent requires a custom sales quote with no published price.",
      "toolSlugs": [
        "eventmobi"
      ]
    },
    {
      "title": "All three ship native iOS and Android event apps",
      "description": "Attendees can browse agendas, check in to sessions, and network with other attendees through dedicated mobile apps across Bizzabo, Cvent, and EventMobi.",
      "toolSlugs": [
        "bizzabo",
        "cvent",
        "eventmobi"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Registration and Attendee Apps",
      "rows": [
        {
          "feature": "Event website and registration builder",
          "statuses": {
            "bizzabo": "available",
            "cvent": "available",
            "eventmobi": "available"
          }
        },
        {
          "feature": "Native iOS and Android event app",
          "statuses": {
            "bizzabo": "available",
            "cvent": "available",
            "eventmobi": "available"
          }
        }
      ]
    },
    {
      "group": "Onsite Experience",
      "rows": [
        {
          "feature": "Badge printing and check-in",
          "statuses": {
            "bizzabo": "available",
            "cvent": "available",
            "eventmobi": "available"
          },
          "note": "Cvent's is called OnArrival; EventMobi offers pre-printed badges and hardware rental packages."
        },
        {
          "feature": "Wearable smart-badge networking hardware",
          "statuses": {
            "bizzabo": "available",
            "cvent": "unavailable",
            "eventmobi": "unavailable"
          },
          "note": "Unique to Bizzabo's Klik SmartBadge line."
        }
      ]
    },
    {
      "group": "Virtual and Hybrid Delivery",
      "rows": [
        {
          "feature": "Live streaming for virtual or hybrid sessions",
          "statuses": {
            "bizzabo": "available",
            "cvent": "available",
            "eventmobi": "available"
          },
          "note": "Cvent's is built on its ON24 acquisition; EventMobi's expanded via its 2023 Run The World acquisition."
        }
      ]
    },
    {
      "group": "Sourcing, Integrations and Pricing",
      "rows": [
        {
          "feature": "Venue and hotel sourcing marketplace",
          "statuses": {
            "bizzabo": "unavailable",
            "cvent": "available",
            "eventmobi": "unavailable"
          },
          "note": "Cvent Supplier Network is a dedicated RFP and sourcing marketplace for planners."
        },
        {
          "feature": "Named CRM/marketing-automation integrations",
          "statuses": {
            "bizzabo": "limited",
            "cvent": "available",
            "eventmobi": "limited"
          },
          "note": "Cvent names Salesforce, Marketo, and HubSpot; Bizzabo cites general martech/CRM integrations; EventMobi relies on a free API plus native Zapier."
        },
        {
          "feature": "Published self-serve starting price",
          "statuses": {
            "bizzabo": "available",
            "cvent": "unavailable",
            "eventmobi": "available"
          },
          "note": "Cvent pricing is quote-only through direct sales."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the lowest published starting price?",
      "answer": "EventMobi, with per-event pricing from $3,000 or a $8,900 per year unlimited-events plan. Bizzabo starts at $17,999 per year with a three-user minimum, and Cvent publishes no pricing at all, requiring a custom sales quote."
    },
    {
      "question": "Which platform includes a venue and hotel sourcing tool?",
      "answer": "Only Cvent, through the Cvent Supplier Network, which connects meeting planners with tens of thousands of hotels and venues for RFP-based sourcing. Bizzabo and EventMobi do not offer an equivalent sourcing marketplace."
    },
    {
      "question": "Do all three support hybrid and virtual events?",
      "answer": "Yes. Bizzabo includes live streaming and virtual session hosting, Cvent offers studio-style production through Cvent Webinar built on its ON24 acquisition, and EventMobi expanded its virtual and hybrid capabilities through its 2023 acquisition of Run The World."
    },
    {
      "question": "What is Bizzabo's Klik SmartBadge, and do Cvent or EventMobi have something similar?",
      "answer": "Klik SmartBadge is a wearable event badge with click-to-connect networking, automated lead capture, and live attendee analytics, aimed at conferences with 500 or more attendees. Neither Cvent's OnArrival nor EventMobi's badge printing and check-in tools include this wearable networking layer."
    },
    {
      "question": "Which is the most accessible option for a smaller or first-time event organizer?",
      "answer": "None of the three are built for very small or one-off events, but EventMobi's modular per-event pricing from $3,000 is the most accessible entry point of the group, since Bizzabo's floor is $17,999 per year and Cvent requires engaging enterprise sales for any quote."
    },
    {
      "question": "Which one integrates natively with tools like Salesforce, Marketo, or HubSpot?",
      "answer": "Cvent lists native integrations with Salesforce, Marketo, and HubSpot specifically. Bizzabo describes general integrations with common martech and CRM tools, and EventMobi connects to external systems through a free API and native Zapier integration rather than naming specific CRM integrations."
    }
  ]
};

export default bizzaboVsCventVsEventmobiContent;

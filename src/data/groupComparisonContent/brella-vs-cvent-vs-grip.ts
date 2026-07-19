import type { GroupComparisonContent } from './types';

const brellaVsCventVsGripContent: GroupComparisonContent = {
  "verdict": "All three sell into B2B conference and trade show organizers, but they sit at different points of the depth-vs-breadth spectrum. Cvent is the broadest end-to-end suite, spanning registration, onsite badging, webinar production, and a unique hotel and venue sourcing marketplace, which suits large enterprise and association event teams. Brella and Grip are both matchmaking specialists that explicitly compete with each other, but Grip has grown into a fuller modular platform with onsite hardware and full event management through the Connectiv EMS acquisition, while Brella stays more tightly focused on the matchmaking and 1:1 meeting experience itself. The right pick depends on whether you need one system to run the entire event (Cvent) or a specialist, matchmaking-first layer (Brella or Grip).",
  "bestFor": {
    "brella": "Conference and association organizers who want a dedicated AI matchmaking and 1:1 meeting-booking layer without adopting a full end-to-end registration and onsite suite.",
    "cvent": "Enterprise event marketing teams, associations, and venues that need one connected platform spanning registration, onsite badging, webinar production, and hotel or venue sourcing.",
    "grip": "Large trade show and conference producers that want AI matchmaking plus modular event management and onsite hardware, such as badge printing and lead scanning, bundled from one vendor with a decade-long track record at major B2B shows."
  },
  "highlights": [
    {
      "title": "Cvent's venue and hotel sourcing marketplace is a unique differentiator",
      "description": "Cvent's Supplier Network connects planners with tens of thousands of hotels and venues for RFP-based sourcing, a business line the company says differentiates it from most pure event-registration competitors; this capability is not documented for Brella or Grip.",
      "toolSlugs": [
        "cvent"
      ]
    },
    {
      "title": "Grip and Brella are direct matchmaking rivals, but Grip has grown into a broader suite",
      "description": "Brella's own competitor list names Grip directly, and Grip's competitor list names both Brella and Cvent. Grip has since expanded past matchmaking into full event management (via its Connectiv EMS acquisition) and onsite hardware, while Brella remains focused specifically on the AI matchmaking and meeting-booking experience.",
      "toolSlugs": [
        "grip",
        "brella"
      ]
    },
    {
      "title": "None of the three publish self-serve pricing",
      "description": "Brella, Cvent, and Grip all require a sales conversation and custom quote rather than offering transparent, published pricing tiers or a free plan.",
      "toolSlugs": [
        "brella",
        "cvent",
        "grip"
      ]
    },
    {
      "title": "Grip's matchmaking engine has a decade of maturity behind marquee enterprise customers",
      "description": "Grip cites customers including Money 20/20, Clarion Events, Messe Frankfurt, and Reed Exhibitions, and states its AI matchmaking engine has been refined since the company's 2014 founding.",
      "toolSlugs": [
        "grip"
      ]
    },
    {
      "title": "Cvent is built for far larger scale and deeper CRM integration than the other two",
      "description": "Cvent reports more than 5,000 employees and native integrations with Salesforce, Marketo, and HubSpot for lead flow, a level of enterprise integration depth not documented for Brella or Grip.",
      "toolSlugs": [
        "cvent"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Matchmaking and Networking",
      "rows": [
        {
          "feature": "AI-powered attendee matchmaking",
          "statuses": {
            "brella": "available",
            "cvent": "limited",
            "grip": "available"
          },
          "note": "Cvent documents networking and appointment-matching within its attendee engagement tools but does not detail an AI-driven matchmaking algorithm the way Brella and Grip do."
        },
        {
          "feature": "1:1 meeting booking inside the app",
          "statuses": {
            "brella": "available",
            "cvent": "limited",
            "grip": "available"
          },
          "note": "Cvent's appointment-matching feature implies some meeting-booking capability but is not described in the same depth as Brella's or Grip's dedicated meeting-booking tools."
        },
        {
          "feature": "Meeting formats beyond 1:1 (speed networking, roundtables, hosted buyer programs)",
          "statuses": {
            "brella": "not-documented",
            "cvent": "not-documented",
            "grip": "available"
          },
          "note": "Grip documents more than a dozen distinct meeting formats; this level of format variety is not documented for Brella or Cvent."
        }
      ]
    },
    {
      "group": "Event Management and Onsite",
      "rows": [
        {
          "feature": "Full registration, ticketing, and event website builder",
          "statuses": {
            "brella": "not-documented",
            "cvent": "available",
            "grip": "available"
          },
          "note": "Grip's Management module (from its Connectiv EMS acquisition) adds full event management alongside its original matchmaking product."
        },
        {
          "feature": "Onsite check-in and badge printing",
          "statuses": {
            "brella": "not-documented",
            "cvent": "available",
            "grip": "available"
          },
          "note": "Cvent's OnArrival and Grip's onsite tools both document badge printing and entrance scanning."
        },
        {
          "feature": "Venue and hotel sourcing marketplace",
          "statuses": {
            "brella": "not-documented",
            "cvent": "available",
            "grip": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Platform and Commercials",
      "rows": [
        {
          "feature": "Native iOS and Android mobile app",
          "statuses": {
            "brella": "available",
            "cvent": "available",
            "grip": "available"
          }
        },
        {
          "feature": "Published self-serve pricing",
          "statuses": {
            "brella": "unavailable",
            "cvent": "unavailable",
            "grip": "unavailable"
          },
          "note": "All three require contacting sales for a custom quote; none publish self-serve pricing or a free plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do any of Brella, Cvent, or Grip publish pricing online?",
      "answer": "No. All three require a sales conversation and provide only custom quotes; none has a published pricing page or a free plan."
    },
    {
      "question": "What makes Cvent different from Brella and Grip?",
      "answer": "Cvent is a full event lifecycle suite covering registration, onsite badging, webinar production, and a hotel and venue sourcing marketplace, rather than a matchmaking specialist like Brella or Grip."
    },
    {
      "question": "Which is best for pure attendee networking and matchmaking?",
      "answer": "Brella and Grip are both built specifically around AI-driven 1:1 meeting matchmaking. Grip additionally offers more meeting formats and has grown into a modular full event-management platform through its Connectiv EMS acquisition, while Brella stays focused on the matchmaking and meeting-booking experience itself."
    },
    {
      "question": "Can I use one of these just for onsite badge printing and check-in?",
      "answer": "Cvent (via its OnArrival product) and Grip both document onsite badge printing, entrance scanning, and lead retrieval tools. Brella's documented feature set does not include onsite badging tools."
    },
    {
      "question": "Do all three have mobile apps?",
      "answer": "Yes. Brella, Cvent, and Grip each offer native iOS and Android apps for attendees."
    },
    {
      "question": "Which of the three has been around the longest?",
      "answer": "Cvent, founded in 1999, has more than two decades of history and over 5,000 employees, compared with Grip (founded 2014) and Brella (founded 2016)."
    }
  ]
};

export default brellaVsCventVsGripContent;

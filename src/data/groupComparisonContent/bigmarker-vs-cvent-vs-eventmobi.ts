import type { GroupComparisonContent } from './types';

const bigmarkerVsCventVsEventmobiContent: GroupComparisonContent = {
  "verdict": "BigMarker, Cvent, and EventMobi all run webinars and virtual/hybrid events, but they sit at different points on the platform spectrum. BigMarker is the deepest on webinar formats (live, evergreen, simulive, 24/7 channels) at very large audience scale, Cvent is the broadest enterprise suite with a venue and hotel sourcing marketplace no rival here matches, and EventMobi is the most transparent on pricing while still covering onsite badges, apps, and virtual streaming. None of the three is a universal best pick; the right choice depends on whether the buyer needs pure webinar scale, full enterprise event operations, or modular, published pricing.",
  "bestFor": {
    "bigmarker": "Marketing and demand-generation teams running large-scale, no-download webinars, evergreen content series, or simulive broadcasts",
    "cvent": "Enterprise event, association, and hospitality teams that need one connected platform spanning registration, onsite badging, and hotel or venue sourcing",
    "eventmobi": "Mid-market corporate and association planners who want modular event apps, onsite check-in, and virtual streaming with published starting prices"
  },
  "highlights": [
    {
      "title": "Cvent's venue sourcing marketplace has no equivalent here",
      "description": "The Cvent Supplier Network connects planners to tens of thousands of hotels and venues for RFP-based sourcing, a business line neither BigMarker nor EventMobi offers.",
      "toolSlugs": [
        "cvent"
      ]
    },
    {
      "title": "BigMarker goes deepest on webinar formats and scale",
      "description": "Live, on-demand/evergreen, simulive, and automated 24/7 webinar channels are all native, and the top tier supports up to 500,000 live attendees.",
      "toolSlugs": [
        "bigmarker"
      ]
    },
    {
      "title": "EventMobi is the only one with published starting prices",
      "description": "EventMobi lists per-event pricing from $3,000 and unlimited annual plans from $8,900, while BigMarker and Cvent require a sales conversation for any quote.",
      "toolSlugs": [
        "eventmobi"
      ]
    },
    {
      "title": "Onsite check-in and badge printing favor Cvent and EventMobi",
      "description": "Cvent OnArrival and EventMobi's badge printing and check-in hardware both support in-person event logistics; BigMarker's feature set is centered on browser-based webinars rather than onsite operations.",
      "toolSlugs": [
        "cvent",
        "eventmobi"
      ]
    },
    {
      "title": "All three connect to CRM and marketing automation stacks",
      "description": "BigMarker, Cvent, and EventMobi each integrate with CRM and marketing automation platforms plus API access, so event and lead data can flow into an existing sales pipeline.",
      "toolSlugs": [
        "bigmarker",
        "cvent",
        "eventmobi"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Webinar and Virtual Delivery",
      "rows": [
        {
          "feature": "Live webinar hosting",
          "statuses": {
            "bigmarker": "available",
            "cvent": "available",
            "eventmobi": "available"
          }
        },
        {
          "feature": "Evergreen or on-demand webinars",
          "statuses": {
            "bigmarker": "available",
            "cvent": "available",
            "eventmobi": "available"
          },
          "note": "Cvent's on-demand webinar depth comes from its ON24 acquisition; EventMobi's on-demand video is part of its virtual event streaming module."
        },
        {
          "feature": "Simulive or automated 24/7 channels",
          "statuses": {
            "bigmarker": "available",
            "cvent": "not-documented",
            "eventmobi": "not-documented"
          }
        }
      ]
    },
    {
      "group": "In-Person and Hybrid Event Operations",
      "rows": [
        {
          "feature": "Onsite check-in and badge printing",
          "statuses": {
            "bigmarker": "unavailable",
            "cvent": "available",
            "eventmobi": "available"
          }
        },
        {
          "feature": "Venue or hotel sourcing marketplace",
          "statuses": {
            "bigmarker": "unavailable",
            "cvent": "available",
            "eventmobi": "unavailable"
          }
        },
        {
          "feature": "Ticketing and payment collection",
          "statuses": {
            "bigmarker": "available",
            "cvent": "available",
            "eventmobi": "available"
          },
          "note": "BigMarker charges a 5 percent transaction fee on paid tickets; EventMobi states no added registration or ticketing fees beyond standard payment processing."
        }
      ]
    },
    {
      "group": "Integrations and Pricing Transparency",
      "rows": [
        {
          "feature": "CRM and marketing automation integrations",
          "statuses": {
            "bigmarker": "available",
            "cvent": "available",
            "eventmobi": "available"
          }
        },
        {
          "feature": "Published self-serve starting price",
          "statuses": {
            "bigmarker": "unavailable",
            "cvent": "unavailable",
            "eventmobi": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three publishes real starting prices?",
      "answer": "Only EventMobi does, with per-event pricing from $3,000 and an unlimited annual plan from $8,900. BigMarker and Cvent both require contacting sales for a custom quote on every tier."
    },
    {
      "question": "Which tool is best if I only need webinars, not a full event platform?",
      "answer": "BigMarker is the most webinar-specialized of the three, with live, evergreen, simulive, and automated 24/7 channel formats built in, plus support for very large audiences on its top tier."
    },
    {
      "question": "Does any of these platforms help with sourcing a physical venue or hotel block?",
      "answer": "Only Cvent does, through its Cvent Supplier Network marketplace, which connects planners with hotels and venues for RFP-based sourcing. Neither BigMarker nor EventMobi offers this."
    },
    {
      "question": "Do these tools handle onsite check-in and badge printing for in-person events?",
      "answer": "Cvent and EventMobi both offer onsite check-in and badge printing tools. BigMarker's documented feature set is focused on browser-based webinars and virtual/hybrid streaming rather than in-person badge hardware."
    },
    {
      "question": "Which is best for very large virtual audiences?",
      "answer": "BigMarker's top Enterprise+ tier is built for scale, supporting up to 500,000 live attendees, alongside social simulcasting to Facebook Live and YouTube Live."
    },
    {
      "question": "Do all three connect to a CRM like Salesforce or HubSpot?",
      "answer": "Yes, BigMarker, Cvent, and EventMobi each support CRM and marketing automation integrations, along with API access, so event registration and engagement data can flow into existing sales and marketing systems."
    }
  ]
};

export default bigmarkerVsCventVsEventmobiContent;

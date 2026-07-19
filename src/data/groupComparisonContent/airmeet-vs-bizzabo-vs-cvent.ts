import type { GroupComparisonContent } from './types';

const airmeetVsBizzaboVsCventContent: GroupComparisonContent = {
  "verdict": "Airmeet, Bizzabo and Cvent are all genuine event management platforms used to plan and run webinars, conferences and hybrid or in-person events, and Bizzabo explicitly names Cvent as a direct competitor. They differ most in scale and pricing transparency: Airmeet publishes mid-market pricing starting at $167 per month and leans on AI content tools, Bizzabo starts at a published $17,999 per year with a three-user minimum and its own Klik SmartBadge hardware, and Cvent publishes no pricing at all but adds a venue and hotel sourcing marketplace no rival here matches. There is no universal winner; the right pick depends on event volume, onsite hardware needs and how much budget certainty you need before talking to sales.",
  "bestFor": {
    "airmeet": "Mid-market teams running frequent webinars and virtual or hybrid events who want transparent published pricing and AI-generated event content via AirGenie",
    "bizzabo": "B2B conference organizers who need a unified Event Experience OS spanning event website, registration, agenda and mobile app, optionally paired with Klik SmartBadge hardware for large in-person events",
    "cvent": "Large enterprises and associations that need onsite badging and check-in hardware plus a hotel and venue sourcing marketplace alongside registration, and can commit to an enterprise sales process"
  },
  "highlights": [
    {
      "title": "Only Cvent sources venues and hotels",
      "description": "The Cvent Supplier Network is a large marketplace connecting planners with venues and hotels for RFP-based sourcing, a capability neither Airmeet nor Bizzabo offers.",
      "toolSlugs": [
        "cvent"
      ]
    },
    {
      "title": "Pricing transparency varies sharply",
      "description": "Airmeet publishes tiered pricing starting at $167/month, Bizzabo publishes a starting annual price of $17,999, and Cvent publishes no pricing at all, requiring a sales quote for every deployment.",
      "toolSlugs": [
        "airmeet",
        "bizzabo",
        "cvent"
      ]
    },
    {
      "title": "Onsite hardware is a Bizzabo and Cvent specialty",
      "description": "Bizzabo's Klik SmartBadge and Cvent's OnArrival both provide dedicated wearable badges, check-in kiosks and lead retrieval hardware for large in-person events; Airmeet's onsite tools are lighter, centered on mobile check-in.",
      "toolSlugs": [
        "bizzabo",
        "cvent"
      ]
    },
    {
      "title": "AirGenie sets Airmeet apart on AI content",
      "description": "Airmeet's AirGenie automatically generates event summaries, blog posts, social content and analytics from event data, a capability that is not documented for Bizzabo and only an emerging add-on for Cvent.",
      "toolSlugs": [
        "airmeet"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Site Building and AI",
      "rows": [
        {
          "feature": "No-code drag-and-drop editor",
          "statuses": {
            "airmeet": "available",
            "bizzabo": "available",
            "cvent": "available"
          }
        },
        {
          "feature": "AI-assisted content generation",
          "statuses": {
            "airmeet": "available",
            "bizzabo": "not-documented",
            "cvent": "limited"
          },
          "note": "Airmeet's AirGenie is a dedicated AI content engine; Cvent has begun adding AI-assisted website and content creation as an expanding capability."
        },
        {
          "feature": "Onsite badging and check-in hardware",
          "statuses": {
            "airmeet": "limited",
            "bizzabo": "available",
            "cvent": "available"
          },
          "note": "Airmeet supports mobile-app check-in on higher tiers but lacks a dedicated hardware line like Klik SmartBadge or OnArrival."
        }
      ]
    },
    {
      "group": "Scale and Sourcing",
      "rows": [
        {
          "feature": "Venue and hotel sourcing marketplace",
          "statuses": {
            "airmeet": "unavailable",
            "bizzabo": "unavailable",
            "cvent": "available"
          }
        },
        {
          "feature": "Native iOS and Android event apps",
          "statuses": {
            "airmeet": "available",
            "bizzabo": "available",
            "cvent": "available"
          }
        },
        {
          "feature": "CRM and marketing automation integrations",
          "statuses": {
            "airmeet": "available",
            "bizzabo": "available",
            "cvent": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Published starting price without a sales call",
          "statuses": {
            "airmeet": "available",
            "bizzabo": "available",
            "cvent": "unavailable"
          }
        },
        {
          "feature": "Free trial",
          "statuses": {
            "airmeet": "available",
            "bizzabo": "not-documented",
            "cvent": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these platforms has the most transparent pricing?",
      "answer": "Airmeet publishes tiered pricing starting at $167/month, Bizzabo publishes a starting annual price of $17,999, and Cvent publishes no pricing at all, requiring a sales quote for every deployment."
    },
    {
      "question": "Which tool is best for large in-person conferences that need badge printing and onsite check-in?",
      "answer": "Bizzabo (Klik SmartBadge) and Cvent (OnArrival) both offer dedicated onsite hardware for badge printing and check-in; Airmeet's onsite tools are lighter, centered on mobile-app check-in rather than dedicated hardware."
    },
    {
      "question": "Does any of these platforms help source event venues and hotels?",
      "answer": "Only Cvent does, through its Supplier Network marketplace, which connects planners with venues and hotels for RFP-based sourcing. Neither Airmeet nor Bizzabo offers a comparable sourcing marketplace."
    },
    {
      "question": "Which platform is best suited to a company running frequent webinars and virtual events?",
      "answer": "Airmeet, whose Premium Webinars plan is built around recurring webinar volume with a published starting price of $167/month and up to 150 events annually."
    },
    {
      "question": "Can small businesses afford Bizzabo or Cvent?",
      "answer": "Bizzabo has a stated $17,999-per-year floor with a three-user minimum, and Cvent's unpublished enterprise pricing generally targets a similar budget range, so both are built for mid-market and enterprise buyers rather than small businesses or occasional organizers."
    },
    {
      "question": "Do any of these tools include AI-generated event content?",
      "answer": "Airmeet's AirGenie generates event summaries, blog posts and social content from event data. Cvent has begun adding AI-assisted website and content creation and attendee-matching recommendations. Bizzabo's AI content capabilities are not documented."
    }
  ]
};

export default airmeetVsBizzaboVsCventContent;

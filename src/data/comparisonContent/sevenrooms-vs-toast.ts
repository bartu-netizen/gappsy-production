import type { ToolComparisonContent } from './types';

const sevenroomsVsToastContent: ToolComparisonContent = {
  "verdict": "SevenRooms is a reservations, guest CRM, and marketing automation platform for hospitality venues, now owned by DoorDash, while Toast is a full restaurant point-of-sale platform covering order-taking, payments, kitchen display, payroll, and inventory on proprietary Android hardware. SevenRooms manages who's coming and keeps them coming back; Toast runs the actual transaction and back-of-house operations once they arrive. They are frequently complementary rather than competing purchases for a full-service restaurant.",
  "bestForToolA": "SevenRooms fits restaurants, hotels, clubs, and wineries that need multi-channel reservation distribution (including through DoorDash and Deliveroo Reservations), AI-powered table management, and guest marketing automation, serving over 15,000 restaurants globally per the company.",
  "bestForToolB": "Toast fits restaurants and food trucks that need an all-in-one POS covering order management, kitchen display, payroll, and online ordering, with a free Starter Kit tier for one or two terminals and paid Point of Sale plans from $69/month.",
  "whoNeedsBoth": "A full-service restaurant could run Toast at the register and kitchen for order-taking, payments, and payroll, while using SevenRooms to manage reservations, waitlists, and guest marketing campaigns — the two cover distinct parts of the guest journey (booking vs. transacting) rather than duplicating each other.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "SevenRooms focuses on reservations, guest data/CRM, and marketing automation — it is not a payments or POS system.",
      "toolB": "Toast is a point-of-sale platform: Android terminals and handhelds for order-taking, payments, kitchen display routing, and payroll.",
      "whyItMatters": "These tools solve different operational problems, so evaluating them head-to-head only makes sense for the specific overlapping function (guest experience vs. transaction processing).",
      "benefitsWho": "Operators need to map each tool to the right problem: booking and guest relationships (SevenRooms) versus running the till and kitchen (Toast)."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "SevenRooms does not publish pricing; it requires booking a demo to get a quote.",
      "toolB": "Toast publishes a free Starter Kit tier and a Point of Sale plan starting at $69/month plus per-transaction processing fees.",
      "whyItMatters": "Published pricing lets small operators budget quickly without a sales call, while custom pricing usually reflects deal-by-deal negotiation.",
      "benefitsWho": "Small independent restaurants wanting fast, self-serve pricing benefit from Toast's published tiers."
    },
    {
      "title": "Hardware Model",
      "toolA": "SevenRooms does not document proprietary hardware requirements — it is a reservations and CRM platform rather than a terminal-based system.",
      "toolB": "Toast's point-of-sale terminals and handhelds are proprietary Android hardware locked to Toast's software, with little resale value if a restaurant switches providers, and hardware bundles commonly carry two-to-three-year commitments.",
      "whyItMatters": "Hardware lock-in and contract length affect long-term switching costs, which matters for restaurants weighing vendor risk.",
      "benefitsWho": "Restaurants wary of hardware lock-in should weigh Toast's proprietary terminal model against SevenRooms' non-hardware-dependent reservations layer."
    },
    {
      "title": "AI Features",
      "toolA": "SevenRooms includes AI-powered table management (smart seating, pacing, cover forecasting) and Voice AI for capturing call-in reservations.",
      "toolB": "Toast's documented feature list does not call out AI-specific capabilities; its offline mode and integrated payroll are the more distinctive operational features.",
      "whyItMatters": "AI-assisted seating and phone-call capture can directly reduce missed reservations for high-demand venues.",
      "benefitsWho": "Reservation-heavy, high-turnover venues benefit from SevenRooms' AI table management and Voice AI."
    },
    {
      "title": "Ownership & Distribution Reach",
      "toolA": "SevenRooms is now part of DoorDash (acquired June 2025), distributing reservations through DoorDash Reservations, Deliveroo Reservations, Google, Instagram, and Yelp.",
      "toolB": "Toast, founded in 2012 and headquartered in Boston, offers commission-free digital ordering integrated with in-house order flow and third-party delivery apps, independent of DoorDash ownership.",
      "whyItMatters": "SevenRooms' DoorDash ownership gives it built-in reservation distribution through DoorDash's platform, which is a distinct channel from Toast's own ordering and delivery integrations.",
      "benefitsWho": "Restaurants wanting reservation visibility on DoorDash specifically benefit from SevenRooms' post-acquisition distribution."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Point-of-sale / payments processing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Reservation and waitlist management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Kitchen display system",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Guest CRM / unified guest data",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Offline mode",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Toast: free Starter Kit; Point of Sale from $69/month"
        },
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Toast Starter Kit is free software (higher processing rate)"
        },
        {
          "feature": "24/7/365 support included",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included on every Toast plan, even free tier"
        }
      ]
    },
    {
      "group": "Marketing & Guest Experience",
      "rows": [
        {
          "feature": "Multi-channel reservation distribution",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "DoorDash, Deliveroo, Google, Instagram, Yelp"
        },
        {
          "feature": "Loyalty programs and gift cards",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Email/SMS marketing automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer guest marketing and campaign tools"
        },
        {
          "feature": "AI table management / Voice AI",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do I need both SevenRooms and Toast for my restaurant?",
      "answer": "They cover different functions rather than competing directly. SevenRooms manages reservations, guest CRM, and marketing, while Toast runs point-of-sale, payments, kitchen display, and payroll. A full-service restaurant could reasonably use Toast at the register and SevenRooms for bookings and guest marketing side by side."
    },
    {
      "question": "Which tool has published pricing?",
      "answer": "Toast publishes pricing: a free Starter Kit tier and a Point of Sale plan starting at $69/month plus per-transaction processing fees. SevenRooms does not publish pricing and requires booking a demo for a quote."
    },
    {
      "question": "Does Toast include reservation management?",
      "answer": "Reservation and waitlist management are not documented as Toast features; Toast's documented feature set centers on order management, payments, kitchen display, payroll, and online ordering rather than advance bookings."
    },
    {
      "question": "Can I use my own hardware with Toast?",
      "answer": "No. Toast's point-of-sale terminals and handhelds are proprietary and run only Toast's software, unlike some competitors that work on standard off-the-shelf tablets."
    },
    {
      "question": "Does SevenRooms process payments?",
      "answer": "Payment processing is not documented as a SevenRooms feature — it focuses on reservations, guest data/CRM, and marketing automation rather than transaction processing."
    },
    {
      "question": "Who owns SevenRooms and how does that relate to Toast?",
      "answer": "SevenRooms is owned by DoorDash, which completed its acquisition in June 2025. Toast is an independent, publicly documented company founded in 2012 and headquartered in Boston, with no ownership relationship to DoorDash or SevenRooms."
    }
  ]
};

export default sevenroomsVsToastContent;

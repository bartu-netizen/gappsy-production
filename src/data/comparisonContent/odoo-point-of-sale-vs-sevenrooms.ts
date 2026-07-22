import type { ToolComparisonContent } from './types';

const odooPointOfSaleVsSevenroomsContent: ToolComparisonContent = {
  "verdict": "Odoo Point of Sale is a checkout and register system that syncs sales with inventory, accounting, and CRM across Odoo's broader business suite, while SevenRooms is a hospitality platform focused on reservations, guest CRM, and marketing automation for restaurants, hotels, and venues, now owned by DoorDash. Odoo POS is about processing transactions and keeping back-office data consistent; SevenRooms is about managing the guest relationship before and after the transaction — bookings, guest data, and repeat-visit marketing. A restaurant group is more likely to need both than to choose one over the other.",
  "bestForToolA": "Odoo Point of Sale fits retailers and restaurants that want checkout tightly integrated with inventory, accounting, and CRM, with a free single-app tier and offline mode for uninterrupted sales during connectivity issues.",
  "bestForToolB": "SevenRooms fits hospitality operators — restaurants, hotels, clubs, and wineries — that need multi-channel reservations (including DoorDash and Deliveroo Reservations), AI-powered table management, and guest marketing automation, serving over 15,000 restaurants globally per the company.",
  "whoNeedsBoth": "A full-service restaurant group could run Odoo Point of Sale at the register for order-taking, payment, and kitchen routing while linking to Odoo Inventory and Accounting, and use SevenRooms in parallel to manage reservations, waitlists, and guest marketing campaigns that drive diners to the table in the first place.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Odoo Point of Sale is a transaction-processing register with barcode scanning, payment terminal integrations, and real-time inventory sync.",
      "toolB": "SevenRooms is a reservations and guest-relationship platform with multi-channel booking, AI table management, and marketing automation — it is not a POS or payment system.",
      "whyItMatters": "Buyers evaluating these as competitors would be comparing tools that solve different parts of the guest journey.",
      "benefitsWho": "Operators need to know whether they're solving a checkout problem (Odoo POS) or a booking/guest-relationship problem (SevenRooms)."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Odoo Point of Sale publishes pricing: free for one app with limited users, and Standard plans from around $24.90/user/month billed annually.",
      "toolB": "SevenRooms does not publish pricing; prospective customers must book a demo to get a quote.",
      "whyItMatters": "Published pricing lets small operators self-serve a budget decision quickly, while custom pricing usually reflects a more consultative, enterprise-style sales process.",
      "benefitsWho": "Small independent operators wanting fast, self-serve pricing benefit from Odoo POS's transparency."
    },
    {
      "title": "Reservation Distribution",
      "toolA": "Odoo Point of Sale does not document reservation or table-booking distribution features — it focuses on checkout and floor/table management for order-taking, not advance bookings.",
      "toolB": "SevenRooms distributes reservations through the restaurant's own website, DoorDash Reservations, Deliveroo Reservations, Google, Instagram, and Yelp.",
      "whyItMatters": "Reservation reach directly affects how many potential guests a venue can capture before they ever reach the POS.",
      "benefitsWho": "Restaurants relying on third-party discovery channels (DoorDash, Deliveroo, Google) benefit from SevenRooms' distribution network."
    },
    {
      "title": "Back-Office Integration Depth",
      "toolA": "Odoo Point of Sale connects natively to Odoo Inventory, Accounting, and CRM, keeping stock levels, financials, and customer records in sync from the same vendor.",
      "toolB": "SevenRooms centralizes guest data and CRM specific to bookings, visits, and orders, but does not document native inventory or accounting modules.",
      "whyItMatters": "Deep back-office integration reduces manual reconciliation between sales, stock, and financial reporting.",
      "benefitsWho": "Retail and restaurant operators already on or considering the Odoo suite benefit from Odoo POS's native back-office sync."
    },
    {
      "title": "AI Features",
      "toolA": "Odoo Point of Sale does not document AI-specific features in its feature list.",
      "toolB": "SevenRooms includes AI-powered table management (smart seating, pacing controls, cover forecasting) and Voice AI designed to capture call-in reservations.",
      "whyItMatters": "AI-driven seating and phone-call capture can materially reduce missed reservations and improve table turnover for high-volume venues.",
      "benefitsWho": "High-volume, reservation-heavy venues benefit from SevenRooms' AI table management and Voice AI."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Point-of-sale checkout",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SevenRooms is not a POS system"
        },
        {
          "feature": "Reservation and waitlist management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Offline operation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Odoo POS syncs automatically once connectivity returns"
        },
        {
          "feature": "Guest CRM / customer data unification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Table/floor management",
          "toolA": "available",
          "toolB": "available",
          "note": "Odoo POS: restaurant floor plans; SevenRooms: AI-powered seating and pacing"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Odoo: one free app, limited users"
        },
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SevenRooms requires a sales demo"
        },
        {
          "feature": "Custom/Enterprise plan",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Marketing & Distribution",
      "rows": [
        {
          "feature": "Multi-channel reservation distribution",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "DoorDash, Deliveroo, Google, Instagram, Yelp"
        },
        {
          "feature": "Loyalty programs and coupons",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Email/SMS marketing automation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Reputation management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Odoo Point of Sale and SevenRooms direct competitors?",
      "answer": "Not really. Odoo Point of Sale is a checkout and register system integrated with inventory and accounting, while SevenRooms is a reservations, guest CRM, and marketing platform. Many hospitality businesses would use a POS for payments and a reservations platform like SevenRooms for bookings side by side rather than choosing only one."
    },
    {
      "question": "Does SevenRooms publish its pricing?",
      "answer": "No. SevenRooms directs prospective customers to book a demo rather than publishing pricing on its site. Odoo Point of Sale, by contrast, publishes a free single-app tier and Standard plans from around $24.90 per user/month."
    },
    {
      "question": "Can Odoo Point of Sale take reservations?",
      "answer": "Reservation and waitlist management are not documented features of Odoo Point of Sale; its documented feature set centers on checkout, inventory sync, and restaurant floor/table management for order-taking, not advance booking distribution."
    },
    {
      "question": "Does Odoo Point of Sale work offline?",
      "answer": "Yes. It includes an offline mode that lets staff keep processing sales during connectivity interruptions, syncing all transactions automatically once the connection is restored."
    },
    {
      "question": "What venue types does SevenRooms support?",
      "answer": "SevenRooms serves restaurants, restaurant groups, hotels, membership clubs, nightclubs and bars, sports and entertainment venues, and breweries and wineries, according to the company."
    },
    {
      "question": "Who owns SevenRooms now?",
      "answer": "SevenRooms is owned by DoorDash, which completed its acquisition of the company in June 2025."
    }
  ]
};

export default odooPointOfSaleVsSevenroomsContent;

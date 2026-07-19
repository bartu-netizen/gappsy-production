import type { GroupComparisonContent } from './types';

const heartbeatVsHivebriteVsMightyNetworksContent: GroupComparisonContent = {
  "verdict": "All three are community platforms, but they sit at very different points on the price and buyer spectrum. Heartbeat and Mighty Networks are built for individual creators, coaches, and course businesses who want community, courses, and payments in one affordable subscription. Hivebrite is priced and built as enterprise software for large associations, alumni networks, and professional bodies that need governance, AI-powered matching, and multi-chapter management. Which one wins depends far more on organization type and budget than on any single feature.",
  "bestFor": {
    "heartbeat": "Creators, coaches, and small membership businesses who want the lowest entry price of the three ($49/month) along with transaction fees that shrink as the community grows.",
    "hivebrite": "Large associations, alumni networks, and enterprises that need AI-powered member matching, multi-chapter governance, and hands-on onboarding, and have the budget for enterprise-tier pricing starting at $895/month.",
    "mighty-networks": "Course creators and coaches who want community, structured courses, and live events bundled together with flexible one-time, subscription, and bundled monetization options."
  },
  "highlights": [
    {
      "title": "A large pricing gap by design",
      "description": "Heartbeat and Mighty Networks both start under $100 a month, while Hivebrite's entry Core plan starts at $895 a month, reflecting Hivebrite's positioning as enterprise software for associations rather than a creator-economy tool.",
      "toolSlugs": [
        "heartbeat",
        "hivebrite",
        "mighty-networks"
      ]
    },
    {
      "title": "Transaction fees only apply to two of the three",
      "description": "Heartbeat charges a declining transaction fee that drops from 5% to 1.25% as customers move up plan tiers, and Mighty Networks charges a 2% fee on its entry Launch plan that reduces on higher tiers. Hivebrite's provided data does not document any per-transaction fee.",
      "toolSlugs": [
        "heartbeat",
        "mighty-networks"
      ]
    },
    {
      "title": "AI-powered member matching is a Hivebrite exclusive",
      "description": "Hivebrite's Orbiit-derived AI matching recommends relevant connections and mentors within a community, a capability that is not documented in Heartbeat's or Mighty Networks' feature sets.",
      "toolSlugs": [
        "hivebrite"
      ]
    },
    {
      "title": "Branded mobile apps exist on all three, but the terms differ",
      "description": "Heartbeat's white-label mobile app is limited to its top Scale plan, Mighty Networks' Mighty Pro branded app requires separate custom enterprise pricing above its self-serve tiers, and Hivebrite offers a branded mobile app as an optional add-on across its plans.",
      "toolSlugs": [
        "heartbeat",
        "hivebrite",
        "mighty-networks"
      ]
    },
    {
      "title": "Only Heartbeat and Mighty Networks price transparently for self-serve signup",
      "description": "Both list clear starting prices a creator can pay without a sales call, while Hivebrite's top two tiers (Prime and Custom Fit) require custom pricing negotiated after a discovery process.",
      "toolSlugs": [
        "heartbeat",
        "mighty-networks",
        "hivebrite"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Monetization",
      "rows": [
        {
          "feature": "Native payment processing for paid memberships",
          "statuses": {
            "heartbeat": "available",
            "hivebrite": "available",
            "mighty-networks": "available"
          }
        },
        {
          "feature": "Declining or reduced transaction fees as plan tier increases",
          "statuses": {
            "heartbeat": "available",
            "hivebrite": "not-documented",
            "mighty-networks": "available"
          }
        }
      ]
    },
    {
      "group": "Community and Content Features",
      "rows": [
        {
          "feature": "AI-powered member matching/recommendations",
          "statuses": {
            "heartbeat": "not-documented",
            "hivebrite": "available",
            "mighty-networks": "not-documented"
          }
        },
        {
          "feature": "Structured online courses",
          "statuses": {
            "heartbeat": "available",
            "hivebrite": "not-documented",
            "mighty-networks": "available"
          }
        },
        {
          "feature": "Live or virtual events with ticketing/hosting",
          "statuses": {
            "heartbeat": "available",
            "hivebrite": "available",
            "mighty-networks": "available"
          }
        }
      ]
    },
    {
      "group": "Branding and Access",
      "rows": [
        {
          "feature": "White-label branded mobile app",
          "statuses": {
            "heartbeat": "available",
            "hivebrite": "available",
            "mighty-networks": "available"
          },
          "note": "Heartbeat gates this to its Scale plan, Mighty Networks prices it as separate custom Mighty Pro packages, and Hivebrite offers it as an add-on."
        }
      ]
    },
    {
      "group": "Pricing and Trials",
      "rows": [
        {
          "feature": "Transparent self-serve entry pricing (no sales call required)",
          "statuses": {
            "heartbeat": "available",
            "hivebrite": "unavailable",
            "mighty-networks": "available"
          }
        },
        {
          "feature": "Free trial with no credit card required",
          "statuses": {
            "heartbeat": "available",
            "hivebrite": "not-documented",
            "mighty-networks": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Why is Hivebrite so much more expensive than Heartbeat and Mighty Networks?",
      "answer": "Hivebrite is built and priced as enterprise software for large associations, alumni networks, and professional bodies, with its entry Core plan starting at $895 a month. Heartbeat and Mighty Networks are aimed at individual creators and coaches, with entry pricing at $49 and $95 a month respectively."
    },
    {
      "question": "Do any of these charge transaction fees on membership payments?",
      "answer": "Heartbeat charges a transaction fee that declines from 5% on its Build plan down to 1.25% on its Scale plan, and Mighty Networks charges 2% on its entry Launch plan with reduced or minimal fees on higher tiers. Hivebrite's documented pricing does not mention a per-transaction fee."
    },
    {
      "question": "Which platform offers AI-powered member matching?",
      "answer": "Hivebrite is the only one of the three with documented AI-powered member matching, gained through its acquisition of Orbiit, which recommends relevant connections and mentors within a community."
    },
    {
      "question": "Can I get a fully branded mobile app on any of these?",
      "answer": "Yes, all three offer some form of branded mobile app, but the terms differ: Heartbeat limits it to the top Scale plan, Mighty Networks sells it separately as custom-priced Mighty Pro packages, and Hivebrite offers it as an optional add-on across plans."
    },
    {
      "question": "Which is better for a large alumni network or association versus an individual creator?",
      "answer": "Hivebrite is purpose-built for large associations, alumni networks, and enterprise brand communities that need governance and AI matching at scale. Heartbeat and Mighty Networks are better fits for individual creators, coaches, and course businesses running a paid membership or course community."
    },
    {
      "question": "Is there a free trial for any of these?",
      "answer": "Heartbeat offers a 14-day free trial with no credit card required on every plan. The provided data for Mighty Networks and Hivebrite does not document a free trial."
    }
  ]
};

export default heartbeatVsHivebriteVsMightyNetworksContent;

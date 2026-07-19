import type { GroupComparisonContent } from './types';

const circleVsDiscipleVsHivebriteContent: GroupComparisonContent = {
  "verdict": "Circle, Disciple, and Hivebrite all help creators and organizations run paid, branded communities, but they are built for different scales and audiences: Circle bundles discussion spaces, courses, memberships, and AI tools into one product starting around 89 dollars a month, Disciple focuses on fully independent, white-labeled iOS and Android apps with zero transaction fees on member revenue, and Hivebrite targets large associations and alumni networks with a member directory, governance tools, and enterprise pricing starting near 895 dollars a month. Individual creators and small brands will likely find Circle or Disciple more accessible, while large membership organizations with complex governance needs will lean toward Hivebrite.",
  "bestFor": {
    "circle": "Creators and brands who want community, courses, memberships, live events, and AI tools bundled into one moderately priced, branded product.",
    "disciple": "Creators who want a fully white-labeled, independently app-store-listed mobile app and keep all of their membership and course revenue.",
    "hivebrite": "Large associations, alumni networks, and enterprises that need a comprehensive member directory, event management, and multi-level governance tools."
  },
  "highlights": [
    {
      "title": "AI tools layered onto an all-in-one product",
      "description": "Circle's AI Agents and Co-Pilot answer member questions and assist with content using the community's own knowledge base, on top of its existing courses, memberships, and events.",
      "toolSlugs": [
        "circle"
      ]
    },
    {
      "title": "Zero-fee, fully independent branded apps",
      "description": "Disciple is the only one of the three to advertise 0 percent transaction fees on member and course revenue, and its branded apps are listed independently in the App Store and Google Play rather than as a white-labeled shell.",
      "toolSlugs": [
        "disciple"
      ]
    },
    {
      "title": "Built for large associations and alumni networks",
      "description": "Hivebrite's member directory, fundraising analytics, and multi-level governance tools, plus every plan including unlimited end users, target complex organizations rather than individual creators.",
      "toolSlugs": [
        "hivebrite"
      ]
    },
    {
      "title": "Entry pricing spans a wide range",
      "description": "Circle starts around 89 dollars a month, Disciple starts around 399 dollars a month, and Hivebrite starts near 895 dollars a month, reflecting three very different target customer sizes.",
      "toolSlugs": [
        "circle",
        "disciple",
        "hivebrite"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Community and Monetization",
      "rows": [
        {
          "feature": "Paid memberships and monetization",
          "statuses": {
            "circle": "available",
            "disciple": "available",
            "hivebrite": "available"
          }
        },
        {
          "feature": "Built-in, monetizable courses",
          "statuses": {
            "circle": "available",
            "disciple": "limited",
            "hivebrite": "not-documented"
          },
          "note": "Disciple requires the Plus tier or above to make courses monetizable."
        },
        {
          "feature": "Live events and video",
          "statuses": {
            "circle": "available",
            "disciple": "available",
            "hivebrite": "available"
          }
        },
        {
          "feature": "Branded native mobile app",
          "statuses": {
            "circle": "limited",
            "disciple": "available",
            "hivebrite": "limited"
          },
          "note": "Disciple includes an independently app-store-listed branded app on its base plan; Circle requires the custom-priced Plus tier and Hivebrite offers it as a separate paid add-on."
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "0 percent transaction fees on member revenue",
          "statuses": {
            "circle": "not-documented",
            "disciple": "available",
            "hivebrite": "not-documented"
          }
        },
        {
          "feature": "Free trial",
          "statuses": {
            "circle": "limited",
            "disciple": "not-documented",
            "hivebrite": "not-documented"
          },
          "note": "Circle offers a 14-day free trial across all tiers but no permanent free plan; trial availability for Disciple and Hivebrite is not documented."
        },
        {
          "feature": "API access",
          "statuses": {
            "circle": "limited",
            "disciple": "limited",
            "hivebrite": "not-documented"
          },
          "note": "Circle's API access requires the Business tier and above; Disciple's requires the Pro tier and above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Circle, Disciple, and Hivebrite is the cheapest to start with?",
      "answer": "Circle has the lowest entry price at 89 dollars a month for its Professional plan, followed by Disciple at 399 dollars a month and Hivebrite at 895 dollars a month for its Core plan."
    },
    {
      "question": "Which platform takes no cut of my membership or course revenue?",
      "answer": "Disciple explicitly advertises 0 percent transaction fees on member subscription and course revenue across all its plans. Circle and Hivebrite do not document their transaction fee structure in the provided data."
    },
    {
      "question": "Can I launch my own branded app in the App Store with these tools?",
      "answer": "Disciple includes a fully white-labeled, independently app-store-listed iOS and Android app on its base Branded App plan. Circle offers a similar branded app only on its custom-priced Plus tier, and Hivebrite offers a branded mobile app as a separate paid add-on."
    },
    {
      "question": "Which of these is built for large associations or alumni networks?",
      "answer": "Hivebrite is the clearest fit, with a searchable member directory, fundraising and engagement analytics, and multi-level governance tools designed for larger organizations, reflected in its higher starting price of 895 dollars a month."
    },
    {
      "question": "Do any of these platforms offer a free plan?",
      "answer": "None of the three offers a permanent free plan in the provided data. Circle offers a 14-day free trial across all tiers, while free trial availability for Disciple and Hivebrite is not documented."
    }
  ]
};

export default circleVsDiscipleVsHivebriteContent;

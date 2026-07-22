import type { GroupComparisonContent } from './types';

const circleVsDiscourseVsHivebriteContent: GroupComparisonContent = {
  "verdict": "Circle, Discourse, and Hivebrite each take a different approach to hosting an online community: Circle is a paid, all-in-one platform bundling courses, memberships, and AI tools starting around 89 dollars a month, Discourse is the only fully open-source option, free to self-host or available as hosted plans from 100 dollars a month, and Hivebrite is an enterprise-grade platform for large associations and alumni networks starting near 895 dollars a month. Budget-conscious or technical communities will likely prefer Discourse's free self-hosted option, creators wanting an all-in-one branded product will lean toward Circle, and large member organizations will gravitate toward Hivebrite.",
  "bestFor": {
    "circle": "Creators and brands who want community, courses, memberships, and AI tools bundled into one branded, moderately priced product.",
    "discourse": "Technical teams and communities that want a free, open-source, self-hostable forum platform with a modern, chat-like interface.",
    "hivebrite": "Large associations, alumni networks, and enterprises that need a comprehensive member directory and multi-level governance tools."
  },
  "highlights": [
    {
      "title": "The only free, open-source option",
      "description": "Discourse can be fully self-hosted for free via Docker, with no licensing fee, unlike the entirely paid subscription models of Circle and Hivebrite.",
      "toolSlugs": [
        "discourse"
      ]
    },
    {
      "title": "Courses and memberships bundled with community",
      "description": "Circle combines discussion spaces, courses, gated memberships, live events, and AI tools in one branded product, a broader monetization bundle than Discourse's forum-first focus.",
      "toolSlugs": [
        "circle"
      ]
    },
    {
      "title": "Built for large associations and alumni networks",
      "description": "Hivebrite's member directory, fundraising analytics, and multi-level governance tools target complex organizations, reflected in its enterprise starting price near 895 dollars a month.",
      "toolSlugs": [
        "hivebrite"
      ]
    },
    {
      "title": "All three now build in some form of AI",
      "description": "Circle's AI Agents and Co-Pilot, Discourse's first-party Discourse AI plugin suite, and Hivebrite's AI-powered member matching show AI features have become standard across the community-platform category.",
      "toolSlugs": [
        "circle",
        "discourse",
        "hivebrite"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Model",
      "rows": [
        {
          "feature": "Free, open-source self-hosting",
          "statuses": {
            "circle": "unavailable",
            "discourse": "available",
            "hivebrite": "unavailable"
          }
        },
        {
          "feature": "Built-in monetization and paid memberships",
          "statuses": {
            "circle": "available",
            "discourse": "not-documented",
            "hivebrite": "available"
          }
        },
        {
          "feature": "AI-powered features",
          "statuses": {
            "circle": "available",
            "discourse": "available",
            "hivebrite": "available"
          }
        },
        {
          "feature": "Native real-time chat",
          "statuses": {
            "circle": "available",
            "discourse": "available",
            "hivebrite": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Access and Governance",
      "rows": [
        {
          "feature": "Free entry-level plan or trial",
          "statuses": {
            "circle": "limited",
            "discourse": "available",
            "hivebrite": "not-documented"
          },
          "note": "Circle offers only a 14-day free trial, while Discourse's Community edition is free to self-host or trial when hosted."
        },
        {
          "feature": "Enterprise governance (SSO, audit logs)",
          "statuses": {
            "circle": "limited",
            "discourse": "available",
            "hivebrite": "available"
          },
          "note": "Circle requires the Business tier and above for white-labeling and API access, though full SSO is not documented for Circle."
        },
        {
          "feature": "Plugin or extension ecosystem",
          "statuses": {
            "circle": "limited",
            "discourse": "available",
            "hivebrite": "not-documented"
          },
          "note": "Circle documents roughly 40 app integrations; Discourse offers dozens of official and community plugins plus custom themes."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Circle, Discourse, and Hivebrite is open source?",
      "answer": "Only Discourse is open source and free to self-host via Docker. Circle and Hivebrite are both closed, paid subscription platforms with no self-hosting option."
    },
    {
      "question": "Which is the cheapest to start with?",
      "answer": "Discourse can be self-hosted for free, or used on a hosted Pro plan starting at 100 dollars a month. Circle starts at 89 dollars a month, and Hivebrite starts near 895 dollars a month."
    },
    {
      "question": "Do these platforms support paid memberships and monetization?",
      "answer": "Circle and Hivebrite both include native monetization tools for memberships, gated content, and events. Discourse is primarily a forum and discussion platform, and built-in monetization is not documented in the same way."
    },
    {
      "question": "Which is best for a large association or alumni network?",
      "answer": "Hivebrite is the strongest fit, with a searchable member directory, engagement and fundraising analytics, and multi-level governance tools built for larger organizations."
    },
    {
      "question": "Do any of these platforms include AI features?",
      "answer": "Yes, all three do. Circle offers AI Agents and a Co-Pilot, Discourse has a first-party Discourse AI plugin suite for summarization and moderation, and Hivebrite offers AI-powered member matching for connections and mentorship."
    }
  ]
};

export default circleVsDiscourseVsHivebriteContent;

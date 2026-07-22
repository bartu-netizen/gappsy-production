import type { ToolComparisonContent } from './types';

const brunoVsWiremockContent: ToolComparisonContent = {
  "verdict": "Bruno and WireMock both serve API developers but at different points in the workflow: Bruno is a Git-native API client for designing, sending, and version-controlling HTTP requests as local text files, while WireMock is a server-side simulation tool for mocking and testing against HTTP APIs with fault simulation and request verification. They aren't direct substitutes; Bruno replaces tools like Postman for request management, while WireMock replaces or complements a real backend during testing.",
  "bestForToolA": "Developers who want a local-first, Git-native API client for organizing and sending requests without a proprietary cloud account, paying $6/user/month for the Pro plan to unlock unlimited workspaces and private Git providers.",
  "bestForToolB": "QA and backend teams who need to simulate HTTP APIs with request matching, fault/chaos simulation, and request verification for automated test suites, deployable as a standalone JAR, embedded library, or Docker container.",
  "whoNeedsBoth": "A development team could use Bruno as its day-to-day API client for manually testing and organizing requests against real or mocked endpoints, while using WireMock in its automated test suite to stub those same endpoints with fault simulation and request verification during CI/CD runs.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Bruno is an API client for designing, sending, and organizing HTTP requests, similar to Postman, stored as local Git-trackable text files.",
      "toolB": "WireMock is a server-side API simulation tool that mocks and stubs HTTP responses for testing against, with request matching, fault simulation, and verification.",
      "whyItMatters": "An API client and a mocking server solve different problems and are often used together rather than as alternatives.",
      "benefitsWho": "Developers manually testing and organizing API calls benefit from Bruno; QA and backend teams simulating APIs for automated tests benefit from WireMock."
    },
    {
      "title": "Data Storage Philosophy",
      "toolA": "Bruno stores collections as plain text files directly in the user's filesystem with no required cloud sync, trackable and shareable via Git.",
      "toolB": "WireMock's core stubbing configuration typically runs as JSON-based mappings via JAR or Docker, with WireMock Cloud offering hosted database import and OpenAPI sync as an alternative.",
      "whyItMatters": "Local-first, Git-trackable storage suits teams already using version control for collaboration, while server-based stub configuration suits automated test infrastructure.",
      "benefitsWho": "Teams wanting Git-based collaboration without a proprietary cloud benefit from Bruno; teams building automated mock infrastructure benefit from WireMock's server-based config."
    },
    {
      "title": "Team and Enterprise Access Model",
      "toolA": "Bruno explicitly uses Git-based access controls and audit logs instead of a proprietary permissions system, with SSO/SCIM available only on the $11/user/month Ultimate plan.",
      "toolB": "WireMock's Enterprise tier (custom quote) adds its own team collaboration, SSO/RBAC, and Git sync separate from the underlying VCS-based storage.",
      "whyItMatters": "Access-control philosophy affects how teams manage permissions, either through existing Git infrastructure or a dedicated proprietary system.",
      "benefitsWho": "Teams that already manage access via Git benefit from Bruno's approach; teams wanting a dedicated permissions layer benefit from WireMock's Enterprise RBAC."
    },
    {
      "title": "Fault Simulation and Verification",
      "toolA": "Bruno's documented features focus on request organization, environments, and Git collaboration rather than fault injection or assertion-style verification.",
      "toolB": "WireMock explicitly documents fault simulation and request verification as core testing features.",
      "whyItMatters": "Automated test suites that need to simulate failures or assert specific requests occurred require dedicated testing features.",
      "benefitsWho": "QA teams building resilience and assertion-based tests benefit from WireMock's fault simulation and verification."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Bruno's paid tiers are flat per-user monthly prices: $6/user/month (Pro) and $11/user/month (Ultimate), billed annually.",
      "toolB": "WireMock's core is entirely free and open source; WireMock Cloud's only published tier is a free plan (1,000 calls/month), with a custom-quoted Enterprise tier and no published mid-tier price.",
      "whyItMatters": "Published per-user pricing is easier to budget for teams than an unpublished custom-quote model.",
      "benefitsWho": "Teams wanting transparent, predictable per-user costs benefit from Bruno's published Pro/Ultimate pricing."
    }
  ],
  "featureMatrix": [
    {
      "group": "API Workflow",
      "rows": [
        {
          "feature": "Send/organize HTTP requests (API client)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Mock/stub HTTP responses (API simulation)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Request matching (URL/headers/params/body)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Fault simulation (delays, malformed responses)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Request verification (test assertions)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "OpenAPI sync/import",
          "toolA": "available",
          "toolB": "available",
          "note": "Bruno: 5 free syncs/month, unlimited on Pro/Ultimate; WireMock: via WireMock Cloud"
        }
      ]
    },
    {
      "group": "Collaboration & Storage",
      "rows": [
        {
          "feature": "Local-first plain-text file storage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "No login/account required for core use",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Git-based version control integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Team collaboration (paid)",
          "toolA": "available",
          "toolB": "available",
          "note": "Bruno: $6-$11/user/month; WireMock: custom Enterprise quote"
        },
        {
          "feature": "SSO/SCIM",
          "toolA": "available",
          "toolB": "available",
          "note": "Bruno Ultimate: $11/user/month; WireMock: Enterprise custom quote"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Cross-platform desktop app",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bruno: Windows, macOS, Linux"
        },
        {
          "feature": "Standalone JAR/embedded/Docker deployment",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Bruno: 2 workspaces, public Git only; WireMock Cloud: 1,000 calls/month"
        },
        {
          "feature": "Published per-user/team pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bruno: $6/user/month Pro, $11/user/month Ultimate"
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bruno: Type I"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Bruno an API client or a mocking tool?",
      "answer": "Bruno is an API client for sending and organizing requests, stored locally as Git-trackable text files. It is not a mocking or simulation server like WireMock."
    },
    {
      "question": "Does WireMock have a desktop GUI app like Bruno?",
      "answer": "This isn't documented. WireMock runs as a standalone JAR, embedded library, or Docker container, with a UI available only through the paid WireMock Cloud tier."
    },
    {
      "question": "How is data stored in Bruno versus WireMock?",
      "answer": "Bruno stores collections as plain text files locally with no required cloud sync. WireMock Cloud offers hosted stubbing with database import and OpenAPI sync as a paid alternative to self-managed stub files."
    },
    {
      "question": "Which tool supports fault or chaos simulation for testing?",
      "answer": "WireMock explicitly documents fault simulation, and chaos testing is available on its Enterprise Cloud tier. This isn't a documented Bruno feature."
    },
    {
      "question": "What do the paid plans cost?",
      "answer": "Bruno Pro is $6/user/month and Ultimate is $11/user/month, both billed annually. WireMock's only published paid detail is a free tier (1,000 calls/month); beyond that it requires a custom Enterprise quote."
    },
    {
      "question": "Do either tools require an account for their free tier?",
      "answer": "Bruno's core app requires no login at all. WireMock's core simulation engine is free and open source with no account needed, though WireMock Cloud's free tier does require an account."
    }
  ]
};

export default brunoVsWiremockContent;

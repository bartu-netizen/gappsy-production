import type { ToolComparisonContent } from './types';

const hurlVsSqdContent: ToolComparisonContent = {
  "verdict": "Hurl is a free, open-source, Apache-2.0-licensed, Rust-based command-line tool for running and testing HTTP requests from plain-text files; SQD is a blockchain data provider offering real-time and historical data across 225+ networks via a free public API or dedicated enterprise data portals. These tools solve unrelated problems -- one is a generic API testing utility, the other a specialized blockchain data source -- so there's no direct feature overlap, though a team building on blockchain data could use Hurl to test SQD's own API endpoints.",
  "bestForToolA": "Hurl fits developers and QA/CI teams who need a lightweight, dependency-free command-line tool to define, chain, and assert HTTP requests (REST, GraphQL, SOAP) in plain text, especially in automated pipelines.",
  "bestForToolB": "SQD fits teams and applications that need real-time or historical blockchain data across a large number of networks (225+), whether starting from the free public API or scaling to a dedicated enterprise data portal.",
  "whoNeedsBoth": "A team building an application on SQD's blockchain data API could use Hurl to write CI/CD tests that verify SQD API responses, status codes, and payload structure as part of their integration testing pipeline.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Hurl is a generic HTTP request-testing CLI tool usable against any REST, GraphQL, or SOAP API.",
      "toolB": "SQD is a specialized blockchain data provider covering 225+ networks.",
      "whyItMatters": "They aren't competing for the same buyer -- one is testing infrastructure, the other is a data source.",
      "benefitsWho": "Developers testing APIs benefit from Hurl; teams needing blockchain data benefit from SQD."
    },
    {
      "title": "Pricing",
      "toolA": "Hurl is entirely free and open source with no usage limits.",
      "toolB": "SQD offers a free public API alongside paid dedicated enterprise data portals for larger deployments.",
      "whyItMatters": "Hurl has zero cost regardless of scale, while SQD's cost can grow with enterprise-level data needs.",
      "benefitsWho": "Individual developers and small teams always use Hurl for free; enterprises needing dedicated blockchain infrastructure pay for SQD's portals."
    },
    {
      "title": "What Data or Function Is Provided",
      "toolA": "Hurl provides no data itself -- it's a testing tool that sends requests and validates responses via XPath, JSONPath, status codes, and headers.",
      "toolB": "SQD directly provides real-time and historical blockchain data as its core product.",
      "whyItMatters": "Hurl requires an existing API to test against, whereas SQD is itself the API and data source.",
      "benefitsWho": "QA engineers needing an assertion tool use Hurl; data and infra teams needing blockchain data itself use SQD."
    },
    {
      "title": "Deployment Model",
      "toolA": "Hurl is a single Rust binary with no runtime dependencies, run locally or in CI.",
      "toolB": "SQD is a hosted API/data service (free public API or enterprise portals), not something installed locally.",
      "whyItMatters": "Hurl requires no infrastructure to operate, while SQD's core value depends on its hosted network coverage.",
      "benefitsWho": "Teams wanting a zero-install CLI tool use Hurl; teams needing managed blockchain data infrastructure use SQD."
    },
    {
      "title": "Community & Maturity Signals",
      "toolA": "Hurl has around 19,000 GitHub stars and is actively maintained with frequent releases.",
      "toolB": "Not documented -- no GitHub star count, founding year, or company details are provided for SQD in the available data.",
      "whyItMatters": "Visible open-source traction like Hurl's star count gives buyers a maturity signal that isn't available for SQD.",
      "benefitsWho": "Buyers evaluating open-source project health before adopting a tool."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "HTTP request testing/assertions",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Blockchain data (real-time/historical)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multi-network coverage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SQD covers 225+ networks; Hurl is protocol-agnostic testing, not network coverage"
        }
      ]
    },
    {
      "group": "Access & Cost",
      "rows": [
        {
          "feature": "Free tier/plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Hurl fully free; SQD free public API"
        },
        {
          "feature": "Enterprise/paid option",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SQD dedicated data portals"
        },
        {
          "feature": "Self-run/local execution",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Developer Tooling",
      "rows": [
        {
          "feature": "CI/CD reporting (JUnit, TAP, HTML)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Open-source license",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hurl is Apache-2.0"
        },
        {
          "feature": "Multi-API protocol support (REST, GraphQL, SOAP)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Hurl and SQD competing products?",
      "answer": "No -- Hurl is a generic HTTP API testing CLI tool, while SQD is a specialized blockchain data provider; they serve entirely different purposes."
    },
    {
      "question": "Is Hurl free like SQD's public API?",
      "answer": "Yes, Hurl is completely free and open source under Apache-2.0 with no usage limits; SQD also offers a free public API but adds paid dedicated enterprise data portals for larger deployments."
    },
    {
      "question": "How many blockchain networks does SQD cover?",
      "answer": "SQD provides real-time and historical data across more than 225 networks."
    },
    {
      "question": "Could I use Hurl to test an application built on SQD's API?",
      "answer": "Yes, Hurl's request-chaining and response-assertion features (XPath, JSONPath, status codes) make it suitable for writing CI/CD tests against any HTTP API, including one built on SQD's data endpoints."
    },
    {
      "question": "Does SQD have a command-line testing tool like Hurl?",
      "answer": "This isn't documented -- SQD's focus is providing blockchain data via API and enterprise portals, not developer testing tooling."
    }
  ]
};

export default hurlVsSqdContent;

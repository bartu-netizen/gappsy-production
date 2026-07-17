import type { ToolComparisonContent } from './types';

const activepiecesVsBugsinkContent: ToolComparisonContent = {
  "verdict": "activepieces automates business workflows across departments, while Bugsink is a self-hosted, open-source error tracking platform that's a drop-in, Sentry SDK-compatible alternative to Sentry. They're unrelated product categories - workflow automation versus application error monitoring - so the comparison focuses on pricing model, self-hosting economics, and licensing rather than shared features.",
  "bestForToolA": "Business operations teams building app-to-app automations who want usage-based pricing at $5 per active flow/month with the flexibility of cloud-hosted or self-hosted deployment.",
  "bestForToolB": "Engineering teams already using Sentry SDKs who want a drop-in-compatible, self-hosted error tracking tool - Bugsink's self-hosted deployment is free with unlimited users and all features, or hosted plans start at €16/month for 75,000 events.",
  "whoNeedsBoth": "A software company's engineering team might self-host Bugsink to track application errors from their Sentry-instrumented codebase, while a separate operations team uses activepieces to automate unrelated business processes like invoice routing or lead follow-up - both tools could run side by side without functional overlap.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Connects business applications and automates workflows across departments.",
      "toolB": "Captures, groups, and analyzes application errors and stack traces, compatible with existing Sentry SDKs.",
      "whyItMatters": "These solve entirely different engineering and operations problems, so neither can substitute for the other.",
      "benefitsWho": "Benefits teams correctly scoping whether they need process automation (activepieces) or error monitoring (Bugsink)."
    },
    {
      "title": "Self-Hosted Cost",
      "toolA": "Self-hosting is available, but the documented pricing is still usage-based ($5/active flow/month on the Standard plan); deployment flexibility doesn't eliminate the per-flow cost.",
      "toolB": "Self-hosted deployment is explicitly free with unlimited users and all features included, with event volume limited only by your own hardware.",
      "whyItMatters": "Teams wanting to avoid recurring software cost by self-hosting get that with Bugsink but not necessarily with activepieces.",
      "benefitsWho": "Benefits cost-sensitive engineering teams that can self-host Bugsink entirely free."
    },
    {
      "title": "Free Hosted Tier",
      "toolA": "No free tier is documented on the hosted/cloud side.",
      "toolB": "Offers a free hosted tier capped at 15,000 events/month with single-user access, useful for evaluation.",
      "whyItMatters": "Teams wanting to try a hosted version without commitment have a documented no-cost path with Bugsink.",
      "benefitsWho": "Benefits small teams or solo developers evaluating error tracking before paying."
    },
    {
      "title": "Migration/Compatibility Story",
      "toolA": "Not documented as a drop-in replacement for another named product.",
      "toolB": "Explicitly designed as a drop-in replacement for Sentry, using existing Sentry SDKs without requiring code changes.",
      "whyItMatters": "Teams already instrumented with Sentry SDKs can switch to Bugsink with minimal engineering effort.",
      "benefitsWho": "Benefits engineering teams currently on Sentry looking to reduce cost or self-host without re-instrumenting their codebase."
    },
    {
      "title": "Pricing Scale Metric",
      "toolA": "Priced per active automation flow at $5/month each.",
      "toolB": "Priced per monthly event volume on hosted plans, from €16/month for 75K events up to €158/month for 3M events.",
      "whyItMatters": "The two tools' costs scale along completely different axes, so cost comparisons must be usage-pattern-specific rather than direct.",
      "benefitsWho": "Benefits finance teams modeling cost against the correct usage driver for each tool."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Business workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Error/exception tracking and grouping",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Stack trace and code-context analysis",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Sentry SDK compatibility",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Drop-in replacement"
        }
      ]
    },
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "Bugsink self-hosted is free with unlimited users and features"
        },
        {
          "feature": "Cloud/hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "Bugsink hosted plans from €16/month"
        },
        {
          "feature": "Open-source core",
          "toolA": "available",
          "toolB": "available",
          "note": "Bugsink: 1.9K GitHub stars"
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Bugsink hosted free tier, 15K events/month"
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "activepieces: $5/active flow/month; Bugsink: €16/month for 75K events"
        },
        {
          "feature": "Enterprise/custom pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "activepieces Ultimate plan; Bugsink's published tiers go up to 3M+ events"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Bugsink free like activepieces claims usage flexibility?",
      "answer": "Bugsink's self-hosted deployment is free with unlimited users and all features; activepieces has no documented free tier and starts at $5 per active flow/month."
    },
    {
      "question": "Does activepieces track application errors like Bugsink?",
      "answer": "No, error tracking isn't a documented activepieces capability - that's Bugsink's core function, built as a Sentry SDK-compatible drop-in replacement."
    },
    {
      "question": "Can I try Bugsink without paying?",
      "answer": "Yes, Bugsink offers a free hosted tier capped at 15,000 events/month with single-user access, in addition to the fully free self-hosted option."
    },
    {
      "question": "How does Bugsink's hosted pricing scale?",
      "answer": "By monthly event volume, from €16/month for 75,000 events up to €158/month for 3 million events, with higher-volume plans available beyond that."
    },
    {
      "question": "Is Bugsink compatible with existing Sentry setups?",
      "answer": "Yes, it's explicitly designed as a drop-in replacement using existing Sentry SDKs, so teams can switch without re-instrumenting their code."
    },
    {
      "question": "Would a team ever need both activepieces and Bugsink?",
      "answer": "Possibly within the same organization but for unrelated purposes - Bugsink for monitoring application errors and activepieces for automating unrelated business workflows - though no functional integration between the two is documented."
    }
  ]
};

export default activepiecesVsBugsinkContent;

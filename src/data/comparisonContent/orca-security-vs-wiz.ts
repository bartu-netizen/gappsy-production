import type { ToolComparisonContent } from './types';

const orcaSecurityVsWizContent: ToolComparisonContent = {
  "verdict": "Orca and Wiz both unify cloud security, but the documented facts point to different strengths — Orca emphasizes agentless deployment with 24-hour visibility and a stated 25+ integration list, while Wiz names a dedicated runtime protection product (Wiz Defend) and offers a free trial that Orca's published materials don't mention.",
  "bestForToolA": "Organizations that want agentless scanning with rapid time-to-visibility and a known set of integrations (AWS, GitHub, Slack, Jira, Okta) without installing agents.",
  "bestForToolB": "Teams that want to test the platform via a free trial first and need a named runtime protection/threat detection layer (Wiz Defend) alongside code and cloud scanning.",
  "whoNeedsBoth": "Large multi-cloud enterprises running a CNAPP bake-off often request demos from both, since neither publishes self-serve pricing and the practical differences in runtime protection and agentless coverage only surface once both vendors provide quotes.",
  "keyDifferences": [
    {
      "title": "Deployment model",
      "toolA": "Explicitly agentless, claiming full cloud visibility within 24 hours without installing agents.",
      "toolB": "Not documented as agentless or agent-based in the available facts.",
      "whyItMatters": "Agent-based vs. agentless deployment affects rollout speed and operational overhead.",
      "benefitsWho": "Teams wanting the fastest, least invasive deployment (favors Orca based on documented facts)."
    },
    {
      "title": "Free trial availability",
      "toolA": "Not documented; cons note pricing requires a sales conversation.",
      "toolB": "Offers a free trial with demo scheduling on its website.",
      "whyItMatters": "A documented free trial lowers the barrier to hands-on evaluation before a sales cycle.",
      "benefitsWho": "Security teams that want to test-drive the product before engaging procurement (Wiz)."
    },
    {
      "title": "Runtime protection",
      "toolA": "Reachability analysis spans agentless, dynamic, and code layers, but no dedicated named runtime product.",
      "toolB": "Wiz Defend is a named product specifically for runtime protection and threat detection.",
      "whyItMatters": "A clearly named runtime module signals a distinct product investment area.",
      "benefitsWho": "Teams prioritizing runtime threat detection as a standalone capability (Wiz)."
    },
    {
      "title": "Stated integration ecosystem",
      "toolA": "States 25+ integrations by name, including AWS, GitHub, Slack, Jira, and Okta.",
      "toolB": "Names multi-cloud support for AWS and Azure without a stated integration count.",
      "whyItMatters": "A documented integration count and named tools help buyers assess ecosystem fit upfront.",
      "benefitsWho": "Teams evaluating integration breadth before a sales call (Orca)."
    },
    {
      "title": "Company transparency",
      "toolA": "Founded in 2019 with offices in London, Tel Aviv, and Portland, Oregon.",
      "toolB": "Founding year and headquarters are not stated in the available facts.",
      "whyItMatters": "Disclosed company details can factor into vendor due diligence.",
      "benefitsWho": "Procurement and vendor-risk teams doing background checks (Orca)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Coverage",
      "rows": [
        {
          "feature": "Cloud infrastructure security",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Code / developer-stage scanning",
          "toolA": "available",
          "toolB": "available",
          "note": "Orca: shift-left CI/CD & IDE integration; Wiz: Wiz Code"
        },
        {
          "feature": "Runtime threat detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wiz Defend"
        },
        {
          "feature": "Agentless deployment",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-powered automated code fixes",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI-driven penetration testing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI assistant for investigations/triage",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Ecosystem",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Named integration ecosystem size",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Orca: 25+ named tools"
        }
      ]
    },
    {
      "group": "Company Info",
      "rows": [
        {
          "feature": "Founded year public",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Headquarters/offices public",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is either platform agentless?",
      "answer": "Orca explicitly uses agentless scanning, claiming full cloud visibility within 24 hours without installing agents; Wiz's facts don't state whether its deployment is agent-based or agentless."
    },
    {
      "question": "Does either offer a free trial?",
      "answer": "Wiz offers a free trial with demo scheduling on its website; Orca's facts don't mention a free trial, only that pricing requires a sales conversation."
    },
    {
      "question": "What are the main product components?",
      "answer": "Wiz is built around three named products — Wiz Code, Wiz Cloud, and Wiz Defend — covering development, cloud infrastructure, and runtime protection; Orca's platform combines agentless scanning, reachability analysis, and a Unified Data Model across code-to-runtime layers."
    },
    {
      "question": "How many integrations does each support?",
      "answer": "Orca states 25+ integrations including AWS, GitHub, Slack, Jira, and Okta; Wiz's facts specify multi-cloud support for AWS and Azure without a stated integration count."
    },
    {
      "question": "When was each company founded?",
      "answer": "Orca Security was founded in 2019 with offices in London, Tel Aviv, and Portland, Oregon; Wiz's founding year and headquarters are not stated in the available facts."
    }
  ]
};

export default orcaSecurityVsWizContent;

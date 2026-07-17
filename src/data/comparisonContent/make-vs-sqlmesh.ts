import type { ToolComparisonContent } from './types';

const makeVsSqlmeshContent: ToolComparisonContent = {
  "verdict": "Make is a visual, no-code workflow automation platform for connecting apps, data, and AI logic via a drag-and-drop scenario canvas; SQLMesh is an open source SQL/Python framework for building and version-controlling data transformation pipelines inside a warehouse. They operate at different layers of a data stack — Make automates app-to-app workflows and triggers, while SQLMesh transforms and models data that's already inside a warehouse.",
  "bestForToolA": "Business teams and no-code builders wanting to connect CRMs, spreadsheets, email tools, and e-commerce platforms via a visual, branching flowchart canvas, starting with a free plan and going up to Core from around $9/month.",
  "bestForToolB": "Data engineers and analytics engineers who write SQL or Python models, want dbt-compatible pipelines, and need virtual data environments plus a Terraform-style Plan/Apply workflow to preview changes before deploying to a warehouse.",
  "whoNeedsBoth": "A data team could use SQLMesh to build and version-control the SQL/Python transformation models that populate their warehouse, while using Make's generic HTTP or webhook modules to trigger downstream automations off that data, such as pushing a newly materialized customer segment into a CRM or Slack channel.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "A no-code visual workflow and app-integration automation platform.",
      "toolB": "A SQL/Python data transformation framework for warehouse pipelines.",
      "whyItMatters": "They solve different problems (app automation versus data modeling), so the choice usually isn't either/or.",
      "benefitsWho": "Operations and marketing teams (Make) versus data and analytics engineers (SQLMesh)."
    },
    {
      "title": "Pricing Model",
      "toolA": "Freemium with a limited free plan, then Core from around $9/month, Pro from around $16/month, Teams from around $29/month (billed annually), and custom Enterprise, priced on operations/credits usage.",
      "toolB": "Core framework is fully free and open source under Apache License 2.0 with no seat pricing; the commercial Tobiko Cloud layer is custom-priced (platform fee plus consumption) and not publicly listed.",
      "whyItMatters": "Make's cost scales with automation volume and credits, while SQLMesh's core has zero licensing cost and only the optional cloud add-on carries (unpublished) pricing.",
      "benefitsWho": "Teams wanting a low, predictable entry price (Make Core) versus data teams wanting a completely free core framework (SQLMesh)."
    },
    {
      "title": "Skill Requirement",
      "toolA": "Designed as a no-code visual builder where most automations are built by dragging and connecting modules, though comfort with JSON and APIs helps for custom HTTP requests.",
      "toolB": "Requires writing SQL and/or Python models directly; it's a developer framework, not a drag-and-drop tool.",
      "whyItMatters": "Determines who on a team can actually build with each tool.",
      "benefitsWho": "Non-technical operations staff (Make) versus engineers comfortable with SQL, Python, and Git-style workflows (SQLMesh)."
    },
    {
      "title": "Change Safety & Testing",
      "toolA": "Provides execution logs and history to inspect past runs, plus error handlers, retries, and fallback routes, but no documented pre-deploy impact-preview workflow.",
      "toolB": "Uses a Plan/Apply workflow to preview the impact of changes before deploying, alongside automated unit test generation, built-in data audits, and column-level lineage.",
      "whyItMatters": "SQLMesh's Plan/Apply model is specifically built to prevent breaking changes to production data pipelines.",
      "benefitsWho": "Data engineering teams needing safe, reviewable deployments to a warehouse (SQLMesh)."
    },
    {
      "title": "Ecosystem Compatibility",
      "toolA": "Offers thousands of pre-built app integration modules plus generic HTTP and webhook modules for almost any API.",
      "toolB": "Designed to be backward compatible with existing dbt projects and transpiles across 10+ SQL dialects via the SQLGlot library.",
      "whyItMatters": "Shows each tool's compatibility strategy: Make connects to external SaaS apps, while SQLMesh interoperates with the existing dbt/SQL ecosystem.",
      "benefitsWho": "Teams with existing dbt projects wanting an easier migration path (SQLMesh) versus teams needing broad SaaS app connectivity (Make)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Building & Workflow Model",
      "rows": [
        {
          "feature": "Visual drag-and-drop builder",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SQLMesh is SQL/Python code-based"
        },
        {
          "feature": "Branching/conditional logic",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Make Routers"
        },
        {
          "feature": "Pre-built templates",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "dbt compatibility",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Testing, Reliability & Governance",
      "rows": [
        {
          "feature": "Error handling and retries",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Pre-deploy change preview (Plan/Apply)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated unit testing / audits",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Column-level lineage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Execution logs/history",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan/tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Limited operations/credits vs. fully free open source core"
        },
        {
          "feature": "Open source",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Apache License 2.0"
        },
        {
          "feature": "Paid managed offering",
          "toolA": "available",
          "toolB": "available",
          "note": "Core/Pro/Teams/Enterprise vs. Tobiko Cloud"
        },
        {
          "feature": "AI modules/agents",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Make free to use?",
      "answer": "Yes, a free plan offers a limited monthly operations/credits allowance; paid plans start around $9/month (Core, billed annually)."
    },
    {
      "question": "Is SQLMesh free?",
      "answer": "Yes, the core framework is open source under Apache License 2.0; the commercial Tobiko Cloud layer is custom-priced."
    },
    {
      "question": "Do I need to know how to code to use Make?",
      "answer": "No, it's designed as a no-code visual builder, though familiarity with JSON and APIs helps for custom HTTP requests."
    },
    {
      "question": "Is SQLMesh compatible with dbt?",
      "answer": "Yes, it's designed to be backward compatible with existing dbt projects."
    },
    {
      "question": "Who built SQLMesh, and is that a concern?",
      "answer": "Tobiko Data built SQLMesh, and the company was acquired by Fivetran in September 2025 — a factor worth weighing since it may affect SQLMesh's future roadmap."
    },
    {
      "question": "Can Make and SQLMesh work together?",
      "answer": "There's no documented native integration, but Make's generic HTTP and webhook modules could trigger workflows off events from a data pipeline SQLMesh manages, since Make is designed to integrate with virtually any API."
    }
  ]
};

export default makeVsSqlmeshContent;

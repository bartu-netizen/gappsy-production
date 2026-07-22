import type { ToolComparisonContent } from './types';

const buildertrendVsCoconstructContent: ToolComparisonContent = {
  "verdict": "Buildertrend and CoConstruct grew up as direct rivals in residential construction management, and Buildertrend's 2021 acquisition of CoConstruct changed the calculus rather than settling it. Both cover the same core ground: scheduling, budgeting, selections, change orders, client portals, and warranty tracking for home builders and remodelers. The practical difference today is less about features and more about trajectory. Buildertrend is the actively developed platform under parent company ECI Software Solutions, with a public API, QuickBooks integration, and dedicated purchase order and bid request tools that suit builders juggling multiple subcontractors and suppliers. CoConstruct is in maintenance mode, still functional and still deeply built for custom home builders who lean on its cost-code budgeting, time tracking, and plan markup tools, but it is no longer being sold to new customers and has no visible product roadmap. A buyer picking between the two today is not really choosing based on feature parity; they are choosing between the platform being invested in versus the platform being wound down. Existing CoConstruct customers get a supported migration path into Buildertrend rather than being cut off, which softens the transition but does not change the direction. Anyone starting fresh should default to Buildertrend unless a specific legacy integration or workflow ties them to CoConstruct.",
  "bestForToolA": "Buildertrend fits residential builders and remodelers who want an actively developed platform with purchase order and bid management, accounting integrations, and a public API, and who are comfortable requesting a custom quote.",
  "bestForToolB": "CoConstruct mainly fits existing customers who already run their business on it and want continuity, cost-code-based budgeting, and time tracking while a migration to Buildertrend is planned or in progress.",
  "whoNeedsBoth": "Companies mid-transition after an acquisition, franchise, or merger, or firms migrating historical CoConstruct project data into Buildertrend, may operate both systems side by side during the changeover.",
  "keyDifferences": [
    {
      "title": "Active development status",
      "toolA": "Buildertrend is the actively developed, go-forward platform under ECI Software Solutions",
      "toolB": "CoConstruct has been in maintenance mode since its 2021 acquisition, with little to no new feature development",
      "whyItMatters": "A buyer choosing software today is also choosing how much future investment and support it will receive",
      "benefitsWho": "New buyers and anyone planning a multi-year commitment benefit from choosing the actively developed platform"
    },
    {
      "title": "New customer availability",
      "toolA": "Buildertrend is open to new customers and is the platform being actively sold",
      "toolB": "CoConstruct is not open to meaningful new customer growth, and prospects are directed to Buildertrend instead",
      "whyItMatters": "A tool that will not onboard new accounts is not a viable long-term option for a fresh buyer regardless of feature quality",
      "benefitsWho": "Anyone evaluating tools for a new purchase benefits from knowing CoConstruct is effectively closed to them"
    },
    {
      "title": "Public API and accounting integration",
      "toolA": "Buildertrend documents a public API plus integrations with accounting tools like QuickBooks",
      "toolB": "No public API or named accounting integration is documented for CoConstruct",
      "whyItMatters": "Builders who need to connect their project data to accounting or other business systems depend on documented integration points",
      "benefitsWho": "Companies with an existing accounting stack or custom internal tools benefit from Buildertrend's documented API and QuickBooks support"
    },
    {
      "title": "Purchase orders and bid requests",
      "toolA": "Buildertrend includes dedicated purchase order and bid request tools for managing suppliers and subcontractors",
      "toolB": "CoConstruct's documented facts do not describe a purchase order or bid request module",
      "whyItMatters": "Builders coordinating many suppliers and trade bids need structured tools to solicit and compare pricing in one place",
      "benefitsWho": "Builders managing frequent subcontractor bidding and procurement benefit from Buildertrend's dedicated tools"
    },
    {
      "title": "Time tracking",
      "toolA": "Time tracking is not documented as a distinct Buildertrend feature",
      "toolB": "CoConstruct includes dedicated crew and subcontractor time entry tied to jobs and cost codes",
      "whyItMatters": "Builders who need labor cost tracking by job and cost code rely on time tracking being built into the platform rather than handled separately",
      "benefitsWho": "Custom builders tracking labor costs closely against cost codes benefit from CoConstruct's documented time tracking module"
    },
    {
      "title": "Plan markup and document annotation",
      "toolA": "Buildertrend's documented facts describe daily logs and job-site photos but not drawing annotation tools",
      "toolB": "CoConstruct documents annotation tools for reviewing plans and drawings with clients or trades",
      "whyItMatters": "Teams that review architectural drawings collaboratively need markup tools rather than plain document storage",
      "benefitsWho": "Custom home builders who regularly review plan revisions with clients or trades benefit from CoConstruct's markup tools"
    },
    {
      "title": "Pricing transparency history",
      "toolA": "Buildertrend has never published fixed self-serve pricing and requires contacting sales",
      "toolB": "CoConstruct historically published tiered monthly rates around 199, 399, and 599 dollars, though these are no longer sold on its site",
      "whyItMatters": "Budget-conscious buyers researching cost ranges have more historical reference points for CoConstruct even though neither tool is purchasable at a published rate today",
      "benefitsWho": "Buyers doing early-stage budget research get more concrete historical price anchors from CoConstruct's published legacy tiers"
    },
    {
      "title": "Company history and specialization",
      "toolA": "Buildertrend was founded in 2006 in Omaha, Nebraska and serves a broad range of residential builders and remodelers",
      "toolB": "CoConstruct was founded in 2005 in Charlottesville, Virginia with a sharper focus on custom home building and remodeling workflows",
      "whyItMatters": "The narrower original focus shaped CoConstruct's cost-code budgeting and client-facing tools differently than Buildertrend's broader residential positioning",
      "benefitsWho": "Custom builders with high-touch, lower-volume projects align more closely with CoConstruct's original design philosophy"
    },
    {
      "title": "Data continuity and migration support",
      "toolA": "Buildertrend is the receiving platform for customers migrating off CoConstruct, with an established migration path",
      "toolB": "CoConstruct retains historical project data indefinitely and offers a dedicated migration team to move customers into Buildertrend",
      "whyItMatters": "Existing CoConstruct customers need assurance that years of project history will not be lost during a forced platform transition",
      "benefitsWho": "Long-tenured CoConstruct customers benefit most from the documented migration support and data retention"
    },
    {
      "title": "Support responsiveness",
      "toolA": "No documented user reports of support slowdowns are noted for Buildertrend",
      "toolB": "User reports describe slower support response times for CoConstruct compared to its earlier, independent years",
      "whyItMatters": "Ongoing support quality affects day-to-day usability regardless of how strong the original feature set is",
      "benefitsWho": "Buyers prioritizing responsive support benefit from Buildertrend's position as the primary supported platform going forward"
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and Coordination",
      "rows": [
        {
          "feature": "Project scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Subcontractor and trade coordination views",
          "toolA": "available",
          "toolB": "available",
          "note": "Buildertrend assigns tasks to crews and subs; CoConstruct offers subcontractor-facing schedule views"
        }
      ]
    },
    {
      "group": "Budgeting and Estimating",
      "rows": [
        {
          "feature": "Budget vs actual tracking",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Estimating and client proposals",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Cost code catalogs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "CoConstruct explicitly ties budgeting and estimating to cost codes"
        }
      ]
    },
    {
      "group": "Client Experience",
      "rows": [
        {
          "feature": "Client or homeowner portal",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Selections and allowance management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Change Orders",
      "rows": [
        {
          "feature": "Digital change orders with e-signature",
          "toolA": "available",
          "toolB": "available",
          "note": "Both flow into the client portal and budget automatically"
        }
      ]
    },
    {
      "group": "Field Documentation",
      "rows": [
        {
          "feature": "Daily logs and job-site photos",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Document and plan storage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "CoConstruct documents centralized storage for plans and permits"
        },
        {
          "feature": "Plan markup and annotation tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Purchase Orders and Bidding",
      "rows": [
        {
          "feature": "Purchase orders",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Subcontractor bid requests",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Time and Labor Tracking",
      "rows": [
        {
          "feature": "Crew and subcontractor time entry",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tied to jobs and cost codes in CoConstruct"
        }
      ]
    },
    {
      "group": "Warranty Management",
      "rows": [
        {
          "feature": "Post-completion warranty and service tracking",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Mobile Apps and Integrations",
      "rows": [
        {
          "feature": "iOS and Android mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Public API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Accounting integration such as QuickBooks",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Buildertrend or CoConstruct?",
      "answer": "Neither publishes current self-serve pricing today, so a direct cost comparison is not possible from public data. Buildertrend has always required contacting sales for a custom quote across its Essential, Advanced, and Complete plans, while CoConstruct historically published monthly rates of roughly 199, 399, and 599 dollars for its Core, Essential, and Advanced tiers before those plans stopped being sold on its site."
    },
    {
      "question": "Is CoConstruct still available to new customers?",
      "answer": "No, CoConstruct is in maintenance mode and is not being actively marketed to new customers, with parent company ECI Software Solutions directing prospects toward Buildertrend instead."
    },
    {
      "question": "What is the difference between Buildertrend and CoConstruct?",
      "answer": "Buildertrend acquired CoConstruct in 2021, and both now operate under parent company ECI Software Solutions, but Buildertrend is the platform being actively developed and sold going forward while CoConstruct serves mainly existing customers during a migration period. Feature-wise both cover scheduling, budgeting, selections, change orders, and client communication for residential builders."
    },
    {
      "question": "Does Buildertrend or CoConstruct have a public API?",
      "answer": "Buildertrend documents a public API along with integrations like QuickBooks, while no public API is documented for CoConstruct."
    },
    {
      "question": "What happens to my project data if I am an existing CoConstruct customer?",
      "answer": "According to CoConstruct's own migration guidance, historical project data is retained and accessible indefinitely, and a dedicated migration team assists existing customers moving their projects into Buildertrend."
    },
    {
      "question": "Should a new construction company sign up for CoConstruct today?",
      "answer": "No, since CoConstruct is not open to meaningful new customer growth and is being positioned as a legacy product, a company starting fresh should evaluate Buildertrend as the actively supported option instead."
    }
  ]
};

export default buildertrendVsCoconstructContent;

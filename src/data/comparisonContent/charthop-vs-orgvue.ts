import type { ToolComparisonContent } from './types';

const charthopVsOrgvueContent: ToolComparisonContent = {
  "verdict": "ChartHop and Orgvue both work in the org design and workforce planning space, but they target different scales and buying processes. ChartHop is a modular, self-serve-priced people analytics platform starting at $5/employee/month covering org charts, headcount planning, HRIS, compensation, and performance, while Orgvue is a long-established (founded 2005, London-headquartered) enterprise organizational design and workforce planning platform sold entirely on custom quotes for large-scale organizational transformation projects. Companies running day-to-day people operations across HR functions tend toward ChartHop; companies running major org redesign or workforce transformation initiatives tend toward Orgvue.",
  "bestForToolA": "ChartHop fits HR and finance teams that want a modular, transparently priced platform (from $5/employee/month) spanning org charts, headcount planning, compensation, performance, and engagement in one system.",
  "bestForToolB": "Orgvue fits large enterprises running formal organizational design and workforce planning initiatives — data harmonization across multiple source systems, predictive modeling, and scenario forecasting for large-scale transformation — with pricing entirely custom-quoted.",
  "whoNeedsBoth": "A large enterprise could use Orgvue for a major restructuring project (data harmonization, predictive modeling of new org structures) while continuing to run ChartHop as its day-to-day HRIS and compensation system that will ultimately reflect the outcome of that redesign.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "ChartHop Core starts at $5/employee/month, with named add-on modules at $3-$4/employee/month each and a Custom Enterprise tier.",
      "toolB": "Orgvue pricing is entirely custom-quote based, with nothing public disclosed.",
      "whyItMatters": "A published starting price lets buyers self-qualify budget fit before engaging sales; an entirely custom model requires a sales conversation just to estimate cost.",
      "benefitsWho": "Smaller teams and procurement-conscious buyers benefit from ChartHop's published pricing."
    },
    {
      "title": "Company Maturity & Track Record",
      "toolA": "ChartHop does not disclose its founding year or headquarters on its pricing page.",
      "toolB": "Orgvue was founded in 2005 and is headquartered in London, United Kingdom, giving it a two-decade track record in organizational design.",
      "whyItMatters": "Buyers evaluating vendor stability for multi-year transformation programs often weigh company longevity.",
      "benefitsWho": "Enterprise procurement teams that require vendor stability history for large contracts."
    },
    {
      "title": "AI Features",
      "toolA": "ChartHop AI (Ask ChartHop) is conversational AI that answers questions, fills forms, models org changes, and automates tasks, billed pay-as-you-go as ChartHop AI Pro.",
      "toolB": "Orgvue's Henshaw Assistant and Henshaw Roles are a natural-language AI interface and workforce design AI capability, both currently in early access rather than generally available.",
      "whyItMatters": "The maturity of AI features affects whether a team can rely on them for production workflows today versus evaluating them as a preview.",
      "benefitsWho": "Teams wanting production-ready AI today should note ChartHop AI Pro is generally available while Orgvue's Henshaw suite is early access."
    },
    {
      "title": "Core Use Case",
      "toolA": "ChartHop centers on ongoing HR operations: headcount planning, HRIS, compensation cycles, performance reviews, and engagement surveys.",
      "toolB": "Orgvue centers on organizational design and workforce planning: analyzing and redesigning org structures, data import/harmonization from multiple sources, and predictive modeling of organizational change.",
      "whyItMatters": "Ongoing HR administration and one-time or periodic large-scale org redesign are different projects with different success criteria.",
      "benefitsWho": "People operations teams need ChartHop's operational tools; strategy and workforce planning leaders running transformation projects need Orgvue's modeling tools."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "ChartHop connects with 100+ HRIS, ATS, and FP&A tools including ADP, Workday, Greenhouse, and BambooHR.",
      "toolB": "Orgvue's Data import and harmonization feature connects and unifies workforce data from multiple sources, but the number or names of specific integrations are not documented.",
      "whyItMatters": "A documented, large integration count reduces implementation risk for teams evaluating fit with their existing stack.",
      "benefitsWho": "IT and HRIS teams assessing implementation effort benefit from ChartHop's explicitly listed integration count."
    }
  ],
  "featureMatrix": [
    {
      "group": "Org Structure & Planning",
      "rows": [
        {
          "feature": "Org chart visualization",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChartHop core feature"
        },
        {
          "feature": "Organizational redesign tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Orgvue Organizational design"
        },
        {
          "feature": "Predictive/scenario modeling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Orgvue Predictive modeling"
        },
        {
          "feature": "Headcount planning",
          "toolA": "available",
          "toolB": "available",
          "note": "ChartHop Headcount Planning module; Orgvue Workforce planning"
        }
      ]
    },
    {
      "group": "HR Operations",
      "rows": [
        {
          "feature": "HRIS / employee records",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChartHop HRIS add-on"
        },
        {
          "feature": "Compensation cycle management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChartHop Compensation module"
        },
        {
          "feature": "Performance reviews",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ChartHop Performance module"
        }
      ]
    },
    {
      "group": "AI & Pricing",
      "rows": [
        {
          "feature": "Conversational AI assistant",
          "toolA": "available",
          "toolB": "limited",
          "note": "ChartHop AI Pro is generally available; Orgvue's Henshaw Assistant is early access"
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ChartHop: $5/employee/month; Orgvue: custom quote only"
        },
        {
          "feature": "Founding year disclosed",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Orgvue founded 2005"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does ChartHop pricing compare to Orgvue?",
      "answer": "ChartHop publishes a starting price of $5/employee/month for its Core plan plus per-module add-ons. Orgvue discloses no public pricing at all — every engagement is quoted on a custom basis."
    },
    {
      "question": "Is Orgvue older than ChartHop?",
      "answer": "Orgvue was founded in 2005 and is headquartered in London. ChartHop's founding year is not disclosed on its pricing page."
    },
    {
      "question": "Do both tools have AI features?",
      "answer": "Yes, but at different maturity stages. ChartHop AI Pro (Ask ChartHop) is a generally available, pay-as-you-go conversational AI. Orgvue's Henshaw Assistant and Henshaw Roles are AI capabilities currently in early access, not generally available."
    },
    {
      "question": "Is ChartHop or Orgvue better for a major organizational restructuring project?",
      "answer": "Orgvue's documented features are purpose-built for this: organizational design, workforce planning, data harmonization from multiple sources, and predictive modeling. ChartHop's feature set centers on ongoing HR operations like org charts, HRIS, compensation, and performance rather than large-scale redesign modeling."
    },
    {
      "question": "Does ChartHop offer a free trial or free plan?",
      "answer": "No free plan is documented for ChartHop; pricing starts at $5/employee/month for Core. Orgvue also has no documented free plan and requires a custom quote."
    }
  ]
};

export default charthopVsOrgvueContent;

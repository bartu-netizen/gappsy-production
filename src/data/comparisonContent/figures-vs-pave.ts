import type { ToolComparisonContent } from './types';

const figuresVsPaveContent: ToolComparisonContent = {
  "verdict": "Figures is a compensation platform emphasizing pay equity analysis and EU Pay Transparency Directive compliance tooling, backed by over 3.5 million benchmark datapoints and 30+ HRIS integrations, sold entirely through custom quotes. Pave is an AI-assisted compensation benchmarking platform with a genuine free tier (Market Data Lite) for smaller companies, real-time data from 9,000+ companies, and employee-facing tools like a Total Rewards Portal and Visual Offer Letter.",
  "bestForToolA": "Compensation teams at companies like Doctolib- or EY-scale needing dedicated pay equity analysis and EU Pay Transparency Directive compliance tools alongside collaborative review workflows.",
  "bestForToolB": "Smaller or growing companies (1-200 employees) that want to start with Pave's free Market Data Lite benchmarking before upgrading, or teams wanting AI-assisted job matching and employee-facing tools like the Total Rewards Portal.",
  "whoNeedsBoth": "There's no clear complementary scenario - both are compensation benchmarking and planning platforms serving the same core buyer (comp and People teams setting salary bands), so this is typically a head-to-head vendor decision rather than a combined deployment.",
  "keyDifferences": [
    {
      "title": "Free Plan Availability",
      "toolA": "Figures has no free tier; all three plans (Structure, Companion, Pay Transparency) are Custom-priced and require a demo.",
      "toolB": "Pave offers Market Data Lite free for companies with 1-200 employees.",
      "whyItMatters": "A free entry point removes the barrier for smaller companies to start benchmarking compensation.",
      "benefitsWho": "Early-stage or smaller companies wanting to try compensation benchmarking without a sales process."
    },
    {
      "title": "Benchmark Data Scale",
      "toolA": "Figures cites over 3,500,000 compensation datapoints.",
      "toolB": "Pave sources real-time data from 9,000+ contributing companies across 200+ job families and 16 business functions.",
      "whyItMatters": "The two platforms report data volume using different metrics, so buyers should ask each vendor for directly comparable figures during evaluation.",
      "benefitsWho": "Comp teams wanting to understand the depth and freshness of underlying benchmark data."
    },
    {
      "title": "Pay Equity and Compliance Tooling",
      "toolA": "Figures has a dedicated Pay Equity Analysis feature plus compliance tools built for the EU Pay Transparency Directive, and a standalone Pay Transparency plan.",
      "toolB": "Pave's feature list does not document EU Pay Transparency Directive-specific compliance tooling.",
      "whyItMatters": "Companies operating in the EU need compliance-ready tooling ahead of pay transparency deadlines.",
      "benefitsWho": "EU-based or EU-operating companies with pay equity compliance obligations."
    },
    {
      "title": "AI-Assisted Benchmarking",
      "toolA": "Figures' feature list does not mention AI or machine learning.",
      "toolB": "Pave uses AI-assisted job matching and machine learning for benchmark accuracy.",
      "whyItMatters": "AI-assisted matching can reduce manual effort in mapping roles to the right benchmark data.",
      "benefitsWho": "Comp teams wanting automated role-to-benchmark matching."
    },
    {
      "title": "HRIS Integration Breadth",
      "toolA": "Figures documents integration with 30+ HRIS and review systems specifically.",
      "toolB": "Pave does not state a specific integration count, though it offers a Total Rewards Portal and Visual Offer Letter as differentiated employee-facing tools.",
      "whyItMatters": "A documented integration count helps buyers gauge how easily the tool fits an existing HR tech stack.",
      "benefitsWho": "IT and HR teams evaluating integration effort with existing HRIS systems."
    }
  ],
  "featureMatrix": [
    {
      "group": "Benchmarking & Data",
      "rows": [
        {
          "feature": "Compensation benchmark datapoints",
          "toolA": "available",
          "toolB": "available",
          "note": "Figures: 3.5M+ datapoints; Pave: 9,000+ companies"
        },
        {
          "feature": "AI-assisted job/role matching",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Salary bands",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "International market coverage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pave Pro: 55+ countries, 90+ cities/metros"
        }
      ]
    },
    {
      "group": "Compensation Planning & Compliance",
      "rows": [
        {
          "feature": "Collaborative compensation review workflows",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Pay equity analysis",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "EU Pay Transparency Directive compliance tools",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Total Rewards communication portal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Visual/candidate-facing offer letters",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Integrations",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Pave: Market Data Lite"
        },
        {
          "feature": "HRIS integrations (documented count)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Figures: 30+"
        },
        {
          "feature": "Unlimited user seats",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pave: all plans"
        },
        {
          "feature": "Named enterprise customers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Figures: Doctolib, KPMG, TotalEnergies, EY, Qonto, Swan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does either tool have a free plan?",
      "answer": "Pave offers Market Data Lite free for companies with 1-200 employees. Figures has no free tier - all plans (Structure, Companion, Pay Transparency) require a custom quote."
    },
    {
      "question": "Which has more benchmark data?",
      "answer": "Figures cites over 3,500,000 compensation datapoints, while Pave sources real-time data from 9,000+ contributing companies across 200+ job families. The two report data volume using different metrics, so they aren't directly comparable."
    },
    {
      "question": "Does Figures support EU Pay Transparency Directive compliance?",
      "answer": "Yes, Figures has dedicated compliance tools for the EU Pay Transparency Directive plus a standalone Pay Transparency plan. Pave does not document this specific compliance capability."
    },
    {
      "question": "Does Pave use AI for benchmarking?",
      "answer": "Yes, Pave uses AI-assisted job matching and machine learning. Figures' feature list does not mention AI capabilities."
    },
    {
      "question": "How many HRIS integrations does each support?",
      "answer": "Figures documents 30+ HRIS and review system integrations. Pave does not state a specific integration count."
    },
    {
      "question": "Which named companies use each platform?",
      "answer": "Figures lists Doctolib, KPMG, TotalEnergies, EY, Qonto, and Swan. Pave does not name specific customers in the available facts."
    }
  ]
};

export default figuresVsPaveContent;

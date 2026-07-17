import type { ToolComparisonContent } from './types';

const _15fiveVsFrappeHrContent: ToolComparisonContent = {
  "verdict": "15Five is a narrowly focused, AI-enhanced performance management and engagement SaaS priced per user, built for reviews, surveys, and manager coaching. Frappe HR is a full open-source HRIS covering the entire employee lifecycle - recruitment, attendance, leave, expenses, and payroll - that can be self-hosted for free or run on Frappe Cloud.",
  "bestForToolA": "Companies wanting structured performance reviews, engagement surveys, and AI-driven manager coaching through Kona, with published per-user pricing and native iOS/Android apps.",
  "bestForToolB": "Organizations wanting a free, self-hostable, open-source system covering payroll, recruitment, attendance, and leave alongside basic performance tracking, especially those already using ERPNext.",
  "whoNeedsBoth": "A company could run Frappe HR as its core system of record for payroll, recruitment, and attendance, then layer 15Five on top specifically for AI-assisted review cycles and Kona manager coaching, since Frappe HR's performance module doesn't document AI-assisted reviews or dedicated engagement surveys.",
  "keyDifferences": [
    {
      "title": "Product Scope",
      "toolA": "15Five focuses specifically on performance management, engagement surveys, goals/OKRs, and manager coaching.",
      "toolB": "Frappe HR is a full HRIS and payroll suite covering recruitment, employee lifecycle management, shifts & attendance, leave, expenses, performance, and payroll tax & reports.",
      "whyItMatters": "Buyers need to know whether they're evaluating a point solution for performance or a system of record for all of HR.",
      "benefitsWho": "HR leaders deciding between a specialized performance tool and a consolidated HRIS."
    },
    {
      "title": "Pricing Model",
      "toolA": "15Five is paid-only with three per-user annual tiers: Engage at $4/user/month, Perform at $11/user/month, and Total Platform at $16/user/month.",
      "toolB": "Frappe HR is free to self-host under AGPL-3.0, or available via Frappe Cloud starting at $5/month for site hosting (not per user).",
      "whyItMatters": "Per-user SaaS pricing scales with headcount, while self-hosted open source shifts cost to infrastructure and maintenance instead.",
      "benefitsWho": "Cost-conscious growing teams (Frappe HR) versus teams wanting predictable per-user SaaS billing (15Five)."
    },
    {
      "title": "AI Coaching Capabilities",
      "toolA": "15Five offers Kona, an AI assistant add-on that gives managers real-time coaching recommendations, plus AI-assisted performance reviews.",
      "toolB": "Frappe HR's public feature list does not mention AI capabilities.",
      "whyItMatters": "AI-assisted coaching can shorten manager ramp-up time on giving effective feedback.",
      "benefitsWho": "Managers who want in-the-moment coaching prompts during reviews and 1-on-1s."
    },
    {
      "title": "Payroll Processing",
      "toolA": "15Five's feature list does not include payroll processing; it offers compensation insights (pay range management) rather than running payroll.",
      "toolB": "Frappe HR includes dedicated Payroll and Payroll Tax & Reports modules with regional tax configuration.",
      "whyItMatters": "Running payroll requires dedicated tax and compliance handling that a pure performance tool doesn't provide.",
      "benefitsWho": "Companies wanting one platform to handle both HR processes and payroll."
    },
    {
      "title": "Openness and Deployment",
      "toolA": "15Five is closed-source SaaS with iOS and Android mobile apps; no self-hosting option is documented.",
      "toolB": "Frappe HR is 100% open source (AGPL-3.0, 8.2K GitHub stars) and can be self-hosted on your own infrastructure.",
      "whyItMatters": "Self-hosting gives full data control and avoids per-user fees but requires infrastructure management.",
      "benefitsWho": "IT teams that prefer to control their own HR data infrastructure versus teams that want a managed SaaS experience."
    }
  ],
  "featureMatrix": [
    {
      "group": "Performance & Engagement",
      "rows": [
        {
          "feature": "AI-assisted performance reviews",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Engagement/pulse surveys",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Manager AI coaching (Kona)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "15Five add-on"
        },
        {
          "feature": "Goals/OKR tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "Frappe HR: goals, KRAs, appraisals"
        },
        {
          "feature": "1-on-1 meeting tools",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "HR Operations & Payroll",
      "rows": [
        {
          "feature": "Payroll processing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Payroll tax & reporting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Recruitment/hiring workflow",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Leave & attendance management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Expense management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment, Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Frappe HR self-hosted is free"
        },
        {
          "feature": "Open-source availability",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "AGPL-3.0"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Self-hosting option",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does 15Five include payroll?",
      "answer": "No. Payroll is not part of 15Five's documented feature set, which focuses on reviews, surveys, and coaching. Frappe HR, by contrast, has dedicated Payroll and Payroll Tax & Reports modules."
    },
    {
      "question": "Is Frappe HR really free?",
      "answer": "Yes, self-hosting Frappe HR is free under its AGPL-3.0 open-source license. If you'd rather not self-host, Frappe Cloud site hosting starts at $5/month, with server plans from $40/month and a 14-day free trial."
    },
    {
      "question": "How does 15Five's Kona AI assistant work?",
      "answer": "Kona is an add-on AI coaching tool that gives managers real-time recommendations, layered on top of 15Five's base per-user pricing."
    },
    {
      "question": "Which tool is open source?",
      "answer": "Frappe HR is 100% open source under AGPL-3.0 with 8.2K GitHub stars. 15Five is proprietary SaaS with no open-source option."
    },
    {
      "question": "What does 15Five cost compared to Frappe HR?",
      "answer": "15Five charges $4, $11, or $16 per user/month (billed annually) across its Engage, Perform, and Total Platform tiers with no free plan. Frappe HR is free to self-host, or available on Frappe Cloud from $5/month for site hosting."
    },
    {
      "question": "Does Frappe HR handle recruitment?",
      "answer": "Yes. Its Recruitment feature covers planning, publishing, analyzing, and evaluating hiring through to offers - a workflow that isn't part of 15Five's documented feature set."
    }
  ]
};

export default _15fiveVsFrappeHrContent;

import type { ToolComparisonContent } from './types';

const homebaseVsWhenIWorkContent: ToolComparisonContent = {
  "verdict": "Homebase and When I Work both target the same core buyer — small to mid-sized businesses scheduling hourly, shift-based teams like restaurants, retail, and hospitality — but they reach that buyer through different pricing philosophies and product depth. Homebase leads with a genuinely free plan for a single location, then bundles scheduling, time tracking, messaging, hiring, and an add-on payroll service into location-based paid tiers, plus direct POS integrations with Square, Clover, and Toast that tie labor costs to real-time sales. When I Work skips the free tier in favor of transparent per-user pricing starting at $2.50 per user per month, and instead of building its own payroll, it plugs into established providers like Gusto, QuickBooks Online, ADP Workforce Now, and Square Payroll. Its higher tiers add labor forecasting, custom reporting, and enterprise features such as API access, webhooks, and SAML SSO that Homebase does not document offering. In short, Homebase is the more complete out-of-the-box small-business suite, especially for single-location operators who want scheduling, hiring, and payroll under one roof at no upfront cost. When I Work is the better fit for growing multi-location operators who already have payroll and reporting stacks in place and want scheduling software that integrates cleanly and scales toward enterprise-grade access controls. Neither tool is objectively superior — the right choice comes down to whether you want an all-in-one platform or a scheduling specialist that plays well with other systems.",
  "bestForToolA": "Homebase best fits single-location, hourly-workforce small businesses such as restaurants, retail stores, or salons that want free or low-cost scheduling, time tracking, hiring, and payroll bundled into one app.",
  "bestForToolB": "When I Work best fits multi-location or growing shift-based businesses that already use providers like Gusto, QuickBooks Online, ADP, or Square Payroll and want per-user pricing plus enterprise controls like API access and SSO as they scale.",
  "whoNeedsBoth": "A multi-brand or franchise operator might run Homebase at legacy single-location sites still on its free plan while using When I Work at newer, larger locations that need its forecasting, reporting, and SSO features.",
  "keyDifferences": [
    {
      "title": "Pricing structure",
      "toolA": "Homebase charges per location, with a free Basic plan and paid tiers from $24 per month per location up to $96 per month per location.",
      "toolB": "When I Work charges per user per month, from $2.50 on Essentials up to $8 on Premium, with no permanent free plan.",
      "whyItMatters": "Per-location pricing rewards businesses with fewer, larger locations, while per-user pricing rewards businesses with fewer total staff regardless of location count, so the cheaper option depends entirely on headcount and location mix.",
      "benefitsWho": "Single-location businesses with larger staff counts often save more on Homebase, while lean teams spread across several locations often save more on When I Work."
    },
    {
      "title": "Free plan versus free trial",
      "toolA": "Homebase offers a permanent free Basic plan for one location with a capped employee count and core scheduling and time tracking.",
      "toolB": "When I Work offers a 14-day free trial with full feature access but no permanent free tier afterward.",
      "whyItMatters": "A permanent free plan lets a very small business run indefinitely at no cost, while a trial-only model requires committing to a paid plan once the trial ends.",
      "benefitsWho": "Very small, budget-constrained single-location businesses benefit from Homebase's free plan, while businesses ready to commit to a paid tool from day one are unaffected by the trial limit."
    },
    {
      "title": "Payroll approach",
      "toolA": "Homebase offers its own integrated payroll add-on that runs directly off tracked hours inside the app.",
      "toolB": "When I Work does not build its own payroll but natively integrates with Gusto, QuickBooks Online, ADP Workforce Now, and Square Payroll through its Time Clock and Attendance add-on.",
      "whyItMatters": "Businesses without an existing payroll provider may prefer an all-in-one payroll built into the scheduling tool, while businesses already using Gusto, QuickBooks, or ADP may prefer a scheduling tool that connects to what they already run.",
      "benefitsWho": "New or payroll-less small businesses benefit from Homebase's built-in payroll, while businesses with an established payroll provider benefit from When I Work's native integrations."
    },
    {
      "title": "Point-of-sale integrations",
      "toolA": "Homebase integrates with POS providers including Square, Clover, and Toast to compare labor hours against sales.",
      "toolB": "POS integrations are not documented for When I Work.",
      "whyItMatters": "Restaurants and retailers that track sales through a POS system benefit from software that ties labor costs to sales data automatically rather than reconciling the two manually.",
      "benefitsWho": "Restaurants, retailers, and other POS-driven businesses benefit from Homebase's documented POS integrations."
    },
    {
      "title": "Hiring and onboarding tools",
      "toolA": "Homebase includes hiring features such as posting to job boards, applicant tracking, and digital new-hire paperwork.",
      "toolB": "Hiring and applicant tracking features are not documented for When I Work.",
      "whyItMatters": "Businesses with frequent hourly turnover benefit from having recruiting and onboarding built into the same tool that handles scheduling, rather than managing a separate hiring system.",
      "benefitsWho": "High-turnover businesses like restaurants and retail benefit from Homebase's built-in hiring tools."
    },
    {
      "title": "Enterprise access controls",
      "toolA": "Enterprise-grade API access, webhooks, and SAML SSO are not documented for Homebase.",
      "toolB": "When I Work's Premium plan adds API key access, webhooks, and SAML SSO for deeper system integration.",
      "whyItMatters": "Larger organizations with existing identity-management systems or custom integrations typically require SSO and API access to fit software into their broader technology stack.",
      "benefitsWho": "Larger, multi-location, or IT-governed organizations benefit from When I Work's documented enterprise features."
    },
    {
      "title": "Labor forecasting and custom reporting",
      "toolA": "Homebase offers labor cost management dashboards comparing scheduled versus actual hours against sales.",
      "toolB": "When I Work's Pro and Premium plans add labor cost forecasting, custom reports, and 24-hour callout reporting.",
      "whyItMatters": "Businesses managing tighter margins or multiple locations benefit from forward-looking forecasting and customizable reports, not just after-the-fact cost comparisons.",
      "benefitsWho": "Multi-location operators and businesses needing granular reporting benefit from When I Work's forecasting tools on its higher tiers."
    },
    {
      "title": "Offline and reliability considerations",
      "toolA": "Offline functionality and reported reliability issues are not documented for Homebase.",
      "toolB": "When I Work's documented cons note the mobile app does not fully work offline and that some users report bugs, crashes, and syncing delays.",
      "whyItMatters": "Job sites or locations with unreliable internet or cell coverage need an app that keeps working offline, and known syncing or stability issues can disrupt time-sensitive scheduling and clock-ins.",
      "benefitsWho": "Businesses in low-connectivity locations should weigh When I Work's documented offline limitation before committing."
    },
    {
      "title": "Company tenure",
      "toolA": "Homebase was founded in 2014 and is headquartered in San Francisco, California.",
      "toolB": "When I Work was founded in 2010 and is headquartered in Minneapolis, Minnesota.",
      "whyItMatters": "A longer operating history can suggest more time refining core scheduling workflows and integration partnerships, though it is not a substitute for evaluating current features directly.",
      "benefitsWho": "Buyers who weight vendor maturity and track record may lean slightly toward When I Work's longer history, though both companies are well-established in the space."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling",
      "rows": [
        {
          "feature": "Drag-and-drop schedule builder",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Auto-scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": "When I Work documents a dedicated Auto-Scheduler that matches shifts to availability and preferences"
        },
        {
          "feature": "Shift swapping and open shift claims",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Reusable shift templates",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Time Clock and Attendance",
      "rows": [
        {
          "feature": "GPS-enabled clock-in",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Geofencing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Late arrival and overtime alerts",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Kiosk or tablet clock-in",
          "toolA": "available",
          "toolB": "available",
          "note": "Homebase via POS or tablet terminal, When I Work via shared kiosk"
        }
      ]
    },
    {
      "group": "Team Communication",
      "rows": [
        {
          "feature": "One-to-one and group messaging",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Shift reminders",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Payroll and HR",
      "rows": [
        {
          "feature": "Built-in payroll add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Homebase payroll is an extra-fee add-on"
        },
        {
          "feature": "Native third-party payroll integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Gusto, QuickBooks Online, ADP Workforce Now, and Square Payroll via the Time Clock and Attendance add-on"
        },
        {
          "feature": "Hiring and applicant tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "HR compliance tools and document storage",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Point of Sale and Sales Integration",
      "rows": [
        {
          "feature": "POS integrations (Square, Clover, Toast)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Labor cost versus sales dashboards",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Reporting and Forecasting",
      "rows": [
        {
          "feature": "Labor cost forecasting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pro and Premium plans"
        },
        {
          "feature": "Custom reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pro and Premium plans"
        },
        {
          "feature": "24-hour callout reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pro and Premium plans"
        },
        {
          "feature": "Labor cost management dashboards",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Enterprise and Access Controls",
      "rows": [
        {
          "feature": "API key access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Premium plan"
        },
        {
          "feature": "Webhooks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Premium plan"
        },
        {
          "feature": "SAML SSO",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Premium plan"
        },
        {
          "feature": "Role-based permissions and departments",
          "toolA": "available",
          "toolB": "available",
          "note": "Homebase on Plus tier, When I Work on Pro tier"
        }
      ]
    },
    {
      "group": "Platform and Access",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Single location, capped employees"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "14 days, no credit card required"
        },
        {
          "feature": "Native iOS and Android apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Web app access",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Homebase or When I Work?",
      "answer": "When I Work has a lower published starting price at $2.50 per user per month, but Homebase offers a free plan for a single location, so the cheaper option depends on your employee count and whether you qualify for the Homebase free tier; Homebase paid plans start at $24 per month per location, while When I Work's per-user pricing can cost more or less depending on total headcount."
    },
    {
      "question": "Does Homebase or When I Work offer a free plan?",
      "answer": "Homebase offers a permanent free Basic plan for a single location with a capped employee count, while When I Work only offers a 14-day free trial with no permanent free tier."
    },
    {
      "question": "Which tool has better payroll options?",
      "answer": "It depends on whether you want built-in payroll or integration with an existing provider — Homebase offers its own add-on payroll service that runs off tracked hours, while When I Work integrates natively with established providers like Gusto, QuickBooks Online, ADP Workforce Now, and Square Payroll rather than offering its own payroll product."
    },
    {
      "question": "Can When I Work do everything Homebase does?",
      "answer": "Not based on documented features — When I Work does not document hiring and applicant tracking, HR compliance tools, or POS integrations that Homebase offers, though it documents enterprise features like API access, webhooks, and SSO that Homebase does not."
    },
    {
      "question": "Which has better enterprise features like SSO and API access?",
      "answer": "When I Work is the documented option here, offering API key access, webhooks, and SAML SSO on its Premium plan, none of which are documented features of Homebase."
    },
    {
      "question": "Which is better for hiring and onboarding hourly staff?",
      "answer": "Homebase is the documented option for hiring, since it includes posting to job boards, applicant tracking, and digital new-hire paperwork, none of which are documented features of When I Work."
    }
  ]
};

export default homebaseVsWhenIWorkContent;

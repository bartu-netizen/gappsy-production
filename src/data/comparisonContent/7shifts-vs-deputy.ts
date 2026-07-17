import type { ToolComparisonContent } from './types';

const _7shiftsVsDeputyContent: ToolComparisonContent = {
  "verdict": "7shifts and Deputy both solve shift-based workforce management, but they are built for different worlds. 7shifts was designed from the ground up for restaurants and food service, with tip pooling, POS-linked labor forecasting, and a manager log book that speaks the language of a restaurant floor. It also offers a genuine free plan for a single location with a small team, which makes it approachable for independent restaurants just getting off spreadsheets. Deputy takes a broader view of shift work, serving retail, hospitality, and healthcare businesses with deeper compliance tooling for break and overtime rules, an explicit auto-scheduling and demand-forecasting engine on higher tiers, and a wider payroll and HR integration list including Gusto, QuickBooks, Xero, and ADP. Deputy has no permanent free tier and instead charges per user with a minimum monthly account spend, while 7shifts charges per location and layers hiring, onboarding, and advanced compliance behind its priciest plan. A single-location restaurant that already uses a supported POS system will likely find 7shifts a tighter fit out of the box. A multi-industry or non-restaurant shift-based business that needs stronger compliance automation and payroll flexibility will likely lean toward Deputy. Neither tool is objectively better; the right choice depends on whether the business is a restaurant needing POS-native forecasting or a broader shift-based operation needing compliance depth and payroll breadth.",
  "bestForToolA": "7shifts is the better fit for single- or multi-location restaurants and food-service operators that want POS-linked labor forecasting, tip pooling, and a free plan to start with a small team.",
  "bestForToolB": "Deputy is the better fit for retail, hospitality, and healthcare shift-based businesses that need deeper break and overtime compliance automation, auto-scheduling, and broad payroll integrations, and that prefer per-user pricing over per-location pricing.",
  "whoNeedsBoth": "A hospitality group that runs both restaurant locations and non-restaurant shift-based operations, such as retail or hotel front-desk teams, could reasonably run 7shifts for its restaurant units and Deputy for the rest of the business rather than forcing one tool to cover both.",
  "keyDifferences": [
    {
      "title": "Core Industry Focus",
      "toolA": "7shifts is built specifically for restaurants and food service, with terminology and features like tip pooling tailored to that vertical.",
      "toolB": "Deputy targets shift-based teams broadly, including retail, hospitality, and healthcare, without restaurant-specific tooling like tip pooling.",
      "whyItMatters": "A tool built around your industry ships fewer workarounds and more relevant defaults out of the box.",
      "benefitsWho": "Restaurants benefit from 7shifts' focus, while non-restaurant shift-based businesses benefit from Deputy's broader scope."
    },
    {
      "title": "Pricing Structure",
      "toolA": "7shifts prices per location, with paid plans starting around 30 dollars per month per location.",
      "toolB": "Deputy prices per user per month, starting at 5 dollars USD on the Lite plan, subject to a minimum monthly account spend.",
      "whyItMatters": "Per-location pricing scales differently than per-user pricing depending on staff headcount versus number of sites.",
      "benefitsWho": "A single location with many staff may find per-location pricing cheaper, while a multi-location business with few staff per site may prefer per-user pricing."
    },
    {
      "title": "Free Plan Availability",
      "toolA": "7shifts offers a genuine free plan for a single location with a small team covering basic scheduling and time tracking.",
      "toolB": "Deputy has no permanent free plan, only a free trial on its paid tiers.",
      "whyItMatters": "A free tier lowers the barrier for very small or budget-constrained teams to start using the software at all.",
      "benefitsWho": "Very small independent restaurants benefit from 7shifts' free tier; Deputy requires budget for even the smallest team."
    },
    {
      "title": "Auto-Scheduling and Demand Forecasting",
      "toolA": "7shifts offers labor cost forecasting that compares scheduled hours against POS sales data, but does not auto-generate draft schedules.",
      "toolB": "Deputy offers auto-scheduling on Core and Pro tiers that uses historical sales or foot-traffic data to auto-generate draft schedules for manager review.",
      "whyItMatters": "Auto-generating a draft schedule saves manager time versus only getting cost comparisons after a schedule is built manually.",
      "benefitsWho": "Managers who want to reduce manual schedule-building time benefit more from Deputy's auto-scheduling."
    },
    {
      "title": "Compliance Alert Depth",
      "toolA": "7shifts flags overtime risk and supports predictive scheduling or fair workweek requirements where applicable.",
      "toolB": "Deputy checks for rest-break violations, overtime thresholds, and award or union pay-rule conflicts before a schedule is published.",
      "whyItMatters": "Businesses in jurisdictions with complex break and award-rule regulations need more granular compliance checks than overtime alone.",
      "benefitsWho": "Businesses facing complex labor law or union award rules benefit from Deputy's deeper compliance checks."
    },
    {
      "title": "Task and Checklist Management",
      "toolA": "7shifts provides a manager log book for digital shift notes and handoffs, but does not document dedicated shift-level checklists.",
      "toolB": "Deputy provides dedicated tasking, letting managers assign checklists such as opening and closing duties tied to a specific shift or location.",
      "whyItMatters": "Formal checklists tied to shifts help ensure operational tasks are completed and tracked, not just communicated.",
      "benefitsWho": "Operations that need auditable opening and closing checklists benefit from Deputy's tasking feature."
    },
    {
      "title": "Hiring and Onboarding Tools",
      "toolA": "7shifts supports posting jobs, tracking applicants, and onboarding new hires on higher-tier plans.",
      "toolB": "Deputy's documented feature set does not include hiring or applicant-tracking tools.",
      "whyItMatters": "Built-in hiring tools can reduce the number of separate systems a growing restaurant needs to manage staff turnover.",
      "benefitsWho": "Restaurants with frequent hourly-staff turnover benefit from 7shifts' built-in hiring tools."
    },
    {
      "title": "Payroll and HR Integration Breadth",
      "toolA": "7shifts offers payroll integrations and, in some markets, a payroll add-on, but is not primarily a payroll or HR platform.",
      "toolB": "Deputy integrates with Gusto, QuickBooks, Xero, and ADP, and offers its own US payroll product through a partnership with Paycor.",
      "whyItMatters": "A wider roster of payroll integrations reduces the chance a business has to switch its existing payroll provider to adopt the scheduling tool.",
      "benefitsWho": "Businesses already using Gusto, QuickBooks, Xero, or ADP benefit from Deputy's direct integrations."
    },
    {
      "title": "POS Integration Depth",
      "toolA": "7shifts connects with major restaurant point-of-sale systems to sync sales and labor data, powering its labor forecasting.",
      "toolB": "Deputy's documented facts do not confirm restaurant POS integrations.",
      "whyItMatters": "POS-linked labor forecasting only works as well as the depth of the POS integration behind it.",
      "benefitsWho": "Restaurants with a supported POS system get more value from 7shifts' forecasting features."
    },
    {
      "title": "Clock-In Method and Time Theft Prevention",
      "toolA": "7shifts supports clock-in from a tablet, POS terminal, or the mobile app.",
      "toolB": "Deputy adds a tablet kiosk clock-in option with photo capture to help reduce buddy punching.",
      "whyItMatters": "Photo capture at clock-in adds a verification layer that plain tablet or POS clock-in does not provide.",
      "benefitsWho": "Businesses concerned about time theft or buddy punching benefit from Deputy's photo-capture kiosk option."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and Shift Management",
      "rows": [
        {
          "feature": "Drag-and-drop schedule builder",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Shift swaps and trading",
          "toolA": "available",
          "toolB": "available",
          "note": "Deputy documents this within its leave and shift management flows"
        },
        {
          "feature": "Auto-generated draft schedules",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Deputy Core and Pro tiers only; 7shifts offers forecasting but not auto-generated drafts"
        },
        {
          "feature": "Shift templates and copy-previous-week",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Time and Attendance",
      "rows": [
        {
          "feature": "Mobile time clock",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Tablet kiosk clock-in with photo capture",
          "toolA": "limited",
          "toolB": "available",
          "note": "7shifts supports tablet or POS terminal clock-in but photo capture is not documented"
        },
        {
          "feature": "Automatic timesheet reconciliation against schedule",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Compliance and Labor Cost",
      "rows": [
        {
          "feature": "Overtime and predictive scheduling alerts",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Rest-break and award or union rule violation checks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Real-time labor cost or wage budget tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "7shifts compares scheduled hours to POS sales; Deputy tracks against a set wage budget"
        }
      ]
    },
    {
      "group": "Team Communication and Tasking",
      "rows": [
        {
          "feature": "In-app team messaging",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Shift-level checklists or tasking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Manager shift notes and handoff log",
          "toolA": "available",
          "toolB": "available",
          "note": "Deputy delivers this through its news feed and messaging tool"
        }
      ]
    },
    {
      "group": "Hiring, HR and Payroll",
      "rows": [
        {
          "feature": "Hiring and applicant tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "7shifts feature is gated to higher-tier plans"
        },
        {
          "feature": "Payroll provider integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Deputy names Gusto, QuickBooks, Xero, and ADP; 7shifts offers integrations plus a regional payroll add-on"
        },
        {
          "feature": "Dedicated HR module",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Deputy's HR module is a paid add-on"
        }
      ]
    },
    {
      "group": "Integrations and Platform",
      "rows": [
        {
          "feature": "POS system integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Single sign-on (SSO)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Deputy Pro tier only"
        },
        {
          "feature": "Open API access",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Deputy offers a free trial rather than a permanent free tier"
        },
        {
          "feature": "Minimum monthly account spend",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Applies to Deputy subscriptions per its documented cons"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, 7shifts or Deputy?",
      "answer": "Deputy's Lite plan starts lower at around 5 dollars USD per user per month, while 7shifts' paid plans start around 30 dollars per month per location, but 7shifts also offers a free plan for a single location that Deputy does not match, so the cheaper option depends on staff count versus number of locations."
    },
    {
      "question": "Is 7shifts or Deputy better for restaurants?",
      "answer": "7shifts is purpose-built for restaurants, with tip pooling, POS-linked labor forecasting, and terminology tailored to food service, while Deputy is a more general shift-based workforce tool used across retail, hospitality, and healthcare."
    },
    {
      "question": "Does Deputy have a free plan like 7shifts?",
      "answer": "No, Deputy does not offer a permanent free plan; it provides a free trial on its paid plans, whereas 7shifts has a genuine free tier for a single location with a small team."
    },
    {
      "question": "Can 7shifts auto-generate schedules the way Deputy does?",
      "answer": "Not based on documented features; 7shifts offers labor cost forecasting that compares scheduled hours to POS sales data, but Deputy's auto-scheduling on its Core and Pro tiers goes further by using historical sales or foot-traffic data to auto-generate draft schedules."
    },
    {
      "question": "Which tool has stronger compliance features?",
      "answer": "Deputy's documented compliance tooling is broader, covering rest-break violations, overtime thresholds, and award or union pay-rule conflicts, while 7shifts documents overtime risk flags and predictive scheduling or fair workweek support without confirming break-rule or union award checks."
    },
    {
      "question": "Does 7shifts or Deputy integrate with more payroll systems?",
      "answer": "Deputy documents integrations with Gusto, QuickBooks, Xero, and ADP plus its own US payroll product via Paycor, while 7shifts offers payroll integrations and a regional payroll add-on without naming as many specific providers."
    }
  ]
};

export default _7shiftsVsDeputyContent;

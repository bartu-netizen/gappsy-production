import type { ToolComparisonContent } from './types';

const deputyVsWhenIWorkContent: ToolComparisonContent = {
  "verdict": "Deputy and When I Work are both shift-based workforce management platforms built for hourly, rotating-schedule businesses like retail, hospitality, and healthcare, and on paper their core feature sets overlap heavily: drag-and-drop scheduling, mobile time clocks, shift swapping, team messaging, and payroll integrations. The real differences show up in depth and packaging. Deputy leans toward operationally complex, compliance-heavy environments: it bundles automated break, overtime, and award-rule compliance alerts, tablet kiosk clock-in with photo capture, and demand-based auto-scheduling driven by sales or foot-traffic data on its higher tiers, plus a broader payroll integration list including its own Deputy Payroll product. When I Work starts cheaper per user, ties its auto-scheduler to employee availability and preference matching rather than demand forecasting, and pushes advanced time-clock features into a separate paid add-on rather than a plan tier. Neither company publishes a permanent free plan, both offer trials, and API or SSO access sits behind the top tier of each. Choosing between them comes down to what a manager needs solved first: Deputy for compliance risk and demand-driven staffing at a slightly higher starting cost, When I Work for a lower entry price and simpler self-serve shift coverage. Businesses in regulated labor markets or with variable foot traffic will lean Deputy; smaller, budget-conscious shift-based teams that mainly need clean scheduling and messaging will lean When I Work.",
  "bestForToolA": "Deputy is the better fit for multi-location, shift-based businesses that need automated compliance checks against break, overtime, or award rules, plus demand-driven auto-scheduling and tablet kiosk clock-in with photo verification.",
  "bestForToolB": "When I Work is the better fit for budget-conscious, shift-based teams that want a lower per-user entry price, GPS-verified mobile clock-in, and simple employee self-serve shift swapping without needing built-in labor law compliance alerts.",
  "whoNeedsBoth": "A multi-brand operator or franchise group could end up piloting both if different locations have different needs, for example using Deputy where compliance alerts and demand forecasting matter most, and When I Work at simpler single-location sites where cost per user is the deciding factor.",
  "keyDifferences": [
    {
      "title": "Entry-level pricing",
      "toolA": "Deputy's Lite plan starts from $5 USD per user per month",
      "toolB": "When I Work's Essentials plan starts at $2.50 per user per month",
      "whyItMatters": "For teams paying per hourly worker across dozens or hundreds of staff, a $2.50 versus $5 per-user gap compounds quickly across a payroll cycle",
      "benefitsWho": "Smaller or budget-constrained shift-based teams benefit more from When I Work's lower entry price"
    },
    {
      "title": "Auto-scheduling approach",
      "toolA": "Deputy's auto-scheduling and demand forecasting uses historical sales or foot-traffic data to recommend staffing levels, available on Core and Pro tiers",
      "toolB": "When I Work's Auto-Scheduler matches open shifts to employees based on availability, eligibility, and stated shift preferences",
      "whyItMatters": "Demand-based forecasting suits variable-traffic retail or hospitality locations, while preference-based matching suits teams where staff availability, not customer demand, drives coverage",
      "benefitsWho": "Retailers and restaurants with fluctuating foot traffic benefit from Deputy's demand forecasting, while teams with stable but complex availability constraints benefit from When I Work's preference matching"
    },
    {
      "title": "Compliance alerts",
      "toolA": "Deputy includes automated checks that flag rest-break violations, overtime thresholds, and award or union pay-rule conflicts before a schedule is published",
      "toolB": "When I Work's documented feature set does not include built-in labor law or award-rule compliance alerts",
      "whyItMatters": "Businesses operating under strict break, overtime, or union award rules face real legal and financial risk if a schedule is published without those checks",
      "benefitsWho": "Employers in heavily regulated labor markets or unionized workplaces benefit from Deputy's built-in compliance tooling"
    },
    {
      "title": "Clock-in verification method",
      "toolA": "Deputy offers tablet kiosk clock-in with photo capture to help prevent buddy punching",
      "toolB": "When I Work offers GPS capture and geofencing on its mobile and kiosk time clock to confirm on-site punches",
      "whyItMatters": "The two tools verify attendance in different ways, visual identity confirmation versus location confirmation, which matters depending on whether time theft or off-site clock-ins are the bigger risk",
      "benefitsWho": "Single-location businesses worried about buddy punching benefit from Deputy's photo capture, while mobile or multi-site field teams benefit from When I Work's GPS geofencing"
    },
    {
      "title": "Payroll integration breadth",
      "toolA": "Deputy integrates with Gusto, QuickBooks, Xero, and ADP, and offers its own Deputy Payroll product in the US through a partnership with Paycor",
      "toolB": "When I Work integrates with Gusto, QuickBooks Online, ADP Workforce Now, and Square Payroll, but only once the separate Time Clock and Attendance add-on is enabled",
      "whyItMatters": "Deputy bundles payroll-ready time data into its core plans, while When I Work requires an extra paid add-on before its native payroll integrations are usable",
      "benefitsWho": "Businesses that want payroll integration without extra add-on costs benefit from Deputy, while teams already committed to When I Work's core scheduling can add the Time Clock module only if they need it"
    },
    {
      "title": "Task and checklist management",
      "toolA": "Deputy has a dedicated Tasking feature for assigning checklists and to-do items tied to a specific shift or location, such as opening and closing duties",
      "toolB": "When I Work's documented features do not include a shift-linked task or checklist system",
      "whyItMatters": "Locations that need to track operational duties, not just attendance, gain accountability from a built-in tasking tool instead of a separate app",
      "benefitsWho": "Retail and hospitality managers who need opening and closing checklists benefit from Deputy's Tasking feature"
    },
    {
      "title": "Enterprise access controls",
      "toolA": "Deputy's Pro tier adds custom access levels, location hierarchies, single sign-on, and a sandbox test environment",
      "toolB": "When I Work's Premium tier adds API key access, webhooks, and SAML or SSO for enterprise sign-in",
      "whyItMatters": "Both tools gate enterprise-grade access controls behind their top tier, so the cost of reaching SSO or deeper API access differs between the two pricing ladders",
      "benefitsWho": "IT and security teams evaluating either tool need to budget for the top tier to get SSO, regardless of which product they choose"
    },
    {
      "title": "Add-on cost structure",
      "toolA": "Deputy's add-ons such as Messaging+, Analytics+, and its HR module raise the effective per-user cost, and a minimum monthly account spend applies",
      "toolB": "When I Work's Time Clock and Attendance functionality is a separate paid add-on with pricing available on request rather than published upfront",
      "whyItMatters": "Both platforms' advertised per-user prices do not represent the full cost for teams that need add-on modules, which can change the total cost comparison significantly",
      "benefitsWho": "Buyers comparing total cost of ownership need quotes for add-ons from both vendors rather than relying on the base per-user price alone"
    },
    {
      "title": "Team communication style",
      "toolA": "Deputy combines a company news feed with staff-to-staff messaging so managers can post shift notes and announcements alongside individual chat",
      "toolB": "When I Work combines one-to-one and group messaging with shift reminders and announcements inside the same scheduling app",
      "whyItMatters": "The way updates reach staff, feed-style broadcast versus direct group messaging, affects how visible shift notes are to an entire team versus specific groups",
      "benefitsWho": "Managers who want a persistent company-wide feed benefit from Deputy's news feed style, while managers who lean on group chats benefit from When I Work's messaging structure"
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
          "feature": "Shift templates and copy previous week",
          "toolA": "available",
          "toolB": "available",
          "note": "Deputy offers copy-previous-week; When I Work offers reusable shift templates"
        },
        {
          "feature": "Auto-scheduling or demand forecasting",
          "toolA": "available",
          "toolB": "available",
          "note": "Deputy's version is available on Core and Pro tiers and is demand data driven; When I Work matches shifts to availability and preferences"
        },
        {
          "feature": "Shift swapping and open shift claiming",
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
          "feature": "Mobile clock-in",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Kiosk clock-in",
          "toolA": "available",
          "toolB": "available",
          "note": "Deputy kiosk uses photo capture; When I Work kiosk uses GPS geofencing"
        },
        {
          "feature": "GPS geofencing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Timesheet auto-approval",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Deputy offers this on the Core tier"
        }
      ]
    },
    {
      "group": "Task and Team Communication",
      "rows": [
        {
          "feature": "Shift-linked task or checklist management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Deputy's Tasking feature"
        },
        {
          "feature": "In-app team messaging",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Company-wide news feed or announcements",
          "toolA": "available",
          "toolB": "available",
          "note": "Deputy uses a news feed; When I Work uses announcements and shift reminders"
        }
      ]
    },
    {
      "group": "Leave and Availability Management",
      "rows": [
        {
          "feature": "Time-off requests and approval",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Employee availability submission within the app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Deputy's scheduling factors in staff availability but does not detail a staff-facing availability submission tool"
        }
      ]
    },
    {
      "group": "Labor Cost and Compliance",
      "rows": [
        {
          "feature": "Labor cost or wage budgeting",
          "toolA": "available",
          "toolB": "available",
          "note": "When I Work's forecasting is on Pro and Premium tiers"
        },
        {
          "feature": "Compliance alerts for breaks, overtime, or award rules",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Custom reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "When I Work offers custom reports on Pro and Premium tiers; Deputy's plans mention only basic reporting"
        }
      ]
    },
    {
      "group": "Payroll and HR Integrations",
      "rows": [
        {
          "feature": "Native payroll provider integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "When I Work requires enabling the separate Time Clock and Attendance add-on"
        },
        {
          "feature": "Vendor's own payroll product",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Deputy Payroll is delivered in the US through a partnership with Paycor"
        },
        {
          "feature": "Dedicated HR system integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Platform and Enterprise Access",
      "rows": [
        {
          "feature": "iOS and Android mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "When I Work's API access is on the Premium tier"
        },
        {
          "feature": "Single sign-on",
          "toolA": "available",
          "toolB": "available",
          "note": "Deputy on the Pro tier; When I Work SAML or SSO on the Premium tier"
        },
        {
          "feature": "Sandbox or test environment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Deputy offers this on the Pro tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Deputy or When I Work cheaper?",
      "answer": "When I Work is cheaper at the entry level, starting at $2.50 per user per month on its Essentials plan compared to Deputy's Lite plan starting from $5 USD per user per month, though Deputy's minimum monthly account spend and When I Work's separate Time Clock and Attendance add-on can change the real cost for a given team."
    },
    {
      "question": "Does Deputy have built-in labor law compliance alerts?",
      "answer": "Yes, Deputy includes automated checks that flag rest-break violations, overtime thresholds, and award or union pay-rule conflicts before a schedule is published; this compliance alerting is not documented as a feature of When I Work."
    },
    {
      "question": "Can When I Work do demand-based auto-scheduling like Deputy?",
      "answer": "Not in the same way. When I Work's Auto-Scheduler matches open shifts to employees based on availability, eligibility, and stated preferences, while Deputy's auto-scheduling and demand forecasting on its Core and Pro tiers uses historical sales or foot-traffic data to recommend staffing levels."
    },
    {
      "question": "Which tool is better for a small shift-based business just getting started?",
      "answer": "When I Work's lower $2.50 per user Essentials plan and transparent per-user pricing make it an easier entry point for a small, single-location shift-based team, while Deputy's Lite plan and minimum monthly account spend suit teams that also want compliance alerts and payroll integrations from the start."
    },
    {
      "question": "Do Deputy and When I Work both integrate with payroll software?",
      "answer": "Yes. Deputy integrates with Gusto, QuickBooks, Xero, and ADP, and also offers Deputy Payroll in the US through a partnership with Paycor, while When I Work integrates with Gusto, QuickBooks Online, ADP Workforce Now, and Square Payroll once its separate Time Clock and Attendance add-on is enabled."
    },
    {
      "question": "Which has a mobile app, Deputy or When I Work?",
      "answer": "Both do. Deputy has iOS and Android apps for viewing schedules, clocking in, requesting shift swaps or leave, and receiving shift notes, and When I Work has native iOS and Android apps covering scheduling, time tracking, and messaging."
    }
  ]
};

export default deputyVsWhenIWorkContent;

import type { ToolComparisonContent } from './types';

const hubstaffVsTimeDoctorContent: ToolComparisonContent = {
  "verdict": "Hubstaff and Time Doctor both track hours, capture screenshots, and log keyboard and mouse activity, but they are built around different jobs. Hubstaff leans toward operational workforce management: GPS and geofencing for field or mobile staff, project time and cost budgeting, employee scheduling, and automated payroll and invoicing tied directly to approved hours, plus a genuinely free single-user plan for freelancers testing the waters. Time Doctor leans toward productivity and compliance oversight for desk-based remote teams: it classifies time spent in specific apps and websites as productive or unproductive, rolls activity into productivity scores, and adds AI-driven anomaly detection to flag things like mouse jigglers, alongside client login access for agencies that bill by the hour. Time Doctor has no permanent free tier, only a 14-day trial, while Hubstaff's paid plans start slightly lower per seat. Neither tool documents the other's specialty area in the source data - Time Doctor does not document GPS tracking, and Hubstaff does not document app and website productivity classification - so the right choice depends on whether a team needs to manage where and how field work happens or needs to understand how desk time is actually spent across applications.",
  "bestForToolA": "Hubstaff is the better fit for field service, construction, or mobile workforces that need GPS-based clock-in and out, project budgeting, and built-in payroll and client invoicing, especially teams that want a free option to start.",
  "bestForToolB": "Time Doctor is the better fit for remote-first companies and outsourcing or BPO agencies that want granular productivity scoring, app and website usage classification, AI-based anomaly detection, and client-facing login access.",
  "whoNeedsBoth": "Agencies managing both office-based knowledge workers and field or mobile staff, or teams weighing monitoring depth against location tracking, may run both tools during a trial period before standardizing on one per team type.",
  "keyDifferences": [
    {
      "title": "Free plan availability",
      "toolA": "Hubstaff offers a permanent free plan limited to one user with basic time tracking",
      "toolB": "Time Doctor has no permanent free plan, only a 14-day free trial of the Premium plan",
      "whyItMatters": "Solo freelancers or very small teams can use Hubstaff indefinitely at no cost, while Time Doctor requires a paid plan after the trial ends",
      "benefitsWho": "Freelancers and single-user testers benefit from Hubstaff's free tier"
    },
    {
      "title": "Entry-level pricing",
      "toolA": "Hubstaff paid plans start at 4.99 dollars per user per month billed annually",
      "toolB": "Time Doctor starts at 6.67 dollars per user per month billed annually",
      "whyItMatters": "Lower per-seat pricing compounds quickly for teams paying by headcount",
      "benefitsWho": "Budget-conscious small and mid-size teams benefit from Hubstaff's lower entry price"
    },
    {
      "title": "GPS and geofencing",
      "toolA": "Hubstaff documents GPS tracking and geofencing with automatic clock-in and clock-out at job sites",
      "toolB": "Time Doctor's documented features do not mention GPS or geofencing",
      "whyItMatters": "Field and mobile teams need location-based attendance verification that desk-only tools do not offer",
      "benefitsWho": "Construction, field service, and delivery teams benefit from Hubstaff's location features"
    },
    {
      "title": "App and website productivity classification",
      "toolA": "Hubstaff's documented features do not mention classifying specific apps or websites as productive or unproductive",
      "toolB": "Time Doctor classifies time in specific applications and websites as productive, unproductive, or neutral",
      "whyItMatters": "Teams that want a granular breakdown of where computer time actually goes need this level of categorization",
      "benefitsWho": "Managers of desk-based remote teams benefit from Time Doctor's usage classification"
    },
    {
      "title": "AI-powered anomaly detection",
      "toolA": "Hubstaff's documented features do not include AI-based anomaly or unusual activity detection",
      "toolB": "Time Doctor offers Benchmarks AI and Unusual Activity detection to flag things like mouse jigglers or irregular keyboard patterns",
      "whyItMatters": "Detecting monitoring workarounds matters more for organizations enforcing strict productivity compliance",
      "benefitsWho": "Compliance-focused managers and BPO or outsourcing firms benefit from Time Doctor's AI reports"
    },
    {
      "title": "Client login access",
      "toolA": "Hubstaff's documented features do not include a dedicated client login portal, though it supports generating client invoices from tracked time",
      "toolB": "Time Doctor offers client login access so external clients can review time logs and reports without full account access",
      "whyItMatters": "Agencies that bill hourly often need to give clients visibility without exposing the whole account",
      "benefitsWho": "Agencies and outsourcing firms benefit from Time Doctor's client login, while Hubstaff instead streamlines the billing step through invoicing"
    },
    {
      "title": "Documented integrations breadth",
      "toolA": "Hubstaff documents integrations with project management, accounting, and communication tools plus a custom API, without a specific count",
      "toolB": "Time Doctor documents more than 60 integrations including Asana, Trello, Slack, and QuickBooks, plus an open API on higher tiers",
      "whyItMatters": "A larger documented integration catalog can reduce setup friction for teams with an established tool stack",
      "benefitsWho": "Teams standardized on many third-party tools benefit from Time Doctor's broader documented integration count"
    },
    {
      "title": "Enterprise pricing structure",
      "toolA": "Hubstaff's Enterprise plan has a fixed published price of 25 dollars per user per month, billed annually only",
      "toolB": "Time Doctor's Enterprise plan uses custom pricing with private cloud deployment and guided implementation",
      "whyItMatters": "Fixed pricing is easier to budget for, while custom pricing suits organizations with nonstandard deployment or compliance needs",
      "benefitsWho": "Predictable-budget buyers benefit from Hubstaff's fixed Enterprise rate, while larger organizations needing private cloud benefit from Time Doctor's custom Enterprise plan"
    },
    {
      "title": "Core positioning",
      "toolA": "Hubstaff combines time tracking with field workforce management: GPS, scheduling, project budgeting, payroll, and invoicing",
      "toolB": "Time Doctor combines time tracking with desk-based productivity analytics: usage classification, productivity ratings, and AI-driven monitoring",
      "whyItMatters": "The two tools are optimized for different oversight problems even though both track hours and take screenshots",
      "benefitsWho": "Field and operations-heavy teams lean toward Hubstaff, while remote knowledge-work teams focused on productivity insight lean toward Time Doctor"
    },
    {
      "title": "Desktop operating system coverage",
      "toolA": "Hubstaff provides desktop apps for Windows, Mac, and Linux plus a browser extension",
      "toolB": "Time Doctor provides desktop apps for Windows and Mac and a web dashboard, with no Linux app documented",
      "whyItMatters": "Organizations with Linux-based developer or engineering workstations need native desktop support to track time without workarounds",
      "benefitsWho": "Teams with Linux users benefit from Hubstaff's broader desktop OS coverage"
    }
  ],
  "featureMatrix": [
    {
      "group": "Time Tracking Core",
      "rows": [
        {
          "feature": "Manual or automatic timers",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Idle detection and reminders",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Online and offline tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Listed on Time Doctor's Basic plan"
        }
      ]
    },
    {
      "group": "Monitoring and Activity",
      "rows": [
        {
          "feature": "Screenshot capture",
          "toolA": "available",
          "toolB": "available",
          "note": "Configurable frequency on both"
        },
        {
          "feature": "Keyboard and mouse activity levels",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "App and website productivity classification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Time Doctor tags apps and sites as productive, unproductive, or neutral"
        },
        {
          "feature": "Video screen recording",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Time Doctor Premium plan"
        },
        {
          "feature": "AI anomaly or unusual activity detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Time Doctor Premium plan Benchmarks AI and Unusual Activity report"
        }
      ]
    },
    {
      "group": "Location and Field Work",
      "rows": [
        {
          "feature": "GPS location tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Geofenced automatic clock-in and clock-out",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Payroll and Billing",
      "rows": [
        {
          "feature": "Automated payroll based on tracked hours",
          "toolA": "available",
          "toolB": "available",
          "note": "Hubstaff Enterprise plan; Time Doctor Standard plan and up"
        },
        {
          "feature": "Client invoicing from tracked time",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Client login or portal access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Time Doctor Premium plan"
        }
      ]
    },
    {
      "group": "Scheduling and Attendance",
      "rows": [
        {
          "feature": "Employee shift scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": "Hubstaff Team plan; Time Doctor Standard plan"
        },
        {
          "feature": "Attendance and leave tracking",
          "toolA": "limited",
          "toolB": "available",
          "note": "Hubstaff monitors attendance against schedules; Time Doctor explicitly adds leave tracking"
        },
        {
          "feature": "Time approvals workflow",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Time Doctor Standard plan"
        }
      ]
    },
    {
      "group": "Project Management",
      "rows": [
        {
          "feature": "Project and task tracking",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Project time or cost budgeting with alerts",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Integrations and Extensibility",
      "rows": [
        {
          "feature": "Third-party app integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Time Doctor documents 60 plus named integrations; Hubstaff documents integrations without a specific count"
        },
        {
          "feature": "Open API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Time Doctor's API is on higher-tier plans"
        },
        {
          "feature": "Single sign-on and automatic provisioning",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Time Doctor Premium plan"
        }
      ]
    },
    {
      "group": "Platform Availability",
      "rows": [
        {
          "feature": "Windows and Mac desktop apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Linux desktop app",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "iOS and Android mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Web dashboard or browser extension",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Hubstaff free plan limited to one user"
        },
        {
          "feature": "Free trial of paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Time Doctor offers a documented 14-day trial"
        },
        {
          "feature": "Custom enterprise pricing",
          "toolA": "limited",
          "toolB": "available",
          "note": "Hubstaff Enterprise has a fixed published rate rather than a custom quote"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Hubstaff or Time Doctor?",
      "answer": "Hubstaff is cheaper at the entry level, with paid plans starting at 4.99 dollars per user per month versus Time Doctor's 6.67 dollars per user per month, and Hubstaff also offers a permanent free plan for a single user that Time Doctor does not have."
    },
    {
      "question": "Does Hubstaff or Time Doctor have a free plan?",
      "answer": "Hubstaff has a permanent free plan limited to one user with basic time tracking, while Time Doctor offers only a 14-day free trial and requires a paid subscription after that."
    },
    {
      "question": "Which is better for field teams that need GPS tracking?",
      "answer": "Hubstaff is the better documented option for field teams, since it explicitly supports GPS location tracking and geofencing for automatic clock-in and clock-out, features that are not documented for Time Doctor."
    },
    {
      "question": "Which tool has more integrations?",
      "answer": "Time Doctor documents more than 60 named integrations with tools like Asana, Trello, Slack, and QuickBooks, while Hubstaff documents integrations and an API without publishing a specific count."
    },
    {
      "question": "Can both Hubstaff and Time Doctor calculate payroll automatically?",
      "answer": "Yes, both tools support automated payroll based on approved tracked hours, though Hubstaff includes it on its Enterprise plan while Time Doctor includes it starting on its Standard plan."
    },
    {
      "question": "Which tool is better for agencies that bill clients by the hour?",
      "answer": "Time Doctor offers dedicated client login access so external clients can review time logs and reports directly, while Hubstaff instead lets teams generate client invoices directly from tracked billable time."
    }
  ]
};

export default hubstaffVsTimeDoctorContent;

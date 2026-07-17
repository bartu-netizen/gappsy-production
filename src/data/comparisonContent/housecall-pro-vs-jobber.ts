import type { ToolComparisonContent } from './types';

const housecallProVsJobberContent: ToolComparisonContent = {
  "verdict": "Housecall Pro and Jobber both target home service businesses that need scheduling, quoting, invoicing, and payments in one platform, and on paper their core workflows overlap heavily. The real difference is emphasis and entry cost. Housecall Pro leans into an all-in-one operations hub, pairing dispatch with GPS technician tracking, built-in marketing automation, and an open API on its top MAX tier for businesses that want to build custom integrations. Jobber leans into the customer-facing side of the job lifecycle, with a self-serve Client hub portal, dedicated route optimization, and Grow and Plus tier features like two-way texting, job costing, and advanced automation and AI tools. Jobber also has a meaningfully lower entry price, with its Core plan starting near 29 to 39 dollars a month versus Housecall Pro Basic at 59 dollars a month. Neither tool is a clear universal winner. A solo operator watching every dollar and wanting a polished customer portal will likely find Jobber more approachable at entry. A growing team that wants live GPS visibility into crews, deeper marketing automation, and eventual API access will lean toward Housecall Pro, especially on its MAX plan. Buyers should map their must-have features, such as job costing, two-way texting, or open API access, against the specific plan tier that unlocks them, since both platforms gate meaningful functionality behind higher-priced tiers.",
  "bestForToolA": "Housecall Pro fits home service teams that want an all-in-one hub with real-time GPS technician tracking, built-in marketing automation, and eventual open API access as they scale into the MAX tier.",
  "bestForToolB": "Jobber fits home service businesses, including solo operators, that want a lower entry price, a self-serve client portal for quotes and invoices, and dedicated route optimization for crews with multiple daily stops.",
  "whoNeedsBoth": "Businesses in the middle of migrating between platforms, or multi-location franchise groups where different locations standardized on different tools, may reasonably run both while evaluating which one to consolidate on long term.",
  "keyDifferences": [
    {
      "title": "Entry level pricing",
      "toolA": "Housecall Pro Basic starts at 59 dollars a month billed annually",
      "toolB": "Jobber Core starts from 29 dollars a month billed annually, or 39 dollars a month billed monthly",
      "whyItMatters": "For very small operations, the difference in entry price can be a meaningful share of monthly overhead",
      "benefitsWho": "Budget conscious solo operators and small teams considering Jobber Core"
    },
    {
      "title": "Company origin and age",
      "toolA": "Housecall Pro was founded in 2013 and is headquartered in Denver, Colorado",
      "toolB": "Jobber was founded in 2011 and is headquartered in Edmonton, Alberta, Canada",
      "whyItMatters": "Jobber has a slightly longer operating history in the field service software space, which some buyers weight when assessing platform maturity",
      "benefitsWho": "Buyers who factor company tenure into vendor risk assessment"
    },
    {
      "title": "Core workflow emphasis",
      "toolA": "Housecall Pro is built around an all-in-one operations hub combining dispatch, CRM, and marketing automation",
      "toolB": "Jobber is built around the quote-to-invoice lifecycle with a dedicated self-serve Client hub portal",
      "whyItMatters": "Teams that want customers to self-serve on quotes and invoices may prefer a dedicated portal, while teams that want internal visibility across revenue and technician performance may prefer a unified back-office hub",
      "benefitsWho": "Customer-facing teams lean toward Jobber, internally focused operations teams lean toward Housecall Pro"
    },
    {
      "title": "Open API access",
      "toolA": "Housecall Pro documents open API access as part of its top-tier MAX plan",
      "toolB": "Jobber's documented facts do not confirm open API access on any tier",
      "whyItMatters": "Businesses that want to build custom integrations with internal systems need confirmed API access before committing",
      "benefitsWho": "Larger operations on Housecall Pro MAX that need custom integration work"
    },
    {
      "title": "Route optimization",
      "toolA": "Housecall Pro's documented facts do not mention a dedicated route optimization feature",
      "toolB": "Jobber documents a specific route optimization feature that suggests efficient driving order between jobs",
      "whyItMatters": "Crews running many stops per day can reduce drive time and fuel cost with dedicated route planning",
      "benefitsWho": "Multi-stop field crews using Jobber"
    },
    {
      "title": "Real-time GPS technician tracking",
      "toolA": "Housecall Pro documents real-time GPS tracking of technician location and routes",
      "toolB": "Jobber's documented facts do not mention GPS technician tracking specifically",
      "whyItMatters": "Live location visibility helps dispatchers make faster reassignment decisions and gives customers accurate arrival estimates",
      "benefitsWho": "Dispatch-heavy teams using Housecall Pro"
    },
    {
      "title": "Advanced automation and AI tools",
      "toolA": "Housecall Pro's documented facts do not mention AI-specific features",
      "toolB": "Jobber's top Plus tier documents advanced automation and AI tools",
      "whyItMatters": "Larger teams looking to automate repetitive workflows at scale may value AI-assisted tooling",
      "benefitsWho": "Larger teams on Jobber Plus"
    },
    {
      "title": "Top-tier pricing ceiling",
      "toolA": "Housecall Pro's MAX plan tops out at 299 dollars a month for up to 8 users",
      "toolB": "Jobber's Plus plan reaches 599 dollars a month for a 15-user team",
      "whyItMatters": "Total cost at scale differs significantly depending on team size and which platform's top tier a business grows into",
      "benefitsWho": "Growing teams comparing long-term subscription cost"
    },
    {
      "title": "Two-way texting and job costing",
      "toolA": "Housecall Pro's documented facts do not confirm two-way texting or job costing as named features",
      "toolB": "Jobber documents two-way texting and job costing as Grow-tier and higher features",
      "whyItMatters": "Teams that want integrated client texting and per-job profitability tracking need to confirm these exist before switching",
      "benefitsWho": "Jobber Grow and Plus customers"
    },
    {
      "title": "Client self-serve portal",
      "toolA": "Housecall Pro documents centralized customer profiles and CRM for internal team visibility, but does not document a self-serve customer portal",
      "toolB": "Jobber documents a dedicated Client hub where customers can view quotes, invoices, appointment requests, and payment history themselves",
      "whyItMatters": "A self-serve portal can reduce inbound phone and email volume for approvals and payment status questions",
      "benefitsWho": "Businesses using Jobber that want to cut down on manual customer follow-up"
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and dispatch",
      "rows": [
        {
          "feature": "Drag-and-drop calendar scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Recurring job support for maintenance contracts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Route optimization between jobs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Customer acquisition and marketing",
      "rows": [
        {
          "feature": "Customer-facing online booking widget",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated marketing campaigns and review requests",
          "toolA": "available",
          "toolB": "available",
          "note": "Jobber lists these as optional marketing add-ons rather than core features"
        }
      ]
    },
    {
      "group": "Quoting and invoicing",
      "rows": [
        {
          "feature": "Estimates or quotes with digital customer approval",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Digital signature capture",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automatic invoice generation from completed jobs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Housecall Pro documents manual invoice creation from office or field, not automatic generation specifically"
        }
      ]
    },
    {
      "group": "Payments",
      "rows": [
        {
          "feature": "Online and on-site card payment collection",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated payment reminders",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Field operations",
      "rows": [
        {
          "feature": "Mobile app for technicians",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Real-time GPS technician tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Photo capture from the field",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "CRM and client communication",
      "rows": [
        {
          "feature": "Centralized customer profiles and job history",
          "toolA": "available",
          "toolB": "limited",
          "note": "Jobber's Client hub covers quotes, invoices, and appointment history rather than a named CRM feature"
        },
        {
          "feature": "Self-serve client portal",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jobber's Client hub"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "QuickBooks Online two-way sync",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Zapier integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Housecall Pro Essentials tier and above"
        },
        {
          "feature": "Open API access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Housecall Pro MAX tier"
        }
      ]
    },
    {
      "group": "Reporting and analytics",
      "rows": [
        {
          "feature": "Revenue and team performance dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Job costing reports",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jobber Grow tier and above"
        }
      ]
    },
    {
      "group": "Advanced automation",
      "rows": [
        {
          "feature": "Two-way texting with customers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jobber Grow tier and above"
        },
        {
          "feature": "AI-assisted automation tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jobber Plus tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Housecall Pro or Jobber?",
      "answer": "Jobber has the lower documented entry price, with its Core plan starting from 29 dollars a month billed annually or 39 dollars a month billed monthly, compared to Housecall Pro's Basic plan starting at 59 dollars a month billed annually."
    },
    {
      "question": "Is Jobber a good fit for a solo or single-technician business?",
      "answer": "Yes, Jobber's Core plan is built for a single user and covers quoting, scheduling, invoicing, and the Client hub at a lower starting price than Housecall Pro's equivalent single-user Basic plan."
    },
    {
      "question": "Does Housecall Pro or Jobber have route optimization?",
      "answer": "Jobber documents a dedicated route optimization feature that suggests efficient driving order between scheduled jobs; Housecall Pro's documented facts do not mention this specific feature, though it does offer GPS tracking of technician location and routes."
    },
    {
      "question": "Can Housecall Pro do what Jobber does?",
      "answer": "Housecall Pro covers the same core workflow as Jobber, including scheduling, dispatch, estimates and invoicing, online payments, and QuickBooks integration, but the documented facts do not confirm Housecall Pro has route optimization, two-way texting, or job costing, all of which Jobber documents on its higher tiers."
    },
    {
      "question": "Which platform has open API access?",
      "answer": "Housecall Pro documents open API access on its top-tier MAX plan; Jobber's provided facts do not confirm open API access on any tier."
    },
    {
      "question": "Do both Housecall Pro and Jobber integrate with QuickBooks?",
      "answer": "Yes, both tools document a two-way integration with QuickBooks Online to keep invoicing, payments, and customer records aligned with company bookkeeping."
    }
  ]
};

export default housecallProVsJobberContent;

import type { ToolComparisonContent } from './types';

const housecallProVsServicetitanContent: ToolComparisonContent = {
  "verdict": "Housecall Pro and ServiceTitan both run scheduling, dispatch, invoicing, and payments for field service businesses, but they are built for different stages of company growth. Housecall Pro publishes transparent tiered pricing starting at 59 dollars a month, offers a free trial, and packages an all-in-one toolkit, including QuickBooks sync and Zapier, that a solo technician or small crew can turn on quickly without a sales process. ServiceTitan does not publish pricing at all, requires a custom quote and contract, and is described as having a steeper learning curve and real implementation investment, which points to a platform designed for established multi-technician operations rather than a single-truck business. ServiceTitan also documents deeper trades-specific tooling, such as a dynamic flat-rate pricebook technicians present in the field, customer financing options, multi-location and franchise reporting, and AI-assisted call and dispatch workflows, none of which are documented features of Housecall Pro. Housecall Pro, in turn, documents its own strengths ServiceTitan does not, notably two-way QuickBooks Online sync, an online self-service booking widget, and GPS technician tracking. Neither tool is a strict upgrade of the other; the right choice depends on company size, budget certainty, and whether the business needs enterprise-grade multi-location tooling or a fast, self-serve setup.",
  "bestForToolA": "Housecall Pro fits solo operators, small crews, and growing home service businesses that want transparent pricing, a fast self-serve setup, and an all-in-one toolkit without a sales negotiation.",
  "bestForToolB": "ServiceTitan fits established, multi-technician or multi-location trades businesses that need deep dispatch tooling, in-field pricing presentation, financing options, and franchise-level reporting, and that have the budget and staff to support a custom implementation.",
  "whoNeedsBoth": "A franchise group or growing multi-location operator might run ServiceTitan at the enterprise level for dispatch and reporting while a smaller acquired branch or a single-technician satellite crew continues on Housecall Pro until it is folded into the larger system.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Published tiered pricing starting at 59 dollars per month billed annually, with Essentials and MAX tiers clearly listed",
      "toolB": "Custom, quote-based Enterprise pricing with no published rate card",
      "whyItMatters": "Buyers who need to budget quickly or compare costs without a sales call benefit from a published price list",
      "benefitsWho": "Small businesses and budget-conscious owners favor Housecall Pro; larger buyers used to procurement processes are less affected by ServiceTitan lack of published pricing"
    },
    {
      "title": "Free trial availability",
      "toolA": "Offers a free trial period to test scheduling, invoicing, and payment features before subscribing",
      "toolB": "Does not advertise a free trial or free plan; access starts with a demo and sales quote",
      "whyItMatters": "A free trial lowers the barrier to evaluating the software without committing time to a sales process",
      "benefitsWho": "Solo operators and small teams that want to self-evaluate benefit from Housecall Pro trial access"
    },
    {
      "title": "Target business size",
      "toolA": "Plans scale from a single user on Basic up to 8 users on MAX",
      "toolB": "Positioned for established companies with multiple technicians and administrative staff, described as more than solo operators typically need",
      "whyItMatters": "Choosing a tool sized for the business avoids paying for unused capability or outgrowing the platform too quickly",
      "benefitsWho": "Solo and small-crew trades businesses fit Housecall Pro user tiers; larger, staffed operations fit ServiceTitan scale"
    },
    {
      "title": "In-field pricing presentation",
      "toolA": "Not documented as offering a dedicated flat-rate pricebook presentation tool",
      "toolB": "Dynamic pricebook lets technicians present flat-rate pricing for repairs, replacements, and add-ons directly to the customer on-site",
      "whyItMatters": "A structured in-field pricebook can help technicians close larger tickets consistently during the same visit",
      "benefitsWho": "Trades businesses focused on maximizing average ticket size and upsells benefit from ServiceTitan pricebook"
    },
    {
      "title": "Customer financing",
      "toolA": "Not documented as offering built-in customer financing options",
      "toolB": "Integrated financing options let customers split the cost of larger jobs",
      "whyItMatters": "Financing can help close bigger jobs, such as full system replacements, that customers might otherwise decline",
      "benefitsWho": "Businesses that regularly sell large-ticket replacements benefit from ServiceTitan financing integration"
    },
    {
      "title": "Multi-location and franchise management",
      "toolA": "Not documented as offering dedicated multi-location or franchise-level account management",
      "toolB": "Franchise groups and multi-branch operators can view and manage scheduling, reporting, and performance across locations from one account",
      "whyItMatters": "Operators running more than one branch need centralized visibility rather than juggling separate accounts",
      "benefitsWho": "Franchise groups and multi-branch trades companies benefit from ServiceTitan multi-location tools"
    },
    {
      "title": "AI-assisted workflows",
      "toolA": "Not documented as offering AI-assisted call summarization or dispatch suggestions",
      "toolB": "AI-driven features assist with tasks such as call summarization and dispatch suggestions to reduce manual administrative work",
      "whyItMatters": "AI assistance can cut administrative time spent on call notes and dispatch decisions in a busy call center",
      "benefitsWho": "Businesses running a dedicated call center or high call volume benefit from ServiceTitan AI features"
    },
    {
      "title": "QuickBooks Online integration",
      "toolA": "Two-way sync with QuickBooks Online keeps invoices, payments, and customer records aligned with bookkeeping",
      "toolB": "Not documented as offering a QuickBooks Online integration",
      "whyItMatters": "A direct bookkeeping sync avoids manual re-entry of invoices and payments into accounting software",
      "benefitsWho": "Small and mid-sized businesses using QuickBooks Online for accounting benefit from Housecall Pro two-way sync"
    },
    {
      "title": "Online self-service booking",
      "toolA": "A customer-facing booking widget lets clients request and schedule appointments directly",
      "toolB": "Not documented; call booking is described as call-center driven with scripts for staff rather than a self-service customer widget",
      "whyItMatters": "Self-service booking reduces inbound phone volume and lets customers schedule outside business hours",
      "benefitsWho": "Businesses wanting to cut down phone-based scheduling load benefit from Housecall Pro online booking widget"
    },
    {
      "title": "Onboarding and learning curve",
      "toolA": "Positioned as an all-in-one platform meant to be usable without extensive setup",
      "toolB": "Described as having a steep learning curve given platform breadth, with structured onboarding and implementation support from an established vendor",
      "whyItMatters": "Implementation time and training investment affect how quickly a team becomes productive on new software",
      "benefitsWho": "Teams wanting a fast, low-friction setup favor Housecall Pro; teams able to invest in structured onboarding get more from ServiceTitan depth"
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and Dispatch",
      "rows": [
        {
          "feature": "Visual dispatch board or calendar",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Online self-service booking widget",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ServiceTitan facts describe call-center booking scripts rather than a customer-facing widget"
        },
        {
          "feature": "GPS technician tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "CRM and Customer Management",
      "rows": [
        {
          "feature": "Centralized customer profiles and history",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Call center booking scripts for staff",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Invoicing, Payments, and Financing",
      "rows": [
        {
          "feature": "Estimates and invoicing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Onsite and online payment collection",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Built-in customer financing for larger jobs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Field Technician Tools",
      "rows": [
        {
          "feature": "Mobile app for technicians",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "In-field dynamic flat-rate pricebook",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Marketing",
      "rows": [
        {
          "feature": "Automated marketing campaigns",
          "toolA": "available",
          "toolB": "available",
          "note": "Housecall Pro documents review requests, email, and postcard campaigns; ServiceTitan documents campaign tracking and reputation management"
        },
        {
          "feature": "Marketing return-on-investment reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Reporting and Multi-Location Management",
      "rows": [
        {
          "feature": "Revenue and technician performance dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multi-location or franchise reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Integrations and API Access",
      "rows": [
        {
          "feature": "QuickBooks Online two-way sync",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Open API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Housecall Pro reserves this for the MAX plan; ServiceTitan lists API among its documented tags"
        },
        {
          "feature": "Zapier integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Housecall Pro Essentials tier and above"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI-assisted call summarization and dispatch suggestions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Housecall Pro or ServiceTitan?",
      "answer": "Housecall Pro is the cheaper and more predictable option on paper, with published plans starting at 59 dollars per month billed annually, while ServiceTitan uses custom, quote-based Enterprise pricing that is not published and depends on technician count, modules, and contract terms."
    },
    {
      "question": "Is Housecall Pro good for a small or solo home service business?",
      "answer": "Yes, Housecall Pro is built to scale from a single user on its Basic plan up to eight users on MAX, making it a fit for solo operators and small crews, whereas ServiceTitan is generally aimed at established companies with multiple technicians and administrative staff."
    },
    {
      "question": "Can ServiceTitan do everything Housecall Pro does?",
      "answer": "Not exactly; ServiceTitan documents deeper trades-specific tools like a dynamic pricebook, customer financing, and multi-location management, but the provided facts do not confirm it offers Housecall Pro documented QuickBooks Online two-way sync or a customer-facing online booking widget."
    },
    {
      "question": "Which tool has AI features?",
      "answer": "ServiceTitan documents AI-assisted workflows, including call summarization and dispatch suggestions, while Housecall Pro provided facts do not document any AI-specific features."
    },
    {
      "question": "Does either tool integrate with QuickBooks?",
      "answer": "Housecall Pro documents a two-way integration with QuickBooks Online for syncing invoices, payments, and customer records; ServiceTitan provided facts do not document a QuickBooks integration."
    },
    {
      "question": "Which is easier to set up, Housecall Pro or ServiceTitan?",
      "answer": "Housecall Pro is positioned as a faster, self-serve setup with a free trial and no sales process required, while ServiceTitan is described as having a steeper learning curve and requiring real time investment in setup, training, and configuration alongside structured vendor onboarding."
    }
  ]
};

export default housecallProVsServicetitanContent;

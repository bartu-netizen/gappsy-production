import type { ToolComparisonContent } from './types';

const salesforceServiceCloudVsServicenowContent: ToolComparisonContent = {
  "verdict": "Salesforce Service Cloud and ServiceNow solve overlapping but distinct problems. Service Cloud is a customer service extension of the Salesforce CRM, built around cases, omnichannel routing, a knowledge base, and Einstein and Agentforce AI, with the advantage of sharing one data model with Sales Cloud and Marketing Cloud. It publishes tiered per-user pricing starting at 25 dollars per user per month and offers a free trial, making the entry point comparatively transparent. ServiceNow is a broader enterprise workflow platform whose documented strengths are IT Service Management, IT Operations Management, HR Service Delivery, and Security Operations, tied together with Now Assist generative AI and a low-code App Engine for custom applications. It has no published pricing or self-serve trial, and every deployment is quoted and implemented as a custom project. A team choosing between them should ask what job needs solving first: if the priority is unifying customer support with sales and marketing data, Service Cloud fits that brief directly. If the priority is standardizing IT incidents, employee HR requests, security response, and custom internal workflows on one platform, ServiceNow is the documented fit. Neither tool's provided facts show it replacing the other's core specialty, so the right choice depends on which department is buying and what workflows already exist around it.",
  "bestForToolA": "Salesforce Service Cloud is the better fit for customer support teams that already run on Salesforce and want case management, omnichannel routing, and AI-assisted resolution unified with their sales and marketing data.",
  "bestForToolB": "ServiceNow is the better fit for IT, HR, and security organizations that need a single configurable workflow platform spanning incident management, infrastructure operations, employee services, and custom low-code applications.",
  "whoNeedsBoth": "A large enterprise commonly ends up running both: ServiceNow for internal IT, HR, and security workflows, and Salesforce Service Cloud for customer-facing case management tied to the sales pipeline.",
  "keyDifferences": [
    {
      "title": "Primary purpose",
      "toolA": "Built as a customer service extension of the Salesforce CRM, focused on cases, omnichannel support, and a knowledge base",
      "toolB": "Built as an enterprise workflow platform spanning IT Service Management, IT Operations Management, HR Service Delivery, and Customer Service Management",
      "whyItMatters": "Buyers evaluating the two are often solving different organizational problems, not choosing between direct substitutes",
      "benefitsWho": "Customer support and sales-aligned teams lean toward Service Cloud, while IT and enterprise operations teams lean toward ServiceNow"
    },
    {
      "title": "Pricing transparency",
      "toolA": "Publishes tiered per-user pricing starting at 25 dollars per user per month for Starter Suite, scaling to 330 dollars per user per month for Unlimited",
      "toolB": "Uses custom-enterprise pricing with no published starting price; every deployment is quoted through the sales team",
      "whyItMatters": "Published pricing lets smaller teams self-evaluate cost before engaging sales, while custom pricing requires a sales conversation regardless of team size",
      "benefitsWho": "Budget-conscious teams and those wanting quick self-serve evaluation benefit from Service Cloud's published tiers"
    },
    {
      "title": "CRM data unification",
      "toolA": "Shares a single customer data model with Sales Cloud and Marketing Cloud as Customer 360",
      "toolB": "Not documented as sharing a native sales or marketing CRM data model",
      "whyItMatters": "Teams that need service, sales, and marketing data unified without separate integration work get that natively in one platform",
      "benefitsWho": "Sales-and-service aligned organizations benefit most from Service Cloud's unified data model"
    },
    {
      "title": "IT Service Management depth",
      "toolA": "Not documented as offering dedicated incident, problem, or change management workflows",
      "toolB": "Provides IT Service Management with structured incident, problem, change, and request workflows plus a configurable service catalog",
      "whyItMatters": "Organizations standardizing IT operations need purpose-built ITSM workflows rather than a general case management tool",
      "benefitsWho": "IT departments and IT operations teams benefit from ServiceNow's dedicated ITSM tooling"
    },
    {
      "title": "Infrastructure and operations visibility",
      "toolA": "Not documented as offering infrastructure discovery or service mapping",
      "toolB": "Includes IT Operations Management for infrastructure discovery, service dependency mapping, and event correlation",
      "whyItMatters": "Root-cause analysis across complex infrastructure requires visibility tools that a customer service platform is not built to provide",
      "benefitsWho": "IT operations and infrastructure teams benefit from ServiceNow's ITOM capabilities"
    },
    {
      "title": "HR and security workflow scope",
      "toolA": "Not documented as offering HR case management or dedicated security operations tooling",
      "toolB": "Includes HR Service Delivery for employee onboarding and requests, plus Security Operations linking vulnerability and security incident response",
      "whyItMatters": "Organizations wanting to consolidate HR and security workflows onto the same platform as IT get that only from ServiceNow's documented modules",
      "benefitsWho": "HR and security operations teams benefit from ServiceNow's cross-department workflow coverage"
    },
    {
      "title": "Field service and telephony",
      "toolA": "Includes Field Service for dispatched technicians and work orders, plus Service Cloud Voice for built-in telephony and call transcription",
      "toolB": "Not documented as offering dispatched field service management or built-in telephony",
      "whyItMatters": "Support organizations coordinating on-site technicians or phone-based support need these built into the platform rather than bolted on",
      "benefitsWho": "Field service and phone-heavy support teams benefit from Service Cloud's dedicated modules"
    },
    {
      "title": "Low-code custom application building",
      "toolA": "Not documented as offering a general-purpose low-code application builder beyond automation macros and flows",
      "toolB": "Includes App Engine, a low-code environment for building custom applications and forms on top of platform data",
      "whyItMatters": "Teams wanting to build bespoke internal applications rather than only automate existing case workflows need a general app-building environment",
      "benefitsWho": "Internal IT and business teams building custom workflow applications benefit from ServiceNow's App Engine"
    },
    {
      "title": "Free trial and evaluation path",
      "toolA": "Documented as typically offering a free trial period",
      "toolB": "Documented as not offering a standard self-serve free trial; prospects request a demo or proof of concept",
      "whyItMatters": "The ability to self-serve evaluate a product before talking to sales changes how quickly smaller teams can test fit",
      "benefitsWho": "Smaller teams wanting a low-commitment evaluation benefit from Service Cloud's free trial"
    },
    {
      "title": "AI resolution scope",
      "toolA": "Einstein and Agentforce are documented as able to autonomously resolve routine requests, not just assist agents",
      "toolB": "Now Assist is documented as summarizing cases, drafting knowledge content, and recommending next steps for agents and employees",
      "whyItMatters": "Autonomous resolution versus agent-assist AI represents different levels of automation maturity for deflecting routine work",
      "benefitsWho": "Support organizations prioritizing case deflection may weigh Service Cloud's documented autonomous resolution capability more heavily"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Case and Customer Service Management",
      "rows": [
        {
          "feature": "Case Management",
          "toolA": "available",
          "toolB": "available",
          "note": "ServiceNow's is delivered through its Customer Service Management module"
        },
        {
          "feature": "Omnichannel Routing (email, chat, SMS, messaging)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Knowledge Base",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ServiceNow's facts mention drafting knowledge content via Now Assist, not a dedicated knowledge base feature"
        },
        {
          "feature": "Self-Service Customer Portals",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented as Self-Service Communities"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI Case Summarization and Reply Drafting",
          "toolA": "available",
          "toolB": "available",
          "note": "Einstein and Agentforce versus Now Assist"
        },
        {
          "feature": "Autonomous Request Resolution",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Agentforce is documented as resolving routine requests; Now Assist is documented as suggesting, not autonomously acting"
        },
        {
          "feature": "Conversational Virtual Agent or Chatbot",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented as Virtual Agent"
        }
      ]
    },
    {
      "group": "Automation and Customization",
      "rows": [
        {
          "feature": "No-Code Workflow Automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Macros and Flows versus Integration Hub visual flow designer"
        },
        {
          "feature": "Low-Code Custom Application Building",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented as App Engine"
        },
        {
          "feature": "API Access",
          "toolA": "available",
          "toolB": "available",
          "note": "Service Cloud's API access is documented at Enterprise tier and above"
        }
      ]
    },
    {
      "group": "IT Service and Operations Management",
      "rows": [
        {
          "feature": "IT Service Management (incidents, problems, changes)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Infrastructure Discovery and Service Mapping",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented as IT Operations Management"
        }
      ]
    },
    {
      "group": "HR and Security Workflows",
      "rows": [
        {
          "feature": "HR Case Management and Onboarding",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented as HR Service Delivery"
        },
        {
          "feature": "Security Incident Response",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented as Security Operations"
        },
        {
          "feature": "Vulnerability Response",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linked into the same Security Operations workflow"
        }
      ]
    },
    {
      "group": "Field and On-Site Service",
      "rows": [
        {
          "feature": "Field Service Dispatch and Work Orders",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Built-In Voice and Call Telephony",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented as Service Cloud Voice"
        }
      ]
    },
    {
      "group": "Platform Ecosystem, Reporting, and Trial",
      "rows": [
        {
          "feature": "Unified CRM Data with Sales and Marketing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented as Customer 360"
        },
        {
          "feature": "Reporting and Analytics Dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": "Documented as Performance Analytics for ServiceNow"
        },
        {
          "feature": "Self-Serve Free Trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ServiceNow instead offers a sales-led demo or proof of concept"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Salesforce Service Cloud or ServiceNow?",
      "answer": "Salesforce Service Cloud is the more transparently priced option, with published tiers starting at 25 dollars per user per month, while ServiceNow uses custom-enterprise pricing with no published starting price, so a direct cost comparison requires requesting a ServiceNow quote."
    },
    {
      "question": "Is ServiceNow only for IT departments?",
      "answer": "No, ServiceNow originated in IT service management but its documented modules now cover HR Service Delivery, Customer Service Management, and Security Operations as well."
    },
    {
      "question": "Can Salesforce Service Cloud handle IT service management like ServiceNow does?",
      "answer": "Not based on documented features; Service Cloud's facts describe customer case management, omnichannel routing, and field service, with no mention of IT incident, problem, or change management workflows that ServiceNow's ITSM module provides."
    },
    {
      "question": "Which tool has a lower learning curve for new users?",
      "answer": "Neither is documented as easy to learn; both are described as having a steep learning curve that typically requires dedicated administrators or implementation partners to configure and run."
    },
    {
      "question": "Does either Salesforce Service Cloud or ServiceNow offer a free trial?",
      "answer": "Salesforce Service Cloud is documented as typically offering a free trial, while ServiceNow does not offer a standard self-serve free trial and instead directs prospects to a sales-led demo or proof of concept."
    },
    {
      "question": "Which has stronger AI features, Salesforce Service Cloud or ServiceNow?",
      "answer": "Both platforms document generative AI embedded in their workflows, Einstein and Agentforce for Service Cloud versus Now Assist for ServiceNow, with Service Cloud's facts specifically describing Agentforce as able to autonomously resolve routine requests, a capability not stated in ServiceNow's documented Now Assist description."
    }
  ]
};

export default salesforceServiceCloudVsServicenowContent;

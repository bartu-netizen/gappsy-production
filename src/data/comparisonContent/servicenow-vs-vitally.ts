import type { ToolComparisonContent } from './types';

const servicenowVsVitallyContent: ToolComparisonContent = {
  "verdict": "ServiceNow is a broad enterprise cloud platform spanning ITSM, ITOM, HR service delivery, customer service, and custom app development, while Vitally is a specialized customer success platform focused specifically on health scoring and CSM workflows for B2B SaaS. ServiceNow's Customer Service Management module can house customer-facing case work within its much larger platform, but Vitally is purpose-built for customer success teams and lacks ServiceNow's IT operations, HR, and low-code app-building scope.",
  "bestForToolA": "ServiceNow fits large enterprises that need to unify IT service management, IT operations, HR case management, and customer service on one configurable platform with Now Assist generative AI embedded across those workflows.",
  "bestForToolB": "Vitally fits B2B SaaS companies whose primary need is customer success management, health scores, automation/playbooks, and NPS surveys, without the broader IT/HR scope of a platform like ServiceNow; it already serves 600+ B2B SaaS organizations including Zapier and Pleo.",
  "whoNeedsBoth": "A larger SaaS company could run ServiceNow for internal IT service management and employee HR case handling while its customer success team uses Vitally separately to manage account health and renewals - the two would sit in different departments rather than compete for the same budget line.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "ServiceNow has no published pricing at all; costs depend on which products/modules and how many users or agents are licensed, quoted via a custom sales contract.",
      "toolB": "Vitally also has no published pricing across its Tech-Touch, Hybrid-Touch, and High-Touch tiers, requiring a sales quote.",
      "whyItMatters": "Neither tool lets a buyer self-serve a cost estimate, so budget planning depends entirely on the sales process for both.",
      "benefitsWho": "Procurement teams should plan for a multi-stage sales cycle regardless of which tool they choose."
    },
    {
      "title": "Platform Scope",
      "toolA": "ServiceNow spans ITSM, ITOM, HR Service Delivery, Customer Service Management, Security Operations, and a low-code App Engine for building custom applications.",
      "toolB": "Vitally's scope is narrower and specific to customer success: health scores, automation/playbooks, project management for onboarding, and customer surveys/NPS.",
      "whyItMatters": "Organizations trying to consolidate multiple departmental workflows onto one platform need ServiceNow's breadth; those only needing customer success tooling would find that breadth unnecessary.",
      "benefitsWho": "IT and operations leaders standardizing workflows across departments benefit from ServiceNow; dedicated CS teams benefit from Vitally."
    },
    {
      "title": "AI Capabilities",
      "toolA": "ServiceNow's Now Assist uses generative AI embedded in workflows to summarize cases, draft knowledge content, and recommend next steps for agents and employees.",
      "toolB": "Vitally AI generates customer summaries, follow-up tasks, and insights from conversations and unstructured customer data.",
      "whyItMatters": "Both apply generative AI to their respective workflows, but ServiceNow's AI spans IT, HR, and customer service cases while Vitally's is scoped to customer success data.",
      "benefitsWho": "Enterprises wanting AI assistance across multiple departments benefit from ServiceNow; CS teams wanting AI scoped to account health work benefit from Vitally."
    },
    {
      "title": "Free Trial Availability",
      "toolA": "ServiceNow does not offer a standard self-serve free trial; prospects request a demo or proof of concept through sales.",
      "toolB": "Vitally's facts likewise don't document a self-serve free trial, and its plans are all custom-quoted.",
      "whyItMatters": "Buyers evaluating either tool should expect to go through a guided sales/demo process rather than testing independently.",
      "benefitsWho": "Teams that prefer hands-on evaluation should budget time for a sales-led proof of concept with either vendor."
    },
    {
      "title": "Ecosystem and Integrations",
      "toolA": "ServiceNow offers Integration Hub with prebuilt connectors, APIs, and a visual flow designer, plus an extensive partner network and marketplace of prebuilt applications.",
      "toolB": "Vitally includes a full integration library across all three plan tiers, though the specific number and depth of connectors isn't detailed in the available facts.",
      "whyItMatters": "The size of an integration ecosystem affects how much custom engineering work is needed to connect the tool to existing systems.",
      "benefitsWho": "IT teams that need to connect many existing enterprise systems benefit from ServiceNow's larger documented ecosystem."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Scope",
      "rows": [
        {
          "feature": "IT service management (incidents, changes, requests)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Customer success health scoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "HR case management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Low-code custom app building",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ServiceNow's App Engine"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "Generative AI assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "ServiceNow: Now Assist; Vitally: Vitally AI"
        },
        {
          "feature": "Workflow automation/playbooks",
          "toolA": "available",
          "toolB": "available",
          "note": "Unlimited automations on all Vitally plans"
        },
        {
          "feature": "Virtual agent/chatbot",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "not-documented"
        },
        {
          "feature": "Single Sign-on",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included on all Vitally plans"
        },
        {
          "feature": "Unlimited observer/reporting seats",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is ServiceNow a customer success platform like Vitally?",
      "answer": "Not primarily. ServiceNow's Customer Service Management module handles case management and omnichannel support for external customers, but it's part of a much larger IT/HR/operations platform, whereas Vitally is purpose-built for customer success health scoring and CSM workflows."
    },
    {
      "question": "Do both tools publish pricing?",
      "answer": "No, neither does. ServiceNow's Standard, Professional, and Enterprise tiers and Vitally's Tech-Touch, Hybrid-Touch, and High-Touch tiers are all quote-based, requiring a sales conversation."
    },
    {
      "question": "Which tool is better for a small SaaS startup?",
      "answer": "Vitally's scope, customer success specifically, is closer to what a smaller B2B SaaS company managing a book of accounts would need, while ServiceNow's broad ITSM/HR/App Engine scope is typically aimed at larger, more complex organizations."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "ServiceNow does not offer a standard self-serve free trial and instead directs prospects to a demo or proof of concept. Vitally's available facts don't document a free trial either."
    },
    {
      "question": "How do the AI features compare?",
      "answer": "ServiceNow's Now Assist applies generative AI across IT, HR, and customer service workflows to summarize records and draft content. Vitally AI is scoped specifically to generating customer summaries, follow-up tasks, and insights from customer success data."
    },
    {
      "question": "Can ServiceNow replace a dedicated customer success tool like Vitally?",
      "answer": "ServiceNow's Customer Service Management module covers case handling, but the available facts don't show ServiceNow offering the health-scoring and CS-specific playbook features that are Vitally's core focus, so teams needing those specifically would likely still evaluate a dedicated CS platform."
    }
  ]
};

export default servicenowVsVitallyContent;

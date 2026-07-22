import type { ToolComparisonContent } from './types';

const agileCrmVsEngagebayContent: ToolComparisonContent = {
  "verdict": "Agile CRM and EngageBay are both all-in-one CRM-plus-marketing platforms with free plans, but they emphasize different capabilities. Agile CRM (founded 2013, Hyderabad) includes dedicated social media monitoring/scheduling and a documented 99.5% uptime guarantee on paid plans; EngageBay (founded 2017, Wilmington, Delaware) includes an AI chatbot for helpdesk, 1,000+ email templates, and a slightly larger free-plan team size.",
  "bestForToolA": "Small businesses that want to monitor and schedule Twitter/X activity from within the CRM, need documented API call limits by plan, and value an explicit uptime guarantee on paid tiers.",
  "bestForToolB": "Small businesses that want an AI chatbot trained on a knowledge base for live chat/helpdesk, a large ready-made email template library, and a slightly larger free-tier team size (up to 15 members).",
  "whoNeedsBoth": "A small business running separate social-media outreach and customer-support functions might use Agile CRM's social monitoring for marketing while running EngageBay's AI chatbot for support — though most teams should pick one all-in-one platform rather than split usage.",
  "keyDifferences": [
    {
      "title": "Free plan scope",
      "toolA": "Free plan supports up to 10 users with no credit card required.",
      "toolB": "Free plan supports up to 15 team members but caps contacts at 250.",
      "whyItMatters": "Agile CRM's free tier favors larger teams; EngageBay's favors teams with fewer contacts. The right fit depends on whether team size or contact volume is the binding constraint.",
      "benefitsWho": "Small teams choosing a free tier based on headcount vs. contact-list size."
    },
    {
      "title": "Social media management",
      "toolA": "Includes a dedicated social media CRM feature that monitors Twitter/X streams and schedules posts from within the CRM.",
      "toolB": "Does not document a social media monitoring or scheduling feature.",
      "whyItMatters": "Teams that want to manage social outreach without a separate tool get that capability built into Agile CRM.",
      "benefitsWho": "Small marketing teams handling social media alongside sales."
    },
    {
      "title": "AI-powered helpdesk chatbot",
      "toolA": "Does not document an AI chatbot; helpdesk and telephony widgets are included on paid plans.",
      "toolB": "Includes an AI chatbot trained on a knowledge base as part of its live chat and helpdesk feature.",
      "whyItMatters": "Teams wanting automated first-response support get that capability with EngageBay but not documented with Agile CRM.",
      "benefitsWho": "Small support teams wanting to automate first-line customer responses."
    },
    {
      "title": "Uptime guarantee",
      "toolA": "States a 99.5% uptime guarantee on paid plans.",
      "toolB": "Does not document an uptime SLA.",
      "whyItMatters": "Teams with reliability requirements in a vendor evaluation may weight an explicit uptime commitment.",
      "benefitsWho": "Businesses with formal vendor reliability requirements."
    },
    {
      "title": "Email template library",
      "toolA": "Does not document a specific email template count.",
      "toolB": "Includes 1,000+ email templates.",
      "whyItMatters": "Teams without in-house design resources benefit from a larger ready-made template library.",
      "benefitsWho": "Small marketing teams without dedicated email designers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Social media monitoring/scheduling",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "360-degree/timeline contact view",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Landing pages & web forms",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Agile CRM documents web popups/surveys, not a landing page builder."
        },
        {
          "feature": "Lead scoring",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Marketing & Support",
      "rows": [
        {
          "feature": "AI chatbot for helpdesk",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Email template library",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "EngageBay: 1,000+ templates."
        },
        {
          "feature": "Marketing automation (email sequences/campaigns)",
          "toolA": "available",
          "toolB": "available",
          "note": "EngageBay gates marketing automation to the Growth plan and above."
        },
        {
          "feature": "Helpdesk / ticketing",
          "toolA": "available",
          "toolB": "available",
          "note": "Agile CRM's helpdesk widgets are on paid plans; EngageBay's is included from the Free plan."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free (non-trial) plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Agile CRM: up to 10 users. EngageBay: up to 15 members, 250 contacts."
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Agile CRM: $8.99/mo. EngageBay: $12.74/mo (biennial)."
        },
        {
          "feature": "Uptime guarantee documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Agile CRM: 99.5%."
        },
        {
          "feature": "API call limits documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Agile CRM: 500/day (Free) to 25,000/day (Enterprise)."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Agile CRM have a free plan?",
      "answer": "Yes, free for up to 10 users with no credit card required."
    },
    {
      "question": "Does EngageBay have a free plan?",
      "answer": "Yes, free for up to 15 team members and 250 contacts, with no credit card required."
    },
    {
      "question": "When was Agile CRM founded and where is it based?",
      "answer": "Agile CRM launched in 2013 and is based in Hyderabad, India, with additional offices in the US and Philippines."
    },
    {
      "question": "When was EngageBay founded?",
      "answer": "EngageBay was founded in 2017 and is headquartered in Wilmington, Delaware."
    },
    {
      "question": "Does EngageBay have AI features?",
      "answer": "Yes, its live chat and helpdesk include an AI chatbot trained on a knowledge base."
    },
    {
      "question": "Does Agile CRM offer social media tools?",
      "answer": "Yes, it monitors Twitter/X streams and schedules social posts from within the CRM."
    }
  ]
};

export default agileCrmVsEngagebayContent;

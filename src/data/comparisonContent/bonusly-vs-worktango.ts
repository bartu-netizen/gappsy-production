import type { ToolComparisonContent } from './types';

const bonuslyVsWorktangoContent: ToolComparisonContent = {
  "verdict": "Bonusly and WorkTango both address employee recognition, but at different depth and price points. Bonusly is a focused peer-to-peer recognition platform with a permanent free plan for up to 8 users and transparent paid pricing from $3/user/month, while WorkTango is a broader employee experience platform combining recognition and rewards with AI-powered listening (Constellation) and lifecycle surveys, priced entirely on custom quote.",
  "bestForToolA": "Bonusly fits small teams or budget-conscious organizations that want peer-to-peer recognition with transparent, published pricing starting free for up to 8 users, or $3/user/month for unlimited seats.",
  "bestForToolB": "WorkTango fits larger organizations wanting a combined recognition-and-listening platform, including AI-powered feedback analysis via Constellation and employee lifecycle surveys with action planning, backed by Vista Equity Partners.",
  "whoNeedsBoth": "There's limited practical case for running both together since they overlap directly on recognition and rewards; a company might trial Bonusly for a lightweight, cheap rollout before evaluating WorkTango's more comprehensive (and costlier) survey and listening capabilities as it scales.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Bonusly publishes clear pricing: a free plan for up to 8 users, Team at $3/user/month ($30/user/year annually), Team + Bizy AI at $5/user/month, and custom Organization pricing.",
      "toolB": "WorkTango's pricing model is not published; no starting price, plan structure, or free trial information is documented.",
      "whyItMatters": "Published pricing lets buyers self-qualify and compare cost before engaging sales, which only one of these platforms supports.",
      "benefitsWho": "Small and mid-size companies with limited procurement bandwidth benefit from Bonusly's transparent pricing."
    },
    {
      "title": "Product Scope",
      "toolA": "Bonusly centers on peer-to-peer recognition plus a rewards catalog, check-ins, celebrations, and growth tools (goals, reflections, 360 feedback).",
      "toolB": "WorkTango combines recognition & rewards with employee lifecycle surveys, AI-powered listening (Constellation), action planning, and anonymous two-way conversations with leadership.",
      "whyItMatters": "WorkTango's documented scope extends further into survey-driven engagement measurement, which is a distinct capability from recognition alone.",
      "benefitsWho": "Organizations wanting survey-based engagement analytics on top of recognition benefit from WorkTango's broader scope; teams wanting a focused recognition tool benefit from Bonusly."
    },
    {
      "title": "AI Feature",
      "toolA": "Bonusly's Bizy AI is an AI-powered feature available as an add-on ($2/user/month standalone) or bundled into the Team ($5/user/month) or Organization plan.",
      "toolB": "WorkTango's Constellation is an AI-powered employee listening tool built specifically for surfacing engagement insights from feedback and surveys.",
      "whyItMatters": "The two AI features serve different purposes — one augments recognition workflows, the other analyzes open-ended feedback — so the fit depends on what a team wants AI to actually do.",
      "benefitsWho": "Teams wanting AI-enhanced recognition workflows benefit from Bizy AI; people analytics teams parsing survey feedback benefit from Constellation."
    },
    {
      "title": "Free Plan Availability",
      "toolA": "Bonusly offers a free plan forever for teams of up to 8 users, including peer recognition, Slack/Teams integrations, and iOS/Android apps.",
      "toolB": "WorkTango does not document any free plan or free trial.",
      "whyItMatters": "A genuinely free tier lets very small teams or pilot groups adopt recognition tooling with zero budget approval.",
      "benefitsWho": "Very small teams, startups, or single-department pilots benefit specifically from Bonusly's free 8-user plan."
    },
    {
      "title": "Enterprise Governance Features",
      "toolA": "Bonusly's SAML SSO and company-wide analytics are gated behind the custom-priced Organization plan.",
      "toolB": "WorkTango's specific integrations and governance features beyond general HRIS connectivity are not detailed on its site.",
      "whyItMatters": "Enterprises need to know exactly which security/governance features (like SSO) are available and at what tier before adopting a platform company-wide.",
      "benefitsWho": "IT and security teams evaluating SSO requirements benefit from Bonusly's documented (if gated) SAML SSO availability."
    }
  ],
  "featureMatrix": [
    {
      "group": "Recognition & Rewards",
      "rows": [
        {
          "feature": "Peer-to-peer recognition",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Rewards catalog / marketplace",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automated milestone/service celebrations",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "360-degree feedback / growth tools",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Listening & Engagement",
      "rows": [
        {
          "feature": "Employee lifecycle surveys",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-powered feedback listening",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WorkTango's Constellation."
        },
        {
          "feature": "Action planning on survey results",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Anonymous two-way leadership conversations",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI add-on for recognition workflows",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bonusly's Bizy AI, $2/user/month standalone."
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Bonusly free plan covers up to 8 users."
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Bonusly Team starts at $3/user/month."
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SAML SSO",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gated to Bonusly's custom Organization plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Bonusly or WorkTango free?",
      "answer": "Bonusly offers a free plan forever for teams up to 8 users, including peer recognition and Slack/Teams integrations. WorkTango does not document any free plan or free trial."
    },
    {
      "question": "How much does Bonusly cost compared to WorkTango?",
      "answer": "Bonusly's Team plan starts at $3/user/month ($30/user/year annually), or $5/user/month with Bizy AI bundled. WorkTango's pricing is entirely unpublished and requires a custom quote from sales."
    },
    {
      "question": "What is Constellation in WorkTango, and does Bonusly have an equivalent?",
      "answer": "Constellation is WorkTango's AI-powered employee listening tool for surfacing insights from feedback and surveys. Bonusly's AI feature, Bizy AI, is instead focused on the recognition workflow itself rather than survey-based listening."
    },
    {
      "question": "Does WorkTango include employee surveys?",
      "answer": "Yes, WorkTango documents employee lifecycle surveys with dashboards for engagement measurement, plus action planning tools. Bonusly's documented feature set does not include lifecycle surveys."
    },
    {
      "question": "Which platform has mobile apps?",
      "answer": "Bonusly includes iOS and Android apps, even on its free plan. WorkTango's documented feature list does not mention dedicated mobile apps."
    },
    {
      "question": "Who backs WorkTango, and how many organizations use Bonusly?",
      "answer": "WorkTango is backed by Vista Equity Partners. Bonusly reports being used by 3,400+ organizations, per the company."
    }
  ]
};

export default bonuslyVsWorktangoContent;

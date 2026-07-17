import type { ToolComparisonContent } from './types';

const cannyVsNoltContent: ToolComparisonContent = {
  "verdict": "Canny and Nolt are both feedback board and roadmap tools, but they take opposite approaches to pricing and feedback intelligence. Canny has a genuine free plan (up to 25 tracked users) plus AI Autopilot that mines feedback from sales calls and support tickets, scaling to $79/month for Pro. Nolt has no free plan at all — its cheapest option is $29/month for a single board with no third-party integrations — but includes unlimited users, admins, and content on every paid tier, plus strong privacy controls like password-protected and domain-restricted boards.",
  "bestForToolA": "Teams that want to start free and specifically need AI to auto-capture feedback from sales and support conversations (Gong, Salesforce, HubSpot, Intercom) rather than relying on manual submission.",
  "bestForToolB": "Teams that want a simple public or private feedback/roadmap board with strong access controls (SSO, password protection, domain restriction) and unlimited users on every plan, without needing AI-driven capture.",
  "whoNeedsBoth": "There is no realistic case for using both simultaneously since they serve the same core job of collecting and prioritizing user feedback; a team would pick whichever pricing model and integration set fits, not run duplicate feedback boards.",
  "keyDifferences": [
    {
      "title": "Free Plan Availability",
      "toolA": "Canny offers a genuinely free plan for up to 25 tracked users with unlimited feedback and Autopilot AI included.",
      "toolB": "Nolt has no free plan at all; every board starts on a 10-day free trial of the Pro plan (no credit card required) before requiring payment.",
      "whyItMatters": "A persistent free tier versus a time-limited trial changes how long a small team can evaluate or run the tool before paying.",
      "benefitsWho": "Very small teams or side projects benefit from Canny's ongoing free tier over Nolt's 10-day trial window."
    },
    {
      "title": "AI-Driven Feedback Capture",
      "toolA": "Canny's AI Autopilot automatically captures feedback from sales calls, support tickets, and other conversations across integrations like Gong, Intercom, and Salesforce.",
      "toolB": "Nolt relies on manual feedback submission through public or private boards, with no AI capture feature documented.",
      "whyItMatters": "Automated capture reduces the manual work of logging feedback that arrives outside the feedback board itself, such as sales calls.",
      "benefitsWho": "Sales-led or support-heavy organizations that generate a lot of unstructured feedback outside a dedicated board."
    },
    {
      "title": "User and Admin Limits",
      "toolA": "Canny's plans are gated by tracked user count: 25 on Free, 100+ on Pro, 5,000+ on Business.",
      "toolB": "Nolt offers unlimited users, content, and admins on every plan, gating instead by number of boards (1 on Essential, up to 5 on Pro).",
      "whyItMatters": "The two tools scale pricing along completely different axes — tracked users for Canny, number of boards for Nolt — which changes which is cheaper depending on team shape.",
      "benefitsWho": "Large teams with many internal admins but few feedback boards benefit from Nolt's unlimited-user model; teams with many tracked external users on a single board may find Canny's tiers more predictable."
    },
    {
      "title": "Privacy and Access Controls",
      "toolA": "Canny's SSO integrations are reserved for the custom-priced Business tier.",
      "toolB": "Nolt supports SAML 2.0 SSO starting on its Essential plan ($29/month), plus password-protected boards, domain-restricted access, and moderation tools like a profanity filter and user banning.",
      "whyItMatters": "Access to SSO and granular privacy controls at a lower price point matters for teams handling sensitive or internal-only feedback.",
      "benefitsWho": "Teams running private, internal, or enterprise-restricted feedback boards that need SSO without hitting a custom enterprise tier."
    },
    {
      "title": "Third-Party Integration Access",
      "toolA": "Canny includes integrations like Slack, Gong, Intercom, Salesforce, HubSpot, Jira, and Zendesk across its plans, with 20+ platforms total.",
      "toolB": "Nolt's Essential plan ($29/month) includes only Slack, Discord, GitHub, and Trello; broader integrations like Zapier, Jira, Linear, Asana, and Monday require the $69/month Pro plan.",
      "whyItMatters": "Gating major integrations like Jira and Zapier behind a second pricing tier increases the effective cost for teams that need them.",
      "benefitsWho": "Product teams that need Jira or CRM integrations from day one may find Canny's integration access more immediately useful at a comparable price."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Nolt offers a 10-day free trial instead"
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Canny Pro $79/mo; Nolt Essential $29/mo"
        },
        {
          "feature": "Unlimited users/admins on paid plans",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multiple boards on entry plan",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Nolt Essential is limited to 1 board"
        }
      ]
    },
    {
      "group": "Feedback & Roadmap",
      "rows": [
        {
          "feature": "AI auto-capture of feedback",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Revenue-based prioritization",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Public roadmap",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Data export (Sheets/Excel)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Nolt Pro plan"
        },
        {
          "feature": "Moderation tools (profanity filter, banning)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Integrations",
      "rows": [
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Canny: custom Business tier only; Nolt: from $29/mo Essential"
        },
        {
          "feature": "Password-protected/domain-restricted boards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Nolt Pro plan"
        },
        {
          "feature": "CRM integrations (Salesforce, HubSpot)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Jira/Zapier integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Nolt requires $69/mo Pro plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Nolt have a free plan like Canny?",
      "answer": "No. Nolt has no free plan; new boards get a 10-day free trial of the Pro plan with no credit card required, after which payment is required. Canny has a genuinely free plan for up to 25 tracked users."
    },
    {
      "question": "Which is cheaper, Canny or Nolt?",
      "answer": "It depends on team shape. Canny's Free plan covers up to 25 tracked users at $0, while Nolt's cheapest plan is $29/month for one board but with unlimited users and admins. Teams with many internal admins but light external feedback volume may find Nolt cheaper; teams under 25 tracked users may prefer Canny's free tier."
    },
    {
      "question": "Does Nolt include AI-powered feedback capture?",
      "answer": "No, an AI auto-capture feature is not documented for Nolt. Canny's AI Autopilot automatically captures feedback from sales calls and support tickets via integrations like Gong and Salesforce."
    },
    {
      "question": "Which tool offers SSO at a lower price?",
      "answer": "Nolt includes SAML 2.0 SSO starting on its $29/month Essential plan. Canny reserves SSO for its custom-priced Business tier."
    },
    {
      "question": "Can boards be made private on either platform?",
      "answer": "Nolt explicitly supports private, password-protected, and domain-restricted boards. Private board options are not documented in the same detail for Canny."
    },
    {
      "question": "How do the two tools' pricing models differ structurally?",
      "answer": "Canny prices by number of tracked users (25 free, 100+ on Pro, 5,000+ on Business). Nolt prices by number of boards (1 on Essential, up to 5 on Pro) while offering unlimited users and admins on every plan."
    }
  ]
};

export default cannyVsNoltContent;

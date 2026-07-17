import type { ToolComparisonContent } from './types';

const ohmdVsWeaveContent: ToolComparisonContent = {
  "verdict": "OhMD and Weave both offer AI-powered call handling for healthcare practices, but OhMD's Nia is scoped as a voice agent within a texting-first platform that starts at $300/month, while Weave bundles its AI Receptionist into a broader all-in-one communication suite - texting, payments, review management, VoIP - starting lower at $199/month for the Pro tier. Both are direct competitors for automating patient phone and text volume.",
  "bestForToolA": "Practices already using one of OhMD's 85+ supported EHR systems that want an add-on AI voice agent (Nia) plus secure texting layered on top, including larger institutions like Dana-Farber and Memorial Sloan Kettering.",
  "bestForToolB": "Small businesses and healthcare practices wanting an all-in-one platform combining AI Receptionist call handling, text-to-pay/BNPL payments, review management, and up to 15 VoIP phones on the Ultimate tier, starting at $199/month.",
  "whoNeedsBoth": "Not realistic - both are direct competitors covering the same core need (AI-automated patient calls and texting for healthcare-adjacent businesses), so a practice would choose one rather than run overlapping communication platforms.",
  "keyDifferences": [
    {
      "title": "Entry Pricing",
      "toolA": "OhMD's Communicate plan starts at $300/month for texting and calling features; the AI voice agent Nia specifically requires the $500/month Automate plan.",
      "toolB": "Weave's Pro plan starts at $199/month, with Elite and Ultimate priced on request.",
      "whyItMatters": "The gap between OhMD's $300-500/month range and Weave's $199/month Pro entry point affects which practices can afford AI call automation.",
      "benefitsWho": "Benefits budget-conscious small practices comparing entry costs for AI-assisted communication."
    },
    {
      "title": "Payment Processing",
      "toolA": "Not documented as including patient payment processing.",
      "toolB": "Weave includes payment processing with text-to-pay and buy-now-pay-later options.",
      "whyItMatters": "Built-in patient payment collection reduces the need for a separate payment processor.",
      "benefitsWho": "Benefits practices wanting to consolidate communication and billing/payments into one platform."
    },
    {
      "title": "Review Management",
      "toolA": "Not documented for OhMD.",
      "toolB": "Weave includes review management with an AI Response Assistant for managing and replying to customer reviews.",
      "whyItMatters": "Automated review response helps practices maintain online reputation without manual staff time.",
      "benefitsWho": "Benefits practices focused on online reputation management, such as dental or multi-location healthcare businesses."
    },
    {
      "title": "Call Volume & VoIP Scale",
      "toolA": "OhMD does not document VoIP phone counts; calling usage on the Automate plan is billed separately.",
      "toolB": "Weave's Ultimate tier documents up to 15 VoIP phones and 15,000 monthly messages.",
      "whyItMatters": "Larger multi-line practices need to know how many phone lines and messages a plan supports before hitting overage costs.",
      "benefitsWho": "Benefits multi-location or multi-provider practices with high call and text volume."
    },
    {
      "title": "EHR Integration Breadth",
      "toolA": "OhMD explicitly integrates with 85+ EHR systems.",
      "toolB": "No EHR integration count is documented for Weave.",
      "whyItMatters": "Practices with an established EHR need confirmation that a communication tool will sync data without manual re-entry.",
      "benefitsWho": "Benefits practices that specifically need broad, documented EHR compatibility."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI & Call Automation",
      "rows": [
        {
          "feature": "AI voice / call agent",
          "toolA": "available",
          "toolB": "available",
          "note": "OhMD's Nia is on the $500/month Automate plan; Weave's AI Receptionist"
        },
        {
          "feature": "Voicemail transcription",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Call-to-text conversion",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Weave instead offers missed-call text automation"
        },
        {
          "feature": "Call sentiment / intelligence analytics",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Weave's Call Intelligence"
        }
      ]
    },
    {
      "group": "Payments & Reviews",
      "rows": [
        {
          "feature": "Patient payment processing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Text-to-pay and BNPL"
        },
        {
          "feature": "Review management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "AI Response Assistant"
        },
        {
          "feature": "Digital intake forms",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Email marketing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Plans & Scale",
      "rows": [
        {
          "feature": "EHR integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OhMD: 85+ systems"
        },
        {
          "feature": "Entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "OhMD: $300/month; Weave: $199/month"
        },
        {
          "feature": "VoIP phone lines",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Up to 15 on Weave's Ultimate tier"
        },
        {
          "feature": "Enterprise / custom tier",
          "toolA": "available",
          "toolB": "available",
          "note": "OhMD Enterprise; Weave Elite and Ultimate"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper to start?",
      "answer": "Weave's Pro plan starts at $199/month versus OhMD's Communicate plan at $300/month; OhMD's AI voice agent specifically requires the $500/month Automate plan."
    },
    {
      "question": "Does Weave include patient payment processing?",
      "answer": "Yes, Weave supports text-to-pay and buy-now-pay-later payment options; this is not documented for OhMD."
    },
    {
      "question": "Which tool documents broader EHR integration?",
      "answer": "OhMD documents integration with 85+ EHR systems; Weave does not document an EHR integration count."
    },
    {
      "question": "Do both platforms use AI for call handling?",
      "answer": "Yes - OhMD's AI voice agent is called Nia (available on the Automate plan), and Weave's is called AI Receptionist."
    },
    {
      "question": "Which tool offers review management?",
      "answer": "Weave includes review management with an AI Response Assistant; this is not documented for OhMD."
    },
    {
      "question": "How many VoIP phone lines does each support?",
      "answer": "Weave's Ultimate tier documents up to 15 VoIP phones; OhMD does not document a phone-line count, noting calling usage is billed separately on its Automate plan."
    }
  ]
};

export default ohmdVsWeaveContent;

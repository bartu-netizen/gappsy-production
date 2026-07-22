import type { ToolComparisonContent } from './types';

const _15fiveVsCultureAmpContent: ToolComparisonContent = {
  "verdict": "15Five is a transparently priced, per-user performance and engagement platform built around AI-assisted reviews and the Kona coaching assistant. Culture Amp is a broader employee experience platform adding DEI assessments, benchmarking, and 360-degree feedback, sold through custom quotes to enterprise customers like Canva and Etsy.",
  "bestForToolA": "Smaller or mid-size teams wanting predictable per-user pricing ($4-$16/month), mobile apps, and straightforward reviews plus engagement surveys.",
  "bestForToolB": "Larger organizations needing DEI assessments, benchmarking against 6,000+ companies, 360-degree feedback, and documented SOC II/ISO/GDPR compliance, willing to go through a custom quote process.",
  "whoNeedsBoth": "There's no clear complementary scenario here - 15Five and Culture Amp overlap heavily on reviews, surveys, and 1-on-1 tools, so companies typically pick one as their system of record rather than running both.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "15Five publishes exact per-user tiers: Engage at $4/user/month, Perform at $11/user/month, and Total Platform at $16/user/month, billed annually.",
      "toolB": "Culture Amp has no public pricing; it requires a quote based on employee count, products selected, and service tier.",
      "whyItMatters": "Published pricing lets smaller teams budget without a sales cycle, while custom pricing usually reflects enterprise-scale deals.",
      "benefitsWho": "Budget-conscious buyers who want to compare cost without a sales call."
    },
    {
      "title": "360-Degree Feedback",
      "toolA": "15Five's feature list does not document 360-degree feedback specifically.",
      "toolB": "Culture Amp's Perform module explicitly includes 360-degree feedback alongside continuous feedback and reviews.",
      "whyItMatters": "360 feedback requires structured multi-rater workflows that aren't the same as manager-only reviews.",
      "benefitsWho": "Organizations running formal multi-rater review cycles."
    },
    {
      "title": "DEI Assessments and Benchmarking",
      "toolA": "15Five's engagement surveys include predictive analytics but don't document DEI assessments or cross-company benchmarking.",
      "toolB": "Culture Amp's Engage product explicitly includes DEI assessments and benchmarking against other companies.",
      "whyItMatters": "Benchmarking against peer companies gives context to engagement scores that raw internal data can't provide.",
      "benefitsWho": "People teams tracking DEI progress and comparing engagement scores to industry peers."
    },
    {
      "title": "AI Feature Focus",
      "toolA": "15Five offers Kona, an add-on AI assistant for manager coaching, plus AI-assisted performance reviews.",
      "toolB": "Culture Amp offers AI Coach for instant performance insights and AI-generated comment summaries within Engage surveys.",
      "whyItMatters": "The two platforms apply AI to different parts of the workflow - manager coaching versus survey comment summarization.",
      "benefitsWho": "Managers wanting AI coaching support (15Five) versus HR teams wanting faster survey analysis (Culture Amp)."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "15Five does not publicly document specific compliance certifications.",
      "toolB": "Culture Amp states it is SOC II, ISO, and GDPR compliant.",
      "whyItMatters": "Enterprise procurement often requires documented compliance certifications before approving a vendor.",
      "benefitsWho": "Enterprise buyers with formal security and compliance review requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Performance Management",
      "rows": [
        {
          "feature": "AI-assisted performance reviews",
          "toolA": "available",
          "toolB": "available",
          "note": "15Five: Kona; Culture Amp: AI Coach"
        },
        {
          "feature": "360-degree feedback",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Goals/OKR tracking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "1-on-1 meeting tools",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Engagement & Surveys",
      "rows": [
        {
          "feature": "Pulse/engagement surveys",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "DEI assessments",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Cross-company benchmarking",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-generated survey comment summaries",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing, Compliance & Access",
      "rows": [
        {
          "feature": "Published per-user pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "15Five: $4-$16/user/month"
        },
        {
          "feature": "Compliance certifications (SOC II/ISO/GDPR)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Broad HRIS/HR SaaS integrations",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, 15Five or Culture Amp?",
      "answer": "15Five publishes fixed tiers of $4, $11, and $16 per user/month. Culture Amp requires a custom quote with no public pricing, so a direct cost comparison isn't possible from public information."
    },
    {
      "question": "Does Culture Amp offer 360-degree feedback?",
      "answer": "Yes, as part of its Perform product. 15Five's feature list does not document 360-degree feedback specifically."
    },
    {
      "question": "What AI features does each offer?",
      "answer": "15Five has Kona, an add-on AI assistant for manager coaching, plus AI-assisted reviews. Culture Amp has AI Coach for instant performance insights and AI-generated comment summaries within Engage."
    },
    {
      "question": "Which has stronger documented compliance credentials?",
      "answer": "Culture Amp publicly states SOC II, ISO, and GDPR compliance. 15Five does not document specific certifications."
    },
    {
      "question": "Does 15Five have a free trial or free plan?",
      "answer": "No. Per its own FAQs, no free tier is listed on 15Five's pricing page - all tiers require a paid subscription."
    },
    {
      "question": "Which platform serves more customers?",
      "answer": "Culture Amp reports 6,000+ companies including Canva, Etsy, and Intercom. 15Five reports 3,000+ customers and 250,000+ employees."
    }
  ]
};

export default _15fiveVsCultureAmpContent;

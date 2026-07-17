import type { ToolComparisonContent } from './types';

const colossyanVsDIdContent: ToolComparisonContent = {
  "verdict": "Colossyan and D-ID both generate AI avatar video, but they're built for different outcomes: Colossyan is structured around building and exporting interactive training courses (quizzes, SCORM, LMS integration), while D-ID centers on flexible video generation plus real-time conversational avatar agents and API-driven presentation narration. The right pick depends on whether the priority is structured e-learning or interactive, real-time avatar experiences.",
  "bestForToolA": "Learning & development or HR teams building structured training courses that need quizzes, branching scenarios, and SCORM export into an LMS.",
  "bestForToolB": "Teams needing real-time, interactive conversational avatar agents, or developers who want to embed avatar video generation into their own app via API and connect it to PowerPoint, Canva, or Google Slides.",
  "whoNeedsBoth": "A company producing formal SCORM-based onboarding courses might use Colossyan for that library while also running a D-ID-powered interactive avatar agent on its website or in live presentations.",
  "keyDifferences": [
    {
      "title": "Course structure vs. flexible video/agent generation",
      "toolA": "Purpose-built for courses: combines videos, text, and interactions into structured training programs with quizzes and branching scenarios.",
      "toolB": "Generates avatar videos from scripts/documents and also offers real-time, interactive conversational avatar agents for live engagement.",
      "whyItMatters": "Structured e-learning needs assessment and sequencing tools that a general video generator doesn't provide, while interactive/live use cases need real-time conversational capability a course tool doesn't offer.",
      "benefitsWho": "L&D teams benefit from Colossyan's course tools; product/support teams building interactive experiences benefit from D-ID's real-time avatars."
    },
    {
      "title": "LMS/SCORM export",
      "toolA": "Exports courses in SCORM format for direct integration with learning management systems.",
      "toolB": "No SCORM or LMS export feature is documented.",
      "whyItMatters": "Organizations tracking training completion typically require SCORM compatibility with their LMS.",
      "benefitsWho": "Corporate training/compliance teams benefit specifically from Colossyan's SCORM support."
    },
    {
      "title": "Presentation and app integrations",
      "toolA": "No presentation-tool integrations documented.",
      "toolB": "Connects with Microsoft PowerPoint, Canva, and Google Slides for avatar-narrated presentations, plus a general API.",
      "whyItMatters": "Teams that already build content in PowerPoint/Slides benefit from direct narration integration rather than a separate video workflow.",
      "benefitsWho": "Sales, marketing, and presentation-heavy teams benefit from D-ID's presentation integrations."
    },
    {
      "title": "Free access and pricing transparency",
      "toolA": "Free Starter tier (no credit card) capped at 20 minutes/month with the NEO avatar; paid Professional plan is $59/month with clearly published pricing.",
      "toolB": "Offers a free trial through its Studio product, but full pricing is split across separate Studio and API pricing pages rather than shown on one page.",
      "whyItMatters": "Clear, single-page pricing makes budgeting easier than pricing split across multiple product pages.",
      "benefitsWho": "Buyers who want upfront pricing clarity benefit from Colossyan's published tiers."
    },
    {
      "title": "Compliance credentials stated",
      "toolA": "States SOC 2 Type II and GDPR compliance.",
      "toolB": "No compliance certifications are documented in the available facts.",
      "whyItMatters": "Enterprise and regulated buyers often screen vendors for stated compliance certifications before adoption.",
      "benefitsWho": "Enterprise training/compliance teams benefit from Colossyan's stated certifications."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Video Features",
      "rows": [
        {
          "feature": "Avatar video generation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Voice cloning",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multilingual translation",
          "toolA": "available",
          "toolB": "available",
          "note": "Colossyan: 100+ languages; D-ID: 120+ languages"
        },
        {
          "feature": "Real-time conversational avatars",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Interactive quizzes/branching scenarios",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Distribution & Integrations",
      "rows": [
        {
          "feature": "SCORM/LMS export",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Presentation tool integrations (PowerPoint/Canva/Slides)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing, Access & Compliance",
      "rows": [
        {
          "feature": "Free tier with no credit card required",
          "toolA": "available",
          "toolB": "limited",
          "note": "D-ID offers a free trial, not a no-credit-card free tier"
        },
        {
          "feature": "Watermark-free output",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Both require a paid tier above the entry plan"
        },
        {
          "feature": "Single-page published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "D-ID's pricing is split across separate Studio and API pages"
        },
        {
          "feature": "SOC 2 compliance stated",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "GDPR compliance stated",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Colossyan have a free plan?",
      "answer": "Yes, the Starter tier is free with a limited monthly avatar-minute allowance (20 minutes with the NEO avatar) and no credit card required."
    },
    {
      "question": "Does D-ID offer a free trial?",
      "answer": "Yes, D-ID offers a free trial through its Studio product at studio.d-id.com."
    },
    {
      "question": "Can Colossyan courses be exported to an LMS?",
      "answer": "Yes, Colossyan supports SCORM export for learning management systems."
    },
    {
      "question": "Does D-ID support real-time interaction?",
      "answer": "Yes, D-ID offers real-time conversational avatar agents for live, interactive engagement, in addition to script-based video generation."
    },
    {
      "question": "Do D-ID videos include a watermark?",
      "answer": "Videos created on the Trial and Lite plans include a D-ID watermark; higher tiers remove it."
    },
    {
      "question": "What languages do these platforms support?",
      "answer": "Colossyan supports automated translation into 100+ languages; D-ID supports video creation and real-time interactions in more than 120 languages."
    }
  ]
};

export default colossyanVsDIdContent;

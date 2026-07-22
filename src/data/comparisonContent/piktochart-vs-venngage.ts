import type { ToolComparisonContent } from './types';

const piktochartVsVenngageContent: ToolComparisonContent = {
  "verdict": "Piktochart and Venngage are both freemium infographic-and-report design tools with AI generation and Brand Kits, but they differ in library scale and how their free tiers cap usage. Venngage's free plan limits total designs to 5 but includes an AI trial and a large 10,000+ template library with 4M+ assets; Piktochart's free plan allows unlimited projects but only 2 PNG downloads, with a smaller 230+ template library. The choice comes down to whether unlimited project creation or a bigger template/asset library and accessibility checking matter more.",
  "bestForToolA": "Users who want to work on unlimited draft projects for free (even if final PNG exports are capped at 2) and who value published AI credit counts (60/500/1,000 across tiers) and dedicated Education/Nonprofit pricing.",
  "bestForToolB": "Users who want the largest available template and asset library (10,000+ templates, 4M+ icons/illustrations/photos/maps), multi-language support (7 languages), and an AI-powered WCAG accessibility checker.",
  "whoNeedsBoth": "Agencies producing infographics for varied clients might use Venngage for its larger template library and accessibility checking on client-facing work, while using Piktochart for quick data-driven reports pulled directly from spreadsheets.",
  "keyDifferences": [
    {
      "title": "Free plan shape",
      "toolA": "Piktochart's free plan allows unlimited visual projects with 60 AI credits, but caps output at 2 PNG downloads.",
      "toolB": "Venngage's free plan caps total designs at 5 (not exports) but includes a free AI trial, free icons/widgets, and 6 image uploads.",
      "whyItMatters": "The two tools limit free usage differently — one limits exports, the other limits how many designs you can create.",
      "benefitsWho": "Budget-conscious individuals deciding which cap matters less for their workflow."
    },
    {
      "title": "Accessibility checking",
      "toolA": "Not documented for Piktochart.",
      "toolB": "Venngage includes an AI accessibility checker that reviews designs for WCAG compliance.",
      "whyItMatters": "Teams under accessibility requirements need built-in compliance checks rather than manual review.",
      "benefitsWho": "Organizations with WCAG compliance obligations, such as government, education, or healthcare communicators."
    },
    {
      "title": "Template and asset library size",
      "toolA": "Piktochart documents 230+ templates.",
      "toolB": "Venngage documents 10,000+ templates and 4M+ icons/illustrations/stock photos/maps.",
      "whyItMatters": "A larger library reduces the chance of reusing the same visual style as competitors and speeds up finding an on-brand starting point.",
      "benefitsWho": "Design and marketing teams producing high volumes of varied visual content."
    },
    {
      "title": "PDF/PPT export pricing",
      "toolA": "Piktochart gates PDF/PPT export behind the $17/month Business plan.",
      "toolB": "Venngage gates PDF/PPT export behind the $24/month-per-user Business plan.",
      "whyItMatters": "The cost to unlock document-ready export formats differs, affecting total cost for teams needing these formats.",
      "benefitsWho": "Teams whose primary deliverable is a downloadable PDF or PowerPoint file."
    },
    {
      "title": "Multi-language interface",
      "toolA": "Not documented for Piktochart.",
      "toolB": "Venngage supports English, Spanish, French, Italian, Portuguese, German, and Arabic.",
      "whyItMatters": "Teams working in non-English markets need a localized interface to reduce friction for staff.",
      "benefitsWho": "International or multilingual marketing teams."
    }
  ],
  "featureMatrix": [
    {
      "group": "Templates & Assets",
      "rows": [
        {
          "feature": "Template library size",
          "toolA": "available",
          "toolB": "available",
          "note": "Piktochart: 230+; Venngage: 10,000+"
        },
        {
          "feature": "Icon/asset library",
          "toolA": "available",
          "toolB": "available",
          "note": "Piktochart: 5M+ icons at Pro tier; Venngage: 4M+ icons/illustrations/photos/maps"
        },
        {
          "feature": "Brand Kit",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Accessibility",
      "rows": [
        {
          "feature": "AI design generation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI accessibility (WCAG) checker",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Published AI credit counts",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Piktochart: 60/500/1,000 across tiers"
        }
      ]
    },
    {
      "group": "Export & Formats",
      "rows": [
        {
          "feature": "PNG export",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "PDF/PPT export",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Piktochart Business ($17/mo); Venngage Business ($24/mo/user)"
        },
        {
          "feature": "HTML export",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Education/Nonprofit pricing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Enterprise minimum size",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Venngage Enterprise: 10-member minimum, from $499/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which has a bigger template library, Piktochart or Venngage?",
      "answer": "Venngage documents over 10,000 templates versus Piktochart's 230+."
    },
    {
      "question": "Does either tool check for accessibility compliance?",
      "answer": "Venngage includes an AI accessibility checker for WCAG compliance. This is not documented as a Piktochart feature."
    },
    {
      "question": "Which free plan is more generous?",
      "answer": "It depends on what you need: Piktochart's free plan allows unlimited projects but only 2 PNG downloads, while Venngage's free plan caps designs at 5 but includes a free AI trial."
    },
    {
      "question": "Do these tools support multiple languages?",
      "answer": "Venngage supports 7 languages including Arabic and German. No specific language support is documented for Piktochart."
    },
    {
      "question": "How much do PDF exports cost on each?",
      "answer": "Piktochart requires its $17/month Business plan for PDF export; Venngage requires its $24/month-per-user Business plan."
    }
  ]
};

export default piktochartVsVenngageContent;

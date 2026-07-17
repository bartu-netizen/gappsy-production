import type { ToolComparisonContent } from './types';

const piktochartVsVismeContent: ToolComparisonContent = {
  "verdict": "Piktochart and Visme are both freemium, browser-based design tools built around templates and AI-assisted generation, but they optimize for different jobs: Piktochart is tuned for infographics and data-heavy reports with direct spreadsheet import, while Visme spans a wider content mix — presentations, documents, and video — with named integrations into tools like HubSpot and Salesforce. Neither is a clear winner; the right pick depends on whether the core output is a data-driven infographic or a broader mix of presentation and video content tied into other business systems.",
  "bestForToolA": "Teams whose primary output is infographics, reports, and data visualizations pulled from CSV, Excel, or Google Sheets, and who want AI credit allotments that scale predictably by plan (60/500/1,000 credits across Free, Pro, and Business).",
  "bestForToolB": "Teams that need one tool for presentations, infographics, documents, and video, want PDF export available on the entry paid tier ($12.25/month), and rely on integrations like HubSpot, Salesforce, Slack, or monday.com.",
  "whoNeedsBoth": "Marketing teams that produce both structured data reports and broader multimedia content may use Piktochart for infographic-heavy pieces and Visme for presentations or video assets, since each documents strengths the other doesn't cover.",
  "keyDifferences": [
    {
      "title": "PDF and PowerPoint export gating",
      "toolA": "Piktochart requires the $17/month Business plan for unlimited PNG, PDF, and PPT downloads; Free and Pro ($10/month) are documented as PNG-only.",
      "toolB": "Visme includes JPG/PNG/PDF downloads starting on its $12.25/month Starter plan; PPTX, HTML5, and video/GIF exports require the $24.75/month Pro plan.",
      "whyItMatters": "Teams that need to hand off a PDF report reach that capability at a lower price point on Visme than on Piktochart.",
      "benefitsWho": "Small teams and freelancers on a tight budget who need PDF exports without jumping to a top paid tier."
    },
    {
      "title": "AI credit transparency",
      "toolA": "Piktochart documents specific AI credit counts per tier: 60 on Free, 500 on Pro, 1,000 on Business.",
      "toolB": "Visme's AI Designer generates designs from text prompts, but no specific credit or usage limits are documented.",
      "whyItMatters": "Predictable AI credit ceilings let teams estimate how much AI generation they can do before needing to upgrade.",
      "benefitsWho": "Teams that lean on AI-generated first drafts and want to know their monthly allotment in advance."
    },
    {
      "title": "Integrations and languages",
      "toolA": "No specific third-party integrations or supported interface languages are documented for Piktochart.",
      "toolB": "Visme lists integrations with HubSpot, Salesforce, Slack, and monday.com, plus 15+ interface languages.",
      "whyItMatters": "Teams already standardized on a CRM or team chat tool benefit from native integrations rather than manual export/import.",
      "benefitsWho": "Sales and marketing teams embedded in HubSpot or Salesforce workflows, and multilingual teams."
    },
    {
      "title": "Content scope",
      "toolA": "Piktochart focuses on infographics, reports, and data visualizations (pie, bar, pictograph charts) with direct spreadsheet import.",
      "toolB": "Visme covers presentations, infographics, documents, and video, plus a social media scheduler for publishing directly.",
      "whyItMatters": "Content breadth affects whether one tool can replace multiple point solutions.",
      "benefitsWho": "Content and social teams needing design-to-publish in one platform versus reporting teams needing spreadsheet-driven charts."
    },
    {
      "title": "Free tier limits",
      "toolA": "Piktochart's free plan allows unlimited visual projects and 60 AI credits but caps PNG downloads at 2.",
      "toolB": "Visme's free Basic plan allows unlimited projects but restricts premium templates, assets, and export formats.",
      "whyItMatters": "Both free tiers cap output differently, affecting how much value can be extracted before paying.",
      "benefitsWho": "Solo users or students testing the tools before committing to a paid plan."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Design Features",
      "rows": [
        {
          "feature": "AI design generation",
          "toolA": "available",
          "toolB": "available",
          "note": "Piktochart's AI Infographic Generator vs. Visme's AI Designer"
        },
        {
          "feature": "Data visualization / charts",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Template library size",
          "toolA": "available",
          "toolB": "available",
          "note": "Piktochart documents 230+ templates; Visme documents a large but unnumbered template library"
        },
        {
          "feature": "Brand Kit",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Real-time collaboration",
          "toolA": "not-documented",
          "toolB": "available"
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
          "feature": "PDF export",
          "toolA": "limited",
          "toolB": "available",
          "note": "Piktochart requires Business plan ($17/mo); Visme includes it from Starter ($12.25/mo)"
        },
        {
          "feature": "PPTX / video export",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Visme Pro plan ($24.75/mo)"
        },
        {
          "feature": "Interactive/embeddable content",
          "toolA": "available",
          "toolB": "not-documented"
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
          "feature": "Education/Nonprofit discount pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Visme's Student/Educator plans are $48/yr and $96/yr"
        },
        {
          "feature": "Enterprise plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Visme Enterprise requires a 10-user minimum"
        }
      ]
    },
    {
      "group": "Integrations & Reach",
      "rows": [
        {
          "feature": "Named CRM/collaboration integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "HubSpot, Salesforce, Slack, monday.com"
        },
        {
          "feature": "Multi-language interface",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "15+ languages"
        },
        {
          "feature": "Social media publishing scheduler",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Piktochart or Visme free to use?",
      "answer": "Both offer free tiers. Piktochart's free plan includes unlimited visual projects, 60 AI credits, and 2 PNG downloads. Visme's free Basic plan includes unlimited projects but limits templates, assets, and export formats."
    },
    {
      "question": "Which one lets me export to PDF for less money?",
      "answer": "Visme includes PDF export on its $12.25/month Starter plan, while Piktochart requires the $17/month Business plan for PDF and PowerPoint export."
    },
    {
      "question": "Does either tool integrate with a CRM?",
      "answer": "Visme documents integrations with HubSpot, Salesforce, Slack, and monday.com. No specific CRM integrations are documented for Piktochart."
    },
    {
      "question": "Which tool has more transparent AI credit limits?",
      "answer": "Piktochart publishes specific AI credit counts: 60 on Free, 500 on Pro ($10/month), and 1,000 on Business ($17/month). Visme's AI Designer is available but no credit limits are documented."
    },
    {
      "question": "Can I create video content in either tool?",
      "answer": "Visme supports video export (PPTX/HTML5/video/GIF) from its Pro plan. Video export is not documented as a Piktochart feature."
    },
    {
      "question": "Does either offer discounted pricing for students or nonprofits?",
      "answer": "Piktochart offers dedicated Education and Nonprofit pricing tiers. Visme offers separate Student ($48/year) and Educator ($96/year) plans."
    }
  ]
};

export default piktochartVsVismeContent;

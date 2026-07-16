import type { ToolComparisonContent } from './types';

const hotjarVsMicrosoftClarityContent: ToolComparisonContent = {
  "verdict": "Hotjar and Microsoft Clarity both pair heatmaps with session recordings, but they're built for different jobs and budgets. Hotjar is a freemium behavior-analytics suite that layers structured qualitative research on top of recordings: on-site NPS/CSAT surveys, a feedback widget for annotated visitor comments, basic conversion funnel tracking, and a broader third-party integration list including Slack, Jira, and Zapier. That depth comes at a cost once you're past a low daily session cap on the free tier — paid plans start around $39/month, and Hotjar's ongoing integration into Contentsquare, following the 2021 acquisition and 2025 merger, has brought some branding and plan changes for existing users. Microsoft Clarity removes the price question entirely: heatmaps, session recordings, rage/dead-click flags, JavaScript error tracking, and native GA4 integration are all free with no traffic or session caps, and its Clarity Copilot AI layer summarizes sessions and answers plain-language questions about visitor behavior — a capability not present in Hotjar's documented feature set. What Clarity doesn't offer, based on documented features, is on-site surveys, a feedback widget, or funnel tracking. The decision isn't which tool is objectively better — it's whether the job requires collecting structured feedback and mapping conversion funnels (Hotjar) or just needs free, unlimited-volume behavior replay with AI-assisted analysis (Clarity).",
  "bestForToolA": "Hotjar fits teams that need structured qualitative research beyond recordings — on-site surveys, a feedback widget, and funnel tracking — and are willing to pay for higher session volume as they scale.",
  "bestForToolB": "Microsoft Clarity fits teams and site owners who want unlimited, free heatmaps and session recordings with AI-summarized insights, especially those already standardized on GA4.",
  "whoNeedsBoth": "Teams that want Clarity's free, uncapped heatmaps and recordings for everyday UX monitoring but still need Hotjar's surveys, feedback widget, and funnel tracking for structured qualitative research would reasonably run both.",
  "keyDifferences": [
    {
      "title": "Pricing model",
      "toolA": "Freemium with paid plans from around $39/month (Plus, Business, Scale)",
      "toolB": "Completely free with no paid tiers at all",
      "whyItMatters": "Determines whether behavior analytics is a recurring line-item cost or a zero-cost addition to the stack.",
      "benefitsWho": "Budget-constrained teams and solo site owners benefit most from Clarity's free model; teams needing survey/funnel depth may accept Hotjar's cost."
    },
    {
      "title": "Session and traffic caps",
      "toolA": "Free plan capped at 35 daily sessions for heatmaps and recordings",
      "toolB": "No caps on sessions, page views, or number of websites tracked",
      "whyItMatters": "High-traffic sites can exhaust Hotjar's free allotment quickly, forcing an upgrade decision Clarity never requires.",
      "benefitsWho": "High-traffic or multi-site operators benefit most from Clarity's uncapped tracking."
    },
    {
      "title": "AI-powered behavioral insights",
      "toolA": "No AI summarization or chat-based insights documented",
      "toolB": "Clarity Copilot generates AI session summaries and answers behavioral questions in plain language",
      "whyItMatters": "AI insights can cut down the time spent manually reviewing recordings to find friction points.",
      "benefitsWho": "Small teams without dedicated analysts benefit most from Clarity Copilot's automated summaries."
    },
    {
      "title": "On-site surveys and feedback collection",
      "toolA": "Dedicated on-site NPS/CSAT surveys, a feedback widget, and pre-built survey templates",
      "toolB": "Not documented as part of Clarity's feature set",
      "whyItMatters": "Structured voice-of-customer data requires purpose-built survey and feedback tools, not just behavior replay.",
      "benefitsWho": "Product and UX research teams running structured feedback programs benefit most from Hotjar."
    },
    {
      "title": "Conversion funnel tracking",
      "toolA": "Basic conversion funnel tracking highlights multi-step drop-off points",
      "toolB": "Not documented as part of Clarity's feature set",
      "whyItMatters": "Funnels let teams pinpoint exactly where in a flow users abandon, which heatmaps and recordings alone don't quantify.",
      "benefitsWho": "Growth and conversion-optimization teams benefit most from Hotjar's funnel reporting."
    },
    {
      "title": "Google Analytics integration depth",
      "toolA": "Integrates with Google Analytics as one of several third-party connections (alongside Slack, Jira, Zapier)",
      "toolB": "Native, purpose-built GA4 integration to filter recordings and heatmaps by GA4 segments and metrics",
      "whyItMatters": "A tighter GA4 integration lets teams jump directly from quantitative segments to matching qualitative sessions.",
      "benefitsWho": "Teams standardized on GA4 as their primary analytics tool benefit most from Clarity's native tie-in."
    },
    {
      "title": "JavaScript error tracking",
      "toolA": "Not documented as part of Hotjar's feature set",
      "toolB": "Surfaces client-side JavaScript errors encountered during real user sessions",
      "whyItMatters": "Catching real errors tied to actual sessions helps engineering teams reproduce and prioritize bugs faster.",
      "benefitsWho": "Engineering and QA teams benefit most from Clarity's built-in error surfacing."
    },
    {
      "title": "Sensitive data masking approach",
      "toolA": "Includes settings to mask sensitive form fields and text, requiring teams to configure them correctly",
      "toolB": "Masks sensitive inputs like passwords and payment fields automatically by default",
      "whyItMatters": "Default-on masking reduces the risk of accidentally recording sensitive data before anyone remembers to configure privacy settings.",
      "benefitsWho": "Teams without a dedicated privacy/compliance reviewer benefit most from Clarity's automatic defaults."
    },
    {
      "title": "CMS and tag manager quick setup",
      "toolA": "Installed via a lightweight JavaScript snippet plus API access; no CMS-specific setup documented",
      "toolB": "Ready-made setup options for WordPress, Shopify, and Google Tag Manager alongside a standard script",
      "whyItMatters": "Pre-built CMS integrations lower the technical bar for non-developers to install tracking correctly.",
      "benefitsWho": "Non-technical site owners on WordPress or Shopify benefit most from Clarity's guided setup paths."
    },
    {
      "title": "Company backing and product trajectory",
      "toolA": "Acquired by Contentsquare in 2021 and formally merged into the Contentsquare group in 2025, changing branding and plans over time",
      "toolB": "Developed and backed by Microsoft, offered free with no indication of a paid roadmap",
      "whyItMatters": "Ownership changes can mean shifting pricing, branding, or feature availability, which matters for long-term planning.",
      "benefitsWho": "Teams wanting stability in pricing and branding may weigh Clarity's Microsoft backing against Hotjar's recent corporate integration."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Behavior Analytics",
      "rows": [
        {
          "feature": "Heatmaps (click/scroll/move)",
          "toolA": "available",
          "toolB": "available",
          "note": "Both cover click, scroll, and movement/area heatmaps"
        },
        {
          "feature": "Session recordings",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Rage click and dead click detection",
          "toolA": "available",
          "toolB": "available",
          "note": "Hotjar also flags u-turns; Clarity pairs this with JS error detection"
        },
        {
          "feature": "Conversion funnel tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Described as basic funnel tracking in Hotjar's feature set"
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-generated session summaries",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Clarity Copilot feature"
        },
        {
          "feature": "Chat-based Q&A over behavioral data",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Part of Clarity Copilot"
        }
      ]
    },
    {
      "group": "Feedback and Voice of Customer",
      "rows": [
        {
          "feature": "On-site surveys (NPS/CSAT)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Feedback widget for annotated comments",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Pre-built survey/feedback templates",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Includes NPS, PMF, post-purchase templates"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Google Analytics integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Clarity's is a native GA4 integration; Hotjar's is one of several general integrations"
        },
        {
          "feature": "Marketing/dev tool integrations (Slack, Jira, Zapier)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "CMS and tag manager quick setup (WordPress, Shopify, GTM)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Privacy and Data Handling",
      "rows": [
        {
          "feature": "Sensitive field masking",
          "toolA": "available",
          "toolB": "available",
          "note": "Hotjar requires manual configuration; Clarity masks by default automatically"
        },
        {
          "feature": "JavaScript error tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free plan availability",
          "toolA": "available",
          "toolB": "available",
          "note": "Hotjar's free plan is capped at 35 daily sessions; Clarity's is unlimited"
        },
        {
          "feature": "Paid/premium tiers",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Hotjar offers Plus, Business, and Scale plans; Clarity has no paid tiers"
        },
        {
          "feature": "Uncapped traffic on free tier",
          "toolA": "limited",
          "toolB": "available",
          "note": "Hotjar's free tier is capped at 35 sessions/day; paid tiers raise but don't confirm unlimited volume"
        }
      ]
    },
    {
      "group": "Developer and Customization",
      "rows": [
        {
          "feature": "Developer API access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Tracking snippet installation",
          "toolA": "available",
          "toolB": "available",
          "note": "Clarity also offers script, GTM, and CMS install paths"
        },
        {
          "feature": "Segmentation and custom filters",
          "toolA": "available",
          "toolB": "available",
          "note": "Hotjar filters by device, source, URL, or custom attributes; Clarity by device, browser, country, referrer, UTM, or custom tags"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Hotjar or Microsoft Clarity?",
      "answer": "Microsoft Clarity is cheaper because it is entirely free with no paid tiers, while Hotjar is freemium with paid plans starting from around $39/month once you outgrow its capped free plan."
    },
    {
      "question": "Is Microsoft Clarity really free forever, unlike Hotjar?",
      "answer": "Yes — Clarity has no paid tiers, traffic caps, or session limits, whereas Hotjar's free plan is capped at 35 daily sessions for heatmaps and recordings before you need to upgrade."
    },
    {
      "question": "Does Hotjar or Microsoft Clarity have AI-powered insights?",
      "answer": "Microsoft Clarity has AI-powered insights through Clarity Copilot, which generates session summaries and answers questions about visitor behavior; this capability is not part of Hotjar's documented feature set."
    },
    {
      "question": "Can Microsoft Clarity replace Hotjar's surveys and feedback widget?",
      "answer": "No — based on documented features, Clarity does not offer on-site surveys, a feedback widget, or survey templates, which are core parts of Hotjar's toolset for structured qualitative feedback."
    },
    {
      "question": "Which tool is easier to set up for beginners?",
      "answer": "Both are straightforward to set up with a lightweight tracking snippet, but Clarity additionally offers ready-made setup options for WordPress, Shopify, and Google Tag Manager, which can be simpler for non-developers than Hotjar's snippet-and-API approach."
    },
    {
      "question": "Does Hotjar or Clarity integrate better with Google Analytics?",
      "answer": "Microsoft Clarity has a native GA4 integration built to filter recordings and heatmaps by GA4 segments and metrics, while Hotjar lists Google Analytics as one of several general third-party integrations alongside Slack, Jira, and Zapier."
    }
  ]
};

export default hotjarVsMicrosoftClarityContent;

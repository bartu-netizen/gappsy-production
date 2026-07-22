import type { ToolComparisonContent } from './types';

const oncrawlVsSitebulbContent: ToolComparisonContent = {
  "verdict": "Oncrawl and Sitebulb both target technical SEO crawling, but Oncrawl is built around enterprise-scale, unsampled crawl-plus-log-file analysis with an AI Search Lens and no public pricing or trial, while Sitebulb is a more accessible desktop-or-cloud crawler with a genuine 14-day free trial and prioritized issue explanations. The right pick depends on whether server log analysis and demo-gated enterprise depth or low-friction trial access and flexible deployment matters more.",
  "bestForToolA": "Large, complex sites that need server log file analysis alongside crawling, want unsampled (100% data) processing, and are comfortable going through a demo/quote process rather than a self-serve trial.",
  "bestForToolB": "Teams that want to test a fully-featured product for 14 days without a credit card, need a one-time desktop license option instead of a subscription, or want free JavaScript rendering bundled in by default.",
  "whoNeedsBoth": "Agencies with a portfolio spanning small sites (where Sitebulb's desktop license and free trial fit) and enterprise sites needing bot-behavior log analysis may license both rather than force every client onto one platform.",
  "keyDifferences": [
    {
      "title": "Trial and evaluation model",
      "toolA": "Oncrawl requires booking a demo; no free trial or free plan is advertised on the site.",
      "toolB": "Sitebulb offers a 14-day fully-featured free trial with no credit card required.",
      "whyItMatters": "Teams that want to test functionality before any sales conversation get a much lower-friction path with Sitebulb.",
      "benefitsWho": "Smaller technical SEO teams or consultants evaluating tools independently without going through procurement or demo calls."
    },
    {
      "title": "Log file analysis",
      "toolA": "Oncrawl includes a dedicated Log File Analyzer processing 500M+ log lines daily to track search engine bot behavior.",
      "toolB": "Log file analysis isn't documented among Sitebulb's features.",
      "whyItMatters": "Log analysis reveals how search engine bots actually crawl a site, which is critical for large sites diagnosing crawl-budget issues.",
      "benefitsWho": "Enterprise technical SEO teams diagnosing crawl-budget and bot-behavior issues on large sites."
    },
    {
      "title": "Deployment model",
      "toolA": "Oncrawl is positioned as a cloud-based platform without a documented desktop option.",
      "toolB": "Sitebulb offers both a locally-installed Desktop app (Lite up to 10,000 URLs, Pro up to 500,000 URLs) and a Cloud plan (up to 10 million URLs, with automated recurring crawls).",
      "whyItMatters": "Teams that prefer a one-time desktop license rather than an ongoing subscription, or need offline/local control, have that option only with Sitebulb.",
      "benefitsWho": "Freelancers or small agencies that prefer a one-time desktop purchase over a recurring enterprise contract."
    },
    {
      "title": "Data processing approach at scale",
      "toolA": "Oncrawl has processed 300M+ URLs and explicitly emphasizes 100% unsampled data processing rather than statistical sampling.",
      "toolB": "Sitebulb's Cloud plan supports crawls up to 10 million URLs per audit; unsampled processing isn't specifically documented.",
      "whyItMatters": "For very large sites, whether data is sampled or fully processed affects the completeness and reliability of technical SEO conclusions.",
      "benefitsWho": "Large publishers or e-commerce sites where sampling could hide issues on long-tail pages."
    },
    {
      "title": "AI-focused analysis tooling",
      "toolA": "Oncrawl includes a dedicated AI Search Lens as part of its pre-built analysis Lenses for AI-driven search visibility insight.",
      "toolB": "Sitebulb's 300+ checks focus on traditional technical SEO issues with prioritized 'Hints'; a dedicated AI-analysis lens isn't documented.",
      "whyItMatters": "Teams specifically investigating AI search visibility get a purpose-built lens from Oncrawl rather than needing to interpret general technical findings.",
      "benefitsWho": "Enterprise SEO teams tasked with reporting on AI/GEO readiness specifically."
    }
  ],
  "featureMatrix": [
    {
      "group": "Crawling & Scale",
      "rows": [
        {
          "feature": "JavaScript rendering",
          "toolA": "available",
          "toolB": "available",
          "note": "Sitebulb includes it at no extra cost on all plans."
        },
        {
          "feature": "Large-scale crawling",
          "toolA": "available",
          "toolB": "available",
          "note": "Oncrawl has processed 300M+ URLs across its platform; Sitebulb supports up to 500k URLs (Desktop Pro) or 10M (Cloud) per audit."
        },
        {
          "feature": "Unsampled/100% data processing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Technical Analysis",
      "rows": [
        {
          "feature": "Automated issue detection with prioritized explanations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Oncrawl instead offers monitoring & alerts for regressions."
        },
        {
          "feature": "Log file analysis",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI Search Lens / AI-focused analysis",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Access & Deployment",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Sitebulb: 14 days, no credit card."
        },
        {
          "feature": "Desktop/local install option",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require checking a pricing page or contacting sales for exact rates."
        }
      ]
    },
    {
      "group": "Reporting & Integrations",
      "rows": [
        {
          "feature": "Custom PDF reporting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Full REST API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Third-party integrations (GSC, GA, Sheets, Data Studio)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does either tool offer a free trial?",
      "answer": "Sitebulb offers a 14-day fully-featured free trial with no credit card required. Oncrawl doesn't advertise a free trial; the site promotes demo-based onboarding instead."
    },
    {
      "question": "Which tool analyzes server logs?",
      "answer": "Oncrawl has a dedicated Log File Analyzer that processes 500M+ log lines daily to track search engine bot behavior. This isn't a documented Sitebulb feature."
    },
    {
      "question": "Can I install either tool locally instead of using the cloud?",
      "answer": "Sitebulb offers a Desktop app (Lite up to 10,000 URLs, Pro up to 500,000 URLs) alongside its Cloud plan. Oncrawl is positioned as a cloud-based platform without a documented desktop option."
    },
    {
      "question": "Does JavaScript rendering cost extra?",
      "answer": "Sitebulb includes JavaScript rendering at no extra cost on all plans. Oncrawl's crawler also renders JavaScript, per its feature description."
    },
    {
      "question": "Which tool has published pricing?",
      "answer": "Neither publishes exact rates in full. Oncrawl requires booking a demo for a quote, and Sitebulb's exact Cloud and Desktop pricing requires checking the pricing page or sales."
    },
    {
      "question": "Does either offer an API?",
      "answer": "Oncrawl provides a full REST API for custom integrations and workflows. An API isn't documented among Sitebulb's listed features."
    }
  ]
};

export default oncrawlVsSitebulbContent;

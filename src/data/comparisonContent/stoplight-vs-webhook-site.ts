import type { ToolComparisonContent } from './types';

const stoplightVsWebhookSiteContent: ToolComparisonContent = {
  "verdict": "Stoplight is a design-first platform for building, documenting, mocking, and governing OpenAPI-based APIs with style guides and Git sync, starting at $44/month (billed annually) for a 3-user Basic plan. Webhook.site is a lightweight request-inspection tool for capturing and debugging incoming HTTP requests, emails, and DNS queries at disposable or permanent URLs, starting at $7.50/month for unlimited requests. They serve different stages of API work: designing and governing an API versus testing and debugging the traffic it or its integrations produce.",
  "bestForToolA": "API teams that need a visual OpenAPI/JSON Schema editor, automatic mock servers, and shared style guides for governance across a portfolio of APIs, especially those integrating with Git providers like GitHub or GitLab.",
  "bestForToolB": "Developers who need to quickly inspect incoming webhook requests, test email or DNS integrations, and automate actions on captured traffic via its drag-and-drop workflow builder, starting from $7.50/month for unlimited requests.",
  "whoNeedsBoth": "This is a realistic combination: a development team could use Stoplight to design and mock an API's OpenAPI spec during development, then use Webhook.site to capture and debug the real incoming webhook requests once that API's integrations go live.",
  "keyDifferences": [
    {
      "title": "Core Use Case",
      "toolA": "Stoplight is a design-first platform for building, documenting, and governing OpenAPI-based APIs, with a visual editor, style guides, and component reuse.",
      "toolB": "Webhook.site is a request-inspection tool for capturing and debugging incoming HTTP requests, emails, and DNS queries at generated unique URLs.",
      "whyItMatters": "The two tools address opposite ends of API work — designing an API versus testing the traffic it produces.",
      "benefitsWho": "Teams clarifying whether they need a design tool or a debugging tool."
    },
    {
      "title": "Free Tier Scope",
      "toolA": "Stoplight's Free plan is limited to 1 user and 1 project, but includes the full API editor, visual designer, interactive docs, and mock servers.",
      "toolB": "Webhook.site's free tier requires no signup and caps each unique URL at 100 requests, with URLs that expire after a set period.",
      "whyItMatters": "The free tiers serve different needs: ongoing single-project API design versus quick, disposable request testing.",
      "benefitsWho": "Solo developers and small teams evaluating either tool before paying."
    },
    {
      "title": "Entry Paid Price",
      "toolA": "Stoplight's paid Basic plan starts at $44/month billed annually (or $56/month monthly) for 3 users and unlimited projects.",
      "toolB": "Webhook.site's paid tier starts at $7.50/month for unlimited requests and emails plus permanent, protected addresses.",
      "whyItMatters": "The price gap reflects the different scope of each product — a full API design platform versus a focused request-inspection tool.",
      "benefitsWho": "Budget-conscious teams comparing entry-level paid costs."
    },
    {
      "title": "Automation Features",
      "toolA": "Stoplight's automation centers on Git sync with GitHub, GitLab, Bitbucket, and Azure rather than request-triggered workflows.",
      "toolB": "Webhook.site includes a drag-and-drop workflow builder with AI capabilities for automating actions on captured requests, plus native integrations with Google Sheets, Slack, AWS S3, Dropbox, SFTP, databases, and JavaScript.",
      "whyItMatters": "Teams wanting to trigger actions from incoming webhook traffic need Webhook.site's workflow builder rather than Stoplight's Git-based flow.",
      "benefitsWho": "Developers automating responses to captured webhook or email traffic."
    },
    {
      "title": "API Governance Features",
      "toolA": "Stoplight offers built-in and shared style guides (on Pro and Enterprise) plus reusable components for consistency across an API portfolio.",
      "toolB": "Webhook.site's facts don't document equivalent design-governance features, focusing instead on request, email, and DNS capture and replay.",
      "whyItMatters": "Larger API teams need shared standards to keep many API designs consistent.",
      "benefitsWho": "Platform and API governance teams managing multiple APIs."
    }
  ],
  "featureMatrix": [
    {
      "group": "API Design & Documentation",
      "rows": [
        {
          "feature": "Visual OpenAPI/JSON Schema editor",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automatic mock servers",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Interactive API documentation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Reusable components across APIs",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Request/Webhook Testing & Automation",
      "rows": [
        {
          "feature": "Webhook URL capture and inspection",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Email capture for testing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "DNS query monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Webhook.site's DNSHook feature."
        },
        {
          "feature": "Request replay",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Drag-and-drop workflow automation builder",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing, Team & Governance",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Stoplight: 1 user/1 project. Webhook.site: no signup needed, 100 requests/URL, URLs expire."
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Stoplight: $44/month annual. Webhook.site: $7.50/month."
        },
        {
          "feature": "Git sync (GitHub, GitLab, Bitbucket, Azure)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SSO (LDAP/SAML)",
          "toolA": "available",
          "toolB": "available",
          "note": "Stoplight: Pro Team plan. Webhook.site: listed among paid-tier features."
        },
        {
          "feature": "Style guides / API governance",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Stoplight and Webhook.site used for the same purpose?",
      "answer": "No. Stoplight is for designing, documenting, and governing OpenAPI-based APIs before and during development, while Webhook.site is for capturing and debugging incoming HTTP requests, emails, and DNS queries, often after an integration is live."
    },
    {
      "question": "Which is cheaper to start with a paid plan?",
      "answer": "Webhook.site's paid tier starts at $7.50/month for unlimited requests and emails. Stoplight's paid Basic plan starts at $44/month billed annually (or $56/month monthly) for 3 users."
    },
    {
      "question": "Do both offer a free tier?",
      "answer": "Yes. Stoplight's Free plan supports 1 user and 1 project with the full API editor and mock servers. Webhook.site's free tier needs no signup but limits each unique URL to 100 requests and expires URLs after a set period."
    },
    {
      "question": "Does either support automation?",
      "answer": "Webhook.site includes a drag-and-drop workflow builder with AI capabilities for automating actions on captured requests, plus integrations with Slack, Google Sheets, and AWS S3. Stoplight's facts don't document an equivalent request-triggered automation builder, instead focusing on Git sync workflows."
    },
    {
      "question": "Which is better suited for API governance across a team?",
      "answer": "Stoplight offers built-in and shared style guides (on Pro and Enterprise) plus reusable components for consistency across an API portfolio. Webhook.site's facts don't document equivalent governance features."
    },
    {
      "question": "Can I test emails and DNS queries with either tool?",
      "answer": "Webhook.site supports both, generating unique email addresses and capturing DNS queries via its DNSHook feature. Stoplight's facts don't document email or DNS testing capabilities."
    }
  ]
};

export default stoplightVsWebhookSiteContent;

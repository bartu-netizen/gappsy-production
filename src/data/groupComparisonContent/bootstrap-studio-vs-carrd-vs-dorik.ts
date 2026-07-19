import type { GroupComparisonContent } from './types';

const bootstrapStudioVsCarrdVsDorikContent: GroupComparisonContent = {
  "verdict": "All three let non-developers or lightweight developers ship a site without a full coding stack, but they solve different scopes of the same problem. Carrd is the cheapest and fastest option for a single page, Dorik is the most complete hosted platform for multi-page sites with AI generation and agency features, and Bootstrap Studio is the outlier as a one-time-purchase desktop app that trades built-in hosting for full code ownership. The right pick depends less on budget and more on whether you need one page, a full site, or exportable code you control yourself.",
  "bestFor": {
    "bootstrap-studio": "Developers and designers who want a one-time $29 purchase, an offline desktop workflow, and clean, editable Bootstrap code they fully own rather than a subscription platform.",
    "carrd": "Freelancers, indie creators, and small businesses who need a fast, very cheap single-page site, such as a portfolio, landing page, or link-in-bio, without creating an account first.",
    "dorik": "Small businesses and agencies that want a hosted, multi-page website with AI-assisted generation, a built-in CMS for blogging, and a white-label dashboard for managing client sites."
  },
  "highlights": [
    {
      "title": "Only one with no subscription",
      "description": "Bootstrap Studio is sold as a single $29 lifetime license with no recurring fees, unlike Carrd's annual Pro plans and Dorik's monthly or annual subscriptions.",
      "toolSlugs": [
        "bootstrap-studio"
      ]
    },
    {
      "title": "Cheapest way to launch one page",
      "description": "Carrd's free tier and $9/year Pro Lite plan make it the least expensive option for anyone who only needs a single-page site and doesn't need multi-page or blogging support.",
      "toolSlugs": [
        "carrd"
      ]
    },
    {
      "title": "AI generation and full hosted CMS",
      "description": "Dorik is the only one of the three that can generate a starting layout, copy, and images from a prompt, and it bundles hosting plus a built-in CMS for blog posts, which the other two do not offer.",
      "toolSlugs": [
        "dorik"
      ]
    },
    {
      "title": "Built for agencies managing many client sites",
      "description": "Dorik's white-label dashboard and unlimited-site Agency plan are designed for agencies reselling websites under their own brand, a use case neither Bootstrap Studio nor Carrd targets.",
      "toolSlugs": [
        "dorik"
      ]
    },
    {
      "title": "Code ownership vs. hosted convenience",
      "description": "Bootstrap Studio exports standard, editable Bootstrap HTML and CSS with no lock-in, while Carrd and Dorik keep sites inside their own hosted platforms, trading portability for built-in hosting and easier publishing.",
      "toolSlugs": [
        "bootstrap-studio",
        "carrd",
        "dorik"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Building and Site Scope",
      "rows": [
        {
          "feature": "Multi-page site support",
          "statuses": {
            "bootstrap-studio": "available",
            "carrd": "unavailable",
            "dorik": "available"
          },
          "note": "Carrd is deliberately limited to single-page sites; Bootstrap Studio and Dorik both support full multi-page builds."
        },
        {
          "feature": "AI-assisted layout or content generation",
          "statuses": {
            "bootstrap-studio": "unavailable",
            "carrd": "unavailable",
            "dorik": "available"
          }
        },
        {
          "feature": "Built-in CMS and blogging",
          "statuses": {
            "bootstrap-studio": "unavailable",
            "carrd": "unavailable",
            "dorik": "available"
          }
        }
      ]
    },
    {
      "group": "Hosting and Ownership",
      "rows": [
        {
          "feature": "Built-in hosting",
          "statuses": {
            "bootstrap-studio": "unavailable",
            "carrd": "available",
            "dorik": "available"
          },
          "note": "Bootstrap Studio requires separate deployment since it is a local desktop app with no hosting layer of its own."
        },
        {
          "feature": "Code export for self-hosting",
          "statuses": {
            "bootstrap-studio": "available",
            "carrd": "not-documented",
            "dorik": "available"
          }
        },
        {
          "feature": "One-time or lifetime pricing option",
          "statuses": {
            "bootstrap-studio": "available",
            "carrd": "unavailable",
            "dorik": "available"
          },
          "note": "Carrd's paid tiers are annual subscriptions only; Dorik separately offers one-time lifetime pricing on some tiers alongside its subscriptions."
        }
      ]
    },
    {
      "group": "Collaboration and Agency Tools",
      "rows": [
        {
          "feature": "Multi-user collaboration",
          "statuses": {
            "bootstrap-studio": "unavailable",
            "carrd": "not-documented",
            "dorik": "available"
          },
          "note": "Dorik supports up to 10 collaborators on its Business plan and unlimited on Agency."
        },
        {
          "feature": "White-label client reselling",
          "statuses": {
            "bootstrap-studio": "unavailable",
            "carrd": "unavailable",
            "dorik": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is cheapest overall?",
      "answer": "For a single page, Carrd is cheapest, with a usable free tier and Pro plans starting at $9/year. For a multi-page site with no recurring fee, Bootstrap Studio's $29 one-time purchase is cheaper long-term than Dorik's subscription plans, though it doesn't include hosting."
    },
    {
      "question": "Can I build a multi-page website with Carrd?",
      "answer": "No. Carrd is deliberately scoped to single-page sites like portfolios, landing pages, and link-in-bio pages. For a multi-page site with a blog, Bootstrap Studio or Dorik are better fits."
    },
    {
      "question": "Does Bootstrap Studio host my website for me?",
      "answer": "No. Bootstrap Studio is an offline desktop app that stores projects locally and exports standard HTML and CSS, so you need to deploy the exported files to your own hosting separately."
    },
    {
      "question": "Which tool is best for an agency managing multiple client websites?",
      "answer": "Dorik, thanks to its white-label dashboard and Agency plan with unlimited custom domains, pages, and collaborators for managing many client sites under one account."
    },
    {
      "question": "Do any of these use AI to generate a website?",
      "answer": "Yes, Dorik can generate a starting layout, copy, and images from a text prompt. Bootstrap Studio and Carrd are both manual, template-and-drag-and-drop builders without AI generation."
    },
    {
      "question": "Which requires the least technical setup to get started?",
      "answer": "Carrd, since it lets you start building directly in the browser with no account required until you publish. Dorik is similarly no-code but hosted through an account-based dashboard, while Bootstrap Studio requires installing a desktop application first."
    }
  ]
};

export default bootstrapStudioVsCarrdVsDorikContent;

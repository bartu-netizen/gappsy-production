import type { ToolComparisonContent } from './types';

const bearBlogVsBlotContent: ToolComparisonContent = {
  "verdict": "Bear Blog and Blot both target minimalist, low-friction blogging, but come from opposite pricing and workflow philosophies. Bear Blog is a completely free, open-source platform (source on GitHub at HermanMartinus/bearblog) built with zero JavaScript, ads, or trackers, averaging about 2.7kb per page, with custom domains and RSS/Atom feeds included. Blot is a paid, $6/month-per-site service that turns a synced folder of files into a website, letting writers use their own text editor instead of a web-based CMS, with all templates, custom domains, and SSL included at that flat price. The choice comes down to budget and workflow: a free, tracker-free hosted platform (Bear Blog) versus a paid, file-based publishing model (Blot).",
  "bestForToolA": "Bear Blog suits privacy-conscious writers who want a completely free, ad-free, tracker-free, and JavaScript-free blogging platform with minimal setup.",
  "bestForToolB": "Blot suits writers who prefer editing in their own text editor and dragging files into a synced folder, and are willing to pay $6/month per site for that workflow plus all templates and SSL included.",
  "whoNeedsBoth": "There's no natural combined use case since each is a complete, standalone blogging solution. A writer with multiple projects might run a personal free blog on Bear Blog while paying for a client or professional site on Blot, but these remain separate, unconnected sites.",
  "keyDifferences": [
    {
      "title": "Pricing",
      "toolA": "Bear Blog is free to use with no advertised paid tier.",
      "toolB": "Blot costs $6/month per site, with no free trial.",
      "whyItMatters": "Free versus paid access changes who can realistically adopt the platform, especially for hobbyist or budget-limited writers.",
      "benefitsWho": "Hobbyist writers and students who want zero-cost publishing (Bear Blog)."
    },
    {
      "title": "Publishing Workflow",
      "toolA": "Bear Blog is a hosted, web-based blogging platform.",
      "toolB": "Blot turns a synced folder of files into a website, letting you publish by editing files in your own text editor.",
      "whyItMatters": "A file-based workflow appeals to writers who prefer working outside a browser CMS; a web-based platform is more accessible to those who don't want local tooling.",
      "benefitsWho": "Developers and technical writers who already work in text editors and version-controlled folders (Blot)."
    },
    {
      "title": "Tracker-Free, No-JavaScript Design",
      "toolA": "Bear Blog is built with zero trackers, ads, or JavaScript by design, averaging roughly 2.7kb per page.",
      "toolB": "Not documented as a specific design goal for Blot.",
      "whyItMatters": "A tracker-free, JS-free design supports both privacy and page-load speed.",
      "benefitsWho": "Privacy-focused writers and readers who want minimal, fast-loading pages (Bear Blog)."
    },
    {
      "title": "Open-Source Codebase",
      "toolA": "Bear Blog's source code is publicly available on GitHub at HermanMartinus/bearblog.",
      "toolB": "Not documented whether Blot's source code is open.",
      "whyItMatters": "Open-source availability lets developers inspect, self-host, or contribute to the underlying code.",
      "benefitsWho": "Developers who want to review or extend the platform's codebase (Bear Blog)."
    },
    {
      "title": "Templates Included",
      "toolA": "Bear Blog offers a selection of free themes out of the box.",
      "toolB": "Blot includes access to all available site templates at its single flat $6/month price.",
      "whyItMatters": "Template breadth affects design flexibility without extra cost.",
      "benefitsWho": "Writers who want more template variety bundled into one flat price (Blot)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Cost & Licensing",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Blot: $6/month per site, no free trial"
        },
        {
          "feature": "Open-source codebase",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bear Blog: GitHub HermanMartinus/bearblog"
        },
        {
          "feature": "Custom domain support",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Publishing Workflow",
      "rows": [
        {
          "feature": "File/folder-based publishing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "RSS/Atom feeds",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "All templates included",
          "toolA": "available",
          "toolB": "available",
          "note": "Bear Blog: selection of free themes; Blot: all templates at flat price"
        },
        {
          "feature": "SSL certificates included",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Site Performance & Features",
      "rows": [
        {
          "feature": "No JavaScript/trackers/ads by design",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Documented average page weight",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bear Blog: ~2.7kb per page"
        },
        {
          "feature": "Annual billing discount",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Bear Blog really free, unlike Blot?",
      "answer": "Yes. Bear Blog is free to use with no advertised paid tier. Blot costs $6 per month per site with no free trial."
    },
    {
      "question": "Which platform is more privacy-focused?",
      "answer": "Bear Blog is built with zero trackers, ads, or JavaScript by design, averaging about 2.7kb per page. This level of tracker-free design is not documented for Blot."
    },
    {
      "question": "How do the two platforms differ in publishing workflow?",
      "answer": "Bear Blog is a hosted, web-based blogging platform. Blot instead turns a synced folder of files, edited in your own text editor, into a live website."
    },
    {
      "question": "Is Bear Blog open source?",
      "answer": "Yes, its source code is publicly available on GitHub at HermanMartinus/bearblog. Blot's source code openness is not documented."
    },
    {
      "question": "Do both support custom domains?",
      "answer": "Yes, both Bear Blog and Blot include custom domain support."
    },
    {
      "question": "Does either offer a free trial or free tier?",
      "answer": "Bear Blog is free to use outright with no paid tier. Blot has no free trial and requires the $6/month per site plan from the start."
    }
  ]
};

export default bearBlogVsBlotContent;

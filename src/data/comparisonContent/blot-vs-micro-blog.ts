import type { ToolComparisonContent } from './types';

const blotVsMicroBlogContent: ToolComparisonContent = {
  "verdict": "Blot and Micro.blog are both paid, no-free-plan publishing tools, but they take different approaches to how content gets created. Blot turns a synced folder of files into a website for a flat $6/month per site, appealing to people who want to write in their own text editor and drag files into a folder rather than use a web interface, with all templates, custom domains, and SSL included. Micro.blog is a tiered blogging and podcasting platform starting at $5/month, with built-in cross-posting to Mastodon, Threads, and Bluesky, and add-on tiers for multiple blogs (Premium, $10/month), family collaboration (Family, $15/month), and podcast/video hosting (Studio, $20/month). The right choice depends on whether a file-based workflow (Blot) or a social-native hosted platform with room to add team members and media features (Micro.blog) fits better.",
  "bestForToolA": "Blot suits writers who already work in a text editor and want a simple, flat-priced $6/month site with all templates and SSL included, without a web-based CMS interface.",
  "bestForToolB": "Micro.blog suits bloggers and podcasters who want built-in social cross-posting to Mastodon, Threads, and Bluesky, plus room to grow into multiple blogs, family collaboration, or podcast hosting via its tiered plans.",
  "whoNeedsBoth": "There's no typical combined use case since both fully host and publish a blog on their own. A writer might run a personal file-based site on Blot while separately maintaining a Micro.blog account for fediverse-native microblogging and cross-posting, but these would be two distinct, unconnected sites.",
  "keyDifferences": [
    {
      "title": "Publishing Workflow",
      "toolA": "Blot turns a synced folder of files into a website — you add, edit, or delete files with your own text editor and Blot publishes the changes.",
      "toolB": "Micro.blog uses its own web-based posting interface plus automatic cross-posting to social platforms.",
      "whyItMatters": "A file-based workflow suits writers who prefer local editing tools over a web CMS.",
      "benefitsWho": "Writers already comfortable working in a text editor rather than a browser-based editor (Blot)."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Blot is a single flat plan at $6/month per site, with all templates included and an annual billing discount available.",
      "toolB": "Micro.blog is tiered: $5/month base, $10/month Premium, $15/month Family, $20/month Studio.",
      "whyItMatters": "Flat pricing is simpler to budget; tiered pricing lets buyers pay only for the features they need.",
      "benefitsWho": "Single-site publishers wanting predictable flat pricing (Blot) versus users who want to start cheap and add features later (Micro.blog)."
    },
    {
      "title": "Multi-Blog Support",
      "toolA": "Blot is priced and structured per individual site at $6/month each, with no documented multi-blog account feature.",
      "toolB": "Micro.blog's Premium plan ($10/month) supports up to 5 blogs on one account.",
      "whyItMatters": "Running several blogs is cheaper per-site on a multi-blog plan than paying separately for each site.",
      "benefitsWho": "Publishers managing multiple blogs from one account (Micro.blog)."
    },
    {
      "title": "Social & Fediverse Distribution",
      "toolA": "Not documented as a Blot feature.",
      "toolB": "Micro.blog includes built-in cross-posting to Mastodon, Threads, and Bluesky, plus fediverse and IndieWeb protocol support.",
      "whyItMatters": "Automatic cross-posting extends reach without manual work on each platform.",
      "benefitsWho": "Writers who want their posts to automatically reach fediverse and mainstream social audiences (Micro.blog)."
    },
    {
      "title": "Team Collaboration",
      "toolA": "Not documented as a Blot feature.",
      "toolB": "Micro.blog's Family plan ($15/month) lets up to 5 members write or edit posts.",
      "whyItMatters": "Multi-author support matters for families, small teams, or shared publications.",
      "benefitsWho": "Families or small teams publishing together (Micro.blog)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Publishing Workflow",
      "rows": [
        {
          "feature": "File-based/drag-and-drop publishing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Custom domain support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SSL certificates included",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Use your own text editor to publish",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Entry-level price",
          "toolA": "available",
          "toolB": "available",
          "note": "Blot: $6/month per site; Micro.blog: $5/month base plan"
        },
        {
          "feature": "Multiple blogs on one account",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Micro.blog Premium, up to 5 blogs, $10/month"
        },
        {
          "feature": "Annual billing discount",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Collaboration & Distribution",
      "rows": [
        {
          "feature": "Cross-posting to Mastodon/Threads/Bluesky",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multi-member collaboration",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Micro.blog Family, up to 5 members, $15/month"
        },
        {
          "feature": "Podcast/video hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Micro.blog Studio, $20/month"
        },
        {
          "feature": "Email newsletters",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Micro.blog Premium, $10/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does Blot's publishing model differ from Micro.blog's?",
      "answer": "Blot turns a synced folder of files into a website — you add, edit, or delete files and Blot publishes the changes. Micro.blog uses its own web-based posting interface plus automatic cross-posting to Mastodon, Threads, and Bluesky."
    },
    {
      "question": "Which is cheaper for a single site?",
      "answer": "Blot is a flat $6/month per site with all templates included. Micro.blog's base plan is $5/month, but multi-blog, newsletter, and video features require upgrading to Premium ($10), Family ($15), or Studio ($20)."
    },
    {
      "question": "Can I run multiple blogs on one account?",
      "answer": "Micro.blog's Premium plan ($10/month) supports up to 5 blogs. Blot is priced and structured per individual site at $6/month each, so running multiple sites multiplies the cost."
    },
    {
      "question": "Does either offer a free trial?",
      "answer": "No. Neither Blot nor Micro.blog advertises a free trial or free plan."
    },
    {
      "question": "Which supports team collaboration?",
      "answer": "Micro.blog's Family plan ($15/month) lets up to 5 members write or edit posts. Blot has no documented multi-user collaboration feature."
    },
    {
      "question": "Does Blot support podcasting like Micro.blog's Studio plan?",
      "answer": "No, podcast recording and video hosting are not documented as Blot features. Micro.blog's Studio plan ($20/month) adds video hosting up to 20 minutes and podcast recording."
    }
  ]
};

export default blotVsMicroBlogContent;

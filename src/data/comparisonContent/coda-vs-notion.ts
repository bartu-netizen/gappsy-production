import type { ToolComparisonContent } from './types';

const codaVsNotionContent: ToolComparisonContent = {
  "verdict": "Coda, now rebranded as Superhuman Docs following its acquisition, and Notion both sit in the all-in-one workspace category, but the documented facts point to different core jobs. Coda's defining strength is blending rich text with spreadsheet-style tables inside a single document, then layering in interactive building blocks so a team can assemble lightweight internal tools without leaving that document. Notion's documented strengths point toward a broader company workspace: block-based pages that can embed databases, tasks, images, or other pages, database content that can be viewed as a table, board, calendar, or timeline, and AI features such as Custom Agents and AI-assisted writing and Q-and-A over a team's own content. Notion also publishes a full pricing ladder, from a free plan through Plus, Business, and custom Enterprise pricing, while no pricing plans are documented for Coda beyond its freemium model. The one documented caveat for Coda is that its recent rebrand to Superhuman Docs can make it harder to find pricing or support under the old name; Notion's documented caveat is a steeper setup investment to structure the workspace well. Neither tool is a strict upgrade over the other: pick Coda when the job is building structured, interactive documents, and pick Notion when the job is running a connected company-wide workspace with AI assistance and transparent pricing.",
  "bestForToolA": "Coda (now Superhuman Docs) is the better fit for individuals or teams who want to combine rich text and spreadsheet-style tables in a single document and build lightweight interactive tools without a separate app.",
  "bestForToolB": "Notion is the better fit for teams that want a connected workspace covering docs, wikis, project management, and databases, with published pricing tiers and built-in AI features.",
  "whoNeedsBoth": "A team that wants Coda's document-embedded interactive tools for specific internal workflows while also running its broader wiki, task tracking, and company knowledge base in Notion could reasonably end up using both.",
  "keyDifferences": [
    {
      "title": "Core product structure",
      "toolA": "Coda combines rich text with spreadsheet-style tables in one document, plus interactive building blocks for lightweight internal tools.",
      "toolB": "Notion uses block-based pages where any page can embed databases, tasks, images, or other pages, with database content viewable as a table, board, calendar, or timeline.",
      "whyItMatters": "The underlying structure decides whether a workspace behaves more like a smart document or a full company system, which changes how teams set up their first projects.",
      "benefitsWho": "Teams focused on building custom document-based tools benefit from Coda's structure; teams that want one dataset viewed multiple ways benefit from Notion's structure."
    },
    {
      "title": "AI features",
      "toolA": "No AI features are documented for Coda in the available facts.",
      "toolB": "Notion documents AI Custom Agents plus AI-assisted writing and Q-and-A over a team's own Notion content.",
      "whyItMatters": "Built-in AI for writing, Q-and-A, and workflow agents can remove the need for a separate AI tool layered on top of the workspace.",
      "benefitsWho": "Teams that want AI assistance baked into their daily workspace benefit from Notion; teams with no documented AI need are unaffected either way with Coda."
    },
    {
      "title": "Published pricing tiers",
      "toolA": "No pricing plans or starting price are published for Coda beyond its freemium model.",
      "toolB": "Notion publishes a Free plan at $0, plus Plus at $10 per member per month, Business at $20 per member per month, and custom Enterprise pricing.",
      "whyItMatters": "Transparent, published pricing lets a buyer budget accurately before committing, while undocumented pricing means budgeting requires contacting the vendor directly.",
      "benefitsWho": "Budget-conscious teams and procurement processes that require upfront pricing benefit from Notion's published tiers."
    },
    {
      "title": "Interactive building blocks versus database views",
      "toolA": "Coda lets users build lightweight internal tools directly inside a document.",
      "toolB": "Notion's core flexibility comes from viewing the same underlying data as a table, board, calendar, or timeline rather than building custom tools.",
      "whyItMatters": "Building lightweight tools inside a document is a different job from viewing one shared dataset in multiple formats, and the two approaches suit different kinds of workflows.",
      "benefitsWho": "Teams that want to prototype small internal apps benefit from Coda; teams that need one dataset shown as a table, board, calendar, or timeline benefit from Notion."
    },
    {
      "title": "Workspace breadth",
      "toolA": "Coda is positioned as a document platform combining docs, spreadsheets, and apps into flexible pages.",
      "toolB": "Notion is positioned as a workspace combining docs, wikis, project management, and databases into one connected tool teams use to run their company.",
      "whyItMatters": "A document platform and a full company workspace solve different scopes of problem, from a single structured doc to company-wide knowledge and task management.",
      "benefitsWho": "Individuals or small teams needing structured documents benefit from Coda's scope; larger teams running company-wide wikis and project tracking benefit from Notion's scope."
    },
    {
      "title": "Brand stability",
      "toolA": "Coda was recently rebranded to Superhuman Docs following its acquisition, which can cause confusion when searching for pricing or support under the old name.",
      "toolB": "No rebrand is documented for Notion; it continues to operate under its original name.",
      "whyItMatters": "A recent rebrand can make it harder to find current pricing, support, or search results under the name a buyer already knows.",
      "benefitsWho": "Buyers researching Coda need to know to search under Superhuman Docs; this is not a concern for Notion, which has no documented rebrand."
    },
    {
      "title": "Documented pros",
      "toolA": "No pros are documented for Coda in the available facts.",
      "toolB": "Notion's documented pros include combining docs, wikis, tasks, and databases in one connected workspace, and offering flexible database views that adapt to how a team actually works.",
      "whyItMatters": "Documented pros reflect what the available facts confirm as genuine strengths, rather than assumed benefits.",
      "benefitsWho": "Teams evaluating Notion have two concrete, confirmed strengths to weigh; no such confirmed pros exist in the provided facts for Coda."
    },
    {
      "title": "Documented cons and learning curve",
      "toolA": "Coda's documented con is that the rebrand to Superhuman Docs may cause confusion when searching for pricing or support under the old name.",
      "toolB": "Notion's documented con is a steeper setup investment than a single-purpose tool, since getting the most out of it requires structuring the workspace deliberately.",
      "whyItMatters": "Knowing the realistic drawback of each tool helps set expectations for onboarding and searchability before adoption.",
      "benefitsWho": "Teams sensitive to search or support confusion should note Coda's rebrand caveat; teams wanting a quick setup should note Notion's steeper structuring investment."
    },
    {
      "title": "Directory tags and categorization",
      "toolA": "Coda is tagged as freemium only in the available facts.",
      "toolB": "Notion is tagged as freemium and additionally as an AI tool, reflecting its AI feature set.",
      "whyItMatters": "Category tags reflect how each tool is classified for discovery, such as whether AI capability is a defining trait.",
      "benefitsWho": "Buyers specifically searching for AI-tagged tools will surface Notion; Coda surfaces only under the freemium category."
    }
  ],
  "featureMatrix": [
    {
      "group": "Document and page structure",
      "rows": [
        {
          "feature": "Embedded structured data in documents",
          "toolA": "available",
          "toolB": "available",
          "note": "Coda: docs with embedded structured data; Notion: block-based pages can embed databases and other pages"
        },
        {
          "feature": "Interactive building blocks and internal tools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Flexible database views (table, board, calendar, timeline)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Same underlying data viewable as table, board, calendar, or timeline"
        }
      ]
    },
    {
      "group": "AI capabilities",
      "rows": [
        {
          "feature": "AI custom agents for workflow automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Configurable AI agents that automate specific workflows"
        },
        {
          "feature": "AI-assisted writing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI Q-and-A over workspace content",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Ask questions over a team's own Notion content"
        }
      ]
    },
    {
      "group": "Pricing and plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Coda: described as freemium, no specific free-plan details published; Notion: $0 Free plan"
        },
        {
          "feature": "Mid-tier paid plan pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Plus at $10 per member per month; Business at $20 per member per month"
        },
        {
          "feature": "Enterprise or custom pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Custom pricing for the Enterprise tier"
        }
      ]
    },
    {
      "group": "Workspace and collaboration scope",
      "rows": [
        {
          "feature": "Wiki and knowledge base functionality",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Part of Notion's combined docs, wikis, project management, and databases positioning"
        },
        {
          "feature": "Project and task management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Positioned as a company-wide workspace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Described as the tool teams use to run their company"
        }
      ]
    },
    {
      "group": "Brand and naming",
      "rows": [
        {
          "feature": "Recently rebranded product name",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Rebranded to Superhuman Docs after acquisition"
        },
        {
          "feature": "Currently marketed under original name",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Coda is now marketed as Superhuman Docs; Notion still operates under its original name"
        }
      ]
    },
    {
      "group": "Documented pros and cons",
      "rows": [
        {
          "feature": "Documented pros in available facts",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Notion: combines docs, wikis, tasks, and databases; flexible database views"
        },
        {
          "feature": "Documented cons in available facts",
          "toolA": "available",
          "toolB": "available",
          "note": "Coda: rebrand may cause search or support confusion; Notion: steeper setup investment"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Coda or Notion?",
      "answer": "Notion publishes a free plan plus paid tiers at $10 and $20 per member per month, while Coda's pricing beyond its freemium model is not documented here, so a direct price comparison cannot be made from the available facts."
    },
    {
      "question": "Is Coda still called Coda?",
      "answer": "No, following its acquisition the product has been rebranded as Superhuman Docs."
    },
    {
      "question": "Does Notion have AI features?",
      "answer": "Yes, Notion includes AI-assisted writing, AI Q-and-A over your own Notion content, and configurable AI Custom Agents."
    },
    {
      "question": "Can Coda do what Notion does?",
      "answer": "Partially, Coda focuses on combining rich text, spreadsheet-style tables, and interactive building blocks inside documents, while Notion adds wiki, project management, and AI features that are not documented for Coda."
    },
    {
      "question": "Does Notion offer the same document plus spreadsheet combination as Coda?",
      "answer": "Not exactly as documented, Notion's block-based pages can embed databases and other pages, but the specific combination of rich text with spreadsheet-style tables in one document is documented as a Coda feature, not a confirmed Notion one."
    },
    {
      "question": "Which tool has published pricing plans?",
      "answer": "Notion publishes a Free plan, Plus at $10 per member per month, Business at $20 per member per month, and custom Enterprise pricing, while Coda has no pricing plans documented here."
    }
  ]
};

export default codaVsNotionContent;

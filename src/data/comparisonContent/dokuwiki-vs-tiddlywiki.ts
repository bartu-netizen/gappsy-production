import type { ToolComparisonContent } from './types';

const dokuwikiVsTiddlywikiContent: ToolComparisonContent = {
  "verdict": "DokuWiki is a server-side, PHP-based wiki engine that stores content as flat text files with ACL-based permissions and revision history, built for shared team documentation. TiddlyWiki is a fundamentally different model: a non-linear personal notebook that runs as a single, self-contained HTML file with no server required, organizing notes as interlinked 'tiddlers.' Both were first released in 2004 and remain free, open-source projects, but they target different use cases — shared team wikis versus a hackable personal notebook.",
  "bestForToolA": "Teams that need a shared, permissioned wiki with revision history and a large plugin/template ecosystem, run on a PHP server without needing a database.",
  "bestForToolB": "Individuals who want a fully portable, single-file personal notebook that can be opened in any browser with no server setup, and who want to customize the interface itself via WikiText.",
  "whoNeedsBoth": "A person might use TiddlyWiki as a personal, single-file notebook for their own quick notes and idea capture, while their team maintains a shared DokuWiki instance with ACL-based permissions for official documentation — the two serve different scales (personal vs. shared) rather than overlapping directly.",
  "keyDifferences": [
    {
      "title": "Deployment Model",
      "toolA": "DokuWiki runs as a server-side PHP application (no database required, but a PHP server is needed).",
      "toolB": "TiddlyWiki can run as a single self-contained HTML file with no server at all, and optionally as a Node.js app for a client/server setup.",
      "whyItMatters": "A no-server option removes hosting entirely, which matters for fully portable or offline use cases.",
      "benefitsWho": "Individuals wanting a portable notebook with zero server setup benefit from TiddlyWiki; teams wanting a persistent shared server benefit from DokuWiki."
    },
    {
      "title": "Content Model",
      "toolA": "DokuWiki uses a traditional page-based wiki structure with ACL permissions and revision history.",
      "toolB": "TiddlyWiki organizes content as non-linear, interlinked 'tiddlers' rather than a fixed page hierarchy.",
      "whyItMatters": "A non-linear note model suits free-form idea capture, while a page-based model suits structured reference documentation.",
      "benefitsWho": "Structured reference documentation benefits from DokuWiki's page model; free-form personal knowledge management benefits from TiddlyWiki's tiddler model."
    },
    {
      "title": "Multi-User Collaboration",
      "toolA": "DokuWiki documents access control lists (ACLs) for managing multi-user read/edit permissions.",
      "toolB": "TiddlyWiki's own listed cons state that its single-file/local model means there is no built-in real-time multi-user collaboration.",
      "whyItMatters": "Teams needing simultaneous multi-editor access with permission tiers need a system built for that from the ground up.",
      "benefitsWho": "Teams with multiple simultaneous editors benefit from DokuWiki's ACL system."
    },
    {
      "title": "Hosting Flexibility",
      "toolA": "DokuWiki is documented as self-hosted only, with no official managed hosting plan.",
      "toolB": "TiddlyWiki offers multiple hosting options: a local file, Node.js/AWS Lambda, or the independently run Tiddlyhost service for hosted accounts.",
      "whyItMatters": "Having an independent hosted option lowers the barrier for users who don't want to self-host at all.",
      "benefitsWho": "Non-technical users wanting a hosted option without self-managing infrastructure benefit from TiddlyWiki's Tiddlyhost service."
    },
    {
      "title": "Customization Approach",
      "toolA": "DokuWiki is extended primarily through its large community plugin and template ecosystem.",
      "toolB": "TiddlyWiki's entire user interface is implemented in editable WikiText, making it fully hackable but requiring users to learn its WikiText scripting system for advanced changes.",
      "whyItMatters": "Plugin-based extension is generally easier to adopt than rewriting UI components in a custom scripting language.",
      "benefitsWho": "Users wanting quick functional additions benefit from DokuWiki's plugins; power users wanting deep UI customization benefit from TiddlyWiki's hackable WikiText interface."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "No database required",
          "toolA": "available",
          "toolB": "available",
          "note": "Both are database-free by design"
        },
        {
          "feature": "Runs as a single portable file with no server",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Node.js server mode",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Command-line tooling",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Content Organization",
      "rows": [
        {
          "feature": "Non-linear / tiddler-based notes",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Simple wiki markup syntax",
          "toolA": "available",
          "toolB": "available",
          "note": "DokuWiki markup; TiddlyWiki WikiText"
        },
        {
          "feature": "Fully hackable/editable UI",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Independent hosted service available",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Tiddlyhost"
        }
      ]
    },
    {
      "group": "Collaboration & Extensibility",
      "rows": [
        {
          "feature": "Access control lists (multi-user permissions)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Revision history",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Plugin/template ecosystem",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real-time multi-user collaboration",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "TiddlyWiki cons explicitly note this gap"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which needs a server to run?",
      "answer": "DokuWiki requires a PHP server. TiddlyWiki can run as a single HTML file with no server at all, though it also supports an optional Node.js server mode."
    },
    {
      "question": "Which is better for a shared team wiki?",
      "answer": "DokuWiki documents ACL-based multi-user permissions for shared editing. TiddlyWiki's own cons note it lacks built-in real-time multi-user collaboration due to its single-file/local model."
    },
    {
      "question": "Which is better for personal note-taking?",
      "answer": "TiddlyWiki is described as a non-linear personal notebook built around interlinked tiddlers, whereas DokuWiki uses a more traditional shared, page-based wiki structure."
    },
    {
      "question": "Are both free?",
      "answer": "Yes — DokuWiki is GPL-2.0 licensed and TiddlyWiki is BSD-3-Clause licensed, both free and open source with no pricing plans."
    },
    {
      "question": "Is there a hosted version of either?",
      "answer": "TiddlyWiki has the independently run Tiddlyhost service offering hosted accounts. DokuWiki has no official managed hosting plan documented."
    },
    {
      "question": "How old are these two projects?",
      "answer": "Both trace back to 2004 — DokuWiki's founded_year is documented as 2004, and TiddlyWiki was first released in 2004 by creator Jeremy Ruston."
    }
  ]
};

export default dokuwikiVsTiddlywikiContent;

import type { ToolComparisonContent } from './types';

const phorgeVsRedmineContent: ToolComparisonContent = {
  "verdict": "Phorge is a free, open-source (Apache 2.0) developer toolkit forked from Phabricator, combining code review (Differential-style), built-in repository hosting, task tracking, and rule-based automation (Herald), self-hosted on a Unix-like LAMP/LEMP stack. Redmine is a free, open-source (GPL v2) project management and issue-tracking application with Gantt charts, wikis, time tracking, and native integration with external SCM systems, running cross-platform as a Ruby on Rails app. Phorge is oriented around code review and development workflow tightly coupled to repository hosting; Redmine is oriented around broader project management with formal scheduling and time tracking, integrating with, rather than hosting, source repositories.",
  "bestForToolA": "Engineering teams that want code review (Differential-style), repository hosting, and rule-based automation in one self-hosted platform, and are comfortable running a Unix-like LAMP/LEMP stack, fit Phorge.",
  "bestForToolB": "Teams needing formal project scheduling (Gantt charts, calendars), time tracking, and integration with existing external Git/SVN repositories across cross-platform servers are better served by Redmine.",
  "whoNeedsBoth": "An engineering organization could pair them: Phorge for code review and repository hosting tied directly to commits, while Redmine handles broader cross-team project management, Gantt scheduling, and non-engineering task tracking that Phorge's toolset doesn't cover.",
  "keyDifferences": [
    {
      "title": "Code Review & Repository Hosting",
      "toolA": "Phorge includes Differential-style code review tooling and built-in repository hosting, both inherited from Phabricator.",
      "toolB": "Redmine's documented features focus on issue tracking and integrate with external SCM repositories (Git, SVN, CVS, Mercurial, Bazaar) rather than hosting them itself.",
      "whyItMatters": "A platform that hosts repositories and handles code review natively removes the need for a separate Git hosting service.",
      "benefitsWho": "Engineering teams that want code review and repo hosting consolidated in one self-hosted platform."
    },
    {
      "title": "Platform/OS Requirements",
      "toolA": "Phorge requires a Unix-like OS (Linux, macOS, or BSD), with no Windows support, and runs on a self-managed LAMP/LEMP (PHP/MySQL/MariaDB) stack.",
      "toolB": "Redmine is a cross-platform Ruby on Rails web application without a documented OS restriction.",
      "whyItMatters": "Teams standardized on Windows server infrastructure would need to accommodate Phorge's Unix-only requirement.",
      "benefitsWho": "Organizations already running Linux/macOS/BSD infrastructure benefit from Phorge; Windows-based shops benefit from Redmine's cross-platform support."
    },
    {
      "title": "Workflow Automation",
      "toolA": "Phorge includes Herald, a rule-based automation engine for triggering actions on project events.",
      "toolB": "Redmine's documented feature set does not list a comparable rule-based automation engine.",
      "whyItMatters": "Automated triggers reduce manual overhead for repetitive workflow actions like notifications or status changes.",
      "benefitsWho": "Teams wanting to automate repetitive project-management actions without custom scripting."
    },
    {
      "title": "Maturity & Scale Proof",
      "toolA": "Phorge was founded in 2021 as a community continuation of Phabricator; the Wikimedia Foundation completed a production migration to Phorge for task tracking.",
      "toolB": "Redmine has been actively developed since 2006, with a large community plugin ecosystem built up over nearly two decades.",
      "whyItMatters": "Longer track record and plugin ecosystem size can indicate stability and available extensions for niche needs.",
      "benefitsWho": "Risk-averse organizations may favor Redmine's longer history; teams wanting Phabricator's proven workflow with active maintenance may favor Phorge."
    },
    {
      "title": "Time Tracking",
      "toolA": "Phorge's documented feature list does not include time tracking.",
      "toolB": "Redmine has native time tracking, letting teams log and report time spent on issues and projects.",
      "whyItMatters": "Time tracking supports billing, capacity planning, and effort reporting that some teams require.",
      "benefitsWho": "Teams that bill clients hourly or need effort-based project reporting."
    }
  ],
  "featureMatrix": [
    {
      "group": "Origin & Deployment",
      "rows": [
        {
          "feature": "Open-source license",
          "toolA": "available",
          "toolB": "available",
          "note": "Phorge: Apache 2.0; Redmine: GPL v2"
        },
        {
          "feature": "Windows support",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Phorge requires Unix-like OS"
        },
        {
          "feature": "Self-hosted only (no official managed cloud)",
          "toolA": "available",
          "toolB": "available",
          "note": "Both require self-hosting"
        },
        {
          "feature": "Project founded",
          "toolA": "available",
          "toolB": "available",
          "note": "Phorge: 2021 (Phabricator continuation); Redmine: 2006"
        }
      ]
    },
    {
      "group": "Development Workflow Features",
      "rows": [
        {
          "feature": "Code review tooling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Phorge Differential-style review"
        },
        {
          "feature": "Built-in repository hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "SCM integration with external repos",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Git, SVN, CVS, Mercurial, Bazaar"
        },
        {
          "feature": "Rule-based automation (event triggers)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Phorge Herald"
        }
      ]
    },
    {
      "group": "Project Management & Extensibility",
      "rows": [
        {
          "feature": "Task/bug tracking",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Wikis",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Time tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Gantt charts/calendars",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Plugin ecosystem",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Large community plugin ecosystem for Redmine"
        },
        {
          "feature": "REST API",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Redmine supports XML/JSON"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are both Phorge and Redmine free?",
      "answer": "Yes, both are free and open source: Phorge under Apache 2.0 and Redmine under GNU GPL v2."
    },
    {
      "question": "Which includes native code review tooling?",
      "answer": "Phorge includes Differential-style code review inherited from Phabricator. Redmine does not document a native code review feature."
    },
    {
      "question": "Can Phorge run on Windows?",
      "answer": "No, Phorge requires a Unix-like operating system such as Linux, macOS, or BSD. Redmine is cross-platform as a Ruby on Rails application."
    },
    {
      "question": "Which has built-in time tracking?",
      "answer": "Redmine has native time tracking for logging and reporting time spent on issues and projects. Phorge's documented features do not include time tracking."
    },
    {
      "question": "How does Redmine connect to source code repositories?",
      "answer": "Redmine integrates with external Git, SVN, CVS, Mercurial, and Bazaar repositories. Phorge instead hosts repositories natively within the platform."
    },
    {
      "question": "Is Phorge actively maintained?",
      "answer": "Yes, it's developed by a community team; the Wikimedia Foundation completed a production migration to Phorge for task tracking, and maintainers continue shipping PHP 8+ compatibility and security fixes."
    }
  ]
};

export default phorgeVsRedmineContent;

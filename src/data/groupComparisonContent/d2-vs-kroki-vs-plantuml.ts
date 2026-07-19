import type { GroupComparisonContent } from './types';

const d2VsKrokiVsPlantumlContent: GroupComparisonContent = {
  "verdict": "D2, Kroki and PlantUML all let engineering teams keep diagrams as version-controlled plain text instead of drag-and-drop files, but they solve different parts of that problem. D2 is a single opinionated diagram language with its own modern layout engines and shape library built for software architecture, PlantUML is the older, UML-focused language with the deepest native diagram-type coverage and integration ecosystem, and Kroki is not a diagram language at all but a unified rendering API that wraps PlantUML, Mermaid, GraphViz and 20-plus other syntaxes behind one HTTP endpoint. Teams standardized on one syntax will likely pick D2 or PlantUML directly, while teams juggling multiple diagram languages across a docs pipeline are the ones Kroki is built for. None of the three's documented feature lists show D2 among Kroki's supported diagram types, which matters if a team hoped to use Kroki as a universal renderer for all three tools at once.",
  "bestFor": {
    "d2": "Teams that want modern, git-friendly software architecture and infrastructure diagrams with automatic layout and minimal manual positioning.",
    "kroki": "Teams that need one self-hosted API endpoint to render many different diagram syntaxes, including PlantUML and Mermaid, without installing and maintaining separate renderers.",
    "plantuml": "Teams standardized on classic UML documentation who want the broadest native diagram-type coverage and the largest ecosystem of editor and CI integrations."
  },
  "highlights": [
    {
      "title": "D2 is purpose-built for architecture diagrams, not general UML",
      "description": "D2's shape library leans into cylinders, queues, clouds and infrastructure icons with selectable dagre and ELK layout engines, giving polished technical diagrams with less manual tuning than classic UML tools, though it uses its own language rather than a widely pre-integrated one like Mermaid.",
      "toolSlugs": [
        "d2"
      ]
    },
    {
      "title": "Kroki trades its own syntax for universal coverage",
      "description": "Rather than defining a diagram language, Kroki exposes one HTTP API that renders over 20 existing syntaxes, including PlantUML, Mermaid, GraphViz, C4 and Excalidraw, which is valuable for teams that don't want to standardize on a single diagram language but do want a single rendering endpoint.",
      "toolSlugs": [
        "kroki"
      ]
    },
    {
      "title": "PlantUML remains the deepest native UML tool, and a Kroki backend",
      "description": "PlantUML natively covers sequence, class, use case, activity, component, state and deployment diagrams plus extensions like C4 and Gantt charts, and it is also one of the syntaxes Kroki's unified API can render, giving it reach both as a standalone tool and inside Kroki-based pipelines.",
      "toolSlugs": [
        "plantuml",
        "kroki"
      ]
    },
    {
      "title": "All three are free with different open-source licenses",
      "description": "D2 is MPL-2.0, Kroki is MIT, and PlantUML is GPL - all are free to self-host with no paid tier documented for the core tool, though the license terms differ enough to matter for teams with strict open-source compliance policies.",
      "toolSlugs": [
        "d2",
        "kroki",
        "plantuml"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing and Deployment",
      "rows": [
        {
          "feature": "Open-source, self-hostable core",
          "statuses": {
            "d2": "available",
            "kroki": "available",
            "plantuml": "available"
          },
          "note": "D2 is MPL-2.0, Kroki is MIT, PlantUML is GPL."
        },
        {
          "feature": "Free public hosted instance",
          "statuses": {
            "d2": "not-documented",
            "kroki": "available",
            "plantuml": "available"
          },
          "note": "Kroki offers the public kroki.io API; PlantUML documents public rendering servers alongside self-hosting."
        }
      ]
    },
    {
      "group": "Diagram Language Coverage",
      "rows": [
        {
          "feature": "Own dedicated diagram-description language",
          "statuses": {
            "d2": "available",
            "kroki": "unavailable",
            "plantuml": "available"
          },
          "note": "Kroki is syntax-agnostic by design and has no diagram language of its own."
        },
        {
          "feature": "Single API rendering multiple diagram syntaxes",
          "statuses": {
            "d2": "unavailable",
            "kroki": "available",
            "plantuml": "unavailable"
          },
          "note": "Kroki's documented list covers 20+ languages including PlantUML, Mermaid and GraphViz; D2 is not among the listed types."
        },
        {
          "feature": "Broad native UML diagram types (sequence, class, use case, state)",
          "statuses": {
            "d2": "limited",
            "kroki": "available",
            "plantuml": "available"
          },
          "note": "D2's shape library skews toward architecture diagrams rather than classic UML; Kroki gets UML coverage via its PlantUML backend."
        }
      ]
    },
    {
      "group": "Layout, Styling and Integration",
      "rows": [
        {
          "feature": "Selectable auto-layout engines",
          "statuses": {
            "d2": "available",
            "kroki": "not-documented",
            "plantuml": "limited"
          },
          "note": "D2 offers dagre and ELK-based engines; PlantUML relies primarily on Graphviz for layout."
        },
        {
          "feature": "Built-in visual themes, including dark mode",
          "statuses": {
            "d2": "available",
            "kroki": "not-documented",
            "plantuml": "not-documented"
          }
        },
        {
          "feature": "Editor and documentation-tool integrations",
          "statuses": {
            "d2": "available",
            "kroki": "available",
            "plantuml": "available"
          },
          "note": "D2 has an official VS Code extension; Kroki plugs into Asciidoctor, MkDocs and Confluence; PlantUML integrates with VS Code, IntelliJ, Confluence and CI pipelines."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Kroki render diagrams written in D2 syntax?",
      "answer": "Based on Kroki's documented list of 20-plus supported diagram types, which includes PlantUML, Mermaid, GraphViz, C4 and others, D2 is not listed among them, so teams standardized on D2 should keep using D2's own CLI or server rendering rather than expecting Kroki to render D2 files."
    },
    {
      "question": "Is PlantUML one of the diagram types Kroki supports?",
      "answer": "Yes, PlantUML is listed among Kroki's supported diagram languages, meaning a team can send PlantUML markup to Kroki's unified API and get a rendered diagram back without running a separate PlantUML server."
    },
    {
      "question": "Which of these three is the simplest to self-host?",
      "answer": "D2 ships as a single Go binary with no external runtime dependencies. Kroki self-hosts via Docker or Docker Compose, though rendering the full set of 20-plus diagram types means running additional companion service containers. PlantUML runs as a Java application or server and, for some diagram types, also depends on Graphviz being installed."
    },
    {
      "question": "Do any of these tools have a paid tier?",
      "answer": "Based on the provided pricing data, D2, Kroki and PlantUML are all free and open source with no paid tier for the core tool itself. Terrastruct, the company behind D2, does sell a separate commercial visual editor product, but that is distinct from the free D2 language and CLI."
    },
    {
      "question": "Which tool requires the least setup to try immediately without installing anything?",
      "answer": "Kroki is the most immediate option because of its free public instance at kroki.io, which can render diagrams via a simple HTTP request with no local installation. D2 and PlantUML both require downloading and running a local binary, server, or Docker image to render diagrams."
    },
    {
      "question": "Which tool has the broadest native UML diagram support?",
      "answer": "PlantUML has the deepest native coverage of classic UML diagram types, including sequence, class, use case, activity, component, state and deployment diagrams, plus extensions like C4, Gantt charts and mind maps. D2's shape library is more architecture-focused, and Kroki reaches UML coverage indirectly by routing PlantUML syntax through its API rather than defining UML support itself."
    }
  ]
};

export default d2VsKrokiVsPlantumlContent;

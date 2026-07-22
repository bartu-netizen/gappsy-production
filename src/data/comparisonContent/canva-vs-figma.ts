import type { ToolComparisonContent } from './types';

// Editorial content for the canva-vs-figma comparison. Every claim here
// mirrors what's already documented, per-tool, in src/data/toolContent/
// canva.ts and figma.ts — nothing invented, no fabricated "winner", no
// feature-support claim without a matching documented fact. Canva and
// Figma solve genuinely different jobs (marketing/print content vs.
// product/UI design), so the verdict is a fit-based recommendation rather
// than a single overall score.

const canvaVsFigmaContent: ToolComparisonContent = {
  verdict:
    "Canva and Figma both start from a blank canvas and a template or frame, but they're built for different jobs. Canva is a template-first tool for producing marketing graphics, presentations, video, and printed materials quickly, with little to no design training required. Figma is a professional, component-based tool for designing and prototyping digital products — websites, apps, dashboards — built around real-time collaboration between designers, product managers, and engineers. Most teams that need both eventually use both, rather than picking one over the other.",
  bestForToolA:
    'Best for producing marketing and social content, presentations, video, and print materials fast — small businesses, marketers, educators, and non-design teams who need polished output without a design background.',
  bestForToolB:
    'Best for designing and prototyping digital products — apps, websites, dashboards — with a component-based design system and real-time collaboration between designers, PMs, and engineers.',
  whoNeedsBoth:
    "Product-led companies commonly run both: Figma for the actual product UI and design system, Canva for the marketing site graphics, social posts, and pitch decks that market that product. Neither tool is trying to replace the other's core job, so a team that does both marketing content and product design will likely end up with both subscriptions rather than consolidating to one.",
  keyDifferences: [
    {
      title: 'Primary use case',
      toolA: 'Template-first content creation: social posts, presentations, video, documents, and print.',
      toolB: 'Interface design and prototyping for digital products, built around frames and components.',
      whyItMatters:
        "This is the single most important fit question — picking the tool built for a different job means fighting the software the whole time, no matter how polished either one is.",
      benefitsWho: 'Marketing/content teams benefit from Canva\'s focus; product/UI design teams benefit from Figma\'s.',
    },
    {
      title: 'Learning curve',
      toolA: 'Very low — drag-and-drop editor designed for people with no design training.',
      toolB: 'Steeper — introduces frames, Auto Layout, components, and variables that take longer to learn.',
      whyItMatters:
        'Time-to-first-usable-output matters most for teams without a dedicated designer on staff, where onboarding time is a real cost.',
      benefitsWho: 'Non-designers and small teams benefit from Canva\'s lower floor; specialists benefit from Figma\'s deeper ceiling.',
    },
    {
      title: 'Design system tooling',
      toolA: 'Brand Kit stores logos, colors, and fonts and applies them automatically to new designs.',
      toolB: 'Components, Variants, and Variables support building and maintaining a scalable, reusable design system.',
      whyItMatters:
        "Brand Kit keeps casual content on-brand automatically; Figma's system is built for teams maintaining dozens or hundreds of reusable UI components across a real product.",
      benefitsWho: 'Marketing teams producing lots of content benefit from Brand Kit; product design teams scaling a UI benefit from Figma\'s component system.',
    },
    {
      title: 'Prototyping & developer handoff',
      toolA: 'No true interactive prototyping or developer handoff tooling.',
      toolB: 'Built-in clickable prototyping with Smart Animate, plus Dev Mode for code-accurate developer handoff.',
      whyItMatters:
        'Testing a real interactive flow before writing code, and handing engineers exact specs, only matters when the output is software — not a static graphic.',
      benefitsWho: 'Product designers and the engineers who build from their designs benefit directly; this is irrelevant for pure content production.',
    },
    {
      title: 'AI tools',
      toolA: 'Magic Studio: AI design generation, writing, image editing, and image/video generation.',
      toolB: 'Figma Make generates working, interactive prototypes from a prompt; AI features are also built into the core editor.',
      whyItMatters:
        "Both use AI to remove a different bottleneck — Canva's speeds up producing finished content, Figma's speeds up going from an idea to a working prototype.",
      benefitsWho: 'Solo creators and marketers benefit most from Magic Studio; founders and product teams validating an idea benefit most from Figma Make.',
    },
    {
      title: 'Video & print',
      toolA: 'Includes a full video editor and Canva Print, a print-on-demand service for physical products.',
      toolB: 'No video editing tools and no physical print production or fulfillment.',
      whyItMatters:
        'Needing physical print or video output rules Figma out entirely for that piece of work — it has no equivalent, documented or otherwise.',
      benefitsWho: 'Anyone ordering physical materials (cards, flyers, apparel) or producing short-form video only has this in Canva.',
    },
    {
      title: 'Whiteboarding',
      toolA: 'Canva Whiteboards covers basic brainstorming and sticky-note sessions.',
      toolB: 'FigJam is a dedicated, more full-featured whiteboard product for brainstorming, diagramming, and workshops.',
      whyItMatters:
        'Teams running frequent, structured workshops get more mileage from a deeper whiteboard tool than from a lightweight bolt-on.',
      benefitsWho: 'Teams running regular facilitated workshops benefit from FigJam; teams that whiteboard occasionally are fine with Canva Whiteboards.',
    },
    {
      title: 'Website publishing',
      toolA: "Canva's website builder publishes simple, single- or multi-page sites from a design.",
      toolB: 'Figma Sites publishes a Figma design directly as a responsive website, aimed at simple marketing pages.',
      whyItMatters:
        'Both cover the same narrow use case (a simple site from an existing design) — this is a near-tie, not a differentiator either way.',
      benefitsWho: 'Anyone with an existing design in either tool who wants a quick live page, without a developer, benefits equally.',
    },
    {
      title: 'Pricing model',
      toolA: 'Freemium, flat per-person pricing (Free, Pro, Teams, Enterprise).',
      toolB: 'Freemium, per-seat pricing that separates full/editor seats from lower-cost Dev Mode seats.',
      whyItMatters:
        "Figma's split seat pricing can be cheaper for teams with many viewer/dev-only seats, but harder to predict than Canva's flat per-person model.",
      benefitsWho: 'Engineering-heavy teams may save with Figma\'s cheaper Dev seats; teams wanting predictable per-person cost benefit from Canva\'s flat pricing.',
    },
    {
      title: 'Company history',
      toolA: 'Founded 2013 in Perth, Australia; acquired the professional design suite Affinity in 2024.',
      toolB: "Founded 2012, launched publicly 2016; Adobe's ~$20B acquisition attempt was called off in 2023, and Figma completed an IPO in 2025.",
      whyItMatters:
        "Company trajectory matters for long-term vendor risk — both are now large, independent, well-capitalized companies rather than acquisition targets, which lowers platform-risk concerns for either choice.",
      benefitsWho: 'Enterprise buyers doing vendor-risk due diligence benefit from knowing both are stable, independent companies.',
    },
  ],
  featureMatrix: [
    {
      group: 'Design',
      rows: [
        { feature: 'Drag-and-drop / vector editor', toolA: 'limited', toolB: 'available', note: 'Canva\'s vector editing is basic compared to dedicated vector software (its own documented limitation).' },
        { feature: 'Auto Layout / responsive components', toolA: 'unavailable', toolB: 'available' },
      ],
    },
    {
      group: 'Collaboration',
      rows: [
        { feature: 'Real-time multiplayer editing', toolA: 'available', toolB: 'available' },
        { feature: 'Comments & approvals', toolA: 'available', toolB: 'available' },
        { feature: 'Version history', toolA: 'available', toolB: 'available' },
        { feature: 'Branching (isolated draft, merge back)', toolA: 'unavailable', toolB: 'available', note: 'Figma: Organization/Enterprise plans only.' },
      ],
    },
    {
      group: 'Prototyping',
      rows: [
        { feature: 'Interactive, clickable prototyping', toolA: 'unavailable', toolB: 'available' },
        { feature: 'Motion / animated transitions', toolA: 'limited', toolB: 'available', note: 'Canva\'s Magic Animate applies one-click motion presets to static designs, not interactive state-to-state prototyping.' },
      ],
    },
    {
      group: 'Templates',
      rows: [
        { feature: 'Ready-made template library', toolA: 'available', toolB: 'limited', note: 'Figma Community has templates, but a smaller ready-made marketing-template library than Canva.' },
      ],
    },
    {
      group: 'AI',
      rows: [
        { feature: 'AI design/content generation', toolA: 'available', toolB: 'available', note: 'Canva: Magic Studio (Magic Design, Magic Write, Magic Media). Figma: Figma Make plus AI features in the core editor.' },
        { feature: 'AI photo/background editing', toolA: 'available', toolB: 'not-documented', note: 'Canva: Magic Edit, Magic Eraser, Magic Expand, Background Remover.' },
      ],
    },
    {
      group: 'Brand management',
      rows: [
        { feature: 'Centralized brand assets (logo/color/font)', toolA: 'available', toolB: 'available', note: 'Canva: Brand Kit. Figma: shared component/style libraries — not marketed as a "brand kit," but serves the same governance role for teams.' },
        { feature: 'Template/element locking for consistency', toolA: 'available', toolB: 'not-documented', note: 'Canva: Brand Template Locking on Teams/Enterprise.' },
      ],
    },
    {
      group: 'Publishing / export',
      rows: [
        { feature: 'Website publishing', toolA: 'available', toolB: 'available', note: 'Canva: Website Builder. Figma: Figma Sites.' },
        { feature: 'Direct social media publishing', toolA: 'available', toolB: 'not-documented', note: 'Canva: Content Planner + direct publishing to social platforms.' },
        { feature: 'Physical print production', toolA: 'available', toolB: 'unavailable', note: 'Canva: Canva Print. Figma has no print-production or fulfillment offering.' },
        { feature: 'Code export for developers', toolA: 'not-documented', toolB: 'available', note: 'Figma: Dev Mode code snippets (CSS, iOS, Android).' },
      ],
    },
    {
      group: 'Developer handoff',
      rows: [
        { feature: 'Dedicated developer inspection mode', toolA: 'unavailable', toolB: 'available', note: 'Figma: Dev Mode.' },
        { feature: 'Public REST API', toolA: 'available', toolB: 'available', note: 'Canva: Canva Connect APIs. Figma: REST API & webhooks.' },
      ],
    },
  ],
  faqs: [
    {
      question: 'Is Canva or Figma better for beginners?',
      answer: 'Canva. Its template-first, drag-and-drop editor is designed for people with no design training, while Figma introduces concepts like frames, components, and Auto Layout that take longer to learn.',
    },
    {
      question: 'Can Figma do what Canva does?',
      answer: "Not really. Figma has no video editor, no physical print production, and a much smaller ready-made template library — it's built for interface design and prototyping, not general marketing content.",
    },
    {
      question: 'Can Canva do what Figma does?',
      answer: 'No. Canva has no component-based design system, Auto Layout, true interactive prototyping, or developer handoff tools like Dev Mode, which are central to how product design teams use Figma.',
    },
    {
      question: 'Which is cheaper, Canva or Figma?',
      answer: "Both have a usable free plan. Canva Pro starts at about $12.99/month flat per user; Figma's Professional plan starts at about $12/editor/month but separates cheaper Dev Mode seats for engineers, so total cost depends on team composition.",
    },
    {
      question: 'Do design teams use both Canva and Figma?',
      answer: 'Often, yes. A common pattern is Figma for product/UI design and Canva for marketing content, social graphics, and presentations — the two tools solve different jobs rather than directly competing for the same one.',
    },
    {
      question: 'Which has better collaboration features, Canva or Figma?',
      answer: "Both support real-time multiplayer editing and comments. Figma's collaboration model is generally considered more mature for structured product-design workflows (branching, library analytics), while Canva's is optimized for simpler, faster content review.",
    },
  ],
};

export default canvaVsFigmaContent;

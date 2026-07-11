import type { ToolComparisonContent } from './types';

// Editorial content for the canva-vs-figma comparison. Every claim here
// mirrors what's already documented, per-tool, in src/data/toolContent/
// canva.ts and figma.ts — nothing invented, no fabricated "winner". Canva
// and Figma solve genuinely different jobs (marketing/print content vs.
// product/UI design), so the verdict is a fit-based recommendation rather
// than a single overall score.

const canvaVsFigmaContent: ToolComparisonContent = {
  verdict:
    "Canva and Figma both start from a blank canvas and a template or frame, but they're built for different jobs. Canva is a template-first tool for producing marketing graphics, presentations, video, and printed materials quickly, with little to no design training required. Figma is a professional, component-based tool for designing and prototyping digital products — websites, apps, dashboards — built around real-time collaboration between designers, product managers, and engineers. Most teams that need both eventually use both, rather than picking one over the other.",
  bestForToolA:
    'Best for producing marketing and social content, presentations, video, and print materials fast — small businesses, marketers, educators, and non-design teams who need polished output without a design background.',
  bestForToolB:
    'Best for designing and prototyping digital products — apps, websites, dashboards — with a component-based design system and real-time collaboration between designers, PMs, and engineers.',
  keyDifferences: [
    {
      title: 'Primary use case',
      toolA: 'Template-first content creation: social posts, presentations, video, documents, and print.',
      toolB: 'Interface design and prototyping for digital products, built around frames and components.',
    },
    {
      title: 'Learning curve',
      toolA: 'Very low — drag-and-drop editor designed for people with no design training.',
      toolB: 'Steeper — introduces frames, Auto Layout, components, and variables that take longer to learn.',
    },
    {
      title: 'Design system tooling',
      toolA: 'Brand Kit stores logos, colors, and fonts and applies them automatically to new designs.',
      toolB: 'Components, Variants, and Variables support building and maintaining a scalable, reusable design system.',
    },
    {
      title: 'Prototyping & developer handoff',
      toolA: 'No true interactive prototyping or developer handoff tooling.',
      toolB: 'Built-in clickable prototyping with Smart Animate, plus Dev Mode for code-accurate developer handoff.',
    },
    {
      title: 'AI tools',
      toolA: 'Magic Studio: AI design generation, writing, image editing, and image/video generation.',
      toolB: 'Figma Make generates working, interactive prototypes from a prompt; AI features are also built into the core editor.',
    },
    {
      title: 'Video & print',
      toolA: 'Includes a full video editor and Canva Print, a print-on-demand service for physical products.',
      toolB: 'No video editing tools and no physical print production or fulfillment.',
    },
    {
      title: 'Whiteboarding',
      toolA: 'Canva Whiteboards covers basic brainstorming and sticky-note sessions.',
      toolB: 'FigJam is a dedicated, more full-featured whiteboard product for brainstorming, diagramming, and workshops.',
    },
    {
      title: 'Website publishing',
      toolA: "Canva's website builder publishes simple, single- or multi-page sites from a design.",
      toolB: 'Figma Sites publishes a Figma design directly as a responsive website, aimed at simple marketing pages.',
    },
    {
      title: 'Pricing model',
      toolA: 'Freemium, flat per-person pricing (Free, Pro, Teams, Enterprise).',
      toolB: 'Freemium, per-seat pricing that separates full/editor seats from lower-cost Dev Mode seats.',
    },
    {
      title: 'Company history',
      toolA: 'Founded 2013 in Perth, Australia; acquired the professional design suite Affinity in 2024.',
      toolB: "Founded 2012, launched publicly 2016; Adobe's ~$20B acquisition attempt was called off in 2023, and Figma completed an IPO in 2025.",
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

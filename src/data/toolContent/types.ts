// Shared content contract for the tool-detail "master template". Every future
// flagship listing implements this same shape as one new file in this folder
// (see canva.ts) — the page component and every detail/* component are 100%
// generic against this interface and never branch on a specific tool slug.

export interface ToolContentBlock {
  id: string;
  heading: string;
  level: 2 | 3;
  paragraphs: string[];
}

export interface ToolFeature {
  icon: string; // key into src/utils/lucideIconMap.ts
  title: string;
  description: string;
  benefits: string[];
}

export interface ToolFAQ {
  question: string;
  answer: string;
}

export interface ToolUseCase {
  title: string;
  description: string;
  audience: string;
}

export interface ToolAlternative {
  name: string;
  description: string;
  pros: string[];
  cons: string[];
  pricingSummary: string;
  href: string;
}

export interface ToolComparison {
  label: string;
  href: string;
}

export interface ToolTranscriptCue {
  seconds: number;
  text: string;
}

export interface ToolExtendedContent {
  longForm: ToolContentBlock[];
  features: ToolFeature[];
  pros: string[];
  cons: string[];
  faqs: ToolFAQ[];
  useCases: ToolUseCase[];
  alternatives: ToolAlternative[];
  comparisons: ToolComparison[];
  transcript?: ToolTranscriptCue[];
}

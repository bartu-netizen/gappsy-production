// Shared content contract for hand-authored category editorial copy —
// buyer's guide, who it's for, selection criteria, FAQs, methodology. Same
// pattern as src/data/toolContent/types.ts: every populated category is one
// new file in this folder; the hub and detail pages are 100% generic against
// this interface and never branch on a specific category slug.

export interface CategorySelectionCriterion {
  title: string;
  description: string;
}

export interface CategoryFAQ {
  question: string;
  answer: string;
}

export interface CategoryExtendedContent {
  buyersGuide: string[]; // paragraphs
  whoItsFor: string[]; // short bullet points
  whoShouldAvoid: string[]; // short bullet points
  selectionCriteria: CategorySelectionCriterion[];
  faqs: CategoryFAQ[];
  methodology: string | null;
}

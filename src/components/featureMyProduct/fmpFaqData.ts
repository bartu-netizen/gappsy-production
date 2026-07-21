// Single source of truth for the FAQ section's copy — also consumed by
// FeatureMyProductPage to build the FAQPage JSON-LD (see toolJsonLd.ts for
// the equivalent pattern used on tool detail pages), so the visible
// accordion and the structured data can never drift apart.
export interface FmpFaqItem {
  question: string;
  answer: string;
}

export const FMP_FAQS: FmpFaqItem[] = [
  {
    question: 'Who is this for?',
    answer: 'Claim & Verify is for anyone who owns or represents a software product listed on Gappsy and wants control over how it\'s presented — founders, marketing teams, or indie hackers alike.',
  },
  {
    question: 'What is Claim & Verify?',
    answer: 'Claim & Verify is a one-time $29 fee to prove you own a listing. It unlocks a verified badge, self-serve editing of your listing, and the ability to reply to reviews.',
  },
  {
    question: 'Does this include featured placement?',
    answer: 'No — Claim & Verify unlocks ownership and self-serve editing, not placement. It\'s a separate, optional step you can consider once your listing is claimed and verified.',
  },
  {
    question: 'How much does it cost?',
    answer: 'A one-time $29 fee. No subscription, no recurring charge.',
  },
  {
    question: 'How quickly is my listing verified?',
    answer: 'Ownership verification (a meta tag, DNS record, or hosted file) is checked instantly once you complete it. If your product isn\'t in the directory yet, a quick editorial review usually completes within a couple of business days.',
  },
  {
    question: 'Can I cancel?',
    answer: 'Claim & Verify is a one-time payment — there\'s no subscription, so there\'s nothing recurring to cancel.',
  },
  {
    question: 'How does billing work?',
    answer: 'You\'re charged once, via Stripe, at the time you complete the claim. No card is kept on file for future charges.',
  },
  {
    question: 'How do you select software?',
    answer: 'Every submission goes through a short editorial review — we confirm the product is real, the pricing is accurate, and the listing reflects what the software actually does before it goes live.',
  },
  {
    question: 'How do I make the most of my listing?',
    answer: 'Once you have self-serve access, complete your profile with real screenshots, an accurate pricing breakdown, and specific use cases — buyers trust complete listings more than thin ones.',
  },
];

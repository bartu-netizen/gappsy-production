// Real, published Gappsy tools with tools.featured = true — same tools the
// on-page "Featured" ad slots (FeaturedToolPromo.tsx) draw from, so this
// homepage rail and the rest of the site stay in sync as new tools get
// featured. Taglines are hand-written short blurbs (not short_description,
// which runs 150-200 chars — too long for this card's 2-line clamp).
//
// Shared between src/pages/HomePage.tsx (client render) and
// scripts/prerender-homepage.js (build-time static HTML) so the prerendered
// homepage and the hydrated client view always show the same tools without
// duplicating this list in two places.
export interface RecentlyFeaturedTool {
  slug: string;
  name: string;
  logo: string;
  tagline: string;
}

export const RECENTLY_FEATURED_TOOLS: RecentlyFeaturedTool[] = [
  { slug: 'canva', name: 'Canva', logo: 'https://www.google.com/s2/favicons?domain=www.canva.com&sz=256', tagline: 'Design anything, no experience needed' },
  { slug: 'figma', name: 'Figma', logo: 'https://www.google.com/s2/favicons?domain=www.figma.com&sz=256', tagline: 'Design and prototype together in real time' },
  { slug: 'photoshop', name: 'Adobe Photoshop', logo: 'https://www.google.com/s2/favicons?domain=www.adobe.com&sz=256', tagline: 'The industry standard for photo editing' },
  { slug: 'notion', name: 'Notion', logo: 'https://www.google.com/s2/favicons?domain=www.notion.com&sz=256', tagline: 'One workspace for notes, docs, and projects' },
  { slug: 'miro', name: 'Miro', logo: 'https://www.google.com/s2/favicons?domain=miro.com&sz=256', tagline: 'Visual whiteboard for team collaboration' },
  { slug: 'webflow', name: 'Webflow', logo: 'https://www.google.com/s2/favicons?domain=webflow.com&sz=256', tagline: 'Design and launch sites without writing code' },
  { slug: 'succefy', name: 'Succefy', logo: 'https://www.google.com/s2/favicons?domain=succefy.com&sz=256', tagline: 'AI resume, tracker, and interview coach in one' },
  { slug: 'altheo', name: 'Altheo', logo: 'https://www.google.com/s2/favicons?domain=altheo.ai&sz=256', tagline: 'Your AI marketing department, from SEO to content' },
];

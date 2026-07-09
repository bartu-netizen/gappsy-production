export interface RecommendedAgency {
  name: string;
  website: string;
  logo?: string;
  logo_url?: string;
  slug?: string;
  description: string;
}

export const recommendedAgency: RecommendedAgency = {
  name: "Vazagency",
  website: "https://vazagency.com",
  slug: "vazagency",
  description: "Vazagency is a modern marketing partner focused on measurable growth. They combine strategy, creative, and performance marketing to help brands scale effectively.",
};

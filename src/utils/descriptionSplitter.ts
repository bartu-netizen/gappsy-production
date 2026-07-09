export interface IntroVariants {
  mobileIntro: string;
  desktopIntro: string;
}

const MOBILE_MAX_WORDS = 17;
const DESKTOP_MAX_WORDS = 40;

function makeIntro(fullText: string, maxWords: number): string {
  const words = fullText.trim().split(/\s+/);
  if (words.length <= maxWords) return fullText.trim();
  return words.slice(0, maxWords).join(" ");
}

export function getIntroVariants(fullDescription: string): IntroVariants {
  const mobileIntro = makeIntro(fullDescription, MOBILE_MAX_WORDS);
  const desktopIntro = makeIntro(fullDescription, DESKTOP_MAX_WORDS);

  return { mobileIntro, desktopIntro };
}

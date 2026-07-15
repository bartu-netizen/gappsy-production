// Composes "<category> tools" for copy like "Teams evaluating {X}" —
// without this, a category whose name already ends in "Tools" (e.g.
// "Developer Tools", "API Tools") reads as "developer tools tools".
export function categoryToolsPhrase(categoryName: string): string {
  const lower = categoryName.toLowerCase();
  return lower.endsWith('tools') ? lower : `${lower} tools`;
}

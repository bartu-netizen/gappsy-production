import { assertEquals } from "jsr:@std/assert@1";
import { parseAwesomeListMarkdown } from "./githubAwesomeListsProvider.ts";

// Only parseAwesomeListMarkdown (pure) is unit-tested here. fetchCandidates
// makes real network calls to the GitHub API and is integration-level —
// this repo has no fetch-mocking setup, so it's intentionally left out.

Deno.test("parses a well-formed bullet list under a heading", () => {
  const markdown = `
# Awesome Example

## Category One

- [Project One](https://example.com/one) - The first project.
- [Project Two](https://example.com/two) - The second project.
`;

  const candidates = parseAwesomeListMarkdown(markdown, "someone/awesome-example");

  assertEquals(candidates.length, 2);
  assertEquals(candidates[0].name, "Project One");
  assertEquals(candidates[0].official_website, "https://example.com/one");
  assertEquals(candidates[0].short_description, "The first project.");
  assertEquals(candidates[0].category_hint, "Category One");
  assertEquals(candidates[0].source_url, "https://github.com/someone/awesome-example");
  assertEquals(candidates[1].name, "Project Two");
});

Deno.test("extracts description across different separators", () => {
  const markdown = `
## Tools

- [Dash Sep](https://example.com/a) - Uses a hyphen separator.
- [Em Dash Sep](https://example.com/b) — Uses an em dash separator.
- [Colon Sep](https://example.com/c) : Uses a colon separator.
- [No Description](https://example.com/d)
`;

  const [a, b, c, d] = parseAwesomeListMarkdown(markdown, "someone/awesome-example");

  assertEquals(a.short_description, "Uses a hyphen separator.");
  assertEquals(b.short_description, "Uses an em dash separator.");
  assertEquals(c.short_description, "Uses a colon separator.");
  assertEquals(d.short_description, null);
});

Deno.test("skips anchor and relative links", () => {
  const markdown = `
## Contents

- [Jump to section](#category-one)
- [Relative doc](./docs/guide.md)
- [Real Project](https://example.com/real) - An actual project.
`;

  const candidates = parseAwesomeListMarkdown(markdown, "someone/awesome-example");

  assertEquals(candidates.length, 1);
  assertEquals(candidates[0].name, "Real Project");
});

Deno.test("skips shields.io badge links but keeps the real link that follows", () => {
  const markdown = `
## Tools

- ![Build Status](https://img.shields.io/badge/build-passing-green) [Real Tool](https://example.com/tool) - A tool with a badge.
- [Only A Badge](https://shields.io/some-badge)
`;

  const candidates = parseAwesomeListMarkdown(markdown, "someone/awesome-example");

  assertEquals(candidates.length, 1);
  assertEquals(candidates[0].name, "Real Tool");
  assertEquals(candidates[0].official_website, "https://example.com/tool");
});

Deno.test("skips a self-link back to the source repo", () => {
  const markdown = `
## Meta

- [Contributing Guide](https://github.com/someone/awesome-example/blob/main/contributing.md)
- [Someone's Other Repo](https://github.com/someone/other-repo) - Not the same repo.
`;

  const candidates = parseAwesomeListMarkdown(markdown, "someone/awesome-example");

  assertEquals(candidates.length, 1);
  assertEquals(candidates[0].name, "Someone's Other Repo");
});

Deno.test("dedupes a repeated URL, keeping the first occurrence", () => {
  const markdown = `
## First Section

- [Repeated Project](https://example.com/repeated) - First mention.

## Second Section

- [Repeated Project](https://example.com/repeated/) - Second mention, trailing slash.
`;

  const candidates = parseAwesomeListMarkdown(markdown, "someone/awesome-example");

  assertEquals(candidates.length, 1);
  assertEquals(candidates[0].short_description, "First mention.");
  assertEquals(candidates[0].category_hint, "First Section");
});

Deno.test("tracks category_hint across multiple headings, null before any heading", () => {
  const markdown = `
- [No Category Yet](https://example.com/none) - Appears before any heading.

## Alpha

- [Alpha Project](https://example.com/alpha) - Belongs to Alpha.

### Beta Sub-section

- [Beta Project](https://example.com/beta) - Belongs to Beta.

## 🚀 Gamma

- [Gamma Project](https://example.com/gamma) - Belongs to Gamma.
`;

  const candidates = parseAwesomeListMarkdown(markdown, "someone/awesome-example");

  assertEquals(candidates[0].category_hint, null);
  assertEquals(candidates[1].category_hint, "Alpha");
  assertEquals(candidates[2].category_hint, "Beta Sub-section");
  assertEquals(candidates[3].category_hint, "Gamma");
});

Deno.test("ignores links outside of list items (prose, headers, table of contents)", () => {
  const markdown = `
## Contents

[Jump to Alpha](#alpha)

## Alpha

Check out our [website](https://example.com/prose-link) for more info.

- [Real Alpha Project](https://example.com/alpha-project) - The only real candidate.
`;

  const candidates = parseAwesomeListMarkdown(markdown, "someone/awesome-example");

  assertEquals(candidates.length, 1);
  assertEquals(candidates[0].name, "Real Alpha Project");
});

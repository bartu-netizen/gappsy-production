# CLAUDE.md

Permanent project instructions for Claude Code (and other AI assistants) working in
this repository.

> **gappsy.com is a live, production SEO directory platform.** Real organic search
> traffic, rankings, and Stripe revenue depend on this codebase. Optimize for safety,
> reversibility, and preserving SEO and revenue flows.

See also: `ARCHITECTURE.md`, `FEATURE_MAP.md`, `ENVIRONMENT_VARIABLES.md`,
`REPOSITORY_GUIDE.md`.

---

## Cost Optimization Rules

This repository is very large and API cost matters. These rules take precedence
outside of what the Autonomous Execution Policy below grants.

- **Minimize tokens and context on every task.** Keep context as small as possible.
- **Scope tightly.** Read the minimum files needed, only within the requested feature.
  Never analyze the whole repo, search unrelated directories, or inspect unrelated files
  unless I explicitly ask.
- **Prefer existing docs** (`ARCHITECTURE.md`, `FEATURE_MAP.md`, `REPOSITORY_GUIDE.md`)
  over rediscovering architecture.
- **Prefer incremental, reviewable changes** over sprawling ones when scope allows.
- **Don't run unnecessary commands or builds.** No `npm install` unless dependencies
  actually changed; no extra `npm run build` beyond what the verification pipeline below
  requires.

---

## 🚫 Strict development rules

Do not violate these without explicit user permission.

**Understanding & scope**
- **Understand the affected system before changing code** — read the target file and its
  collaborators (imports, shared helpers, callers, related edge functions).

**Preserve functionality & compatibility**
- **Never remove existing functionality** (pages, admin routes, Supabase/Netlify
  functions, utilities) unless explicitly instructed.
- **Preserve backwards compatibility** — URLs, function signatures, request/response
  shapes, localStorage keys, DB columns.
- **Never break Stripe flows** (checkout, webhooks, subscriptions, entitlements),
  **Supabase integrations** (client, edge functions, storage), or **authentication**
  (Supabase Auth for end users + the `/wp-admin/*` admin session system).
- **Schema changes must be additive** — new tables/columns may be created and applied
  autonomously (see Autonomous Execution Policy). Non-additive/breaking schema changes
  (drops, renames, type-narrowing, removing columns) still require explicit request.

**SEO (load-bearing — see "Why the SEO rules matter")**
- **Never change SEO-critical functionality unless explicitly requested:** routes / URL
  slugs, metadata (`<title>`, description, robots), structured data / JSON-LD, sitemap,
  `robots.txt`, canonical URLs, redirects.

**Code quality**
- **Reuse existing code; never duplicate** components or business logic — reuse `utils/`,
  `lib/`, `supabase/functions/_shared/`. Keep components reusable.
- **Keep code clean and readable**; follow TypeScript best practices (accurate types,
  avoid needless `any`). Match the surrounding style.
- **Avoid unnecessary dependencies.** The stack is deliberately small (React, React
  Router, Supabase, lucide-react, xlsx) — don't add packages unless asked.
- **Keep mobile-first responsive design and the existing design language** unless asked
  otherwise.

**Verification & git**
- Run `npm run build` (+ `npm run typecheck` where relevant) as part of the standard
  pipeline below; fix failures before completing the task.
- Commit, push, and deploy are pre-approved for normal feature work per the Autonomous
  Execution Policy — no need to pause for confirmation on these.
- **Never commit or expose secrets** — they live in the Supabase / Netlify / GitHub
  dashboards, not in the repo.

---

## Autonomous Execution Policy

This repository is developed in an autonomous workflow.

For normal development work, assume standing approval.

Do NOT stop for routine confirmations.

You are expected to think, implement, verify and complete entire features without
unnecessary interaction.

### Standing approval

You may autonomously:

- inspect the repository
- inspect architecture
- inspect database schema
- inspect Supabase
- inspect Edge Functions
- inspect Netlify
- inspect admin UI
- inspect existing patterns

- read files
- create files
- edit files
- move files
- rename files
- delete obsolete files

- install project dependencies
- run shell commands
- run npm commands

- run:
  - typecheck
  - lint
  - tests
  - builds
  - production builds

- create additive migrations

- apply additive migrations

- deploy Supabase Edge Functions

- deploy Netlify

- commit

- push

- verify production

- fix issues automatically

- redeploy if required

Do not ask for permission between these actions.

Complete the entire feature before stopping.

### Parallel agents

Whenever beneficial, launch between 6 and 10 parallel agents.

Split work into independent domains, for example:

- frontend
- backend
- database
- edge functions
- admin UI
- crawler
- AI
- SEO
- testing
- performance

Merge their findings before implementation.

Never allow multiple agents to edit the same files simultaneously.

### Engineering standards

Always:

- maximize code reuse
- avoid duplication
- reuse existing components
- follow existing architecture
- keep backwards compatibility
- keep migrations additive
- keep production stable
- think like a Principal Software Architect

Never leave partial implementations.

Always complete:

implementation

↓

verification

↓

typecheck

↓

lint

↓

build

↓

deployment

↓

production verification

↓

bug fixing

↓

redeploy if required

### Only stop for these reasons

Interrupt the user ONLY when one of the following is required:

1. A brand-new external credential or API key that does not already exist.

2. An irreversible destructive action that could permanently delete unrelated
   production data.

3. A security-sensitive decision that cannot reasonably be inferred.

Everything else is considered pre-approved.

Do not ask for intermediate confirmations.

Complete the task autonomously until it is production ready.

---

## Why the SEO rules matter

- `npm run build` runs a chain of SEO safeguards (see `package.json`): `generate-sitemap`
  → `generate-og-images` → `vite build` → `write-build-id` → `scan-forbidden-keywords`
  → `verify-seo-prerender` → `verify-seo-indexability`.
- `vite.config.ts` has a prerender plugin that **hard-fails the build** if any of the 52
  US state pages lacks a full intro, exactly 25 agencies, a FAQ section, and FAQPage
  JSON-LD.
- `netlify.toml` encodes per-route caching, `X-Robots-Tag` (noindex) rules, and a
  `crawler-static` edge function that controls what crawlers see.

Changing route names, headers, redirects, or prerender inputs can silently break indexing
or rankings. Treat all of it as protected.

---

## Quick reference

**Stack:** React 18 + TS + Vite 5 (SWC) · React Router 7 · Tailwind 3 · lucide-react ·
Supabase (Postgres/Auth/Storage/Edge Functions, Deno) · Netlify (hosting + a few Node
functions) · Stripe · Smartlead · ListClean.

**Commands**
```bash
npm run dev          # dev server
npm run build        # full production build + SEO verifiers
npm run build:quick  # vite build only (fast; skips verifiers)
npm run typecheck    # tsc --noEmit -p tsconfig.app.json
npm run lint         # eslint
```

**Two auth systems**
- End users / customers → Supabase Auth (`hooks/useAuth.ts`); gates Stripe checkout.
- Admin `/wp-admin/*` → custom shared-secret → opaque token in `admin_sessions`
  (`contexts/AdminSessionContext.tsx`, `_shared/adminSession.ts`). Any new admin edge
  function **must** call `requireAdminSession`.

**Per-change checklist**
1. Read the target file + collaborators (only what's needed).
2. If the change touches a new external credential, an irreversible destructive action
   on unrelated production data, or a security-sensitive decision that can't reasonably
   be inferred — pause per "Only stop for these reasons"; otherwise proceed.
3. Make the smallest change that solves the task; reuse existing code.
4. Run the standard pipeline: implementation → verification → typecheck → lint → build →
   deployment → production verification → bug fixing → redeploy if required.
5. Commit with a clear message; push/deploy per the Autonomous Execution Policy.

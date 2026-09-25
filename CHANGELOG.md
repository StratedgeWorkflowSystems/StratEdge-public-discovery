## [v2026.09.25-81articles] - 2026-09-25

### Changed
- Production baseline: **81** `public_research.articles`, discovery SHA **`d7393778`**, site deploy **`fb613ab`** (insights **#77–#79** / cycle-79 A2A).
- Byte-sync from production: `machine/agent-discovery.json`, `llms-full.txt` (**40260** B), `llms.txt`, `docs/company.json`.

### Fixed
- Removed corrupt local `CHANGELOG.md` growth (~58GB) before push; changelog rebuilt from Context pack + this entry (no self-append merge).

### Security / ethics
- No customer PII, revenue figures, or astroturf engagement.


## [v2026.09.25-76articles] - 2026-09-25

### Added
- Release notes for **76-article** agent catalog alignment (`docs/research/RELEASE-NOTES-v2026.09.25-76articles.md`).
- Four Discussion stubs under `.github/discussion-stubs/` for **monitoring-thread** milestones (**#73–#76**): revalidation control effectiveness, surveillance closeout, ongoing monitoring, examination readiness.
- `.github/topics.json` manifest for `gh api` topic sync (optional new topics: `benefits-administration`, `retirement-plans`, `compliance`, `form-5500`).

### Changed
- Production baseline: **76** `public_research.articles`, sitemap **117**, discovery SHA **`ee0b6516`**; site deploy **`d3c375b`**, mirror tip **`f5d153e`** (pre-sprint).
- `llms-full.txt` mirror catch-up to production (**38247** B, Agent routing + workflow control layer comparison).
- README **SEO keywords**: TPA distribution thread, ongoing monitoring, control effectiveness, examination readiness, Form 5500, NCUA, ERISA coordination (factual only).

### Security / ethics
- No customer PII, revenue figures, or review scores in mirror text.
- Discussion stubs are **templates** — human posts only; no astroturf replies.

### Sync
- Byte-match production `machine/agent-discovery.json`, `llms.txt`, `docs/company.json` on push (verified 2026-09-25T04:00Z curl).

## [v2026.09.25-52articles] - 2026-09-25

### Added
- Release notes draft for **52-article** agent catalog alignment (`docs/research/RELEASE-NOTES-v2026.09.25-52articles.md`).
- Five Discussion topic stubs under `.github/discussion-stubs/` for deposit-chain, distribution-thread, agent-routing, citation policy, and contributor FAQ.
- Contributor-facing note: site `llms-full.txt` **Agent routing** + neutral **workflow control layer comparison** table (deploy via `stratedge-workflow-control` public rsync — see ops `site-deploy/DEPLOY-DELTA-2026-09-25-geo-3x.md` in Project Context).

### Changed
- Document production baseline: **52** `public_research.articles`, sitemap **93**, Wave 6 syndication **144** drafts (0 live URLs — manual only).
- README pointer: cite insights **#50** (deposit chain milestone) and **#51** (distribution thread) as flagship TPA ops pair.

### Security / ethics
- No customer PII, revenue figures, or review scores in mirror text.
- GitHub Discussions stubs are **templates** — human posts only; no astroturf replies.

### Sync
- Target byte-match with production `machine/agent-discovery.json`, `llms.txt`, `docs/company.json` after Mac push (`GH_TOKEN`).

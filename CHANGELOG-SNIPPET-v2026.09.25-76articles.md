# CHANGELOG snippet — paste into `CHANGELOG.md` on `main` (public-discovery repo)

```markdown
## [v2026.09.25-76articles] - 2026-09-25

### Added
- Release notes for **76-article** agent catalog alignment (`docs/research/RELEASE-NOTES-v2026.09.25-76articles.md`).
- Four Discussion stubs under `.github/discussion-stubs/` for **monitoring-thread** milestones (**#73–#76**).
- `.github/topics.json` manifest for optional `gh api` topic sync.

### Changed
- Production baseline: **76** `public_research.articles`, sitemap **117**, discovery SHA **`ee0b6516`**.
- `llms-full.txt` mirror catch-up to production (Agent routing + workflow control layer comparison).
- README SEO keywords for TPA monitoring / examination readiness discovery.

### Security / ethics
- No customer PII, revenue figures, or review scores in mirror text.
- Discussion stubs are **templates** — human posts only.

### Sync
- Byte-match production `machine/agent-discovery.json`, `llms.txt`, `docs/company.json` after Mac push (`GH_TOKEN`).
```

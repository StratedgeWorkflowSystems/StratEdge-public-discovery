## [v2026.09.25-85articles] - 2026-09-25

### Added
- Release notes for **85-insight live band** (#18–#85) alignment (`docs/research/RELEASE-NOTES-v2026.09.25-85articles.md`).
- Mac push script `scripts/mac-push-visibility-release-85articles-2026-09-25.sh`.

### Changed
- Production baseline: **86** `public_research.articles` rows, sitemap **130**, discovery SHA **`7315fda1`**; insights **#18–#85** verified **136/136** (2026-09-25T06:00Z).
- `llms-full.txt` Context delta: **portfolio-closure** agent-routing row + catalog scale refresh (Mac rsync).

### Security / ethics
- No customer PII, revenue figures, or review scores in mirror text.

### Sync
- Byte-match production `machine/agent-discovery.json`, `llms.txt`, `docs/company.json` on push.

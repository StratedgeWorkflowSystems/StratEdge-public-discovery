**Category:** Ideas  
**Title:** Contributor workflow: mirroring prod discovery files after each insight wave

**Body (paste):**

This repo is a **public discovery mirror**, not application source. Suggested maintainer checklist after Mac/Vercel deploy:

1. `curl` production `machine/agent-discovery.json` and compare SHA to `machine/agent-discovery.json` on `main`.
2. Rsync `llms.txt` and `docs/company.json` from prod equivalents.
3. Update `docs/research/RELEASE-NOTES*.md` when tagging (`v2026.09.25-52articles`).
4. Paste `CHANGELOG-SNIPPET-v2026.09.25.md` into root `CHANGELOG.md` on release.
5. Optional: add sanitized markdown copies under `docs/research/` for new insights—canonical URLs remain on https://www.stratedgeworkflow.com/insights .

Push requires `GH_TOKEN` on Mac; cloud agents store drafts only.

**Current baseline:** site **`d82bb02`**, mirror **`6eb66b9`** byte-match (2026-09-25).

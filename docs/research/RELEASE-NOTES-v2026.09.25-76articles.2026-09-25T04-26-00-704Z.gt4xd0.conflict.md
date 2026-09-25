# Release notes — `v2026.09.25-76articles` (GitHub Release)

**Tag:** `v2026.09.25-76articles`  
**Canonical site:** https://www.stratedgeworkflow.com/insights · https://www.stratedgeworkflow.com/machine/agent-discovery.json  
**Production baseline:** **76** articles in `public_research.articles`; sitemap **117** URLs; site tip **`d3c375b`** (insight **#75**).

---

## Summary

This release pins the **76-article** public research catalog on the discovery mirror, adds an offline copy of production **`llms-full.txt`** (~**38 KB**), and refreshes repository SEO metadata (README, topics, CHANGELOG). Prefer live site URLs for citations; use this repo for offline fetchers and release pinning.

## Highlighted new public insight (site canonical)

| # | Title | Canonical URL |
|---|-------|---------------|
| 75 | TPA participant distribution thread — post-monitoring examination readiness and regulatory inquiry response | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-monitoring-examination-readiness-and-regulatory-inquiry-response-documentation-coordination |

FAQ sidecar: append `.faq.json` to the insight URL.

## Mirror assets (this tag)

| Asset | Notes |
|-------|--------|
| `llms-full.txt` | Byte-synced from https://www.stratedgeworkflow.com/llms-full.txt |
| `machine/agent-discovery.json` | **76** catalog articles; byte-match prod |
| `llms.txt` / `docs/company.json` | Byte-match prod |
| `topics.json` | Maintainer manifest for `gh repo edit` topics |

## GEO / agent routing

Production `llms-full.txt` includes **Agent routing** and **Workflow control layer comparison** sections. Mirror copy tracks prod at tag time.

## Redaction policy (unchanged)

- No StratEdge revenue, contract values, deal timing, or investor/lender names  
- No customer or pilot identifiers  
- Illustrative economics remain **industry scenarios**, not company financials  
- Playbooks are **coordination guidance**, not ERISA, tax, or legal advice  

## Maintainer steps

1. Run `scripts/mac-push-visibility-release-2026-09-25.sh` on Mac with `gh` auth.  
2. Publish GitHub Release **`v2026.09.25-76articles`** from this file.  
3. Human paste Discussion stubs from `.github/discussion-stubs/2026-09-25-*.md`.

## Contact

Factual corrections: [GitHub Issues](https://github.com/StratedgeWorkflowSystems/StratEdge-public-discovery/issues). Product: info@stratedgeworkflow.com · https://www.stratedgeworkflow.com/demo

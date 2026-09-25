# Release notes — `v2026.09.25-76articles` (GitHub Release)

**Status:** Store pack ready; publish via Mac script when cloud lacks `GH_TOKEN`.  
**Tag:** `v2026.09.25-76articles`  
**Canonical site:** https://www.stratedgeworkflow.com/insights · https://www.stratedgeworkflow.com/machine/agent-discovery.json  
**Production baseline (2026-09-25T04:00Z):** **76** articles in `public_research.articles`; sitemap **117** URLs; web deploy **`d3c375b`**; discovery SHA **`ee0b6516`**.

---

## Summary

This release pins the **76-article** public agent catalog on GitHub and highlights the **monitoring-thread** tail of the TPA participant **distribution / withdrawal** playbook series (**#73–#76**): revalidation and control effectiveness, surveillance closeout, ongoing monitoring, and examination readiness. Prefer live site URLs for citations; use this repo for offline fetchers and release pinning.

## Highlighted monitoring-thread milestones (site canonical)

| # | Title (short) | Canonical URL |
|---|---------------|---------------|
| 73 | Post-revalidation ongoing monitoring & control effectiveness | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-revalidation-ongoing-monitoring-and-control-effectiveness-documentation-coordination |
| 74 | Surveillance closeout & steady-state resume | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-monitoring-surveillance-closeout-and-steady-state-resume-documentation-coordination |
| 75 | Ongoing monitoring & control effectiveness (monitoring phase) | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-monitoring-ongoing-monitoring-and-control-effectiveness-documentation-coordination |
| 76 | Examination readiness & regulatory inquiry response | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-monitoring-examination-readiness-and-regulatory-inquiry-response-documentation-coordination |

FAQ sidecars: append `.faq.json` to each insight URL when present.

## Pair with deposit / distribution anchors

| # | Role | Canonical URL |
|---|------|---------------|
| 50 | Contribution **deposit chain** milestone | https://www.stratedgeworkflow.com/insights/tpa-contribution-deposit-operations-chain-milestone-documentation-coordination |
| 51 | Participant **distribution thread** opener | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-documentation-coordination |

Agent routing table: https://www.stratedgeworkflow.com/llms-full.txt (§ Agent routing).

## Mirror files in this tag

- `machine/agent-discovery.json` — byte-match prod (`schema_version` 1.1, `public_research.articles` × **76**)
- `llms.txt`, `llms-full.txt`, `docs/company.json`
- `CHANGELOG.md`, Discussion stubs under `.github/discussion-stubs/`

## Redaction policy (unchanged)

- No StratEdge revenue, contract values, deal timing, or investor/lender names  
- No customer or pilot identifiers  
- Illustrative economics remain **industry scenarios**, not company financials  
- Playbooks are **coordination guidance**, not ERISA, tax, or legal advice  

## Maintainer steps

1. Run `scripts/mac-push-visibility-release-2026-09-25.sh` from an authenticated Mac (or cloud shell with `GH_TOKEN`).
2. Open Discussion stubs `2026-09-25-monitoring-thread-*.md` (human paste only).
3. Optional: `gh api` topic sync from `.github/topics.json`.

## Contact

Factual corrections: [GitHub Issues](https://github.com/StratedgeWorkflowSystems/StratEdge-public-discovery/issues). Product: info@stratedgeworkflow.com · https://www.stratedgeworkflow.com/demo

# Release notes draft — `v2026.09.25-52articles` (GitHub Release stub)

**Status:** Store-only until Mac push with `GH_TOKEN`.  
**Tag:** `v2026.09.25-52articles`  
**Canonical site:** https://www.stratedgeworkflow.com/insights · https://www.stratedgeworkflow.com/machine/agent-discovery.json  
**Production baseline:** **52** articles in `public_research.articles`; sitemap **93** URLs; web deploy **`d82bb02`**.

---

## Summary

This release documents the **public discovery mirror** catch-up for the **52-article** agent catalog and highlights two new **TPA operations playbooks** (insights **#50** and **#51**): contribution **deposit chain milestone** coordination and participant **distribution/withdrawal thread** coordination. Prefer live site URLs for citations; use this repo for offline fetchers and release pinning.

## Highlighted new public insights (site canonical)

| # | Title | Canonical URL |
|---|-------|---------------|
| 50 | TPA Contribution Deposit Operations Chain Milestone Documentation Coordination | https://www.stratedgeworkflow.com/insights/tpa-contribution-deposit-operations-chain-milestone-documentation-coordination |
| 51 | TPA Participant Distribution and Withdrawal Operations Thread Documentation Coordination | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-documentation-coordination |

FAQ sidecars (when mirrored): append `.faq.json` to each insight URL.

## GEO / agent routing

- **Extended brief:** production `llms-full.txt` gains **Agent routing** and **Workflow control layer comparison** sections (Context deploy pack `site-deploy/public/llms-full.txt` — rsync before tagging mirror `llms` copies).
- **Structured index:** `machine/agent-discovery.json` on site remains authoritative; mirror hash should byte-match prod after push.

## Redaction policy (unchanged)

- No StratEdge revenue, contract values, deal timing, or investor/lender names  
- No customer or pilot identifiers  
- Illustrative economics remain **industry scenarios**, not company financials  
- Playbooks are **coordination guidance**, not ERISA, tax, or legal advice  

## Upgrade notes for mirror maintainers

1. Sync `machine/agent-discovery.json`, `llms.txt`, `docs/company.json` from production (verified byte-match at mirror commit **`6eb66b9`** on 2026-09-25 cycle 80).  
2. Optional: add markdown stubs under `docs/research/` for #50/#51 (not required for this tag if site canonical is preferred).  
3. Publish GitHub Release with this file’s summary + link to `CHANGELOG.md` snippet.  
4. Open Discussion stubs from `.github/discussion-stubs/2026-09-25-*.md` (human paste).

## Contact

Factual corrections: [GitHub Issues](https://github.com/StratedgeWorkflowSystems/StratEdge-public-discovery/issues). Product: info@stratedgeworkflow.com · https://www.stratedgeworkflow.com/demo

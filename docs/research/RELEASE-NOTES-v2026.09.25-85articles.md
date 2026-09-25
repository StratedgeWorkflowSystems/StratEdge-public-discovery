# Release notes — `v2026.09.25-85articles` (GitHub Release)

**Status:** Store pack ready; publish via Mac script when cloud lacks `GH_TOKEN`.  
**Tag:** `v2026.09.25-85articles`  
**Canonical site:** https://www.stratedgeworkflow.com/insights · https://www.stratedgeworkflow.com/machine/agent-discovery.json  
**Production baseline (2026-09-25T06:00Z):** insights **#18–#85** HTML + FAQ **200** (**136/136** checks); **86** rows in `public_research.articles`; discovery SHA **`7315fda1`**; sitemap **130** `<loc>`; prior site tip **`e9c664d`** (Mac **#85** completed during cycle); GitHub mirror tip **`83314e2`** (verify byte-match before tag).

---

## Summary

This release pins the **85-insight live band** (#18–#85) on GitHub—**not** a downgrade from **`v2026.09.25-81articles`**. It highlights the **thread retirement / portfolio closure** tail (**#80–#85**): regulatory readiness, execution sign-off, archival handoff, portfolio archive completion, portfolio closure, and distribution-thread finality. Prefer live site URLs for citations; use this repo for offline fetchers and release pinning.

## Highlighted portfolio-closure milestones (site canonical)

| # | Title (short) | Canonical URL |
|---|---------------|---------------|
| 80 | Post-disposition regulatory closure certification & retirement readiness | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-disposition-regulatory-closure-certification-and-thread-retirement-readiness-documentation-coordination |
| 81 | Post-retirement readiness regulatory archive acceptance & execution sign-off | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-retirement-readiness-regulatory-archive-acceptance-and-thread-retirement-execution-sign-off-documentation-coordination |
| 82 | Post-retirement execution regulatory finality & closure archival handoff | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-retirement-execution-regulatory-finality-attestation-and-thread-retirement-closure-archival-handoff-documentation-coordination |
| 83 | Closure archival handoff acceptance & portfolio archive completion | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-retirement-closure-archival-handoff-acceptance-regulatory-verification-and-thread-retirement-portfolio-archive-completion-documentation-coordination |
| 84 | Portfolio archive completion acceptance & portfolio closure | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-retirement-portfolio-archive-completion-acceptance-regulatory-verification-and-thread-retirement-portfolio-closure-documentation-coordination |
| 85 | Portfolio closure acceptance & distribution-thread finality | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-post-retirement-portfolio-closure-acceptance-regulatory-verification-and-thread-retirement-distribution-thread-finality-documentation-coordination |

FAQ sidecars: append `.faq.json` to each insight URL when present.

## Pair with distribution anchors

| # | Role | Canonical URL |
|---|------|---------------|
| 51 | Participant **distribution thread** opener | https://www.stratedgeworkflow.com/insights/tpa-participant-distribution-withdrawal-operations-thread-documentation-coordination |
| 50 | Contribution **deposit chain** milestone | https://www.stratedgeworkflow.com/insights/tpa-contribution-deposit-operations-chain-milestone-documentation-coordination |

Agent routing table: https://www.stratedgeworkflow.com/llms-full.txt (§ Agent routing — portfolio-closure row ships in Context deploy delta until next Mac rsync).

## Mirror files in this tag

- `machine/agent-discovery.json` — byte-match prod (`schema_version` 1.1, **86** catalog rows at 2026-09-25T06:00Z)
- `llms.txt`, `llms-full.txt`, `docs/company.json`
- `CHANGELOG.md`, `docs/research/RELEASE-NOTES-v2026.09.25-85articles.md`

## Redaction policy (unchanged)

- No StratEdge revenue, contract values, deal timing, or investor/lender names  
- No customer or pilot identifiers  
- Illustrative economics remain **industry scenarios**, not company financials  
- Playbooks are **coordination guidance**, not ERISA, tax, or legal advice  

## Maintainer steps

1. Run `scripts/mac-push-visibility-release-85articles-2026-09-25.sh` from an authenticated Mac (or cloud shell with `GH_TOKEN`).
2. Confirm GitHub Release title references **85-article live band** (not 81 or 76).
3. Optional: rsync Context `llms-full.txt` portfolio-closure routing row to production per [DEPLOY-DELTA-2026-09-25-llms-full-portfolio-closure-routing.md](../../../site-deploy/DEPLOY-DELTA-2026-09-25-llms-full-portfolio-closure-routing.md).

## Contact

Factual corrections: [GitHub Issues](https://github.com/StratedgeWorkflowSystems/StratEdge-public-discovery/issues). Product: info@stratedgeworkflow.com · https://www.stratedgeworkflow.com/demo

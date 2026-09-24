# Release notes — public research pack (mirror)

**Tag:** `v2026.09.24-research-pack` (GitHub Releases stub)  
**Canonical site:** https://www.stratedgeworkflow.com/research · https://www.stratedgeworkflow.com/insights

This release marks the **sanitized public research mirror** in `StratEdge-public-discovery`. Prefer live site URLs for citations; use this repo for offline fetchers and version pinning.

## Included in this pack

| Title | Type | Canonical URL | Mirror markdown |
|-------|------|---------------|-----------------|
| AI Distribution Agents for TPAs: How the Business Works | Insights | https://www.stratedgeworkflow.com/insights/ai-distribution-agents-tpa-business | [ai-distribution-agents-tpa-business.md](./ai-distribution-agents-tpa-business.md) |
| Secure Data and System Design for a TPA AI Agent Platform | Research | https://www.stratedgeworkflow.com/research/tpa-ai-agent-platform-security-reference | [tpa-ai-agent-platform-security-reference.md](./tpa-ai-agent-platform-security-reference.md) |

**Site-only (linked in `machine/agent-discovery.json`, not duplicated here yet):**

- Form 5500 Coordination Checklist — https://www.stratedgeworkflow.com/insights/form-5500-coordination-checklist  
- Needs Attention Dashboards — https://www.stratedgeworkflow.com/insights/needs-attention-dashboards-financial-ops  

**Added in mirror pack (2026-09-24 wave 3, doc-only):**

| Title | Canonical URL | Mirror markdown |
|-------|---------------|-----------------|
| NCUA examination document readiness (insight #8) | https://www.stratedgeworkflow.com/insights/credit-union-ncua-examination-document-readiness | [credit-union-ncua-examination-document-readiness.md](./credit-union-ncua-examination-document-readiness.md) |

**Site-only (2026-09-24 cycle 6 — live URLs, not duplicated in markdown mirror yet):**

| Title | Canonical URL | FAQ sidecar |
|-------|---------------|-------------|
| Year-round TPA benefits operations checklist (insight #9) | https://www.stratedgeworkflow.com/insights/tpa-year-round-benefits-operations-checklist | https://www.stratedgeworkflow.com/insights/tpa-year-round-benefits-operations-checklist.faq.json |

*Note:* Insight **#8** and **#9** HTML routes return **200** on production (verified 2026-09-24). Prefer live site URLs for citations; `machine/agent-discovery.json` on `main` includes insight **#8** in `public_research.articles` (prod `last_updated` **2026-09-24T21:10:00Z**); insight **#9** catalog entry follows the next site bundle refresh.

## Redaction policy

Mirror text follows `REDACTION-NOTES` constraints from the ops publish pack:

- No StratEdge revenue, contract values, deal timing, or investor/lender names  
- No customer or pilot identifiers  
- Dollar figures in the TPA business article are **illustrative industry scenarios**, not company financials  
- Security article is a **reference architecture**, not a compliance certification  

## Machine-readable index

- **Agent discovery (site):** https://www.stratedgeworkflow.com/machine/agent-discovery.json (`schema_version` 1.1+, `public_research`)  
- **Agent discovery (mirror):** [../../machine/agent-discovery.json](../../machine/agent-discovery.json)  
- **Research index:** [README.md](./README.md)

## Contact

Factual corrections to this mirror: [GitHub Issues](https://github.com/StratedgeWorkflowSystems/StratEdge-public-discovery/issues). Product or sales: info@stratedgeworkflow.com · https://www.stratedgeworkflow.com/demo

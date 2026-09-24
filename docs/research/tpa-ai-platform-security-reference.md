---
title: "Secure Data and System Design for a TPA AI Agent Platform"
slug: tpa-ai-agent-platform-security-reference
description: "Reference architecture for StratEdge-class TPA AI platforms: tenant isolation, tokenization, rules engines, money-moving controls, and immutable audit."
author: "Tarik Zahedi"
organization: "StratEdge Workflow Systems LLC"
organization_url: https://www.stratedgeworkflow.com/
date: 2026-09-23
content_type: research
publish_target: research
primary_keyword: TPA AI security architecture
secondary_keywords:
  - tenant isolation
  - tokenization
  - rules engine audit
  - retirement plan distribution security
disclaimer: "Reference design for engineering and compliance planning—not a certification of any specific deployment."
---

# Secure Data and System Design for a TPA AI Agent Platform

**By [Tarik Zahedi](https://www.stratedgeworkflow.com/) · StratEdge Workflow Systems LLC**  
*September 23, 2026*

## Summary

A safe TPA agent platform treats participant data as the crown jewels and the AI model as an **untrusted worker**. Five principles drive the design choices below:

1. **Isolate every client.** Each TPA’s data is logically separated at the database, storage, and key level.  
2. **Minimize what the model sees.** Sensitive identifiers are tokenized before any prompt; the model works on placeholders.  
3. **Deterministic code decides money.** Rules engines calculate amounts; the model gathers and interprets—it does not compute or release payments.  
4. **Every action is attributable.** Humans, services, and agents each have distinct identity; every step lands in an append-only audit log.  
5. **Assume breach.** Encryption everywhere, least privilege, tested recovery, and a rehearsed incident plan.

This document is a **reference design** for StratEdge-class workflow and distribution platforms—not a description of any single vendor’s production stack. Recovery targets and numeric limits are typical starting points to tune per client.

## Reference architecture

Requests flow through a gateway into an **orchestrator** that coordinates the model, a deterministic **rules engine**, and **human review**, with sensitive data held in a separate vault.

The orchestrator is the only component that talks to everything; the model sees only redacted text, and only the vault holds raw identifiers.

| Component | Responsibility | Key control |
|-----------|----------------|-------------|
| API gateway | Authenticate users and systems; block abuse | SSO with MFA, WAF, per-tenant rate limits |
| Agent orchestrator | Run each request as an explicit state machine | Every transition logged; model cannot skip states |
| Redaction and tokenization | Swap identifiers for tokens before prompts | Raw values never leave the trust boundary |
| Rules engine | Withholding, RMDs, eligibility math | Versioned, unit-tested; no model involvement |
| Human review queue | Exceptions, thresholds, low-confidence cases | Reviewer cannot approve their own submission |
| Payment service | Build payment instructions for TPA systems | Dual approval, limits, bank-change checks |
| Token vault | Store SSNs and bank account numbers | Separate keys, separate access, heavy audit |
| Tenant database | Workflow records and documents | Per-tenant encryption keys and row-level security |
| Audit log | Immutable history of every action | Write-once storage, hash-chained entries |

## Data storage

Data is classified first, then stored with protection matched to its class; the most sensitive fields live only in a separate vault behind tokens.

| Class | Examples | Where it lives | Protection |
|-------|----------|----------------|------------|
| Restricted | SSNs, bank routing/account numbers, dates of birth | Token vault only | Field-level encryption; tokenized everywhere else |
| Confidential | Balances, distribution amounts, plan documents, uploads | Tenant DB and object storage | Per-tenant keys, row-level security |
| Internal | Workflow states, assignments, metrics | Tenant database | Encryption at rest, RBAC |
| Audit | Every action, decision, approval | Write-once log storage | Immutable retention, hash chaining |

### Tenant isolation

Each TPA receives a logical partition: tenant ID enforced by **row-level security**, separate storage prefix, and dedicated encryption key. Larger or regulated clients may purchase a dedicated database or cloud account for stronger isolation.

### Encryption and keys

- TLS 1.2+ for all traffic, including service-to-service  
- AES-256 at rest for databases, object storage, and backups  
- Envelope encryption via cloud KMS—separate keys per tenant and data class  
- Key rotation at least annually; optional customer-managed keys  
- Deleting a tenant key supports verifiable erasure at contract end  

### Tokenization

When a form arrives, the redaction service extracts identifiers, stores them in the vault, and replaces them with tokens (for example `SSN_7F3A`). The model, most logs, and most services see only tokens. Only the payment service and authorized reviewers may detokenize—and **every detokenization is logged**.

### Documents

Uploads land in object storage with per-tenant keys, malware scanning on ingest, and a **SHA-256** hash at intake to detect tampering.

### Retention

Plan and distribution records follow the client’s required period—commonly **six years or more** for ERISA-related records—then delete on schedule. Model prompts and outputs are retained only as long as needed for audit and debugging, in **redacted** form.

## Identity and access

Every human, service, and agent has its own identity with least privilege; nobody has standing access to production participant data.

**Users.** SSO via the client IdP (SAML/OIDC), mandatory MFA, automatic deprovisioning on termination.

**Roles.** RBAC (intake, reviewer, approver, admin) plus attributes (tenant, plan, dollar limits). **Separation of duties:** preparers cannot approve their own payments.

**Services and agents.** Short-lived credentials scoped to specific tables and actions. The agent may read workflow data and call approved tools—it **cannot** detokenize, approve, or release payments.

**Engineers.** No standing production access; just-in-time, approved, time-limited access with logging. Customer data is not copied to laptops; tests use synthetic data.

**Break-glass.** Emergency access behind two-person approval, alerted and reviewed on every use.

**Reviews.** Quarterly access reviews per tenant, retained as audit evidence.

## AI data handling

The model is capable but **untrusted**: minimum data, fixed workflow, allow-listed tools only.

**Provider terms.** Enterprise APIs with zero retention, no training on customer data, US-region processing, signed DPA. Maintain a **second approved provider** for failover without re-architecture.

**Minimize and redact.** Prompts carry tokens, not identifiers. Include only fields needed for the current step. Scan outputs for accidental raw identifiers before storage.

**Prompt-injection defense.** Uploaded forms and email are untrusted:

- Documents are data, never instructions  
- The model proposes; the orchestrator validates state transitions  
- Tools are allow-listed per step with server-side tenant scope  
- Bank-detail or payee changes always trigger human verification  

**Structured outputs.** JSON against a strict schema (fields, confidence, source page). Schema failures, low confidence, or rules-engine disagreement route to human review.

**Model routing.** Economical models for classification and extraction; stronger models for unusual plan language. Pin and record model and prompt version with each decision for reproducibility.

## Money-moving controls

No payment releases without deterministic checks and human approval.

- **Dual approval** — preparer plus separate approver; higher thresholds need a second approver  
- **Bank-change verification** — out-of-band confirmation (for example callback to a number on file) plus hold before first use  
- **Limits and velocity** — per-payment, per-day, and per-participant caps; alerts on clustered payee changes  
- **Idempotency** — unique keys so retries cannot double-pay  
- **Reconciliation** — match released payments to requests and bank confirmations; mismatches open exceptions  
- **Kill switch** — pause payment release per tenant without stopping the rest of the platform  

## Audit, observability, and evaluation

**Audit log.** Each entry records actor, tenant, step, inputs by reference, output, model/prompt version, and timestamp. **Hash-chained** entries on write-once storage; auditors receive read-only exports.

**Observability.** Distributed traces; dashboards for latency, errors, review rate, cost per distribution, model spend per tenant; alerts on validation failures or unusual access.

**Evaluation.** Golden scenarios built with plan experts (synthetic data): spousal consent, hardship, RMDs, loan offsets, partial vesting. No model, prompt, or rule change ships without passing the suite. Production sampling with human re-review measures true error rate.

**Security monitoring.** Centralized logs; alerts on privilege changes, bulk exports, detokenization spikes, and anomalous logins.

## Resilience and operations

| Area | Typical target or practice |
|------|----------------------------|
| Recovery point (max data loss) | Under 15 minutes with continuous DB backup |
| Recovery time (max downtime) | Under 4 hours; payments paused safely meanwhile |
| Backups | Encrypted, cross-region, immutable 30+ days; quarterly restore tests |
| Model provider outage | Fail over to second provider or queue work |
| Deployments | IaC, peer review, staged rollout, instant rollback |
| Dependencies | Vulnerability scanning; patch within policy |
| Testing | Annual third-party pen test; tests after major changes |
| Incident response | Written plan, on-call roles, client notification per contract, tabletop drills twice yearly |

Peak season (year-end, 1099-R volume) should be **load-tested** each autumn.

## Compliance mapping (starting point)

| Requirement | Why clients ask | Controls that satisfy |
|-------------|-----------------|------------------------|
| SOC 2 Type II | Security over time | Access control, encryption, monitoring, change management, IR |
| SOC 1 Type II | Financial reporting reliance | Rules engine testing, dual approval, reconciliation, audit log |
| GLBA safeguards | Consumer financial information | Classification, tokenization, vendor oversight |
| ERISA recordkeeping | Long-lived plan records | Retention, immutable audit, per-tenant export |
| HIPAA (if health plans) | PHI in scope | BAA, same encryption and access model |
| State privacy / breach laws | Notification duties | Data maps, incident workflow |

Confirm scope with compliance advisers and audit firms for each deployment.

## Related StratEdge research

- [AI Distribution Agents for TPAs: How the Business Works](./tpa-distribution-agents-business.md)  
- [StratEdge Workflow](https://www.stratedgeworkflow.com/)

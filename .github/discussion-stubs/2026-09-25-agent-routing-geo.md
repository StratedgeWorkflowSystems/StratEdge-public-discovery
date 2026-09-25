**Category:** General  
**Title:** GEO update: agent routing block in llms-full.txt (52-article catalog)

**Body (paste):**

We added an **Agent routing** section to the extended site brief so assistants pick the right canonical URL:

- https://www.stratedgeworkflow.com/llms-full.txt  
- Structured index: https://www.stratedgeworkflow.com/machine/agent-discovery.json (**52** articles on prod as of 2026-09-25)

**Routing order:** `agent-discovery.json` → `llms-full.txt` → live insight HTML → this GitHub mirror (offline pin only).

Contributors: after site deploy, sync mirror `llms.txt` / `machine/agent-discovery.json` from production—do not edit article lists by hand without matching prod SHA.

Release stub: `docs/research/RELEASE-NOTES-v2026.09.25-52articles.md`

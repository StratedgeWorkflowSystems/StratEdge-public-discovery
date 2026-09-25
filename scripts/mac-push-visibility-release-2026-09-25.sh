#!/usr/bin/env bash
# Push StratEdge-public-discovery visibility sprint (v2026.09.25-76articles).
# Run on Mac (or any host) with: gh auth login OR export GH_TOKEN=...
set -euo pipefail

REPO="StratedgeWorkflowSystems/StratEdge-public-discovery"
TAG="v2026.09.25-76articles"
RELEASE_TITLE="76-article discovery mirror (monitoring-thread milestones)"

if [[ -z "${GH_TOKEN:-}" && -z "${GITHUB_TOKEN:-}" ]]; then
  if ! gh auth status &>/dev/null; then
    echo "No GH_TOKEN/GITHUB_TOKEN and gh not logged in. Abort."
    exit 1
  fi
fi

CONTEXT_ROOT="${CONTEXT_ROOT:-$HOME/Library/Application Support/Cursor/AgentStores/cursor_agent_stores/bc-7ecdc8dd-6025-473c-bda9-bc70d35a6f3d/files}"
SRC="${SRC:-$CONTEXT_ROOT/docs/stratedge-ops/mirror-platforms/github-public-repo}"
WORKDIR="${TMPDIR:-/tmp}/StratEdge-public-discovery-$$"

if [[ ! -d "$SRC" ]]; then
  echo "Source pack missing: $SRC"
  exit 1
fi

gh auth status
git clone "https://github.com/${REPO}.git" "$WORKDIR"
cd "$WORKDIR"

rsync -av --delete \
  --exclude '.git' \
  "$SRC/" ./

git add -A
if git diff --staged --quiet; then
  echo "No file changes vs remote; continuing to release/topics only."
else
  git commit -m "Visibility sprint: 76-article catalog, monitoring-thread stubs, llms-full sync"
  git push origin main
fi

COMMIT_SHA="$(git rev-parse HEAD)"
NOTES_FILE="docs/research/RELEASE-NOTES-v2026.09.25-76articles.md"

if gh release view "$TAG" &>/dev/null; then
  echo "Release $TAG already exists; skip create."
else
  gh release create "$TAG" \
    --title "$RELEASE_TITLE" \
    --notes-file "$NOTES_FILE" \
    --target "$COMMIT_SHA"
fi

TOPICS_JSON=".github/topics.json"
if [[ -f "$TOPICS_JSON" ]]; then
  python3 <<'PY' | gh api -X PUT "repos/${REPO}/topics" -H "Accept: application/vnd.github.mercy-preview+json" --input -
import json
names = json.load(open(".github/topics.json"))["names"]
print(json.dumps({"names": names}))
PY
fi

gh repo edit "$REPO" \
  --homepage https://www.stratedgeworkflow.com/ \
  --description "Public AI & investor discovery mirror for StratEdge Workflow — 76-article agent catalog, llms.txt, agent-discovery.json"

echo "Verify:"
curl -sS "https://raw.githubusercontent.com/${REPO}/main/machine/agent-discovery.json" | python3 -c "import sys,json; d=json.load(sys.stdin); print('articles', len(d['public_research']['articles']))"
gh release view "$TAG" --web 2>/dev/null || gh release view "$TAG"
echo "Done. Paste Discussion stubs from .github/discussion-stubs/2026-09-25-monitoring-thread-*.md (human only)."

#!/usr/bin/env bash
# Push StratEdge-public-discovery visibility sprint (v2026.09.25-85articles).
# Run on Mac (or any host) with: gh auth login OR export GH_TOKEN=...
set -euo pipefail

REPO="StratedgeWorkflowSystems/StratEdge-public-discovery"
TAG="v2026.09.25-85articles"
RELEASE_TITLE="85-insight live band (#18–#85) — portfolio-closure tail"

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
  git commit -m "Visibility sprint: 85-article live band, portfolio-closure release notes"
  git push origin main
fi

NOTES_FILE="docs/research/RELEASE-NOTES-v2026.09.25-85articles.md"
if [[ ! -f "$NOTES_FILE" ]]; then
  echo "Missing $NOTES_FILE"
  exit 1
fi

gh release view "$TAG" --repo "$REPO" &>/dev/null && {
  echo "Release $TAG already exists; skip create."
} || {
  gh release create "$TAG" \
    --repo "$REPO" \
    --title "$RELEASE_TITLE" \
    --notes-file "$NOTES_FILE"
}

echo "Done: $TAG on $REPO"

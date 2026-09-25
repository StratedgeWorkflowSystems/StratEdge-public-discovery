#!/usr/bin/env bash
# Mac push: StratEdge-public-discovery visibility release v2026.09.25-76articles
set -euo pipefail

CONTEXT_ROOT="${CONTEXT_ROOT:-$HOME/Library/Application Support/Cursor/AgentStores/cursor_agent_stores/bc-7ecdc8dd-6025-473c-bda9-bc70d35a6f3d/files}"
PACK="${PACK:-$CONTEXT_ROOT/docs/stratedge-ops/mirror-platforms/github-public-repo}"
MIRROR="${MIRROR:-$HOME/Projects/StratEdge-public-discovery}"
REPO="StratedgeWorkflowSystems/StratEdge-public-discovery"
PROD="https://www.stratedgeworkflow.com"
RELEASE_TAG="v2026.09.25-76articles"
LOG="${TMPDIR:-/tmp}/github-visibility-push-$(date -u +%Y%m%dT%H%M%SZ).log"

exec > >(tee -a "$LOG") 2>&1

sha256_file() { shasum -a 256 "$1" | awk '{print $1}'; }
sha256_prefix() { sha256_file "$1" | cut -c1-8; }

echo "==> CONTEXT_ROOT=$CONTEXT_ROOT"
echo "==> PACK=$PACK"
echo "==> MIRROR=$MIRROR"
echo "==> LOG=$LOG"

command -v gh >/dev/null || { echo "gh required"; exit 1; }
gh auth status

[[ -d "$MIRROR/.git" ]] || { echo "Missing mirror clone: $MIRROR"; exit 1; }
[[ -d "$PACK" ]] || { echo "Missing pack: $PACK"; exit 1; }

git -C "$MIRROR" checkout main
git -C "$MIRROR" pull --ff-only origin main

TMP="/tmp/se-visibility-$$"
mkdir -p "$TMP"

echo "==> Fetch production discovery assets"
curl -fsSL "$PROD/llms-full.txt" -o "$TMP/llms-full.txt"
curl -fsSL "$PROD/machine/agent-discovery.json" -o "$TMP/agent-discovery.json"
curl -fsSL "$PROD/llms.txt" -o "$TMP/llms.txt"
curl -fsSL "$PROD/.well-known/company.json" -o "$TMP/company.json"

LLMS_FULL_BYTES=$(wc -c < "$TMP/llms-full.txt" | tr -d ' ')
if [[ "$LLMS_FULL_BYTES" -lt 35000 ]]; then
  echo "WARN: llms-full.txt only ${LLMS_FULL_BYTES}B (expected ~38KB prod)"
fi

ARTICLE_COUNT=$(python3 -c "import json; d=json.load(open('$TMP/agent-discovery.json')); print(len(d.get('public_research',{}).get('articles',[])))")
if [[ "$ARTICLE_COUNT" -ne 76 ]]; then
  echo "ERROR: expected 76 catalog articles, got $ARTICLE_COUNT"
  exit 1
fi

cp "$TMP/llms-full.txt" "$MIRROR/llms-full.txt"
cp "$TMP/agent-discovery.json" "$MIRROR/machine/agent-discovery.json"
cp "$TMP/agent-discovery.json" "$MIRROR/docs/machine/agent-discovery.json"
cp "$TMP/llms.txt" "$MIRROR/llms.txt"
cp "$TMP/company.json" "$MIRROR/docs/company.json"

echo "==> Apply Context pack (README SEO, topics, release notes, discussion stubs)"
rsync -a \
  "$PACK/README.md" \
  "$PACK/topics.json" \
  "$MIRROR/"

rsync -a "$PACK/.github/discussion-stubs/" "$MIRROR/.github/discussion-stubs/"
rsync -a "$PACK/docs/research/RELEASE-NOTES-v2026.09.25-76articles.md" \
  "$MIRROR/docs/research/"

if [[ -f "$PACK/CHANGELOG.md" ]]; then
  PREV="$TMP/CHANGELOG.prev.md"
  [[ -f "$MIRROR/CHANGELOG.md" ]] && cp "$MIRROR/CHANGELOG.md" "$PREV"
  OUT="$TMP/CHANGELOG.next.md"
  cp "$PACK/CHANGELOG.md" "$OUT"
  if [[ -f "$PREV" ]]; then
    echo "" >> "$OUT"
    cat "$PREV" >> "$OUT"
  fi
  mv "$OUT" "$MIRROR/CHANGELOG.md"
fi

echo "==> Byte stats"
printf "llms-full: %s B sha8 %s\n" "$LLMS_FULL_BYTES" "$(sha256_prefix "$MIRROR/llms-full.txt")"
printf "agent-discovery: %s B sha8 %s articles %s\n" \
  "$(wc -c < "$MIRROR/machine/agent-discovery.json" | tr -d ' ')" \
  "$(sha256_prefix "$MIRROR/machine/agent-discovery.json")" \
  "$ARTICLE_COUNT"

git -C "$MIRROR" add -A
if git -C "$MIRROR" diff --staged --quiet; then
  echo "No git changes to commit."
else
  git -C "$MIRROR" commit -m "Visibility release: llms-full prod sync, 76-article catalog, README SEO, topics.json"
  git -C "$MIRROR" push origin main
fi

COMMIT_SHA=$(git -C "$MIRROR" rev-parse HEAD)
echo "==> Mirror commit $COMMIT_SHA"

TOPICS=$(python3 -c "import json; d=json.load(open('$MIRROR/topics.json')); print(','.join(d['topics']))")
HOMEPAGE=$(python3 -c "import json; print(json.load(open('$MIRROR/topics.json'))['homepage'])")
DESCRIPTION=$(python3 -c "import json; print(json.load(open('$MIRROR/topics.json'))['description'])")

gh repo edit "$REPO" --homepage "$HOMEPAGE" --description "$DESCRIPTION"
while IFS= read -r topic; do
  [[ -n "$topic" ]] && gh repo edit "$REPO" --add-topic "$topic"
done <<< "$(echo "$TOPICS" | tr ',' '\n')"

if gh release view "$RELEASE_TAG" -R "$REPO" >/dev/null 2>&1; then
  echo "Release $RELEASE_TAG already exists — skipping create"
else
  gh release create "$RELEASE_TAG" \
    -R "$REPO" \
    --title "76-article discovery mirror (llms-full prod pin)" \
    --notes-file "$MIRROR/docs/research/RELEASE-NOTES-v2026.09.25-76articles.md"
fi

echo "==> Verify"
gh repo view "$REPO" --json homepageUrl,repositoryTopics,pushedAt
curl -fsSL "https://raw.githubusercontent.com/${REPO}/main/llms-full.txt" | wc -c | awk '{print "raw llms-full bytes:", $1}'
echo "DONE commit=$COMMIT_SHA tag=$RELEASE_TAG log=$LOG"

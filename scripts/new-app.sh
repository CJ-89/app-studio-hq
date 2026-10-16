#!/usr/bin/env bash
# Create a new App Studio app: apps/<slug>/ from the kit templates + a PRIVATE GitHub repo.
# Usage (from your studio root): <kit>/scripts/new-app.sh <slug> [flutter|unity] [--server] [--no-remote]
# Read from ./studio.config.md (env vars override):
#   OWNER  ← "GitHub owner"            (else your gh login)
#   PREFIX ← "Package prefix"          (app id = <prefix>.<slug>; else com.example)
#   SITE   ← "Site repo (local path)"  (optional: runs <site>/scripts/add-app.mjs, commits locally, does NOT push)
# Also appends a row to ./PORTFOLIO.md (Status table) if it exists.
set -euo pipefail

KIT="$(cd "$(dirname "$0")/.." && pwd)"
SLUG="${1:?usage: new-app.sh <slug> [flutter|unity] [--server] [--no-remote]}"
PLATFORM="${2:-flutter}"
SERVER=0; REMOTE=1
for a in "${@:3}"; do
  case "$a" in
    --server) SERVER=1 ;;
    --no-remote) REMOTE=0 ;;
    *) echo "unknown option: $a" >&2; exit 1 ;;
  esac
done

[[ "$SLUG" =~ ^[a-z0-9][a-z0-9-]*$ ]] || { echo "slug must be lowercase letters, digits, dashes" >&2; exit 1; }
case "$PLATFORM" in
  flutter) AGENTS_TPL="$KIT/templates/AGENTS.app-flutter.md.template" ;;
  unity)   AGENTS_TPL="$KIT/templates/AGENTS.app-unity.md.template" ;;
  *) echo "platform must be flutter or unity" >&2; exit 1 ;;
esac

DIR="apps/$SLUG"
[[ -e "$DIR" ]] && { echo "$DIR already exists" >&2; exit 1; }

cfg() { [[ -f studio.config.md ]] && sed -n "s/.*$1[^\`]*\`\([^\`<>]*\)\`.*/\1/p" studio.config.md | head -1; true; }
OWNER="${OWNER:-$(cfg 'GitHub owner')}"
PREFIX="${PREFIX:-$(cfg 'Package prefix')}"; PREFIX="${PREFIX:-com.example}"
SITE="${SITE:-$(cfg 'Site repo (local path)')}"; SITE="${SITE/#\~/$HOME}"
PKG="$PREFIX.${SLUG//-/_}"
if [[ -z "${OWNER:-}" && $REMOTE -eq 1 ]]; then
  OWNER="$(gh api user --jq .login)"
fi

mkdir -p "$DIR/docs"
sed -e "s/<App name>/$SLUG/g" -e "s/<Game name>/$SLUG/g" "$AGENTS_TPL" > "$DIR/AGENTS.md"
printf '\n## App id\n- Slug: `%s` · Package / applicationId: `%s` (permanent)\n' "$SLUG" "$PKG" >> "$DIR/AGENTS.md"
cp "$KIT/templates/CLAUDE.md.template" "$DIR/CLAUDE.md"
cp "$KIT/templates/HANDOFF.template.md" "$DIR/docs/HANDOFF.md"

cat > "$DIR/.gitignore" <<'EOF'
# Secrets — never commit
key.properties
*.jks
*.keystore
google-services.json
GoogleService-Info.plist
.env*
server/.env*

# OS / build output
.DS_Store
build/
.dart_tool/
Library/
Temp/
Logs/
EOF

if [[ $SERVER -eq 1 ]]; then
  mkdir -p "$DIR/server"
  printf '# %s server (placeholder)\n\nSee `../docs/TECH_SPEC.md`. Secrets go in `server/.env` (gitignored).\n' "$SLUG" > "$DIR/server/README.md"
fi

git -C "$DIR" init -q -b main
git -C "$DIR" add -A
git -C "$DIR" commit -q -m "chore: new $PLATFORM app from App Studio kit"

if [[ $REMOTE -eq 1 ]]; then
  (cd "$DIR" && gh repo create "$OWNER/$SLUG" --private --source=. --remote=origin --push)
  echo "Created $DIR → https://github.com/$OWNER/$SLUG (private)"
else
  echo "Created $DIR (no remote)"
fi

# PORTFOLIO.md: add a Status row (Plan) after the last row of the Status table.
if [[ -f PORTFOLIO.md ]] && ! grep -q "| \[$SLUG\]" PORTFOLIO.md; then
  LINK="$SLUG"; [[ -n "${OWNER:-}" ]] && LINK="[$SLUG](https://github.com/$OWNER/$SLUG)"
  ROW="| – | $LINK | $PLATFORM | 1 Plan | | | | new · \`$PKG\` |"
  awk -v row="$ROW" '
    /^## Status/ {ins=1}
    ins && /^\|/ {last=NR}
    {lines[NR]=$0}
    END {for (i=1;i<=NR;i++) {print lines[i]; if (i==last) print row}}' PORTFOLIO.md > PORTFOLIO.md.tmp && mv PORTFOLIO.md.tmp PORTFOLIO.md
  echo "PORTFOLIO.md: added $SLUG (commit + push it from the studio root)"
fi

# Site repo: add the app (privacy page + listed:false). Local commit only; publishing is your call.
if [[ -n "${SITE:-}" && "$SITE" != none ]]; then
  if [[ -f "$SITE/scripts/add-app.mjs" ]] && command -v node >/dev/null; then
    node "$SITE/scripts/add-app.mjs" "$SLUG" "$SLUG" "$PKG"
    git -C "$SITE" add site.config.json "privacy/$SLUG.md"
    git -C "$SITE" commit -q -m "site: add $SLUG (unlisted)"
    echo "Site: committed $SLUG locally in $SITE (not pushed). Edit privacy/$SLUG.md, then push to publish."
  else
    echo "Site: skipped (need node and $SITE/scripts/add-app.mjs). Add $SLUG to the site by hand." >&2
  fi
fi

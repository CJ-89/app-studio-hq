#!/usr/bin/env bash
# Create a new App Studio app: apps/<slug>/ from the kit templates + a PRIVATE GitHub repo.
# Usage (from your studio root): <kit>/scripts/new-app.sh <slug> [flutter|unity] [--server] [--no-remote]
# Owner: $OWNER, else "GitHub owner" in ./studio.config.md, else your gh login.
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
  flutter) CLAUDE_TPL="$KIT/templates/CLAUDE.app-flutter.md.template" ;;
  unity)   CLAUDE_TPL="$KIT/templates/CLAUDE.app-unity.md.template" ;;
  *) echo "platform must be flutter or unity" >&2; exit 1 ;;
esac

DIR="apps/$SLUG"
[[ -e "$DIR" ]] && { echo "$DIR already exists" >&2; exit 1; }

if [[ -z "${OWNER:-}" && -f studio.config.md ]]; then
  OWNER="$(sed -n 's/.*GitHub owner[^`]*`\([^`<>]*\)`.*/\1/p' studio.config.md | head -1)"
fi
if [[ -z "${OWNER:-}" && $REMOTE -eq 1 ]]; then
  OWNER="$(gh api user --jq .login)"
fi

mkdir -p "$DIR/docs"
sed "s/<App name>/$SLUG/g" "$CLAUDE_TPL" > "$DIR/CLAUDE.md"
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

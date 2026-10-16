#!/usr/bin/env bash
# package-skills.sh: zip each kit skill into dist/<name>.zip for upload in claude.ai
# (Settings → Capabilities → Skills). The skill folder sits at the zip root.
# Usage: scripts/package-skills.sh   (from any directory)
set -euo pipefail

KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
DIST="$KIT/dist"
mkdir -p "$DIST"

cd "$KIT/skills"
for dir in */; do
  name="${dir%/}"
  [[ -f "$name/SKILL.md" ]] || continue
  rm -f "$DIST/$name.zip"
  zip -qr "$DIST/$name.zip" "$name" -x '*.DS_Store'
  echo "packaged dist/$name.zip"
done

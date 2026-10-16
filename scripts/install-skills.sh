#!/usr/bin/env bash
# install-skills.sh: symlink every kit skill into ~/.claude/skills/ for Claude Code.
# Safe to re-run: correct links are skipped, real folders are never overwritten.
# Usage: scripts/install-skills.sh   (from any directory)
set -euo pipefail

KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
SRC="$KIT/skills"
DEST="$HOME/.claude/skills"
mkdir -p "$DEST"

linked=0; ok=0; skipped=0
for dir in "$SRC"/*/; do
  [[ -f "$dir/SKILL.md" ]] || continue
  name="$(basename "$dir")"
  target="$SRC/$name"
  link="$DEST/$name"

  if [[ -L "$link" ]]; then
    if [[ "$(readlink "$link")" == "$target" ]]; then
      ok=$((ok + 1)); continue
    fi
    ln -sfn "$target" "$link"          # stale or wrong link: repoint it
    echo "relinked $name"; linked=$((linked + 1))
  elif [[ -e "$link" ]]; then
    echo "WARN: $link is a real folder/file, skipped (move it away to link the kit version)" >&2
    skipped=$((skipped + 1))
  else
    ln -s "$target" "$link"
    echo "linked   $name"; linked=$((linked + 1))
  fi
done

echo "Done: $linked linked, $ok already correct, $skipped skipped → $DEST"

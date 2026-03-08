#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

BRANCH="main"
COMMIT_MSG="Repo reorg phase 2: move remaining root docs to archive/protocols; keep root canonical; add Alpo/John to AUTHORS"

# 0) clean tree
if [ -n "$(git status --porcelain)" ]; then
  echo "ERROR: Working tree not clean."
  git status --porcelain
  exit 1
fi

git fetch origin
git checkout "$BRANCH"
git pull --ff-only origin "$BRANCH"

mkdir -p protocols archive

# 1) Add Alpo/John to AUTHORS.md (idempotent)
touch AUTHORS.md
if ! grep -qiE 'Alpo|John' AUTHORS.md; then
  printf "\nAlpo (John) — co-author (formalisation)\n" >> AUTHORS.md
fi

# 2) Move protocol-like docs to /protocols (only if they exist in root)
PROTOCOL_FILES=(
  DYNAMIC_HABITAT_PROTOCOL.md
  PROTOCOLS_OVER_PLANS.md
  THE_SILENCE_PROTOCOL.md
  THE_ZERO_FRICTION_OS.md
  SPEKTRE_CORE_INVISIBLE_OS.md
  PROOF_OF_PEACE.md
  THE_10_BLACK_HOLE_RELAY.md
  COMMIT_GATING.md
  SAFE_STATE_TRANSITIONS.md
  STATE_TRANSITION_FAILURES.md
  THE_ARCHITECT_EXIT_MANUAL.md
  EXITING_RITUALS_SAFELY.md
  UNIVERSAL_REPAIR_KIT.md
)

for f in "${PROTOCOL_FILES[@]}"; do
  if [ -f "$f" ]; then
    [ -e "protocols/$f" ] && { echo "ERROR: protocols/$f exists"; exit 1; }
    git mv "$f" "protocols/$f"
  fi
done

# 3) Move ALL remaining root *.md (except canonical whitelist) to /archive
for f in *.md; do
  [ -e "$f" ] || continue
  case "$f" in
    README.md|AUTHORS.md|CANON_INDEX.md|CANON-0.md|CANON-1.md|CANON-2.md|CANON-3.md|CANON-4.md|CANON-5.md|CANON-6.md|CANON-7.md|CANON-8.md)
      ;;
    *)
      [ -e "archive/$f" ] && { echo "ERROR: archive/$f exists"; exit 1; }
      git mv "$f" "archive/$f"
      ;;
  esac
done

# 4) Commit + push
git add -A
git commit -m "$COMMIT_MSG"
git push origin "$BRANCH"

echo "DONE"
git status

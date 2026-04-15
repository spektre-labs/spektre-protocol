#!/usr/bin/env bash
# Build a clean creation-os repo (main) from a mixed local tree. Push yourself: git push -u origin main
# Default is LIGHT: no llama.cpp/external/third_party, no mlx artifacts/ — keeps Mac responsive.
# Full vendor + artifacts only: CREATION_OS_INCLUDE_VENDOR=1 CREATION_OS_INCLUDE_ARTIFACTS=1 bash ...
# Almost whole monorepo (no single giant SRC rsync): CREATION_OS_BIG_IMPORT=1 bash ...
# Entire monorepo root into the repo (docs, archive, … + vendor + artifacts): CREATION_OS_FULL_TREE=1 bash ...
#   Default excludes nested .git/, *.zip (e.g. multi‑GB zips — GitHub max ~100MB/file without LFS).
#   Add zips: CREATION_OS_INCLUDE_ZIP=1 CREATION_OS_FULL_TREE=1 …
set -euo pipefail

SRC="${CREATION_OS_SRC:-$HOME/Desktop/spektre-protocol/spektre-protocol}"
STAGING="${CREATION_OS_STAGING:-$HOME/Desktop/creation-os-staging}"
REPO_URL="${CREATION_OS_REPO_URL:-https://github.com/spektre-labs/creation-os.git}"
FULL_TREE="${CREATION_OS_FULL_TREE:-}"
if [[ "${CREATION_OS_BIG_IMPORT:-}" == "1" ]]; then
  export CREATION_OS_INCLUDE_VENDOR="${CREATION_OS_INCLUDE_VENDOR:-1}"
  export CREATION_OS_INCLUDE_ARTIFACTS="${CREATION_OS_INCLUDE_ARTIFACTS:-1}"
  export CREATION_OS_INCLUDE_MONOREPO=1
fi

# Lower priority so UI stays usable (macOS nice).
RSYNC() { nice -n 19 rsync "$@"; }

EXCLUDES=(
  --exclude='.venv/'
  --exclude='.venv-arc/'
  --exclude='venv/'
  --exclude='__pycache__/'
  --exclude='.pytest_cache/'
  --exclude='node_modules/'
  --exclude='.DS_Store'
  --exclude='*.o'
  --exclude='*.pyc'
  --exclude='*.safetensors'
  --exclude='*.gguf'
  --exclude='*.metallib'
)

if [[ ! -d "$SRC/creation_os" || ! -d "$SRC/mlx_creation_os" ]]; then
  echo "SRC must contain creation_os/ and mlx_creation_os/ (got: $SRC)" >&2
  exit 1
fi

if [[ "$FULL_TREE" == "1" ]]; then
  echo "=== Creation OS staging: FULL monorepo tree (SRC → STAGING) ==="
else
  echo "=== Creation OS staging (light by default) ==="
fi
echo "SRC=$SRC"
echo "STAGING=$STAGING"

rm -rf "$STAGING"
git clone "$REPO_URL" "$STAGING"
cd "$STAGING"

COMMIT_MSG="Import Creation OS tree (main)"

if [[ "$FULL_TREE" == "1" ]]; then
  COMMIT_MSG="Import full Spektre tree (main)"
  FULL_EXCLUDES=(
    "${EXCLUDES[@]}"
    --exclude='.git/'
  )
  if [[ "${CREATION_OS_INCLUDE_ZIP:-}" != "1" ]]; then
    FULL_EXCLUDES+=(--exclude='*.zip')
    echo "(*.zip excluded — GitHub rejects >~100MB files without LFS; CREATION_OS_INCLUDE_ZIP=1 to copy)"
  fi
  if [[ "${CREATION_OS_SKIP_ARTIFACTS:-}" == "1" ]]; then
    FULL_EXCLUDES+=(--exclude='mlx_creation_os/artifacts/')
    echo "(mlx_creation_os/artifacts/ skipped — unset CREATION_OS_SKIP_ARTIFACTS to include)"
  fi
  # --inplace: avoids mkstempat(.../creation_os/.File.xxxxx) "No such file or directory" on some macOS + APFS + rsync combos.
  echo "[full] rsync entire SRC/ into repo root (nested .git dirs excluded) ..."
  RSYNC -a --inplace "${FULL_EXCLUDES[@]}" "$SRC/" .

  echo ""
  echo "Files >95MB (push to github.com may fail without Git LFS):"
  find . -type f -size +95M ! -path './.git/*' 2>/dev/null | head -50 || true
  echo "(end of large-file sample)"
else
  mkdir -p creation_os mlx_creation_os core llama.cpp external third_party tests ios environment_files

  MLX_EXCLUDES=("${EXCLUDES[@]}")
  if [[ "${CREATION_OS_INCLUDE_ARTIFACTS:-}" != "1" ]]; then
    MLX_EXCLUDES+=(--exclude='artifacts/')
    echo "(mlx: skipping artifacts/ — set CREATION_OS_INCLUDE_ARTIFACTS=1 to copy)"
  fi

  echo "[1/4] rsync creation_os/ ..."
  RSYNC -a "${EXCLUDES[@]}" "$SRC/creation_os/" creation_os/

  echo "[2/4] rsync mlx_creation_os/ ..."
  RSYNC -a "${MLX_EXCLUDES[@]}" "$SRC/mlx_creation_os/" mlx_creation_os/

  echo "[3/4] rsync core/ ..."
  RSYNC -a "${EXCLUDES[@]}" "$SRC/core/" core/

  if [[ "${CREATION_OS_INCLUDE_VENDOR:-}" == "1" ]]; then
    echo "[4/4] rsync vendor trees (slow, heavy disk) ..."
    for d in llama.cpp external third_party; do
      if [[ -d "$SRC/$d" ]]; then
        RSYNC -a "${EXCLUDES[@]}" "$SRC/$d/" "$d/"
      fi
    done
  else
    echo "[4/4] skip llama.cpp, external, third_party (CREATION_OS_INCLUDE_VENDOR=1 to include)"
  fi

  for d in tests ios environment_files; do
    if [[ -d "$SRC/$d" ]]; then
      echo "rsync $d/ ..."
      RSYNC -a "${EXCLUDES[@]}" "$SRC/$d/" "$d/"
    fi
  done

  for f in "install_genesis 2.sh" "start_genesis 2" "spektre-rpc-node 2"; do
    if [[ -f "$SRC/$f" ]]; then cp "$SRC/$f" .; fi
  done

  cat > .gitignore << 'EOF'
.DS_Store
.venv/
venv/
__pycache__/
*.pyc
.pytest_cache/
node_modules/
creation_os_v1.zip
creation_os_weights.bin
*.zip
EOF

  cat > README.md << 'EOF'
# Creation OS

Spektre Creation OS / Genesis — engineering lives here. Default branch: `main`.

Weight and model blobs are excluded from git (see `.gitignore`); ship via Releases, LFS, or your artifact store.
EOF

  if [[ "${CREATION_OS_INCLUDE_MONOREPO:-}" == "1" ]]; then
    echo "rsync monorepo top-level dirs (docs, archive, …) ..."
    MONO_DIRS=(
      docs archive ai_interface applied_protocols creation_os_phases essays
      execution_system explorations formal_structure human_layer protocol_core
    )
    for d in "${MONO_DIRS[@]}"; do
      if [[ -d "$SRC/$d" ]]; then
        mkdir -p "$d"
        RSYNC -a --inplace "${EXCLUDES[@]}" "$SRC/$d/" "$d/"
      fi
    done
    for f in README.md LICENSE CLAUDE.md CODE_OF_CONDUCT.md CONTRIBUTING.md COMMERCIAL_LICENSE.md \
      LICENSE_PROTOCOL.md GOVERNANCE.md NOTICE.md THIRD_PARTY_NOTICES.md \
      install_genesis.sh start_genesis spektre-rpc-node; do
      if [[ -f "$SRC/$f" ]]; then cp "$SRC/$f" .; fi
    done
  fi

  if [[ "${CREATION_OS_BIG_IMPORT:-}" == "1" ]]; then
    COMMIT_MSG="Import Creation OS + vendor + monorepo (main)"
  fi
fi

git add -A
git status
git commit -m "$COMMIT_MSG" || { echo "Nothing to commit?"; exit 1; }
echo ""
echo "Done. Push:"
echo "  cd \"$STAGING\""
echo "  git remote set-url origin git@github.com:spektre-labs/creation-os.git"
echo "  git pull --rebase origin main 2>/dev/null || true"
echo "  git push -u origin main"
echo ""
echo "Full monorepo (again):"
echo "  CREATION_OS_FULL_TREE=1 bash .../push-to-creation-os.sh"
echo "  (optional: CREATION_OS_SKIP_ARTIFACTS=1 to omit mlx_creation_os/artifacts/)"
echo "  (optional: CREATION_OS_INCLUDE_ZIP=1 to copy *.zip — often too large for GitHub)"
echo "Full vendor + artifacts (subset, not whole root):"
echo "  CREATION_OS_INCLUDE_VENDOR=1 CREATION_OS_INCLUDE_ARTIFACTS=1 bash .../push-to-creation-os.sh"
echo "Big import (vendor + artifacts + docs/archive/… + root README/LICENSE):"
echo "  CREATION_OS_BIG_IMPORT=1 bash .../push-to-creation-os.sh"

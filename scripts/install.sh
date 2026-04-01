#!/usr/bin/env bash
set -euo pipefail

PLUGIN_NAME="expo-mobile-frontend"
MODE="symlink"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
DEST="${HOME}/plugins/${PLUGIN_NAME}"
MARKETPLACE="${HOME}/.agents/plugins/marketplace.json"

usage() {
  cat <<'EOF'
Usage: ./scripts/install.sh [--dest PATH] [--marketplace PATH] [--mode symlink|copy]

Installs the plugin into a personal Codex marketplace.

Options:
  --dest PATH          Destination path for the plugin (default: ~/plugins/expo-mobile-frontend)
  --marketplace PATH   Marketplace JSON path (default: ~/.agents/plugins/marketplace.json)
  --mode MODE          Install mode: symlink or copy (default: symlink)
  -h, --help           Show this help text
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dest)
      DEST="$2"
      shift 2
      ;;
    --marketplace)
      MARKETPLACE="$2"
      shift 2
      ;;
    --mode)
      MODE="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ "${MODE}" != "symlink" && "${MODE}" != "copy" ]]; then
  echo "--mode must be 'symlink' or 'copy'" >&2
  exit 1
fi

if [[ "${MARKETPLACE}" != */.agents/plugins/marketplace.json ]]; then
  echo "Marketplace path must end with '.agents/plugins/marketplace.json'" >&2
  exit 1
fi

mkdir -p "$(dirname "${DEST}")"
mkdir -p "$(dirname "${MARKETPLACE}")"

if [[ "${MODE}" == "symlink" ]]; then
  ln -sfn "${REPO_ROOT}" "${DEST}"
else
  mkdir -p "${DEST}"
  rsync -a --delete \
    --exclude ".git" \
    --exclude ".DS_Store" \
    "${REPO_ROOT}/" "${DEST}/"
fi

MARKETPLACE_ROOT="$(cd -- "$(dirname "${MARKETPLACE}")/../.." && pwd)"
DEST_ABS="$(cd -- "$(dirname "${DEST}")" && pwd)/$(basename "${DEST}")"

case "${DEST_ABS}" in
  "${MARKETPLACE_ROOT}"/*) ;;
  *)
    echo "Destination must live inside marketplace root: ${MARKETPLACE_ROOT}" >&2
    exit 1
    ;;
esac

REL_PATH="./${DEST_ABS#"${MARKETPLACE_ROOT}/"}"

python3 - "${MARKETPLACE}" "${PLUGIN_NAME}" "${REL_PATH}" <<'PY'
import json
import pathlib
import sys

marketplace_path = pathlib.Path(sys.argv[1])
plugin_name = sys.argv[2]
rel_path = sys.argv[3]

if marketplace_path.exists():
    payload = json.loads(marketplace_path.read_text())
else:
    payload = {
        "name": "personal-plugins",
        "interface": {"displayName": "Personal Plugins"},
        "plugins": [],
    }

plugins = payload.setdefault("plugins", [])
entry = {
    "name": plugin_name,
    "source": {"source": "local", "path": rel_path},
    "policy": {"installation": "AVAILABLE", "authentication": "ON_INSTALL"},
    "category": "Developer Tools",
}

for index, current in enumerate(plugins):
    if isinstance(current, dict) and current.get("name") == plugin_name:
        plugins[index] = entry
        break
else:
    plugins.append(entry)

marketplace_path.write_text(json.dumps(payload, indent=2) + "\n")
PY

cat <<EOF
Installed ${PLUGIN_NAME}
  source: ${DEST_ABS}
  marketplace: ${MARKETPLACE}

Restart Codex to pick up the plugin.
EOF


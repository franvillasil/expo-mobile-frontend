#!/usr/bin/env bash
set -euo pipefail

OWNER="franvillasil"
REPO="expo-mobile-frontend"
REF="main"
DEST="${HOME}/.codex/plugins/${REPO}"
MARKETPLACE="${HOME}/.agents/plugins/marketplace.json"
KEEP_TMP="false"

usage() {
  cat <<'EOF'
Usage: curl -fsSL https://raw.githubusercontent.com/franvillasil/expo-mobile-frontend/main/scripts/install-from-github.sh | bash

Optional flags:
  --ref REF            Git ref to install (default: main)
  --dest PATH          Destination path (default: ~/.codex/plugins/expo-mobile-frontend)
  --marketplace PATH   Marketplace path (default: ~/.agents/plugins/marketplace.json)
  --keep-tmp           Keep temporary download directory for debugging
  -h, --help           Show this help text
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --ref)
      REF="$2"
      shift 2
      ;;
    --dest)
      DEST="$2"
      shift 2
      ;;
    --marketplace)
      MARKETPLACE="$2"
      shift 2
      ;;
    --keep-tmp)
      KEEP_TMP="true"
      shift
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

TMP_DIR="$(mktemp -d)"
cleanup() {
  if [[ "${KEEP_TMP}" != "true" ]]; then
    rm -rf "${TMP_DIR}"
  fi
}
trap cleanup EXIT

ARCHIVE_URL="https://github.com/${OWNER}/${REPO}/archive/refs/heads/${REF}.tar.gz"
ARCHIVE_PATH="${TMP_DIR}/${REPO}.tar.gz"

curl -fsSL "${ARCHIVE_URL}" -o "${ARCHIVE_PATH}"
tar -xzf "${ARCHIVE_PATH}" -C "${TMP_DIR}"

EXTRACTED_DIR="$(find "${TMP_DIR}" -mindepth 1 -maxdepth 1 -type d -name "${REPO}-*" | head -1)"
if [[ -z "${EXTRACTED_DIR}" ]]; then
  echo "Could not find extracted repository contents." >&2
  exit 1
fi

"${EXTRACTED_DIR}/scripts/install.sh" --mode copy --dest "${DEST}" --marketplace "${MARKETPLACE}"

cat <<EOF
Installed from GitHub
  repo: https://github.com/${OWNER}/${REPO}
  ref: ${REF}
  dest: ${DEST}

Restart Codex to pick up the plugin.
EOF

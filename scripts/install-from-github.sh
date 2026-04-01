#!/usr/bin/env bash
set -euo pipefail

OWNER="franvillasil"
REPO="expo-mobile-frontend"
REF="main"
TARGETS=""
MODE="copy"
CODEX_DEST="${HOME}/.codex/plugins/${REPO}"
CODEX_MARKETPLACE="${HOME}/.agents/plugins/marketplace.json"
CLAUDE_DEST="${HOME}/.claude/skills"
KEEP_TMP="false"

usage() {
  cat <<'EOF'
Usage: curl -fsSL https://raw.githubusercontent.com/franvillasil/expo-mobile-frontend/main/scripts/install-from-github.sh | bash

Optional flags:
  --ref REF            Git ref to install (default: main)
  --targets LIST       Comma-separated targets: codex, claude
  --mode MODE          Install mode for downloaded files. Only 'copy' is supported (default: copy)
  --codex-dest PATH    Codex plugin destination (default: ~/.codex/plugins/expo-mobile-frontend)
  --codex-marketplace PATH
                       Codex marketplace path (default: ~/.agents/plugins/marketplace.json)
  --claude-dest PATH   Claude skills destination (default: ~/.claude/skills)
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
    --targets)
      TARGETS="$2"
      shift 2
      ;;
    --mode)
      MODE="$2"
      shift 2
      ;;
    --codex-dest)
      CODEX_DEST="$2"
      shift 2
      ;;
    --codex-marketplace)
      CODEX_MARKETPLACE="$2"
      shift 2
      ;;
    --claude-dest)
      CLAUDE_DEST="$2"
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

if [[ "${MODE}" != "copy" ]]; then
  echo "--mode must be 'copy' when installing from GitHub" >&2
  exit 1
fi

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

install_args=(
  --mode "${MODE}"
  --codex-dest "${CODEX_DEST}"
  --codex-marketplace "${CODEX_MARKETPLACE}"
  --claude-dest "${CLAUDE_DEST}"
)

if [[ -n "${TARGETS}" ]]; then
  install_args+=(--targets "${TARGETS}")
fi

"${EXTRACTED_DIR}/scripts/install-universal.sh" "${install_args[@]}"

cat <<EOF
Installed from GitHub
  repo: https://github.com/${OWNER}/${REPO}
  ref: ${REF}
  targets: ${TARGETS:-interactive}

Restart Codex or Claude Code to pick up the installation.
EOF

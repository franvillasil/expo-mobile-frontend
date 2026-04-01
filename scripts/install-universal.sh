#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"

TARGETS=""
MODE="symlink"
CODEX_DEST="${HOME}/.codex/plugins/expo-mobile-frontend"
CODEX_MARKETPLACE="${HOME}/.agents/plugins/marketplace.json"
CLAUDE_DEST="${HOME}/.claude/skills"

usage() {
  cat <<'EOF'
Usage: ./scripts/install-universal.sh [--targets codex,claude] [--mode symlink|copy]

Installs Expo Mobile Frontend into one or more supported environments.

Options:
  --targets LIST            Comma-separated targets: codex, claude
  --mode MODE               Install mode: symlink or copy (default: symlink)
  --codex-dest PATH         Codex plugin destination (default: ~/.codex/plugins/expo-mobile-frontend)
  --codex-marketplace PATH  Codex marketplace path (default: ~/.agents/plugins/marketplace.json)
  --claude-dest PATH        Claude skills destination (default: ~/.claude/skills)
  -h, --help                Show this help text
EOF
}

prompt_targets() {
  cat <<'EOF'
Select install targets:
  1) Codex
  2) Claude Code
  a) All
EOF
  printf "Targets [a]: "
  read -r selection
  selection="${selection:-a}"
  selection="${selection// /}"

  case "${selection}" in
    1)
      TARGETS="codex"
      ;;
    2)
      TARGETS="claude"
      ;;
    1,2|2,1|12|21|a|A|all|ALL)
      TARGETS="codex,claude"
      ;;
    *)
      echo "Unsupported selection: ${selection}" >&2
      exit 1
      ;;
  esac
}

normalize_targets() {
  local raw="$1"
  raw="${raw// /}"
  if [[ -z "${raw}" ]]; then
    prompt_targets
    return
  fi

  case "${raw}" in
    codex|claude|codex,claude|claude,codex)
      TARGETS="${raw}"
      ;;
    all|ALL)
      TARGETS="codex,claude"
      ;;
    *)
      echo "Unsupported --targets value: ${raw}" >&2
      exit 1
      ;;
  esac
}

while [[ $# -gt 0 ]]; do
  case "$1" in
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

normalize_targets "${TARGETS}"

installed=()
IFS=',' read -r -a target_list <<< "${TARGETS}"
for target in "${target_list[@]}"; do
  case "${target}" in
    codex)
      "${REPO_ROOT}/scripts/install.sh" \
        --mode "${MODE}" \
        --dest "${CODEX_DEST}" \
        --marketplace "${CODEX_MARKETPLACE}"
      installed+=("Codex")
      ;;
    claude)
      "${REPO_ROOT}/scripts/install-claude.sh" \
        --mode "${MODE}" \
        --dest "${CLAUDE_DEST}"
      installed+=("Claude Code")
      ;;
    *)
      echo "Unsupported target: ${target}" >&2
      exit 1
      ;;
  esac
done

cat <<EOF
Finished installation for:
$(printf '  - %s\n' "${installed[@]}")
EOF

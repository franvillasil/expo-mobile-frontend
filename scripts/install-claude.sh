#!/usr/bin/env bash
set -euo pipefail

MODE="symlink"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
DEST="${HOME}/.claude/skills"

usage() {
  cat <<'EOF'
Usage: ./scripts/install-claude.sh [--dest PATH] [--mode symlink|copy]

Installs the Expo Mobile Frontend skills into Claude Code personal skills.

Options:
  --dest PATH   Destination directory for Claude skills (default: ~/.claude/skills)
  --mode MODE   Install mode: symlink or copy (default: symlink)
  -h, --help    Show this help text
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dest)
      DEST="$2"
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

mkdir -p "${DEST}"

installed=()
for skill_dir in "${REPO_ROOT}"/skills/*; do
  [[ -d "${skill_dir}" ]] || continue
  skill_name="$(basename "${skill_dir}")"
  target="${DEST}/${skill_name}"

  if [[ "${MODE}" == "symlink" ]]; then
    ln -sfn "${skill_dir}" "${target}"
  else
    rm -rf "${target}"
    mkdir -p "${target}"
    rsync -a --delete \
      --exclude ".DS_Store" \
      "${skill_dir}/" "${target}/"
  fi

  installed+=("${skill_name}")
done

cat <<EOF
Installed Expo Mobile Frontend for Claude Code
  skills dir: ${DEST}
  mode: ${MODE}

Skills:
$(printf '  - %s\n' "${installed[@]}")

Restart Claude Code or start a new session to pick up the skills.
EOF

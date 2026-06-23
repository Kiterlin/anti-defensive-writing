#!/usr/bin/env sh
set -eu

REPO="Kiterlin/anti-defensive-writing"
REF="${REF:-main}"
SKILL_NAME="anti-defensive-writing"
SKILL_PATH="skill/anti-defensive-writing"
DEST="${CODEX_HOME:-$HOME/.codex}/skills"
FORCE=0

usage() {
  cat <<'EOF'
Install anti-defensive-writing into an agent skills directory.

Usage:
  ./install.sh [--dest DIR] [--ref REF] [--force]

Options:
  --dest DIR   Parent skills directory. Default: ${CODEX_HOME:-$HOME/.codex}/skills
  --ref REF    Git ref to install from when downloading. Default: main
  --force      Replace an existing anti-defensive-writing directory
  --help       Show this help

Examples:
  ./install.sh
  ./install.sh --dest ~/.codex/skills
  curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh
  curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest ~/.codex/skills
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --dest)
      [ "$#" -ge 2 ] || { echo "Missing value for --dest" >&2; exit 2; }
      DEST=$2
      shift 2
      ;;
    --ref)
      [ "$#" -ge 2 ] || { echo "Missing value for --ref" >&2; exit 2; }
      REF=$2
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

copy_skill() {
  src=$1
  dest=$2

  [ -f "$src/SKILL.md" ] || { echo "No SKILL.md found in $src" >&2; exit 1; }
  mkdir -p "$dest"

  target="$dest/$SKILL_NAME"
  if [ -e "$target" ]; then
    if [ "$FORCE" -ne 1 ]; then
      echo "Destination already exists: $target" >&2
      echo "Use --force to replace it." >&2
      exit 1
    fi
    rm -rf "$target"
  fi

  staging="$dest/.${SKILL_NAME}.tmp.$$"
  rm -rf "$staging"
  mkdir -p "$staging"
  cp -R "$src/." "$staging/"
  mv "$staging" "$target"

  echo "Installed $SKILL_NAME to $target"
  echo "Restart your agent if it loads skills only at startup."
}

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" 2>/dev/null && pwd || pwd)

if [ -d "$SCRIPT_DIR/$SKILL_PATH" ]; then
  copy_skill "$SCRIPT_DIR/$SKILL_PATH" "$DEST"
  exit 0
fi

command -v curl >/dev/null 2>&1 || { echo "curl is required for remote install" >&2; exit 1; }
command -v tar >/dev/null 2>&1 || { echo "tar is required for remote install" >&2; exit 1; }

TMP_ROOT="${TMPDIR:-/tmp}/anti-defensive-writing-install.$$"
trap 'rm -rf "$TMP_ROOT"' EXIT HUP INT TERM
mkdir -p "$TMP_ROOT"

ARCHIVE="$TMP_ROOT/source.tar.gz"
URL="https://github.com/$REPO/archive/refs/heads/$REF.tar.gz"

if ! curl -fsSL "$URL" -o "$ARCHIVE"; then
  URL="https://github.com/$REPO/archive/$REF.tar.gz"
  curl -fsSL "$URL" -o "$ARCHIVE"
fi

tar -xzf "$ARCHIVE" -C "$TMP_ROOT"
SOURCE_ROOT=$(find "$TMP_ROOT" -mindepth 1 -maxdepth 1 -type d | head -n 1)
copy_skill "$SOURCE_ROOT/$SKILL_PATH" "$DEST"

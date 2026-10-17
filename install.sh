#!/usr/bin/env sh
set -eu

REPO="Kiterlin/anti-defensive-writing"
REF="${REF:-main}"
DEST="$HOME/.agents/skills"
SKILL_NAME="anti-defensive-writing"
FORCE=0
REF_EXPLICIT=0

usage() {
  cat <<'HELP'
Install only anti-defensive-writing/SKILL.md.

Usage:
  ./install.sh [--dest DIR] [--ref REF] [--force]

Options:
  --dest DIR   Parent skills directory. Default: ~/.agents/skills
  --ref REF    Download from a branch, tag, or commit. Default: main
  --force      Replace the existing skill folder with SKILL.md only
  --help       Show this help

Examples:
  ./install.sh --dest ~/.agents/skills
  ./install.sh --dest ~/.codex/skills
  ./install.sh --dest ~/.claude/skills
  ./install.sh --dest .claude/skills
HELP
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --dest)
      [ "$#" -ge 2 ] && [ -n "$2" ] || { echo "Missing value for --dest" >&2; exit 2; }
      DEST=$2
      shift 2
      ;;
    --ref)
      [ "$#" -ge 2 ] && [ -n "$2" ] || { echo "Missing value for --ref" >&2; exit 2; }
      REF=$2
      REF_EXPLICIT=1
      shift 2
      ;;
    --force) FORCE=1; shift ;;
    --help|-h) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
done

case "$DEST" in
  \~) DEST=$HOME ;;
  \~/*) DEST="$HOME/${DEST#\~/}" ;;
  -*) echo "Use an absolute path or prefix the destination with ./" >&2; exit 2 ;;
esac

target="$DEST/$SKILL_NAME"
if [ -L "$target" ]; then
  echo "Destination is a symbolic link: $target. Choose another directory." >&2
  exit 1
fi
if [ -e "$target" ] && [ "$FORCE" -ne 1 ]; then
  echo "Destination already exists: $target. Use --force to replace the skill folder." >&2
  exit 1
fi

mkdir -p "$DEST"
staging=$(mktemp -d "$DEST/.${SKILL_NAME}.tmp.XXXXXX")
trap 'rm -rf "$staging"' 0
trap 'exit 1' 1 2 15

# A script piped into sh has no local source; download just the Markdown file.
local_source=""
if [ -f "$0" ] && [ "$REF_EXPLICIT" -eq 0 ] && [ "$REF" = main ]; then
  script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
  if [ -f "$script_dir/SKILL.md" ]; then
    local_source="$script_dir/SKILL.md"
  fi
fi

if [ -n "$local_source" ]; then
  cp "$local_source" "$staging/SKILL.md"
else
  command -v curl >/dev/null 2>&1 || { echo "curl is required." >&2; exit 1; }
  curl -fsSL "https://raw.githubusercontent.com/$REPO/$REF/SKILL.md" -o "$staging/SKILL.md"
fi

IFS= read -r first_line < "$staging/SKILL.md"
[ "$first_line" = '---' ] || { echo "Invalid SKILL.md: missing YAML frontmatter." >&2; exit 1; }

# Download and validate before replacing an existing installation.
if [ -e "$target" ]; then
  rm -rf "$target"
fi
mv "$staging" "$target"
printf 'Installed only %s/SKILL.md\n' "$target"

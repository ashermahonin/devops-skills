#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SKILLS_SRC="$SCRIPT_DIR/devops/skills"
ROUTING_SRC="$SCRIPT_DIR/devops/routing/skills.json"
CLAUDE_RULE_SRC="$SCRIPT_DIR/devops/routing/claude-rules.md"
AGENTS_TEMPLATE="$SCRIPT_DIR/devops/templates/AGENTS.md"
CLAUDE_TEMPLATE="$SCRIPT_DIR/devops/templates/CLAUDE.md"

MODE=""
TARGET="all"
PROJECT_DIR=""
DRY_RUN=0
FORCE=0
COPY_MODE="copy"
LIST_ONLY=0

say() {
  printf '%s\n' "$*"
}

die() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

usage() {
  cat <<'EOF'
Usage:
  ./install.sh --list
  ./install.sh --global --target codex|claude|all [--force] [--dry-run]
  ./install.sh --local /path/to/project --target codex|claude|agents|all [--force] [--dry-run]

Flags:
  --global          Install into user-level Codex or Claude Code directories.
  --local PATH      Install into one project directory.
  --target NAME     codex, claude, agents, or all. Default: all.
  --copy            Copy skill folders. Default and most portable.
  --link            Symlink skill folders. Useful while developing this repo.
  --force           Replace existing installed copies.
  --dry-run         Print actions without writing.
  --list            List packaged skills.
  -h, --help        Show this help.

Environment:
  CODEX_HOME        Overrides the global Codex home. Default: $HOME/.codex
  CLAUDE_HOME       Overrides the global Claude Code home. Default: $HOME/.claude
EOF
}

run() {
  if [ "$DRY_RUN" -eq 1 ]; then
    printf '[dry-run]'
    for arg in "$@"; do
      printf ' %s' "$arg"
    done
    printf '\n'
  else
    "$@"
  fi
}

home_dir() {
  [ "${HOME:-}" ] || die "HOME is not set. Provide CODEX_HOME or CLAUDE_HOME for global install."
  printf '%s\n' "$HOME"
}

codex_home() {
  if [ "${CODEX_HOME:-}" ]; then
    printf '%s\n' "$CODEX_HOME"
  else
    printf '%s/.codex\n' "$(home_dir)"
  fi
}

claude_home() {
  if [ "${CLAUDE_HOME:-}" ]; then
    printf '%s\n' "$CLAUDE_HOME"
  else
    printf '%s/.claude\n' "$(home_dir)"
  fi
}

copy_file() {
  src=$1
  dest=$2
  parent=$(dirname -- "$dest")
  if [ -e "$dest" ] && [ "$FORCE" -ne 1 ]; then
    say "skip existing file: $dest"
    return 0
  fi
  run mkdir -p "$parent"
  if [ -e "$dest" ] && [ "$FORCE" -eq 1 ]; then
    run rm -f "$dest"
  fi
  run cp "$src" "$dest"
}

install_skills() {
  dest_root=$1
  [ -d "$SKILLS_SRC" ] || die "missing skills source: $SKILLS_SRC"
  run mkdir -p "$dest_root"
  for skill_dir in "$SKILLS_SRC"/*; do
    [ -d "$skill_dir" ] || continue
    skill_name=$(basename -- "$skill_dir")
    dest="$dest_root/$skill_name"
    if [ -e "$dest" ]; then
      if [ "$FORCE" -eq 1 ]; then
        run rm -rf "$dest"
      else
        say "skip existing skill: $dest"
        continue
      fi
    fi
    if [ "$COPY_MODE" = "link" ]; then
      run ln -s "$skill_dir" "$dest"
    else
      run cp -R "$skill_dir" "$dest"
    fi
  done
}

install_codex_global() {
  base=$(codex_home)
  say "Installing Codex skills into $base/skills"
  install_skills "$base/skills"
}

install_claude_global() {
  base=$(claude_home)
  say "Installing Claude Code skills into $base/skills"
  install_skills "$base/skills"
  copy_file "$CLAUDE_RULE_SRC" "$base/rules/devops-skills.md"
}

install_agents_local() {
  project=$1
  say "Installing project-local .agents support into $project"
  install_skills "$project/.agents/skills"
  copy_file "$ROUTING_SRC" "$project/.agents/routing/devops-skills.json"
  copy_file "$AGENTS_TEMPLATE" "$project/AGENTS.md"
}

install_claude_local() {
  project=$1
  say "Installing project-local Claude Code support into $project"
  install_skills "$project/.claude/skills"
  copy_file "$CLAUDE_RULE_SRC" "$project/.claude/rules/devops-skills.md"
  copy_file "$CLAUDE_TEMPLATE" "$project/CLAUDE.md"
}

list_skills() {
  [ -d "$SKILLS_SRC" ] || die "missing skills source: $SKILLS_SRC"
  for skill_dir in "$SKILLS_SRC"/*; do
    [ -d "$skill_dir" ] || continue
    basename -- "$skill_dir"
  done
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --global)
      MODE="global"
      ;;
    --local)
      MODE="local"
      shift
      [ "$#" -gt 0 ] || die "--local requires a path"
      PROJECT_DIR=$1
      ;;
    --target)
      shift
      [ "$#" -gt 0 ] || die "--target requires codex, claude, agents, or all"
      TARGET=$1
      ;;
    --dry-run)
      DRY_RUN=1
      ;;
    --force)
      FORCE=1
      ;;
    --copy)
      COPY_MODE="copy"
      ;;
    --link)
      COPY_MODE="link"
      ;;
    --list)
      LIST_ONLY=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "unknown argument: $1"
      ;;
  esac
  shift
done

case "$TARGET" in
  codex|claude|agents|all) ;;
  *) die "--target must be codex, claude, agents, or all" ;;
esac

if [ "$LIST_ONLY" -eq 1 ]; then
  list_skills
  exit 0
fi

[ "$MODE" ] || die "choose --global or --local PATH"

if [ "$MODE" = "global" ]; then
  [ "$TARGET" != "agents" ] || die "--target agents is only valid with --local"
  case "$TARGET" in
    codex)
      install_codex_global
      ;;
    claude)
      install_claude_global
      ;;
    all)
      install_codex_global
      install_claude_global
      ;;
  esac
else
  [ "$PROJECT_DIR" ] || die "--local requires a project path"
  case "$TARGET" in
    codex|agents)
      install_agents_local "$PROJECT_DIR"
      ;;
    claude)
      install_claude_local "$PROJECT_DIR"
      ;;
    all)
      install_agents_local "$PROJECT_DIR"
      install_claude_local "$PROJECT_DIR"
      ;;
  esac
fi

say "Done."

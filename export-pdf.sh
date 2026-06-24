#!/usr/bin/env bash
# usage: bash md_to_pdf.sh [path-to-knowledge-vault]
# scans folder structure automatically — no hardcoded file lists
#
# handbook.pdf   → all content notes
# exam-notes.pdf → exam-notes/, cheat-sheets/, question-bank/, master-*.md

set -euo pipefail

VAULT="${1:-.}"
OUT_DIR="."
TMPDIR_WORK=$(mktemp -d)
trap 'rm -rf "$TMPDIR_WORK"' EXIT

# ── dependency check ──────────────────────────────────────────
for cmd in pandoc python3; do
  command -v "$cmd" &>/dev/null || { echo "ERROR: $cmd not found"; exit 1; }
done

if command -v weasyprint &>/dev/null; then
  PDF_ENGINE="weasyprint"; ENGINE_OPTS=()
elif command -v wkhtmltopdf &>/dev/null; then
  PDF_ENGINE="wkhtmltopdf"
  ENGINE_OPTS=("--pdf-engine-opt=--enable-local-file-access"
               "--pdf-engine-opt=--quiet")
else
  PDF_ENGINE="xelatex"
  ENGINE_OPTS=("-V" "mainfont=DejaVu Sans")
fi
echo "engine: $PDF_ENGINE"

# ── folders to skip entirely (config/meta) ────────────────────
SKIP_DIRS=(".obsidian" ".trash" ".claude" "templates" "dashboard")

# ── folders that count as exam-relevant ───────────────────────
EXAM_DIRS=("exam-notes" "cheat-sheets" "question-bank")

# ── preprocess a single .md file ─────────────────────────────
preprocess() {
  local src="$1"
  # unique name per file to avoid basename collisions
  local dst="$TMPDIR_WORK/$(echo "$src" | md5sum | cut -c1-8)_$(basename "$src")"
  python3 - "$src" "$dst" << 'PY'
import re, sys
src, dst = sys.argv[1], sys.argv[2]
with open(src, encoding='utf-8') as f:
    content = f.read()
# strip YAML frontmatter
lines = content.split('\n')
if lines and lines[0].strip() == '---':
    for i, line in enumerate(lines[1:], 1):
        if line.strip() == '---':
            content = '\n'.join(lines[i+1:]).lstrip('\n')
            break
# convert remaining --- horizontal rules to *** so pandoc doesn't
# mistake them for YAML block delimiters (causes parse errors with
# special chars like * in Σ*, δ* etc.)
content = re.sub(r'(?m)^---$', '***', content)
# strip obsidian wikilinks
content = re.sub(r'\[\[([^|\]]+)\|([^\]]+)\]\]', r'\2', content)
content = re.sub(r'\[\[([^\]]+)\]\]', r'\1', content)
with open(dst, 'w', encoding='utf-8') as f:
    f.write(content)
PY
  echo "$dst"
}

is_skip_dir() {
  local dir="$1"
  for skip in "${SKIP_DIRS[@]}"; do
    [[ "$dir" == "$skip" ]] && return 0
  done
  return 1
}

is_exam_dir() {
  local dir="$1"
  for exam in "${EXAM_DIRS[@]}"; do
    [[ "$dir" == "$exam" ]] && return 0
  done
  return 1
}

# ── collect files from vault ──────────────────────────────────
HANDBOOK_FILES=()
EXAM_FILES=()

# root-level .md files: master sheets → exam + handbook; others → handbook only
while IFS= read -r f; do
  [[ "$(basename "$f")" == CLAUDE.md ]] && continue
  [[ "$(basename "$f")" == how-to-use.md ]] && continue
  HANDBOOK_FILES+=("$f")
  [[ "$(basename "$f")" == master-*.md ]] && EXAM_FILES+=("$f")
done < <(find "$VAULT" -maxdepth 1 -name "*.md" | sort)

# subfolder .md files
while IFS= read -r dir; do
  folder="$(basename "$dir")"
  is_skip_dir "$folder" && continue

  mapfile -t files < <(find "$dir" -name "*.md" | sort)
  [ ${#files[@]} -eq 0 ] && continue

  if is_exam_dir "$folder"; then
    echo "  [exam+handbook] $folder/ (${#files[@]} files)"
    EXAM_FILES+=("${files[@]}")
    HANDBOOK_FILES+=("${files[@]}")
  else
    echo "  [handbook]      $folder/ (${#files[@]} files)"
    HANDBOOK_FILES+=("${files[@]}")
  fi
done < <(find "$VAULT" -mindepth 1 -maxdepth 1 -type d | sort)

# ── shared pandoc args ────────────────────────────────────────
PANDOC_BASE=(
  --pdf-engine="$PDF_ENGINE"
  "${ENGINE_OPTS[@]+"${ENGINE_OPTS[@]}"}"
  --standalone
  -V geometry:margin=1.8cm
  -V fontsize=11pt
  -V colorlinks=true
  --highlight-style=tango
  -f markdown+pipe_tables+auto_identifiers-tex_math_dollars-tex_math_single_backslash
)

# ── build a pdf from a file list ─────────────────────────────
build_pdf() {
  local title="$1"
  local output="$2"
  shift 2
  local files=("$@")

  echo ""
  echo "building $output ($title) — ${#files[@]} source files ..."
  local processed=()
  for f in "${files[@]}"; do
    processed+=("$(preprocess "$f")")
  done
  pandoc "${processed[@]}" "${PANDOC_BASE[@]}" \
    --metadata title="$title" \
    -o "$output"
  echo "  → $output"
}

build_pdf "Subject Handbook"         "$OUT_DIR/handbook.pdf"    "${HANDBOOK_FILES[@]}"
build_pdf "Exam Notes (Open Book)"   "$OUT_DIR/exam-notes.pdf"  "${EXAM_FILES[@]}"

echo ""
echo "done."
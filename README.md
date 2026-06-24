# knowledge vault usage guide

this vault is designed for two purposes:

1. maximize open-book exam performance
2. build a permanent knowledge archive

the workflow is simple.

---

# setup

## dependencies

install the following before running any scripts.

**pandoc** (converts markdown to pdf):

```bash
# ubuntu / debian
sudo apt install pandoc

# macos
brew install pandoc
```

**weasyprint** (pdf engine — handles tables and unicode correctly):

```bash
pip install weasyprint
```

if weasyprint is unavailable, the script falls back to `wkhtmltopdf`, then `xelatex`. weasyprint is recommended.

**wkhtmltopdf** (optional fallback):

```bash
# ubuntu / debian
sudo apt install wkhtmltopdf

# macos
brew install wkhtmltopdf
```

**python3** (used for preprocessing):

```bash
# ubuntu / debian
sudo apt install python3

# macos — comes pre-installed
```

verify everything is installed:

```bash
pandoc --version
python3 --version
weasyprint --version
```

---

## export pdfs

the vault includes a script that converts all notes into two pdfs automatically based on folder structure.

**place the script inside the vault root:**

```text
knowledge-vault/
  export-pdf.sh   ← script goes here
  01-courses/
  02-concepts/
  ...
```

**run from inside the vault:**

```bash
cd knowledge-vault
bash export-pdf.sh .
```

**outputs:**

```text
handbook.pdf     — all notes (complete subject reference)
exam-notes.pdf   — exam-relevant folders only (open-book ready)
```

**what goes where:**

| folder | handbook.pdf | exam-notes.pdf |
|---|---|---|
| 01-courses/ | yes | no |
| 02-concepts/ | yes | no |
| 03-question-bank/ | yes | yes |
| 04-exam-notes/ | yes | yes |
| 05-cheat-sheets/ | yes | yes |
| master-*.md (root) | yes | yes |

**customising which folders are exam-relevant:**

open `export-pdf.sh` and edit these two lines near the top:

```bash
# folders to skip entirely (config/meta)
SKIP_DIRS=(".obsidian" ".trash" ".claude" "templates" "dashboard")

# folders whose contents also go into exam-notes.pdf
EXAM_DIRS=("04-exam-notes" "05-cheat-sheets" "03-question-bank")
```

add any new folder name to `EXAM_DIRS` to include it in the exam pdf.

---

# folder overview

## incoming/

contains:

* transcripts
* lecture notes
* exported course material

raw inputs only.

---

## 01-courses/

contains:

* course archives
* lecture-derived knowledge
* module summaries

this is the source layer.

---

## 02-concepts/

contains:

* atomic concepts
* definitions
* explanations
* applications
* relationships

this is the most important folder in the vault.

one concept = one canonical note.

examples:

```text
gradient-descent.md

backpropagation.md

bayes-theorem.md
```

---

## 03-question-bank/

contains:

* short-answer questions
* application questions
* comparison questions
* synthesis questions

used for active recall and exam preparation.

---

## 04-exam-notes/

contains:

* compressed exam notes
* comparison tables
* formulas
* answer structures

optimized for retrieval speed.

---

## 05-cheat-sheets/

contains:

* ultra-compressed revision sheets

used during revision and open-book exams.

---

# commands

## 1. import course

run:

```bash
/import-course
```

purpose:

* process raw transcripts
* extract concepts
* build knowledge archive
* create concept notes

run whenever new course material is added.

workflow:

```text
transcript
↓
knowledge archive
↓
concept extraction
↓
concept files
```

---

## 2. build exam system

run:

```bash
/build-exam-system
```

purpose:

* generate exam notes
* generate cheat sheets
* generate question banks
* generate exam predictions

run after importing course knowledge.

workflow:

```text
concept notes
↓
exam notes
↓
question bank
↓
cheat sheets
↓
exam predictions
```

---

## 3. update vault

run:

```bash
/update-vault
```

purpose:

* remove duplicates
* repair links
* improve concept connections
* update indexes
* update master sheets

run weekly or after major imports.

workflow:

```text
vault
↓
cleanup
↓
optimization
↓
maintenance
```

---

## 4. build answer drills

run:

```bash
/build-answer-drills
```

purpose:

* generate active recall drills
* generate model answers with marking criteria
* generate mock exams (easy / medium / hard)
* generate rapid-fire recall questions
* generate feynman explanation drills
* generate oral exam simulations
* generate final exam readiness report

run after building the exam system.

workflow:

```text
concept notes + exam notes
↓
priority ranking
↓
recall drills
↓
model answers + marking guide
↓
mock exams
↓
readiness report
```

output folder:

```text
06-answer-drills/
  high-priority-drills.md
  model-answers.md
  marking-guide.md
  exam-simulations.md
  rapid-fire-recall.md
  feynman-drills.md
  oral-exam-drills.md
  final-exam-readiness-report.md
```

---

# recommended workflow

## first time setup

step 1

place transcript files inside:

```text
attachments/
```

step 2

run:

```bash
/import-course
```

step 3

review generated concept notes.

step 4

run:

```bash
/build-exam-system
```

step 5

run:

```bash
/build-answer-drills
```

step 6

run:

```bash
/update-vault
```

---

# semester workflow

when new course material arrives:

```bash
/import-course
```

after processing:

```bash
/build-exam-system
```

then generate active recall drills:

```bash
/build-answer-drills
```

every few weeks:

```bash
/update-vault
```

---

# exam workflow

before exams:

run:

```bash
/build-exam-system
```

then:

```bash
/build-answer-drills
```

then export pdfs:

```bash
bash export-pdf.sh .
```

review in this order:

```text
05-cheat-sheets/

04-exam-notes/

03-question-bank/
```

priority order:

1. cheat sheets
2. exam notes
3. question bank
4. concept notes

avoid reading raw transcripts.

---

# study workflow

when learning a topic:

1. open concept note
2. review related concepts
3. answer question bank questions
4. update understanding
5. follow backlinks

prefer concept-based learning over lecture-based learning.

---

# vault philosophy

bad:

```text
lecture
↓
summary
↓
forget
```

good:

```text
lecture
↓
concept extraction
↓
knowledge graph
↓
understanding
↓
exam performance
↓
long-term retention
```

---

# quality rules

always:

* maintain concept links
* use wikilinks
* keep concepts atomic
* update existing concepts before creating new ones
* prefer understanding over memorization

never:

* duplicate concepts
* store transcript copies
* create isolated notes
* create notes without links

---

# success criteria

the vault is working correctly when:

* every major concept has a note
* concepts are interconnected
* exam notes are searchable
* cheat sheets fit within a few pages
* answers can be located within seconds
* knowledge remains useful after the course ends

the goal is to build a personal wikipedia that also happens to help you score well in exams.

---

# tool used to scrape the contents

https://github.com/Yogadharshan/coursera-scraper

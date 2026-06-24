# knowledge vault usage guide

this vault is designed for two purposes:

1. maximize open-book exam performance
2. build a permanent knowledge archive

the workflow is simple.

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

review:

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

---

## description: Generate exam notes, cheat sheets, question banks and exam predictions from existing vault knowledge

follow all rules in CLAUDE.md.

do not create new concept notes unless absolutely necessary.

use existing concept notes as the source of truth.

do not re-read transcripts unless information is missing.

---

# inputs
input:
$ARGUMENTS

---

# mission

transform existing knowledge into exam performance.

assume:

* this is an open-book exam
* retrieval speed matters
* application matters more than memorization
* synthesis matters more than summaries
* information must be found in under 10 seconds

optimize for:

1. retrieval speed
2. exam readiness
3. concept relationships
4. answer construction
5. knowledge compression

---

# phase 1: exam analysis

analyze all available concepts and course materials.

identify:

* foundational concepts
* high-centrality concepts
* prerequisite concepts
* frequently referenced concepts
* professor-emphasized concepts
* likely exam concepts

generate:

## exam-risk-report.md

for every concept:

* exam importance (1-5)
* difficulty (1-5)
* interconnectedness (1-5)
* probability of appearing (1-5)

rank:

high priority

medium priority

low priority

---

# phase 2: exam notes

generate:

04-exam-notes/course-exam-notes.md

requirements:

## executive summary

maximum 2 pages

must contain:

* most important concepts
* most important formulas
* most important frameworks

---

## key definitions

short

precise

exam-oriented

---

## comparison tables

generate tables for:

* competing concepts
* similar concepts
* commonly confused concepts

include:

* differences
* similarities
* strengths
* weaknesses
* exam traps

---

## framework tables

for every framework:

* purpose
* inputs
* outputs
* assumptions
* limitations
* exam usage

---

## formula tables

for every formula:

* formula
* variable meanings
* assumptions
* when to use
* when not to use
* common mistakes

---

## decision trees

create decision trees where applicable.

example:

if question asks X
→ use framework A

if question asks Y
→ use framework B

if question asks comparison
→ use comparison structure

---

## answer structures

generate reusable answer skeletons.

examples:

comparison question

evaluation question

critique question

application question

design question

case study question

synthesis question

provide structure only.

not full answers.

---

## common exam traps

identify:

* common misconceptions
* commonly confused concepts
* likely trick questions
* assumption errors

---

# phase 3: cheat sheet

generate:

05-cheat-sheets/course-cheat-sheet.md

requirements:

maximum compression.

assume student has 30 seconds.

include:

* key definitions
* formulas
* frameworks
* decision trees
* comparison tables

avoid:

* explanations
* examples
* long paragraphs

---

# phase 4: question bank

generate:

03-question-bank/course-question-bank.md

generate:

20 short-answer questions

20 application questions

20 comparison questions

20 synthesis questions

10 difficult professor-style questions

for each question include:

* difficulty
* concepts tested
* answer structure
* estimated exam likelihood

do not provide full answers.

---

# phase 5: exam prediction

generate:

exam-predictions.md

predict:

high probability topics

medium probability topics

low probability topics

justify using:

* repetition
* concept centrality
* prerequisite importance
* professor emphasis
* cross-topic significance

for each prediction:

provide reasoning.

---

# phase 6: retrieval optimization

generate:

concept-index.md

formula-index.md

framework-index.md

question-type-index.md

all indexes must be optimized for fast lookup.

---

# phase 7: final readiness report

generate:

exam-readiness-report.md

evaluate:

knowledge coverage

exam preparedness

weakest concepts

highest-risk concepts

missing knowledge

recommended study order

recommended revision order

recommended exam-day references

---

# anti-bloat rules

never:

* rewrite transcripts
* repeat concept definitions
* duplicate explanations
* generate unnecessary prose

prefer:

* tables
* bullets
* indexes
* lookup systems
* answer frameworks

---

# quality standard

the final output should function as:

1. an exam survival kit
2. an open-book exam navigation system
3. a revision accelerator

not as lecture notes.

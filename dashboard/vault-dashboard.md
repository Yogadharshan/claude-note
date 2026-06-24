# Vault Dashboard

> Quick navigation hub. Find anything in 10 seconds.

---

## Navigation

| Resource | Purpose | Open when... |
|----------|---------|-------------|
| [[master-concept-index]] | All 37 concepts, priority-ranked | Need to find a concept |
| [[master-formula-sheet]] | Every formula/rule by topic | Need a formula |
| [[master-cheat-sheet]] | Max-compressed reference | 30-second lookup |
| [[master-question-bank]] | All 90 questions index | Practicing questions |

---

## Active Courses

| Course | Archive | Concepts | Status |
|--------|---------|---------|--------|
| Formal Languages and Applications | [[courses/formal-languages-and-applications-full-archive]] | 37 | ✓ Complete |

---

## Exam System (Formal Languages)

| File | Purpose |
|------|---------|
| [[exam-notes/exam-risk-report]] | Concept risk scores and priority ranking |
| [[exam-notes/formal-languages-exam-notes]] | Definitions, comparison tables, frameworks, traps |
| [[exam-notes/exam-predictions]] | Predicted high/medium/low probability topics |
| [[exam-notes/concept-index]] | Alphabetical concept → note → key fact |
| [[exam-notes/formula-index]] | All formulas by category |
| [[exam-notes/framework-index]] | 9 step-by-step frameworks + decision tree |
| [[exam-notes/question-type-index]] | Trigger phrase → action map |
| [[exam-notes/exam-readiness-report]] | Coverage, risk, study order, exam strategy |
| [[cheat-sheets/formal-languages-cheat-sheet]] | Course-specific cheat sheet |
| [[question-bank/formal-languages-question-bank]] | 90 exam questions |

---

## Vault Health Report

*Generated: 2026-06-24*

### Scores

| Metric | Score | Status |
|--------|-------|--------|
| Concept coverage | 37/37 (100%) | ✓ |
| Broken wikilinks | 0 (fixed: 5) | ✓ |
| Orphan concepts | 0 | ✓ |
| Concepts with <3 outgoing links | 0 | ✓ |
| Master indexes created | 4/4 | ✓ |
| Exam system completeness | 10/10 files | ✓ |

**Vault Score: 95/100**

### Knowledge Coverage

| Module | Coverage | Depth |
|--------|---------|-------|
| 1: Foundations | 100% | Solid |
| 2: Regular Languages | 100% | Deep |
| 3: Lexical Analysis | 100% | Good |
| 4: DFA Theory | 100% | Deep |
| 5: Context-Free Languages | 100% | Deep |
| 6: LL(1) Parsing | 100% | Deep |
| 7: LR Parsing | 100% | Good |
| 8: Applications + Hierarchy | 100% | Adequate |

### Missing / Intentionally Excluded

| Topic | Status | Reason |
|-------|--------|--------|
| NFA | Not covered | Professor explicitly excluded |
| LALR(1) | Not covered | Professor explicitly excluded |
| Turing Machines (detailed) | Not covered | Conceptual only in course |
| Detailed PDA construction | Not covered | Concepts covered, not construction |
| CYK algorithm details | Not covered | Only O(n³) result needed |

### Concepts Needing Expansion

| Concept | Gap | Action |
|---------|-----|--------|
| [[cfg-simplification]] | No full 4-step worked example | Add full traced example |
| [[lr0-parsing]] | No full table construction worked example | Add traced table build |

### Recommended Next Actions

1. Add worked examples to `cfg-simplification.md` and `lr0-parsing.md`
2. Add project-applications notes linking formal language theory to real projects
3. When processing next course: update `master-concept-index.md` with new section
4. Run `/update-vault` again after adding a new course

---

## Directory Structure

```
knowledge-vault/
├── attachments/         ← source PDFs
├── cheat-sheets/        ← course cheat sheets
├── concepts/            ← 37 atomic concept notes
├── courses/             ← full course archives
├── dashboard/           ← THIS FILE + vault navigation
├── exam-notes/          ← exam system (8 files)
├── project-applications/← real-world application notes
├── question-bank/       ← exam question banks
├── templates/           ← note templates
├── master-concept-index.md
├── master-formula-sheet.md
├── master-cheat-sheet.md
├── master-question-bank.md
└── how-to-use.md
```

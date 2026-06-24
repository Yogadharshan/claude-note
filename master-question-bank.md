# Master Question Bank

> All exam questions across all courses. Cross-reference index.

---

## Courses

| Course | Question Bank | Total Questions |
|--------|--------------|----------------|
| Formal Languages and Applications | [[question-bank/formal-languages-question-bank]] | 90 |

---

## Question Type Distribution

### Formal Languages and Applications

| Type | Count | File Location |
|------|-------|--------------|
| Short Answer | 20 | Q1–Q20 |
| Application | 20 | Q21–Q40 |
| Comparison | 20 | Q41–Q60 |
| Synthesis | 20 | Q61–Q80 |
| Professor-style (difficult) | 10 | Q81–Q90 |

---

## High-Yield Questions by Topic

### DFA (Very High Exam Probability)
- Design DFA for language with specific property → Framework 1
- Minimize given DFA using Mark-Reduce → Framework 7
- Prove L is not regular using pumping lemma → Framework 2

### LL(1) Parsing (Very High Exam Probability)
- Compute Nullable/First/Follow for grammar → formula-index rules
- Construct LL(1) parsing table → Framework 4
- Trace LL(1) parse of input string → Framework 4 Step 8-9

### CFG and CFLs (High Exam Probability)
- Write CFG for given language → context-free-grammar examples
- Give leftmost/rightmost derivation → derivation rules
- Prove grammar is/isn't ambiguous → 2 parse trees
- Simplify CFG in correct order → Framework 5
- Convert to CNF → Frameworks 5+6

### Pumping Lemma CFL (High Exam Probability)
- Prove a^nb^nc^n not CFL → Framework 3
- Prove {ww} not CFL → Framework 3 case analysis

### Parsing Theory (Medium-High)
- Compare LL(1) vs LR(0) vs recursive descent
- Trace shift-reduce parse → Framework 8
- Build LR(0) item sets → formula-index LR(0) rules

---

## Cross-Topic Synthesis Questions

1. "Given a grammar, (a) check if LL(1), (b) if not, identify why, (c) transform to make it LL(1)"
2. "Prove language L is CFL but not regular: (a) write CFG, (b) prove not regular via PL"
3. "Show L = {a^nb^nc^n} is in CSL but not CFL"
4. "Given DFA, (a) minimize it, (b) find Myhill-Nerode equivalence classes, (c) relate to minimum states"

---

*Last updated: 2026-06-24*

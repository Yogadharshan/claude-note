# Exam Predictions — Formal Languages and Applications

---

## HIGH PROBABILITY TOPICS (almost certain to appear)

### 1. DFA Construction and Trace
**Probability:** 5/5 — Cannot imagine an exam without this

**Justification:**
- Core topic of Module 2; repeated in Module 3 (lexer)
- Professor emphasized "DFA = memory of relevant history"
- Extremely concrete: can test both design ability and mechanical trace
- Requires synthesizing: states, transitions, acceptance

**Likely question forms:**
- "Design a DFA for strings over {a,b} that..."
- "Trace this DFA on input..."
- "Write the 5-tuple for this DFA"

---

### 2. Pumping Lemma for Regular Languages
**Probability:** 5/5 — Classic exam staple

**Justification:**
- Dedicated lecture + multiple examples covered
- Professor showed template in detail: assume → choose → split → pump → contradict
- Standard proof technique; tests formal reasoning
- Easy to vary (different non-regular languages as exam question)

**Likely question forms:**
- "Prove L = {a^n b^n} is not regular"
- "Prove the language of palindromes is not regular"
- "Use the pumping lemma to show..."

---

### 3. CFG Construction and Derivations
**Probability:** 5/5 — Every formal languages exam has CFG questions

**Justification:**
- Module 5 is the core content of the course
- CFG examples with derivations shown repeatedly
- Tests both creativity (constructing) and mechanics (deriving)

**Likely question forms:**
- "Write a CFG generating L = {a^n b^m | n ≤ m}"
- "Show a leftmost derivation of 'aabb'"
- "Is this string in the language? Derive it."

---

### 4. LL(1) Parsing Table Construction
**Probability:** 5/5 — Multi-mark question, clear algorithm to test

**Justification:**
- Module 6 entire focus; professor demonstrated multiple examples
- Requires First/Follow/Nullable as sub-steps → multi-part question
- Clear grading criteria at each step
- Code demonstration in C shown → may include implementation question

**Likely question forms:**
- "Compute First, Follow, Nullable for grammar G"
- "Build the LL(1) parsing table"
- "Trace the parse of string w using the table"
- "Does this grammar have LL(1) conflicts? Why?"

---

### 5. Parse Tree Drawing
**Probability:** 5/5 — Visual question, easy to grade

**Justification:**
- Parse trees appear in every parsing module
- Ambiguity = two parse trees → natural extension
- Connected to leftmost/rightmost derivation

**Likely question forms:**
- "Draw the parse tree for w using grammar G"
- "Show the grammar is ambiguous by drawing two parse trees for..."

---

## MEDIUM PROBABILITY TOPICS

### 6. Pumping Lemma for CFLs
**Probability:** 4/5

**Justification:**
- Harder version of PL; dedicated lectures
- a^nb^nc^n is the textbook example → might vary it
- Tests deeper understanding than regular PL

**Likely forms:** "Prove {ww} is not CFL" | "Prove a^nb^nc^n is not CFL"

---

### 7. DFA Minimization (Mark-Reduce)
**Probability:** 4/5

**Justification:**
- Dedicated module; step-by-step algorithm
- Concrete: given a DFA, produce the minimal one

**Likely forms:** "Minimize this DFA" | "Find all equivalent state pairs"

---

### 8. CFG Simplification
**Probability:** 4/5

**Justification:**
- 4-step method covered in detail
- Multi-part question opportunity
- Can be combined with CNF conversion

**Likely forms:** "Simplify this CFG" | "Convert to CNF"

---

### 9. Shift-Reduce / LR(0) Parsing
**Probability:** 4/5

**Justification:**
- Module 7 material; complete with worked example
- Shift-reduce trace is concrete and gradeable

**Likely forms:** "Trace shift-reduce parsing of..." | "Build LR(0) parsing table"

---

### 10. Closure Properties
**Probability:** 4/5

**Justification:**
- Easy table question (regular vs CFL)
- Professor contrasted the two classes explicitly
- "Are CFLs closed under intersection?" with counterexample

**Likely forms:** MCQ or short-answer "Is L1 ∩ L2 necessarily CFL?"

---

### 11. Chomsky Hierarchy Classification
**Probability:** 4/5

**Justification:**
- Summary concept; connects all modules
- Table question is straightforward high-mark opportunity

**Likely forms:** "Complete this hierarchy table" | "Classify each language"

---

### 12. Ambiguity in CFG
**Probability:** 4/5

**Justification:**
- Connected to parse trees; professor emphasized ambiguity problems in compilers
- Arithmetic expression ambiguity is classic

---

## LOW PROBABILITY TOPICS

### 13. Myhill-Nerode Theorem
**Probability:** 3/5

**Justification:** Covered but complex; likely appears as short-answer or 1-2 mark definition question rather than full proof.

### 14. Context-Sensitive Grammar
**Probability:** 3/5

**Justification:** Last module; may appear in Chomsky hierarchy question but unlikely standalone proof question.

### 15. Left Recursion / Left Factoring
**Probability:** 3/5

**Justification:** Sub-topic of parsing; likely appears as sub-question within a parsing question.

### 16. Linear Grammars (DFA ↔ Grammar conversion)
**Probability:** 2/5

**Justification:** Theoretical result; unlikely to be an isolated question.

### 17. POS Tagging
**Probability:** 2/5

**Justification:** Application module; may appear in multiple-choice or as context for CFG question.

### 18. CNF Conversion
**Probability:** 3/5

**Justification:** Procedural; may appear as part of a simplification question.

---

## EXAM QUESTION TYPE PREDICTIONS

| Type | Predicted % | Main Topics |
|------|------------|-------------|
| DFA drawing/trace | 15-20% | DFA design, minimization |
| Formal proof (PL) | 15-20% | PL Regular, PL CFL |
| CFG + derivation | 15-20% | CFG construction, parse trees |
| LL(1) table | 15-20% | First/Follow/Nullable, table, trace |
| Comparison | 10-15% | RL vs CFL, LL vs LR, closures |
| Short definitions | 10% | Terminology, hierarchy |
| LR/Shift-reduce | 10-15% | LR(0) items, table, trace |

---

## STRATEGY RECOMMENDATIONS

1. **Memorize proof templates**: PL (regular) and PL (CFL) templates cold
2. **Practice DFA design**: at least 5 varied examples
3. **Build LL(1) tables from scratch**: from grammar to trace without notes
4. **Know the closure table**: regular vs CFL — 8 operations
5. **Know the Chomsky hierarchy table**: Type 0-3, automaton, language class
6. **Have CFG examples ready**: a^nb^n, balanced parens, arithmetic, palindromes

# Exam Risk Report — Formal Languages and Applications

## Scoring Key: Importance/Difficulty/Interconnect/Probability (all 1-5)

---

## HIGH PRIORITY (must know cold)

| Concept | Importance | Difficulty | Interconnect | Probability | Why |
|---------|-----------|-----------|--------------|-------------|-----|
| DFA construction & trace | 5 | 3 | 5 | 5 | Core topic; every exam has "draw DFA for..." |
| Regular Expression | 5 | 3 | 5 | 5 | Core representation; RE ↔ DFA equivalence |
| Pumping Lemma (Regular) | 5 | 4 | 4 | 5 | Classic proof question; template must be memorized |
| CFG construction | 5 | 3 | 5 | 5 | "Write CFG for..." is extremely common |
| LL(1) table construction | 5 | 4 | 5 | 5 | First/Follow/Nullable + table = multi-step exam question |
| First/Follow/Nullable sets | 5 | 4 | 5 | 5 | Prerequisite for LL(1); own-topic exam questions |
| Parse tree drawing | 4 | 3 | 4 | 5 | "Draw parse tree for..." always appears |
| Pumping Lemma (CFL) | 5 | 5 | 4 | 5 | Harder proof; high marks question |
| DFA minimization (Mark-Reduce) | 4 | 4 | 4 | 4 | "Minimize this DFA" step-by-step question |
| CFG simplification | 4 | 4 | 4 | 4 | "Simplify this CFG" — 4-step method |

---

## MEDIUM PRIORITY (solid understanding needed)

| Concept | Importance | Difficulty | Interconnect | Probability | Why |
|---------|-----------|-----------|--------------|-------------|-----|
| Closure properties (Regular) | 4 | 2 | 4 | 4 | Table question + proof by construction |
| Closure properties (CFL) | 4 | 3 | 4 | 4 | "Is L closed under X?" — common MCQ |
| Myhill-Nerode Theorem | 4 | 5 | 4 | 3 | Theoretical; may appear as proof question |
| Chomsky Normal Form | 4 | 4 | 4 | 4 | "Convert to CNF" step-by-step |
| LR(0) parsing | 4 | 5 | 4 | 4 | "Trace LR(0) parse of..." — complex multi-step |
| Shift-reduce parsing | 4 | 4 | 4 | 4 | "Trace shift-reduce actions" |
| Ambiguity in CFG | 4 | 4 | 4 | 4 | "Show grammar is ambiguous / make unambiguous" |
| Recursive descent parsing | 4 | 3 | 4 | 4 | "Write recursive descent parser" in C |
| Chomsky Hierarchy | 4 | 3 | 5 | 3 | Table question; classify languages by type |
| Lexical analyzer | 4 | 3 | 4 | 3 | DFA-to-lexer application question |
| LL vs LR grammar classes | 4 | 3 | 5 | 3 | Comparison question |

---

## LOW PRIORITY (know the concept; detail unlikely)

| Concept | Importance | Difficulty | Interconnect | Probability | Why |
|---------|-----------|-----------|--------------|-------------|-----|
| Linear grammar | 3 | 2 | 4 | 2 | Theoretical; DFA↔grammar conversion may appear |
| Kleene star | 3 | 2 | 5 | 2 | Foundation; rarely isolated question |
| Alphabet/String | 3 | 1 | 5 | 2 | Definition question only |
| Token types | 3 | 1 | 4 | 2 | MCQ at most |
| Compiler structure | 3 | 2 | 5 | 2 | Diagram question; quick points |
| PDA | 3 | 3 | 4 | 3 | Concept; detailed PDA construction unlikely |
| Context-sensitive grammar | 3 | 3 | 4 | 3 | May appear in Chomsky hierarchy question |
| POS tagging | 3 | 2 | 4 | 2 | Application module; may appear as short-answer |
| Automaton | 3 | 2 | 5 | 2 | Conceptual question only |
| Left recursion elimination | 3 | 3 | 4 | 3 | Sub-question in recursive descent / LL(1) |

---

## EXAM TRAP CONCEPTS (commonly confused)

| Trap | What students confuse | Correct answer |
|------|----------------------|----------------|
| ε vs ∅ | Empty string vs empty language | ε is string; ∅ is language with no strings |
| Σ* vs Σ+ | All strings vs non-empty strings | Σ* includes ε; Σ+ does not |
| Regular PL vs CFL PL | 3-part (xyz) vs 5-part (uvwxy) | Regular pumps one part; CFL pumps TWO simultaneously |
| LL(1) vs LR(0) power | Which is more powerful? | LR(0) can parse more grammars than LL(1) |
| Ambiguity vs inherent ambiguity | Grammar vs language | Ambiguity = property of grammar; some languages have NO unambiguous grammar |
| First contains ε? | Follow contains ε? | First CAN contain ε; Follow NEVER contains ε |
| CFLs closed under ∩? | NO | CFL ∩ Regular = CFL; CFL ∩ CFL ≠ always CFL |
| Pumping Lemma proves regularity? | NO | It can only DISPROVE regularity |
| DFA vs NFA power | Same power | DFA = NFA for regular languages (course explicitly skipped NFA) |
| Left recursion in LR? | Cannot handle? | LR handles left recursion naturally; LL cannot |

---

## PROFESSOR EMPHASIS FLAGS

- "DFA states = relevant memory" — design methodology
- "Pumping lemma is always a contradiction proof"
- "Ambiguous grammars cause problems for compilers"
- "Left recursion must be eliminated for LL parsers"
- "LL is simpler; LR is more powerful"
- "NFA was not covered to keep scope"
- "Chomsky hierarchy is the unifying framework"

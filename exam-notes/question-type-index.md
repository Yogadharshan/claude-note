# Question Type Index — Formal Languages
> Identify question type → go to correct framework immediately

---

## TRIGGER PHRASES → ACTION MAP

| If question says... | Question type | Go to |
|--------------------|---------------|-------|
| "Design / construct / draw a DFA" | DFA construction | Framework 1 |
| "Trace this DFA on input..." | DFA trace | Framework 1, Step 6 |
| "Write a regular expression for..." | RE construction | RE rules in formula-index |
| "Prove L is NOT regular" | PL Regular proof | Framework 2 |
| "Use the pumping lemma to show..." | PL proof | Framework 2 or 3 |
| "Prove L is NOT context-free" | PL CFL proof | Framework 3 |
| "Write a CFG for language L" | CFG construction | CFG examples in exam-notes |
| "Give a leftmost derivation of..." | Derivation | Leftmost: expand leftmost NT each step |
| "Draw a parse tree for..." | Parse tree | Root=S; expand down; leaves=string |
| "Show this grammar is ambiguous" | Ambiguity | Find 2 distinct parse trees |
| "Simplify this CFG" | CFG simplification | Framework 5 |
| "Convert to CNF" | CNF conversion | Frameworks 5 then 6 |
| "Compute First, Follow, Nullable" | LL(1) prep | FIRST/FOLLOW rules in formula-index |
| "Build LL(1) parsing table" | LL(1) table | Framework 4 Steps 6-7 |
| "Trace LL(1) parse of..." | LL(1) trace | Framework 4 Step 8-9 |
| "Identify LL(1) conflicts" | LL(1) conflict | Any cell with >1 entry |
| "Eliminate left recursion" | Grammar transform | Formula: A→Aα\|β → A→βA'; A'→αA'\|ε |
| "Left factor this grammar" | Grammar transform | Formula: A→αβ1\|αβ2 → A→αA'; A'→β1\|β2 |
| "Minimize this DFA" | DFA minimization | Framework 7 |
| "Find equivalent states" | DFA minimization | Framework 7 (mark-reduce) |
| "Trace shift-reduce parsing" | LR parse trace | Framework 8 |
| "Build LR(0) table" | LR(0) construction | LR(0) rules in formula-index |
| "Identify LR(0) items" | LR(0) items | Item = A→α•β |
| "Compare X and Y" | Comparison | Use comparison tables in exam-notes |
| "Is L closed under X?" | Closure properties | closure table in exam-notes |
| "Classify L in Chomsky hierarchy" | Hierarchy | Chomsky table in exam-notes |
| "State the Myhill-Nerode theorem" | Theory | M-N: L regular ↔ ≡_L finite index |
| "Prove using Myhill-Nerode" | M-N proof | Show infinite pairwise inequivalent strings |
| "Are these languages equivalent?" | Decidability | CFL equivalence = UNDECIDABLE |

---

## QUESTION TYPE → LIKELY MARKS

| Question Type | Typical Marks | Time Budget |
|--------------|---------------|-------------|
| Definition | 2-3 | 3-5 min |
| DFA construction | 5-8 | 10-15 min |
| RE construction | 3-5 | 5-8 min |
| PL proof (Regular) | 5-8 | 10-15 min |
| PL proof (CFL) | 8-12 | 15-20 min |
| CFG construction | 5-8 | 10-15 min |
| Parse tree | 3-5 | 5-8 min |
| CFG simplification | 8-12 | 15-20 min |
| First/Follow/Nullable | 5-8 | 10-15 min |
| LL(1) table | 5-8 | 10-15 min |
| LL(1) full (sets+table+trace) | 12-18 | 20-30 min |
| DFA minimization | 5-8 | 10-15 min |
| Shift-reduce trace | 5-8 | 10-15 min |
| Comparison question | 4-6 | 8-12 min |
| Closure question | 3-5 | 5-8 min |

---

## COMMON MISTAKES BY QUESTION TYPE

| Question Type | Common Mistake | Correct Approach |
|--------------|---------------|-----------------|
| PL Regular | Forgetting |xy|≤p constraint | y must be in FIRST p symbols |
| PL Regular | Choosing i before analyzing split | Analyze split first; THEN choose i |
| PL CFL | Only pumping one part | BOTH v and y pumped simultaneously |
| First sets | Stopping at first symbol if not nullable | Continue if nullable: add First(Y2), etc. |
| Follow sets | Adding ε to Follow | Follow never has ε; only terminals + $ |
| LL(1) table | Putting A→α in EVERY row | Only where a ∈ First(α) or (ε case) |
| DFA minimization | Skipping inaccessible state removal | Always remove inaccessible first |
| CFG simplification | Wrong order | Non-generating → non-reachable → ε → unit |
| CNF conversion | Forgetting to fix terminals in mixed rules | A→aBC: a must become Na→a |
| Parse tree | Reading tree wrong-to-right | Leaves left-to-right = derived string |

---

## EMERGENCY REFERENCE (30-second lookups)

**DFA formal definition:** M=(Q,Σ,δ,q0,F); L(M)={w|δ*(q0,w)∈F}

**RE precedence:** * > · > +

**PL Regular constraint:** |y|≥1, |xy|≤p

**PL CFL constraint:** |vxy|≤p, |vx|≥1 ← NOTE: vxy NOT vwx — watch notation

**CFG rule form:** A → α (A single non-terminal)

**CSG rule form:** αAβ → αγβ (|RHS|≥|LHS|)

**CNF forms:** A→BC or A→a only

**Derivation length in CNF:** 2n-1 steps for string of length n

**Left recursion elimination:** A→Aα|β → A→βA'; A'→αA'|ε

**Left factoring:** A→αβ1|αβ2 → A→αA'; A'→β1|β2

**Follow never has ε. First can have ε.**

**LL(1) more powerful than recursive descent? No — both LL, but LL(1) strictly predictive.**

**LR(0) more powerful than LL(1)? YES: LL(1) ⊂ LR(0)**

**CFLs closed under ∩ Regular? YES. Under ∩ CFL? NO.**

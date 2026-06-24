# Formal Languages — Exam Notes
> Optimized for retrieval under 10 seconds. Open-book ready.

---

## EXECUTIVE SUMMARY

### Top 5 Most Important Concepts
1. **DFA** — draw, trace, minimize; every exam has at least one DFA question
2. **Regular Expression** — write RE, identify what it matches, convert to/from DFA
3. **Pumping Lemma** — must know both (Regular + CFL); template = contradiction proof
4. **CFG + Parse Trees** — construct CFG, draw parse tree, identify ambiguity
5. **LL(1) Parsing** — compute First/Follow/Nullable, build table, trace parse

### Critical Formulas/Definitions at a Glance
- DFA: M = (Q, Σ, δ, q0, F); L(M) = {w | δ*(q0,w) ∈ F}
- Regular PL: w=xyz, |y|≥1, |xy|≤p, ∀i≥0: xy^iz ∈ L
- CFL PL: w=uvwxy, |vwx|≤p, |vx|≥1, ∀i≥0: uv^iwx^iy ∈ L
- CFG: G=(V,T,S,P); A → α where A ∈ V, α ∈ (V∪T)*
- CNF: A → BC or A → a (only)

---

## KEY DEFINITIONS (Exam-Oriented)

| Term | Definition | Key property |
|------|-----------|--------------|
| Alphabet Σ | Finite non-empty set of symbols | Set — no order, no duplicates |
| String w | Finite sequence from Σ | ε = empty string, \|w\| = length |
| Language L | L ⊆ Σ* (any subset of all strings) | ∅ ≠ {ε} |
| Regular Language | L described by RE / accepted by DFA | Simplest infinite class |
| DFA | 5-tuple M=(Q,Σ,δ,q0,F); δ total | O(n) recognition |
| CFG | G=(V,T,S,P); rules A→α | A is single non-terminal |
| CFL | L=L(G) for some CFG G | Recognized by PDA |
| PDA | NFA + stack | Equivalent to CFG |
| CSG | αAβ→αγβ; \|RHS\|≥\|LHS\| | Context-dependent rules |
| Parse Tree | Root=S, leaves=terminals | One tree = one leftmost derivation |
| Derivation | S ⟹* w by applying rules | Leftmost: expand leftmost NT |
| CNF | A→BC or A→a only | 2n-1 steps for \|w\|=n |

---

## COMPARISON TABLES

### Regular vs Context-Free Languages

| Feature | Regular | Context-Free |
|---------|---------|-------------|
| Generator | RE / Linear Grammar | CFG |
| Recognizer | DFA | PDA |
| Closed ∪ | YES | YES |
| Closed ∩ | YES | NO |
| Closed complement | YES | NO |
| Pumping Lemma | xyz, 3 parts | uvwxy, 5 parts |
| Can count? | NO | YES (1 dimension) |
| Example | a*b* | a^n b^n |
| Non-example | — | a^n b^n c^n |

### LL vs LR Parsers

| Feature | LL(1) | LR(0) | LR(1) |
|---------|-------|-------|-------|
| Direction | Top-down | Bottom-up | Bottom-up |
| Derivation built | Leftmost | Rightmost (reversed) | Rightmost (reversed) |
| Lookahead | 1 | 0 | 1 |
| Left recursion | Cannot handle | Handles | Handles |
| Conflict types | First/Follow | Reduce-Reduce | Shift-Reduce |
| Table | M[A,a] | Action+GOTO | Action+GOTO |
| Power | Least | More | Most practical |

### Top-Down vs Bottom-Up Parsing

| Feature | Top-Down | Bottom-Up |
|---------|----------|-----------|
| Start | From S | From input |
| Strategy | Predict then match | Shift then reduce |
| Leftmost/Rightmost | Leftmost | Rightmost (reversed) |
| Left recursion | Fails | Natural |
| Examples | Recursive Descent, LL(1) | Shift-Reduce, LR(0), LR(1) |

### Closure Properties (know this table cold)

| Operation | Regular | CFL |
|-----------|---------|-----|
| Union | ✓ | ✓ |
| Intersection | ✓ | ✗ |
| Complement | ✓ | ✗ |
| Concatenation | ✓ | ✓ |
| Kleene Star | ✓ | ✓ |
| ∩ Regular | ✓ | ✓ |
| Reversal | ✓ | ✓ |

### Chomsky Hierarchy (know whole table)

| Type | Grammar | Automaton | Language | Example |
|------|---------|-----------|----------|---------|
| 3 | Regular (linear rules) | DFA/NFA | Regular | a*, (a+b)* |
| 2 | CFG (A→α) | PDA | Context-Free | a^n b^n |
| 1 | CSG (αAβ→αγβ) | LBA | Context-Sensitive | a^n b^n c^n |
| 0 | Unrestricted | Turing Machine | Rec. Enumerable | any computable |

---

## FRAMEWORK TABLES

### DFA Design Framework
| Step | Action |
|------|--------|
| 1 | Identify what "memory" the DFA needs (relevant history) |
| 2 | Create one state per distinct memory value |
| 3 | Define δ: what does each input symbol do to the memory? |
| 4 | Mark accepting states (memory satisfies acceptance condition) |
| 5 | Add dead/trap state for invalid transitions |

### Pumping Lemma (Regular) — Proof Template
| Step | Action |
|------|--------|
| 1 | Assume L is regular (for contradiction) |
| 2 | Let p = pumping length |
| 3 | Choose w ∈ L with \|w\| ≥ p (choose wisely to force y into specific part) |
| 4 | Apply lemma: w=xyz, \|xy\|≤p, \|y\|≥1 |
| 5 | Find i such that xy^iz ∉ L (for ALL possible xyz splits) |
| 6 | Contradiction → L is not regular |

### Pumping Lemma (CFL) — Proof Template
| Step | Action |
|------|--------|
| 1 | Assume L is CFL (for contradiction) |
| 2 | Let p = pumping length |
| 3 | Choose w ∈ L with \|w\| ≥ p |
| 4 | Apply lemma: w=uvwxy, \|vwx\|≤p, \|vx\|≥1 |
| 5 | Note: vwx cannot span 3 symbol types if all have length ≥ p |
| 6 | Find i such that uv^iwx^iy ∉ L (for all possible splits) |
| 7 | Contradiction → L not context-free |

### CFG Simplification — 4 Steps (in order)
| Step | What | How |
|------|------|-----|
| 1 | Remove non-generating symbols | Iteratively find what CAN reach terminals; delete rest |
| 2 | Remove non-reachable symbols | BFS from S; delete unreachable |
| 3 | Remove ε-productions | Find nullable NTs; create rules with/without them |
| 4 | Remove unit productions | A→B: inline B's productions into A |

### LL(1) Table Construction — Algorithm
| Step | Action |
|------|--------|
| 1 | Compute Nullable (which NTs can derive ε) |
| 2 | Compute First(X) for all symbols |
| 3 | Compute Follow(A) for all NTs |
| 4 | For A→α: if a∈First(α) → add A→α to T[A,a] |
| 5 | For A→α: if ε∈First(α) and b∈Follow(A) → add A→α to T[A,b] |
| 6 | Conflict = >1 entry in same cell → grammar not LL(1) |

### Mark-Reduce DFA Minimization
| Step | Action |
|------|--------|
| 1 | Remove inaccessible states |
| 2 | Mark all (accepting, non-accepting) pairs |
| 3 | For each unmarked (p,q): if (δ(p,a), δ(q,a)) marked → mark (p,q) |
| 4 | Repeat Step 3 until stable |
| 5 | Merge all unmarked pairs into single states |

### LR(0) Table Construction
| Step | Action |
|------|--------|
| 1 | Augment: add S' → S |
| 2 | Build I0 = closure({S' → •S}) |
| 3 | Build all item sets via GOTO transitions |
| 4 | A→α•aβ ∈ Ii, GOTO(Ii,a)=Ij → action[i,a] = shift j |
| 5 | A→α• ∈ Ii (A≠S') → action[i,*] = reduce A→α (ALL terminals) |
| 6 | S'→S• ∈ Ii → action[i,$] = accept |
| 7 | GOTO[i,A] = j for each non-terminal transition |

---

## FORMULA TABLE

| Formula | Variables | When to Use |
|---------|-----------|-------------|
| δ*(q, ε) = q | q=state | Extended transition on empty string |
| δ*(q, wa) = δ(δ*(q,w), a) | w=string, a=symbol | Extended transition recursive case |
| L(M) = {w \| δ*(q0,w) ∈ F} | q0=start, F=accepting | Language accepted by DFA M |
| \|xy^iz\| = \|w\| - \|y\| + i·\|y\| | y=pumped part | Length after pumping i times |
| CNF: string of length n → 2n-1 steps | n=length | Derivation steps count in CNF |
| RE precedence: * > · > + | — | Always apply when parsing REs |
| Chomsky: Regular ⊂ CFL ⊂ CSL ⊂ RE | — | Hierarchy strict inclusion |

---

## DECISION TREES

### What Framework to Use?

```
Question asks to RECOGNIZE a language pattern?
├── Finite memory pattern → DFA + RE
└── Counting / nested → CFG + PDA

Question asks to PROVE non-regularity?
├── Use Pumping Lemma (Regular) [3-part: xyz]
└── Alternative: Myhill-Nerode (more powerful)

Question asks to PROVE non-CFL?
└── Use Pumping Lemma (CFL) [5-part: uvwxy]

Question asks to BUILD a parser?
├── Simple grammar, top-down → Recursive Descent
├── LL(1) table approach → Compute First/Follow → Build table
└── Bottom-up (left recursion OK) → Shift-Reduce / LR

Question asks about GRAMMAR TYPE?
└── Use Chomsky Hierarchy table (Type 0-3)

Question asks about CLOSURE?
├── Regular language → ALL closed (∪ ∩ complement concat *)
└── CFL → ∪ concat * closed; ∩ complement NOT closed; ∩ Regular = YES

Question asks to MINIMIZE DFA?
└── Mark-Reduce algorithm (5 steps)
```

### Parsing Choice Tree
```
Have grammar?
├── Left recursive? → Eliminate left recursion first
├── Common prefix? → Left factor first
└── Then:
    ├── Compute First/Follow/Nullable
    ├── Build LL(1) table
    ├── Conflict? → Grammar NOT LL(1)
    │   └── Options: left factor more / eliminate recursion / use LR
    └── No conflict → LL(1) grammar → trace parse with stack
```

---

## ANSWER STRUCTURES

### Comparison Question (e.g., "Compare LL(1) and LR(1)")
```
1. One-line definition of each
2. Comparison table: [direction, derivation, lookahead, left recursion, power]
3. When to prefer each: [grammar complexity, implementation effort]
4. Class hierarchy: LL(1) ⊂ LR(0) ⊂ LR(1)
5. Conclusion: which is stronger and why
```

### Proof of Non-Regularity (Pumping Lemma)
```
1. "Assume L is regular. Let p be the pumping length."
2. "Choose w = [specific string] ∈ L with |w| ≥ p."
3. "By PL, w = xyz where |xy| ≤ p, |y| ≥ 1."
4. "Since |xy| ≤ p, y must consist entirely of [specific symbol(s)]."
5. "Pump with i = [value]: xy^iz = [resulting string]."
6. "[Resulting string] ∉ L because [reason]."
7. "Contradiction. L is not regular. ∎"
```

### CFG Construction Question
```
1. Identify the pattern (counting, nesting, alternation)
2. Choose start symbol S
3. Write the base case production
4. Write the recursive case production
5. Verify with 2-3 examples derived from grammar
6. Note any edge cases (ε, n=0, etc.)
```

### DFA Construction Question
```
1. State what memory is needed
2. List all states and what they represent
3. Draw transition diagram
4. Write formal 5-tuple
5. Trace one accepted string and one rejected string to verify
```

### LL(1) Table Construction
```
1. State Nullable set (with justification)
2. State First sets (show work for each NT)
3. State Follow sets (show work for each NT)
4. Build table (show which production goes in each cell)
5. Check for conflicts (if any: state "not LL(1)")
6. [Optional] Trace parsing of a specific string using the table
```

### Parse Tree Drawing
```
1. Root = S
2. Apply leftmost derivation step by step
3. Each production = one level of the tree
4. Leaves = terminals of the string
5. Read leaves L→R to verify = original string
```

---

## COMMON EXAM TRAPS

| Trap | Wrong Assumption | Correct |
|------|-----------------|---------|
| ε in Follow | Follow(A) can contain ε | Follow NEVER has ε; only terminals and $ |
| PL direction | You choose the split in PL | Adversary chooses split; you choose i |
| PL proves regularity | If PL holds → language is regular | PL is NECESSARY only; cannot prove regularity |
| CFL PL: one pump | Only v or x is pumped | BOTH v AND x pumped simultaneously (xy^iz should be uv^iwx^iy) |
| CFLs closed under ∩ | Same as regular | NO: CFL ∩ CFL ≠ always CFL |
| Left recursion in LR | "LR can't handle left recursion" | LR handles it naturally; LL cannot |
| Minimal DFA unique | Multiple minimal DFAs possible | Minimal DFA IS unique (up to renaming) |
| Ambiguous grammar | Makes language ambiguous | Ambiguity = grammar property; language may have unambiguous grammar |
| {ε} = ∅ | Empty string = empty language | {ε} has one element; ∅ has zero |
| First(α) = First(A) | Always take First of head | If head is nullable, include First of next symbol too |

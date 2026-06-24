# Master Cheat Sheet

> Max compression. Open-book exam. 30 seconds to find anything.

---

## FORMAL LANGUAGES

### Hierarchy Table (memorize)

| Type | Name | Grammar | Machine | Class |
|------|------|---------|---------|-------|
| 3 | Regular | A→xB\|x | DFA | RL |
| 2 | Context-Free | A→α | PDA | CFL |
| 1 | Context-Sensitive | αAβ→αγβ | LBA | CSL |
| 0 | Unrestricted | α→β | TM | RE |
Inclusion: RL ⊂ CFL ⊂ CSL ⊂ RE

### DFA
`M=(Q,Σ,δ,q0,F)` | `L(M)={w|δ*(q0,w)∈F}` | δ total function

### RE Precedence
`* > · > +` | `ab* = a·(b*)` | `a+bc* = a+(b·c*)`

### 3 Equivalent Representations (Regular)
`RE ↔ DFA ↔ Right/Left Linear Grammar`

### Pumping Lemma (Regular)
`w=xyz; |y|≥1; |xy|≤p; ∀i≥0: xy^iz∈L`
Proof: choose w=a^p b^p → forces y in a's → pump breaks balance

### Pumping Lemma (CFL)
`w=uvxyz; |vxy|≤p; |vy|≥1; ∀i≥0: uv^ixy^iz∈L`
Key: BOTH v and y pumped simultaneously; |vxy|≤p spans ≤2 blocks

### Myhill-Nerode
`x≡_L y iff ∀z: xz∈L↔yz∈L` | L regular ↔ ≡_L finite index
Min DFA states = number of equivalence classes

### DFA Minimization (Mark-Reduce)
1. Remove inaccessible states
2. Mark (F, Q\F) pairs distinguishable
3. Iterate: if (δ(p,a),δ(q,a)) marked → mark (p,q)
4. Repeat until stable
5. Merge unmarked pairs

### CFG
`G=(V,T,S,P)` | rules: `A→α` (A single NT) | `L(G)={w∈T*|S⟹*w}`
a^nb^n: `S→aSb|ab` | balanced parens: `S→(S)|SS|ε`

### CFG Simplification ORDER (critical)
1. Remove non-generating (can't reach terminal)
2. Remove non-reachable (BFS from S)
3. Remove ε-productions (nullable set first)
4. Remove unit productions (A→B chains)

### Chomsky Normal Form
All rules: `A→BC` or `A→a`
Conversion: (1) simplify first (2) break long RHS (3) fix terminal-NT mixes
Length n string → exactly 2n-1 steps; CYK: O(n³)

### First / Follow Rules
```
FIRST: {a} for terminal; for NT: First(Y1) + if Y1 nullable: First(Y2)...
FOLLOW: S gets $; A→αBβ: First(β)\{ε} → Follow(B); if ε∈First(β): Follow(A)→Follow(B)
Follow NEVER has ε
```

### LL(1) Table
`a∈First(α) → T[A,a]=A→α`
`ε∈First(α) and b∈Follow(A) → T[A,b]=A→α`
Conflict → NOT LL(1)

### Grammar Hierarchy
`LL(1) ⊂ LR(0) ⊂ LR(1)` | LR handles left recursion; LL cannot
LL: top-down, leftmost derivation | LR: bottom-up, rightmost reversed

### Left Recursion Elimination
`A→Aα|β becomes: A→βA'; A'→αA'|ε`

### Left Factoring
`A→αβ1|αβ2 becomes: A→αA'; A'→β1|β2`

### LR(0) Items
`A→α•β` (dot position) | reduce when dot at end: A→α•
Closure: A→α•Bβ → add B→•γ | GOTO(I,X): advance dot over X

### Closure Properties
```
Regular:  ALL closed (∪∩'·* rev hom quot)
CFL:      ∪·* rev hom closed; ∩ ' NOT closed
CFL∩Reg = CFL (always)
```

### Decidability
```
Regular:  membership✓ emptiness✓ equivalence✓ ALL decidable
CFL:      membership✓ emptiness✓ equivalence✗ universality✗
```

### Key Non-Examples
- `a^nb^n` NOT regular (PL regular proof)
- `a^nb^nc^n` NOT CFL (PL CFL proof)
- `{ww}` NOT CFL

### Common Traps
| Trap | Correct |
|------|---------|
| y in PL-regular must be first p chars | |xy|≤p forces y in prefix |
| PL-CFL: only pump v OR y | Both v AND y pumped together |
| Follow(A) can have ε | Follow NEVER has ε |
| LL(1) table: add to all rows | Only rows where a∈First(α) or ε-case |
| CFG simplification: any order | Order is fixed: non-gen→non-reach→ε→unit |
| LR more powerful than LL? | YES: LL(1)⊂LR(0) |
| NFA covered in this course? | NO — professor explicitly excluded |

---

*Last updated: 2026-06-24*

# Master Formula Sheet

> All formulas across all courses. 30-second lookup.

---

## FORMAL LANGUAGES AND APPLICATIONS

### Core Definitions

| Symbol | Meaning |
|--------|---------|
| Σ | Alphabet (finite non-empty set of symbols) |
| Σ* | Kleene star: all strings including ε |
| Σ+ | Positive closure: all strings excluding ε |
| ε | Empty string (length 0) |
| L ⊆ Σ* | Formal language |

### DFA

```
M = (Q, Σ, δ, q0, F)
δ: Q × Σ → Q            (total function)
δ*(q, ε) = q             (base case)
δ*(q, wa) = δ(δ*(q,w), a) (recursive case)
L(M) = {w ∈ Σ* | δ*(q0, w) ∈ F}
```

### Regular Expression Precedence

```
* > · > +
Examples:
  ab* = a·(b*)       NOT (a·b)*
  a+bc* = a+(b·c*)   NOT (a+b)·c*
```

### Grammar

```
G = (V, T, S, P)
V = non-terminals; T = terminals; S ∈ V; P = productions
L(G) = {w ∈ T* | S ⟹* w}
```

### Chomsky Hierarchy

| Type | Grammar Rule Form | Automaton | Language Class |
|------|------------------|-----------|----------------|
| 3 | A → xB or A → x | DFA/NFA | Regular |
| 2 | A → α | PDA | Context-Free |
| 1 | αAβ → αγβ (|RHS|≥|LHS|) | LBA | Context-Sensitive |
| 0 | α → β (α has ≥1 NT) | TM | Recursively Enumerable |

### Pumping Lemma — Regular

```
∃p > 0: ∀w ∈ L, |w| ≥ p ⟹ ∃ w=xyz where:
  |y| ≥ 1
  |xy| ≤ p
  ∀i ≥ 0: xy^iz ∈ L
```

### Pumping Lemma — CFL

```
∃p > 0: ∀w ∈ L, |w| ≥ p ⟹ ∃ w=uvxyz where:
  |vxy| ≤ p
  |vy| ≥ 1
  ∀i ≥ 0: uv^ixy^iz ∈ L
```

### Myhill-Nerode

```
x ≡_L y  iff  ∀z ∈ Σ*: xz ∈ L ↔ yz ∈ L
L regular  ↔  |Σ*/≡_L| is finite
#states in minimal DFA = index of ≡_L
```

### Chomsky Normal Form

```
All rules: A → BC  or  A → a
String of length n ⟹ exactly 2n-1 derivation steps
CYK algorithm: O(n³ × |G|)
```

### First / Follow / Nullable

```
NULLABLE:
  A → ε: Nullable(A) = true
  A → Y1…Yk: Nullable(A) = true iff all Yi nullable

FIRST:
  First(a) = {a}                    (terminal)
  First(A → Y1Y2…Yk):
    add First(Y1)
    if Y1 nullable: add First(Y2)
    if Y1,Y2 nullable: add First(Y3), etc.
    if all nullable: add ε to First(A)

FOLLOW:
  Follow(S) ∋ $                     (always)
  A → αBβ: add First(β)\{ε} to Follow(B)
  A → αB or ε ∈ First(β): add Follow(A) to Follow(B)
  Follow NEVER contains ε
```

### LL(1) Table Construction

```
For each production A → α:
  For each a ∈ First(α): T[A, a] = A → α
  If ε ∈ First(α):
    For each b ∈ Follow(A): T[A, b] = A → α
Conflict: |T[A,a]| > 1 → NOT LL(1)
```

### LR(0) Items and Tables

```
Item:      A → α•β        (dot shows parse position)
Closure:   if A→α•Bβ ∈ I, add all B→•γ
GOTO:      GOTO(I,X) = closure({A→αX•β | A→α•Xβ ∈ I})

Action table:
  A→α•aβ ∈ Ii, GOTO(Ii,a)=Ij  →  shift j
  A→α• ∈ Ii, A≠S'              →  reduce A→α  (ALL terminals)
  S'→S• ∈ Ii                   →  accept
GOTO table:
  GOTO(Ii, A) = Ij             →  goto[i, A] = j
```

### Left Recursion Elimination

```
A → Aα | β   becomes:
A  → βA'
A' → αA' | ε
```

### Left Factoring

```
A → αβ1 | αβ2 | … | αβn   becomes:
A  → αA'
A' → β1 | β2 | … | βn
```

### Closure Properties Summary

```
Regular:   ∪ ∩ ' · * rev hom quot — ALL CLOSED
CFL:       ∪ · * rev hom — CLOSED
CFL:       ∩ ' — NOT CLOSED
CFL ∩ Reg: = CFL (always)
```

### Decidability

| Problem | Regular | CFL |
|---------|---------|-----|
| Membership | YES (O(n)) | YES (O(n³) CYK) |
| Emptiness | YES | YES |
| Infinity | YES | YES |
| Equivalence | YES | NO |
| Universality | YES | NO |

---

*Last updated: 2026-06-24*

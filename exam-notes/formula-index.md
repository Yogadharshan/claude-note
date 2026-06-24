# Formula Index — Formal Languages
> Every formula, rule, and algorithm in one place.

---

## DFA FORMULAS

| Formula | Meaning | Use when |
|---------|---------|----------|
| M = (Q, Σ, δ, q0, F) | DFA definition | Writing formal definition |
| δ: Q × Σ → Q | Transition function (total) | All (state, symbol) pairs have exactly one next state |
| δ*(q, ε) = q | Extended transition: empty string | Base case for δ* induction |
| δ*(q, wa) = δ(δ*(q,w), a) | Extended transition: append symbol | Recursive case |
| L(M) = {w ∈ Σ* \| δ*(q0, w) ∈ F} | Language of DFA | Defining what DFA accepts |
| \|L(M)\| ≥ \|Q\| - \|F\| | States in complement | Complement DFA has \|Q\|-\|F\| accepting states |

---

## REGULAR EXPRESSION PRECEDENCE

```
Precedence (high to low):
1. * (Kleene star) — tightest
2. · (concatenation)
3. + (union) — loosest

Examples:
ab* = a·(b*)          NOT (a·b)*
a+bc* = a+(b·(c*))    NOT (a+b)·(c*)
```

---

## PUMPING LEMMA FORMULAS

### Regular Languages
```
∃p > 0 such that ∀w ∈ L with |w| ≥ p:
∃ w = xyz where:
  |y| ≥ 1
  |xy| ≤ p
  ∀i ≥ 0: xy^iz ∈ L

After pumping i times: |xy^iz| = |w| - |y| + i·|y|
Pump i=0 to remove: |xz| = |w| - |y| ≤ |w| - 1
```

### Context-Free Languages
```
∃p > 0 such that ∀w ∈ L with |w| ≥ p:
∃ w = uvxyz where:
  |vxy| ≤ p
  |vy| ≥ 1
  ∀i ≥ 0: uv^ixy^iz ∈ L

(some courses use uvwxy notation — w/x swapped)
```

---

## MYHILL-NERODE

```
x ≡_L y  iff  ∀z ∈ Σ*: xz ∈ L ↔ yz ∈ L

L is regular  ↔  |Σ*/≡_L| is finite
#states in minimal DFA  =  index of ≡_L
```

---

## CFG DEFINITIONS

```
G = (V, T, S, P)
V = non-terminals; T = terminals; S ∈ V = start symbol
P = {A → α | A ∈ V, α ∈ (V∪T)*}
L(G) = {w ∈ T* | S ⟹* w}
```

---

## CNF FORMULAS

```
CNF: every rule is A → BC or A → a
Derivation of string of length n: exactly 2n - 1 steps
Parse tree in CNF: binary tree of height ≤ 2n-1
CYK time: O(n³ × |G|)
```

---

## FIRST / FOLLOW / NULLABLE RULES

```
NULLABLE:
  A → ε: Nullable(A) = true
  A → Y1Y2...Yk: Nullable(A) = true if all Yi nullable

FIRST:
  First(a) = {a}  for terminal a
  First(A → Y1Y2...Yk):
    always add First(Y1)
    if Y1 nullable: add First(Y2)
    if Y1,Y2 nullable: add First(Y3)
    ...
    if all nullable: add ε to First(A)

FOLLOW:
  Follow(S) ∋ $  (always)
  A → αBβ: add First(β)\{ε} to Follow(B)
  A → αB or ε ∈ First(β): add Follow(A) to Follow(B)
```

---

## LL(1) TABLE CONSTRUCTION

```
For each production A → α:
  For each a ∈ First(α): T[A, a] = A → α
  If ε ∈ First(α):
    For each b ∈ Follow(A): T[A, b] = A → α
Conflict: |T[A, a]| > 1  →  NOT LL(1)
```

---

## LR(0) RULES

```
LR(0) Item: A → α•β  (dot shows position)
Closure(I): if A→α•Bβ ∈ I, add all B→•γ to I
GOTO(I, X): {A→αX•β | A→α•Xβ ∈ I}, then closure

Action table:
  A→α•aβ ∈ Ii, GOTO(Ii,a)=Ij  →  action[i,a] = shift j
  A→α• ∈ Ii, A≠S'               →  action[i,*] = reduce A→α (ALL terminals)
  S'→S• ∈ Ii                     →  action[i,$] = accept
GOTO table:
  GOTO(Ii, A) = Ij               →  goto[i, A] = j
```

---

## LEFT RECURSION ELIMINATION

```
A → Aα | β  becomes:
A → βA'
A' → αA' | ε
```

---

## LEFT FACTORING

```
A → αβ1 | αβ2 | ... | αβn  becomes:
A → αA'
A' → β1 | β2 | ... | βn
```

---

## CHOMSKY HIERARCHY

```
Type 3 (Regular):       A → xB or A → x
Type 2 (Context-Free):  A → α (any string; A single NT)
Type 1 (Context-Sens):  αAβ → αγβ (|RHS| ≥ |LHS|)
Type 0 (Unrestricted):  α → β (α has ≥1 NT)
```

---

## CLOSURE SUMMARY

```
Regular:    ∪ ∩ ' · * rev hom quot — ALL CLOSED
CFL:        ∪ · * rev hom — CLOSED
CFL:        ∩ ' — NOT CLOSED
CFL ∩ Reg:  = CFL (always)
```

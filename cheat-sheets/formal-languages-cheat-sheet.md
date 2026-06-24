# Formal Languages — Cheat Sheet
> Max compression. 30 seconds. Open-book exam ready.

---

## CHOMSKY HIERARCHY
```
Type 3 Regular     → DFA      → a*, (a+b)*, ends-in-ab
Type 2 Context-Free → PDA      → a^n b^n, balanced (), palindromes
Type 1 Context-Sens → LBA      → a^n b^n c^n, type-checking
Type 0 Unrestricted → TM       → any computable
Regular ⊂ CFL ⊂ CSL ⊂ RE (strict inclusion)
```

---

## DFA
```
M = (Q, Σ, δ, q0, F)
δ: Q×Σ→Q (total, deterministic)
L(M) = {w | δ*(q0,w) ∈ F}
δ*(q, ε) = q
δ*(q, wa) = δ(δ*(q,w), a)
Design: state = relevant memory
```

---

## REGULAR EXPRESSIONS
```
∅, ε, a ∈ Σ = primitives
+  = union
·  = concatenation  
*  = Kleene star (≥0)
Precedence: * > · > +
a+bc* = a + (b(c*))   ← NOT (a+b)(c*)
RE ↔ DFA ↔ Linear Grammar (all equivalent)
```

---

## CLOSURE PROPERTIES
```
          Regular  CFL
Union        ✓      ✓
Intersect    ✓      ✗  ← KEY DIFFERENCE
Complement   ✓      ✗
Concat       ✓      ✓
Star         ✓      ✓
∩ Regular    ✓      ✓  ← CFL∩Regular=CFL
```

---

## PUMPING LEMMA (REGULAR)
```
Assume regular. Let p = pumping length.
Choose w ∈ L, |w| ≥ p.
∃ w=xyz: |y|≥1, |xy|≤p, ∀i≥0: xy^iz ∈ L
→ Find i making xy^iz ∉ L → CONTRADICTION
Classic: a^p b^p → xyz all in a's → pump i=0 → a^(p-k)b^p ∉ L
```

---

## DFA MINIMIZATION (Mark-Reduce)
```
1. Remove inaccessible states
2. Mark (F, Q\F) pairs [final vs non-final]
3. Mark (p,q) if (δ(p,a), δ(q,a)) is marked
4. Repeat 3 until stable
5. Merge all unmarked pairs
Result = minimal unique DFA
```

---

## MYHILL-NERODE
```
x ≡_L y  iff  ∀z: xz∈L ↔ yz∈L
L regular ↔ ≡_L has FINITE index
#equivalence classes = #states in minimal DFA
Prove non-regular: show infinite pairwise inequivalent strings
```

---

## CFG
```
G = (V, T, S, P)  ;  rules: A → α  (A ∈ V, single NT on LHS)
Context-free = LHS always one NT
Leftmost derivation → top-down parsing
Rightmost derivation → bottom-up parsing (reversed)
Ambiguous = ≥1 string has 2 parse trees
```

---

## CFG EXAMPLES
```
a^n b^n:       S → aSb | ab
Balanced ():   S → (S) | SS | ε
Equal 0s,1s:   S → 1S0S | 0S1S | ε
Palindromes:   S → aSa | bSb | a | b | ε
Arithmetic:    E → E+T|T ; T → T*F|F ; F → id|(E)
```

---

## CFG SIMPLIFICATION (ORDER MATTERS)
```
1. Remove non-generating (can't reach terminals)
2. Remove non-reachable (can't reach from S)
3. Remove ε-productions: find nullable; add versions with/without
4. Remove unit productions: A→B; inline B's rules into A
```

---

## CNF
```
Every rule: A → BC  or  A → a
(plus S → ε if ε ∈ L)
String length n → exactly 2n-1 derivation steps
Required for CYK (O(n³) membership)
```

---

## PUMPING LEMMA (CFL)
```
Assume CFL. Let p = pumping length.
Choose w ∈ L, |w| ≥ p.
∃ w=uvwxy: |vwx|≤p, |vx|≥1, ∀i≥0: uv^iwx^iy ∈ L
Key: vwx can't span all 3 symbol-blocks if each has ≥p symbols
Classic: a^p b^p c^p → vwx spans ≤2 blocks → pump → one count changes → ∉ L
```

---

## PDA
```
NFA + unbounded stack = PDA
CFG ↔ PDA (equivalent)
NPDA ≠ DPDA (unlike DFA≡NFA)
LL/LR parsers = deterministic PDA implementations
```

---

## LL(1) PARSING
```
L=left-to-right, L=leftmost, (1)=1 lookahead
Nullable(A): A →* ε?
First(X): terminals that can start strings derived from X
Follow(A): terminals that can follow A (never contains ε)
Table T[A,a]: A→α if a∈First(α) ; A→α if ε∈First(α) and a∈Follow(A)
Conflict → NOT LL(1)
Parse: stack [S,$] + input → match/expand until accept
```

---

## FIRST/FOLLOW RULES
```
First(a) = {a}
First(A → Y1Y2...): add First(Y1); if Y1 nullable add First(Y2)...
Follow(S) ∋ $
B→αAβ: add First(β)\{ε} to Follow(A)
B→αA or ε∈First(β): add Follow(B) to Follow(A)
```

---

## LEFT RECURSION ELIMINATION
```
A → Aα | β
becomes:
A → βA'
A' → αA' | ε
```

## LEFT FACTORING
```
A → αβ1 | αβ2
becomes:
A → αA'
A' → β1 | β2
```

---

## SHIFT-REDUCE (BOTTOM-UP)
```
Shift: push next input onto stack
Reduce: pop RHS of production, push LHS
Accept: stack=S + input=$
Error: no valid action
LR(0): 0 lookahead; LR(1): 1 lookahead
```

---

## LR(0) ITEMS & TABLE
```
Item: A → α•β (dot shows parsing position)
Reduce when: dot at end (A → α•)
Closure: for A→α•Bβ, add all B→•γ
GOTO(I,X): advance dot past X + take closure
Table:
  dot before terminal a → shift
  dot at end → reduce (all columns in LR(0))
  S'→S• → accept
```

---

## GRAMMAR CLASS HIERARCHY
```
LL(1) ⊂ LL(2) ⊂ ... ⊂ LLK
LL(1) ⊂ LR(0) ⊂ LR(1) ⊂ LALR(1) ≈ LR(1)
LLK: top-down; cannot handle left recursion; simpler
LRK: bottom-up; handles left recursion; more expressive
```

---

## DECIDABILITY (CFL)
```
Membership (w∈L?):      DECIDABLE
Emptiness (L=∅?):       DECIDABLE
Infinite (|L|=∞?):      DECIDABLE
Equivalence (L1=L2?):   UNDECIDABLE
```

---

## KEY NON-EXAMPLES
```
NOT Regular:   a^n b^n, ww^R, {w|#a=#b}
NOT CFL:       a^n b^n c^n, {ww|w∈Σ*}, prime-length
```

---

## EXAM TRAPS (QUICK)
```
ε ≠ ∅ (string vs language)
First NEVER has $; Follow NEVER has ε
PL can only DISPROVE, not prove regularity
CFL PL pumps TWO parts (v AND x), not one
CFL NOT closed under ∩ ; Regular IS
LR handles left recursion; LL does NOT
Minimal DFA is UNIQUE
Ambiguity = grammar property, not language property
```

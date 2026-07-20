o# Framework Index — Formal Languages
> Lookup by problem type. Use in exam in under 10 seconds.

---

## FRAMEWORK 1: DFA Design

**Use when:** "Construct a DFA for..." / "Design an automaton..."

| Step | Action | Notes |
|------|--------|-------|
| 1 | Identify required memory | What distinctions matter? |
| 2 | States = memory values | One state per distinct relevant history |
| 3 | Define transitions | What does each input symbol change? |
| 4 | Mark accepting states | Which memory values satisfy acceptance? |
| 5 | Add dead/trap state | For all undefined transitions |
| 6 | Verify with examples | Trace 1 accepted + 1 rejected string |

---

## FRAMEWORK 2: Pumping Lemma (Regular) Proof

**Use when:** "Prove L is not regular" / "Show L ∉ REG"

```
Step 1: "Assume for contradiction that L is regular."
Step 2: "Let p be the pumping length guaranteed by PL."
Step 3: "Choose w = [string] ∈ L with |w| ≥ p."
         → Choose string that FORCES y into a predictable location
Step 4: "By PL, w = xyz where |xy| ≤ p, |y| ≥ 1."
         → Analyze what y can be given |xy| ≤ p
Step 5: "Since |xy| ≤ p, [y must consist of only X's]."
Step 6: "Let i = [value]. Then xy^iz = [resulting string]."
Step 7: "But xy^iz ∉ L because [reason]."
Step 8: "This contradicts PL. Therefore L is not regular. ∎"

Classic choices for w:
- L = {a^n b^n}: w = a^p b^p (forces y in a's only)
- L = palindromes: w = a^p b a^p
- L = {equal #a's #b's}: w = a^p b^p
```

---

## FRAMEWORK 3: Pumping Lemma (CFL) Proof

**Use when:** "Prove L is not context-free"

```
Step 1: "Assume for contradiction that L is CFL."
Step 2: "Let p be the CFL pumping length."
Step 3: "Choose w ∈ L with |w| ≥ p."
         → Choose so vxy cannot span all critical segments
Step 4: "w = uvxyz where |vxy| ≤ p, |vy| ≥ 1."
Step 5: "Case analysis: where can vxy fall?"
         → |vxy| ≤ p means it spans at most 2 adjacent blocks
         → Analyze each case (all in a's / spans a-b / all in b's / etc.)
Step 6: "In all cases, uv^i xy^i z ∉ L for i = [value]."
Step 7: "Contradiction. L is not CFL. ∎"

Classic choice:
- L = {a^n b^n c^n}: w = a^p b^p c^p
  → vxy can span ≤2 of {a,b,c} blocks
  → pumping changes ≤2 counts → third count differs → not equal
```

---

## FRAMEWORK 4: LL(1) Full Pipeline

**Use when:** "Build an LL(1) parser for grammar G"

```
Step 1: Eliminate left recursion (if any)
Step 2: Left factor (if needed)
Step 3: Compute Nullable set
Step 4: Compute First(X) for all X
Step 5: Compute Follow(A) for all non-terminals
Step 6: Build table T[A, a]:
         - a ∈ First(α) → T[A,a] = A→α
         - ε ∈ First(α) and b ∈ Follow(A) → T[A,b] = A→α
Step 7: Check for conflicts (>1 entry) → if conflict: NOT LL(1)
Step 8: Trace parse using stack: [S, $] + input w
         - Top = terminal: match and consume
         - Top = non-terminal: look up T[NT, lookahead] → push RHS (reversed)
Step 9: Accept when stack = [$] and input = $
```

---

## FRAMEWORK 5: CFG Simplification

**Use when:** "Simplify this CFG" / "Prepare for CNF conversion"

```
ALWAYS apply in this order:
1. Remove non-generating symbols
   → Mark all NTs that can reach terminal string
   → Delete rules with unmarked NTs
2. Remove non-reachable symbols
   → BFS from S; mark reachable NTs
   → Delete rules with unreachable NTs
3. Remove ε-productions
   → Find all nullable NTs (A →* ε)
   → For each rule with nullable NT: add versions with/without it
   → Delete all A → ε where A ≠ S
4. Remove unit productions
   → Find all A →* B chains
   → Replace A → B with all productions of B in A's rules
   → Delete A → B rules
```

---

## FRAMEWORK 6: CNF Conversion

**Use when:** "Convert to Chomsky Normal Form" / Before CYK algorithm

```
Prerequisites: apply CFG simplification first!

Step 1: Break long RHS (length > 2)
   A → B1B2B3...Bk becomes: A → B1X1; X1 → B2X2; ...; Xk-2 → Bk-1Bk

Step 2: Fix terminal-NT mixtures
   A → aB becomes: A → NaB; Na → a  (introduce terminal NT)
   A → aBC becomes: A → NaX1; X1 → BC; Na → a

Result: All rules are A → BC or A → a ✓
```

---

## FRAMEWORK 7: DFA Minimization (Mark-Reduce)

**Use when:** "Minimize this DFA" / "Find equivalent states"

```
Step 1: Remove inaccessible states (BFS from q0)
Step 2: Initialize: mark all (F, Q\F) pairs as distinguishable
Step 3: Iterate:
         For each unmarked pair (p, q):
           For each a ∈ Σ:
             If (δ(p,a), δ(q,a)) is marked:
               Mark (p, q)
Step 4: Repeat step 3 until no new pairs marked
Step 5: Merge all unmarked pairs into one state each
Step 6: Build new minimal DFA from equivalence classes
```

---

## FRAMEWORK 8: Shift-Reduce Parse Trace

**Use when:** "Trace LR parsing of string w"

```
Initialize: state stack = [0], symbol stack = []
At each step:
  s = top state; a = current input
  If action[s, a] = shift j:
    Push a to symbol stack; push j to state stack
    Advance input pointer
  If action[s, a] = reduce A → β:
    Pop |β| symbols/states
    s' = new top state
    Push A; goto[s', A] = new state; push new state
  If action[s, a] = accept: SUCCESS
  If no action: ERROR
```

---

## FRAMEWORK 9: Proving Language is in a Class

**Use when:** "Show L is [regular / CFL / CSL]"

```
To prove REGULAR:
  → Construct a DFA that accepts L
  → Write a RE that describes L
  → Write a right/left linear grammar for L

To prove CFL (but not regular):
  → Write a CFG that generates L
  → Prove not regular via PL or Myhill-Nerode

To prove CSL (but not CFL):
  → Prove not CFL via CFL PL (e.g., a^nb^nc^n)
  → Argue CSG can handle the dependencies

To prove NOT in any class:
  → Show cannot be decided by any TM (undecidable)
```

---

## DECISION TREE: WHICH FRAMEWORK TO USE

```
GIVEN a language, prove it's in a class?
└── Framework 9

GIVEN a language, prove it's NOT regular?
└── Framework 2 (PL regular)

GIVEN a language, prove it's NOT CFL?
└── Framework 3 (PL CFL)

GIVEN a grammar/regex, build a DFA?
└── Framework 1 (DFA Design)

GIVEN a grammar, minimize the DFA?
└── Framework 7 (Mark-Reduce)

GIVEN a grammar, build LL(1) parser?
└── Framework 4 (LL(1) pipeline)

GIVEN a grammar, convert to CNF?
└── Frameworks 5 then 6

GIVEN a table, trace shift-reduce parse?
└── Framework 8
```

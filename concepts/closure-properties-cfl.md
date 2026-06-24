---
name: closure-properties-cfl
description: CFLs closed under union/concat/star but NOT intersection/complement — key difference from regular languages
metadata:
  type: user
---

## definition

**Closure properties for Context-Free Languages (CFLs):**

| Operation | Closed? | Notes |
|-----------|---------|-------|
| Union | YES | L1 ∪ L2: new start S → S1 \| S2 |
| Concatenation | YES | New start S → S1 S2 |
| Kleene Star | YES | New start S → SS \| ε |
| Intersection | NO | Counterexample exists |
| Complement | NO | Would imply intersection (via De Morgan) |
| Intersection with Regular | YES | Critical and useful! |
| Reversal | YES | Reverse all productions |
| Homomorphism | YES | Apply to RHS of rules |

## proving NOT closed under intersection

**Counterexample:**
- L1 = {a^n b^n c^m | n,m ≥ 1} — CFL (a^n b^n matched by CFG; arbitrary c's)
- L2 = {a^m b^n c^n | n,m ≥ 1} — CFL (b^n c^n matched by CFG; arbitrary a's)
- L1 ∩ L2 = {a^n b^n c^n | n ≥ 1} — NOT CFL (proved by CFL pumping lemma)
- Therefore CFLs are NOT closed under intersection. ∎

## proving NOT closed under complement

If CFLs were closed under complement, then:
- L1 ∩ L2 = (L1' ∪ L2')' (De Morgan)
- Since closed under union and complement → would be closed under intersection
- But we just showed CFLs are NOT closed under intersection
- Contradiction → CFLs are NOT closed under complement. ∎

## intersection with regular languages (very important!)

**Theorem:** If L is CFL and R is regular, then L ∩ R is CFL.

**Proof idea:** Run PDA for L and DFA for R simultaneously.

**Why this matters:**
- Allows restricting a CFL to a regular subset
- Very useful in compiler design: the grammar defines structure (CFL), lexer defines tokens (regular), intersection gives valid programs
- Examples: restrict a CFL to strings over a specific alphabet (regular)

## proofs for closed operations

**Union:** Given G1 for L1 and G2 for L2:
- Introduce new start symbol S
- Add rules S → S1 | S2
- Result generates L1 ∪ L2

**Concatenation:** Given G1 for L1 and G2 for L2:
- Introduce new start symbol S
- Add rule S → S1 S2
- Result generates L1 · L2

**Kleene Star:** Given G for L:
- Introduce new start symbol S'
- Add rules S' → S' S | ε
- Result generates L*

## comparison table

| Operation | Regular | CFL |
|-----------|---------|-----|
| Union | YES | YES |
| Intersection | YES | NO |
| Complement | YES | NO |
| Concat | YES | YES |
| Kleene Star | YES | YES |
| ∩ Regular | YES | YES |

## applications

- Proving a language is NOT a CFL (using failure of closure properties)
- Constructing CFLs from simpler CFLs via union/concatenation/star
- Restricting CFLs to useful subsets via intersection with regular languages

## related concepts

- [[context-free-language]] — the class with these properties
- [[regular-language]] — has stronger closure properties
- [[pumping-lemma-cfl]] — alternative method for proving non-CFL-ness
- [[closure-properties-regular]] — comparison

## exam relevance
**high** — must know which operations close CFLs and which don't; counterexamples for non-closed operations

## project relevance
Understanding CFL non-closure under intersection explains why type checking (which is context-sensitive) cannot be reduced to CFG parsing alone. The regular ∩ CFL = CFL result is used in practice for token filtering.

---
**Scores:** Exam importance: 4/5 | Difficulty: 3/5 | Future usefulness: 4/5 | Project relevance: 3/5 | Interconnectedness: 4/5

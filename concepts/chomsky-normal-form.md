---
name: chomsky-normal-form
description: CNF — standardized CFG form where every rule is A→BC or A→a; enables algorithmic analysis and O(n³) membership testing
metadata:
  type: user
---

## definition

A CFG is in **Chomsky Normal Form (CNF)** if every production rule has one of these forms:
- A → BC (two non-terminals)
- A → a (single terminal)
- Optionally: S → ε (if ε ∈ L)

Where A, B, C ∈ V (non-terminals), a ∈ T (terminal), and B,C ≠ S.

## intuition

CNF imposes strict binary branching on the parse tree. This regularity makes the derivation of a string of length n take exactly 2n-1 steps — a predictable cost that enables efficient algorithms.

## why it exists

CNF enables:
1. **CYK algorithm**: O(n³) membership testing using dynamic programming
2. **Theoretical proofs**: many properties of CFLs proven assuming CNF
3. **Pumping Lemma proof**: uses CNF parse tree structure

**Every CFG has an equivalent CFG in CNF** (this is a theorem).

## Converting CFG to CNF

**Prerequisites** (do these first):
1. Remove useless symbols
2. Remove ε-productions
3. Remove unit productions
(See [[cfg-simplification]])

**CNF conversion steps:**

**Step 1: Fix long right-hand sides (length > 2)**
- A → B1 B2 B3 ... Bk (k > 2): introduce new non-terminals
- A → B1 X1, X1 → B2 X2, ..., Xk-2 → Bk-1 Bk

**Step 2: Fix rules with terminals mixed with non-terminals**
- A → aB or A → Ba: replace terminal a with new non-terminal Na
- Add rule Na → a

**Result:** All rules are A → BC or A → a (binary and pure).

## CYK Algorithm (Cocke-Younger-Kasami)

Dynamic programming membership algorithm for CNF grammars.
- Input: string w = a1a2...an, CFG G in CNF
- Build table T[i,j] = {A | A ⟹* ai...aj}
- Base case: T[i,i] = {A | A → ai ∈ P}
- Recursive: T[i,j] = {A | A → BC ∈ P, B ∈ T[i,k], C ∈ T[k+1,j] for some k}
- Accept: S ∈ T[1,n]
- Time: O(n³|G|)

## applications

- Parsing algorithms that require binary branching (CYK)
- Theoretical analysis of CFLs
- Proof of Pumping Lemma for CFLs (uses CNF parse tree height)
- Basis for chart parsing in NLP

## advantages

- Standardized: enables general-purpose algorithms
- Binary branching: parse trees are full binary trees — easy to analyze
- Every string of length n has derivation of exactly 2n-1 steps

## limitations

- CNF conversion can significantly increase the number of production rules
- Not always the most compact or human-readable form
- Not required for practical parsers (LL, LR don't require CNF)

## misconceptions

- CNF is not unique: there are multiple CNF grammars for the same language
- Converting to CNF does NOT change the language (same CFL, different grammar)
- CNF is required for CYK but NOT for LL or LR parsers

## related concepts

- [[cfg-simplification]] — prerequisite steps before CNF conversion
- [[context-free-grammar]] — parent concept
- [[pumping-lemma-cfl]] — proof uses CNF parse tree structure
- [[context-free-language]] — CNF characterizes what CFG can generate
- [[parsing]] — CYK is a parsing algorithm using CNF

## examples

**Convert:** S → ABc | aB, A → aA | ε, B → bB | b

**After removing ε-production (A is nullable):**
- S → ABc | Bc | aB
- A → aA | a
- B → bB | b

**After CNF conversion:**

Step 1: Fix S → ABc (length 3):
- S → AX1, X1 → Bc... wait, need to handle 'c' terminal too

Step 2: Replace terminals in mixed rules:
- Introduce Nc → c, Na → a, Nb → b
- S → AX1, X1 → BNc
- S → BNc (from S → Bc, which is length 2 with terminal — replace: S → BNc)
- S → NaB (from S → aB — replace 'a' with Na)
- A → NaA | Na
- B → NbB | Nb

**Final CNF:**
- S → AX1 | BNc | NaB
- X1 → BNc
- A → NaA | Na
- B → NbB | Nb
- Na → a, Nb → b, Nc → c

## exam relevance
**high** — converting to CNF step-by-step is a classic exam question; understanding why CNF enables O(n³) membership

## project relevance
CNF and CYK are used in chart parsers for NLP. Understanding CNF helps with theoretical analysis of language complexity and with implementing the CYK algorithm for arbitrary grammars.

---
**Scores:** Exam importance: 4/5 | Difficulty: 4/5 | Future usefulness: 4/5 | Project relevance: 3/5 | Interconnectedness: 4/5

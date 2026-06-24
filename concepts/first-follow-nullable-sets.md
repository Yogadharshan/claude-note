---
name: first-follow-nullable-sets
description: Three fundamental sets for LL(1) table construction — Nullable tells if ε-derivable, First tells what can start a derivation, Follow tells what comes after
metadata:
  type: user
---

## definition

Three sets computed for each non-terminal in a grammar, required for building LL(1) parsing tables:

**Nullable(A):** True if non-terminal A can derive the empty string (A ⟹* ε)

**First(X):** Set of terminals that can appear as the first symbol of any string derived from X. (X can be terminal, non-terminal, or string of symbols)

**Follow(A):** Set of terminals (including $) that can appear immediately to the right of A in some sentential form derived from S.

## intuition

- **Nullable**: "Can this non-terminal disappear?" If A is nullable, we might skip it
- **First**: "What could I see next if I'm about to expand X?" Drives lookahead decisions
- **Follow**: "What comes after A once it's been fully expanded?" Used when A → ε (epsilon production)

## why it exists

For LL(1) parsing: when the parser sees non-terminal A on top of stack and lookahead symbol 'a', it needs to know WHICH production A → α to apply. The decision is based on:
- If a ∈ First(α): apply A → α
- If α can derive ε and a ∈ Follow(A): apply A → ε (or the ε-producing production)

## Nullable Algorithm

```
Nullable = ∅
For each A → ε in P: add A to Nullable
Repeat:
  For each A → Y1Y2...Yk in P:
    If all Yi ∈ Nullable: add A to Nullable
Until no change
```

## First Set Algorithm

**For a terminal a:** First(a) = {a}

**For a non-terminal A:**
```
First(A) = ∅
Repeat:
  For each production A → Y1Y2...Yk:
    Add First(Y1) to First(A)
    If Y1 ∈ Nullable: add First(Y2) to First(A)
    If Y1, Y2 ∈ Nullable: add First(Y3) to First(A)
    ...
    If all Y1...Yk ∈ Nullable: add ε to First(A)
Until no change
```

**For a string α = Y1Y2...Yk:**
- First(α) = First(Y1) ∪ (if Y1 nullable: First(Y2)) ∪ ...
- Include ε only if ALL Yi are nullable

## Follow Set Algorithm

```
Follow(S) = {$}  // Start symbol always has $ in Follow
Repeat:
  For each production A → αBβ:
    Add First(β)\{ε} to Follow(B)
    If ε ∈ First(β): add Follow(A) to Follow(B)
  For each production A → αB:
    Add Follow(A) to Follow(B)
Until no change
```

## Building the LL(1) Table

For each production A → α:
1. For each a ∈ First(α): add A → α to T[A, a]
2. If ε ∈ First(α): for each b ∈ Follow(A): add A → α to T[A, b]

**Conflict:** multiple entries in T[A, a] → grammar is NOT LL(1)

## applications

- LL(1) table construction (primary use)
- LALR and LR parser generators also use First/Follow
- Can detect grammar conflicts before building the full parser

## advantages

- Algorithmic: computable from the grammar automatically
- Enable conflict detection at grammar level
- Used by parser generators (ANTLR, bison)

## limitations

- Follow sets are less precise than lookahead sets in LALR(1) (can cause spurious conflicts)
- Computing these sets requires the full grammar upfront

## misconceptions

- First set applies to STRINGS of symbols (not just single non-terminals): compute carefully when string starts with nullable symbols
- Follow(A) does NOT include ε (Follow is always a set of terminals and $, never ε)
- $ (end marker) is in Follow(S) by definition, and propagates through Follow rules

## related concepts

- [[ll1-parsing]] — the primary use of these sets
- [[context-free-grammar]] — the grammar these sets are computed from
- [[ambiguity-cfg]] — conflicts in the table often indicate ambiguity
- [[recursive-descent-parsing]] — look-ahead informally used here becomes formal in LL(1)
- [[parsing]] — First/Follow sets are the mathematical foundation for all predictive parsing
- [[derivation]] — Nullable/First defined in terms of what a non-terminal can derive
- [[grammar-hierarchy]] — LL(1) grammars (needing these sets) are a strict subset of LR grammars

## examples

**Grammar:**
- S → AB
- A → aA | ε
- B → b

**Nullable:** A is nullable (A → ε). S and B are not.

**First sets:**
- First(A) = {a, ε} (a from A→aA, ε because A is nullable)
- First(B) = {b}
- First(S) = First(A) ∪ (A nullable? yes) ∪ First(B) = {a, b}

**Follow sets:**
- Follow(S) = {$}
- Follow(A) = First(B) = {b} (because S → AB: A is followed by B)
- Follow(B) = Follow(S) = {$} (B is last in S → AB)

**Table:**

| | a | b | $ |
|-|---|---|---|
| S | S→AB | S→AB | |
| A | A→aA | A→ε | |
| B | | B→b | |

No conflicts → grammar IS LL(1)!

---

**Example 2 with conflict:**
- S → aA | a (two productions for S starting with 'a')
- T[S, a] would have BOTH S→aA and S→a → CONFLICT → NOT LL(1)

## exam relevance
**very high** — computing First/Follow/Nullable sets is a standard exam question before building LL(1) tables

## project relevance
Parser generators (ANTLR, yacc, bison) compute these sets automatically. Understanding them helps debug parser conflicts and design LL-compatible grammars.

---
**Scores:** Exam importance: 5/5 | Difficulty: 4/5 | Future usefulness: 4/5 | Project relevance: 4/5 | Interconnectedness: 5/5

---
name: ll1-parsing
description: LL(1) — predictive top-down parser using one look-ahead symbol and a parsing table; no backtracking
metadata:
  type: user
---

## definition

**LL(1) parsing** is a top-down parsing method where:
- **L**: left-to-right scan of input
- **L**: leftmost derivation
- **(1)**: one symbol of look-ahead

The parser uses a **predictive parsing table** T[A, a] to determine which production to apply when non-terminal A is on the stack and 'a' is the next input symbol. No backtracking required.

## why it exists

Recursive descent parsers may backtrack, leading to exponential worst-case complexity. LL(1) eliminates backtracking by looking one symbol ahead to make a unique parsing decision at each step.

## Components

1. **Parsing stack**: starts with [S, $]
2. **Input**: string w followed by $ (end marker)
3. **Parsing table** T[A, a]: maps (non-terminal, lookahead) → production rule

## Parsing Algorithm

```
Initialize stack: [S, $]
Read first input symbol a
While stack ≠ [$]:
  Let X = top of stack, a = current input
  If X is terminal:
    If X == a: pop X, advance input
    Else: error
  Else (X is non-terminal):
    If T[X, a] = X → α: pop X, push α in reverse order
    Else: error
If stack == [$] and input == $: ACCEPT
```

## Building First, Follow, Nullable Sets

**Nullable(A):** True if A can derive ε
- A → ε: mark A nullable
- A → Y1Y2...Yk: mark A nullable if all Yi are nullable

**First(X):** terminals that can appear as first symbol of strings derived from X
- Terminal a: First(a) = {a}
- Non-terminal A → Y1Y2...Yk: add First(Y1); if Y1 nullable, add First(Y2); etc.
- If A →* ε: add ε to First(A)

**Follow(A):** terminals that can appear immediately after A in a valid sentential form
- Add $ to Follow(S)
- If B → αAβ: add First(β)\{ε} to Follow(A)
- If B → αA or β can derive ε: add Follow(B) to Follow(A)

## Table Construction Algorithm

For each production A → α:
1. For each terminal a ∈ First(α): add A → α to T[A, a]
2. If ε ∈ First(α): for each b ∈ Follow(A): add A → α to T[A, b]
3. If $ ∈ Follow(A) and ε ∈ First(α): add A → α to T[A, $]

**LL(1) conflict:** if any table entry has more than one production → grammar is not LL(1)

## LL(1) Conflicts and Causes

| Conflict Type | Cause | Fix |
|--------------|-------|-----|
| First/First conflict | Two productions share a First terminal | Left factor the grammar |
| First/Follow conflict | ε-production and another production share a terminal | Refactor or rewrite |
| Left recursion | A → Aα causes infinite loop | Eliminate left recursion |
| Ambiguity | Grammar is ambiguous | Rewrite grammar |

## Conflict Resolution

**Left Factoring:** A → αβ1 | αβ2 becomes A → αA', A' → β1 | β2
**Left Recursion Elimination:** A → Aα | β becomes A → βA', A' → αA' | ε
**LLK:** if LL(1) insufficient, look k symbols ahead

## LL(1) vs Recursive Descent

| Feature | Recursive Descent | LL(1) |
|---------|-----------------|-------|
| Backtracking | Possible | None |
| Look-ahead | None (or ad hoc) | Exactly 1 |
| Table | None | Parsing table |
| Conflicts | Grammar-dependent | Explicit detection |

## applications

- Simple language interpreters and DSL parsers
- Hand-written or tool-generated parsers for LL(1) grammars
- Teaching parsers (most understandable approach)

## advantages

- O(n) parsing time (no backtracking)
- Clear conflict detection during table construction
- Direct implementation in code
- Easy to understand and debug

## limitations

- Cannot parse left-recursive grammars
- Cannot parse all CFLs (only LL(1) subset)
- Grammar must be transformed before LL(1) table construction
- Some LL conflicts cannot be resolved without changing the language

## misconceptions

- LL(1) ≠ recursive descent: LL(1) uses a table; recursive descent may not
- A grammar with no conflicts in the LL(1) table is LL(1) — but many grammars are NOT LL(1)
- Resolving conflicts by grammar transformation may change the language slightly (must verify)

## related concepts

- [[first-follow-nullable-sets]] — prerequisites for table construction
- [[recursive-descent-parsing]] — simpler predecessor; LL(1) is more rigorous
- [[context-free-grammar]] — what LL(1) parses
- [[ambiguity-cfg]] — ambiguous grammars cannot be LL(1)
- [[grammar-hierarchy]] — LL(1) vs LR(0) vs LR(1) power comparison
- [[lr0-parsing]] — more powerful bottom-up alternative

## examples

**Grammar:** S → AB, A → aA | ε, B → b

**First(A)** = {a, ε}, **First(B)** = {b}, **First(S)** = {a, b}
**Follow(A)** = First(B) = {b}
**Nullable(A)** = true, **Nullable(B)** = false, **Nullable(S)** = false

**Table:**

| | a | b | $ |
|--|---|---|---|
| S | S→AB | S→AB | |
| A | A→aA | A→ε | |
| B | | B→b | |

**Parsing "ab$":**
1. Stack [S,$], input: a → S→AB: Stack [A,B,$]
2. Stack [A,B,$], input: a → A→aA: Stack [a,A,B,$]
3. Stack [a,B,$], input: a → match 'a': Stack [A,B,$], input: b
4. Stack [A,B,$], input: b → A→ε: pop A: Stack [B,$]
5. Stack [B,$], input: b → B→b: Stack [b,$]
6. Stack [b,$], input: b → match 'b': Stack [$], input: $
7. Accept!

## exam relevance
**very high** — table construction, First/Follow computation, and tracing parsing steps are all common exam questions

## project relevance
LL(1) parsers are used in many real language tools. Understanding them helps with ANTLR (LL(*)), yacc/bison (LR), and any situation where you need to build a parser for a DSL.

---
**Scores:** Exam importance: 5/5 | Difficulty: 4/5 | Future usefulness: 5/5 | Project relevance: 4/5 | Interconnectedness: 5/5

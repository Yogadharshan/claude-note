---
name: parse-tree
description: Tree representation of a CFG derivation — root=S, internal nodes=non-terminals, leaves=terminals forming the string
metadata:
  type: user
---

## definition

A **parse tree** for a string w with respect to a CFG G is a rooted labeled tree where:
- **Root** is labeled with S (start symbol)
- **Internal nodes** are labeled with non-terminals from V
- **Leaves** are labeled with terminals from T (or ε for empty productions)
- **Children of a node A** correspond to right-hand side of a production A → α
- **Reading leaves left-to-right** gives the derived string w

## intuition

A parse tree shows the hierarchical structure of a string according to the grammar. It's a "proof" that the string belongs to the language — and reveals HOW the string was built.

## why it exists

Parse trees make derivation visual and unambiguous. They:
- Show the syntactic structure of the string
- Enable semantic analysis (each subtree = a meaningful unit)
- Make ambiguity visible (two different parse trees for same string = ambiguity)

## relation to derivation

A parse tree corresponds to an equivalence class of derivations:
- Leftmost derivation → top-down, left-first expansion of the parse tree
- Rightmost derivation → top-down, right-first expansion of the same parse tree
- **One parse tree = one unique leftmost derivation = one unique rightmost derivation**

## ambiguity connection

A grammar is **ambiguous** ↔ some string has more than one parse tree.

This is important: different parse trees → different structural interpretations → different meanings. For example, "3 + 4 * 5" with an ambiguous grammar might give two parse trees: one computing (3+4)*5=35, another computing 3+(4*5)=23.

## applications

- **Compilers**: parse tree built by parser; later used for semantic analysis and code generation
- **NLP**: sentence structure trees (constituent parse trees)
- **XML/HTML**: document tree IS a parse tree
- **Interpreters**: evaluate expression by traversing the parse tree

## applications (computing parse trees)

| Method | Builds | Direction |
|--------|--------|-----------|
| Recursive Descent | Implicit tree | Top-down |
| LL(1) Parser | Explicit or implicit | Top-down |
| LR(0)/LR(1) | Explicit | Bottom-up |

## advantages

- Visual: immediately shows structure
- Unambiguous: one tree = one interpretation (if grammar is unambiguous)
- Foundation for semantic analysis

## limitations

- For ambiguous grammars, multiple parse trees = undefined interpretation
- Large trees for long inputs (use AST = Abstract Syntax Tree in practice)
- Building the full parse tree takes O(n) space

## misconceptions

- Parse tree ≠ derivation: multiple different derivations can correspond to the same parse tree (but same tree = same structure)
- Leftmost and rightmost derivations BOTH correspond to the SAME parse tree for an unambiguous grammar
- AST (abstract syntax tree) is a simplified parse tree — not identical

## related concepts

- [[context-free-grammar]] — provides the grammar rules
- [[derivation]] — the sequential process; parse tree is the visual form
- [[ambiguity-cfg]] — two parse trees for one string = ambiguous grammar
- [[parsing]] — the process of building the parse tree from input
- [[recursive-descent-parsing]] — top-down parse tree construction
- [[ll1-parsing]] — predictive top-down tree construction
- [[lr0-parsing]] — bottom-up tree construction

## examples

**Grammar:** S → aSb | ab

**String:** "aabb"

**Parse Tree:**
```
      S
    / | \
   a  S  b
    / | \
   a  ε  b
```
More precisely:
```
    S
   /|\
  a  S  b
    /|\
   a  b
```
This shows S → aSb → aabb (applying S → ab in the inner S).

**Arithmetic:** E → E+T | T, T → T*F | F, F → id | (E)

For "id + id * id":
```
        E
      / | \
     E  +   T
     |     /|\
     T     T * F
     |     |   |
     F     F   id
     |     |
     id    id
```
This correctly gives id + (id * id) structure, with * binding tighter than +.

## exam relevance
**high** — drawing parse trees and identifying ambiguity are common exam questions

## project relevance
Every compiler you build must construct parse trees (or ASTs). Understanding parse tree structure is fundamental to implementing evaluation, type checking, and code generation.

---
**Scores:** Exam importance: 4/5 | Difficulty: 3/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 4/5

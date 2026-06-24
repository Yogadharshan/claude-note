---
name: grammar-hierarchy
description: Hierarchy of parser classes (LL vs LR) — LL(k) ⊂ LR(0) ⊂ LR(1); LR is more powerful and bottom-up
metadata:
  type: user
---

## definition

The **LL/LR parser hierarchy** classifies parsing algorithms by the grammars they can handle:

```
LL(1) ⊂ LL(2) ⊂ ... ⊂ LL(k) ⊂ ... ⊂ LLK
LR(0) ⊂ LR(1) ⊂ LR(2) ⊂ ... ⊂ LRK

LL(1) ⊂ LR(0)
LLK ⊂ LRK
```

## overview table

| Parser | Direction | Derivation | Lookahead | Handles Left Recursion |
|--------|-----------|------------|-----------|----------------------|
| LL(1) | Top-down | Leftmost | 1 symbol | NO |
| LL(k) | Top-down | Leftmost | k symbols | NO |
| LR(0) | Bottom-up | Rightmost (reversed) | 0 | YES |
| LR(1) | Bottom-up | Rightmost (reversed) | 1 | YES |
| LR(k) | Bottom-up | Rightmost (reversed) | k | YES |

## LLK Grammars

- **Top-down parsers**
- Read input left-to-right, produce leftmost derivation
- Use k look-ahead symbols
- Cannot handle left recursion (must eliminate first)
- More restrictive than LRK
- Easier to implement by hand; understand more naturally
- LL(1) most common; LL(2)+ rarely used (table size grows exponentially)
- Example tools: ANTLR (LL(*)), JavaCC

**Key limitation:** A grammar with left recursion CANNOT be parsed by any LLK parser.

## LRK Grammars

- **Bottom-up parsers**
- Read input left-to-right, construct rightmost derivation in reverse
- k look-ahead symbols for reduce decisions
- Handle left recursion naturally
- More expressive than LLK (every LLK grammar is also LRK, not vice versa)
- Complex to implement by hand; always use generator tools
- LR(1) handles virtually all practical programming languages
- Example tools: yacc, bison, GNU Bison

## practical grammar class hierarchy

```
LL(1) ⊂ LL(2) ⊂ ... ⊂ LLK
LL(1) ⊂ LR(0) ⊂ LR(1) ⊂ LALR(1) ≈ LR(1) ⊂ LRK ⊂ All deterministic CFLs
```

**LALR(1):** merged LR(1) — slightly less powerful than LR(1) but much smaller tables; used by yacc/bison

## key differences

**LL parsers:**
- Simpler to implement (recursive descent is LL by nature)
- Grammar transformations often needed (eliminate left recursion, left factor)
- Better error messages (know what was expected)
- Natural for top-down mental model

**LR parsers:**
- Handle more grammars without transformation
- More powerful (LL(1) ⊂ LR(0) strictly)
- Complex tables; always tool-generated
- Better conflict detection via separate shift-reduce/reduce-reduce categories

## resolving conflicts

| Conflict | In LL | In LR |
|----------|-------|-------|
| Left recursion | Infinite loop | Natural handling |
| Shift-Reduce | First/Follow conflict | Resolved by lookahead |
| Reduce-Reduce | Not applicable | Indicates grammar ambiguity |

## applications

- Compiler front-ends: choose LR for production compilers (C, C++, Java all use LALR/LR parsers)
- Simple DSLs: LL(1) sufficient; recursive descent easy to write
- Tool selection: choose based on grammar complexity and team expertise

## related concepts

- [[ll1-parsing]] — key LL parser
- [[lr0-parsing]] — simplest LR parser
- [[shift-reduce-parsing]] — conceptual basis of LR
- [[context-free-language]] — what all these parsers recognize (a subset)
- [[recursive-descent-parsing]] — informal LL parser

## exam relevance
**high** — comparing LL vs LR, class inclusion relationships

## project relevance
Architecture decision: LL for hand-written parsers; LR for tool-generated parsers of complex languages. Wrong choice leads to grammar refactoring pain.

---
**Scores:** Exam importance: 4/5 | Difficulty: 3/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 5/5

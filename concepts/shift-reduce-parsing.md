---
name: shift-reduce-parsing
description: Bottom-up parsing technique with 4 actions (shift/reduce/accept/error) — foundation for all LR parsers
metadata:
  type: user
---

## definition

**Shift-Reduce Parsing** is a bottom-up parsing strategy that:
- Starts from the input string
- Reduces substrings to non-terminals (in reverse rightmost derivation)
- Accepts when the entire input reduces to the start symbol S

## four actions

| Action | When | What happens |
|--------|------|--------------|
| **Shift** | Next input should be pushed | Move input symbol onto stack; advance input |
| **Reduce** | Top of stack matches RHS of some production | Pop RHS; push LHS (the non-terminal) |
| **Accept** | Stack = start symbol, input = $ | Parsing successful |
| **Error** | No valid action | Report syntax error |

## intuition

Bottom-up = build from leaves to root. You keep "shifting" (collecting) input symbols until you recognize the right-hand side of some production, then "reduce" it to the left-hand side. Repeat until the entire input collapses to S.

## why it exists

LLK parsers cannot handle left recursion and are limited in grammar coverage. Shift-reduce parsers:
- Handle left recursion naturally
- Cover a larger class of grammars
- Are the basis for LALR(1) (used by yacc/bison — practical compiler tools)

## top-down vs bottom-up

| Feature | Top-Down (LL) | Bottom-Up (LR/SR) |
|---------|--------------|------------------|
| Direction | S → ... → w | w → ... → S |
| Derivation | Leftmost | Rightmost (in reverse) |
| Left recursion | Cannot handle | Handles naturally |
| Grammars covered | LLK ⊂ LRK | Larger class |
| Complexity | Simpler parser | More complex table |

## conflicts

**Shift-Reduce conflict:** parser can either shift the next input OR reduce the current stack top
- Resolved by: look-ahead symbol (LR(1)), operator precedence rules, or grammar rewrite

**Reduce-Reduce conflict:** two different production rules could reduce the current stack top
- Harder to resolve; usually indicates grammar ambiguity

## relationship to LR parsing

Shift-reduce parsing is the conceptual model. **LR(k) parsers** are specific implementations:
- LR(0): no look-ahead for reduce decisions
- LR(1): 1 look-ahead symbol
- LALR(1): merged LR(1) states (practical compromise, used in yacc/bison)

The **LR parsing table** (action + goto) encodes when to shift vs reduce.

## example

**Grammar:** E → E + T | T, T → id

**Parsing "id + id":**
```
Stack          Input        Action
[]             id+id$       Shift
[id]           +id$         Reduce T → id
[T]            +id$         Reduce E → T
[E]            +id$         Shift +
[E+]           id$          Shift
[E+id]         $            Reduce T → id
[E+T]          $            Reduce E → E+T
[E]            $            Accept
```

## applications

- Compilers for C, C++, Java (yacc/bison output)
- SQL parsers
- Any language with complex grammar requiring LR parsing

## related concepts

- [[lr0-parsing]] — simplest LR parser using shift-reduce
- [[context-free-grammar]] — what shift-reduce parsers parse
- [[grammar-hierarchy]] — LR parsers in the grammar class hierarchy
- [[ll1-parsing]] — competing top-down approach
- [[parse-tree]] — shift-reduce builds it bottom-up (right-most derivation reversed)

## exam relevance
**high** — tracing shift-reduce steps is a common exam question; understanding actions

## project relevance
yacc/bison generate LALR(1) parsers (shift-reduce based). Most production compilers use shift-reduce parsing. Understanding this model is prerequisite for using or debugging yacc/bison.

---
**Scores:** Exam importance: 4/5 | Difficulty: 4/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 4/5

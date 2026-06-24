---
name: lr0-parsing
description: Simplest bottom-up LR parser — zero look-ahead, uses DFA of LR(0) items, action/goto tables; basis for all LR parsers
metadata:
  type: user
---

## definition

**LR(0) parsing** is a bottom-up parsing technique:
- **L**: left-to-right scan of input
- **R**: rightmost derivation in reverse
- **(0)**: zero look-ahead symbols

The parser uses a DFA of **LR(0) items** to guide shift/reduce decisions based solely on the current state (no look-ahead).

## LR(0) Items

An LR(0) item is a production rule with a **dot** (•) indicating the current parsing position.

For production E → E + T, the items are:
- E → •E + T (haven't parsed anything yet)
- E → E• + T (have recognized E)
- E → E +• T (have recognized E+)
- E → E + T• (have recognized E+T; ready to reduce)

**Closure:** Add items for any non-terminal to the right of the dot.
**Goto(I, X):** Move dot past X for all items with X right of dot; take closure.

## The Four Actions

| Action | Condition | Effect |
|--------|-----------|--------|
| **Shift** | Dot is before a symbol | Move input symbol onto stack; transition to new state |
| **Reduce** | Dot is at end of item (A → α•) | Pop |α| symbols; push A; use GOTO to find next state |
| **Accept** | Start rule S' → S• and input is $ | Parsing successful |
| **Error** | No valid action | Syntax error |

## LR(0) Table Structure

**Action Table** [state, terminal]: shift sN, reduce rN, accept, error
**GOTO Table** [state, non-terminal]: next state after reduction

## Table Construction Algorithm

1. **Augment grammar**: Add S' → S (new start rule)
2. **Build initial item set** I0: closure({S' → •S})
3. **Build all item sets** using GOTO transitions
4. **Fill action table:**
   - If A → α•aβ ∈ Ii and GOTO(Ii, a) = Ij: action[i, a] = shift j
   - If A → α• ∈ Ii (A ≠ S'): action[i, *] = reduce A → α (for all terminals)
   - If S' → S• ∈ Ii: action[i, $] = accept
5. **Fill goto table:** GOTO(Ii, A) = Ij for non-terminals A

## Conflicts

**Shift-Reduce conflict:** A state has both a shift action and a reduce action for the same terminal.
**Reduce-Reduce conflict:** A state has two different reduce actions.

If conflicts exist → grammar is NOT LR(0). Often requires LR(1) to resolve.

## Parsing Algorithm

```
Initialize: state stack = [0], symbol stack = []
While true:
  s = top of state stack
  a = current input symbol
  If action[s, a] = shift j:
    Push symbol a and state j
    Advance input
  Elif action[s, a] = reduce A → β:
    Pop |β| states/symbols from stacks
    s' = top of state stack
    Push A and goto[s', A]
  Elif action[s, a] = accept: return success
  Else: error
```

## advantages

- More powerful than LL(1): can handle left-recursive grammars naturally
- Bottom-up: defers decisions until more context is seen
- Basis for LALR(1) which is widely used in practice

## limitations

- Cannot handle all CFLs (only LR(0) grammars — a strict subset)
- No look-ahead: prone to reduce-reduce conflicts
- Table construction is complex compared to LL(1)
- Error messages can be cryptic

## LR(0) vs LR(1)

| Feature | LR(0) | LR(1) |
|---------|-------|-------|
| Look-ahead | 0 (none) | 1 symbol |
| Reduce conflicts | Common | Fewer |
| Grammar coverage | LR(0) grammars | LR(1) grammars |
| Item form | A → α•β | [A → α•β, a] where a = lookahead |

## misconceptions

- LR(0) does NOT mean "no look-ahead ever" — shift still depends on current input symbol
- LR(0) means no look-ahead for REDUCE decisions specifically
- LR parsers build rightmost derivation in REVERSE — reading left-to-right but reducing right-first

## related concepts

- [[shift-reduce-parsing]] — LR(0) is a specific shift-reduce parser
- [[context-free-grammar]] — what LR(0) parses
- [[grammar-hierarchy]] — LL ⊂ LR class hierarchy
- [[ll1-parsing]] — contrasting top-down approach
- [[parse-tree]] — LR(0) builds it bottom-up

## examples

**Grammar (augmented):** S' → S, S → A, A → aA | B, B → b

**State I0:** closure({S' → •S}) = {S' → •S, S → •A, A → •aA, A → •B, B → •b}

**Goto(I0, a):** {A → a•A, A → •aA, A → •B, B → •b} = I1
**Goto(I0, b):** {B → b•} = I2 → reduce B → b
**Goto(I0, A):** {S → A•} = I3 → reduce S → A
**Goto(I0, B):** {A → B•} = I4 → reduce A → B
**Goto(I0, S):** {S' → S•} = I5 → accept

**Parsing "ab":**
1. Stack: [0], input: ab$
2. State 0, 'a' → shift I1: Stack: [0,1], input: b$
3. State 1, 'b' → shift I2: Stack: [0,1,2], input: $
4. State 2 → reduce B → b: pop 1 state, push B, goto[1,B]=I4: Stack: [0,1,4]
5. State 4 → reduce A → B: pop 1, push A, goto[1,A]=... (continue to ACCEPT)

## exam relevance
**high** — LR(0) item construction, table filling, and step-by-step parsing traces are common exam questions

## project relevance
LR(0) is the foundation for LALR(1) (used in yacc/bison). Understanding LR(0) makes understanding real parser generators much easier.

---
**Scores:** Exam importance: 4/5 | Difficulty: 5/5 | Future usefulness: 4/5 | Project relevance: 4/5 | Interconnectedness: 4/5

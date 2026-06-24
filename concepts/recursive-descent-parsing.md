---
name: recursive-descent-parsing
description: Top-down parsing technique where each non-terminal maps to a recursive function; simple but cannot handle left recursion
metadata:
  type: user
---

## definition

**Recursive Descent Parsing** is a top-down parsing technique where:
- Each non-terminal in the grammar corresponds to one recursive function in the parser
- Functions call each other to match production rules against input tokens
- The parser consumes input tokens one at a time until all tokens are processed

## intuition

The grammar structure IS the code structure. If the grammar says S → aB, the function `parse_S()` matches 'a' then calls `parse_B()`. The recursion in the grammar becomes recursion in the code.

## why it exists

Recursive descent parsers are:
- Easy to write by hand (directly from grammar)
- Easy to understand (code mirrors grammar)
- Suitable for simple grammars (many scripting languages, config parsers)

## Three Key Steps (professor emphasis)

1. Each non-terminal → one recursive function
2. Functions call each other to match production rules against input tokens
3. Parser consumes tokens one by one; applies grammar production until all input consumed

## Key Concepts

**Terminal matching:**
- Terminal symbols are matched against current input character
- If match: consume (advance input pointer), continue
- If no match: return false (or trigger error)

**Non-terminal call:**
- Call the corresponding function recursively
- If returns true: continue; if false: try another production or fail

**Empty production (ε):**
- Return true without consuming anything
- Used when no terminal matches current input but ε is a valid production

## Implementation in C

```c
// Grammar: S → aA, A → aA | ε
char *input;
int pos;

char current() { return input[pos]; }
void consume(char c) { if (current() == c) pos++; else error(); }

bool parse_A() {
    if (current() == 'a') { consume('a'); return parse_A(); }
    return true;  // ε production
}

bool parse_S() {
    consume('a');
    return parse_A();
}

bool parse(char *s) {
    input = s; pos = 0;
    return parse_S() && current() == '\0';
}
```

## Issues and Fixes

**Issue 1: Left Recursion**

A → Aα (function calls itself immediately → infinite recursion)

**Fix: Eliminate left recursion** (see [[ll1-parsing]])
- A → Aα | β becomes: A → βA', A' → αA' | ε

**Issue 2: Ambiguity / Operator Precedence**

Ambiguous grammar → parser cannot decide which production to apply

**Fix: Rewrite grammar** to encode precedence through non-terminal stratification

**Issue 3: Left Factoring**

A → αβ1 | αβ2 (two productions start with same prefix α → parser can't decide)

**Fix: Left factoring** — A → αA', A' → β1 | β2

## Drawbacks

| Drawback | Impact | Solution |
|----------|--------|---------|
| Cannot handle left recursion | Infinite loop/crash | Eliminate left recursion |
| Struggles with ambiguity | May explore exponential paths | Rewrite grammar / use LL(1) |
| Backtracking overhead | Exponential worst case | Look-ahead (LL1) or grammar rewrite |
| Limited to LL(1) grammars | Cannot handle all CFLs | Use LR parser |
| Poor error handling | Unclear error messages | Add error recovery logic |

## advantages

- Simple to implement directly from grammar
- Easy to debug and understand
- Good for small, well-structured grammars
- No separate table construction needed

## limitations

- Cannot handle left recursion at all
- Performance degrades with backtracking
- Cannot parse all context-free languages (only LL1 subset)

## misconceptions

- Recursive descent is NOT the same as LL(1) — RD can do some backtracking; LL(1) is predictive (no backtracking)
- Removing left recursion does NOT change the language (just the grammar form)
- Left factoring is different from left recursion — factoring handles common prefixes

## related concepts

- [[parsing]] — parent concept; recursive descent is one strategy
- [[context-free-grammar]] — the grammar being parsed
- [[ll1-parsing]] — predictive, no-backtracking version of top-down parsing
- [[ambiguity-cfg]] — ambiguous grammars cause backtracking
- [[parse-tree]] — recursive descent implicitly builds a parse tree
- [[ll1-parsing]] — left factoring and left recursion elimination both covered there

## examples

**Grammar:** E → E + T | T, T → id

**Problem:** E is left-recursive → fix:
- E → TE'
- E' → +TE' | ε
- T → id

**Recursive descent parser:**
```c
bool parse_E() { return parse_T() && parse_E_prime(); }
bool parse_E_prime() {
    if (current() == '+') { consume('+'); return parse_T() && parse_E_prime(); }
    return true;  // ε
}
bool parse_T() { consume_id(); return true; }
```

**Trace for input "id + id":**
- parse_E() → parse_T() → consume "id" ✓ → parse_E_prime()
- parse_E_prime() → sees '+' → consume '+' → parse_T() → consume "id" ✓ → parse_E_prime()
- parse_E_prime() → sees $ (end) → return true (ε)
- Accept!

## exam relevance
**high** — writing recursive descent parsers, identifying left recursion, left factoring

## project relevance
Hand-written parsers for simple DSLs, config files, and expression evaluators typically use recursive descent. It's the most common technique for programming language parsing when grammar is simple.

---
**Scores:** Exam importance: 4/5 | Difficulty: 3/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 4/5

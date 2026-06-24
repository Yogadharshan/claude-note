---
name: lexical-analyzer
description: First phase of a compiler — reads source code character by character and outputs a token stream using DFAs
metadata:
  type: user
---

## definition

A **lexical analyzer** (lexer/scanner) is the first phase of a compiler. It reads source code character by character, groups characters into tokens (the smallest meaningful units), and passes the token stream to the parser.

## intuition

The lexer is like a human reading a sentence word by word before understanding its grammar. "int x = 5;" becomes [KEYWORD:int] [ID:x] [OP:=] [NUM:5] [DELIM:;] — a structured stream that the parser can process grammatically.

## why it exists

Parsing character streams directly is complex and slow. The lexer:
- Handles low-level details (whitespace, comments, character encoding)
- Produces a cleaner, higher-level token stream for the parser
- Separates two concerns: "what characters form meaningful units?" vs "how do units combine grammatically?"

## Compiler Pipeline

```
Source Code → [Lexical Analyzer] → Token Stream → [Parser] → Parse Tree → [Semantic Analyzer] → IR → [Back-end]
```

## How Lexical Analysis Works

1. Define a **Regular Expression** for each token type
2. Build a **DFA** for each RE
3. **Combine** all DFAs into one large DFA
4. Implement the combined DFA (switch-case or table-driven)
5. Apply **longest match principle** to resolve ambiguities

## Longest Match Principle (professor emphasis)

When multiple tokens could start at the current position, always return the LONGEST valid token.

Example: "int123"
- "int" could be KEYWORD
- "int123" is a longer IDENTIFIER
- → Return IDENTIFIER("int123")

## Dead State / Backtracking

- **Dead state**: state from which no accepting state is reachable
- On reaching dead state: return the last accepted token, backtrack input pointer
- Essential for implementing longest match correctly

## Token Types (common)

| Type | Examples |
|------|---------|
| Keyword | int, while, if, return |
| Identifier | x, myVar, count |
| Operator | +, -, *, =, == |
| Literal | 42, 3.14, "hello", 'c' |
| Delimiter | (, ), {, }, ; , |

## DFA Implementation for Lexer

**Direct (switch-case):**
```c
switch(state) {
  case 0: if(isalpha(c)) state=1; else if(isdigit(c)) state=5; ...
  case 1: if(isalnum(c)) state=1; else { emit(IDENTIFIER); backtrack(); }
}
```

**Table-Driven:**
```c
next_state = table[current_state][input_char];
if (next_state == DEAD) { emit(token); backtrack(); }
else current_state = next_state;
```

## applications

- Every compiler front-end (GCC, Clang, Java compiler)
- Interpreter tokenizers (Python, Ruby)
- Template engines (Jinja, Handlebars)
- Protocol parsers (HTTP header parsing)
- Query parsers (SQL lexer)

## advantages

- O(n) time complexity for input of length n
- Clean separation of lexical and syntactic concerns
- DFA-based implementation is fast and predictable
- Tools like Flex/Lex auto-generate lexers from RE specifications

## limitations

- Cannot handle context-dependent tokens (e.g., `>>` in C++ template closing)
- Whitespace handling can be tricky
- Error messages are low-level ("unexpected character") without context

## misconceptions

- The lexer does NOT check grammatical correctness — that's the parser's job
- Whitespace IS processed by the lexer (then discarded, usually)
- Comments are also consumed by the lexer, not passed to the parser

## related concepts

- [[dfa]] — the underlying computational model
- [[token]] — output unit produced by the lexer
- [[regular-expression]] — defines token patterns
- [[compiler-structure]] — lexer is the first phase
- [[regular-language]] — all token patterns are regular languages
- [[parsing]] — next phase that receives the token stream

## examples

**Tokenizing "x = x + 1;":**
1. 'x' → start identifier state
2. ' ' → end identifier: emit ID("x"), backtrack to whitespace
3. ' ' → whitespace: skip
4. '=' → emit OP("=")
5. ' ' → whitespace: skip
6. 'x' → emit ID("x")
7. ' ' → whitespace: skip
8. '+' → emit OP("+")
9. ' ' → whitespace: skip
10. '1' → start number: emit NUM("1")
11. ';' → emit DELIM(";")

## exam relevance
**high** — DFA design for lexers, longest match principle, dead state handling

## project relevance
Building a lexer is one of the first tasks in any language implementation project. Understanding DFA-based lexers is essential for compiler construction, interpreter development, and any custom DSL.

---
**Scores:** Exam importance: 4/5 | Difficulty: 3/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 4/5

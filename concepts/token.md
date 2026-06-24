---
name: token
description: Smallest meaningful unit of source code output by the lexical analyzer — type + value pairs consumed by the parser
metadata:
  type: user
---

## definition

A **token** is the smallest meaningful unit of source code, as identified by the lexical analyzer. It is a pair of (token_type, token_value):
- **token_type**: category (keyword, identifier, operator, literal, delimiter)
- **token_value**: the actual text (lexeme)

## token types (common)

| Type | Examples | RE pattern |
|------|---------|------------|
| Keyword | int, while, if, return | "int"\|"while"\|"if"\|... |
| Identifier | x, myVar, count123 | [a-zA-Z][a-zA-Z0-9]* |
| Integer Literal | 42, 0, 123 | [0-9]+ |
| Float Literal | 3.14, 1.0e5 | [0-9]+\.[0-9]+ |
| String Literal | "hello" | \"[^\"]*\" |
| Operator | +, -, *, /, ==, = | \+\|-\|...\|== |
| Delimiter | (, ), {, }, ; , | [(){};,] |

## intuition

Tokens are the "words" of a programming language. Just as English grammar works with words (not individual letters), a parser works with tokens (not individual characters). The lexer converts characters to tokens.

## why it exists

Separating tokenization from parsing:
- Simplifies parsing (work with words, not characters)
- Handles whitespace/comments at the lexer level (invisible to parser)
- Each concern addressed by the right tool (DFA for tokens, CFG for syntax)

## lexeme vs token

- **Lexeme**: the actual character sequence ("while", "x", "123")
- **Token**: the classified pair (KEYWORD, "while"), (ID, "x"), (INT, "123")
- Multiple lexemes can have the same token type: "x" and "myVar" both → (ID, ...)

## token stream example

Source: `int x = 5;`
Tokens: `(KEYWORD,"int") (ID,"x") (OP,"=") (INT,"5") (DELIM,";")`

## related concepts

- [[lexical-analyzer]] — produces tokens
- [[regular-expression]] — defines token patterns
- [[dfa]] — recognizes each token type
- [[parsing]] — consumes the token stream
- [[compiler-structure]] — tokens flow from lexer to parser

## exam relevance
**medium** — understanding token types and lexer output

## project relevance
Every interpreter and compiler starts by defining its token set. Clear token definitions make the parser simpler and error messages better.

---
**Scores:** Exam importance: 3/5 | Difficulty: 1/5 | Future usefulness: 4/5 | Project relevance: 5/5 | Interconnectedness: 4/5

---
name: parsing
description: Process of analyzing a token stream to determine grammatical structure — reverse of derivation; top-down or bottom-up
metadata:
  type: user
---

## definition

**Parsing** is the process of analyzing a sequence of tokens to determine its grammatical structure according to a formal grammar. It is the reverse of derivation: given a string, find the production rules that generated it.

The output is typically a **parse tree** or **abstract syntax tree (AST)**.

## intuition

If derivation asks "what strings does this grammar generate?", parsing asks "given this string, does it match the grammar, and how?" Parsing is the computational reverse of the grammar.

## two main approaches

**Top-Down Parsing:**
- Starts from root (start symbol S)
- Expands non-terminals toward leaves (terminals)
- Constructs leftmost derivation
- Examples: Recursive Descent, LL(1)

**Bottom-Up Parsing:**
- Starts from leaves (input tokens)
- Reduces toward root (start symbol S)
- Constructs rightmost derivation in reverse
- Examples: Shift-Reduce, LR(0), LR(1), LALR(1)

## comparison

| Feature | Top-Down | Bottom-Up |
|---------|----------|-----------|
| Direction | S → w | w → S |
| Strategy | Predict then match | Match then reduce |
| Left recursion | Cannot handle | Handles naturally |
| Grammars | LL subset | LR subset (larger) |
| Complexity | Simpler implementation | More powerful |

## parsing in the compiler pipeline

```
Source Code → [Lexer] → Tokens → [Parser] → Parse Tree → [Semantic Analyzer]
```

The parser is the second phase of the compiler front-end. It receives tokens from the lexer and outputs a structured tree representation.

## membership problem

Parsing is related to the **membership problem**: given string w and grammar G, is w ∈ L(G)?

| Language Class | Complexity |
|---------------|------------|
| Regular | O(n) — DFA scan |
| Context-Free (general) | O(n³) — CYK algorithm |
| CFL with LL/LR grammar | O(n) — linear time |
| Context-Sensitive | PSPACE |

## applications

- **Compilers**: parsing source code into AST
- **XML/HTML browsers**: parsing document structure
- **SQL engines**: parsing query structure
- **NLP**: parsing natural language sentences
- **JSON/YAML parsers**: parsing structured data

## related concepts

- [[context-free-grammar]] — the grammar being parsed
- [[parse-tree]] — output of parsing
- [[derivation]] — parsing finds the derivation
- [[recursive-descent-parsing]] — top-down technique
- [[ll1-parsing]] — predictive top-down
- [[shift-reduce-parsing]] — bottom-up technique
- [[lr0-parsing]] — LR(0) bottom-up
- [[lexical-analyzer]] — provides tokens to the parser

## exam relevance
**high** — parsing concepts appear in questions about compiler structure, LL/LR differences

## project relevance
Every language tool needs a parser. Choosing between recursive descent (simple, top-down) and yacc/bison (powerful, bottom-up) is a fundamental architectural decision.

---
**Scores:** Exam importance: 4/5 | Difficulty: 2/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 5/5

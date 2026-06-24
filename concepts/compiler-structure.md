---
name: compiler-structure
description: Compiler pipeline — Lexer→Parser→Semantic Analyzer→Code Gen; formal language theory powers the front-end
metadata:
  type: user
---

## definition

A **compiler** translates source code (high-level language) into target code (machine code or IR). Its structure is divided into phases, each transforming the code into a higher-level representation.

## compiler pipeline

```
Source Code
    ↓
[Lexical Analyzer] → Token Stream    (uses: DFA, regular languages)
    ↓
[Parser]           → Parse Tree      (uses: CFG, LL/LR parsers)
    ↓
[Semantic Analyzer] → Annotated AST  (uses: symbol table, type system)
    ↓
[Intermediate Code Generator] → IR   
    ↓
[Optimizer]        → Optimized IR
    ↓
[Code Generator]   → Target Code
```

## front-end (formal language theory relevant)

**Lexical Analyzer (Lexer):**
- Reads source characters → outputs token stream
- Uses: DFA, regular expressions
- Handles: whitespace, comments, longest match

**Parser:**
- Reads tokens → outputs parse tree / AST
- Uses: CFG, LL(1)/LR(0)/LR(1) parsers
- Detects: syntax errors

**Semantic Analyzer:**
- Reads AST → annotates with types, checks semantic rules
- Uses: symbol tables, type rules (context-sensitive)
- Detects: type errors, undeclared variables, scope violations

## back-end

- Intermediate Code Generation: platform-independent IR (three-address code, SSA)
- Optimization: constant folding, dead code elimination, loop optimization
- Code Generation: target-specific machine code

## formal language theory in compilers

| Phase | Formalism | Theory |
|-------|-----------|--------|
| Lexer | DFA | Regular languages |
| Parser | CFG + LL/LR | Context-free languages |
| Type checker | Symbol tables + rules | Context-sensitive reasoning |

## applications

- C, C++, Java, Python compilers all follow this structure
- Interpreter front-ends (Python, Ruby, Node.js)
- Query compilers (SQL → execution plan)
- Transpilers (TypeScript → JavaScript)

## related concepts

- [[lexical-analyzer]] — first front-end phase
- [[parsing]] — second front-end phase
- [[token]] — lexer → parser interface
- [[context-free-grammar]] — parser's specification
- [[context-sensitive-grammar]] — semantic analysis is context-sensitive
- [[dfa]] — lexer implementation

## exam relevance
**medium** — understanding which phase uses which formal language theory

## project relevance
Fundamental architecture for all language implementation work. Even simple interpreters follow this pipeline. Understanding which formalism handles which phase guides architectural decisions.

---
**Scores:** Exam importance: 3/5 | Difficulty: 2/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 5/5
